Return-Path: <linux-arm-msm+bounces-101906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNcJAhQF02kYdQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 02:57:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F3A3A0EAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 02:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E7063005782
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 00:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA13F1E0DD8;
	Mon,  6 Apr 2026 00:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejT81dlF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdrKvjp4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773251BD9D0
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 00:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775437072; cv=none; b=dGCGesKG2OtCfc9cEfG1PF0ds+Ch+bPqEfXLeZGJyW5VUN4CBl5lRLmhpgzp3a0MnXokfkNc0a3tzo5Edi/zstbtHilQPZW6K8rwv7ysPh6dffsbTXntMpyGiT+7ehdH5j6ShpgW6o4b/gBglo+yJeQFof5smc8eQGLawRi0mVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775437072; c=relaxed/simple;
	bh=+CFzJYSjgXMgc90KnVDGYWpr3RS4ovCzPOIc6R5/1to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UB04kN2kj15b8cpqGJEEAmX+4LrE+mBiZWICrT/VT9pI3CquY12Fyak8xehoX67qXjcjhpc3l/6UwNfp0Eo182gX9yHZ46JFk2OfKi6DCb4cdmUsTcg9BAUp6BEjfQ40xxentTHs3EnP2yaq0hIbUODrMC8mVUDoJN55jH4PRys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejT81dlF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdrKvjp4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Hi0uS3543138
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 00:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Le5cutdB4jQDvLheS8cinLj2
	ayr3F6NZHLdqFQ79kdE=; b=ejT81dlFEK8QRtHAsIYwDgMlrJL9bAIHQcB7Ir4o
	pQ1FVB6WHQALLMRQT4tYzUE3+Ro/s2+zQ1EURNmUajvp9LsO1G3LPpx+zprYzJ1P
	Cear5dgmVz0SJmD+68cwbsE+g55nJ+5KpoWxsjJeMs6mXUiBPwghuoJTIT23cheH
	vbRu3CkQa8Y6DfXjNdLydHkgRdD9Lpu4xEUcGl6y2OAEnsTYLzKY3VkIW/kC6lSU
	6mS+L1bjPvGAPeTRiG9mYIJZ+/jfc5jdXIVBAfoQGhXgIKtCpan9JNn+u4BxuwPr
	lDnqcX+pdrqSE8ONUKzTiKhQcruMfz5cTNg7y4yHq7Musg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv1bdxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 00:57:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso113457761cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 17:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775437070; x=1776041870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Le5cutdB4jQDvLheS8cinLj2ayr3F6NZHLdqFQ79kdE=;
        b=JdrKvjp4PuduihIYbVn72x5m0HKExUWk2SacpPSn5SQg6JhTDxQCKIfAsnqYTLjVwK
         ETTxLQp/OmaQF5+obgADhBqAvqtEUf19wvOuaoWjHD+8v5UdZrqrNUO5Wyk9Q7ZHKeq7
         FJAG3Fcu+c3oN5rzxZfkS4XifnSGySgxnTp9P1UFWqUuUuQdkM7VVL9ESEYEvZ3QwtTI
         21leg0PvOGTCouNgXBP09y6kZ8VVpnUTlfKAsDRKiKPNXzhwD+91jLr8LM7tE7WWOCak
         HmPC7VR2A5BAUA6r8I5ZdJYFgBO2cqmIzM3cCH4y7S2JFm2j7WmS75g1w1bAFrscELC/
         fX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775437070; x=1776041870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Le5cutdB4jQDvLheS8cinLj2ayr3F6NZHLdqFQ79kdE=;
        b=C5uQ9BDF/0NXlkfOCDBU1vyVBsGHKLfZKNqcy/Gx/usg2zuYXVJXXEAHTNomA6fzhy
         LTRlUru62XTUDLoQueF4x3u+bcyK+uq+3qfCxGs36Vf/fSbwE4Ip6/6J5/de8N6pvqf5
         cachVK9E0sQDzhjNpVxc0xc1mfL52jm8nT0S999nzSEuEGr8zw03VgIddJwTjoihEYvJ
         y6D+jhACTTg7hhMFzmr97w1ZrwkQQbmV1vQtWX0Wh0gL3mLqJMKlfVPIF1ymTLn70cNy
         SpWUYHjg+vkEi4alHLeddAbGROwhlscUitrRHbec9CqF4vllmnoJrIj20uMVmNj4QwgP
         UdfA==
