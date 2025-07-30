Return-Path: <linux-arm-msm+bounces-67058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060B6B15A14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 309CD5433E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 07:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89047291C3B;
	Wed, 30 Jul 2025 07:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2OvjWKo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F035C1DED40
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 07:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753862272; cv=none; b=aPcemoOOSpJoVwAfpAS+WY1sOsIqjomb9eBGoyLUegK/z8B0x5SAVygnHbdbGu+4O2a1gdRJ891hUtdLE5gcg1eP5PFBmf0bLZY9/CJwaq0Hfd2Lk5AgCIn9j7pUb00QxR7YL0QjxoPGAJSIah8P/0kbz6rXOqernXaVDimcHPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753862272; c=relaxed/simple;
	bh=XZ2PvbCqPh4TDubyP5ZkSEFWcWBI13qEuuuSTP3h0AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W738lP6yNpC773P0pvjw8X6T0aG4FJQJwKZK+AOuQnvbWaHEHLWn3QmsSBjjFRdhKj2OhH4/upMTPE6PEEy9ruyrq1Ld9M2bvVjeoYEqTUW35EHk86FCi6MQyF15MfGn6EcGDjYHvaqdJutBvhMcd6q1pTab2C4iJKovLwNuNao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2OvjWKo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TN8lFH027399
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 07:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bep9w9BnXdrMmlin8Bi4VGFbGPSSxR11L24CVQ4ky8o=; b=P2OvjWKoPkLJEqWV
	HVfKaydYguKXVsjrq0QaF+thRZQuyqit/G7Rvo8n23YBBhnVDHvvi6azm6nvfXt/
	SlEb/KHudejGJY6TkQzxOLXuPPeo2m8SAZnsub1koynuaWiekzHnf3OkV9rAKoya
	9q9JCgxz1xJd4+bsCtjiibQLh3XB2L8ECsnuSd9vG+/D/WMAuh2WhykVbQFqLDo8
	OTZIhpeKPEhBPX8i0tpSmeCwgcJF61SzIxSqhqz6HwZfvJXZ2tR8eArfMhRM3JAx
	/g+F76rl7CVK15CkRyLFDi8tS7oiCzMxe6MnACzpa5cpu/JMNeA0aZUp3JjE7aL1
	utbmRQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm2sba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 07:57:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4abc1e8bd11so22327781cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 00:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753862269; x=1754467069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bep9w9BnXdrMmlin8Bi4VGFbGPSSxR11L24CVQ4ky8o=;
        b=FSVSO3vpiCGmRQ3qLynjyHxunaTosThuFu9CMhW+VttN4r1YRy2AHHmzt4blNYVDaI
         PwBtgok4CHRcHQtMn/BsFPqEUrV2YLikRq2MyZF7XZyksQdWA928VZT1yBSkaiFlOYJH
         yOawM0nuXBC5ydFIi3JAP65ByUxsxT3hdBSTloExEjWcGQ+krqJ50g2yQXv4/lWREsp7
         GhbsGDGK//mfkEzU07f2fRy1yhfUSSrvE25LKW/wY90gomz6nS7HNsbIrdaGHzaOLzot
         18F1HWNvw0RnR2sjjp17wT4kMwb/FTqWu9RYboFArO7xviGTnwEf4sB8OGQ4Fhl4+hMx
         UtCg==
X-Gm-Message-State: AOJu0YzYjRiV+dQRQZyHB1wOrD39ht61bVUBTZMIlf0D60ESL5kQy9X5
	UkTY3hfgMKdOMKwmvU8dWsja3XF1GIYbCasE9JSbf3PphUYrn8VxnuiarYUAEQmaYSaTwjGoo4I
	PbHyHkO5JdUVaHYfZzRicYzB/lm/UVq1MS9fzG5A7+0mXdVRy1xIc+GZ359dPgVJR/9/b
