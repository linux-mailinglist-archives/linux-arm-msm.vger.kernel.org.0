Return-Path: <linux-arm-msm+bounces-59805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F16AC7B18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4674650062B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 09:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768371FF1D1;
	Thu, 29 May 2025 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9H4KH6w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5F621CA07
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511092; cv=none; b=LJz6RcIWCR/Eb4tUst4OTQ8dkUxQRaGP0zEwdYOwJMniWNMO/Rs6HMyJQslRzas4ghvSY5uptIRIYO0TmeF9Wenm4GCfcLNxprYuatnS5Jl5xBSNc43Z7heV9KKsq8w6V8mDbA+Gt2mikHX4+R561HSybeM+Oqqwdj9yWbWiKHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511092; c=relaxed/simple;
	bh=x1VRGfZYgMo8RCX4BaSZc1zb6VYt1ma+2qcQbg9CNZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffmxbq15bJCTso+nbT0BluCiZnpxD+yQoO1DFT++tHDOzF4fLW0B7j8BC7qXwKBRtx63aUwH+fsXDZLNqv0as1RBpDgwV2NVtYCn1prQrVx+6WYfVFA6xJq1WLt8jx9dByy0kR2zUtD07Cu41L3h/IdVWtlC4Rae4PTNFRTO8tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9H4KH6w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T658tm022539
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vLTCWzEXE+0HZ1u0bqBJ2IBPpaWlwV44urwDNHq0CKU=; b=n9H4KH6wZFVqFKwC
	s7dv66wlnKp0VNBOw14X0mPYF74fu9KtGmg4Uv0OcejZc3yeAOMYTfEOwP8kTydW
	nFpx2A7/8MULdwqEZs8UDrrK18raxPg1BlEOKkGryJoIlfsYuL8bRcjnTHlP/bjL
	bqOCuMuGt32nsSjCQN2ar/xe59ABK8b866NYCftHyRKX+8x+X1d7sY9X9oq1oMiH
	YjDr8o2fUgnqNnqINFhdkAXhqOP64RVWPR8jvJbb1+pwtE9o51zkN/1J7wjiNsU4
	BV/+Jbsc2Nz1Flrhj51rZaUiAoxqlcBtS2vhdKdYoR9v4OYbF46W/eMjmBIGYCWV
	m241Kg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x6xca5pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:31:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c82c6d72so133865385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 02:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511089; x=1749115889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLTCWzEXE+0HZ1u0bqBJ2IBPpaWlwV44urwDNHq0CKU=;
        b=PslOIiA9HwNBy5gsaIk2hGC3nfkC0a9GWT8/wV6HLiLTTiNT+wmopzAu4Ec+/Mwp6/
         hcTNJmUBazkzLy/H60k42rbOesLKvt1N1/rkfnUHzqT/HFU6bD89HzGeFyX5+1o4GZZi
         XfEfAk1nmeMZf1ZaAWTtybaRbM0VQl1JeNzDAJOJj1iAe3jsxWvBCp0PiCCHroNqMBEK
         +YytORJBWq9PyljwF75jNkgZRNypqbu1WwaIwSRyug+1fMt2bVQZGV1bDhfc1WQJJGQj
         XmHumujX5koTlkBUiMO20O8eDz6PiakbAP92EQsBI7kXsMV0GEsLVuiEaAzFEEu5Wkoa
         ybhA==
X-Forwarded-Encrypted: i=1; AJvYcCXgLaNKTN9ZXVQO1HkhqbC+AVVtuGTXecM9rkrl9fEvLzvfwdnwzAxzmMWhY46L2g+ES9Ql379S/AKCFxyC@vger.kernel.org
X-Gm-Message-State: AOJu0YxXnSoaWs/MCCGI/fw7Ouh8NOHTvbQHlkYmlnoAhg1T9KQC00WL
	gSrIp8sTP6J0gba8OL9oj8Gr3U4dQQzqiCyAZ5KNO08pq4rLW/b3j8/yTxRYm8I5Pf6URZ1vvNM
	wLVGZZSbWm0y3WZNckp90nnb3xbOPhBTfTo1w+J5ON6iUFUpSC3QdpBJL7gyoHWA8F9is
