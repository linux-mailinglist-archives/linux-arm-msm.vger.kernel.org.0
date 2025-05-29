Return-Path: <linux-arm-msm+bounces-59803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C6AC7B10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5A849E520D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 09:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD1C21C182;
	Thu, 29 May 2025 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1CyIVtc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E84521CC49
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511023; cv=none; b=Guw218fbPYvHwGWz8W6EKmFUW9c4hRdWFzvLtH2i0PdbeAmhFpWniy0f892csnTYb6RDLbVc3RLCueA/GJ6dELSJHvG5e+HIt5q97CwK05XAWCGvcpN1AhXcFIIjXOZpU/GNl/AHbcYhQ7oEtgbrGcrAOQtZsbogYls/W07Gyi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511023; c=relaxed/simple;
	bh=oJbshwMwiTS3jx1ryipl5iAEMXIg4CHVBkd8GnK92Bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u98aThseccIqbTYPRLxdPvAIo56GznI2AuIkmHbkkIuydI7y/i3EKNxuIJA+0XBiEMP4E4FPq2FmZlqPQZYB1riFeEK76ehkH3+NZAwljn3K8rfWYgyEXQHvADqvbqp9LZBern2Vk6hKIoKgYTlkzCenvH80KphpK3gEwBk3/qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1CyIVtc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T2qQJH003981
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6gj5u3aEjDTUd8XsUfvCPJYhhIHSGYHPaBVqASbR8I=; b=h1CyIVtc+vGV/xG2
	EpTVDD2N4Wink/i+fXnOTip+5nbsgLpaJLUdRMnjxlXFzoMwIi3bAOrk7wgdljwI
	xfVHPHyYtWjpoMBxprHsGaIjbsDIB+z4IRYOHdB4kQunPiWYnrHZ8pQMqIdII5Wv
	yqEtCbEBgVaIHtk2yzHo6H3laeCBwtomPCk9qU0wNCg88Lcjg8rTHvDL4pP5icq6
	8xWUSMzoNlaNfJ7ZX2qVMC7wwv84+e/VV5bYwLpTjxIU5t3/YWcWGlhpMpuCD2QC
	KinF1ZXejmH7qX9TjklM1YWXsZD/8n4jW2TLE1UjfP8UaaLVC75wSahLASZ5Dc1j
	8vU0nw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek536d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:30:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c95e424b62so281724285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 02:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511020; x=1749115820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6gj5u3aEjDTUd8XsUfvCPJYhhIHSGYHPaBVqASbR8I=;
        b=DFkL3U2MlbOjrlpaPi5Ra8MgVOeE7ZmADy756MgbKZP3UnwIRrn21ogPcKz+wX1LW/
         3fC0o1AqQnt5ZTNAOKQGrtXLKg0OzRcSFadQxwPLd3NfHvP7iS/8TaaeyAjO482XZOCh
         +EmllRw/5f4nHWRYTd50FL5oa1euHtDnw6XzIcyoxi5GKamMS/SKVTldPnJwUv+dAbYl
         tj+ZirqlxbsTgiuqSRhdDAL59VMeFhLWnCMAPXJ1Iv5Y2J2d9L/zRg9x79e856uc9hRE
         tUg29HV3rR+JYDvknN78kHWJN2m1tBUZaRwpmv4Gfqq3NOmGkkPW5iRZaNw3X3XUpUty
         n5XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHBMt027ItuGilHF3Fzy8NXq7Nm3WNr9Q8NwFrMgjOkaY9yair8+9Qszfr/KJwYP8jd7vUyYvZLsWmOLAn@vger.kernel.org
X-Gm-Message-State: AOJu0YwHowvzvAMVC0CyY1DIR3r/PTYGtcwwbVjKy/l+CF7ov8wDKmhH
	sxOpTBKAYCCxEzFZBw73W73HVWEUtpifLEZwrjkIZ/pQrygVbQzM9Z2nr/mNtyfndFO/APv8tII
	VsdsX/u9dpLLp085K+wkX9KI9kXWNdtwWk+uetLHpM1+bUNezvthD2vpWcClcEQslk49b
