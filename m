Return-Path: <linux-arm-msm+bounces-83578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B8AC8DE46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 12:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67C234E2E16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982F032ABF7;
	Thu, 27 Nov 2025 11:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVlBR9/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUoL3Uqg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF0E27FD5B
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764241568; cv=none; b=JiZRD3AqRKYvwHPlxbtTAPacZDLsTUaVLW2aZN8We4TyitcmesB2XZcoLwRFkovq8OCmNVhcH8XO5FsjU3/IJoYNtBuRn6u+Duwbmcaf1JvYUjvHuSBnVAyZq6CeRKcDt7V2Kl3wa+4kwCfgWkgtfaWQqLPClzLK6Dl8ECTAUo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764241568; c=relaxed/simple;
	bh=gErO8r2/jH1JEM6Wb/SziNZeqekYoVk2qJj9NHu1Dbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iK8H2i3mthrlGKQmp0SZXiy6jn8OQIpFT3hb9CrxO1YX17oWEO+0FX3+XeCwiTJRckCYjRS/klZ9S6n2plU6F7P5516ZNGAzJHSuTC1CZ5Mbmuvr9GCrS9H6LV1c58DyzHZY1BKRdkbryYGFO7uaJ88deKTDQuH691FyuGdGJj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVlBR9/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hUoL3Uqg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR8ECnE2388029
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dsM5B0ACxhRDHWXvfakmXYc8i5gMH4SHAT6VoxxH/Fc=; b=VVlBR9/l5YNDs+N6
	1CGh2ohRqvDYEB537Y58T3oCOGA3g6gMddpeZw0a4Pm1rNld/NSblhMJkFaG/PLs
	vQ9xjlVdtooR0qI9gV+E4/1lksGm9fNAiDd7DZF9uUoHSZX7urm847rZVzRKqg/t
	BVc7iUJ2piZs1dw3w8DzsIWs5GR/TctO2X+oXyZPEYvC9dWiQ2MAeG9UUo65jVhU
	EzePBW/q7/pgFvh9whrRNTpGkbunVeWWHTrO+SYqyRCV7zQU8KMmKWaSneLqmPPg
	GAk6ZVqmep3HrVglgBFmh77qvee0mC9jO2UV7eS7y7hxw+FdfTjz0DyTVddoFVlE
	v8rX2Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n8j6sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:06:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee07f794fcso1323081cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 03:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764241564; x=1764846364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dsM5B0ACxhRDHWXvfakmXYc8i5gMH4SHAT6VoxxH/Fc=;
        b=hUoL3UqgfBckrGzjgMuYHRalahYGD0h9d2plK5h8UTiltdY1QJpcVpD7TwjbMMv5R0
         zZaGC5tmmLLpMNDjzJPGsHB0XN6wKu+YFhgxnu4uQPNceUAiC3wK7wTQPGrgxq9halgp
         mbZVzB0mm4U/hSyp0YFWU/hitqNuw6roV945IL/i7DFheDPGzA1st40NnqsAYzQi/SoR
         dntKxhe8f4ZuaCCkyx7Xg3ebEWnZAb0YVvUGfoX3B5FJ+Gjxk8CkhlltjUe8LETj0z0I
         bRLJj1Iog8aDPW7bbt11XwccBy68N7+Zd+QCMHalrISzqybAQQhfOnSznjOjK6wbjV4H
         7/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764241564; x=1764846364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsM5B0ACxhRDHWXvfakmXYc8i5gMH4SHAT6VoxxH/Fc=;
        b=GhcpUPV4+nl0pzjZPNj3bmj9l9cMUI5crxiDjmsSjsczGvSFh61RJ36vSJKWVrsee8
         yikCk2Z0R2sUUN2Ycn4Ax9a4Be+10mg8l6DQEGKU9z9Gqx7dbIZsv666RjhFiIZGY3pn
         nI2ZmNKcWS8LTNroWnGF+2zAirg0zRmFEDxpD3qH45sZu49jcSEqgdjTMHc5PQryxhXB
         M2Ck2Ax5BTQVgSOXVqtN6RKgrW5YEkA2E+0JiWeeWFQgu2u3c2W9rBTYTHm438zpLTdV
         McYbtQctqXhTZbrTbEODr07Qyo59YZq86BN7gpThHf5XM3z5NEhhZ+L6OJSp9dWPUmLT
         7DeQ==
X-Gm-Message-State: AOJu0Yw9rnt3vrL2LxMthgIW+Zdhp4I2jSZF4BgS3AstH+c7hcks0AhU
	/BTPgPlVX+9wKPUt8fZg9Hu6RtfDUzZ1E6IRHyANvCsO6jQTg4h5PB04srTf6fZb9+o4dxhZG5J
	Ml00lnXkn7d7Hn9ll66Z+Ib7B5Jw1GcNSRCet3yaXIBH2g7RBmpKfZzbByuuiyUw4bYzF
