Return-Path: <linux-arm-msm+bounces-97874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFVmLPHLt2kRVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:22:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBD1296E27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDF68300383B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C83251795;
	Mon, 16 Mar 2026 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqQRjCvc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/QucZyq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FA01E1DF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652972; cv=none; b=GguRfydF8run60hUq6j2CqGQxYQ74JMDNSKz/FoKD7TFKSFAzgt86yuk29RxxZq5Zz+lSIBaKl4Eskc1zKGy3hUCFjm2mae1gezAEjxloJPBYGR4NBUghMOBxi1Gs65669b7VcGuHt3Hq+LdkRDlOC5XHkOH9FXIjyjB++uyEoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652972; c=relaxed/simple;
	bh=651N/ZWGUh7WndF2u0M+V+HCDJzdkexxeYE4ppvFvgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFhrKYIUmWnWJUR3hDh/wYkoNRX+0z0qOAX0Q41yyhSvAO61PKMGjwCk4tIyV8PTUCyfIP0XlI1hSS+1tL3qE/4+NB6KtXMXCjpLA+WqmxCZVpTOFTWpK8qkxBC+46s/P7aC0KIfDOcyqtTVjYQEZnORF38b8Vct4ErStTaSCls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqQRjCvc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f/QucZyq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G655xK2584078
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtWXTGagT/GGBueURbq9/nje29CFuwHmLEoPSvQmhuc=; b=RqQRjCvc0rawgpoE
	OTePQPjeAADE3fgu7fHeo9i2Fay09uLE6T86LJPMaB3aQQIeOMxodoe70h1PA/VA
	YDTofbhkFE5OEMMPQeakL0fWNsMZThM+PK/9clgZ1U2sQ/PV6az9bbnODqE2GbFG
	SiCFU2dUJQfuYyAt+Jk4E/9jYE2nyCrrTufFYMLseooGM7g/RmucvIdexnDP91dj
	5IBMoqUJGyGrHyHyaVPiLtWqokxJgv0iJsR6vrTHVJYwlwdMHSliO546bpDTz/5P
	hYemKC5wdCdV74NcvUGMy2Ys6zfPDu4+3paH2XXvu1af7A/6fm9C12Z8OdZeo2z0
	dWdp3Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0eccwun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:22:50 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c49436edeso10844906d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773652969; x=1774257769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UtWXTGagT/GGBueURbq9/nje29CFuwHmLEoPSvQmhuc=;
        b=f/QucZyqBgoKmxfhHiZ/CczwvvLHIqhmijJmeSLXW6c9QKk/pApTmlY83kF5IoM8nW
         E/w94Xoy7EDFWzm3QOVzU04LY4zVOYUuDyhnnloGO7XWSV3iIHI+02Ypjf5TGMrGwJvP
         zLE5AORp6aDhmuUqgKeacb1cd3GVFpw7ztbboQ+ydQKNtT6fB/z1sZFT0aNp/M4/GwpK
         m/egJbR2BjNpqnBrRNrL6p/mo4YM6vdd9N7znLMBlX2MKydbrvsknq36HVCyrQMR8RKa
         t8ZOidVkK5ZTDKWWhy0W/gKmEp6PcaTBnKvM/z7Yfu6oXkSDVOwQfniId69xLBiCnTNY
         MUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652969; x=1774257769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtWXTGagT/GGBueURbq9/nje29CFuwHmLEoPSvQmhuc=;
        b=ki6lZpXWAEgo/BGKwNlvFK+ijmwJkosq4oxVnSnotgQTd+OrC8yG1mmRygmxqFFUKD
         LGFIXZVNuIk6DA5POYk8yU6DONZVclqoQ9ys6oI/ZxMNj5kW5ZeFsNoZLz7v0fTPpqDY
         q2jGrrMPhE3mMfTLoCaZSAlRimqkEuCz1JeIzo9QCvqB01wOoZxY0Cv4oTq6KyEhsjXe
         kmKZ+8Sx4lYJY26Ebk5xYcBDnTOb/pqqdTMojFVyClHq1WTe3oiGfWKMZf375D+sThyr
         SYQZriXCwr8lZNBma9hEMXn75rjnChoG3q18g5MwPDMXZf0j2dvPTrVU1A8SusKLotyc
         4Spg==
