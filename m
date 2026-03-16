Return-Path: <linux-arm-msm+bounces-98032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEQ2McBuuGn5dgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 21:57:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7DE2A0762
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 21:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB25730B1018
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 20:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9E53382FA;
	Mon, 16 Mar 2026 20:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHAcJTnV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SI2Q9Ddc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC635B654
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 20:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773694542; cv=none; b=IK4FzEwOzb7RLuFDoKslTNZ8OABN9Pac9QGw9/XJ/TvkYA6/mD04o7pgqgRQBv/fdNmsCjxU5RK/NTC8+BSGth9zysiPH+p/BBeGKiapFsPazjJaWhnUflmp9PDif8D68vX7SAaU2/JXQEYzCx79IbCpFw4bj9VyHRw73fOaM7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773694542; c=relaxed/simple;
	bh=C+kZu4Yw0goKEbItW66yOGCB2ZUBvnUYDHZ2/fg0u0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hVf53psG198HKHMOfilfCxOyLiRkaQG50HWuOJBd0JsFDIV98BrJBQjDmyw32MQ6oSJhfUFuQYXidH8Ga+T/1irIkjvvOy3kiGuC4hYpLiT8r70+4dJ8V/BD/uQgdHAgebdxJMIPGbRbsXZOpFzJ1UWFIXWJhk8BP9P4hTnNdrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHAcJTnV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SI2Q9Ddc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GG6RlP4022277
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 20:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J8ltMeCUJ0Nsuy3U77T/BrncqvvnFsJLNLRyPi9NiG8=; b=XHAcJTnVlXHdRzQ4
	7IaKVN/vHTyrTCr39y8CPlkBgJRQZ2egZCafDTmXuPNfAvk7lpy0lx2d0rNIlwpj
	gqrZOR0nDJLQCJ2A9kvk/7IGG/PXC4C5jakmXuyD3J/VjzvjHi2OKscokepNfXO0
	hgnkNxIb6y6U+Hpsztan4feSvLgXUcMgPXFN9Fq5rp4D6GXF4iFvKZE4x43ekrVj
	muPEQkkgjrnX/0PxDO250/BtsXqCG5ILYta0NC/J9935EoEx8j5ME7ayxGKR9mvm
	4iLQZnNSZtcIJsnGOjVrExrAO8I3yfDNrvUErQicXwRhCLYvKV/zctOKUpYSGlwX
	rgdlUg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fgwqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 20:55:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aeb90532f6so59369015ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773694536; x=1774299336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8ltMeCUJ0Nsuy3U77T/BrncqvvnFsJLNLRyPi9NiG8=;
        b=SI2Q9Ddc7AqJ9ws2Z0Wv43ppL17UayvF/J+NEKF2tTH9v1eMEKeI6S9gvrSQnL3vLg
         alfU5JReL0Mwj/8UAGFR6OPh07x81K80t2B3XcK7iHCkhK1pB1NGWDu9mp2v1AOQUx1L
         rLyZ666Xmh+CHKBGRSijrMejYnX2G72AhrLqOpc/LANYt+lZegRnMNxAXBROb4CQ8JmG
         OxHmSPhBwSOl5EM/8F6JueCORNGQ5AGAhvBQTZ0aBbpudgWY7WKDYOiJr5MAOjasP0U5
         Oa4kA33H8jtP0rgJYnJcJWc/kTr1dNI2sh/cR+2/UchCk4ywGlKywI+1XDcGioP4wBRW
         UDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773694536; x=1774299336;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8ltMeCUJ0Nsuy3U77T/BrncqvvnFsJLNLRyPi9NiG8=;
        b=fiymOnchARBR64nz/fC+BTorxWX41NsRo61s76rRIq7BTMjepADJnDjH7GNPOO4d/5
         qIcFNiK+LvOyP9jBuI1KQGlmlyrOFOO7xE5oeNZOcoEVv3H0lt6svUgwHZhGFhue7YH+
         obpEMF/+ah98LwcQstGhIEKQjrYmWimC1sZ14NXSV+3TGDnGCW+NQwUr+k3HIRFffyEe
         4X+/SCUpOZmTsntwULCFBpzlYR2jsY/621Z6qJDP2plpNNKi7s7aH3r1LK6eaPHx4fT1
         Z/aPojzlf4bAqbbOBSuk2Z70XMu9TmmhLLRCSQLYUj9+TTqmGCb8x//y3FWmck1ffC5L
         NjdA==
X-Gm-Message-State: AOJu0YyVVk1DUQkKq6CEs5jtwf9fIMbOwb8Cwa7rrjSQEW4O2XYJbfw5
	hunfwF9pBXblmRNT61VFc4M+Axs5BVDIml5rXQCgqhU2qgbjg7lxCGMsPRASLr6Mqfb8f85QJG/
	yDIDA1NmOzV4sRTx9r9dgmDTQdu/tQVpKMYaz5UH/abrfHw8sk8EG4rnY48k7vE1Jj342
