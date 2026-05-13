Return-Path: <linux-arm-msm+bounces-107340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKskDTWHBGr8LAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:14:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3660A534CCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 16:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC77630A55B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F172E1EF4;
	Wed, 13 May 2026 14:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHZJVhkn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QHbqQuFt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C232D876B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680883; cv=none; b=nK4OtDCaBvtKdwRHhy9+YZPlnSHOXiZVETfo7QbvLm4eSYtOIEzRP0PGiPduZmErABe6aTU/jFpnTfh+Mr1fFqDrAJMgy70oTkwszXtLTYcuNSgnGj2RUd/eDxGaqzDoJiQdXEDvT/Q23djieOpimQr+vweK0VmjaEWLORSpiAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680883; c=relaxed/simple;
	bh=RR1P+F/lK7MWgQTUPi8VJdox4tXBmbdLcyaJFRdb5Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQpokUkw/8aCtB//6FypFq54NC8r6TWGSa6ydpoGKxuqVSkzNhTO/cmcCLwg7Qp07m0dcEYAdWxnKD8+kGHT7PFz1sm3jcmOZSD1a4AqaaQFcjGd4QxyEzk0VCtykzi5UppdQ3nizW+WZ3u7fYaeOpkgNXka/W9su0DN1GlZAWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHZJVhkn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QHbqQuFt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8won34159621
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W1d5o2XJOwpJ38A2n5YuZxfC
	k7Q1SB4UhnBShn0r8oQ=; b=PHZJVhknZYvlYbLQnPjjS6OE1Frx5EwaUWO4uqA7
	/Q9N2hO7Y1mHMqAAp3jbbx1HzlbjSO4dh8kgb7gOleBP8CTxMZoDM7S/kEp2ZeGc
	Zn2FABxXRGcmTCvIBUlfhPj7RstokeuEaETrNxXNPe/dU3y7VsVfmK5Ke6G2ezRO
	1MfAMHJbsbHxHrGOKfiEh//H+VRcQlY0tsbqyoMGEas16O8DbgZ1blO+O1gbB4fe
	K9R6eNcBQIHrwWMBXPFPMCpytgD4wC9F8vCDzdKVm3mOi6RSpwfEkktjBcjxQHhO
	zjX+ZCdFCrJhX3uBK6sz3JnXWWJgnMu35p18jXj+MLEJBw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91s4pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:01:21 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6961e8fa90bso12739327eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778680881; x=1779285681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W1d5o2XJOwpJ38A2n5YuZxfCk7Q1SB4UhnBShn0r8oQ=;
        b=QHbqQuFthvFVuyF5kSp1/7BpqpNI23olNIC4WTEEKpKbmkTIqcfJe1iA6/GcuPJSKX
         OhfXk+EzF1y+Ci+elQraP8wREoTk6wFveiyR81UNV2lZvDTbqn9VwMBa5IE/etRsjRX7
         3Y4DI2dniN5WDc5nk63Y2OYZ+3xus4q2vk9gh1kF6GG1fQQn3RxVRpfr6LDLDCBlical
         ZEfBY7xb4qafmTFw9ZtlbmpL/DtRwnr/NGyC/MbLLeubiq10uqlzc14kqKVoG/s31Omk
         2J5Iah9zB1SyK+OOclcwScLj6mbibHQkFlLs09bxcGFxtxYkf3eWzHbYrxXH/2f+jKLf
         XJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680881; x=1779285681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1d5o2XJOwpJ38A2n5YuZxfCk7Q1SB4UhnBShn0r8oQ=;
        b=LH++alf30Wh0FcWgYEI7JzF4bfYKw7OX/+8IiBoatJPKPctP/w+ZP9+qPQlbZvpE0n
         e3sLRM+WwadwfZVM8Gcq6rDnzebiVRWmkZblMGco3K92KApVN9LKn3pgwJnEjB8Xh9oo
         lTHaLv1udmQf2Ao61ZGkNq3hr3nvl1Ot4ffSsMtfYskVgefGUriLQj08pjXi7J4HrC0G
         9y7NUTn4spz5sVdoe3Cd8fP401BvX9k6elT9b50nh5fNXbsO/ThRMyUYVPhfAwooy+Ch
         QbpWKmbbhEHituFsUvWGrHhStQw7uEVscS+fgs5Ql7j2UJxlt9jq9Lpp9DsPDFCtGIKO
         1lxg==
