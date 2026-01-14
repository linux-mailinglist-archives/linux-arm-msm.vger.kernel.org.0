Return-Path: <linux-arm-msm+bounces-88955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9A0D1D688
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C8BB30124F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 09:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E67387349;
	Wed, 14 Jan 2026 09:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+L33i3C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jSQ0/ral"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5093815DB
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768381930; cv=none; b=kLpB1fwd651orykDBnvsE1FlcSxbbp2BB/z6QuN4uw893V+W/whKz4KUPXrkapDUeHW5XD1ePwUHcYvE/2EfS0kepWTeREN2tlbemDv7TVMo8i9FufB4Okv85v9mnfvcvL7BtSvmZquAMvhtg+VmdssJqsEGS9b6YFyx9Iw0ViA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768381930; c=relaxed/simple;
	bh=+ayhbcd9q/fHxof0pyh8CTkl4eiG5bycRR1DbZhl4RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QUGeqW2MVUEsKI1rziHLbUguo8KdPNTgu9IYeObdJF7B2KFq/NLr23CpqyTe2BTOiooJQB0TqlLQpw8XzW0I6gJbpb5YKjQlHuY7EiQud3RMlsl6qFaG6WukuL5Ak7Li6Btxjeh+1++klgAqYmWVpSGPWoeA36aP6QZde7X0lRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+L33i3C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jSQ0/ral; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jA7B2587358
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mgm7Mc1dv0cQ6pSRhXf40lbereDDywHEiWJaC4Yj7A0=; b=T+L33i3CwfawDfHm
	kZJ2hkMOxFTBbHpBYe1orSMIBN6dhEuUGbV1q7hyT6BC+nNAcYu9kobhl0HOgX21
	kNFZQTSOjfTOWF/egi3c1EYzBlxbOsaHAkcvBecSRxEGwOGMpKdGSS6AsQw9QB3C
	MInFiQEC4Vzk76eJbciNjk1dkAQpFAGVsFMtZxTniSt7sILBGB+ZEJhhdfJFkRro
	/NTy5ebdYilkwS+D+9v6oAhHvUwjoFiiKCV+zNG8vw79TRAdnBZXwheVlj4hx1rE
	OBrfLth+qetZ0jY37nFP/htiQFsWsG5yb98N3TwfUZ5t5WwBtKUT9p+AkohAY+Ai
	flV8lQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnymsssga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:12:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52c67f65cso409536085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768381928; x=1768986728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mgm7Mc1dv0cQ6pSRhXf40lbereDDywHEiWJaC4Yj7A0=;
        b=jSQ0/ralJ9RjD7YMpQCzFhguo7T8mnRQ954OGdlMR1PVWzPzACxV5PJTblpeF0Fu05
         5GW7GL/5J0Wo1g4O/Sx18aLnSuLPy9is63gFG4Y/zP59zExDn6Hon1lpTOZJld6brfXu
         DKnfRBvu+DX/i+Eg1sqyF6vc0xyI36PQT9N5oK3rXtbzD0dwc87mRY5NaHDS161JDXcr
         yozYsOFhUV5P9gv5q22Od6LcUhc6xUN7LJOM7YnrgnwGNQRnUY9UQphZWet65mAPjU2S
         TZEVwMB/QBWQqqQ4inXZ5YyAvhVKxW3HK+ODoI0TnZK4yddl3NWE80UhTClMJ2DeJhuw
         v76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381928; x=1768986728;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mgm7Mc1dv0cQ6pSRhXf40lbereDDywHEiWJaC4Yj7A0=;
        b=UUWUgRml2Qc0xmLU0JcrGYSBp1TTS9hr3Jq5ezLb6DHBnebMQw2I9dcB26k0ShAmTK
         7whHukBe1P1Es9/rXHPoICxEev7ZcqzK/1cM21Yq1E93IokGGGAbDoMyw6LlWW6YdvgE
         9TPxLMH5FBgq2LMNCb10q3ziClkkwNEN1F3SJ8FkXaHwWZRko2cTxfOnjoeKWhGw2BHH
         kbvbJDbB4I1OvtnbGYx0LOzYsTrKEl6D7JxmV+vOVZr3/pPfqrwx1HqPAyrHQ5DMKcfC
         /0zawna0AWHdloYuL66/9/lNig2OV/n0e6b7SK2kpC9LB7+/wbLLEGzEDFDY3HliS8gM
         y4kA==
