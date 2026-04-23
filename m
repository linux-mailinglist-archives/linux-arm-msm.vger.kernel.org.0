Return-Path: <linux-arm-msm+bounces-104299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDzJNy8D6mk/rQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:31:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBEE4514F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5431E302AC0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071473E958A;
	Thu, 23 Apr 2026 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXgZ6aeM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VrJsgtcz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF520B80B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776943865; cv=none; b=et3INogQ/7FV2/cwUtsNGTtZbCw10aR8cqw/N7t1XFt+jArktVnNt7Sradekb5ecuPSky6mpIAfL5IbWO7VhaDcAKp7tItdsk6N0vsB6nw4hgqU4IN50qBoeVq9VXECpQv2+LKt1M+CiaY8Rnr+gFt4eSXS7ddV2szRj2oO1X2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776943865; c=relaxed/simple;
	bh=kNPwiG0o2fObAHYTHHpzsClucyGBTSOmux8OqwF7iiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLZZXaGmq0zfTDxQLAqBfLmXvFwVJJe2c6HC2DMRvU/kSArz3O1TzLf4t+TKHvqQBYBcT/HV9qIFrBvJlDoq8k3MMmkETsp/8BKjnKWHqE0ZjOkkoh3NNN9ALlbmaxc1Dhm8Za2TLZic0kOIG+ednxU8XCIvHidNwKGU8Mns4+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXgZ6aeM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrJsgtcz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uCDn3295002
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BskI/S5B/mV8Mgc2HuCbjXXs
	1Kjfb8aCIP/6GQAsIPc=; b=MXgZ6aeMg4FJX452Bjl78JKokZ6rT8CBJgUQwXBY
	B2ESLBkVY057Yjzu7QE91w16x9GbFhJYood9oR4Lqv2f62Ch4uo/lwqIX8lhIH+D
	Eb8JbPdlfTPRf63hEutaQP9OVxrMYhZ4F4thEBPjP46a3LaBmciRc9yH/RmXCjgZ
	i3y30IrQuli9fuOENMkJuTHc0j8PdY8g8pqMcGFpmt6h3N33aAFSAk8pOY4YPdCa
	5nRh+pWfO5ueCX66EvkKkdhVO+aOqEaOEOIrU3sU1dlSmLChjbBh6dYPs//apBDg
	Lh2uO6XNX6dDts4ZLZgGS3NLyLiOVPAfTl6hMYw2pSiLdg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282ugtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:31:02 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-610503b660bso3826584137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776943862; x=1777548662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BskI/S5B/mV8Mgc2HuCbjXXs1Kjfb8aCIP/6GQAsIPc=;
        b=VrJsgtczfoqtOqhBIrWxGPu2KEbKwfSc1WWh+o80qwV9lLL98pMobhA8ra3i3d9kmi
         M+hnXm4S7wPC3xGCI3bgVm0BlpiQrS4vrseiZ6okrrM4NSqDtOr8qIxLhaNME8YourcO
         6xIaTry1G78sKe2rZ9gfqETp2oqZrzAbgUSKx+NZmgqxIv2MeLHLonsa6jCW+pNwHAHG
         uG+IvA6swtLsVsiGcXrAEE64uWfuxtGQeyGveSx+cfQW9AxDkFNq7cuB0WeM8S+TOJ5D
         m6jJWTUZ5kqXj+AvmlqqGaqB2D+fP/zuf8Yj30RAv+NST0wjPAAbGsyXMlObn1MbgMjT
         QHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776943862; x=1777548662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BskI/S5B/mV8Mgc2HuCbjXXs1Kjfb8aCIP/6GQAsIPc=;
        b=BbMpUyXLSOtUI5GYqzNtdy8M7buvl/T1fLj5Vbm+dIhrFJ31W+2PeWaOrNlyTqKBcv
         4BpIrT7lGnQcscJRtiXRSHOFunEYK6MNR04C91qnXk9lhbx9w/PB4gRZQhw5cIXP8KHJ
         6cYwWDkUplkWuGAqVqFKgG0tFQPIXlwki7IgfNlPK0QdLPwAqvHKpc++8xSNGVrp6xG0
         ooLL/13z96OPROsPvenPvNVpBF9TLf1ck74xbwSmuuU7qhzsWODJCPtWlCeziYZnvv2l
         eaDJhKNvSYEh8x2RFDVnJ0cmvlHUEp/0to595gey0jxvtywENPd4Eb+pVDmwbBAoxAYg
         4zYg==
