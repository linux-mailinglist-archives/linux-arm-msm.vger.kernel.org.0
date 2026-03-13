Return-Path: <linux-arm-msm+bounces-97410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD72BXrns2nZcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:31:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EB709281766
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 581283028B57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B46932AAB2;
	Fri, 13 Mar 2026 10:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pm9lU4B/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvmIO89g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD79C2FDC28
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397879; cv=none; b=qOhxWOcNI/JU+/9u2JUQWqSXy2Tdf60sWfaMiT/OLVTQ8ZsNhxu2HxZfgqUr6kN5hz2YWxoOMugl1mJr/BaomaB+Zp1hg21ESplfzOwrMAtsfJjvf5ROAb2fiVY0tTqGW1k6VHNgwXRJRn9TfV6kgoRAx72MhHVNxeH670b4KGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397879; c=relaxed/simple;
	bh=3WdEvklUIs5+e9zmOZZEnYCJ9wRPHUTlDQWOidgbiB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DhfY7OAM7L4QQKYdjf2mUyTVwDlB+uYpkelfbD9NhG+eDFQhJ4fyfnSVzGyjdZq8jOxReVHf4e25eXxsBTQfxIcNqiogtqKqDx/+bmsvQFAef3p4KzSzEbvCApYWjXCiI69adtPhuEj8mZYmZxXTJLbu5AhfnZRUPDL0k5eZQ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pm9lU4B/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvmIO89g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA7sMZ1749244
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAiEN5O88AauO/e6CBheAfLSiqoyqpVyEHYZIPbWbCs=; b=Pm9lU4B/VRT9okLI
	LGcYwnm9Bk9RGsxP7ZlIZSrJ+LGwMLrIjIc6OQx0iRXjIOuLm/3l2xcNPmNdVcNx
	Avr0XNR1M0EMaJ5ID7YlvMXPWafzV25P68ah7q5howdPUoxSJZp5DNkUc+QhIKw0
	gYTTyG0rWqVKy3Owka8K3GPRan8LoCXQ9F8uJm7yLv1XGLzyI0z4L/qzvYkb09ou
	4RyM+SBG0UgWLd+iZaEyvsuzo7LL9gggRHn3YqXN//QdDr8N0qI4EO9REBY5/Uwi
	nivayRnrZT+zLe3LhEOW/pAhQJNjPru57KId1T/z8VimT9BHbWYtx6I4FvFiTr7V
	KtXG5w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6g2ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:16 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffbef72dcbso274667137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397876; x=1774002676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HAiEN5O88AauO/e6CBheAfLSiqoyqpVyEHYZIPbWbCs=;
        b=OvmIO89gj/lKK9mFnDFyxWOAnUL5c2aHW2iXwFJ5pC1n9rnsI07TvCBBjWCcF9xYYg
         RhLg1XlTajWczmylOKQQ4VS+Uh5EsgDykg+xI/pLQzetN0jKmh3cOOWHn1V/GY31brGT
         SNJ3ozAPTpCr1gnfn0+2u299uQXuSgepWvaMrEa2MsAamJLuxMrlcFV2xUxiamCPIbk8
         m2kBFaqjgQhMcGwQB5XyjasfkQ95vPZjaDHv6JESRB8UqtBUGq3uhhmW1GXwMWXkJnD0
         hyPhZSd5BgzUtschvQZpuupRCMSgYdphH0/ESOLczqi6XfPtdwDaSVWrsfsTa6uHZMJq
         s/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397876; x=1774002676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAiEN5O88AauO/e6CBheAfLSiqoyqpVyEHYZIPbWbCs=;
        b=HnsJW3NWMMtFvL0ZZHGEI6hhPKr8dqQAthJrSDWnJPGbhwpXaAn97c3PUBDK6ltBGg
         B8jQ2SL466QbbVIjFmtSVOAkrvRsXFXhkbcrFCg5IytdXes7bxzxgipg0INGZWcgRJX5
         8kc0j4dtdszD1xQBegAazqmr6sKyHgmt2k2A1P+ixVfTd0ofUNhqqbR039rDER1+sRHn
         aX50OtEi8kTQiBU4H5OxJqtNyHJMPEX+zQLeL18HMiP6bQrel+nLZaktafS1rPX00/oU
         9HeOCfllnWcDvSX2WKG5N1+cSTr42+QvDF0/X7XUmkqo0Hf5dCPBaWQwGGxlnJTW+ySr
         Kbtg==
