Return-Path: <linux-arm-msm+bounces-82532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F8AC6FBA7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B58A43686E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70A4366DC8;
	Wed, 19 Nov 2025 15:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSaFDFQB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnKiPT5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E0232E697
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566586; cv=none; b=meXfFQ+4ec59PnXlMc05GIEQ7ACIEk09uApp3uuwB4g6vATMyFajdA1QTeeicAYkuOFLN5QCgEnGCKs8X24tzoQyyfuXeKx5DJS85YDGjfEM9v2WcYslKjvK0PYsPnZfuTOqaq9Q/BPPN4qXqblPAHfVNUuiQh48obI8IRWvUuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566586; c=relaxed/simple;
	bh=wTa40yMHXbA/hD3kwwRs4I02AX8q+hmhww5CzFpBfIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dk7R4QHARXLZzwgoVXdjs0SHx6u4rXCIlU7HQf8B2mkZ7qVIs/mFDOm5CUVLS/sM2m+dnnmGBCSVYegI2hzdTRtDpbpRVjvpvCpi8PVE9M8Il8BBGHMKuUy+hL3eOIkMHyEtIfAqrQraN2d1HcsrvdJQCrzgxXV54nFEiB7OopM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSaFDFQB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnKiPT5Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJFQ9k4717582
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wP9c2XnhztLAURhj3zwRP4AijueQ56rnmPiNweW8zA4=; b=HSaFDFQBv/9hndr9
	pGeruXzQJ8zJ5BiQW52RIcJbMgHow7HYJ4ozG/+v8xiFUh48JQZr4gMBouArt/GV
	COGx1EnbBiMTkmasCrosvfbS3bpeBjz3wdykH1Pv/PYbsVe+9D06zHe0DnYZN6md
	E6XEAfu3sHffwi7VJCc+NEH961MeiX0hU/VYND0+3WnbIGM6T8DfqAtqw7lqKPyo
	/8mFIoODqxbxzxiyfVesndv18BODZ2LE7MJqV1soSSupGti6VRiEEFdOpUeegpBW
	z0EfATo4TiFd18lmJMKEUHypfF0ukxmGhy1slbkFK9Ke+HPOeYtFd+ARpc+VUXFd
	gqu8vA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9n0scuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:36:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee1b7293e7so172149411cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566583; x=1764171383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wP9c2XnhztLAURhj3zwRP4AijueQ56rnmPiNweW8zA4=;
        b=fnKiPT5Z03QZZP1aHnvjuM1JJWQb43X3ptYo923nx/x6bys+Zdja1jQoZVy6r/IZBy
         JptbW3vKwJMUCEzlPiP1SpoQxGrcSY5N1NUJYoe8Ltg3GsMu4vVigHg3xmPW32TddUNM
         cv52TgMxL6QD/iC79XfIuSRJmEfj32UWdXeNFrOdfrzgbMIzA7+aA1A1JA9HXLUDM0q9
         ztPLL1ni0ns+vSFR5204TevemRf1pkYGWMIRSbqnyyM1ZBqW0J0P6qgbs4EMSnj+3GvX
         Tgc1UOlBACK1oRCAuX5uM0OTysIFvv3b484AeWbIWv1WRsNs5y43D15UrNnIHpw0sJvB
         kvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566583; x=1764171383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wP9c2XnhztLAURhj3zwRP4AijueQ56rnmPiNweW8zA4=;
        b=SXaSgihxnphlXqwBW1+u2MVvv0UW+eKVKSURUDc4VpWxkxx0Vd7EXNVg96JShKVFFU
         k0+bpwIOBKF73s8gzU+ERXUd1TQGmm5xaAQOxD5N1XDZzAGFkvKLSSN8R2mzHzMMdO7a
         18K97PjsKOtM0xxZYZKkJ4ZjFx4SwMxy1BXMPQG3cxlsGPU+/gnKZ8mCeKQw6JTuSIjv
         Dw7oc5sW5FRQE5dSjpzm/oVt7BXzAhovet8rPHN3xVcKO4yxFjK4x9GJygMNUsbyCZAH
         tKo5CTbKh91ZGLMBelCOlHoHT6oP/hK7hz9UoAjZolHgq4618QcL43QCXnqBoEP20ivB
         nXzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6m4IpKATeQfn9rs7nweO6Q0G3CG/IuzbUNvb1W3laRBb/ddIIrhvvv/JO7ADiMNkSh5cDgerpmoUYvDpw@vger.kernel.org
X-Gm-Message-State: AOJu0YzSt1OJHXwj3N4OqqJfatwW2H/o63R3/rdXcBMgiOfOwFtyIMJj
	XrkuTX9pAraB2yL4UixNZg6NEAIRCLqb9fSXdp0uQlPCkeTKdmO5nCA/vdL8x9WJmmuU6Pu3tMI
	dicGUR7j9rJPRAXpQTCfTXooWF60LLAuYF+i1fPiGfi3GFt8wI1fUlLHS/++ECvBye0OJ