X-Forwarded-Encrypted: i=1; AFNElJ+0IxiWpcbMzaZY6+jXN1oWkTWqfVZRJa+OaCo2Q+alFh5uJKxnlJX4Ax3K0NRVTnlA73OoLufqhgYrHoAY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzup8n785xNdCnciD/qeNzX5ewYBiMqtLOnjPJ1hl0z4p8nQFa/
	BPAf9l8BL42rOF5tgIyQ0qu9et/3oWOV63ZCzL1KhGqp83SrK2ae5hzJimxSvatD0dagKQo2u2o
	8xj5dC4IADFozas+oOIfWtZZOFYJXuI2LO3M0j6mwM8ik5/FlwcbQCrKTCPEiSbRdZm/cWBiD+N
	jU
X-Gm-Gg: AeBDievCpInbLbnXNgUAKYc39OpJmOp2Ohl2uiEaqcsMZe814ta6UTgL8sHojghi8jb
	jjze97jOpLQd2GqN1RdyJ/kyfttFuX8JS6J6xS3wuIH7wmvSj2vPG49N/TcZBuFP1HucTVYMwNO
	kqy7LuAVkTRTovQdaUFVIyg0X5a+nQ38DsjEJwpAibigDrMguW1xsSLeB5/AfspVqV0LN0+YZft
	IRb960wx6pKVookCp2cwE9bBzB6a2p8KrKz2kKmWhCSwsDh1gb3zJAEUGi2XrJSmd21BeZ2bPeX
	g47dad40beYGZNGPmNYYnwz7wgO4CN+GOlV8NsBvtYoUg4p2q5FoUMXbC1sGq+TGg/AN1kcZki1
	pg8CaiUHFWEbhWwZsY0yoMWyIFG7u8xNr4Pacjv9wZjg6vG8yGdNAdC6gnWQDbN+IbP0kmM5HwG
	qNr3vUGizDrwitgrE+f3EbHIulesSWNRc6pmvrke330tF/YA==
X-Received: by 2002:a05:6102:4a81:b0:60c:3f9d:6a0d with SMTP id ada2fe7eead31-616f56a5579mr10400770137.8.1776943861540;
        Thu, 23 Apr 2026 04:31:01 -0700 (PDT)
X-Received: by 2002:a05:6102:4a81:b0:60c:3f9d:6a0d with SMTP id ada2fe7eead31-616f56a5579mr10400704137.8.1776943861017;
        Thu, 23 Apr 2026 04:31:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc333sm5221504e87.24.2026.04.23.04.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:31:00 -0700 (PDT)
Date: Thu, 23 Apr 2026 14:30:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH] pinctrl: qcom: Fix GPIO to PDC wake irq map for qcs615
Message-ID: <z5bkivkfvr642qpjujpqzwpozpqeqhs3vsqcpjfbkgipr7csko@fs4hal7fvqnl>
References: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExNCBTYWx0ZWRfX3+l+fPD4AeGD
 yydNik2UclIrc6kVlb2zusFFxUJ0hTDz6eWSBqNjhDyFFSzID1SAXoCTZ6yD9XMqnauZvKnr5Zz
 6dfI/yPYD/MTUjVun8R4xeZTVA4gBnPQiaPNIReH3wHvst8QJRTmFStep5//DeLy44zkNn9DOmJ
 d2LhUJbwMi9oae8mOD1mSTrsVvKOkmfEywuvLa1TtMtm7YnxkS3nZ4G4vJRTQchc/5YA2P208l+
 qExgImPpTZ+E6z+WlBCKQXga5PCFMonU02QHTF+Xc7VvyykL7JOlQoRPTA1djmdW4UqDO2I+8DG
 gt9TzFEMezj+b76BqsWFdNxkiCOieTBTZocbpEwd+c8LDy8CUEDzoEf0jUiPd96qHJHMEFXPW1a
 qkrgSeP8YMpclvBQRAipU0Ys0aO/3vJ+d5cc8AC0o2s4EXtpquLNUMAH8hjpyi9jBUCVl2AJhiO
 FsZDJNq1IcLsEEAdQfA==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69ea02f7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=xojN2YTdWNvqnkyeGbgA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: FhnXlEq31cZIPxcXIoYKdMxzsU8loXed
X-Proofpoint-ORIG-GUID: FhnXlEq31cZIPxcXIoYKdMxzsU8loXed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230114
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104299-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8DBEE4514F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 04:55:24PM +0530, Navya Malempati wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> PDC interrupts 122-125 were meant for ibi_i3c wakeup but qcs615 do not

Is this something which changed between SM6150 and QCS615?

> support i3c. GPIOs 39,51,88 and 89 are also connected to different PDC
> pin to support non-ibi wakeup. Update the wakeirq map to reflect same.

Should there be two commits instead of one?

> Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

-- 
With best wishes
Dmitry

