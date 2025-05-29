Return-Path: <linux-arm-msm+bounces-59797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A0FAC7B01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5941B9E259D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 09:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1109921CA0E;
	Thu, 29 May 2025 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzxLIlnZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7673821C18D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510881; cv=none; b=EuzxkVXH0z7PDMY25Nr9UTW6bJYvdccZiTzTW5+AeQPg/ZMWpIDv95HXymLflhb0tW24/GEHBJzG/qIQoY8/ZNrxCLZ0P3SltWRG9F/68RDOYpgoRZh/Dyo6qKJJayFNFL68WS+K3XpbPvwzTf5b1aTcAX013xuN34HUOjKHTWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510881; c=relaxed/simple;
	bh=38HSOu/T3KkXbvH/8T6Zvh4srhNNn+nMGnrn4pkq2ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9R8/M6uqQ/q4iTa6YUe8aItWzFM19+MeZh/30Ui1z4pzNzsfNj/sr2FUsLXRzncObnn9HyWT/qCpGShKHYVY7LQrrm/7a9tSBlxlHe/NcaoQ7j8ELOuZQ+eZtptoniLXs2Z5HPlRxu+JVVnZ/rFPE8I24DblyOonjy0Jnyk75Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzxLIlnZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T8EHtc001972
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AfBXbmQzY+v1rrp3aRE7tTBttn9f8zplAsyFICmeQk=; b=FzxLIlnZDhQwevYm
	09rGmnA/fx3s0X0UI8ttCiJQ4w947F8HmT2FHRhBT57ka0D463PUd/x8wO0ecCoS
	WjTOEtFPc6QXmy/T17dHv1kaDocvDqzJX5+7JXgLGfOynTeQ7hWN3vomj/Jp/L7r
	IV4vuois2cBlQs3ApXFM5aASVCH+YqNg4Zgz8mtl5OLBblPWiNWMKx4w9w+pk+p2
	DX27OgneVX+4S+3P2uT4jj6zrXB+yPiUEWpUCXTKGCBXxPTmMyfM0x7frgLW+CZF
	3XSu3VLKPL6fO332qwV4R3l5/9yoXD7gcNKz4BokoxTRL2yN67iLhT6rfDBGQQYZ
	mXXQqA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549n4hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:27:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3122368d82bso402890a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 02:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510876; x=1749115676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AfBXbmQzY+v1rrp3aRE7tTBttn9f8zplAsyFICmeQk=;
        b=J0Yc+K3iRAEMVXFe/7Sc1vegsEYpEmlcT/W8v261njQ5YUe42sW+rTqVK3+S+LMBEz
         nXzVxfgWICSg4016zEYNTApBb5i5xbtLGp5C//eoWWO2TmTVUCePLbm6BizXZLu++nQW
         SoZ1Ymwl02KHGN3e9B5FpZO3f1/+v8wn3NfSOVojiQnzMqTpvkgeveWumYinXJcXPgDw
         8xpdBEcC6zCG53iNqGHPIijytai0jZrSlr1n9KfzAjP7wRhpVpK931YBWHxX57ErmRe0
         DQH1tTM0iKK7xCH+PpD1Mif8UIP6a8588vTPdowzCzWlzX2uT/TEBNw9jHOl4wSnr/m0
         IBag==
X-Forwarded-Encrypted: i=1; AJvYcCUbL7+WxwYidabMTNuWxDNTH6ZpJ7a/FNrg2/e3gaxS25yo3tyIh4p7S7WI5FDi679KcKyKTajEQonpLt6h@vger.kernel.org
X-Gm-Message-State: AOJu0YxWCwqakrzIoG19mNIjp+U6D0WJ0aLE5AdXn7f1l81dgElzUHsf
	O4YXQU0xyxaEz9mBsHCmlheFdA/m+iHG17YTGZH2D3J19sHoZYiaw8thuc0fj/S2lYgN7qDS8ee
	nEOjnmqlFCRpL9FHuS8UT78zvkJOYmq81E8AWxtaxb3T3pAcBPvwDrh5B1DgalNeXx7q96mywHX
	HPI6Q=
X-Gm-Gg: ASbGncvjNWPXDu0JQ0eqeb9oyDFvUu1wZxRnrrJp6Q4ecXj+bct886Wyglu4e2PTUYX
	D3+OvBzuzownlvVy8p6VQagqS17pg+TieYdsYiHYubRx9rtFCfqr7g5lU0PVJDO76oVHJDRhCQL
	y1jMFVAfxWsQIe5PBNsWQF2DKIde+mFWUIdVRI4sCSFVSDZTZqeZUAN3/YOBMJeLRtFOfm5QsbM
	9Z4tgZI3BaYKQf+C+KTJs3AQkL0+OGDXRed2yW6GfJm2oPYVQI86LqoR8lOo2ha/6qq+clMAlxZ
	17VckgujYjFCCP0pDg4QoBJ9h8c8+ajc/ypppg==
