Return-Path: <linux-arm-msm+bounces-78841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6BCC0BBB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 04:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9DCFE4E070B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 03:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2342C0296;
	Mon, 27 Oct 2025 03:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvo7a4o/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E262686A0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 03:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761535107; cv=none; b=Ch6/4l3kjbWuKjCcK1wOSiS8LloD/BNaiPIuZFaQDM58UcX38lHx/z4VVc7rehLTWBPyfQA7AFdvNxDh25hmTORUCkI7lBE+by/rDQDR98jxJAu8RZWCcXi+C+Mjx/kb8JHzqdE0N5wLfvZ3dAKL+156g10Yge8Jl5dKvbPW0DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761535107; c=relaxed/simple;
	bh=HVX4IgIqLmSwibcSj1JBmsMBTsJCHqjQerkoJDSYMtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSWkNIcsvyEbhgNgZrG0wx2TVcUSlQ3SDTJmXovoeGhWiSZ0No+k8VnhP0h1RXgTPveC4t2D5VK4clEVvrnkMKq7/wjRCUpFZyJIATQhkuJLxdxANBQGx8ya98QCorNjOMRUBmpL8B5FxtGOICqu8L/D++8xmdNfhtwQeEVEFoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvo7a4o/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59QKjxJN827542
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 03:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hsC4kwhJQbAsgGRl/SnnoHZ5wdx1iZ5j9DLWMKdfA7E=; b=lvo7a4o/V3aNZ8nO
	pUKLRHz+KfRF7bKkEsYdsnxcgPq/uXggQZx/YTIcHP7S6PPCtG4zYfuhMuSV8vU3
	E+Js5O4zPjFAdSsdzS7RZ1440wxgQTL+60CNKq3D93YatiSZhWOKSk/yUm7hpJv6
	yhg2Stijbob+55bY+EHfqvfbZmrL56iHR9Kk62/eIGn+VFYa82YDYU8obou1YMA7
	CZXRfbXJRJTD8k+ldEyYaWvtdb5x81s8eorjxP8eGiCbaAVVAnUHSzBlGsEOS+/e
	Wjhzqe8BXdrfafQC9Zeqy/bMH1RfPL/LJTwmChVtmZQZoCso0Ef/P+TOO55cYySe
	OCyHdA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnxu3kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 03:18:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33be4db19cfso7987596a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Oct 2025 20:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761535104; x=1762139904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsC4kwhJQbAsgGRl/SnnoHZ5wdx1iZ5j9DLWMKdfA7E=;
        b=oMcKXcVbl1+kGEXU0rGrhQaSOAMsPjOYO7mF5BiRydhYgqoW0FuBnSyo7A7WQUH9a4
         nwW6ZHfq3NvUV8ygaMF3lW8ery1ZedvYJQ8CEHQXRLIRe9WgTBqOZS5rJAmg7aNaxMfg
         A1fLn/Q7k6BO7uXmQpOwb55qxJxhZDHhYiRidArtuXEzUw02Y3g0wV8KCMalZFtvLnQ+
         8Mk55oxUevSBaD9fyq7zZvJqHrMDcJxRs8x3INAMZg66oXozQwEIKvyUe8rNPtgp86Rn
         wtXxkf1EHJgIxCJj1iXiMEhygzH4YZu7AbOsQZo2rrf4rq01r49iEl8YxOv6NtEDOnrA
         BKJg==
X-Gm-Message-State: AOJu0YyqelLxvqCVSD0MTwhclweVB5R9T26qffChRJyEPBYjjDvhVkhu
	P136sjB48mdhYlB2js0ke0HIZ5Hzf3bmHYfdX/GYrwAV8Cr1P0BB9Zo8d1wA+3G7ws4Ol0+eIB2
	1VXXXfTqBXYS3JCgHpzv6nZX0zfsjOiMU1TjuV4CcqVXmoJQ8vi03bUyVZd+v0dMk2kSc
X-Gm-Gg: ASbGncsH7Ff1uB7481G2gL6W86YFw3f0egJM3gD2ea7raM1o5XoDctWuS3pzuvfYCW7
	KFp0J6wb8ivE5oVd2FyRChhEacXQoEMUAa8UyMmnAK+juEoIG1xt8Zqrb8XXWIGRtl12I7HSzMQ
	6h1Itw82lNNyu25oDufDx2o4qdg+/tWq+aMqMIMF0+1+Omei77OX5vj1Aa2c9vyT7YWJ2W/iUCb
	XC1fG1er+jv3DxmCj6C7M82/A6rq51QiFPOJ7xOXFJCR2JwQKAJ+FzAprX06dU17tRq31GbTmwL
	UuOiso2mW5YlhWLryIx8luu3BlqGxavge1moLjLo2s2ICal7tzhg7Ry6qNtKUxl7nUg+68Sm+zp
	Yl4zHZtEVnNBLw7InVpEJyHM84f+OZ5agrnA6+GCuqIdjQe0osA==