X-Gm-Gg: ASbGncufU3SmH2Z6E0wqp0L018guRSP9a1c9ZQ7RTsMsoIZXk3KqHYhfuoJqwbrsxUh
	suLikQk+2kg9C1v9v5zawAu0/YmUVYQQEfT4wvPGa0BKOnqMZucgtyI0iflPoYryqyqWt1gUavt
	nt5wyVpYNrVfDG8bRQ3S8s+VbCVy38tlkwSJOyeeg6wu8Ap2BcfZTehxSmu2XBOb4kNI/Gz/Rf5
	XXz8TBIi1ov6LWGJHHNVf2sdn7eKD4FaoOxkMvYiRgFbo1bVRURciUm2UA0dexBTTfifgd1pV98
	dukAH3oyRL14onnulvgwnfJHil9KIknoBEiGWLVi5hGeA8BbPIe8sJvmzWcA4TrvRiKHvcfFkXI
	WCuVLsrgAnJaxg2Sr8Dr5fUsZn9xMrwznGu+6WZVm5xLjLy+QpWJyiKNPTVmMmyw+7xw=
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id d75a77b69052e-4ee5894e4camr234809451cf.10.1764241564337;
        Thu, 27 Nov 2025 03:06:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQ2C4T/zkTEcfcKbF3Z1M8/NcZ0UR/ptn/bgi8R2SS+xmUzOkuSJbfZlY91sr/2UxXeGziwg==
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id d75a77b69052e-4ee5894e4camr234809031cf.10.1764241563904;
        Thu, 27 Nov 2025 03:06:03 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a90d14sm1277518a12.10.2025.11.27.03.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:06:02 -0800 (PST)
Message-ID: <78307922-3922-40b7-be89-5c2bacbdffdf@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:06:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: sa8775p-lpass-lpi: Add SA8775P
 LPASS pinctrl
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        ravi.hothi@oss.qualcomm.com
References: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20251116171656.3105461-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <3c0e994c-7484-432f-b3b1-bc7523d27242@oss.qualcomm.com>
 <0b7dccfe-ac31-4d75-840e-96d8ddd66fdc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0b7dccfe-ac31-4d75-840e-96d8ddd66fdc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ht9VBQBwb2g57vN5MN4EaTysVz89jhjR
X-Authority-Analysis: v=2.4 cv=AufjHe9P c=1 sm=1 tr=0 ts=6928309d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=PbRpZkKeZxfV5sauP3EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ht9VBQBwb2g57vN5MN4EaTysVz89jhjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4MSBTYWx0ZWRfX0nj/Rl8erC43
 7YaHna9ntdmpMvo8INXMzgQVe7uw4iBQot6Mr4w8S5QhymDrUiolWuPW+JaCVTCLT5WR2wc3LXf
 x+CDb818MwoYr9ciuYMR4X0ciRGjIOr8aaScDlAdATxDd+ILCUlo431EYdAcPE9jV9Gpb9awnoC
 WP/zGO3YWqXRJuQ3ON6jbjUN+mz4RASGY/a+uBMx+38pmDf9M+owA/iPGIgcIc48BXhd6Kghg37
 7KueK/e5W+9ZX4ZW671GvSbhMQf0eurww7HmSAUz4Pc/9Zy/UQHkWuPPUaW6ek17MW5fDMeVf/t
 ZYZgrvqCdIAGt8PtA1Rh1fUViYzACKy+ZvBVqMXad31ZaH/hIEnyWe5I2pDtPeANU0woto8RjV4
 G0awNZeh+A5OObd0RJ3cYs8+jZ2Qow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270081

On 11/26/25 6:31 AM, Mohammad Rafi Shaik wrote:
> 
> 
> On 11/17/2025 6:47 PM, Konrad Dybcio wrote:
>> On 11/16/25 6:16 PM, Mohammad Rafi Shaik wrote:
>>> Add pin control support for Low Power Audio SubSystem (LPASS)
>>> of Qualcomm SA8775P SoC.
>>>
>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>
>>> +static const struct lpi_pingroup sa8775p_groups[] = {
>>> +    LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
>>> +    LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
>>> +    LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
>>> +    LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
>>> +    LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
>>> +    LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, qua_mi2s_data, _),
>>> +    LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _, _),
>>> +    LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
>>> +    LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
>>> +    LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, ext_mclk1_b, _),
>>> +    LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
>>> +    LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
>>> +    LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s4_clk, _, _),
>>> +    LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s4_ws, ext_mclk1_a, _),
>>> +    LPI_PINGROUP(14, 6, swr_tx_data, ext_mclk1_d, _, _),
>>> +    LPI_PINGROUP(15, 20, i2s2_data, wsa2_swr_clk, _, _),
>>> +    LPI_PINGROUP(16, 21, i2s2_data, wsa2_swr_data, _, _),
>>
>> The max slew rate value (shift) here defined in the register map is 18 for
>> this platform
>>
> 
> ACK, will update proper rates.

It (although generally very unlikely) may be that the register map is missing
something. You probably know the hardware better, or know who to ask. Please
check that.

Konrad

