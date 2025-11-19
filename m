Return-Path: <linux-arm-msm+bounces-82530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFCBC6FB7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0023234A801
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC4A2E7F08;
	Wed, 19 Nov 2025 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLQJya2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqW/7uzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44192E7166
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566563; cv=none; b=lZ/k2hVBN3YFZcq9CI4vVEamsqD4Wwj1wMt1Kuc6RG7AuMR5YQEcHLC6xXkvBW3549ebqUCMjR3B4u3TN14F7pPGaoMzsFOUzoQrpUUR8OVFb/Nnt33oAgKVt9g0Rdw36QK5OpTz0ChJLE5eUiT8qi07dAfPBmK9DxLZ2atyEno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566563; c=relaxed/simple;
	bh=l5iD3Cx/sDru2iSVerjAtGkme0f3lppIf3EZeVr009s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=I10QnQVJMqOlUNZ90EqwWGmUcF4Xi/sMMoMaJHm3DdLH0+KT7tXW5UhUqMqYgPvQy+JZZFzhgG1n3K59XHgcyLPUuZRc42O+pL2XvKyQzhKUu5DYvDZIgCxSLOnrGW2T72JiCV99oazkUJheuThUUIXYflm2xbE198boS4xMY7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLQJya2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqW/7uzG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJAw5FE536908
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eEmkXxHDUOZ364AJ8xpE5szLredmiGGmXw7ny/xja+8=; b=nLQJya2fWbSvuJ4K
	ww7awPL2eWRwCKR6Yu8UU6XQ+PhKfraa1Qj0MnDrS0sCqAgQEgTItlOUrnP5j1sz
	Fi4vp8Fc1dA/ajJ+ZXYlEt44xBOkhh44rWyDqu5Q6cnZVj6Cx6HTcaZmULGA0LOt
	cbVkRJ4/KZ6wJdppl4zK5H34fvnQNrLh2b+8WWauW14UKFk0ifnITVHyqPxUqeN+
	DgfR+P8NtifJLAAclJkHTUvvBUUVl8B0tl07g07rxtg0MaNU+QVa5pWszL4d7Ny3
	V5RFDFFowlKv0twnEgSN9dh9r07ui/z8A4ZVnaa0JutgIBQblL7cW28oBD4gccck
	BO9AeA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah65t213p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:36:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e4b78e35so1053206485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763566560; x=1764171360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eEmkXxHDUOZ364AJ8xpE5szLredmiGGmXw7ny/xja+8=;
        b=LqW/7uzGLOS01xSDkaoekKxJ7QTXnNPizwkNEcMBybDsx86pkdg/1lnlIVWCXi6Mpp
         s5JYGqvOr0ZEYZvoCmHxAWShvZVwsgGqlIAJCpqwHSWmqPH3OmRnlbZcdnP4v/jUIE87
         dYN/9aNlBgY3CK4bCkdIx1q41PiPrvOZ5MY+ZYVhJhf2+WdeLbBY3tGrIL4zdwdC3PcA
         XixRAX6oKtp0lKyIj2/boPxrl7OeH69jv6YTzIAkShl5CW8QUSG/QoNdfZnrC8QK+1Mu
         XpJuxGgCHyn0BMLc9kpSrkZGl8ILDL3OWK4ldbW9kzotVkvYaNxZf6L0/cedcgvv3HaS
         xP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763566560; x=1764171360;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eEmkXxHDUOZ364AJ8xpE5szLredmiGGmXw7ny/xja+8=;
        b=TkzJ1yN1uYUm4AouvSlvKdNv9tfS8sX89paAmJ2Qjg5HqYkPgFG4Wq6nU5A3KRmPyC
         7RwwFzH/2EYDCbJTGekngjZGHIOxpWkPizkqq9zEAzzf3laBnD4Oi1KA/HA8triUQVXG
         8iXanmSQndsrKoOeOyAoSaW7wUnxBSVve8z59QbHBIlRcRGcNr0Btn930il7LfclpBxK
         FXPS4tXrS1GDXTOk4Vb1oTk9tMJiwzAhQO++8HaBLcykv7AQmyAlhi2LTlWQzB6j5eRb
         kI9gQsL3vklDbjh+nzBj3Nqu+60UgQyWC+yN5PgKYcBIsOvRbixxDZGkbp3W7HmoOJSJ
         vGCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5kwYkr3XgQwL938j+iyPWx4FzY+3D5C7rLF+aHP87GsA/gZxCXZzWnC1aSKYN90WavEvX9g77LVnPu+f@vger.kernel.org
X-Gm-Message-State: AOJu0YxI7Q8PdFwrF8yULaDA9x6fn3oZ77wok/28lNMsLE7xp/haljdE
	lVMTJvmHt39MqtEPcLEFVjoooYKVc3lm9ChBtzRQ+Ak4iZPMdcTAPaN+PEs9NgAnTcLoUkQ/sLO
	HhudpYdQGNsQOOiAwtWI725g6PJopCBUItHHscZiup2BGHWxT0F/LtKPYwUP+8NxZZvOB
