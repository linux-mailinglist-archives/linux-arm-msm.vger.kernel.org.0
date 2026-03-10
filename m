Return-Path: <linux-arm-msm+bounces-96639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGXFNeEcsGkngAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:30:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A98F25052D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16EB531F2B1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69F83C73E4;
	Tue, 10 Mar 2026 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y6Yp1auY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AimCdGMu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4743E92BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146874; cv=none; b=Y4hs4rGF05DhWR3c81DDkuyVDYdGDcIX3pTDb4XxH5INQXPDDMTjQXuhiVegOMZqL9C25F205Nl4PGAZuYu0Vtd/onqTf8QUpyBLLRbC7BzoSJeGMxdT/n4EJvI37wzvIS8khI7T/t4oOip86769SH7onqyxHpwdlmzbKW6yO74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146874; c=relaxed/simple;
	bh=7B8FkO17fw/pcE0VMVvPgjua2aMjVXiSPKKVedjwZow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z1II0S1BL5jD+QlljlvCheFR5fQrcKHfyYL3fpHh5J2n2LN8SsaWoOFWyypmrRUw8NhzPhqNvDPXPJTMYHxdF2c4Af6WdhUFLRByL+Hj8vDLNgdk4/7f1W7AKQXMi2Sd1V9Z6GqtUA4Qh0MOuTaumJwQKLVTF6BJ/IWa5+2GOMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y6Yp1auY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AimCdGMu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACav3C3418255
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z45dGMHmm6Um7jMOSOtmnPjC6jEC5ymM/dDKxJXitKQ=; b=Y6Yp1auYLKi5kyyO
	xenxYjtUDKt7Vg5SUHkI/UFqqitdSYxYAYXP3G1u3DyvrgtT0hCd3CAHIbWyLjSN
	vy4YiJZaB2u20rJQglgzibrE7CIx1sRp8KPO2dWzNhZWlT22czRMqbkPAwbCzvg0
	4bu7bAvuxpToOS/gvz/hqy39+0e5gTPVcsQq8OkB/ZQ1Fz+vKb5B2zwKK/8tfw9V
	6az+6T6ibEz1fAaPHgt78INHW+3YocCBpHamiA25YTXHpCzqc9rXXGB/oKfSZBdo
	8JvHQ3gERZsCcrgwk0bwa3Ujx1rmxmHAhDR3t2v5XGchS/2CGRdy5i9bBUl1EDGd
	jjoADA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja289mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 12:47:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb50dfd542so870842985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773146872; x=1773751672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z45dGMHmm6Um7jMOSOtmnPjC6jEC5ymM/dDKxJXitKQ=;
        b=AimCdGMumJViPKRATM3ja1Brb7QG84QQOtzJBPqhkV+w0/weLtN8t/FBwDOX50KBnc
         uR3Ry8LSFqfg21Mk8SdR9++t1jU5VXzz+GaQPslHzRkvPuXOyrpWQOLKXLJEtWNFS24D
         Im5Z/EvEuOnIi5vp+FTpP+JPGmNsxrcgfWTu20Lz2uXPcmyOIuG+4CrFSeTmOpZT1uVG
         5mXdJ3hLJElVIT0IyMwdBvXXZYJrm2z6srxeG96JbAXeomi8ciRpt6atgVjZqwe7dH2R
         WbAR084ZNJ0QV1jWKtupyH68O6fzzJbhq9psr0ZwuRoaVnK6xB3CTfqOsZ4U61vxQIEP
         CPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146872; x=1773751672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z45dGMHmm6Um7jMOSOtmnPjC6jEC5ymM/dDKxJXitKQ=;
        b=bP8DJBS/94XVwbtboYcYy0MAwZbWwwFuK5dyNWABlgVkyduDnI4w90tZkX5Fzn/XdP
         e7tgwFOSlx6THrcyEubbSkseXRVgPPGzdqRUA+/0wyduuLXP3Cmx7edCMZPYiSNaw2LQ
         yjFhadaeVN0nRwxY1w3HK53Y+NtP6FDDxEJN1aBBNsReM4sgSuwEtJW+fBwu46Z8Cllq
         t189DXGrbSbApxD4WQ6D3us10cmm04mcS1/1g+/h/SyhKUbaovSNUwiQbFU3MoMMEUp0
         wjv5p3xPmAtBvAJPEkzYrnMmmrAKlPLOrkOxaWZcuY7EqWuwk8SkLjJtHlNtEHV8xqAd
         hSwA==
X-Gm-Message-State: AOJu0YytPe3Zpzz32r72ky0L7a+d8Da/UbxjIrZC5tUFzrDbEtFhU/Me
	0MwzaXXuAcOYN18uWAjKuQYw9mj0ofQjSDxA0yP42WTBK+Xi8ibeyE87BI2mPyFS8FynCmzTGT8
	TDC7kC6SdubosF+jukPLB7VA9dVUpq/j+Z7XsRjJovuZdxdbpKGeRaJG+t2wRqu8JSZG6RfZKCe
	UN
