Return-Path: <linux-arm-msm+bounces-73087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81320B52D3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:28:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 990CD1C84E66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 09:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C8A2EA15B;
	Thu, 11 Sep 2025 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABHhAm5P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431581B87E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582935; cv=none; b=hl/sZe79cYY4KR3KlcLX65GrvAFI2jH5wrefPUZY2sTwUjyubZoyRvIcD13Fnd7rsQuHFX8LR6Kb5tG5GjIIuksflEFjEiCwcRr7prmppV31+FbhcFVZhlkwc0DWZQ2+8xcUCfGTRhrbaCTk/53o5enkPsArxWj5vtHSaJaPeKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582935; c=relaxed/simple;
	bh=KD8XzX53ZmBJU9dtZpfXx96GNYsVRHlLrpvx3RMeack=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZ16MTgdW/7FXakozQXw6FLwFCkiiAc400NlcQjjcSJYirdVs0WrohH4P5lauq5BufqtA14sCw3Zgree3yy6KezMuwT0wukRoASNv0FMjdaX1HlNPvCQTT8R7VUL35lskQ/idXvO+cWdSKnptj4WMfzPHBoSNX0GS0rk3hl2CQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABHhAm5P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2JGVg003429
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J1Zy2IIse0cQ5PgkOq++oOU/mEYxxQU40ZnpePD/+EI=; b=ABHhAm5PSuomPLY/
	yQSfc7RJ3iQdGrQ9WzzBisarDOLEOq226AkeRvhnYMjqtWX8Heb9So1JSl3lLSuv
	ObNuhOHc1HTAnx5t4TirRHNST4jcyMhg8B3SzOAVNOoNoTZG6N7AmUoO2f1KiIKW
	xT2iXz3JPp+/ypJsvAPh6hAbYv6e6AtUqNhzoAp20yhwojFDS4Y/4/fshoF9LavW
	spare+qMKriifUBMoE1nl0zi542b/1mYlKcWgdeKvYyYR90bZ+U0yRR9ojRqfETM
	EmIqmQrDSIv82j5KQGB2V2Xjr3UFBUo9jXz/d1u2Ad3q0Yt79Id7eTW4MutwLC+F
	Cfd0qg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8q4qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:28:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-721c6ffab9cso2222436d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 02:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582932; x=1758187732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1Zy2IIse0cQ5PgkOq++oOU/mEYxxQU40ZnpePD/+EI=;
        b=tMkS2UcJEjS4Gbd5RuIW/gUAB64KD6hdV1bpwV58CWEMX3ZhQNeoohrtUPKFTfjycI
         RRC7aWpJtRy+d2L+fURze4OOsypBCuQ4N8rIPIYoFb+jJo7RMBNYfCWohCeQJj0bHzo3
         ThlAVVZ8gDrU23pSWyBE7R5vi8dm5d3/psB5+OTygz1obtl92RkF91eh71fhUIour/ht
         9FLnEYN0YGz4Q2NoVuUs5zIe79SaqE4VProXLHKUMxZw30Ahf6559wVsAeo+nahD2TWT
         Q64xvbukFYuEGANkS3fHGBbcwHHRYQoORtc1rspOdXJOSkF+jBaPmJNrl3p0oDidrvR4
         oRJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG/QqpRFqvlRQ4P7DtAlNCbGSGUMml91j/u5gifn1gXdkpH6M3c21O9lYOxUwWPEtHv/OdXtJzAXJCjocL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd0sSfAHqMbPJ8FLPL65+LabHsd7YV5GpdaEoLRAnR334CHgxR
	rZzq06/4qdDfsQfk709BdR5ZTkc5NGvHmzLELwEdXL/lDIEzUUJC9XyFgocQSGrrFmf7aG3f3B1
	TJbhUmyQzvo3ksjz0kzWM9d8zwtk24EHvkQmWztjiQ0gSPlrqI2pIPCcaBHFCepkdIswo
X-Gm-Gg: ASbGncuv4CKBEjH+5Dkem0i176qaDpubJlxygq5erx9oj27HxAKVLNiOmGJnEgp4+Jl
	xOHzDHkOKeLmur3FMsenhzkzOTtCGpLjA8xIG67y/HImUausp7STg6O2NFHnjdC6ybJ9ARGmD/j
	/qVVYd/eiYWADi8FMLR53KkrKMlGx4zf5J7ARupfMKmxEnHZQ+WgceKn4anr6bMNnD0/gY2cHX9
	wkve+DzIO4+QDCClsOJIGR6L4lI5teqiuqPeO+FTdknE867USsAKSY62YuQe77lKWHs7y5TDJf8
	0NAY4M2DdiVC0vMh5JdM8/jvVhR3E01VDkNbPSSOVWg2FGFN4tN6Ozl+EryC+NzzcBAqfOsVIbq
	6exSYGsXYRu4/kGAQIrseBQ==
X-Received: by 2002:a05:6214:ca5:b0:70d:fe22:9aa4 with SMTP id 6a1803df08f44-73946f70a6emr128381326d6.7.1757582932165;
        Thu, 11 Sep 2025 02:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBXOG3igN9/8DJ7fySlrmK7tv4Ls0GjxhprGiIYCJToIxRWEwOOX26rhYsv/1MafCZvRPumQ==
X-Received: by 2002:a05:6214:ca5:b0:70d:fe22:9aa4 with SMTP id 6a1803df08f44-73946f70a6emr128381196d6.7.1757582931744;
        Thu, 11 Sep 2025 02:28:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec33ad6b3sm803237a12.20.2025.09.11.02.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:28:51 -0700 (PDT)
Message-ID: <5272c3fa-05d2-43a7-941b-759f46f5f02d@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 11:28:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] clk: qcom: camcc-sm8250: Specify Titan GDSC power
 domain as a parent to IPE/BPS/SBI
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-6-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXwDX/XBTPgxfO
 D99LcVlcPPtvDhSFQygnNdiw0hzs97SvMPhZyio2XeVDkkDdfk9pT+P09r2Q3W2NpN9Yr0Jdc5B
 DcmhV/q1p8D071st29Hsl3pX6yAZNIca5TCB69xvrhSh0hkBU38PjQ4q37FhTkth4JkpHPxp5hu
 OK/FubFdkpkowc2RgtOeizAKxJyGN4eFQIRU5EvcMMn7qCR22MCJC7lgC/7ZeAK3BJw/Ou8qbI5
 nXQukzSjzzs3olbsXD8sEOIBFGOHa+lRrZPfWG+dsABlY2MvKVjPBfXLcpEuM8kuQI+JdL++gwP
 wozT9EAqyHa3XdAj7p0BY+qJgZQbw2T/lk7wUbSKVHhfLY4eGmiuky+qloe6aM3uZX0R+sDulrK
 03qZIYFh
X-Proofpoint-ORIG-GUID: G8U02xSpkCsKmUHc1UWBikHvZE6TmE6s
X-Proofpoint-GUID: G8U02xSpkCsKmUHc1UWBikHvZE6TmE6s
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c29655 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=LDDDIuMr0XRAt-0CmwQA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On 9/11/25 3:12 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM8250 camera clock controller, and it should include
> IPE, BPS and SBI ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

