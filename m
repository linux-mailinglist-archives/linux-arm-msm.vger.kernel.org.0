Return-Path: <linux-arm-msm+bounces-63924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 429C6AFB29E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 13:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F56B4A046A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2204629A30F;
	Mon,  7 Jul 2025 11:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBUe/VYl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A627729A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889085; cv=none; b=rMYPxebUSBZ2KyR3+S+UctKE3drWlxmGHLVoDIFPqkdZ7MR2UGiYjacfxwoKZ4dOrZwE6QmNg2JIEFCPWXkMSI8Mm1HtJGV0gup2E1DJVheOgwJqtA+K2/6hXizSurwohCVXore2WzrGS8mcoZUNMRMBb0kFdqji+Fh/omYdz5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889085; c=relaxed/simple;
	bh=HromPgHLGAp6n+vy0foly0fzoT2gC2OfwCflgvtSLU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G0OXgBXBThPncRQQq7m8JMVPudg19Eyab9RllwCfT3XpOYIN24CuGUhgU3kta53iQY4juMz1k1PR+I5IYk3Qi4PDkmGtcozbHlfD5V7TxdOYUuvhtt7C8+VCz4pW8/3iV8h3ZHhjw65EMTRWq4vHz1Ow1WiLvxW7z4UXiU0hPQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBUe/VYl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679bfkL031519
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 11:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6cGMm3qKa0EUKUclROM1+8JzWt9ygh731G2RROfD7BA=; b=pBUe/VYl+wPZoFc4
	/Tl9/YU/Unt8P9CAx7w9UG5AdKPJOkP9wMOIKU2iS2KQViheY3FXvy5D83slwRdN
	NxFpk2SaAOAeQgT4gij5AgvFuk9WD19QM32Pv3XY7c7HsEbbuLP9udcw6s5+0sg3
	2llMUm3BRxA9KUDUqYzFGsgMmTPW2eXgAHJYisrUGA9sTMR3bcR4rgaWnN4ecuYL
	vGCHGfQJ9mZHlqXgjlRwES6CJZQBi3iS8zNFGdlLUYHpGi0Ri4bAc9h/M+4opYPg
	do5BAMLT39MkbDtm62OK26nY0gdrM9xVUq1fyV95QaAFSdMx+pzaV1oPrjq7wFt9
	53IvpQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkcfts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 11:51:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0a9d20c2eso26327785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 04:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751889081; x=1752493881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6cGMm3qKa0EUKUclROM1+8JzWt9ygh731G2RROfD7BA=;
        b=mjg5A3Lz4GFWAulRDKBYmrY1IAOtpcDCJCRUEPklipWuhF9HgoEv5yLPbp94Rvilnu
         4uMQtkj9LdJWlFKXkm4SOMlZNw1icSRoOv9GG9dEnsjudBkbXnD0M2yfBgO1kwO81ldB
         AD7/u1uQCazPz3u23MeLbvGg4wVDvi63zgWi1JfQbTDrrtPlJrjjzw4LYob7LMdyFxvc
         RtMTfOXn186CpJET18tjkx7auc0uNHWMI+ovHJDA4QmkmhE6cGZEJlNSDH7MLV+oOVzd
         mnUeg8P/pDMMcN7lT863MIBj04S9RF0phi4iKSDelt1nXrbmVOIeyISPLfWasgInA/dc
         rX5A==
X-Forwarded-Encrypted: i=1; AJvYcCVoLRPhC3O/YJoGFsYsFpBAk0dtM4FQgNDNT6Ilt1oX0gXlZLZpCCgUgWc5d/O1OM2deOqnmZ04FxGRUWSV@vger.kernel.org
X-Gm-Message-State: AOJu0YxlDrCkohXt9E+T3o1kT6psdr+TjXH5oQgVOsieZ6UZtjkhHX9O
	pK74vmYBVPPtICIFJkAeyQpZFd1p8gPP1/Aj+von2nHqdntOkr0BgE4VdnXUWEAURJXceRDw2B3
	yPZWvK9ILRtMhs71dgtRRyHVYfclCa9lunywqcUXHC7PjCtpupN91/OWU2f4CKseUUzJOws7lLr
	42