X-Gm-Gg: ASbGnctZhdNI8naN/XvwBC6cPiiGs28d53n6ohR5toFQCWOzgqCRWZvbWQRmJnUGvgU
	deF6ziFVfRq9BzkqTwnHC23nu/dwUmfLXG947HEWR+0l5lqfF2jH4aROsVkyiTPaQhaz1JGAACf
	yyYMulVFhVGiR77DptLGdXIFAPF1fcvBVbjx3nL6RWWs8Cho1Tozxv3muOetZL1+yblTVzOE8R9
	w0/NfXJLTBb+q+uTS5axRQ6GH9WufkdiF1Q6wTLTvz8JrTXKv2QVHzC1ojhUDY7IjEl5g4lbFaG
	CS6o2WrK45+DxDJzdM/tlT+P/kr2xI4qXYm0kw==
X-Received: by 2002:a05:620a:31a4:b0:7ce:eb71:f500 with SMTP id af79cd13be357-7d0987e7ec8mr430402585a.28.1748511019849;
        Thu, 29 May 2025 02:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWz2AvGO86BMuA7xGy7C7kufYtby3ybNxEI9G9NE+7JyBgPrSRhr6xuM6E7oQNmqcSWglyyw==
X-Received: by 2002:a05:620a:31a4:b0:7ce:eb71:f500 with SMTP id af79cd13be357-7d0987e7ec8mr430398585a.28.1748511019468;
        Thu, 29 May 2025 02:30:19 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4efe73eadsm1405830f8f.41.2025.05.29.02.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:30:19 -0700 (PDT)
Message-ID: <457c89b4-b491-4653-bc5c-d2bb4b448b86@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:30:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] ASoC: codecs: wcd938x: Drop unused 'struct
 wcd938x_priv' fields
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
 <20250528-asoc-const-unused-v1-6-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-6-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6838292c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ta2c_YJw1Ga9Y8nrc5oA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DeE3faHwSjZ4g8YfRpIALGb5dD1TO5HP
X-Proofpoint-GUID: DeE3faHwSjZ4g8YfRpIALGb5dD1TO5HP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX0TOReIrcseVr
 AtSvHtxvnHVo+BzyeOUV3XZ6I7WvsE4Mq8dYThoD/9Z4gh6u/dkNZ5qQXnt1hcBeiSvtkPCZ3rc
 /4ee2/Creh4GN/2Ebs9GTGdrWbKtTXSLVL435bVUoqxbZvG5hkhS+iPoPxcrjNC0bFFKGd5oFUP
 aJjTRqBJ+rHx37cRiMzlTi9nzQIvN4peynIMF6UmyrN8enaBMXdigfy7xxRNc3tv/AhysJr22NY
 R7ekW08tk9he9XPUyyr4wI+YQebpE6E9GBqqe0HPe+obCvNzrK2Dn+GZdyLlub6+CY/eKeL8K+3
 xLZxF7DUj7W4boRhW9nmf9QCUZkWlfXsniB7uN1hE16eAAsC4FGut/jXJQGodracWC7W4qCOykm
 coQ1nDl1g7yx9QYr2+AhM5QZafovI7l4oxoLsifn4u5tPYgEUJ0q8fy+kySH/0lPj1szLK/W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=844 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290091



On 5/28/25 9:00 PM, Krzysztof Kozlowski wrote:
> 'wcd_regmap_irq_chip' and 'jack' in 'struct wcd938x_priv' are not used
> at all.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/codecs/wcd938x.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index 342d1f7d5dee3ac2d703e5b5602aef9ca2987158..43347c14070ca6dd8035b0c290f0dacb0326122b 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -159,10 +159,8 @@ struct wcd938x_priv {
>  	struct wcd_mbhc_intr intr_ids;
>  	struct wcd_clsh_ctrl *clsh_info;
>  	struct irq_domain *virq;
> -	struct regmap_irq_chip *wcd_regmap_irq_chip;
>  	struct regmap_irq_chip_data *irq_chip;
>  	struct regulator_bulk_data supplies[WCD938X_MAX_SUPPLY];
> -	struct snd_soc_jack *jack;
>  	unsigned long status_mask;
>  	s32 micb_ref[WCD938X_MAX_MICBIAS];
>  	s32 pullup_ref[WCD938X_MAX_MICBIAS];
> 