X-Gm-Gg: ASbGncvkAbuy3ATkvgTHBiSxUYlNZlbbQPW6JFpcY8FXIJDit7M0eicqYbmK35xSRoY
	sZ/lB4oHNYmZZXByOLtPoXkbu31AnaptaHE7U5kGFGV5WCyLGUYYSMijQ0yQzO6lKpxT2kPPG39
	TCE5gGCycJ2W8XgKS3KtUaOLru/xY7ZnTAIdwPMi/tUIKXBfr3IR/EWUikEQfDWR5JRTNw7SetU
	7kUPkl934NMnyAvnquBJY2ZXwbBvB6Htr7gYXLvAMAgesRn+0p7VswmTKZtniXe7IwpdrCSGJLK
	ug0ldrCvJS9rxlnkruDropftKpNZPVL2lGXZKEp4NTuxTykZEtZqCeq8LNAup/4NBhNbT/nGXqe
	qceY5uLzStTIP5KXOf8lwJF0nJdk5M/tA51GF
X-Received: by 2002:a05:622a:1886:b0:4e8:9ca2:b9ea with SMTP id d75a77b69052e-4edf21408b8mr252901911cf.56.1763566559955;
        Wed, 19 Nov 2025 07:35:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IExw6h9e9OPKWc55w3FluIcrQAm0qTZheVRXVXHH0RkBcCUdKwa3aUi8Z7yEe88tQr330YH+Q==
X-Received: by 2002:a05:622a:1886:b0:4e8:9ca2:b9ea with SMTP id d75a77b69052e-4edf21408b8mr252901461cf.56.1763566559470;
        Wed, 19 Nov 2025 07:35:59 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42b53f0b8d6sm40179217f8f.28.2025.11.19.07.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:35:59 -0800 (PST)
Message-ID: <a77f0c42-70bf-4d6a-bb45-d435e4f29809@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:35:57 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 1/9] ASoC: codecs: lpass-wsa-macro: remove unnecessary
 bounds check
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251117051523.16462-1-jonathan@marek.ca>
Content-Language: en-US
In-Reply-To: <20251117051523.16462-1-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=avK/yCZV c=1 sm=1 tr=0 ts=691de3e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=EUspDBNiAAAA:8
 a=D4_jThNCTOB2YhlUUkcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDEyNCBTYWx0ZWRfX644xOjheV66d
 viLccL69whkVcqg2N5VM3kKr+e8CFLh4gx5GMsHmM2mkhEF27DLsqsbfo5V+SR9zyICr+GSCwDn
 iqrt/rzbG92ypg91Zj9x9vfF2WjMNBoez9AhMKf2q79gS2dEZenFdlKQJXzBnE1A9Y0gv6lJc3f
 enCTyLLoMt3CDCuHbAEtwzMFdGoaXmDCZcBC9d0aYOMISB3VC/TJWmf+/2d21itWiwHCz1V4VY2
 Mk1M3NC5QjsjDrxYB8waFYvQLrU2+JgYM9laqxmvyyFL3bcJ2Kx33YpQY8emVv1egFOnXQHugyR
 IcLkuJL46nLv9Q2va9YaDOrJUcN08DFNCB9LMJKr01NGTHtnt5T1MhIp5tGQA99a3snUls0HhfP
 fEmtXhIeurCyGubn3m0+kTVR92/z0Q==
X-Proofpoint-GUID: M7sd6U8J9jWfo1gOB6rRiW84DP0PDDfL
X-Proofpoint-ORIG-GUID: M7sd6U8J9jWfo1gOB6rRiW84DP0PDDfL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190124



On 11/17/25 5:15 AM, Jonathan Marek wrote:
> WSA_MACRO_RX0 is 0 and WSA_MACRO_RX_MIX1 is (WSA_MACRO_RX_MAX-1), which
> means it is not possible for the bounds check to fail.
> 
> Removing the WSA_MACRO_RX_MIX1 limit is needed to add support for other
> ports (RX4, RX5, etc.), in which case the valid range depends on the HW
> version: rely on the driver only setting valid ports in active_ch_mask
> instead (already the case).
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 

Thanks for Cleaning these invalid checks.

Its convenient to have a cover letter for this series, which makes easy
for giving Rb and Tb's,

Consider this next time when you send more than one patch.



Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
#on T14s
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 38faa9074ca3e..6e54c1beac8f9 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1168,12 +1168,6 @@ static int wsa_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
>  
>  	for_each_set_bit(port, &wsa->active_ch_mask[dai->id], WSA_MACRO_RX_MAX) {
>  		int_1_mix1_inp = port;
> -		if ((int_1_mix1_inp < WSA_MACRO_RX0) || (int_1_mix1_inp > WSA_MACRO_RX_MIX1)) {
> -			dev_err(component->dev,	"%s: Invalid RX port, Dai ID is %d\n",
> -				__func__, dai->id);
> -			return -EINVAL;
> -		}
> -
>  		int_mux_cfg0 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG0;
>  
>  		/*
> @@ -1220,11 +1214,6 @@ static int wsa_macro_set_mix_interpolator_rate(struct snd_soc_dai *dai,
>  
>  	for_each_set_bit(port, &wsa->active_ch_mask[dai->id], WSA_MACRO_RX_MAX) {
>  		int_2_inp = port;
> -		if ((int_2_inp < WSA_MACRO_RX0) || (int_2_inp > WSA_MACRO_RX_MIX1)) {
> -			dev_err(component->dev,	"%s: Invalid RX port, Dai ID is %d\n",
> -				__func__, dai->id);
> -			return -EINVAL;
> -		}
>  
>  		int_mux_cfg1 = CDC_WSA_RX_INP_MUX_RX_INT0_CFG1;
>  		for (j = 0; j < NUM_INTERPOLATORS; j++) {