X-Received: by 2002:a17:90b:3dc4:b0:332:8133:b377 with SMTP id 98e67ed59e1d1-33bcf87f8c3mr42789910a91.15.1761535104148;
        Sun, 26 Oct 2025 20:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYkyXH+hdMZG8oNznDJ4jtrmldZN/nblX3y0v8ZeYj872vhQHc0eblp/uw5lZT6uGYyCFOXA==
X-Received: by 2002:a17:90b:3dc4:b0:332:8133:b377 with SMTP id 98e67ed59e1d1-33bcf87f8c3mr42789880a91.15.1761535103715;
        Sun, 26 Oct 2025 20:18:23 -0700 (PDT)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed80adb7sm6656310a91.14.2025.10.26.20.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 20:18:23 -0700 (PDT)
Message-ID: <a8a2a55e-8bc8-4dcb-8a15-f950727bc112@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 11:18:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: talos-evk: Add sound card
 support with DA7212 codec
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20251024023720.3928547-1-le.qi@oss.qualcomm.com>
 <20251024023720.3928547-3-le.qi@oss.qualcomm.com>
 <150836aa-b69b-4dfa-8118-4c32f181e03a@oss.qualcomm.com>
Content-Language: en-US
From: Le Qi <le.qi@oss.qualcomm.com>
In-Reply-To: <150836aa-b69b-4dfa-8118-4c32f181e03a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xc+EDY55 c=1 sm=1 tr=0 ts=68fee481 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DwVtD6Y8SjwMHt-vgBoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: fY3HlvgdauNkYo9j4dPPM9hefJsgkV-l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDAyOCBTYWx0ZWRfX8dYwW3GfJzZr
 hN0tAJhop6c2iBI2KnWk9QRwh1MlPw/n3k51Y3GGPAtsVHDyJ9Df5/NjK1wNfNpBs+hChQwR9lh
 BikywzauAforkSZHZ8TYqleG8KQuW1XjW6oYHOTDyayw5likt9PJSZOnV/+mvq27xb4SgvlxHEN
 h01VvyrnEd8pCdC2dtTOjsX9hZswljXgqv69sxoyLONF8VO1jLkpqqKM0s9KbKYMIlqmxjsjgVd
 N8AOJNLy2DaekMXBg3oDz28FI3FJ/26/b2YAIiCGv9wCphFnuLAbCqWUza7KO2Ugk+mKZctyxEk
 gL19XN7YBkW7NuvEWyOhqv097RpEVL/FUkRiJu1+UUZe+kfwbjsElWLAFKOwxFL7teP73PAH+Kt
 frJvk0FO4CT6yB1X/IqQNVU4sS1QhQ==
X-Proofpoint-ORIG-GUID: fY3HlvgdauNkYo9j4dPPM9hefJsgkV-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270028

On 10/24/2025 3:59 PM, Konrad Dybcio wrote:
> On 10/24/25 4:37 AM, Le Qi wrote:
>> Add the sound card node for QCS615 Talos EVK with DA7212 codec
>> connected over the Primary MI2S interface. The configuration enables
>> headphone playback and headset microphone capture, both of which have
>> been tested to work.
>>
>> The sound card integrates:
>>   - DA7212 codec on I2C5
>>   - Primary MI2S playback and capture DAI links
>>   - Pin control for MI2S1 signals
>>
>> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	sound {
>> +		compatible = "qcom,qcs615-sndcard";
>> +		model = "qcs615-snd-card";
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&mi2s1_data0>, <&mi2s1_data1>, <&mi2s1_sck>, <&mi2s1_ws>;
> 
> property-n
> property-names
> 
> in this order, please

Sure, will modify in next patch, thanks.

> 
> [...]
> 
>>   &tlmm {
>> +	mi2s1_data0: mi2s1-data0-state {
>> +		pins = "gpio110";
>> +		function = "mi2s_1";
>> +		drive-strength = <8>;
>> +		bias-disable;
>> +	};
>> +
>> +	mi2s1_data1: mi2s1-data1-state {
>> +		pins = "gpio111";
>> +		function = "mi2s_1";
>> +		drive-strength = <8>;
>> +		bias-disable;
>> +	};
>> +
>> +	mi2s1_sck: mi2s1-sck-state {
>> +		pins = "gpio108";
>> +		function = "mi2s_1";
>> +		drive-strength = <8>;
>> +		bias-disable;
>> +	};
>> +
>> +	mi2s1_ws: mi2s1-ws-state {
>> +		pins = "gpio109";
>> +		function = "mi2s_1";
>> +		drive-strength = <8>;
>> +		bias-disable;
>> +	};
> 
> You can group these together (i.e. create a single entry with
> pins = "gpio108", "gpio109"...)  and move them to the SoC DTSI
> 
> Konrad


-- 
Thx and BRs,
Le Qi

