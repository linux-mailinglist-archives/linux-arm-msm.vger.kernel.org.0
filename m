Return-Path: <linux-arm-msm+bounces-101283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDxQLYDozGk/XwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:42:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47155377E07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 11:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D63EE314AA4D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 09:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EA63CC9F5;
	Wed,  1 Apr 2026 09:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mktgjZKc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSOi10az"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECA3370D47
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 09:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035965; cv=none; b=SXOubT646BMocHaX6Dyl1tlF2gi8ojsLWqPVT/3D4iewAEbyJotli3VgMNoNnB7ZHkw2rpFgNZPWnyKAHZCF+8HcoyylLYfUvPJvwVI41Mw41o/16kzSNwsFKQXbg1QuFhI2yh8SxMmbMLGQK+SWaJfTmK3JXcGR9+1SyRWP14E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035965; c=relaxed/simple;
	bh=z+EDexiLErPSTkuOyOJaYzNKm8uMdyFNbjxzeJ/ozbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LlolYb2hX0343ZzA9GDKQ2/dUyIgGWNtAFBVjUMKP6LamSc/7G1161yVJjTIk0PJnp27Q3GPu9HxoV+/acRklIVIIB1rzKZj8OvEksctWVc7fr9n2JV+dZB0rFdFNkg2Qc5z6nVIEKlOIV7X8AK9EbE9XRjVVtL8lr4kQZ/i7LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mktgjZKc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSOi10az; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318kNIY1459094
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 09:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8DZG0eROtWmud3ZdD4EmRKx3UCJmwtzdRxZUWrs7KTg=; b=mktgjZKc5bsnghQB
	ydBx3gbKjuZl2Vc6GW1EQtrSd7z2FBd5HsZucM+iz8rkJeKapfrvbD1JoCRvwBcQ
	A1OatOYwGhrHve47u8wfK0oywq0GbN40neBP5MZII6Tlqdiyq5CrAYSQPUml0hPh
	HKe8HKggE775HlyGcrhvI8tkJj0KvL3RnmVw9cZ22Ry6gxEbfEZBVnsoWJR2oMya
	xKd9aYzS9op0Q91wVMov8v+WJkIQh0Ag2AhZR5Dqs/vupg1t4QiHHLFE6ICSHEu4
	rvaTC2rKwOx4vWVxdYZw3JDDatLCWAMiJQ1a7Py8XpFIgzOFpZGZPify0HB02+ub
	/lBB6Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg1dp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:32:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89f3e41fc17so18158426d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 02:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035962; x=1775640762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8DZG0eROtWmud3ZdD4EmRKx3UCJmwtzdRxZUWrs7KTg=;
        b=hSOi10azBvej0dS69srM7y4sx90FOe77VdygDcl4MB+7NFrHl2PztABorOvDctXswL
         M2XEHqfwtPcRagLKtgVVlQDQPG+uYJi5G5a67JsXYhrpU+kQYfjsf+aBXrvfcBs7re1H
         Pd56iqLb7JUw8e61I454GEbEJSIcgDg0yAPptoQwQ7OgkcTmS5fwcYD698xPMnVY4Jy3
         pB039A9afmLq8GT4HdNMgJvDwHeLpFEpvxWo9fm5QnGnYPqm3Pug0IEdQhLpfFrEQ/wI
         ht3NXGqNusRvGbtpOHJQqjz0tpW+nCXbk5UPDe6VFyJzMmiB+asIcTHjhmwzSA9QFr5L
         crmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035962; x=1775640762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DZG0eROtWmud3ZdD4EmRKx3UCJmwtzdRxZUWrs7KTg=;
        b=YLwlKwCHz/JWZXg1vR26U7h/hEcrwa2dlXvsbrt7AEoY4EkzA0j4sOoHU0AnIrbyem
         uWnyrii7V7IVb3REWfaDn2FaXBZkErPaofXac9MkRt4msK/EEmA4DypkvMqibzB1kp8J
         4sIGkDsBwh1Hm6801zXmCx1y2MtCR7kjL/+Rf9YWRC1PeZoLDaO5/NYMjr9Jr91zL3z6
         CYie71tmKWuzzH4JX3iSrYEySjdqR5zsWRlcIegLR9ByPqhr5UDDz4YxeexJFNZi/JEb
         KzC02NucjMxL5HMd9qtUwPknVVNZh+AAYeYIIoj5l6nCmF0bRTs24cdgYfp3SQCEFOXx
         gLZA==
X-Forwarded-Encrypted: i=1; AJvYcCXo+8hfVkgBd3Yoz1L/ZaXQ0U6Qpogj0pUz2Q57lV/b+1nRNVJzMJO2BleSRuG5RobrRDCrIN3iY4o2/Ki3@vger.kernel.org
X-Gm-Message-State: AOJu0YzbLjNRJUZ9/utOxtgBTK//ppfJNYnzC9BElJRRy52CQ/74NeNT
	SZo4DfTbAxVZ4C0Hd1JPAzMuxjR+JSR9r0BHx08IyQruTpl4phEg99WVLDq2179qv0obHvSkDBE
	vHvoGAfg1hF9M2cuXRVmVpor4+ed6TULSDsrzbXjhxeEY/DUcAWvNDLq+9oXVnqJRmo+k
