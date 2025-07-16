Return-Path: <linux-arm-msm+bounces-65268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 795DDB0783E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 16:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5327564907
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2389253F00;
	Wed, 16 Jul 2025 14:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+SOQg/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F41619AD5C
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752676589; cv=none; b=mNoLp8gb0E4P//MTn5wH/P5rDRewcn9xn0SSodyeIFMHn/6jiZ+5F8Ytn2nJBf8hraZuiBQVzIMVr+6jgi5IS08RCqt0jU1W07N6w3Juumk6aQhlB3FoNk+Erzk8Q++XiwcptrywDfDOJ4kVxVGqysXFlgR2+zycET2pqUtbIro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752676589; c=relaxed/simple;
	bh=kWi9q2Y7BtCTuQpXIsV0qVlJCPRpa73NHUr4PkpWIKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSZoGd6O8aRFzWMhejxW7haXLLrbf0jahYV5nhFra84lxI4JvKokt/dHhFT498TYdh7xcYrxHMnnMHqiEe8yunWFkMy3XpLNaGgGehampbSUq6eDKsI1K6UfPsb/S1Jmu90VlKiLSiUDZcFx2BHvMvT/xTIR85jiXJJsyErSb9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+SOQg/N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G84ocr031594
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yA4UmYowfV6ZSvtoqDZ9mQILLwvVdlfWPK/+o9PtKoc=; b=H+SOQg/NHM9CFRFb
	Kn2gVgKcJwJLi5vLKyZZpivTylywC1NYYM0Es66fRRgrn21qPug79nha9ZwpgpiR
	dJiykYMXPG3dGzxnKuIgADcyOjVnMBOB35H7mZ9uT4Tcd5CuUVL/Oy1RyK7wRAs/
	EWDoj2iaQXjc1qNMUI4atZsQ/TeNvGb82UYD41ziAPTgkV3RLajqoxN/DGQIFc7u
	3tr7W5ki2OLIhtBehs9xkEXg9/qEUgN2zEnEpkPfOSckSlHKZcAQ4HMKkEEj8euT
	+oq5VRU/mzmz0fQOPSOYYTQ2xtYPkA95a4/jmu2uAg+J6AJB7gw3gorx8FyJXEgo
	F/zYgg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drq7d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:36:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab76d734acso16532191cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752676586; x=1753281386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yA4UmYowfV6ZSvtoqDZ9mQILLwvVdlfWPK/+o9PtKoc=;
        b=EKNWYIuW4uRy+Vu5R6PJ9f8PNXA/vB0RLKW6l/8j1Tap6f6y1G3EQf9vFQY8/WwdEz
         mcJSmPl1OcQs4PIoIcq1WqDu9JaMvoQs+oMbfwXsVz0NJz8q8FjfJarJRHgPSeQrOD3J
         mRrlMVLzxeLFq2LQUAChOWh11kNhdRSPza2FKl/V8O2UNKI8cfnSewVKKs4ZI/sFmxwC
         VguG7FX6WjqZ3U5Zja0vTgp3uLrH2o4UJSFMa4B/tEcXALdiuUH8n2/sLm0gkWX3hZPM
         IyEwSksJru94WzfSMM5VBYPZgqrElmQBKpNkK/7azaoTRYzZK/gymCkyLdnwSTgW59Yr
         uGQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx0Mqs7xG9hmClJPalcZuHnu9euW4cVYe/smjhJMZ3+TOujATOJ3stO74/ILsaIUQD9T6tuiKxw/6Um4a5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy47uORVGLOFoF2C4Fn5G/qvAtWo2zPmI9fTs5TkAccSddVeFTS
	Cz1WG1dzcy1b91KVMj1xMz6UJh6UFT60m+lB+U+oNFhZ3gZUU77krUvNL41Fp8NAt4AyjCkEqO9
	YX9m7z45apNtAe7l6EdePLKSsTV0pEQfHacxBvic7HCpu7zQFSw8TlcmvKlXezxfDNIAo
X-Gm-Gg: ASbGnct8ZcVoOL7H6SXwj6dbfA6OWv32fLaNpTTS0ggpI+xy2skHOcmqF/G33RiiZZp
	J2gXJ/9JiIzATa4v7XpkV48Aerx8ON1AtEFGixjqlAk1djhG2xJ4LXPEtuCZMXq5GuDoYrBrSjp
	Gwb7kv/gFSt7DG6P43n2cPzdfKjd3aOKrc43bRM2hvojmCuGKAvK/LU390Ai207toDGv5MSbIRP
	mVLwBtvAR5Fr+iWKrB9z5dSoWQKrIWm+uPApvYyNv6M4FkPX0FOqEe3sOCI+PivE/53Rr2phlqB
	GNspirWINvM+2nmb58AHxrgDFxsWvyP8a4nJFKTyQS0zkPw9+65Tc/JyVhp7LIxB9+8=