X-Gm-Gg: ASbGncvAzZZ43QgDOTcrjl2/WjgqWsv8YbLa9OfzBoqc53g1i5YnCl3XeQfPVWm1MbG
	+egVS0TpsZLAztpuyWLnRZ6jj6Tl3Uj20B0qSf9Y6d9OI27CILVDHxY8Rh9AGLnyXgKKnhQDrQH
	XZL8Evu66vHQFqRLnA1Pv+Si0MM1BetbtT4awSTRF9d7d5Cu94dhRpejeAmxdqAG/AJbJgktpS7
	AGGtJ8+rYQJyVZb9zdpA2uWkJp+UVztYJ7+HQn9oycFdqCnPldtqeGEn3cQeUD544VLNfCv6spj
	rhkaGvv6Y1efbrdZf2vaAGXFoGMSRRynSK/dOg==
X-Received: by 2002:a05:620a:25cc:b0:7ce:bdae:8a6 with SMTP id af79cd13be357-7ceecc02e2dmr2847327985a.7.1748511088820;
        Thu, 29 May 2025 02:31:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBbOrTOd5S0R4NHuiIM3rmHA/A2xeyEaZjKpqahVp5pD1+DlUILFY2WUrOeiPk48+sME58JA==
X-Received: by 2002:a05:620a:25cc:b0:7ce:bdae:8a6 with SMTP id af79cd13be357-7ceecc02e2dmr2847324685a.7.1748511088454;
        Thu, 29 May 2025 02:31:28 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm1414133f8f.26.2025.05.29.02.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:31:28 -0700 (PDT)
Message-ID: <3cdda3df-a2ab-45e9-8e40-988310c759d7@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:31:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] ASoC: codecs: wcd939x: Drop unused 'struct
 wcd939x_priv' fields
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
 <20250528-asoc-const-unused-v1-8-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-8-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX8G54aJjVc/zW
 dXH/4DGEwh2GhaPMk0ElThIyXUcL2ttlr7MMwthGQUYMEecZ0rOiwwrPeuxPlcCO+BVoR/GQqHC
 OgQCxbloLkZ9z0kpCN6RDXFmISBTsFfcJLGOdPJl+IwdG7mo2tXuY7tJQ2d58l4fpz+RylRaFkY
 wlMcwSugrNZTD0dmxe34hsVBc3pwrbuSFqY8qSCwNGoWQQnYyxcWjz2Rj7CUKA26YkC615M3SMp
 lsmQst3PTsqIz4L/lBF+msQ6gbLsw7LQJuIKKr//x8+HLkwHd0qD9FB+Zq5fT8cnC5Qx3cJFQGy
 EyyCoyKnTXmxRGIm5WLrJi+Cm/fkRocRUz5jOqAucwIrWpQHgfJNkyBc2p+f8POTvfOZXft3aeB
 9e/FqXBXuNO3voEMEWp7LQJibzA3VlO8AJub5jIjCL81zITvuPUXYehUke6hAnPlfVu3oaX3
X-Proofpoint-GUID: q52UCj4SU5UxMdwkbVUCMvnsTa0yKVNF
X-Proofpoint-ORIG-GUID: q52UCj4SU5UxMdwkbVUCMvnsTa0yKVNF
X-Authority-Analysis: v=2.4 cv=bupMBFai c=1 sm=1 tr=0 ts=68382972 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=RFI1buZ0A4s98qjrA-8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 mlxlogscore=844 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505290091



On 5/28/25 9:00 PM, Krzysztof Kozlowski wrote:
> 'wcd_regmap_irq_chip' and 'jack' in 'struct wcd939x_priv' are not used
> at all.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  sound/soc/codecs/wcd939x.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
> index 067d23c7ecf90ae06da1ad6cc89d273fb7f7f875..bfd4d2c8bdc9bcfcdbf673d20458f779922eb464 100644
> --- a/sound/soc/codecs/wcd939x.c
> +++ b/sound/soc/codecs/wcd939x.c
> @@ -190,10 +190,8 @@ struct wcd939x_priv {
>  	struct wcd_mbhc_intr intr_ids;
>  	struct wcd_clsh_ctrl *clsh_info;
>  	struct irq_domain *virq;
> -	struct regmap_irq_chip *wcd_regmap_irq_chip;
>  	struct regmap_irq_chip_data *irq_chip;
>  	struct regulator_bulk_data supplies[WCD939X_MAX_SUPPLY];
> -	struct snd_soc_jack *jack;
>  	unsigned long status_mask;
>  	s32 micb_ref[WCD939X_MAX_MICBIAS];
>  	s32 pullup_ref[WCD939X_MAX_MICBIAS];
> 