X-Received: by 2002:a17:90b:1997:b0:311:a314:c2cf with SMTP id 98e67ed59e1d1-311a314c4bcmr13084453a91.30.1748510876111;
        Thu, 29 May 2025 02:27:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVu8gsVIcc+j2x0F4CmddwNg9zAzw7EDQGOQrTCjISKQhs+iM8+1jN3A0gsZtkJaioa2g2hA==
X-Received: by 2002:a05:622a:550f:b0:47a:e1b1:c6c9 with SMTP id d75a77b69052e-49f4781eaeamr309670811cf.42.1748510864998;
        Thu, 29 May 2025 02:27:44 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f83sm1386641f8f.49.2025.05.29.02.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:27:44 -0700 (PDT)
Message-ID: <6668e85d-c60d-42c2-8ada-fe68eb6a425c@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:27:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] ASoC: codecs: wcd9335: Drop unused sido_input_src
 field
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
 <20250528-asoc-const-unused-v1-3-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-3-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ntJ3eMrecCm4-lXmo_FlsIRpozgoHZA5
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=6838289e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_jUoxkvH9Ww3fLBRgmsA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MCBTYWx0ZWRfX2Jo3xcMFOjOd
 8L1pfh6K5hZyDjjdSA87tmugxN34vv5JanC8CCMWiLvhGa5F7j31GG6vMHkMVA/EZSVxpYxQj+4
 usuzE0Wl62jNYzG7DLs1a1OHL6IEugRHBpStChW1s8QMsOTL65Cl9biay/7quIPYL7MtRzV/3fG
 Mf7e2b/1NtA0ah3M6hJkAV7CCtUzrxQiTDzd2HL9y1PgLobm7d9JxbsWbIIqn8Z/wSl9yd8sE2r
 trtMLSS+4LZZd9gZECyR8NEx3zqZTxZx/P9EcRIoR/owDKfWn1npwVRkKC5xuPn0nmXX3+hbvQV
 Ef2eCm/VBMZX2eCH/169f5B5KMqz06j0eSqgVxQuF5vB9NWvII43VdmmZJ52PRE4b1q1tR2CatK
 doNNX5kZ6i0eTob4d26xUzi4FOUIM4YXSdnYKJKBQiU1r5vFYIhPlLuCMOLOcAO5dtz1WLgJ
X-Proofpoint-ORIG-GUID: ntJ3eMrecCm4-lXmo_FlsIRpozgoHZA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=836 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290090



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> Member wcd9335_codec.sido_input_src is not read anywhere after
> assignment, so it can be safely dropped.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---



Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/codecs/wcd9335.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> index 5e19e813748dfa0d065287494240007d60478dea..1c050b8c19de43cf494583d2c96f50f65aefe567 100644
> --- a/sound/soc/codecs/wcd9335.c
> +++ b/sound/soc/codecs/wcd9335.c
> @@ -312,7 +312,6 @@ struct wcd9335_codec {
>  	u32 num_rx_port;
>  	u32 num_tx_port;
>  
> -	int sido_input_src;
>  	enum wcd9335_sido_voltage sido_voltage;
>  
>  	struct wcd_slim_codec_dai_data dai[NUM_CODEC_DAIS];
> @@ -4725,8 +4724,6 @@ static const struct snd_soc_dapm_widget wcd9335_dapm_widgets[] = {
>  
>  static void wcd9335_enable_sido_buck(struct snd_soc_component *component)
>  {
> -	struct wcd9335_codec *wcd = dev_get_drvdata(component->dev);
> -
>  	snd_soc_component_update_bits(component, WCD9335_ANA_RCO,
>  					WCD9335_ANA_RCO_BG_EN_MASK,
>  					WCD9335_ANA_RCO_BG_ENABLE);
> @@ -4740,7 +4737,6 @@ static void wcd9335_enable_sido_buck(struct snd_soc_component *component)
>  					WCD9335_ANA_BUCK_CTL_VOUT_D_VREF_EXT);
>  	/* 100us sleep needed after VREF settings */
>  	usleep_range(100, 110);
> -	wcd->sido_input_src = SIDO_SOURCE_RCO_BG;
>  }
>  
>  static int wcd9335_enable_efuse_sensing(struct snd_soc_component *comp)
> @@ -4871,7 +4867,6 @@ static int wcd9335_probe(struct wcd9335_codec *wcd)
>  	memcpy(wcd->rx_chs, wcd9335_rx_chs, sizeof(wcd9335_rx_chs));
>  	memcpy(wcd->tx_chs, wcd9335_tx_chs, sizeof(wcd9335_tx_chs));
>  
> -	wcd->sido_input_src = SIDO_SOURCE_INTERNAL;
>  	wcd->sido_voltage = SIDO_VOLTAGE_NOMINAL_MV;
>  
>  	return devm_snd_soc_register_component(dev, &wcd9335_component_drv,
> 