X-Gm-Gg: ASbGncswRxpthKLa5/Xwx6l6pUQvDH/8g8YQWQxzpo6C2Q2TqyB4b/d17tgJ7GxdXTx
	JUvznIDHG+oGS+zgsEVz7iFrShftODhvUYeeTkson4AxMPlmAzoLo9OQUKwcDQz4Yvt3Ekjm0jE
	trDEpyXuCraNJkvjHRQYwxTPvmG0qDSCXiMQfsN3j9pIwB/VKVJpk74pnrEO7XmqtAa14fTnW6T
	wo8XlIjH/PfMT0ueGgMKFkVgJ0IC0ltaBpVvgZVAYRxODBAtMoRoalrFoeO639I440U8oK3Ig0n
	uQ6jMPYDSWoE6anz6ZpjyNLb6z5SAI7pGZtZbA3emw9lU9QmmRwYZCbVqINP/qa/O/xn9m2oH2p
	wpB0=
X-Received: by 2002:a05:620a:24c9:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d5ddb72bc2mr535683785a.4.1751889081176;
        Mon, 07 Jul 2025 04:51:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhXFkyLduPc2k4sQvzjIKdtwOsGoaF8niEUdcy13uce9KkeWVA7oKiNmElpE7Y/t9cWYfpdQ==
X-Received: by 2002:a05:620a:24c9:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d5ddb72bc2mr535681285a.4.1751889080711;
        Mon, 07 Jul 2025 04:51:20 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b02a2esm690064266b.119.2025.07.07.04.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:51:20 -0700 (PDT)
Message-ID: <129650aa-9845-44aa-b7d6-5143642f1f7e@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:51:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1-crd: add USB DisplayPort audio
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250624122933.54776-2-krzysztof.kozlowski@linaro.org>
 <fvyx662cayttlyrniyjifu7vi5sflmptzs323wm4a7pey7ethz@o2xq2j4ifwx4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fvyx662cayttlyrniyjifu7vi5sflmptzs323wm4a7pey7ethz@o2xq2j4ifwx4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2OSBTYWx0ZWRfX8+Lt/V6jFd9n
 2lGkxxZ+3TwhplGztKbnE0RDQ+5IIaGlx5aCSPqWZUzbGzoJ7ZpDIKfw8LpJtsWby+czMVDzA0h
 TRAsR3BgT2LvDLp/NZvB/2VKjZnkqQgwne5XP3hAEBO98y4QA3/nBF8pwAlLxsEMqJ/Tju6eYlP
 hBQqpj2YKSxYzt8pUbwboTKM7vosqPSEtNjfg69uIarL66RXHLJsUMIWc/6wJfAUGMZlROMcHeE
 OlaeB/uS3p+lnEQm5/6SvQGCDCTBuzV3A0VciO42YfLBxAqCdrJRkDpYAlpwzKD+IBoRBwGZE4u
 wXepVoaBt5pbLRZbGLcpq9oyk2Ngts+ysYe4zCxatUMPhLGduHYivNNmmmk2Gj2VUw/fWlEWcDy
 6UBWH8H5avdcsYKNRifCjoDyQAMHngKmuqlphjtbgNOjK3RDrnwavApIyqgxZWFj63Fwek1k
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686bb4ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=NHrBlrzgGPaEoZByAxIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ETb7cIq3yrQPREqhOcUTSo6GPoKKkZk9
X-Proofpoint-GUID: ETb7cIq3yrQPREqhOcUTSo6GPoKKkZk9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=783 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070069

On 7/5/25 2:46 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 24, 2025 at 02:29:34PM +0200, Krzysztof Kozlowski wrote:
>> Add support for playing audio over USB DisplayPort (the two left USB-C
>> ports on the CRD device).
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>
>> Changes since v1:
>> 1. Rebase (x1-crd.dtsi appeared)
>> 2. Re-order cpu/codec
>> 3. Add blank line before status for mdss_dp
>> 4. Tags
>> ---
>>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 36 ++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
> 
> Just for my understanding:
> - Is the corresponding topology file updated? Will this work with the
>   current topology from linux-firmware release?
> - Do audio drivers handle playback if DP gets disconnected or
>   reconnected?

As we talked offline, this also could be refreshed to include the third
USB port if someone has the machine on-hand to test it..

Konrad

