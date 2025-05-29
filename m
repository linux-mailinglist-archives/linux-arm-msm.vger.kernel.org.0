Return-Path: <linux-arm-msm+bounces-59804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D943AC7B16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8657B7B095C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 09:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5AA21C16A;
	Thu, 29 May 2025 09:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbe6UJ5z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F57421C9E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511074; cv=none; b=UxgODbNpm1jANNPdUEqSgeXs11R+uwPBwHnlWM6aPQ9TV2EdYDU1gKYTR7NFxBUEGAmE6XHtA/x/nDAELT46QX25SEnaybeVyrsy+xLZlk4uZDPKGoWkPOWdFO63EqL2ueb9GnJmQyrgLodjZftf3j1CEVCVCjXpF1budNw9FVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511074; c=relaxed/simple;
	bh=Fev/tTEBDwZmfGInxblEiEnDwk6UVMQ7JbICwxD6TnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V8k5rPUw2Xe/qVrT0PvPNK22gFq73DLkfbaXBejPY9z6fRzZZVb4ztzaBoUHqXiMaf7IDVTLWtPmmRzsJn54UucKhRtki9BvfT7qAfEJBG/9oW4++7u+6MIMD7EQn8B00gNsRYVsnf1dpYsnPK8sRkO9zPmWEEM9f2CT4rbNTng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbe6UJ5z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T6PKUR025377
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cgGha5/zNQyybd2qE+gxdZyIWTR5HQtp75D/abAxnHs=; b=fbe6UJ5zC1mnN+mY
	mfRo0gGSQDRrwZ4ppYqLz8Xvf5EWb5rZUA9Uns+cltHmiLyYqPekmfxcBbbps4T2
	DRDPOlb1XbdiXNWas8PzCYkqfwXVhTsTYdavVw1cfBp6AIYKi5jHVzf4IGMbGV0M
	3xS5cv9izb5tWo1Toe0KGcBU/mf+m88OriqE4zaQugcKCQ/qtwXL7oPuN3s53404
	yMAyYfA6pjqmERKVag6BTLhS66zGlij7XzRV15GDwX9SKLbKp3+Jtdi5C4cejP6H
	6kqGbE/XWzhy+GKVRJKw6uRbrnwhO/NgNAEjO8e36sg+xVdY4jm8afH7eXZ4x772
	IYj+RQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqdcp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:31:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so127750985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 02:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511071; x=1749115871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgGha5/zNQyybd2qE+gxdZyIWTR5HQtp75D/abAxnHs=;
        b=P3EPFTTVkDvW86xvWjen2fkV2VKXfGunNgxIm+t0FmiP6ES2figiM1At9YRtrVm0lY
         BfPGx4h5Nn9KOYlG/WouoxezF3hOAK75mgnrEvzfzZ+IX6YeHDZmQMB3f6NBLwAVqRuW
         Ml2hli3P9fEJT6ub+ET/6nyCudYMfaGUdG7Fe0BF0pFgnqa1Y0DK3JzHwFwSYmtWm5jD
         s70Ak65cNhliZUnfSXmWLzH1rdnr2LRO/W16z9zeb4D6Xrj6X4LGV3EpkCEs7e29yiu3
         O3z0kdjB2vUvyxmjnFSG5/OaBvmnVV6yUJ6pxbzD63QihuaPuFRJev+pC6ppOdX+tf9J
         5EWw==
X-Forwarded-Encrypted: i=1; AJvYcCWRYe7z3d+z69Lq577bq/nBek9wJ76y2V+AAzm/B7+3Pd/V6z636YsbZavtXneXGynHTZW8/jBe79EpXJdR@vger.kernel.org
X-Gm-Message-State: AOJu0YwYYCEB9hZ1PICWk6umi7izgqUoaPStCvZxBwFVLSe7gGh0LBXq
	bGtvH6pLYATNzvtYzUppmyK2aZou1cVOKL0n/d/yQMlCGJcGoqr4MqxzqyoY/6fMLWdvsX/8hAY
	LtmAL1JgxLnKykrHily7i3vyxyV/bCtkh9Zg0D5t87QfiWiCM1kcArhCM3E7KHFuptydfHFMz28
	em80U=
X-Gm-Gg: ASbGncvZRXki5d1Y26rnmAlR/u6w1r62MOycSDetbEtZnHlwJCnNDS87mUe1961BewK
	0Me06Af1M+1mRUTyYktexOqnMClCey0v2MVwJ30S6gB4N6TCcjdCmuZPdZwxxy2wKJZvDZyTNuy
	prY4cgEfaElQVzNeHZGwuwyZo111MUnkt2uI8d4l+Spr5m3Ii+rvy44gJn0nFc1R1+Cd2NbBPEI
	4ilX6vTaIRfOOU8EPUkB14yOdKZM5B6r6esd5V/6FcfA6iMbomSU7PgRoPKnUsFMjh5axTpJJJi
	G8FfM6/4IBfpAhpdHLLSZusKFdsU4TiClyi63w==
