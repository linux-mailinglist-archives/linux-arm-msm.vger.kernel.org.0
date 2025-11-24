Return-Path: <linux-arm-msm+bounces-83075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E894C80EAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 15:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67C3B3ACB24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 14:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34FB730E0FA;
	Mon, 24 Nov 2025 14:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzzHWQMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTC5hf9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7905E30C632
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 14:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763993299; cv=none; b=dMWyMY5eZkF0Ijzw15AIWipmN+2j4DGlZAszQghuuQ9pTZm74mAP/LOBvR87ah4bvVkdThO4sHutWg91AI2c/e56OWesDK1m/a42mN+I6NGrcN2X3bCCvyQ9Kz/kmCh08n/L63AqdphmQQ1oZ/qqoGtWTjCT5r3l1DK1Nqwtzjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763993299; c=relaxed/simple;
	bh=7YKZHAFhDcKEqQAk+JIlZdMiyf/pZyD+Q6/FfKHi1Ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iLyg+H7he3As9C+ptcz8deSAPqeTn4LP6YZ6LC8+tVJb6ssURFU0Zr9sHrV+BEHxH4ESZ6srqOknK4wWuHxoINjzitsvsLzC24lU7110M3g5Uicjalma8KPFu/QQroFZRdcYrBl3InBda78T4tbwjzuPTFujd5+P0svxNjp1cV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzzHWQMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTC5hf9A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AODRFNq452626
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 14:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6QQ62ZxwkhlLfH9i4OuMkYuxp6Si/5CSoyIHKynyDww=; b=GzzHWQMkOfXzoZ/8
	DWoEejCz4IKvwaydAIsdv63NQBHaFywbDJArjxMWZsS9lPbls2Bb1QqfdfO5/Zyq
	AVbEsZnSKX9Bfr73eWWqfDdLVuDUQEJ+dwgNZDMaeBbabdN6/zW3EXiwd1vJHC5I
	iLEOFb2u5ebwuEZ92psnAIi/HU1jKeiSaKezgSfpAjccKTyXLOGGcUWyEoH7Seoj
	okWEVDKF5ytiiNH339b7Ym4I5x5QLWbJyZjMvBjGTg4y7D3Xo8dS5UfH7tMa4829
	fujmKgTy7L6qgNtYUdRpSjc4iNWeqXTP3Qp+c0iRhzlopmqBK4lR03m79mQGkRqS
	3X2p5w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8s83mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 14:08:16 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5de93ca44d9so2051883137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 06:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763993295; x=1764598095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6QQ62ZxwkhlLfH9i4OuMkYuxp6Si/5CSoyIHKynyDww=;
        b=QTC5hf9ApdqnJrgi4RpyyZ6nT6ovvqwgetwEGD39Wt2amwSo35RsMJU1eEPckyb5UL
         7/+Bpob+xrx64OWjvUMIXReBBM4FOX3UGnG7DXn/cnaiTyCBsjp+gPuIlxCa2psUU3HN
         SS6BOum/sB+ho2tUp+wKr4rJhQ03yFwqkGkEEAG33WWrXHUCdm8iqw+4hNZhTXZCnGWO
         7gOmEGi7QGQSwTrZ5fICst7lkC5RUwUhcJSxxc0AePNRIY9RXqoLuQRyLG0cbijrWuPN
         yIAQeCBC+zBZI3hZBmOs1CSnzpzVipjTNFmfKaqVUTlTl8S+5Ho5VhEh/Cgrcn+ghLxB
         FI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763993295; x=1764598095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QQ62ZxwkhlLfH9i4OuMkYuxp6Si/5CSoyIHKynyDww=;
        b=HxX9dX+HaqxpuxZWuyYG+uQdgQD/gIiSNVPoMKsKSM8tcmLuIQV4tfYGDBhUGjmyHP
         kqgwwnPRQgSyTKB+8Hggmmieyu5cXxTbtQ11Amy6O7Wz8tfDF1aSsOFs/t5Tu4mqnViy
         w4qFIQ6+98naUj/kMsgVNfj06EpT4BwYUO+jRTrRRpnGL2PNFpnWdzFVe4bXnWqSkIZl
         0dTzaxC0thoRKioSDNjGs1DzQWB2rPpqRBhs8Lqk/jaRspGnirVHLQuZYYH6/EJ6WboJ
         PQZqH9I0mQ323gxK0V0Ud6a06NZMaAvg5j0I2AKCkEc5wokg8e4jmC2Ck1YyXAQBH6/t
         kG8w==
X-Forwarded-Encrypted: i=1; AJvYcCXSE+8Z4WJEwcDiJIeqMprwqzjude0LUZSfDTMN3dtBdq1xSFwgknOMliHa+zSHGySZg5YvuKd/0ZQQiT7/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw69bBGLUIg828tDaqU7t/uA83xE/1AF+SAtOcVOd1Lmfxq7zsx
	7hNtCboxWFHluA7tZW2BviVFc3b4joTcBkeRA/Vh7BxT4C6jhmVyf8AbW3pM0heuIKyhNF3Fv3l
	KfckNK+AvWj7XOdViTySLV6E1BsJP/6zr+li9HASrLjRgSBYG174qWtkTSh6zX1f6WqS2
