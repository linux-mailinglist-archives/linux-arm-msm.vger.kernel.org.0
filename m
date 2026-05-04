Return-Path: <linux-arm-msm+bounces-105787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DdsDYzX+GlR2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:29:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2094C1EF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A972E3008606
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 17:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9853E3D82;
	Mon,  4 May 2026 17:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0m6I0iZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Olt+MOSV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB583D9029
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 17:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777915782; cv=none; b=rMHfiwSsbakd7jv5yJly+kDQd+XIT2fBtBbRrBTMGNJ4NxZkmkhH7XK6bbaanQ4glBa52IXq2zA3B1LRacVeqs0lRdPUKAOXD3uaXT1uZEaZfSKWNHN+VjRdVSAK3h6h3B7kutbL85TBCl2ltAj239jUPzNb/EfBNhFcfJYjl1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777915782; c=relaxed/simple;
	bh=DMO69ChqeMjn7wT3lp7C1udlZb1y+LjNGXesuPfyFnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wof8oxwoUkCL/pG70QZGvySTlkfXj672G2IMXuQYwdvzu6J9mrsviqkjK2kuYIttzU2+auKZ1SpYU/AF+yMxJmb+k/sTKpjX3mGuRBpyXBg2WC7J4n3H1qr1Vth9AXBH24RT+FhgVL3KuQ/HJWZW4KIoDhkmYM+sG+F+LV1IQzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0m6I0iZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Olt+MOSV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4FcZ1152047
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 17:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8vrzN0EZBS3JsAd56BlOu6cWXe+dY0W8UO2MhNNBvAo=; b=W0m6I0iZUk7PdP7O
	m6zdUWCb2dD+gu/7Aauk0Tu6L+QeuDr2HLO7vrpndfNef5i1MvNib3wRoCGNriXN
	rz2XzobFE/qoPtjLJGnOfrntVw1O4Zgw40Yx1jgMne4Uclavb6VzlTNtoQ6Pqvn7
	6U4bYb900g1gAst5nb3Uo5KLxc3jwkddnHgdyb/dBUh8PXpOVm8WSDZKR9yteYGc
	Id0zDKO2I8cI+pfljJEYUX/W2XHgSlAUrJme/SIbE11P9jFBsexppJPYkMmI/xeX
	JtZ5K0mG1PPO1c2M9uAcvN8BKIF+18m52dfmvca+AQ+3wcK044H5+UUu6G67DiTo
	pit9NQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscy9fjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 17:29:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50da31af14cso112418061cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777915779; x=1778520579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8vrzN0EZBS3JsAd56BlOu6cWXe+dY0W8UO2MhNNBvAo=;
        b=Olt+MOSVAQ0WSUKvDvpwVOxwI2o81cPmDBCfgYyO3fWKxNDFBR75pOVZpu9KXLLz1f
         SSkpfCjI7fqLa9b0PVzh1E3x6iE6a0Vbbo9nOsWaYEIUnrl3YE8pV5UQhxZYTuLn2xHA
         XxKgw4IHcFLcasu2Lqmpb/tOVHpynm0c2fm2Ti2DAf9q0H4IcekezhG00Jn5wsllDGgC
         si8AFev1RPALahyLC8k1JaIaX/tyWR7V+wNUydZbnz5zewF7R1uX0B7EDkLsDcSmLC9F
         X5FFnMocjl4Kqh0JSRPopgUT51wESmMXOcnsOXgt+wGgeCqYrvr//7gKHCqcXYRKn2l0
         Mc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777915779; x=1778520579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vrzN0EZBS3JsAd56BlOu6cWXe+dY0W8UO2MhNNBvAo=;
        b=afcfJNQGZTFHgvGmgZyOUcUvCCh9PSOdMccCBaelQf9gRWuF6HdfKUV2FKky7hR4Pa
         058O48lvcixLeAoyX9lQr+8wdVi12q+N4z6dxPaBytNoVYwJ9ZPGHa7iGZ5ehMG9n2qx
         9xmWBvDhHjsNw1ckT3HzLJo/X4ln41Ap9mops2Rp+uOpWmYTy0/Yjp42VGkwHce+JvU8
         tE4JkCpXNQsY0Mh6JP9aLTSakuTvKyNdgXBGw11+hIgn7ZcO4emKHBaCa0/dmSEiE1Aa
         ht3wSeHszHr2w/j5jtaU7so3ygesP8vfBp3a/JDizP/XUZxmLUc1wM7/ZTXLSVvZ+Y2b
         Xpog==