X-Received: by 2002:a05:622a:4cc8:b0:4ab:5b15:fdb1 with SMTP id d75a77b69052e-4ab7f9511eemr119396411cf.15.1752676586197;
        Wed, 16 Jul 2025 07:36:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi5okhmPc18F4MSl3Ewd57VpwWpM4vQ1vHWNcrZD3NgHSt79iUlTK7PnkvhFJVebZUhBEygw==
X-Received: by 2002:a05:622a:4cc8:b0:4ab:5b15:fdb1 with SMTP id d75a77b69052e-4ab7f9511eemr119395741cf.15.1752676585545;
        Wed, 16 Jul 2025 07:36:25 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm18418111f8f.38.2025.07.16.07.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 07:36:25 -0700 (PDT)
Message-ID: <6de11c01-5b59-4222-9f4a-c951c74f0128@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 15:36:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ASoC: codecs: wcd939x: move to using dev_get_regmap
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, neil.armstrong@linaro.org,
        krzysztof.kozlowski@linaro.org
References: <20250716123323.5831-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250716123323.5831-5-srinivas.kandagatla@oss.qualcomm.com>
 <9f4c750a-9e23-45a0-a761-4c3fc2c7d8c9@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <9f4c750a-9e23-45a0-a761-4c3fc2c7d8c9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NQ5_Bu_LAIp4Ce_PM_I8yUvc-kJsCyYk
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=6877b8eb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=iuNjYCSt-HKeNY_OgDcA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: NQ5_Bu_LAIp4Ce_PM_I8yUvc-kJsCyYk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzMiBTYWx0ZWRfX+0OShOJwQ5yx
 PYbGfnuCzqxAr7OiUrCeFqr77hGZwFZzv4HNr8ZWzJDc1zx3M+N9kLD1FeiL1DpU+wbWdG0IYYH
 ekG8vcK566za69aT7ttopxHY74yf+M3dKQqlDhCpv2ilvK7p7QFJOagneMOcHj8rk8KMGMFSTk8
 /WkkW9WD82Vd8G168yPEvVSu7RoTYCzXmAa6Ac7p4qtmaqGes44yFrxykegfWNWDOv2bzV5bOhE
 dJ7bYKsllgcj2r3tKTpiZWLp0oFDrQH/rlT8E/DK67aKb4eTCOOvxCEJJMFONiB4+9zwSWKOkGM
 sStA98zEQ4Qb7CCqtoxAzY060uZ5CDS5LLOVI1CqnxjrTYNItb35Meb1oW2r2Xaz8Ikr3OTs9I3
 w73aLwDhgBnLyk23sMY/prFSx2YU98ePXnUCS0VUOlj5v8AQv4oxO5r66xB9Az2Ku/1e9BUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=705 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160132

On 7/16/25 3:31 PM, Mark Brown wrote:
> On Wed, Jul 16, 2025 at 01:33:22PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> 
>> Ffor some reason we ended up with a boiler plate for dev_get_regmap in
>> wcd939x codec and started exporting a symbol for this. Remove this
>> redundant wrapper and direclty use dev_get_regmap from device pointer..
> 
>> -struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
>> -{
>> -	if (wcd->regmap)
>> -		return wcd->regmap;
>> -
>> -	return ERR_PTR(-EINVAL);
>> -}
>> -EXPORT_SYMBOL_GPL(wcd939x_swr_get_regmap);
> 
> 
>>  	/* Get regmap from TX SoundWire device */
>> -	wcd939x->regmap = wcd939x_swr_get_regmap(wcd939x->sdw_priv[AIF1_CAP]);
>> -	if (IS_ERR(wcd939x->regmap)) {
>> +	wcd939x->regmap = dev_get_regmap(wcd939x->txdev, NULL);
>> +	if (!wcd939x->regmap) {
> 
> The existing code should be more efficient than dev_get_regmap(), the
> latter does a devres_find() to look up the regmap while the above is
> just a pointer dereference.  It's probably a marginal difference in the
> context of probe() but there is a reason to do something more direct if
> you can, dev_get_regmap() is mainly intended for generic APIs that get
Thanks Mark, I did not realize that dev_get_regmap was devres search at
the end, Will drop this patch and make something similar changes to
other codecs too.

--srini
> passed a struct device.