X-Received: by 2002:a05:620a:17a2:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7ceecc148e2mr2949958885a.23.1748511070992;
        Thu, 29 May 2025 02:31:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYvgtz0k2cbgNg2ujuBOWlNX7eUienPe0dFgksnmKUQOUTS4hJwPI18fbq2O+AkxbITzVcGA==
X-Received: by 2002:a05:620a:17a2:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7ceecc148e2mr2949955385a.23.1748511070653;
        Thu, 29 May 2025 02:31:10 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4f00a0146sm1421757f8f.93.2025.05.29.02.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:31:10 -0700 (PDT)
Message-ID: <43528c55-a0ac-4854-8485-4db3ac1e7cf4@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:31:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] ASoC: codecs: wcd938x: Drop unused variant field
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
 <20250528-asoc-const-unused-v1-7-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-7-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5tJpXrnW2707zcQzNUqkc0C4M4kj9J-0
X-Proofpoint-ORIG-GUID: 5tJpXrnW2707zcQzNUqkc0C4M4kj9J-0
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=68382960 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=n-EO9A7QzvSfXDX3UpYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfXx8IjaAxIPMoF
 a4V0oRd34jf1jy0RnurdoayCkNIL/X8y+Weril8q9ySSKbDO7kCAQT7eOKshZebt7NY/LDG5Enf
 pga+knNU1Z00wqcj9Lxk29oVdQ8BacMPfrZ9D2jd8mZH+Rz+djslTjbRI/g/RqPJHcAtbruHGT8
 JUwfnO2SROLfaq9eDZoCbjoIbxvmyhCHQfmnoIz15giqci5vnx/X1ESpGGvovls0dQsuLuY4Uro
 nF/LqzyLeb161dv5Zmrp8M6cpvCRYcmMIFrEU1blTR2dzMUW/Gyf6OT7+lNp86x84MUUMXhBk8c
 CQCnmJVZN2GNuxD6aQbUTLSoXpjzjonx7l+DXKpE5k1QSN1aNg9uV3NiuC+qjxPswTjH5xgldrM
 3wLeFCJJULa9LtgSPdL/MuwifVMfqR8Ll6gvACGAojih2ysdj77RyB0n6I7Aplk72u0GMjVm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=876
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505290091



On 5/28/25 9:00 PM, Krzysztof Kozlowski wrote:
> Member wcd938x_priv.variant is assigned in probe() function and used
> immediately thereafter, thus it can be just a local variable for less
> variables stored in 'struct wcd938x_priv' device-wide state.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/codecs/wcd938x.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index 43347c14070ca6dd8035b0c290f0dacb0326122b..5a751056a98a5d4cc5716aafc25af27e3ab22786 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -168,7 +168,6 @@ struct wcd938x_priv {
>  	u32 tx_mode[TX_ADC_MAX];
>  	int flyback_cur_det_disable;
>  	int ear_rx_path;
> -	int variant;
>  	struct gpio_desc *reset_gpio;
>  	struct gpio_desc *us_euro_gpio;
>  	struct mux_control *us_euro_mux;
> @@ -3044,6 +3043,7 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>  	struct sdw_slave *tx_sdw_dev = wcd938x->tx_sdw_dev;
>  	struct device *dev = component->dev;
>  	unsigned long time_left;
> +	unsigned int variant;
>  	int ret, i;
>  
>  	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
> @@ -3059,9 +3059,9 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>  	if (ret < 0)
>  		return ret;
>  
> -	wcd938x->variant = snd_soc_component_read_field(component,
> -						 WCD938X_DIGITAL_EFUSE_REG_0,
> -						 WCD938X_ID_MASK);
> +	variant = snd_soc_component_read_field(component,
> +					       WCD938X_DIGITAL_EFUSE_REG_0,
> +					       WCD938X_ID_MASK);
>  
>  	wcd938x->clsh_info = wcd_clsh_ctrl_alloc(component, WCD938X);
>  	if (IS_ERR(wcd938x->clsh_info)) {
> @@ -3115,14 +3115,14 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>  	disable_irq_nosync(wcd938x->hphl_pdm_wd_int);
>  	disable_irq_nosync(wcd938x->aux_pdm_wd_int);
>  
> -	switch (wcd938x->variant) {
> +	switch (variant) {
>  	case WCD9380:
>  		ret = snd_soc_add_component_controls(component, wcd9380_snd_controls,
>  					ARRAY_SIZE(wcd9380_snd_controls));
>  		if (ret < 0) {
>  			dev_err(component->dev,
>  				"%s: Failed to add snd ctrls for variant: %d\n",
> -				__func__, wcd938x->variant);
> +				__func__, variant);
>  			goto err_free_aux_pdm_wd_int;
>  		}
>  		break;
> @@ -3132,7 +3132,7 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>  		if (ret < 0) {
>  			dev_err(component->dev,
>  				"%s: Failed to add snd ctrls for variant: %d\n",
> -				__func__, wcd938x->variant);
> +				__func__, variant);
>  			goto err_free_aux_pdm_wd_int;
>  		}
>  		break;
> 


