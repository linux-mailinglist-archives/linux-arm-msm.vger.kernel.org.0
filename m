Return-Path: <linux-arm-msm+bounces-59806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18655AC7B21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61D5F3A51C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 09:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3193621CA07;
	Thu, 29 May 2025 09:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G78IVkSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E68421C185
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511199; cv=none; b=VdxIkl6P5W16ner5t162C6hE4SQam57JPuriMIyviNdKT0cv2Vioq7iDESRtRNNsswVsTvlPFfOXCebmx7n5sk0IjR42RBh83aBoaPlHXJUQefuK2LFtIye/QwzrMe+5SBEgOm43QwLoXfCVV1v9UzRXAqtr3MPeKl4kwwZiaN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511199; c=relaxed/simple;
	bh=upaHpcoQNaYRpzfjT5IJF09oP9mPC/4FHbCQA5gbkaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcLadJUXq1FMqnF4axdVzzWrKSl32m7EUZ4SgcjANGkYgB2JVV85uxt/j6VzPOsxBIeCkaSD1yRsk4AHXexOSXCq1gFOBY2/vvprjInDMY/sJKemnT4E2UMyrkTeMBhKCiP8515nrvLoKtmHBq6AX0KNfxyfu+CaEMkFB7pPNSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G78IVkSj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T5RMrH001198
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J19CTIdOjN4o9N+SR4QD26ilvGTAu4kkXOBnmt8QyYw=; b=G78IVkSjKa2cFUdG
	TQimbwKv8Sbzgk/GS0OyD9/a1LlaBbCdVjBWFXr8yM3OX5WigqO0oMsV+etu5rNX
	ens3zoETm/wB7RwxyKTIxhvivztq8I01kS3KqZT+snFp7srDPWorfR0va2ZokDKg
	mJMT8zgo9xx2YMmCTlkhUmrclZW1LA2x0Gfbrg6xTokzvgIRjMBW9ODBwhrPxNQy
	9pszzhrFoi4zyS6eIaWLsl7HMr9ZnVaDkJ5GEyKPgKRqX4b0O1tYxGQpV+1JBhCO
	IG02JIHj1Bkavgu3tpzrz+jA1y7XF8WpvpifHS3dKvZxXRCH8X4T6Mozc4w9wuQx
	pnqbDg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g957mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:33:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fab1bd8a71so13004406d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 02:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511196; x=1749115996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J19CTIdOjN4o9N+SR4QD26ilvGTAu4kkXOBnmt8QyYw=;
        b=CUSB0RhXvmw8b/XMrezuSTH2KmTDn8Z3DXgB12MWabbKu4taCDeU+q91K72MAFvpP+
         bX/GpIjFwXyJnDqG6mpf20FGDmBP7Om3N9MZ6CrEWVkUvxAkMqSyKS/NVbIKXd2MIIF8
         McOMRZYnEmDFIie71CHXSOmx2VVTfiQ9jmWwWYEfm5Ht/5oSAj+rz4/F+wuwsQiZTTpm
         /PUbPs1FA6dzEO8Ok+v8JAA6QI2ycRKzwkXK6vLDGOcuy4SpcvRFyUgUQGnuAhlBKij4
         2PmIxOlavAc691CLGtyiXmnH78V21ySaJIAR3FBlfOL316y2q8sLRBeQQm6LIN6aTvSg
         l2+g==
X-Forwarded-Encrypted: i=1; AJvYcCXEw9hjrGyR3fzFYE/AmbroHKnBgRIpjPTt27LpY1KVliWp7k3qFvrorv2JGxPGyze+7oSjoHv+HBHVueF2@vger.kernel.org
X-Gm-Message-State: AOJu0YxZRfxWSN+ikZr3IyP7x+2o9ZrqbRRHjDYqPGFTWpdgU7RASalY
	NsvTby++cSJ9f7c4fJd1nKt9qSbSsbFe/QaViy11yMCNiRpGNhjocCvuKEocgioZDKxR5Tw+4DQ
	KnoLrEgBCyx1rv9cD0R0s/B76yenUwb8Lx/YSkLBu/uTBWYs2I3qvkkzfRc7N/bwYoFFL
X-Gm-Gg: ASbGncti2MS7otWJenP0b7xirgqfLZrmkv2g+fic8rlndsQYrHfAGDlx2vkIpAuQy1M
	99RddkpFVXOO1/lfMuCSG9DaCQufZo13oxX4etcd9otu59ty86nri357APoFHOJ5VdbZeQrJ0cT
	BHwSbfEEcKNJe3wqBXUR3iq+Xg0PnO7WJcygck+O/Sxk5DmvDBshfo+KXbuHHb5ICbOhPkcY8OZ
	qYbxZiO1Gm+Ad5uU79BEkCcKEs0l5TJJmWTqQZOgafLOZkAxBEi75RbiEqDHKFoQxS/nPsQ0r8s
	da6GHmSXXKUAY+nbNtPtnSA1kClGvpq+mGuYaQ==
X-Received: by 2002:ad4:5ccb:0:b0:6fa:c697:97a5 with SMTP id 6a1803df08f44-6fac841db7emr19528656d6.15.1748511195795;
        Thu, 29 May 2025 02:33:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA79GLpD3HZiK/IRAurUe6TU66mlX4HbtpUZm3DMIN5fjfS4J9m+gB7K+ZJszdXMACo2cUIQ==