X-Gm-Message-State: AOJu0Yxm4HEakn4C6lpDJe5APawkV5e7RRshAd5Z6UHzWdYahex6n/JO
	qVJ1JBXymJZPHNYIt7ytcfzY6eCTMkB0QI8sxpQmKFXIUBoJXPBF4WwosI3KVFqZyKjrpGZSeu8
	SDH1U6hCAQD2mvzQYuSLUdNaC/sBaLQwD+PABwPqd32ioTIgwuO8Kn8X0dnpxmSzY0CkM
X-Gm-Gg: ATEYQzwW+wRBBlZMSXC6rwp/3gokzybHXdmaLxf9Cmv9wO8bIKwoCCDxYV2AlApALsT
	Edvwv0QAYpQf4mWrdHCqPUzbtJ3ONKnE7uZ8Bdi+/M+hbFCs2d4gkBUUxLl2RpdkWiIjxZKSAia
	m3dn3MBbxGaOuEnAaqpVLDGcCiEjZJOi0Ib6c8lgmxq4YFlvZrcrRVUiD63ixDDPQeLi3sDJqc4
	PxN1lBAr2KocwUbxi7p1CHjw3088LqbM1btIeWeYOzY7ST43AuTwYHCKq1ayhbJekq5biRc/Lfe
	o3BvJUx/Aa5fkEY9nNwfo6Yu1FKUMTREgaCCxCx1IOApFA8fY3nnmzvfG+6pjqsI0frqsoFulc+
	6q0Nyx3/LT7yYo0D29kPuAZ6PFjqkWJ2l9Xw+p/lo8FxjHvS7DTV6He+qzzjrP6m3AAHgOrDH9z
	m92t8=
X-Received: by 2002:a05:6102:e0f:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-6020e5f6aa2mr554588137.3.1773397875994;
        Fri, 13 Mar 2026 03:31:15 -0700 (PDT)
X-Received: by 2002:a05:6102:e0f:b0:5ff:9d74:9677 with SMTP id ada2fe7eead31-6020e5f6aa2mr554581137.3.1773397875538;
        Fri, 13 Mar 2026 03:31:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cbf9028sm37293566b.19.2026.03.13.03.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:31:14 -0700 (PDT)
Message-ID: <531091c5-92cc-4fa3-b32f-5359ad16f4bc@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 11:31:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/27] drm/msm/adreno: use new helper to set amsbc
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
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-16-b7e8f800176a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-16-b7e8f800176a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfX6FmNOZZfQUhr
 mIw19tAokCORS8kEWOAYPzbIUnv19KAg2OwZcnfNTPbJALSOOPYSTQUok5xuWOZEaSuSDaD1xvj
 Quj4P3g0r4UJV53QZQsO+GdDDi3u9gpDC8fm4sMVDQPW10E+7B0sTIDGm0lxM0SqhZytIbGw9Dz
 U0Uq+Vhe/NfLZrKOW6KsWYBtGk52RMTpJcoCC6xL7wp3wstpYtrsnTsbt6aD3MeuQELcPnIQ4w0
 noQDKSB8pqPGwbGjfBP1Orkk2Zdx7xgw9SPyG85qGwITPjINt+QISDPVEIcTW4b2hPqUC/uejVb
 0c4TOFpmll9RufO8F+qYjRx7Adaxl0TQrA7mb8Q3f4HT5wRJhJim5DVDyj6Wb2iMGGqx568Brn2
 +gk7QSc1qu2XAkH4j8dCrdvIAwpSQpuT79XshQoByoYqI2VHzobS+O3d1Ws2uhgb+VArPNUd6Nm
 SGkJnlWc4wwhJRFf9vA==
X-Proofpoint-GUID: 1WTvqkUjDXEsKqCYeaYVuS4Ah18ggWEN
X-Proofpoint-ORIG-GUID: 1WTvqkUjDXEsKqCYeaYVuS4Ah18ggWEN
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b3e775 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=udGKqQrmj_Eh5FJO_w0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97410-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: EB709281766
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of checking the UBWC version
> directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 7be31de3b525..f6bd906f2ac9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -743,7 +743,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
>  	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
>  	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
> -	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
> +	bool amsbc = qcom_ubwc_enable_amsbc(cfg);
>  	bool min_acc_len_64b;
>  	u8 uavflagprd_inv = 0;
>  	u32 hbb_hi = hbb >> 2;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 680f0b1803a1..63934d21c831 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -275,22 +275,22 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  	u32 hbb, hbb_hi, hbb_lo, mode;
>  	u8 uavflagprd_inv = 2;
>  
> +	if (ubwc_version < UBWC_6_0)
> +		amsbc = qcom_ubwc_enable_amsbc(cfg);

You may have better sources, but it's possible AMSBC is not a thing (or
not configurable) on UBWC6 at all

Konrad

