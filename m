Return-Path: <linux-arm-msm+bounces-48996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F21F9A40223
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 22:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F258C426225
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 21:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165BC254B1F;
	Fri, 21 Feb 2025 21:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5e14kld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9C1254B07
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 21:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740173931; cv=none; b=QRmW9y07BXymZgDk+9g5iK1wwU2RfBaX9dvg9B7YZ3Pt794VJLuagsd62aTs20S1TGww0sjS/Ynmv6rW5OsJTVbgj0FLcugHex148wp3CNVYuCFqBLEv42gisiSTnpaaCkFM7VQzjAGauLF+lu2QWeuzVDQCq4IubJKCtmPwkCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740173931; c=relaxed/simple;
	bh=4ygCX+BlAc5yHgLuL83+bGU6HjWO3YrRUAIp22PE1Xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tskyELsHpKSU2Ds1EjA1woo8kQWGWZ6cZbOVzvftJvV4g4kvGsAcFXpsqHU2drfTBfMTrkJGRY27RsC83j6vtXzpoUZxVjhTeoxZxzqo80pBEeabhndh4fn8JzhiX+5RKg+IovAHICVoqvEFRm0k7AHL77wcjaxQOG7A4J7Eu4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5e14kld; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LBSljo015237
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 21:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SQKkyFpJsq0/fkBHSwHXcQmdiJaguo6VpRU5m0ktNdg=; b=U5e14kld8aRYrbsU
	hGjuh3RLE5I0lkL6IyIwFK4QryDka+4Ujsg597s2g4Qc0IMO326k/v8nXdgvWwrP
	LPB1gowUls2lNhjt9MFluFfY/AESBgo8kdype4YuS9X0vcBZ9ATs6CjaBRwINpQi
	8UdxTGZPP3zuML7+YyypMQ8vxlfL+SSvoICqp8VYkCNlEy+vgswijWRHjkpunaVs
	jgzpm5inWkB7CRrbBITE6fRxMe7aOBgr0bmVNAprBhT/PAixOeZDOEPG/MGDd7dO
	7L1kE4/3LTpVSOvJ/znNfqPo1QXkfdsn7Mo7hAxxYgGEoe28R1FxYPOLlcJxJIJF
	UBfP2g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy4kabu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 21:38:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e65862f4e0so4041746d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 13:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740173927; x=1740778727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQKkyFpJsq0/fkBHSwHXcQmdiJaguo6VpRU5m0ktNdg=;
        b=EvNJCXmKv5E0FGr/hhUdERWK2f+kmQCOCQOluwnWoLbHvyNST8Ut7Fq8hg2S4y2iPY
         8rSI+odi7HGAzmaBQuJiYv2sBBKwQuIG8Bnb4uOF0OLgJG99kAC0oBLIvbHDVmIyCTe9
         Hv7+XkP0BmkHIJIaDkXTcVxb0MIvD0H4VCWweF7EJkqB7++MmoZHf6cekl7Y6njITZnk
         ukeZSW0IKnHvQrJEGAOsvGfL21tMPMdakOP5a8KMAhw/1U+8rEe4/+LtoMVF4iQoVHx+
         Pbv8rkTQLBmTJcbCqJKX3fIPjfnUtZz8Ek8Vruaj2JN4ivwiPTu/9RA6ksKimE8MltCY
         9XlQ==
X-Gm-Message-State: AOJu0Yw916Czw6J38pQsaJq70pPFfNKba4Wb3ZS30C0nVO2iD/haLBA4
	L44whbmFKQxCyiOVc+lMvRoCFxL4LwZsgWseQSfzwJiGjnr5WEHaQLPGAkGUCNJLaANS8WNqodX
	H3An0nfJXjmN3MVg/eDjWzlze9sTwvxdKZhihOuUJSnB4BjR+g94BmQZoLgnh02xV
X-Gm-Gg: ASbGncsODOiYLesFl+qot1ziUuEupMqlNVYHg3PvVftDksc791UMYet7vYb+Z8hVh0H
	tMAU+1uayoQxaK3ndY+QSxOR+NOLaXBqxz5hxyI6U21rNb/zloKrpiRjhjnjJ/dOEkGmjhr7sQN
	D6rJAC7ldSxpYe2B+bLsCphBbyLZUF8cc6aXziYtAvCneJJt2Yfg8LnkyGol+zXpiTH23nOYhX2
	oODS6TXDTc8KYXrd/KXVHNE67pprHFmYr9RBj4xonqfEVkYTHwTgO516NVPlaJ2no40eYIk8aBL
	ILkpMb1TGYLS5A8YO58nD1yLQSV8A4aAM1v8jNjsv0h1xWz9aLiW2Y9ylnVZyLxaUi+IHw==
X-Received: by 2002:a05:6214:2a8a:b0:6e4:2e03:c54c with SMTP id 6a1803df08f44-6e6aea324e1mr22692996d6.10.1740173927468;
        Fri, 21 Feb 2025 13:38:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHH7bR1yTZ+s3Pcg5KBoLzFiK/8eGo0r93T0qBxtQINa0jSC0PQxR2KObfPhPcHklFloCVexQ==
X-Received: by 2002:a05:6214:2a8a:b0:6e4:2e03:c54c with SMTP id 6a1803df08f44-6e6aea324e1mr22692816d6.10.1740173927166;
        Fri, 21 Feb 2025 13:38:47 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb98ed07afsm1067043066b.102.2025.02.21.13.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 13:38:46 -0800 (PST)
Message-ID: <626ee5de-ab07-478f-bf10-983a9a321570@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 22:38:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750-mtp: Enable ADSP
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Melody Olvera <quic_molvera@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250220-sm8750-audio-v2-0-fbe243c4afc3@linaro.org>
 <20250220-sm8750-audio-v2-3-fbe243c4afc3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-sm8750-audio-v2-3-fbe243c4afc3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lqe8hOkDqoF4s5jcEDj94h8sgAS48rVl
X-Proofpoint-ORIG-GUID: lqe8hOkDqoF4s5jcEDj94h8sgAS48rVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_08,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=569 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210147

On 20.02.2025 9:49 AM, Krzysztof Kozlowski wrote:
> Enable ADSP on MTP8750 board.
> 
> Reviewed-by: Melody Olvera <quic_molvera@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