X-Forwarded-Encrypted: i=1; AJvYcCWMufrR4rp5Pn1W/Fqv7LBlCZuAxq+IhBn0u6cS/9QvQi+Mjtj1qz/SOvTbt3rB7Ut3pA0YA5Co2hE/OItB@vger.kernel.org
X-Gm-Message-State: AOJu0YxLaIJlHSlRbtlpN3DE+bT3GkS3XnIsGCFrFnOGVFtTLXfnS2xK
	nZLChogj1TPmSwgL4igIwuRTOt2U2sXqin68c4a0LsRQFKKiflyrW7IIUi6SKQ21/x84konJh0i
	Zy++40wetKo2jKYIxoN6Qbrvf4HBpxEYgQgPwswJl+n23d1s/HK4/yz4MME8wpwVW1NbUgKt8eX
	nW
X-Gm-Gg: AY/fxX68Zr3RccJMldfsHTdOizha4OhuwYWyfd4uZK9vCzjipxKGd93WpZx9Z1rHLiM
	3UFTv+Shz1in3OxhPfL2i/RC2KuxPM5z+i3yf6gw2vS95trQQ0Y7ZJiSXjgvm16Htvz8In78v+N
	EfFXGc1yS9hiTLYxY3lvUoSL2CoTduH0uoltyndA80LrkuS33iJQn5W/jvolPLjvgS/lkhQpcnD
	51lSEwzD0J2ndaTXGrZcSGgdqzbDhR10bqkDbPLrOSw7NjZ5Nr+dTY4E3/7YZuxErSe7tmqhcKR
	qJjkX7cEeAFfsRRjmTJPmtKcwSy1m2Q7l5aW7HYDj2Tvt+89NB3qJ+Ww6kqH4C4vAzGCl8N/pe6
	B6guzD+3MwmMF+zCpebMAtkIVW34gjV/4YD26iw==
X-Received: by 2002:a05:620a:1901:b0:8b2:dec7:d756 with SMTP id af79cd13be357-8c52fbfa609mr264197185a.66.1768381927739;
        Wed, 14 Jan 2026 01:12:07 -0800 (PST)
X-Received: by 2002:a05:620a:1901:b0:8b2:dec7:d756 with SMTP id af79cd13be357-8c52fbfa609mr264195285a.66.1768381927280;
        Wed, 14 Jan 2026 01:12:07 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b876e9ac655sm46542066b.6.2026.01.14.01.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:12:06 -0800 (PST)
Message-ID: <8d7191ac-1c44-4dde-b8b8-05d9754c557c@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:12:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT] arm64: dts: qcom: sm6125-ginkgo: Fix missing msm-id
 subtype
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251229142806.241088-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251229142806.241088-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3NCBTYWx0ZWRfX0KHjNWO5V1zY
 S766kp5qf0DKqRJ40jGMrVr7cVnBMIF6NHj5tDYn4gctB2l29ViIQyhNuR9DYTzHWwayg/rDgH3
 vPHaSTzroZqQcD+bZLcrQNIu1UmljI5NHhPmbehqmfmuh6WI2r/YsB0bek2HxWmBou2BGw2QlMG
 ERY5pRMEbBRghc1mJUu4rnw5/yoHzcxisZ3f+3MXhfMcJII6T7s9Ua6fQHwCtSdatoT/cJGe9DU
 HKTvC4CsGQgXxWu6k2suFM0K1KnBhq/ruE5RRGTa6/ufmtocU3pfVMWu5GQMkF9wBBNAAtBcRjG
 qqrKloydwpnEn4ftDd/vmjEBie38JsaCdSD7y3fz2uoU+VMp95DYqDVHAgdenVM0DHPvoOKf5CG
 8tGG7aAW6PmgZ1CB2vo6MLVCfVg2GGsiTjP4v6YkyhLMYf3J6jvO2fz3NIp9exvhsdeb8eLczGe
 YLxDo82ivyDU39oDbAw==
X-Proofpoint-GUID: gp2w7JiEA3yOV0cKtD-h1Pj85LfUjoBE
X-Proofpoint-ORIG-GUID: gp2w7JiEA3yOV0cKtD-h1Pj85LfUjoBE
X-Authority-Analysis: v=2.4 cv=RuDI7SmK c=1 sm=1 tr=0 ts=69675de9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rZgdCJX2nwVo_4SB1t4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140074

On 29/12/2025 15:28, Krzysztof Kozlowski wrote:
> qcom,msm-id property must consist of two numbers, where the second
> number is the subtype, as reported by dtbs_check:
> 
>   sm6125-xiaomi-ginkgo.dtb: / (xiaomi,ginkgo): qcom,msm-id:0: [394] is too short
> 
> Xiaomi vendor DTS for Trinket IDP and QRD boards uses value of 0x10000,
> so put it here as well.


So I guess reviews from:
https://lore.kernel.org/all/6mxiysnjmrije7hz3opgaw3f5kn6p4glgoivxvnizrkjtjiywe@5qgj4jxfxa2m/

apply here...

Best regards,
Krzysztof

