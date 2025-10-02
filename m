Return-Path: <linux-arm-msm+bounces-75791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 074ADBB378B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 11:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75C1D189C46D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 09:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCC12FD7A3;
	Thu,  2 Oct 2025 09:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onyGy9W7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9FB2F39A7
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Oct 2025 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759397830; cv=none; b=SL0aOKqrEYQ0gYWMQGa0AhitwAzRhUpI/2z0rUedgqiqn8E0lPAY/J1BxDbmyxfplVa+jog+eZL4uDzsQXJnWC3VKR3UMZZZyt+2XORETrvS6FW9PNc2SFs94nZ6G2wG6p5RYehES+ICK1uzLEW2FqE4+oUte8zDDCj2RalFbpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759397830; c=relaxed/simple;
	bh=dvC5aj7x6LVVGqVL6TWGGwvsTPpa+pvgVq2m9BKUMe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r9MA2Dweekgymb4X+iijBrsm/47DVCmjP7gVG5m8Tu5M9p/QauCBKS4A34/Z4B4W2kcUj/k2qmU+UzNa3jBaM8KtDxtDx0eIVnWbH5cQbpgQGEY39UbxwrqSbWx1cGohlHeDG5a+iW1FXuq3bTrBs8CEPQ3wUGLeyYiQM/RGG4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onyGy9W7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5925kDpw007785
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Oct 2025 09:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3s3Qu466iD6u/7eQr/tGTVs0AQ4z16vZcusQilCroYY=; b=onyGy9W7e/rJQStL
	PzsnFvHp0TjBRQpTzbqblUo/aHdg3VlWQlDENMLelgTgdxuRODer3IBAd2Mh7Iwi
	BFlApNVqeWAXqi7ibjGmH3cM8sliDqANrect+O3BMKzvRjBEUi/11yGp7Uu3u4/J
	ju8TZfxLDbqNPyzJxREL+bTx2J6snJTetrFzY1FPJ478D9Ecs5unP6PIkLh3Uepj
	82IyercvLdYkTo0Eqoiinwxr9qjRmLuPo9E+gWH10hBjPtIJu8/xecFfSkz1U144
	BlA2bzAfAa5IxUtN7N7SHg9tmANq363UiZCqjetybP1WgPObo5VxG2vLFmY1myxn
	hhI2JQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49hkhh0hn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 09:37:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-873eac0465eso2479966d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Oct 2025 02:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759397826; x=1760002626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3s3Qu466iD6u/7eQr/tGTVs0AQ4z16vZcusQilCroYY=;
        b=jBmfd98VthoOX/0bidzvEwn5FBRatZJ3bpUFYKoF5T0xsFj9kEhklldn4B8zwgEYlU
         41fK5K91r1EscN9UvDyHN2aSJC1EoYMxMxq4sAYFXThZNBUstGFzYCbM3CX1KlcjJYx7
         YbhPg7+dFaAtNfwkNk2I2dLHuOqbLV7Q6qbdUOiPjAnWQYvj9pAP3Fm9qvWIXg7Hqz6L
         vP08U01Y+le72B6Ubynxx/JG8YeW0Rnf5kSu9OZMRxDnheaTxDgWLZTR7hTGlGk39DmL
         ZTSIy0g//GI7xUqtENkk9W9GORtRWdfY+WUM1bXZrnbb7Mm3crpv+ZlsqiZJhDmZy09Q
         8ACw==
X-Gm-Message-State: AOJu0Yx1h6Z3hJHBiMMTCVcqaDj0Gzsh8VcO0+RNFAtxxi0binbrF9Up
	xTz1u31e743RS0PJED6CW7Kjccg4g+cC9aROnkY5YOIScmQF1M8hAnVa/Y7rt7zBE1de3lJ9K9M
	B9WugJTrVzpI3aYRNVGTZwhdUOJLF/oB4Ubgs8orFScvAiPTeNS/w8bznAgacctuqPQgV