X-Forwarded-Encrypted: i=1; AJvYcCXFgLzUJTXHgUtWdcs0QJOtRDawIjuUif6S/5IAbp9+wxamSW3pX2jhdPlxaFHkmS/WekGhYFqCozDTg22C@vger.kernel.org
X-Gm-Message-State: AOJu0YxJVlF8eGXGwfPR2+vH5q+u/8s5TZR6W6DiNjoSV9ifC/YAfrfy
	3/l8V9U+JLh+3Z+10qAX71NQnMBU1+Gc+CnZzaO9jkhZO9zzUwQi3ozGBcUHJwOmXYgRIDPgXP3
	66YAUu7NvEnU8ihBQY00R4gukqDp2RJkSXv1CzgDo3oES3+INVV3SG7ySEm48IT8cCMvk
X-Gm-Gg: AeBDiesUCCXeajDskM1XoxM4bI2zZ+3NkCMkg0YAjhp4TmnIheg8njRmKWnKdoZN+Tr
	+egbZeYNO4TbG33XILRGVCOCG0ViFPG6/RwB84yMkXldoMWPsLPvyCPXhFNZmWVbSadjcg1vBRq
	zylErpx/sdcd+F2ycP0UD6xCv3dYySSnrCpEKNEoJAhitjyQYOCfR/Pn+IGYdAmmMHlhOwA2olb
	DLYHXzus1kTt7Me3ER8c0a9egAMJ43hmO4Wsn/z4/HFSt8m6LYgFMZ2RwZJ516wez1vzNALOMuA
	yBzVaRpkDbVy4cwd+xoCVnhe/v5/AuHcybZmochIWKUMF86LMZCrfusbPO2alLlnNP9abiMD3cD
	kroVZCfJAwnhU1MUlitvaMpwFW5+Te2L9GiMptxBp74XbMPKGLpBLVBrL1Rt+DuEuaw1dOsx7dP
	bNMgGlTghp+7suX2wApOIYlCbMIV5l1xid6NI=
X-Received: by 2002:ac8:7d88:0:b0:50d:6acb:42db with SMTP id d75a77b69052e-50d6acb4a89mr144364291cf.23.1775437069787;
        Sun, 05 Apr 2026 17:57:49 -0700 (PDT)
X-Received: by 2002:ac8:7d88:0:b0:50d:6acb:42db with SMTP id d75a77b69052e-50d6acb4a89mr144364131cf.23.1775437069312;
        Sun, 05 Apr 2026 17:57:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ccc8e0sm3095275e87.58.2026.04.05.17.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 17:57:46 -0700 (PDT)
Date: Mon, 6 Apr 2026 03:57:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Remove unused macro definitions
Message-ID: <uit6oystisslmbr2xo5yeofzdfcxicobiuvwnyymd26rfmhynr@ec3jjmjay74a>
References: <20260406-eliza_pinctrl-v1-1-52fbf0ebc56c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-eliza_pinctrl-v1-1-52fbf0ebc56c@oss.qualcomm.com>
X-Proofpoint-GUID: 44FoNxNf5EloWtCm947yKC4CKRkQMXoE
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d3050e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Dz0YDFsVkC082G2yLhEA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 44FoNxNf5EloWtCm947yKC4CKRkQMXoE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAwNyBTYWx0ZWRfX+o6aZoy/EV0O
 RXjz6cea7ZX6m61G0dUYXltPzn5X+edxaBl1TMoHB1di0KU8MIOMP5/76Lv3I/ueJKGkwy3AOk7
 zOYSXyeneHhm/MCmdUkAHjWvpgLlAeh4flBuUmCW72IlUbkiqKtpWXZVmgn3U5ZC47eerqwU1h8
 rNnPDTZg/a8aUP0YRGx81hxjsKUlsuUzEXPxU00V/FMvmYoXrwSnYs+a2S0EZHJubvmJezloZcY
 UCD/Xh61ZEJRQ+Cv2oXT6USYlPuvIQ3TwSfj9+c3GGT2a7XKty6fkcxiiv+cPyfDP7U0hLbUWyr
 qu2XQ6Ff8BzCL1WwC4qjjS1HlTpzHHFoGi1WUGm/c6QEHyrsWNHzNkIqashR9Hm92PXtTd82RfT
 8Bt8O5Rwd+T4gwmSAekm4qTt8uhPbcuLOD+4rRSZrhed1AHNjAoEWmbeB8WcmWXK98d6HqGYX0S
 +yJPgdBZ5TXSz3QKnEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_08,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060007
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101906-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 53F3A3A0EAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 12:04:04AM +0530, Maulik Shah wrote:
> Remove SDC_QDSD_PINGROUP, QUP_I3C and UFS_RESET macros as on some
> platforms they are unused.
> 
> No functional impact.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-eliza.c   | 25 -------------------------
>  drivers/pinctrl/qcom/pinctrl-qcm2290.c | 24 ------------------------
>  drivers/pinctrl/qcom/pinctrl-qdu1000.c |  6 ------
>  drivers/pinctrl/qcom/pinctrl-sm4450.c  |  7 -------
>  4 files changed, 62 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