X-Gm-Gg: ASbGncsddLJZ5ixvrx76BYa01yod79mY8xkRbfIywjn6RiwYe1be1qKCxydRkhDjhyG
	paK7UHL1akEixVP3c/ecielMpyoGVWmO6r0tJVHfoZeeCik0EQdr6qu1niX1VWXAJ1B/vXnI2aK
	lHjFtFiOlvPd5f23cIBU2/akWVoo+UQoTL1tOh7+Jm/3428AOJD4zYuTrmLfwC0B0oOc9a9g0HD
	6TOdBYWvFFYhfJUcjUTIt9OT07w+Z902JJR6dQzkO8AeEnTi5sugM5DCXiW3h8wz+Uuhvrozmgm
	uNRiy+dqWAEgMdD0tcSCSaTtPvcH6x3ter5oL03Pgkyj1+wYT2CMZNrkEf7q07XP3paUbMz7fF4
	8sRkFDGbpD6Zh/nQSzg==
X-Received: by 2002:ac8:7fc4:0:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4aedb96a9a1mr7229911cf.6.1753862268900;
        Wed, 30 Jul 2025 00:57:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/sjv/KirXnu+zAbo+zcVKQUFU7/xftsd5QFNM57kgr4gJGSFZUGgA+3QYMDJuoSGOBbDkLg==
X-Received: by 2002:ac8:7fc4:0:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4aedb96a9a1mr7229781cf.6.1753862268489;
        Wed, 30 Jul 2025 00:57:48 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a65fffsm697780266b.76.2025.07.30.00.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 00:57:48 -0700 (PDT)
Message-ID: <0d267f8e-ab1a-4239-8966-5ac2d5d40787@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 09:57:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Flatten the USB nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250729-topic-sm8x50-usb-flatten-v1-0-4be74a629136@linaro.org>
 <20250729-topic-sm8x50-usb-flatten-v1-2-4be74a629136@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250729-topic-sm8x50-usb-flatten-v1-2-4be74a629136@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=6889d07d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=cHqI4RTSPJW5vXGIaXYA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA1NSBTYWx0ZWRfX3VwpZwgK8QPb
 VbhVAk/LlsPTqC70xDIdEYfZ861YiShBcw07hnMXERbbJyEub4+wUNauXRqABIKMgYxNLxVW4s0
 fwcExDGWeLsr+w4e0HzGCLIflaDVABYzHzRXZpZfB6o60Vp70MDrxDlXRhZxDUqcNn4EblW0Buk
 HJz4xwaSL9lhB9bh2VU/LeQXbuSxH73N2U7X3bN8oE3tyDBIJUk7DrNsv2Cw1uaVRRTB9ZQQv4p
 VaoT3ib4jpio/3giPcjQCtZ6vbYf/kreqGX7BeHnd2XHzzGzWxoIemme42HYPyvp8K0Vj9JezAh
 gl9VnzRmZYai5ABwcaBxZO502CPWLj7f5EX/PCezUP6vVF5R5VrffWC/LUxyjVn8qNYzv9flBYX
 Yo+7gPZ82a5HUYHa4wsIk1c3MdQ13Np6aQ+7rR+kj7isaRhYnwBOL4Z+QebjXNtyGvSJVe/p
X-Proofpoint-ORIG-GUID: nS9mF_HcdsXn1NlzHCxwDUnsEGErk-OD
X-Proofpoint-GUID: nS9mF_HcdsXn1NlzHCxwDUnsEGErk-OD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=871 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300055

On 7/29/25 4:58 PM, Neil Armstrong wrote:
> Transition the USB controllers found in the SM8650 SoC to the newly
> introduced, flattened representation of the Qualcomm USB block, i.e.
> qcom,snps-dwc3, to show the end result.
> 
> The reg and interrupts properties from the usb child node are merged
> with their counterpart in the outer node, remaining properties and child
> nodes are simply moved.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index e14d3d778b71bbbd0c8fcc851eebc9df9ac09c31..0120b9c7432a945a204ed76a461a6d0f13875537 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5651,16 +5651,18 @@ usb_dp_qmpphy_dp_in: endpoint {
>  			};
>  		};
>  
> -		usb_1: usb@a6f8800 {
> -			compatible = "qcom,sm8650-dwc3", "qcom,dwc3";
> -			reg = <0 0x0a6f8800 0 0x400>;
> +		usb_1: usb@a600000 {
> +			compatible = "qcom,sm8650-dwc3", "qcom,snps-dwc3";
> +			reg = <0 0x0a600000 0 0x10000>;

sz = 0xfc_100 as well

Konrad