X-Gm-Gg: ATEYQzwfAo9TZNzVSpDAcopXJwXPCwGTYO4Mn9cG7ZaYagqm+7JIghmA0OWxi0cMSD3
	eDwrtHxZD/agLlv1/pRdnIHh+glvLtgPTMuaP0y3EVScL9niC8/0iK26vfVRftq4aoATNwmyhoz
	ze0EeyND6Bf8/4ehgNtqStfOdle044cNvebyVm8kgoRfnkIc2RrfOYM6ehYbx7bKTtdJWTXh/el
	yf/lsrigvmMF+u951ah277D0qrRDIjLPVXlyfAEQuhV/ACWObMNhaw4HlVg1mVCh9pRbTDOCgTJ
	5tZ17bkVoEEaYrRkXHxlMC0oV+qdf8VjLLIOA7HpazM7tSY6e/eMYerDSs6gDgaE8MgeQcVB+JO
	yJaa7wkNPkJfHC97qDjeugPYD633Y3XIwKSrIyrJ9q5MTt7shGedoXkSuFmbjozn3R9UgeQ5av8
	2mG2k=
X-Received: by 2002:a05:6214:627:b0:89a:5129:510f with SMTP id 6a1803df08f44-8a433f48ddcmr31691416d6.0.1775035961955;
        Wed, 01 Apr 2026 02:32:41 -0700 (PDT)
X-Received: by 2002:a05:6214:627:b0:89a:5129:510f with SMTP id 6a1803df08f44-8a433f48ddcmr31691156d6.0.1775035961433;
        Wed, 01 Apr 2026 02:32:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c0cce9b2esm115233666b.26.2026.04.01.02.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:32:39 -0700 (PDT)
Message-ID: <387635e8-d49e-4e08-bd26-e76838bb27d5@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:32:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/msm/a8xx: use pipe protect slot 15 for
 last-span-unbound feature
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
 <20260331-adreno-810-v1-4-725801dbb12b@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-adreno-810-v1-4-725801dbb12b@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4NiBTYWx0ZWRfX9vMCkEGq3Ty5
 PSsCjolE7AyHwRXnur9fwOvb/7esUL4W11eenIjZwK4LxZubEclFT6stQxTSVLcHryXxhnYnkeg
 VO6Q/KOgp6s8fjCgHZMH3pGomNvNVM0nDOJae4VRBGEgZsxcBXj+/S13Vm8aLR74E96EcNSRLra
 8IXrK0gkaTDRjo0rPG/4kmAwRfasujnT93cCdtIWmwnZoyt1qfG9imhKNWdpfdWXk5ZxSOqZwsq
 1t2MaJ9ygMAoQhJ2jC1BtmJhGGTYlAIzkOOt3eAgqPDa6uaPaA3gFplR/Gl4S9+xgEEPKtdfRgL
 DF3I7lE49GUj9HDwKIsj8K5K5xVpx1GYd0mjzjukD4JKEF2Oo9VmdMckmUZDSbOEpKMHSUvSTE5
 GJccJSpH74gZMy0IrL3V0+9lcWpkgLTJsjWwexlPERI/y3hIfV3NvQxDzyFofBTJvjv5FPLl5yp
 MsBx4ykFuTTaNNu7pKg==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69cce63b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qGQNF-HaROJYSwuyTOwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ZWsfJRC3Zrz5ZLc9X-ecGbvKNBnSwqh6
X-Proofpoint-ORIG-GUID: ZWsfJRC3Zrz5ZLc9X-ecGbvKNBnSwqh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101283-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.925];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47155377E07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 4:17 AM, Alexander Koskovich wrote:
> A8XX GPUs have two sets of protect registers: 64 global slots and 16
> pipe specific slots. The last-span-unbound feature is only available
> on pipe protect registers, and should always target pipe slot 15.
> 
> This matches the downstream driver which hardcodes pipe slot 15 for
> all A8XX GPUs (GRAPHICS.LA.15.0.r1) and resolves protect errors on
> A810.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 5af82d43f1e4..63387ee9b04a 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -252,11 +252,12 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
>  	}
>  
>  	/*
> -	 * Last span feature is only supported on PIPE specific register.
> -	 * So update those here
> +	 * Last span setting is only being applied to the last pipe specific
> +	 * register. Hence duplicate the last span from protect reg into the
> +	 * BR and BV protect reg pipe 15.
>  	 */
> -	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
> -	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
> +	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
> +	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);

I think this is a better fix than:

https://lore.kernel.org/linux-arm-msm/20260225-glymur-protect-fix-v1-1-0deddedf9277@oss.qualcomm.com/

which will let us bring back the BUILD_BUG_ON.. WDYT Akhil?

FWIW KGSL just hardcodes the number 15 here as well.. may make it
configurable if that ever changes

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

