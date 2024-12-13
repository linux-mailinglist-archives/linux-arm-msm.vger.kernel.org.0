Return-Path: <linux-arm-msm+bounces-41999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 211F39F0B75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAE98282849
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 11:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396461DE899;
	Fri, 13 Dec 2024 11:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0eh0JwL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983481A08A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734090149; cv=none; b=Kp2+I5XGIYo0qFkc6c5nYBkeE4nAOmYVlMHRGpQmrIjOg8WaDm3cZTuP+exMSHOgglZLCMqRC8YpVprqCMOtyMDdD4IFReJPSt/+7zZ59pm9rNS01CJQaYCb2T1BuL9+Rzsw92wGEZqanlFzRDps9CjXknqA8T6PbjNT8TrzNX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734090149; c=relaxed/simple;
	bh=KfwElkoamyBr6dHaJmCP1yGZQtya9h6Gl4i7XC83T+w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bQtogsb7fckIpiQVwrBQ1uAV8TbqNFdFAgiuH+usnD8L2rq/ETK5uAlAbb2Jrm+b+4+uE1GNzTNr/wu9dud7BOh/Wah4H1PSCrpnu27C8/nvNfLd4H2J44XrPooNFOg7C5fwk03F1zImrC1H/D0nMTR40DRzte4fSkrAQ4Ov+r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0eh0JwL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD45lnL017226
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQv7IVxjVACkrTRCvKOM4p4nwCL4rvLfPutFmzt3IYg=; b=W0eh0JwLthlif8WA
	GZMXwZCPyXXIEQy5MzDgB5Jj4JLgbzOsuspzrzjqEJjoRFNQl0TyFGKprGaPhOUm
	GQ4On/lC6NXH7e4esA5Ruiuk/d3Qqqonqu4Xw58aGQeuzxE1lqbXZTWqyYnYrJjR
	HgIh87cb56Rv2e/sdKrame3xSOgkJYn9+PW9JCGOqyvP1LB7pk/v+TYfv/Cm+hAj
	Ny2ERFc8F2wcYGR6sa/hDV6NYmEHglIbIQajve7dPBOrGVIHCmQrcoviUHVUOX6F
	97lSmg1OaRJUvAZ6ZRe3aqw26ngBPj5g6XZdXY10MzweCmoI6Da9MJ4f/+xzw8ca
	tVjn0A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gdkn15fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 11:42:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-8019860a003so1254797a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 03:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734090145; x=1734694945;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQv7IVxjVACkrTRCvKOM4p4nwCL4rvLfPutFmzt3IYg=;
        b=j/kZME+VfvyjEdCa2ERUG8cbmVeObZmVDFdHxWpdrr1OBzWrVNOJ6KUy3Dh945qwrs
         N4Q/gcwUKbL13Lv//UP8gEx6YrppdCrOFBqq2aFkrhRns4E8WMQQWqUa25Zux3wHEr7D
         wt4DEfuKWG7HKsRe23bQ53OQLayDbf78FHZtsvvRbMZsvLe+4PtnM2LwZvt6AkjL7wIM
         FPHsq5IAqmQSbjIKSk30iJqtQzOYGJ4P4Q6UIbEbEyvS2ngh+c/SRiaYQGR8BTwtuRAy
         /6Xufx2ngU/YXJm9MNi4yWyQyzIC5vZI3nf54zV3UrOCU+6xcVUXdmX3sazpW7HUMHVu
         tUFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwz+Ze8VpBxiJ7ipNq661EykgpWozOtgyqlvL3JCssOYqkOOTxRq/ADm4JnvTPD7qh2VMEYypJZPuFxB93@vger.kernel.org
X-Gm-Message-State: AOJu0YzvkA52dF0vDZB7NLYZQ8fLv2hsjCaPFv2pUUZ29E/jUtw3ZznW
	MjjXscvGqgTMikn1vDZDne9J9FqVAM6tCAOMJ57ZKvBgYNQlqGfAR317eLL7ndfV0EPEw07LWLQ
	wyqf3NN34DLKccJKzQPhgfBtZ5EBDzXdIVLEjxXjzx+uuNQjigZ5O+7dNv/R8okQ0
