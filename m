Return-Path: <linux-arm-msm+bounces-106416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK6GGhqb/Gk6RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:00:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EA24E9C2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46D92305DF60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D4D3F7868;
	Thu,  7 May 2026 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eeezDhzx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LeBk2o1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CD015ECCC
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162351; cv=none; b=UM61r2P+DCtRIo6OOMlK+voKgxtgNov4fIqGdjSsUZq1RLwSigP8TZVjIqZgQCeRM66xdDlbEfhjTZ9wsWoTxVMLyaBqgPACMiq78gKfe8ZaAwpB1ATlwfe2zFMoMLdGgf300YSIlJfld3qyUXWhBWIVK7AVv3To6V4+TEPBE9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162351; c=relaxed/simple;
	bh=OfKAieQzUF0nSa7U5d1mG117oufG5DBNbIXC6WzKHg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4WND9+lVQBukpIPwOjPaFNvMY8CL5q6+xm1ovJqKoWxOJzPRDx1Rlhk53JdbbGuG+tsrXkbPgSyLUgvNXabjb7RAly+ANbv0SqKEdlKIWuJiYfZYIHCymGi1zZWKXdM9g9vbxEqDNy+XwxiBd6e+7sh6MNubrz16H6fpzRxff8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eeezDhzx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LeBk2o1l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BaE1m682810
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZwAYWEgtEY3+koYnss2p7DKsYyhBNH1k8tWzi8XpcvU=; b=eeezDhzxPCC+kbIu
	zUGle5mgfatlTdB0rpP4hOI7AJNGooOuWohtcvLelycpfI8eZ3PeaquPZPHec9k2
	CRakWoFVa2DAhVxvVIjQ/Z3qe/j6mSp8G8zitVtQ0pj5v+S9Cw2u0PrKit0OMVTb
	ErV5iCZV8aLWRcmwpXA0Urq3uEaTsl6ASKa4Tr50gxITJS4Odb/4huRSiuRPaaNu
	hId9wOGB7ijlfMIIgOj62xV5ie2lp4OMo+WS1cWbR2P6PHNdpIAgUupdvBpo7uoo
	MvMUGioYXuAnRXTTuPQUDsHTscdAAMFfBI91dowXIS2gemLJejWNNU/NgaRh8ejD
	SG6Hrg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhasuuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:59:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36521936155so908953a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778162349; x=1778767149; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZwAYWEgtEY3+koYnss2p7DKsYyhBNH1k8tWzi8XpcvU=;
        b=LeBk2o1lABgDgGOaWd4GGY0gWJGRMSUL1qHpmQ5vGN6Bb9lqQTa3l6XnRchCYiCaN+
         /V0xSWVgrR68L+U0YRGKhqcRFcCT4483oExd3stgQLmV67Aaj22OFMa5bgsY8T3jy9r/
         1T1dDGygEd/mOqQ4vUrywY3FiFYwnmt9fkiuaclQ80t2+/3MWb1nSyx8ubwXvb36QylH
         aCrU6CaBhOpC15ENIukaihIU2uFEzf6OCJZHSWR5mWI5/+u+G4Im5NC8C6YgGsReBKiE
         QvTgfigQKCg6PUns6SNzylKsLK0SxP8rG45Pr2nLsNF6prBZYb66UiZCoCyTYw3wHttN
         BFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778162349; x=1778767149;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwAYWEgtEY3+koYnss2p7DKsYyhBNH1k8tWzi8XpcvU=;
        b=d9Dz104gZW0LahbUoC97cgbcdTcbMjgZVMVdJn1iQjaQ9zg1OqiCi3EAtKp9pDmpXP
         awivP13UNavD4nNuI0q8Dr1HBxneXuUH9FA/qxeY83K4JekmwYl2tDHKCbnCcyFo5sTn
         pxuNLkivA3ImDnkNDXcjxjRKmxdMx9HhkZU50eFEc7W8X7qZJxO3IoKnOeU5nj2VXb2C
         BjP4uQgA1zKuFkh7KbLTQPKfrN/fEqx61EmCTunyprcVS0vNQObFYn30iPogafTMj9tM
         gqN40jgaJJRCRPMdkxVjzNEBBVigk0huxsrJHk7FLM1h4nAM082y5qQn/FKqoRPuHbGC
         MGSg==
X-Gm-Message-State: AOJu0YxLCCBIbk1xLSFhoYOwpIuQWuNLcnZDZGT91RQN9ddWEoHJSca+
	lAhP81LmkLUBLj4a0n2BcHjAWfWyMH7k/tiIP82wU+F1jQI6DFp0gtmEgKacetjOKaEWohEc5J+
	VleWgbOS3QR9BKaw3Q84yTLzGCmlGzqbHNoxyES/Skvq7LKwTD13rzLG7qwoQMbLoeAnq