X-Gm-Gg: ASbGncvyRWSRJhgx0IoiyqUhRMxtr0HzSbPIkDGxFeI8jbyq+z1zj7XDIPnupop1t69
	4fx8/3v+XwxRxHl/Yw31IS9CJZEYnYWZpjE6lyPwvHvs58qgHP+PJY3lNizFHueHVIFmDiky4xH
	KaGtkkcbnDGUX9fZ0EfocJhXPLJyV1fBHONXxoUR5t79xZdBvMxlAILpGAkC1FDZZZVai5L7jC9
	d73KrnipAO+Ucux3sev/T4KA1VEMVSu6URcgaU77wZ2aQ/x439M5TEbx9kwYnQprZ3X8p/AHhOJ
	+XFcc8WsrfJpfJ6uoeC7SAY84tJlqDL2mh005c7jGgteoBQLPPNYtsX/VZzKl4jp1c5IUgV2qp1
	Y+n3dmrC6Bpz+vJ+rhghkyoc0gq2c18pEdxVE
X-Received: by 2002:a05:622a:52:b0:4ec:ee7c:3165 with SMTP id d75a77b69052e-4edf214a917mr264089231cf.81.1763566583182;
        Wed, 19 Nov 2025 07:36:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5uxE4x9fVe+zMA0r2RYYf4J9RcY1a3oV+0kiDa5+6vY8Fzo2+GVxSxUf3+QhzNzjfWm/LuA==
X-Received: by 2002:a05:622a:52:b0:4ec:ee7c:3165 with SMTP id d75a77b69052e-4edf214a917mr264088701cf.81.1763566582708;
        Wed, 19 Nov 2025 07:36:22 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b53f1fd50sm39044188f8f.38.2025.11.19.07.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:36:22 -0800 (PST)
Message-ID: <fa5c2a85-3098-4e16-95b0-76bb84e577fd@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:36:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] ASoC: codecs: lpass-wsa-macro: remove useless gain
 read/write sequence
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
 <20251117051523.16462-2-jonathan@marek.ca>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251117051523.16462-2-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfX5Sh3iDorhX2O
 m72/bwUKAXJZFNmoBMMqea/vHlnD0EriT6fltVf0v4aB+Y8IpFLEPl5YGzLT6VZTm4/ZrUxD0nt
 6OSXtWzNWQgWAWiZxy0xY8HkU1P2Xzz3JNOhSDzn4meXLqM675oXSu2jZGlKdCl+OIEctzOCUUf
 lAZq+xKnouP9zW/UUdpNZ2i1x5DGc5Oyo2TqhvzfnaF3C0SekExU7Sz7IzaKIryHDUgGjS5aaTB
 7HCWHIs0AZ4z4XbcAVmzJw5oknj529hoMipJ/NZhxAZiCqLLlE5TqOzCMPTMb5h4N3j7aD9lAec
 gzq1aDgItXburAVB1SsNSCFHfPNkKOjMH6mrL25lBGKUbi4/PHzJOKAi3riittDQ7m3eBTfU4ol
 xmV3i/bfaYGSR9h+x66xB7E7VIxpcA==
X-Proofpoint-GUID: iuyDRtrIdy73qNsDDmIvTqxa2B6ofIxz
X-Authority-Analysis: v=2.4 cv=QZlrf8bv c=1 sm=1 tr=0 ts=691de3f8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=RmIaNmV--FFQmAx1t8oA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: iuyDRtrIdy73qNsDDmIvTqxa2B6ofIxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> Reading and writing the same value to this register does nothing.
> 
> Looking at downstream driver it seems there was meant to be an offset added
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>


Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
#on T14s
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>> ---


>  sound/soc/codecs/lpass-wsa-macro.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 6e54c1beac8f9..6f16d54aee401 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1567,17 +1567,14 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
>  				     struct snd_kcontrol *kcontrol, int event)
>  {
>  	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> -	u16 path_reg, gain_reg;
> -	int val;
> +	u16 path_reg;
>  
>  	switch (w->shift) {
>  	case WSA_MACRO_RX_MIX0:
>  		path_reg = CDC_WSA_RX0_RX_PATH_MIX_CTL;
> -		gain_reg = CDC_WSA_RX0_RX_VOL_MIX_CTL;
>  		break;
>  	case WSA_MACRO_RX_MIX1:
>  		path_reg = CDC_WSA_RX1_RX_PATH_MIX_CTL;
> -		gain_reg = CDC_WSA_RX1_RX_VOL_MIX_CTL;
>  		break;
>  	default:
>  		return 0;
> @@ -1585,8 +1582,6 @@ static int wsa_macro_enable_mix_path(struct snd_soc_dapm_widget *w,
>  
>  	switch (event) {
>  	case SND_SOC_DAPM_POST_PMU:
> -		val = snd_soc_component_read(component, gain_reg);
> -		snd_soc_component_write(component, gain_reg, val);
>  		break;
>  	case SND_SOC_DAPM_POST_PMD:
>  		snd_soc_component_update_bits(component, path_reg,
> @@ -1931,7 +1926,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>  	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>  	u16 gain_reg;
>  	u16 reg;
> -	int val;
>  	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
>  
>  	if (w->shift == WSA_MACRO_COMP1) {
> @@ -1971,8 +1965,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>  					CDC_WSA_RX_PGA_HALF_DB_MASK,
>  					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
>  		}
> -		val = snd_soc_component_read(component, gain_reg);
> -		snd_soc_component_write(component, gain_reg, val);
>  		wsa_macro_config_ear_spkr_gain(component, wsa,
>  						event, gain_reg);
>  		break;