X-Gm-Gg: ATEYQzxi0BVUwzZabPW4ZHNBn4uyvuhQ2aHiH9/dtIe4TUjhIkdvK0thiDI9k2hfk7B
	ekMBiU9AJ/btbbNb2I1CcL2Q4QMAUYExH5+0QxF6StGCXWBkA6Iqh3Zn8WUo+JoCR+rac4QG2Sk
	CEL6JeId0aipKgs/nk3aJOm5LRKIwczJC+8Nm0TDEMY8aeSyId/GBChTczu/LskgeEMHhYbo60c
	ApLD+aKaA9cXoDLcO9FCm4fNu1VImvEW7Zwl5iqfUbkbDLQRlA6S6sOgdy1An4uNeiIV5keKZMm
	m4uE3NPGTw1625ROfDQ+kHGqrV6R1bUPunvFafx4ClGfBqVmA2kAmJE+9shMaWQWhee2RL5PfQq
	wBqnyuDEZxUFErUu7QS9VrHRPk0Kdht2eLNrl0FR2hGvfwfKd6mrc+hobyCWnT+yMDJRyRAfvFb
	wQMAQ=
X-Received: by 2002:a05:620a:4151:b0:8cd:86fa:36a0 with SMTP id af79cd13be357-8cd86fa37b1mr741119885a.1.1773146871699;
        Tue, 10 Mar 2026 05:47:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4151:b0:8cd:86fa:36a0 with SMTP id af79cd13be357-8cd86fa37b1mr741117385a.1.1773146871301;
        Tue, 10 Mar 2026 05:47:51 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b94dad4271esm405879466b.32.2026.03.10.05.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:47:50 -0700 (PDT)
Message-ID: <d0fdeed2-3cfe-4ce2-813b-abb34e78bb05@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:47:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/24] drm/msm/mdss: correct UBWC programming sequences
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
 <20260306-ubwc-rework-v1-1-9cfdff12f2bb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-1-9cfdff12f2bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b012f8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vSU7WzfE01f-x17di4gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: VJELAg44wrK_6loHGP19yIB7IVlH_u5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExMiBTYWx0ZWRfX1hjTb1+IVSgr
 gxYgvemqrYLpaeGmPq/RR+MP0nXwLx3bfDvde4AhVsC1dep91ApWaETKQ80EHqAw+szx8yPc7JG
 E6bSlWH4V0h2YLYUD6tl5R/uDIoUFYK5xjktUk4QqssmT7bGWuQU3XQM8NXQMNp48HHfKhcQBi6
 8Yq2bZpbuWOvp8qWv8Eco4imiB9Z1lqwtw8QZSr7kJAh7/NAwE0crZJ+CkzS9Wgrr42Pd3wWPAv
 yyD+e2GU/Srv3cRgaj9J10sBT2UYEEMdY1mwlAVggOLeKxp8hs/iD3yoU6OplgGkOM23G0oE+cJ
 e5m+RW7iI//fk5bgtrPHB/VvSBVlJeysUL/fKspk2XC16p3tjL/5iTkDjZaOJM8MtVlwUbm6Vh0
 co9BtwQCqJdPpIXWra+TucvfZSmNyUY3X2jm9RygtgreD4Tmz0NkUCQ9xhmcPyXJin2SrOjSgoV
 EZx8X9sUCRbvXUuobyA==
X-Proofpoint-GUID: VJELAg44wrK_6loHGP19yIB7IVlH_u5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100112
X-Rspamd-Queue-Id: 7A98F25052D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96639-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/26 5:47 PM, Dmitry Baryshkov wrote:
> The UBWC registers in the MDSS region are not dependent on the UBWC
> version (it is an invalid assumption we inherited from the vendor SDE
> driver). Instead they are dependent only on the MDSS core revision.
> 
> Rework UBWC programming to follow MDSS revision and to use required (aka
> encoder) UBWC version instead of the ubwc_dec_version.
> 
> Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 120 ++++++++++++++++-------------------------
>  1 file changed, 45 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 9047e8d9ee89..9f81f43283b9 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -166,27 +166,27 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
>  	return 0;
>  }
>  
> -static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
> +static void msm_mdss_setup_ubwc_v4(struct msm_mdss *msm_mdss)
>  {
>  	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> -	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |

The field takes bit0/1/2 for *enabling* level 1/2/3 swizzling - is this
intended?

[...]

> +static void msm_mdss_setup_ubwc_v5(struct msm_mdss *msm_mdss)
>  {
>  	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> -	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
> +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
>  		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
>  
> +	if (data->ubwc_bank_spread)
> +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;


8250 is ubwcv4 (in our catalog anyway) and definitely has a bit for this

Konrad