X-Forwarded-Encrypted: i=1; AFNElJ+ZSJang/O150ZAeq61ZrsrcUObam2pkTnk7ARuWJ7W4LNxoIK53oOqlO2RH+K5QinKeggkOELKAyqK0Xti@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQNinn4Bx0JCnoJWyo/W5xAi2lJyOdayoCbHImRKKfTAVR083
	oWc8i/+Hl3Hl/6FD6M8/mI21NAf1IRMaV/BAGtkrsvfAm4zaoz7BS2dWF9qImTakE20SXbsK/xI
	WDTKuHVYxkIxSoiEgyvogYKMosTKSWxn6ViWJv/nWWaLVarxe9IsrjOsUygwT0h2yrzSh
X-Gm-Gg: AeBDies0g93FruhCMdUY8QEpVLsG4V/rKBxF1hRdbcMZRtlt3Xe4xTWaSrpmcWyhs7Z
	ZGT8pFdp8S7U2voSqUfVDddqHjeVEcZZ8oDZr7r4iedw4zMZ1qI4xQUUIJ9sFw0QBLaCjmBFUvg
	7fLcaiq+OPFZPoDqS+bQUT2CbxVI6kvgJdx4z7VbEvF5eFYubPMPhsOC7XkLNSOzLFufI4KUDnL
	fmvN1ZqQHcmlaGLZQhNglql2waY/ty165ZjuoWPtxF6ggiyWOH3VMiMPy1SoCy/cCqyNeRKydrP
	yNCkgzTKgdO5DxaCumm+RthCyBbmL/VTNyCIW+jYqNEQJvDVJPygwIy6LbH7ApT/RJTUZmX8OxB
	b8k+bDXReDt0syc2hJnAresbGcx898sY1etivZNx9eFkl91JBddwIoc3Th4P6Vy/csp7XPr73ij
	F4GZb2tDpWGPwrlmrq
X-Received: by 2002:a05:622a:420e:b0:50d:60a4:47a7 with SMTP id d75a77b69052e-5104bdefb3amr159736491cf.4.1777915779158;
        Mon, 04 May 2026 10:29:39 -0700 (PDT)