X-Gm-Gg: AeBDievcjSrKh0CTinylQD0VbfIEU1RM3IVjBa1qkHMGOfBtCpL9zbwi47YRmXEIIp/
	qV59mZIyOy0fL8CEhV6F8zLDgsBN0yORG6v8YBSYb0jksz0DIHXPA/ZA9Fvi+WGQTbIzOLIbAyL
	D6wWDmY5ucsxeMms5r6Wa37BLQfvEiruqmawlDO1K2/J0YaFdEGl8f5xwoPxk5TC6ySC8HTWL04
	d4S6Yb2eJqR1vNyo9e5r3HmyYOHNBOWu52ll4o0AQpLxUcts3cKXfjSLafAIDIGp/N8cq05XMhT
	SoNxoZIl2iu+7VrS/GYgRAlCRksm0sNFp2XmQvjaFZHk0NItp/Il07aLifrt2SMg9NT+qBYcVYL
	/aM9wI8ltopggKPGFIlBy6p4A+TtSse9BoKE2vJCi1Vj4LONErWkMlts=
X-Received: by 2002:a17:90b:134d:b0:362:bb93:f25e with SMTP id 98e67ed59e1d1-365ac775af2mr8898388a91.23.1778162349161;
        Thu, 07 May 2026 06:59:09 -0700 (PDT)
X-Received: by 2002:a17:90b:134d:b0:362:bb93:f25e with SMTP id 98e67ed59e1d1-365ac775af2mr8898363a91.23.1778162348682;
        Thu, 07 May 2026 06:59:08 -0700 (PDT)
Received: from [10.206.103.12] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b0160dc4sm4827436a91.0.2026.05.07.06.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:59:08 -0700 (PDT)
Message-ID: <961d582a-d65a-417f-b777-01360b30ca86@oss.qualcomm.com>
Date: Thu, 7 May 2026 19:29:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/29] drm/msm/adreno: use new helper to set
 macrotile_mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
 <20260507-ubwc-rework-v4-10-c19593d20c1d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260507-ubwc-rework-v4-10-c19593d20c1d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzOSBTYWx0ZWRfXwpO9nEAdHfqO
 GeLYafabHc0NUlLDEPvnW1f2snA7gWAJQv1t0j7y+x8z1yYy2Je3VyRwzoWhd/D2Lx1tCQk2egZ
 fpJmtO4En9WCmpLTDKN+u27x1W4VMP3Mx5NBzC23riltCSGiodD5x/igJAEHSeZ9rwSyIkfuJ/a
 bVCYZaty5G+pFSnYY1AJdwTY/t+wtBat7nzEnYYN4mr0s8BVZyD9/AWnx07RoTCzyqRUd4JAJKL
 xQ/Ho6QwpSezB2F/N3BxrnQyPR9LR8hOFORmk2alxpMZv84vKmRrz9V6IYbu7HXEu7NYe0XMLeU
 B7LD/O5nDrNHSag7OgGL6+F93nA21TEKYmVLYGChs66AvnFI5dWgF6NewKULoM3FSAY3gRiaHsT
 LePhH3LxWiEJTAUwJvnmM38fSjq2J07GXB06CstZeIWmBBT4znTKwdcUJH+lCtkNd0KIcdHATo1
 SXkz/gCLIZhgFtLugTw==
X-Proofpoint-ORIG-GUID: qlESOYPEv7VAwWsWRjO2DuzglI8_ReyI
X-Proofpoint-GUID: qlESOYPEv7VAwWsWRjO2DuzglI8_ReyI
X-Authority-Analysis: v=2.4 cv=ReWgzVtv c=1 sm=1 tr=0 ts=69fc9aad cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=xedk9TFi4NFs6gOXDsYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070139
X-Rspamd-Queue-Id: D1EA24E9C2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106416-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/2026 6:33 PM, Dmitry Baryshkov wrote:
> Use freshly defined helper instead of using the raw value from the
> database.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 812bb95e8011..76c681614416 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -791,7 +791,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  		  min_acc_len_64b << 23 | hbb_lo << 21);
>  
>  	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
> -		  cfg->macrotile_mode);
> +		  qcom_ubwc_macrotile_mode(cfg));
>  }
>  
>  static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 66f80f2d12f9..bf1572156b0b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -433,7 +433,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>  		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
>  		return 0;
>  	case MSM_PARAM_MACROTILE_MODE:
> -		*value = adreno_gpu->ubwc_config->macrotile_mode;
> +		*value = qcom_ubwc_macrotile_mode(adreno_gpu->ubwc_config);
>  		return 0;
>  	case MSM_PARAM_UCHE_TRAP_BASE:
>  		*value = adreno_gpu->uche_trap_base;
> 

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