X-Gm-Gg: ASbGncsLhgAlMK6e2k+m6oz8I93Shighc2/fGMIKAKRcOvMwjrBURs92QTEMwM1G7Jo
	CrpMHzYlNcaMgV9q8hyeIkFCDba0S+mrJEewpBqhzyOcSdWPS+sMEKw95/ORjPdxmLE2LZykGw8
	w8nm3sowkm50wgFLZ/xD7it2G3TcntAGLA24FQxlMG7EPuwT7W6C8lrPSxPp3VAFo54JrNcL/41
	OJQME6Dmr1zvh9s+b8j7gPzG6AofNfXCaTZD89yG3G0fEq6sCtvZvSgFHdAj41+cb7DqBZjCZBr
	6rBahf+aef64apQ4AtMadnXQ6TRxp7G3J8R5eWnYQJZvUZ/6A/J9r5EdkfgDa+ZMHM84N+8VR+/
	cFDtHXtbxd73IIO+N3O/PLdvdQdF4xxu9mL//
X-Received: by 2002:a05:6102:4a8e:b0:5dd:b288:e780 with SMTP id ada2fe7eead31-5e1ddd7f00fmr3607737137.0.1763993295362;
        Mon, 24 Nov 2025 06:08:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSGxyZrv+zVVuTIAB14KcEtZBB1HtvXIDm+s6TM+/QPIcIeW2ctrUgygRBg5RFY9Wlh+bmKw==
X-Received: by 2002:a05:6102:4a8e:b0:5dd:b288:e780 with SMTP id ada2fe7eead31-5e1ddd7f00fmr3607693137.0.1763993294895;
        Mon, 24 Nov 2025 06:08:14 -0800 (PST)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b7654d73430sm1313476066b.24.2025.11.24.06.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 06:08:14 -0800 (PST)
Message-ID: <2758401b-e9b5-4f10-bb01-0a1fe4e09430@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 14:08:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: codecs: wsa884x: remove mute_unmute_on_trigger
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        "open list:QCOM AUDIO (ASoC) DRIVERS" <linux-sound@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20251124064850.15419-1-jonathan@marek.ca>
 <20251124064850.15419-2-jonathan@marek.ca>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251124064850.15419-2-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JNQqYgsYlpnVTc-DPjNaucg2LFi1Vggg
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=692466d0 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=RAbU-raeAAAA:8 a=nI1KIoSTlTbwJlcfSIUA:9
 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEyMyBTYWx0ZWRfX5XIikUzf4j2p
 kDBy/CyRQhw9/qJ1ePiYHHYvjmGQKCToa82w6yR0BUzbXSpJuOgYKv8AAKGQ+Wpz9pNp6xkoskF
 SO9V9Qi3vXxnpq6d7UnAWwJuUVq6NRpPaTw9QNn4LBUrGmg5qhbxiTCfkgKe0zSKeE+jJbOifD1
 g+nttM5/C4g1xxrEnihNDh8R4uvN2xGugiga1Wd/3/vjEXMM0r5aZqdCS0KwINtXSH0T7xidb9+
 6JpJ9BljZeQUWkro8jBuqaP6QbTPg8Jkgd3j9eOHZ+u6GQOcpjKluav6QyLRmgjAaSMaBAujDV6
 vBVVwsMP28/NVgbEC2dSxRYsD10uEa7nStUMAgs5CAYIbzmisz2GCXjhbhbxvNRj0RgKK6ZO7wR
 JXcHScMS2SpDT6rX86WtaMo5zlaZGw==
X-Proofpoint-GUID: JNQqYgsYlpnVTc-DPjNaucg2LFi1Vggg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_05,2025-11-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240123



On 11/24/25 6:45 AM, Jonathan Marek wrote:
> trigger is atomic (non-schedulable), and soundwire register writes are not
> safe to run in an atomic context. (bus is locked with a mutex, and qcom
> driver's callback can also sleep if the FIFO is full).
> 
Thanks Jonathan for the patch,

We have nonatomic=1 flag set for all the Qualcomm sound cards, Did you
hit any schedule while atomic bug?



In-fact this change has helped suppress most of the click and pop noises
on laptops, specially with wsa codecs as they accumulate static if the
ports are kept open without sending any data.

--srini


> The important part of fixing the click/pop issue was removing the PA_EN
> writes from the dapm events, AFAICT this flag doesn't help anyway.
> 
> Fixes: 28b0b18d5346 ("ASoC: codec: wsa884x: make use of new mute_unmute_on_trigger flag")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  sound/soc/codecs/wsa884x.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index 2484d4b8e2d94..0218dfc13bc77 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
> @@ -1840,7 +1840,6 @@ static const struct snd_soc_dai_ops wsa884x_dai_ops = {
>  	.hw_free = wsa884x_hw_free,
>  	.mute_stream = wsa884x_mute_stream,
>  	.set_stream = wsa884x_set_stream,
> -	.mute_unmute_on_trigger = true,
>  };
>  
>  static struct snd_soc_dai_driver wsa884x_dais[] = {