X-Gm-Gg: ASbGncsbIQtEaLUIqvHwLRyKD2vMZesqdZlCeq4iOcs2MMNfIfEBeOF40rJAeVy53dW
	awCMGJzk5M9lfMmgiNlGEJgzBHCytniX8jScf3UFYVzignCLIh0lgkqHFWyVbUb4uNYkqoANHh6
	FMI9ZWVfpJh+QUArxgPSh+uZMS4gGAwzySZstbOB8+qz9a+XWIZ2GVvrGfLNMrhTD7wU4s8ozeP
	WPFzSMBznSS9G8cOB0UElm5WjOsSx9WMvnsb2yxWG3a3WYst2j1dg0RHH/TgbcIoCMqJstC9iOZ
	quXKrMgqaopi
X-Received: by 2002:a05:6a21:33a2:b0:1e0:c378:6f5b with SMTP id adf61e73a8af0-1e1dfe00a4cmr3432563637.38.1734090144778;
        Fri, 13 Dec 2024 03:42:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbRGjC5kQy8J8gqH9ctFRDR5zOT73qras+Ov4x8ubPpgzJl0ESePQz9BB2CprPbojLAnteEw==
X-Received: by 2002:a05:6a21:33a2:b0:1e0:c378:6f5b with SMTP id adf61e73a8af0-1e1dfe00a4cmr3432531637.38.1734090144436;
        Fri, 13 Dec 2024 03:42:24 -0800 (PST)
Received: from [10.92.163.196] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f1fa8ad1sm8583351b3a.103.2024.12.13.03.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:42:24 -0800 (PST)
Message-ID: <6800730a-d164-40a5-a3ae-dca3b1909c27@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 17:12:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Enable secondary USB controller
 on QCS615 Ride
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Song Xue <quic_songxue@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com
References: <20241211-add_usb_host_mode_for_qcs615-v2-0-2c4abdf67635@quicinc.com>
 <20241211-add_usb_host_mode_for_qcs615-v2-2-2c4abdf67635@quicinc.com>
 <cc3edfc6-f53c-401b-b766-f8e560eb24b9@oss.qualcomm.com>
 <lqscul6yal5mmztup23rcgmyqhfj3vt45rxxsw6ocrnumwfpfe@g3at5zqvtd5u>
Content-Language: en-US
In-Reply-To: <lqscul6yal5mmztup23rcgmyqhfj3vt45rxxsw6ocrnumwfpfe@g3at5zqvtd5u>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iPxTNERSe4TDV7qIYkWvy9YXedRgNbrh
X-Proofpoint-ORIG-GUID: iPxTNERSe4TDV7qIYkWvy9YXedRgNbrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130081



On 12/13/2024 10:50 AM, Dmitry Baryshkov wrote:
> On Thu, Dec 12, 2024 at 07:14:22PM +0100, Konrad Dybcio wrote:
>> On 11.12.2024 9:26 AM, Song Xue wrote:
>>> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>
>>> Enable secondary USB controller on QCS615 Ride platform. The secondary
>>> USB controller is made "host", as it is a Type-A port.
>>>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>> Co-developed-by: Song Xue <quic_songxue@quicinc.com>
>>> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>> index f41319ff47b983d771da52775fa78b4385c4e532..26ce0496d13ccbfea392c6d50d9edcab85fbc653 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>> @@ -203,6 +203,15 @@ &gcc {
>>>   		 <&sleep_clk>;
>>>   };
>>>   
>>> +&pm8150_gpios {
>>> +	usb2_en_state: usb2-en-state {
>>> +		pins = "gpio10";
>>> +		function = "normal";
>>> +		output-high;
>>> +		power-source = <0>;
>>> +	};
>>
>> Does this go to an enable pin of a vreg / switch?
>>
>> I think we settled on describing such cases as fixed regulators
>> (that are always-on for now) - would you remember, +Dmitry?
> 
> You are right. Usually it's a fixed regulator. At least there should be
> an explanation for that pin.
> 

Hi Dmitry, Konrad,

  Thanks for the review. You are right. I missed it. There is a switch 
TPS2549IRTERQ1 that is being controlled by GPIO10 (just like in [2]) and 
provides vbus to external peripherals. I am trying to get some 
additional info from internal teams before sending v2.

  I followed [1] instead of [2] by mistake. Will fix this up in v2:

  [1]: 
https://lore.kernel.org/all/20240206114745.1388491-3-quic_kriskura@quicinc.com/
  [2]: 
https://lore.kernel.org/all/20240429162048.2133512-3-quic_kriskura@quicinc.com/

Regards,
Krishna,

