Return-Path: <linux-arm-msm+bounces-58740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 259E0ABDF9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 17:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6798D1706A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 15:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BFA25D203;
	Tue, 20 May 2025 15:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/bD3Kjv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002A8252299
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756298; cv=none; b=lEYX4bj1VIePqO5ZRRtXL0JuKjU2sb4qNnUPCirBTIuRD/2yYfbbMqOVKLO16sz7fSzZQx8K4NBaibS7fXrbM+Kl69A0hDy/+eLiaAacm/u/D3JwHhqdPqSn7F1e2bpDqytfuxNuMUIJLyxYaqWJniPDoBwAdDinjfaFYNbPZKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756298; c=relaxed/simple;
	bh=Y7XIAV4s7+6wpXXkG3MADoOCdShuSnlmVxRIVHAv5jY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQYkz1X8hM2A4zLPQfECQI2Cg8MflinaHcfTYftytbjBUtinbLBUABiCF1Qwui4unHu5GtMQojTv05n0F1n/RsxpFGcNJM/utONuDYH3qblKlQPQLYwpJDWx0L1PMKDHikn902NiSjvYUoEsXJcAlC/0tD2c0+HvAm//VGZnX10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/bD3Kjv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8RpFY013665
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 15:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVm8hj3QTMzoHvzRpuBZ/yanratkrX0/Rk3LxJxI1yw=; b=o/bD3Kjv4Lc+V5iP
	ERgXnF6DVdKRaeZTlFKdk1MN7rMRkxNzBp302jufkSm7h4EkP4utOORMEr1wAxQu
	7a3EzN+Trw85MVhowo8PJ4AH9YW+7Bf96mUH7BFJ8Ygu09krf+DJ24CPQCx5p9ub
	Knx3vmDkl8V2aThu4ePwqyNXQXATCg1m+w+VPX3Yzy5ICNCm2sp2v5qlUuwimXcj
	C4sQbuoA4s5X57F/YIhb5AuMPdIpqhczaDbc15bvz47M5dBidCCRDpDzJLku3BkK
	3qLDMks91uk9dTnNKP/JZUhnTSS1Xc5z6n0ec2Nbzgq02XY8aGpV7m0tphDuVD8g
	nJvsyw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyrccm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 15:51:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so162498685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 08:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747756294; x=1748361094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVm8hj3QTMzoHvzRpuBZ/yanratkrX0/Rk3LxJxI1yw=;
        b=B5WlofK4TCsJpFB2E7l6g1SDe1encfokUBrpoEB8U10Y8ApHaYwpCUpnbpQvg5ZXDg
         Q7LqFcVBn7oajJbxYnGAhkafIad+euGAIxqpPt+H7pUuCJcWo95HGk5KlIva+S1jVf9c
         th0XNtgbDGsOT+oQWk75dNhfYumZ4fdwGyWRw+EVCPnlUMNQowdolKk+baSbwZDhN/hx
         7++xdb5vmmHPJKbhbHCfXx51JUc48WBNq2lhKxxFgReghhC80Ko4Xy2OwF/3wSxlsx3B
         +L5JENsdhO0yEMFMx44BRMKbwykVV6CatgNKzG7BlJoTPOnb21iH7+f+mzYqO3ja5VnP
         gPKg==
X-Gm-Message-State: AOJu0YzCw5Dyr0RMlqvXyBAyylpr0bX9UMf3LdRA884lQCyRd7fQWghJ
	l76poTZ8iSzmn9ib9ly5iyG79iSL0mMASbE0sX7qLxvkfQSXX8V1p+eIXZU19iNi1y38BTxeGmt
	IeTcsHlgZkbhWnDFOwObI6H63kQZzt1PuwOUB++n55QHXD3JIW/1fyAxAvZK25znePxHbVO++mP
	EE
X-Gm-Gg: ASbGncs1J9bOtaHIMnG83IfL5jKRYdrhYqW1h5vmUpTlnvO0HbbSZu00nFtllE6W95Q
	bclizv3o0DtBUT+061E9h0mjTPmhu0APjNMGgEWtcNJ8w/sdEjom+/WxJhzfhtI/Lo40/zDoTwM
	x+X84GJm463XyBNZeWgpdjYA9dOfSWJVZ9N9SSyAV9RRaez0g+ti0zOFU7QmcnbAXcefbeMRg4G
	OmBppciI2Xp30EQy2uMrUYHar/zJUnaiZLbjoa1SR0pgjSyme5PYPGzhCjKyVdQyEyLR/TGnhry
	pfH4wpOsvoYOaBzGN8WL8qgxBvPe9RgbnHOfCSCBp4wuGyoEBs/oIGegtdBnynsFlQ==
X-Received: by 2002:a05:620a:269f:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cd467bc781mr1011299285a.10.1747756294288;
        Tue, 20 May 2025 08:51:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM2t5Fu+aTAl0x5RLl9YcGLpBbRfLqpqLY1GnUkrm0pYUTylXaIZvlzDkTHik+RLtPYhcfyw==
X-Received: by 2002:a05:620a:269f:b0:7ca:e392:2a1b with SMTP id af79cd13be357-7cd467bc781mr1011296785a.10.1747756293733;
        Tue, 20 May 2025 08:51:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d502adbsm7343899a12.27.2025.05.20.08.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 08:51:33 -0700 (PDT)
Message-ID: <b3d42052-cc75-488b-a018-54d84550f62a@oss.qualcomm.com>
Date: Tue, 20 May 2025 17:51:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8750: Add Soundwire nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250519-sm8750-audio-part-2-v2-0-5ac5afdf4ee2@linaro.org>
 <20250519-sm8750-audio-part-2-v2-1-5ac5afdf4ee2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250519-sm8750-audio-part-2-v2-1-5ac5afdf4ee2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1erne-x3-dzwXHhMeuQcOverFND6i6rd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzMCBTYWx0ZWRfX4On1tFebXIuT
 91AdVFuu80AIrZnOOYY2aKrgHuN4O2ZC2Rl8/qcNcDbf5spy3VXuUJLBtVW0z5Z+Fv9OM2E/MhN
 EBDlhXGtqGIPZArGi2yZtZBSar9GNhNNSXZvlE3UnwDT2JFrMH15EQujL+FJVPSYKTmvQp4LUZE
 PbkEWgIQrLF5bnsjshsrlKv38JQK6PJHta73i7ciG6jX5iexZC2YmaFRjshBuU/L4lwcn0Hfp9S
 5EMUFBwlLVhRiL2N27yoRd0vU/dMuRO+YvrpqDb+VdPxuP44KGLmRHlXNG9oi3ZM0DlrCmvO10O
 M6XBb0VepjNjjVl+r/WNP7wSVc7KLdM3LMyghpjPrLSmKPi8JbEVES94TvF2mB6B6DUdj9Dk5PY
 X82o3GLTMwIhFEHPk3+gDVPpJV1HKnsf+FGtpf0rZnzSl8OpWnPUdEhfZYYtmixPxYXS+wc6
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682ca508 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=aXdyv8Fb0LjW2WrOllgA:9 a=QEXdDO2ut3YA:10 a=AdHoc0ENqhcA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1erne-x3-dzwXHhMeuQcOverFND6i6rd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=843 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200130

On 5/19/25 11:54 AM, Krzysztof Kozlowski wrote:
> Add Soundwire controllers on SM8750, fully compatible with earlier
> SM8650 generation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

