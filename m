Return-Path: <linux-arm-msm+bounces-71776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7F9B41A19
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA5F04E4898
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C05E1A9F99;
	Wed,  3 Sep 2025 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6N4G+q2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28782AE66
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891923; cv=none; b=t2coktYLPbUfQaRcpx3xhDeEN0HxwCimRB0Qm0kCz1IQjxz7PgaNSelgj8rXy3rq+IMG6BOOokaumLLti98Sb9x1C3dCmzv4UfKAfFjjE6dsOPwwP6L9VKtpM5rYo4nDwTuvp9i9grWMKDdB2/MPoLd+BK23lb+2qjix0cti/wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891923; c=relaxed/simple;
	bh=f9dwC+mgX7pffl+TR2sx1UfCW1VDF+yFerQJW4M3mi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fasiROnBR/KsQQqAnMhBqFl5Dh47xpE8ah+u4O7OXxattAEmefxOr4TLCPOk9RrqVh3Y0sSjKlG1Qe10t6pb3CO0yWJW0lJmZjqDiFmfSximUBob/FM1+r1NFLEZCqiQpEQdB+6FkvFECs2owfKqusiyIseuRA8RwRTG2hqPxLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6N4G+q2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832Lp4D024617
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 09:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTJRGhJx/cb5W68b/kzmKsQxYzcRko2SczTJfWZS1Ic=; b=c6N4G+q2c/S/+FYG
	m455NKQjK4th6h+2LB9tRMsXdKqVmaLj0xs60eVQ6F0TeW/8WWe6u6x9tDfw1pB4
	pdLyfSZoCTiZ95zwn8ES20C6RBcQXpXn7FTA6FBVISb6iEIThFLRy17f5c7jcENs
	jjUZTQxT3h6TCcp8rxRGADqMxdpZuP447oBMm4/hqkxIwIlPyaF6D66GNPqahO8D
	CbJzHTd9NT2xn9xhHkV1Wf/4mQVWzwWDt7hID2g/a5RX4ed55JbGerFM5OoaFDDW
	UaTmdnnrgrGgG2jVLvBmNTtiCy3Kq9/zcFRLuv0OEwxKjbaqcxFfX+xm4HjYdrWv
	0B2sVw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush32wdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 09:32:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70dca587837so7989866d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 02:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756891919; x=1757496719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTJRGhJx/cb5W68b/kzmKsQxYzcRko2SczTJfWZS1Ic=;
        b=lg5hae1r72Kua7iHMEFEyFMYmNNOP40gT32gTCIBVgW433Xa2snYUKG6nVgjmpN3Jh
         h1fZECfjfjpcLe45hFRtAHmHsCCNuwSChOfrXvU+IQ1gIWv21UMk07aWK40so4qBfsmP
         WrSq5D51iRQjUHXZOvrxn0juOV00mDKtNUJTEPT0IO7HzF7CZ0IqU2NoxDiJHx7IUp81
         4NzwvJ32jtTz+gK5Gi3+owoimjpF7RNyj66AWkVqzqNSq9ly3FPgcS6Zl0/2bqQeZQ35
         JWwc/G16Ta0Uqf8bJbM4V3/py/zof7UlsqWNJSXfolnqUshdAgYJAclEjXQ0T9LWBdVu
         5+ow==
X-Forwarded-Encrypted: i=1; AJvYcCWcnftcCd9fQTYsjCQwtbPz0ZCkggiNDLLdzi0VBEQqZV1WhrN3E+Oo7uonbZSij/0uRWJ7WxLUOtgwlyiT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+s3tHaK1EkmiWX1NP7x1stBGSwfZAHABRa9qRrh4b4/4iecrG
	FiL+q7Vtti+vko0RZQN7BTVQpDsyUfiBYU/+VSQVNmB6SMqpylczE/2eaPj6714bGFNWZGIacEw
	dhLdiiOvXr1FftL889+rgn8hgcMkYNxYT1cAkZaUFXojQMvgaSG9X/iKRtjkQto+ss4Wg
X-Gm-Gg: ASbGncu8ZIlFJdn8Mco7ozdgJ0mGakf6WRjfHdqmTLS26823JNMsm5Kbu8GCOfYf6An
	xcgfY3im12HTtpP0FO3eR7JqGlLeV1IuswTvG0Q4mFHd9N9N9M/TkwNbsjL6ug3qYTXxDRjT4Zx
	6FPjqqDdwn3YYGKjuwD/dbcZcqXQDVwjBYFGcBND9kv7Zeu5pT6lFeEwhIOahWY3GbkgLSvXclX
	JBv94Vb6kX2iZE0EItSH0xpNlurswiKbQE65At4gq8GqkxqcoIdV1h1+TAot8luZkumHl7pmIIP
	TikfASxd5wXhUpvq8cGTiHqClzcYntI3vV6Jhl2uNtQgl5c4DxLvDseKcVou7RpLRU2kSD+vjDK
	9A5xeigvJ0Uyq9X705mdDFw==
X-Received: by 2002:a05:6214:29ee:b0:718:93bd:f208 with SMTP id 6a1803df08f44-71893bdf258mr71701576d6.0.1756891919461;
        Wed, 03 Sep 2025 02:31:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/DTmcbgLY9RBZ4w2iRzSeSUgH6/An2dVsN0QDNQK9nr/GKn1lX7eOnhkKaQl7A1U+RdSxsA==
X-Received: by 2002:a05:6214:29ee:b0:718:93bd:f208 with SMTP id 6a1803df08f44-71893bdf258mr71701446d6.0.1756891918980;
        Wed, 03 Sep 2025 02:31:58 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4e58aesm11242665a12.36.2025.09.03.02.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:31:58 -0700 (PDT)
Message-ID: <d2d01b40-677c-4ad7-9742-29a40082f40a@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 11:31:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: qcom: audioreach: Add support for Speaker
 Protection module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250821141625.131990-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX6ovl+43RS69e
 /+5olak1ezMLvxM1BeYjOMG7ehqNObs8YPlF4+qqmpWFJJAF2+V0aJSLdZrqeNCMcO3d7ouFEfL
 9j9U8aOd+dZS2q6F3m5jOAspM8l5tpyBsPegknRwvxm3SRWKX/8UtkAZtZpGAsMljSxLiCdBnaK
 BBrv0sJWIO9Xj8ent01KW4n25aDA36gyPgKl/B2qXkIQUhWdTwE6EGM1jx3xRqExZNv87XX1JFE
 TV/Yf5F+5TQ4qqHE36xylctIkHDo5if763SDelUYRn8xtUYVgibJJarjLLOYOAFZBAz+4EYu+6A
 pVBVQKFot0rKRECpR4CbmjEu25XGXh4iV5z9rvC5zRvDT+egDMGtI5bA4b5F2M6Z2Sui9WhEPeG
 S/oK1j9k
X-Proofpoint-ORIG-GUID: ODfAOuo7KuSCzXXJd1cF12ppFqQENP1z
X-Proofpoint-GUID: ODfAOuo7KuSCzXXJd1cF12ppFqQENP1z
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b80b10 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=AFvlZMtuCSXtLM_4ds4A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

On 8/21/25 4:16 PM, Krzysztof Kozlowski wrote:
> Speaker Protection is capability of ADSP to adjust the gain during
> playback to different speakers and their temperature.  This allows good
> playback without blowing the speakers up.

exciting!
> 
> Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
> and sending it as command to the ADSP.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> +struct param_id_sp_op_mode {
> +	uint32_t operation_mode;

"u32"

Konrad