X-Gm-Message-State: AOJu0Yw7pYWai4zkpvXshtSkbS3/3PBCEomy6hmwN05H742nXYE4OVJ/
	V/Qyj00gFtCkuZfJVAgszxA7T+RdIaOkpRnvs3hIs9PNCJOHOT59/tuxEvuvppNpl89oHdavuw5
	YbmxcVE8lOK9V7gzh2gfGuS7Bzu+BZhZ2gUA44JBlQmbDWay8DAe+7e2sAp622gO8a5UP
X-Gm-Gg: ATEYQzwiqvM6bgp8zc63KHc4wptl/Q35ch6NplVTToXlWTGN2DjHnRdM+TyDkbHSRpQ
	q2Pz30OxnyfMJH12LXq31MDOH2PdP2v4dMOAS/hx1kfTUCiCLGFqT7v3sji9KaEubE6SncsA4X9
	QTOdS6zoKK42XsObXA+m29vC8fqH41dxsQdLxGFwIH0QMy2bmEtgl1VMiKRG1e1qchQebZmkFkW
	KW9SfdaPJsJpruIQwBkJScbHiOlidO26UTWsiLYr9K2FNBGqropk/jBRpUOCSzSlCYnxjdu4eRx
	1+Z4VTzw3K1svvH4fnahS4+IWQPPEL+uxpdj2hGc7v1EsgluxTQGxJ2NSZLjPHdwde1klJXpzmJ
	4A1A7SMf5atecB8a8J48JSFA+dGiYsYxDe707DZsSjCJKDnzoSwsGRUFZZYUSkE6S73pS35HbKw
	Q6pbs=
X-Received: by 2002:a0c:f105:0:b0:89a:7d14:66d4 with SMTP id 6a1803df08f44-89a8203defbmr112828816d6.7.1773652969167;
        Mon, 16 Mar 2026 02:22:49 -0700 (PDT)
X-Received: by 2002:a0c:f105:0:b0:89a:7d14:66d4 with SMTP id 6a1803df08f44-89a8203defbmr112828636d6.7.1773652968804;
        Mon, 16 Mar 2026 02:22:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cc220basm525813566b.28.2026.03.16.02.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:22:47 -0700 (PDT)
Message-ID: <2938aa01-cc1b-4dd8-a4af-45ff8354a061@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 10:22:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix GMEM_BASE for A650
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260314-fix-gmem-base-a650-v1-1-3308f60cf74c@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314-fix-gmem-base-a650-v1-1-3308f60cf74c@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vGsoRH_dLIPKB63qN4DTj65d9mIdqWtz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MSBTYWx0ZWRfXxVohkqUcVfoU
 GEWB1WPJ65y+1sVwPzj+rt6SFEmm4D8nLeiOv8OYWV2OxVzusvt7EjvU0AccOZGIITDBhR7KzW0
 VWtN/+Fuvns3wvdnreQ3nxCwl6Jc0/YIdxHJSIgfJ0MR/Drc46KpWPXN3/Q/ZRbhv8HHfS2NJOW
 qFzgXFSnlQigplpBxnITsUlB03IYWAOy0Yr+4s5KhL+EDFiyaa7kpoG7m8+VHbOKpZEUjL27n8R
 xETGkztzvAMxZgnvqMpJqbDajotmF7IdAGfHaEq+JCVHrLmmrHcTBiCYI6QxWPRKajv+uj5+1+P
 8wBjRq568MOmq999/EEEGcmcGAlCCmzxyDAzkM1Ti1ugHYIk1GAOW0pK6ERBiXT6tctxJEF2Wcw
 8e+GSjaHijeYnibdWWteerGzPxNYPY7ibyddeWaYoysAx6VXRqv+gHkKPBorUJq3R1inXSOGjeK
 tWV3SDxpXHP4+lPou9w==
X-Proofpoint-ORIG-GUID: vGsoRH_dLIPKB63qN4DTj65d9mIdqWtz
X-Authority-Analysis: v=2.4 cv=BqqQAIX5 c=1 sm=1 tr=0 ts=69b7cbea cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e0mgrY8X18LXsc_zQXUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97874-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[pm.me,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,pm.me:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFBD1296E27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 5:14 AM, Alexander Koskovich wrote:
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

Hm, that commit also changed the value for A730 - Akhil/Rob, should
that be changed back?

Konrad

> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
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