X-Forwarded-Encrypted: i=1; AFNElJ88p4g9qlX+E7gjlwDgOjcnwlrKFF89QY0hKIk6QEZy9PjXuLsF8oc2pPAzgOyDnslk953/1zcK+AwFjqDj@vger.kernel.org
X-Gm-Message-State: AOJu0YwMVyVoeB0EWoY0BiEPrxegujncOj9o+yPmpM+0/Ge7RBH+0XXE
	2c0rygYp81jzOKzYNFJtpxMDXRfDCrcYwRXNYMzIL9v4W6ZruGNpAEUgBEDsIHQxwyHuKpzj/XP
	BlHAqpNtM9PCIun4+5kBxswKrk+qPznVLOuzLEi5uPyHJ8GSkMTufxrgDPSE6tGkt89zV
X-Gm-Gg: Acq92OGfaWx3WroHva0Wtu9rbCu0+I0bJsGiQR91vCLsFPpAt3tqY/FYw+eCgB19vJ6
	XbPz/bHWS3WdllDtizv8T33b/0pySFWs4YqA2HgQRjrKZGH6OuxPJoKe5SvwsDo5Zlzk4qPLcNA
	eWzK1/mUSo9OsRCRPljcFD3Yw8z2kWUIjDAKuVAY+gvtUILvAib5gsB+2Djfpb1sRmSPef8U/W8
	sFBhiueDShkzvxY+2p+PumIFRGBh9pinB9YxPaECy1zCBJX4iUizTVom7fx37uPMdnVv9hPSadK
	kXa40PIbvuBzPAKcEtyV1KVddDh/+29MXnavRWMjKTPI1wNasNew93K6sY94n2upBxVkIsNskAD
	2DqUbKT6uJiJn4gUhOIIOcV0jfoGar1yVCV3JqPaLyEJuAN0ESMREJMBmtzAEfuzc3L5nTAMX4j
	grLEZQrYu8CtLWO4iYsNoAoYVOLW+p3Czx52s=
X-Received: by 2002:a05:6820:4d09:b0:67e:160c:36c3 with SMTP id 006d021491bc7-69b7ab72c62mr1431529eaf.48.1778680880795;
        Wed, 13 May 2026 07:01:20 -0700 (PDT)
X-Received: by 2002:a05:6820:4d09:b0:67e:160c:36c3 with SMTP id 006d021491bc7-69b7ab72c62mr1431475eaf.48.1778680880179;
        Wed, 13 May 2026 07:01:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f610f5b6sm43728381fa.29.2026.05.13.07.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:01:18 -0700 (PDT)
Date: Wed, 13 May 2026 17:01:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add support for Display Clock Controller
 on Shikra
Message-ID: <n4wgnno2td3xmdsgwadvdtvr4ncitzio3ufufg5bp7wnga4ouw@mj76764e3uus>
References: <20260513-shikra-dispcc-gpucc-v1-0-5fd673146ab2@oss.qualcomm.com>
 <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-shikra-dispcc-gpucc-v1-3-5fd673146ab2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3b0J8WhXzB-ojOLTh5a2wZ7OAAFWawRg
X-Proofpoint-GUID: 3b0J8WhXzB-ojOLTh5a2wZ7OAAFWawRg
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a048431 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qXpo7wsCot1G_wR8kq4A:9 a=CjuIK1q_8ugA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NCBTYWx0ZWRfX8nQKmmFsu4RA
 /CBWCaUFpae+mwO82/c+jxxTmquQ0YBPza68M5TjEOaCCWFnHnxs12Fs9XNe0KpdJHspZrSePo+
 C38enTgD4dENI0iGjI5QuVDmIBSYUB+xTVpTNvBUqf+LQeQvff98qo8IZumM+oBO+kBqZezLK1D
 h6mV8HWAYqTKyI3NwKAQycNpGL39AA2oYAF9Mra3nGP5peGr716fYb6WXGwqerq8uY2dDu0Vxl9
 8h37MTco3xlPnP9clzi2q3pjfuaIFNO5KnXh1njCst0oFboG4J0o1Dzp5TF58JXj3wUossu7IuF
 y2XbX0L9/yQkwtaUoxmJEoR1zmMwpTKTXEbF9bk/1eMOfrMB/YF2nJJqb5DrcSXUAwrPYuH0z4O
 Gqm29kDIdAQxHBheKYikCbFV0/rRiluqleJLJ4IwsbiBsCUj4olqeYiWy305u7ZVMVrvZ8Ue4ks
 2v+oCGHb5+l1CUi6tAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130144
X-Rspamd-Queue-Id: 3660A534CCC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107340-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 07:10:38PM +0530, Imran Shaik wrote:
> Add a driver for the Display clock controller on Qualcomm Shikra SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |  10 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/dispcc-shikra.c | 565 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 576 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