X-Received: by 2002:a05:622a:420e:b0:50d:60a4:47a7 with SMTP id d75a77b69052e-5104bdefb3amr159735901cf.4.1777915778650;
        Mon, 04 May 2026 10:29:38 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d? ([2a05:6e02:1041:c10:3d0:c2e8:9f02:5c9d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aab44sm28524158f8f.29.2026.05.04.10.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 10:29:37 -0700 (PDT)
Message-ID: <bfecf67e-faf2-4889-b29a-2d4d5cd0d1a6@oss.qualcomm.com>
Date: Mon, 4 May 2026 19:29:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260430054422.2461150-1-priyansh.jain@oss.qualcomm.com>
 <20260430054422.2461150-2-priyansh.jain@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260430054422.2461150-2-priyansh.jain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1OSBTYWx0ZWRfX5HtIGjuZCKov
 ERouSd43328MleNCBsNPq41+u1GzFKPc03qSZtNH1+02GCoM22tGQu4E7TZlkzB/A9gMv0btBx7
 ukH5c4PpIN8n4A4wBsO5o+NZMYN5IMSjQwLeKx9vZalGkHnma8gkL7ZZDeizkXz1RfzNRVVTdBB
 by2E4ckqAr/6/kmkWl2wCPAtHOpZzmvocS/zkO+ZexVVHkRNmTih1OFlrxcJk/EpV1JOgeJ3mX1
 lBgYRc29d6OBQXNDFTb33JP+BZclRJ6Znc2e4JgfcbpvMKfO4M8uuhtsd/Tv+2DOXIt5ChIK8MX
 nz20p/sxJYp/uOxzdAATMCpN+w9wdpvQ/rlr87VhzGOXtmHPOD15OK85d0DO50NQkEu2YJuW46s
 6NTIJaevIDg5H9X6mSVOqOHNsw9RVK9nG181flpvH8nuVYAMWDXqmBnr65JkuAWO5IIW2iVkH6U
 4xNJFLsJI0bCrgxWc1Q==
X-Proofpoint-ORIG-GUID: HMEqsiagmBDosEyVFJkpptaUXWlyeXup
X-Proofpoint-GUID: HMEqsiagmBDosEyVFJkpptaUXWlyeXup
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f8d784 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mdpCuoKmtEbuW9dXLVkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040159
X-Rspamd-Queue-Id: 1A2094C1EF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-105787-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/30/26 07:44, Priyansh Jain wrote:
> The existing TSENS temperature read logic polls the valid bit and then
> reads the temperature register. When temperature reads are triggered
> at very short intervals, this can race with hardware updates and allow
> the temperature field to be read while it is still being updated.
> 
> In this case, the valid bit may already be asserted even though the
> temperature value is transitioning, resulting in an incorrect reading.
> 
> Hardware programming guidelines require the temperature value and the
> valid bit to be sampled atomically in the same read transaction. A
> reading is considered valid only if the valid bit is observed set in
> that same sample.
> 
> The guidelines further specify that software should attempt the
> temperature read up to three times to account for transient update
> windows. If none of the attempts observe a valid sample, a stable
> fallback value must be returned: if the first and second samples match,
> the second value is returned; otherwise, if the second and third
> samples match, the third value is returned.
> 
> Update the TSENS sensor read logic to implement atomic sampling along
> with the recommended retry-and-compare fallback behavior. This removes
> the race window and ensures deterministic temperature values in
> accordance with hardware requirements.
> 
> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
> ---
>   drivers/thermal/qcom/tsens-v1.c |   6 +-
>   drivers/thermal/qcom/tsens-v2.c |   6 +-
>   drivers/thermal/qcom/tsens.c    | 118 +++++++++++++++++++++-----------
>   drivers/thermal/qcom/tsens.h    |  22 ++----
>   4 files changed, 91 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-v1.c b/drivers/thermal/qcom/tsens-v1.c
> index faa5d00788ca..2e0a01348c48 100644
> --- a/drivers/thermal/qcom/tsens-v1.c
> +++ b/drivers/thermal/qcom/tsens-v1.c
> @@ -77,6 +77,9 @@ static struct tsens_features tsens_v1_feat = {
>   	.max_sensors	= 11,
>   	.trip_min_temp	= -40000,
>   	.trip_max_temp	= 120000,
> +	.valid_bit = BIT(14),
> +	.last_temp_mask = 0x3FF,

This is GENMASK(9, 0)

> +	.last_temp_resolution = 9,

Please comply with the SSOT, in the init function compute the mask with:

	->last_temp_mask = GENMASK(9, 0);

and remove the initialization here

>   };
>   
>   static struct tsens_features tsens_v1_no_rpm_feat = {
> @@ -132,8 +135,7 @@ static const struct reg_field tsens_v1_regfields[MAX_REGFIELDS] = {
>   	/* NO CRITICAL INTERRUPT SUPPORT on v1 */
>   
>   	/* Sn_STATUS */
> -	REG_FIELD_FOR_EACH_SENSOR11(LAST_TEMP,    TM_Sn_STATUS_OFF,  0,  9),
> -	REG_FIELD_FOR_EACH_SENSOR11(VALID,        TM_Sn_STATUS_OFF, 14, 14),
> +	REG_FIELD_FOR_EACH_SENSOR11(LAST_TEMP,    TM_Sn_STATUS_OFF,  0,  14),
>   	/* xxx_STATUS bits: 1 == threshold violated */
>   	REG_FIELD_FOR_EACH_SENSOR11(MIN_STATUS,   TM_Sn_STATUS_OFF, 10, 10),
>   	REG_FIELD_FOR_EACH_SENSOR11(LOWER_STATUS, TM_Sn_STATUS_OFF, 11, 11),
> diff --git a/drivers/thermal/qcom/tsens-v2.c b/drivers/thermal/qcom/tsens-v2.c
> index 8d9698ea3ec4..814147735ba5 100644
> --- a/drivers/thermal/qcom/tsens-v2.c
> +++ b/drivers/thermal/qcom/tsens-v2.c
> @@ -56,6 +56,9 @@ static struct tsens_features tsens_v2_feat = {
>   	.max_sensors	= 16,
>   	.trip_min_temp	= -40000,
>   	.trip_max_temp	= 120000,
> +	.valid_bit = BIT(21),
> +	.last_temp_mask = 0xFFF,
> +	.last_temp_resolution = 11,

Ditto

>   };
>   
>   static struct tsens_features ipq8074_feat = {
> @@ -125,8 +128,7 @@ static const struct reg_field tsens_v2_regfields[MAX_REGFIELDS] = {
>   	[WDOG_BARK_COUNT]  = REG_FIELD(TM_WDOG_LOG_OFF,             0,  7),
>   
>   	/* Sn_STATUS */
> -	REG_FIELD_FOR_EACH_SENSOR16(LAST_TEMP,       TM_Sn_STATUS_OFF,  0,  11),
> -	REG_FIELD_FOR_EACH_SENSOR16(VALID,           TM_Sn_STATUS_OFF, 21,  21),
> +	REG_FIELD_FOR_EACH_SENSOR16(LAST_TEMP,       TM_Sn_STATUS_OFF,  0,  21),
>   	/* xxx_STATUS bits: 1 == threshold violated */
>   	REG_FIELD_FOR_EACH_SENSOR16(MIN_STATUS,      TM_Sn_STATUS_OFF, 16,  16),
>   	REG_FIELD_FOR_EACH_SENSOR16(LOWER_STATUS,    TM_Sn_STATUS_OFF, 17,  17),
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index a2422ebee816..15392a17ef41 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -315,10 +315,66 @@ static inline int code_to_degc(u32 adc_code, const struct tsens_sensor *s)
>   	return degc;
>   }
>   
> +static inline enum tsens_ver tsens_version(struct tsens_priv *priv)
> +{
> +	return priv->feat->ver_major;
> +}

I agree putting accessor functions is a good practice but here as it 
results in duplicating the function, the benefit is discutable.

> +/**
> + * tsens_read_temp - To read temperature from hw in deciCelsius.
> + * @s:     Pointer to sensor struct
> + * @field: Index into regmap_field array pointing to temperature data
> + * @temp: temperature in deciCelsius to be read from hardware
> + *
> + * This function handles temperature returned in ADC code or deciCelsius
> + * depending on IP version.
> + *
> + * Return: 0 on success, a negative errno will be returned in error cases
> + */
> +static int tsens_read_temp(const struct tsens_sensor *s, int field, int *temp)
> +{
> +	struct tsens_priv *priv = s->priv;
> +	int temp_val[3] = {0};
> +	unsigned int status = 0;
> +	int ret = 0, i;
> +	int max_retry = 3;

Please avoid litterals. Add a macro for max number of retries. As the 
value 3 is not an arbitrary value but a documented value, add a small 
comment to tell it is a hardware requirement.

> +	ret = regmap_field_read(priv->rf[field], &status);
> +	if (ret)
> +		return ret;
> +
> +	/* VER_0 doesn't have VALID bit */
> +	if (tsens_version(priv) == VER_0) {
> +		*temp = status;
> +		return ret;
> +	}

Please use a callback for v0 and v1. Set it at probe time, so the 
version does not have to be checked at very read.

> +	for (i = 0; i < max_retry; i++) {
> +		temp_val[i] = status & priv->feat->last_temp_mask;
> +		if (() {
> +			*temp = temp_val[i];
> +			return ret;
> +		}
> +		ret = regmap_field_read(priv->rf[field], &status);
> +		if (ret)
> +			return ret;

It looks like more than max_retry is happening. One time before the 
loop, then 3 times in loop. So 4 times in total.

> +	}
> +
> +	if (temp_val[0] == temp_val[1])
> +		*temp = temp_val[1];
> +	else if (temp_val[1] == temp_val[2])
> +		*temp = temp_val[2];
> +	else
> +		return -EAGAIN;

We have a, b and c.

if a == b, then return b
else b == c, then return c
else return -EAGAIN

It is like we have two consecutives successful read. IMO that could be 
simplified to:

int prev = INTMAX;

/*
  * An explanation ...
  */

for (i = 0; i < max_retry; i++) {

	int value, valid;

	ret = regmap_field_read(priv->rf[field], &status);
	if (ret)
		return ret;

	value = FIELD_GET(priv->feat->last_temp_mask, status);

	valid = FIELD_GET(priv->feat->valid_bit, status)
	if (valid)
		return value;

	if (value == prev)
		return value;

	prev = value;
}

return -EAGAIN;

(Not tested)