X-Gm-Gg: ASbGncvZ/2UaPRxG7vmU77gZEz9cgFPN/q99bq+U1ixoJssfZ2QoUzOBLvqn22KCaFc
	rANJA2lnUpC1LZsqRoddkC199cXa3/QNB2I4iresPGE2xTn5dH7+NrDJY337+jCZK/pcQG3eVjo
	TAcUtL/7ZP6sjpT1WZyrYHiRiWavYILLu1tFWX23MjvywkewJiEVBCDC61Pqk32f4TqB1NOxKh5
	3gZMpQeAIVqXS6fcIl4ialb1Q7SCT2ApWusgrosi0gJoypt4/tRyLoEqrSm+lsCBrdfgOEZ5/Ba
	/a/1jO5WiEtvZGaAZGuD6lk8NRCKyQQme6IzL3QTgIf/5lJs+kw9I+CtcGgpewVGFTyWgPM95Ev
	zatkCO6X7s5g8Tx26xWr2uwzze1c=
X-Received: by 2002:a05:6214:5184:b0:789:e48a:fc05 with SMTP id 6a1803df08f44-873a5b356a2mr60282326d6.6.1759397826315;
        Thu, 02 Oct 2025 02:37:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErl72Ov8A6h6hpFWJYLw4FLn8Y45zGs4EHrpv/AiJf6QoFNUh1bWYskfoORIRZsVZrC/1sFw==
X-Received: by 2002:a05:6214:5184:b0:789:e48a:fc05 with SMTP id 6a1803df08f44-873a5b356a2mr60282166d6.6.1759397825670;
        Thu, 02 Oct 2025 02:37:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788111f1fsm1501744a12.36.2025.10.02.02.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 02:37:04 -0700 (PDT)
Message-ID: <7661d9d9-eca3-4708-8162-960df0d7f6c7@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 11:37:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
 <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
 <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 84RLXm9YLqbtd4mcCloARSklc8rJMsBd
X-Authority-Analysis: v=2.4 cv=cILtc1eN c=1 sm=1 tr=0 ts=68de47c3 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=hUOHGeh7YKFiNrxugmEA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAyMDA0NyBTYWx0ZWRfX24ThrX3YXqVw
 nktJi3g1fNIxerh2lBmJZGLnay+xMcskQx5oE6dmjZuCWwgTLAavm+fpDvPF0NTQfouGpzwm0vH
 w4VZd5oppLxsPH3FdZh34j1N8pBHsybBciZ7yPHtp++WdhXfL7U9siKzaaHdaMrTzUl06XfEAJi
 68af7pbmbg2nsibaHB+5XDd9Pi7CeTVnMHg100VkuhTGTrrJHiBWG6cbhluf7BdfLv0GTT2udVW
 Y0rv1UeRE1leSugeEh6fXbu3PJFVZQ94xorlq30+cPrTyt8skqrTLztKQhU7addcHtVDEVvMhcO
 nep0+uYEJpE+QYhywXXOqUIySaMUqIZJTJVWP+6L1qPSv/5kCted79jQIsSWbQLHwI/aTXBmpKa
 MbKByF45mEocB9wzcCtSFtjT0kd8/Q==
X-Proofpoint-ORIG-GUID: 84RLXm9YLqbtd4mcCloARSklc8rJMsBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_03,2025-10-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510020047

On 10/2/25 6:51 AM, Paul Sajna wrote:
> October 1, 2025 at 9:14 AM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote
> 
> 
>>
>> As the dt-checker points out, there is no such property
>>
>> If your wi-fi works regardless of that, you probably don't need
>> to set the one you intended to
>>
>> Konrad
>>
> 
> Perhaps this only exists in the postmarketos tree, but it definitely exists, and doesn't work without it. I'll remove it for upstreaming for now but hopefully someone sorts that out. upstream.

So you didn't test the tree you sent? :/

fwiw

drivers/net/wireless/ath/ath10k/snoc.c:
	qcom,snoc-host-cap-8bit-quirk

Konrad