X-Gm-Gg: ATEYQzzBO1ajTAQK04Ta11jaT90CkV1IIdd5HBGlKwDHIMPPV6UgUdX95yBQbo2ujo0
	BuG9FvU+KDVx8G25FNeFSD++qtq3au2xurdWp53K638Q6nQgHtOK97y6xb5ckAL5VMrZEbfVFK5
	LKlMzpPSwUWYwB2mMTjEi+2HDHRdKnSyrlroV0MhU4MVavDOYfPzSjwwDlzA2GKfGB5XaSDtunS
	MmT+6nwkeJun5ehR4v7NJPs+XDb0y94O2Z54S5lye/1iLBlc5zmhEcVUsQPHqS84cyTndO1ApGb
	PsY4C8Wqp3bFusCRrQzYgMtkky4E6viRaLJqQhsLjZeXwgW1m/+FND2zKmb9jxQyX37bVPhgBq/
	SDMYhMe0n6s6GW7RYSeQtROetbqnk6NY55u6hanJLu0apNmJ9DrbhORSAmhy7YAJ4hPyKM9DFiO
	QfCuUz
X-Received: by 2002:a17:903:1aa7:b0:2ae:6012:3168 with SMTP id d9443c01a7336-2aecab1e84bmr145221205ad.32.1773694535617;
        Mon, 16 Mar 2026 13:55:35 -0700 (PDT)
X-Received: by 2002:a17:903:1aa7:b0:2ae:6012:3168 with SMTP id d9443c01a7336-2aecab1e84bmr145220905ad.32.1773694535126;
        Mon, 16 Mar 2026 13:55:35 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c27:17c8:7897:b4f6:fc6e:b55? ([2401:4900:1c27:17c8:7897:b4f6:fc6e:b55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee6c6sm119821975ad.48.2026.03.16.13.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 13:55:34 -0700 (PDT)
Message-ID: <9b788a02-2b43-427e-9358-483e8dcff3b3@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 02:25:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix GMEM_BASE for A650
To: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260314-fix-gmem-base-a650-v1-1-3308f60cf74c@pm.me>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260314-fix-gmem-base-a650-v1-1-3308f60cf74c@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b86e48 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=e0mgrY8X18LXsc_zQXUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Zl_BvWBp57WekjDko507Bh-tM1fQF8eT
X-Proofpoint-ORIG-GUID: Zl_BvWBp57WekjDko507Bh-tM1fQF8eT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE3MCBTYWx0ZWRfX4Xv8RvBfl9Fx
 +Tll9VKK7SD4m2Vk72joaG1ZqFNfjsTczJKxcd6rzXV8tEYexlXnR5rVbwvqapB+jNGWQurkKZU
 DQ3YiMZaiF/MFKwBhB8TYZcWXqtSUmJ3JhrOYjx56RqA7U6wPzUOpEV7ttYqIMXEQYeByl0gd6k
 HIUoTpnagLcKGgTE1b9H1kArVzQ2FMPq2wMRD9XA3Q0nxBAUzgGdSnvjnqlB/77ZBAzt8lZk/Qb
 h53s2pVWdPqwI9k/TpIvExfgIkdnAaxgIJzap/46cardkDZ524ETY8uTyR4dXLayYA1cSPgu23i
 KQIorcsnummC8Z3yAgPHm+AfhuoOIL1EfHrtcfYVxsZJxL2tlxVm7n0s//QlvyphNvrWqxQM4zR
 YNfw+dvJ+NErfcdEAwKIvNllgZ8msrwfoAr55jvc6zaG3S5b3RzmjincTdz8KRK2D8BNk3LO4In
 p/hGXLv5ddG6w3wplVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160170
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98032-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,pm.me:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C7DE2A0762
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/2026 9:44 AM, Alexander Koskovich wrote:
> Commit dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8") changed the
> GMEM_BASE check from adreno_is_a650_family() & adreno_is_a740_family()
> to family >= ADRENO_6XX_GEN4.
> 
> This inadvertently excluded A650 (ADRENO_6XX_GEN3), causing it to report
> an incorrect GMEM_BASE which results in severe rendering corruption.
> 
> Update check to also include ADRENO_6XX_GEN3 to fix A650.
> 
> Fixes: dc220915ddb2 ("drm/msm: Fix GMEM_BASE for gen8")
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index d5fe6f6f0dec..0ac3fba5c277 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -376,7 +376,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>  		*value = adreno_gpu->info->gmem;
>  		return 0;
>  	case MSM_PARAM_GMEM_BASE:
> -		if (adreno_gpu->info->family >= ADRENO_6XX_GEN4)
> +		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
>  			*value = 0;
>  		else
>  			*value = 0x100000;
> 
> ---
> base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
> change-id: 20260314-fix-gmem-base-a650-cfd9bfcea425
> 
> Best regards,