X-Received: by 2002:ad4:5ccb:0:b0:6fa:c697:97a5 with SMTP id 6a1803df08f44-6fac841db7emr19528356d6.15.1748511195376;
        Thu, 29 May 2025 02:33:15 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-450cfbf498bsm15179805e9.1.2025.05.29.02.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:33:14 -0700 (PDT)
Message-ID: <a4c0d421-9062-4424-a750-ee74e2f0407f@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:33:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ASoC: codecs: More const and unused member cleanups
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=683829dc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=b5hiRvTwp8EW11ydFUEA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 0DSi5gcx_x8VTXbvwE_a9p6oT8xFd5nD
X-Proofpoint-GUID: 0DSi5gcx_x8VTXbvwE_a9p6oT8xFd5nD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX7OHzDpZocxTI
 X76mPFpqPjpJKL8gYvY6uxVEqhCWASM9RbBTfwtSkgvK4y3qfxFrKAfSuHrglgujA6FL+OKKh3H
 dgVmPwc+3dZJeDDT+Ld3QDPRXpGbkZ1RBEmaG/MZP6wtkTw9aOYkSuWEeyWGjsSza2ZGQSYSEIA
 xBG9a/kKNnoj6nJ0hFmZHLqXkxUiJeezjvzMV8Xh0+e+PpnP2XLZGPaFakr8W+5n5TAn7+3RAqd
 wT/QJG0lixnjQdHo97sTRuXmGZyUeNHl38bRvFmVcZ7Wvvg4PNpJ70fL4ESz6Ftbfp1FvgmefRN
 lYKOHRFqcfS94TlMsV5xoogNcrwozVf3jh5GtJ5cVrzCy33tAaUAYC12gPrMAB4bGkVX0KUmpEh
 RPXueBGP8SEherH9ZBChE1aKRzY81ct9WEYgAANh/SiUA3FPUPAWIbpMWtrOx0xBKOdqFETl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=963
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290091



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> Make static data const for code safety and drop some unused fields in
> structs.
> 
> This is based on for-v6.16 branch in ASoC tree for context in wcd938x
> driver.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (8):
>       ASoC: codecs: Constify regmap configuration static variables
>       ASoC: fsl: Constify reg_default array
>       ASoC: codecs: wcd9335: Drop unused sido_input_src field
>       ASoC: codecs: wcd934x: Drop unused num_rx_port/num_tx_port fields
>       ASoC: codecs: wcd937x: Drop unused 'struct wcd937x_priv' fields
>       ASoC: codecs: wcd938x: Drop unused 'struct wcd938x_priv' fields
>       ASoC: codecs: wcd938x: Drop unused variant field
>       ASoC: codecs: wcd939x: Drop unused 'struct wcd939x_priv' fields


Thanks Krzysztof for the cleanups, its surprising to see so many unused
stuct members in qcom codecs. Did you use any static analysis tool to do
this or was this manually done?


--Srini
> 
>  sound/soc/codecs/cs35l36.c        |  2 +-
>  sound/soc/codecs/da7218.c         |  2 +-
>  sound/soc/codecs/da7219.c         |  4 ++--
>  sound/soc/codecs/es8375.c         |  2 +-
>  sound/soc/codecs/max98363.c       |  2 +-
>  sound/soc/codecs/max98373-i2c.c   |  2 +-
>  sound/soc/codecs/max98373-sdw.c   |  2 +-
>  sound/soc/codecs/max98388.c       |  2 +-
>  sound/soc/codecs/max98390.c       |  2 +-
>  sound/soc/codecs/max98396.c       |  4 ++--
>  sound/soc/codecs/max98504.c       |  2 +-
>  sound/soc/codecs/max98520.c       |  2 +-
>  sound/soc/codecs/max98927.c       |  2 +-
>  sound/soc/codecs/rt722-sdca-sdw.c |  2 +-
>  sound/soc/codecs/wcd9335.c        |  5 -----
>  sound/soc/codecs/wcd934x.c        |  4 ----
>  sound/soc/codecs/wcd937x.c        |  2 --
>  sound/soc/codecs/wcd938x.c        | 18 ++++++++----------
>  sound/soc/codecs/wcd939x.c        |  2 --
>  sound/soc/codecs/wsa881x.c        |  4 ++--
>  sound/soc/codecs/wsa883x.c        |  2 +-
>  sound/soc/codecs/wsa884x.c        |  2 +-
>  sound/soc/fsl/fsl_asrc.c          |  2 +-
>  sound/soc/fsl/fsl_sai.c           |  4 ++--
>  24 files changed, 31 insertions(+), 46 deletions(-)
> ---
> base-commit: 22d449bcd69e66f25fe847b678738950dcf9301e
> change-id: 20250528-asoc-const-unused-1e39b434e427
> prerequisite-change-id: 20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-0ce64398f9cc:v1
> prerequisite-patch-id: 104000f7254b9cc81be49af9ca584544718e52f1
> prerequisite-patch-id: 230fcd1b712c5a3199e7c9d8250e98e5d55c0a40
> prerequisite-patch-id: ecdbe74955eb7b710f72af1e3cf32ccac52890d5
> 
> Best regards,


