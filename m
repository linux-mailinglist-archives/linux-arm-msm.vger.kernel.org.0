Return-Path: <linux-arm-msm+bounces-59556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 489DFAC4FC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDC703ACCEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A42272E4F;
	Tue, 27 May 2025 13:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FA+VwvNt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C052A271A7C
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352580; cv=none; b=mH9QX9rvbNCS143DCjorpZv2PyS9w1USheWckYV/2bX/0O2J74d+BwLzAnZo7ZCtWi++pSpgNmlFnINQtoACwbULKsI77+P3HkSs+4yW2J7wnXkkvZQppxzkRVk1LllIV8/AFcs4Qm29ZorHRvGdYmEdZQa+hXR/GKdXFoseYNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352580; c=relaxed/simple;
	bh=Z4hG6dLy58M3ypBKoscoxiNRoVM83F379RAX/Icdfzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rocvwQaX4iCL8g0TUZRWiU5ajeJklST/GBI5BonUqjv7JyrXpcpZn2vjPFC+X7YLDgvIFsMWKkD2LLpaF8LQqlU+EypAqBnJN4OZiIc+hRWJQh0dOKh3/6kjfx7lZjNqr7B9fFwSuUwl04rzHUAlJLWu3nUq9QKnrfcubDOelqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FA+VwvNt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9GMfb028517
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+nLYu+wMg03x4qWGhsYKPUqyKHolFLi+FxeCgip0yTg=; b=FA+VwvNtKWcELfNa
	T8ru1yPNfEy7lPyZb7rD50ofwf6qXuUxdPbIL1dM1cuUQphqvXdCwmKyMJQS0QzZ
	11SeEXYZZCeRSpAjWv1EMd+YSzWel6C/UVb9usBrkQRZu3e78EewPS6SvoZzTmlD
	bWYOUXCiFDp+yJR5psrR1Ax8pcsGou46BJHREj7h+b3ej/WE0V9hbnD/3Jji45kl
	HYuiqTU+rawOICeYNb88FjoyH/C9UWKLSEHE9CAzWLNcp6eM2XDydv8Nenx+wrBX
	snPCSnBAdG7yxAQOVhVy3X/QPV9Ni7uzho1v/0+MuB9a2Sxkh2mFCrgPjhSpO/t2
	7jtVZA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66wf6ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:29:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceec331273so111341085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352576; x=1748957376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nLYu+wMg03x4qWGhsYKPUqyKHolFLi+FxeCgip0yTg=;
        b=JiYwRvtvuZ2VVl7lbYPI4J7EGUx7VDSbk4x/fRfax5dS7m31oczDvO352xcZFY8Hs6
         GC1/qSsieXxiPBDfkWt6Z+0cIniU9BsqPEebcAczU52xBg0ssCB/rfMS5yPoIaj8B+UU
         eQbt55b06/0cjJbe/WWqUCm/bmjQG7iEKn/aoZVREMl7+2Rnzx2oHAMk4v7TJCxPbOCH
         ePW1b9QxV/5ved/ZYfyKbO4snZ02vqFFNA9eYroB+kn8jxAXqnwXdNBvu2rXvgaS0du+
         Mra4ZTU5b5TJUjUH5BjFBtQcx7tSG1k+JWNJfzh1mBSLskdrR6HeqdutJ47eUMypNeXR
         Uxhg==
X-Gm-Message-State: AOJu0YyMXw/CFa0s/d1nCAAUEV1gv6jjurpnZG93V9JTq0INfoknfItg
	hCn2jIs7FXdhZDv+hibuRL70lOTvK+OqvfFL8XD/sCxi4RkjTKVPl45FpKVfVU2tuhIDhGf+UTH
	kLgDyR02TJJfJ/ffTqz2MGXycm3PZ8FvzCnjCZ4wNHlMcQet5X0+i1EOPhMZGY4kQc4sQNXQ0AF
	Ka
X-Gm-Gg: ASbGncvMYXJtWn/fEfk5gOD7nDDWN6CHFBnUliN/kkzFrjnCfFsG7eLxxInFeC+gYp/
	oCV/njSjEV8xp07lkZKisV1rwMufTkJkNZ5TMP65ij2ysxW8tiKKQuEqq5nGmXEX9VqZsCRamv8
	UvvOTz/mxCFmKXHqsG0mp7aK1EX0RSJQuBH6gaxetX6jMNmEo9usk6I79knLw+ho145O6QfiHEX
	QBzhaMhgSE/x9e6Nb2MbRYRDI1pKlcIOVXkiYh7rJhx2HnqdfGGSsYH/7O2WMekb5rUFOeNN5+R
	jWFWdYxCEN/S6VgvugdLVLW9UXBniYFd5hv5rBGI53excZlrWl/ht5P7vhkAlvIC/Q==
X-Received: by 2002:a05:620a:454e:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7ceecb6a425mr768665585a.2.1748352576442;
        Tue, 27 May 2025 06:29:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvL3/h4CKWjsYo4zYcK3qlniWEG8qm5kJBzAEvqrF3kl0uS6pRHQdcd6tNdnQWOdi5guAA8Q==
X-Received: by 2002:a05:620a:454e:b0:7c3:d798:e8ae with SMTP id af79cd13be357-7ceecb6a425mr768663085a.2.1748352575802;
        Tue, 27 May 2025 06:29:35 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278247sm1830992966b.76.2025.05.27.06.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:29:35 -0700 (PDT)
Message-ID: <056b38e0-851c-466b-b2d8-ac6c1dc504b5@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:29:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs9075-evk: Add sound card
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250525155356.2081362-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525155356.2081362-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=6835be41 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=U3GCaaVbaVzPGH1JVgIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -82YfM_a2NTtp6uVf54fliANfoacU1U5
X-Proofpoint-GUID: -82YfM_a2NTtp6uVf54fliANfoacU1U5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDExMCBTYWx0ZWRfX1zseiSewpQFa
 u8QGxyiZYjkFdA58BVBPANO2Pv2FvD1QT3MImSRWyg+6mXtoSc866DnkLkT9EgoeKua4K1GCeLd
 0+W/bHfvYE8+fpLen3lJJw6B5zBXGCZXg7HCrTw9ltiMpGWcV/KIarrDKs956JJmD1DG/ZHNmkb
 1gQltRQgEaqYLurBYz+lstffEoHl3RmapGAZFwJqD+iMo9IBN5cUOx/vejChd1J5Qrlf9Knvorw
 0Yh1KKSkIeD7MB35pvvlR7HKHfx6CQN9OO6J1BjYPBIkb9MFP6Ki6E9nPL3M6Ud8WJPQP097tQ5
 ViOhIDjCfsBCclFzUYbBnDS3MPB4a/KvY+VVOlq9vjx6anwhXXH1DAwAX6bDEXxZCbNdNj3xveX
 V6PpydrLekn7cjRg7eDCe3ITQUMoWmsvtxLsssXCORmi8O6VgKV3YZmqeiCAb+8/br06nenp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=898 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270110

On 5/25/25 5:53 PM, Mohammad Rafi Shaik wrote:
> Add the sound card node with tested playback over max98357a
> i2s speakers and i2s mic.
> 
> Introduce HS (High-Speed) MI2S pin control support.
> The I2S max98357a speaker is connected via HS0 and I2S
> microphones utilize the HS2 interface.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 +++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 14 +++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> index 0e44e0e6dbd4..1ebf42b0b10e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>  
>  #include "qcs9075-som.dtsi"
>  
> @@ -20,6 +21,57 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	max98357a: audio-codec-0 {

no need for the -0 unless there's more than one

Konrad

