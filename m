Return-Path: <linux-arm-msm+bounces-77375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FACABDE19F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6100B4F024F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B6E31CA78;
	Wed, 15 Oct 2025 10:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXa2dftG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FBA31A57E
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760525649; cv=none; b=CO+3wa9HWZXaZPYDrx7jYV8Cptso5Lj8oPV5eD5xDkcIR04Sm4ErSV8QsPklYINSWFmSQg5sR1+9JuTMxsNJ5yzvbu9UddRFuVEpYlZ2zSR13DvI6q5PSBCF0Ok3JoDKEyes7c9p3r289bsBbkOwQv5XLpV4K0I8/GaKE7E9YCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760525649; c=relaxed/simple;
	bh=MbXfnKMiKPD634gmC7bM2JdzXeP/4dF+XYw/yV19hGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AaTCAwLxNix1ZoQrrAziMRfA/xrMbOxX4X3QQfxtEo9yBuSnx9xhx4G9uo89hZG+DnxteMJ/4uMsm7O791VQkkh+XCdxLV4eTTTjpDX1SfVru/suiltpvfinwVmooPZ4xiJUPm4BtfXvkfCoNGuiYNfzSqseNXdfi2oyvWXjdkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXa2dftG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAWJEc004000
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytoLl0rwr/qVPKTq0TG/t4qw9GJbq9gcztEQZCkXQn8=; b=fXa2dftGNZpo7L5m
	JR5o4M9LMmnNQIBRt5OL1TXhnnsaOza6nKpBt161X+LTrvHXGtpzwAAUKn5pvi/l
	rZHxvtGFiQvEfQ/L4uQxxtiHn67k4L3iHRXNkEfpqFDII9jmIDUBUtWYyz65LWlP
	Iv2kKtDWT79i28NxnNbi/iwaXSs4wVtQkfzBBZQnfC7QbGxFGOFentXoVu+q6H+d
	nc/7bzkejNFARlazGR4teEIeMogDYTnP8hBe9F/sD6JDZPLUEQnzmUd8H2vyQVaM
	21eyva8giuwRxcLZIu95pXnunPSP/pm4FmCVgrwd+/hDdfCVOpztZyA5lnW2fIO2
	D/61qQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49s6mwpdu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:54:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b631ba3d31eso9517506a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760525645; x=1761130445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytoLl0rwr/qVPKTq0TG/t4qw9GJbq9gcztEQZCkXQn8=;
        b=tF12nY9s/QsYmSuSZX4HJqoWc8QtDF6i2IBOVDWHin7PpiiD7wv7uN8ISxS198720q
         g1nxmeiE+7FjLEUiz68QvX/Z0h1LnSgPGzeB3mT+c3jM33hsiurpcG6+yPnju0JelLav
         UJOF1s6FlxZeTDr9rjPbRKgXhbbQaPrfQff6DnkofAgKSQZLPE4Ito0QgWTxsRcKhl+D
         1kbybsA6yRgs7pkRSsxVCN/EOq4RwpSD9CIf2XCuIW9lE52KpfLZDjg3HygTue6zDvq5
         R13XNlqnGKAm0X72ELllduSmTUqjoftWOJPInb9OwSmdrRUX/H2WTRxkjtP32KCAalCz
         xJyg==
X-Forwarded-Encrypted: i=1; AJvYcCWwEws2v8sTv8vY5OnyCqTdU9Sb3UuA1OmL4O6zfyBlb4cJU92Q36or2OavAfAQP43NVuMGNLmRiGFfhb6x@vger.kernel.org
X-Gm-Message-State: AOJu0YwlzUAMKfZ02YbW1aO7myCiqadZdanYhWxuYKdDmXd0hjdtjyOM
	GZ5hE3Y2UlyQMoHki6lUcyJASq08Au23PIS3eZhb7b2NefS33o9ETzACugPCuIn4TY60IeeVrSa
	mO/Bzo2OyfBxQ8LZ5orOIVccQlEf9dVIairVCTpNArcxF2znOy0gS8IPJfiN83B1oEuhx
X-Gm-Gg: ASbGncvWkSnsX+lRc8vmOH33i3wwiUwMloEqRPxOrNnR7bKwZXTQ7yc21PnWXCvacci
	g0aDUtNoQU2327++G3KuaaZyx7tHZrhnRJiuCQWgFnuMP6AM2tKXABMFR4HHF+cn7o4uWmMxgb3
	n1stUicDL8oRRNGIJnEUQuW3mBFi8X+byljc5jXSKTrRu/YZWaqujEx1rW87lPmszaBB3XdZndI
	AdE6gPqDU2ZRGMILOGgaEBy5GK4iCxhn2t8vqFQfRo2YhKLwuwe3HIYGMDu3BFObarxFV113JE9
	/zX7VBWJufikpc3n+7AWwvQJXCb+dUYtxQk8UDN2c2JuC8X7+BtCoslZoT90mz67QS6Jd50=
X-Received: by 2002:a05:6a20:a128:b0:32b:721d:37ea with SMTP id adf61e73a8af0-32da81303d1mr38253407637.16.1760525644710;
        Wed, 15 Oct 2025 03:54:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMZ2LsLEh0Qr1mBvJggyLP38lECWomJIQg5Rfi0tsF1jrllNMdpOSuP9+V7wgwuseQXiJsGA==
X-Received: by 2002:a05:6a20:a128:b0:32b:721d:37ea with SMTP id adf61e73a8af0-32da81303d1mr38253375637.16.1760525644265;
        Wed, 15 Oct 2025 03:54:04 -0700 (PDT)
Received: from [10.218.44.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df66ab0sm14552514a12.35.2025.10.15.03.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 03:54:03 -0700 (PDT)
Message-ID: <026dffcf-f674-4481-b86d-07c28933c97b@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:23:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/24] arm64: dts: qcom: glymur: Add QUPv3 configuration
 for serial engines
To: Abel Vesa <abel.vesa@linaro.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-4-24b601bbecc0@oss.qualcomm.com>
 <bkenlzhh5fwspxkrq5jdcpfaxtc5hxg7w6sb6i46ohicdomed2@r2zvqvffmegt>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <bkenlzhh5fwspxkrq5jdcpfaxtc5hxg7w6sb6i46ohicdomed2@r2zvqvffmegt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDA4MyBTYWx0ZWRfX5EakRh/kC+eA
 Jw+2APaIQkgViWAetLuCD43PnY+IeCvYDVtDUoXFpyL+DUgWFoDGm4WNxiNm1q6LuqGnk7AtB9a
 c1WSz9UQIXB6gvSLGHXXVFCkMVgKL3f9J5nx2qxQuu1/y90ZW4WlZtDy+bTHFd2aDwYFfM3eaCQ
 D9UHodbccVUjWNwWV7B4w9nNH69y55pd1wOHeauZxvZMgEkApJI1zTW2MSpmMfjxdrb1ytD/UEx
 hRw/7tWiBOAfb/5XAXcMQCF1B3FVhF9j7xwlo5oQXKwwkh2oxJfa1EJW9fxpoYkdhllu0DHD4fm
 If0miHQPyy3eKfVN6YUIH04snsoFnKZSCylKfZ+pm7Y/cz0BPDbkFFfVIi543Th9c9HQlnShu90
 bOa5e/W/hDa78S9xPiziSuYMXDF+gw==
X-Authority-Analysis: v=2.4 cv=Fr4IPmrq c=1 sm=1 tr=0 ts=68ef7d4d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eQg-hl6CXMczGQ9MqUoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: rz7-EAz1nFdghhlN3SwZs8yjF-3a-3-r
X-Proofpoint-ORIG-GUID: rz7-EAz1nFdghhlN3SwZs8yjF-3a-3-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130083



On 10/11/2025 4:46 PM, Abel Vesa wrote:
> On 25-09-25 12:02:12, Pankaj Patil wrote:
>> From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>>
>> Add device tree support for QUPv3 serial engine protocols on Glymur.
>> Glymur has 24 QUP serial engines across 3 QUP wrappers, each with
>> support of GPI DMA engines.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/glymur-crd.dts |   43 +
>>   arch/arm64/boot/dts/qcom/glymur.dtsi    | 3041 +++++++++++++++++++++++++++++--
>>   2 files changed, 2936 insertions(+), 148 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f1c5a0cb483670e9f8044e250950693b4a015479..8674465b22707207523caa8ad635d95a3396497a 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> 
> [...]
> 
>> +			qup_i2c22_data_clk: qup-i2c22-data-clk-state {
>> +				sda_pins {
>> +					/* SDA */
>> +					pins = "gpio88";
>> +					function = "qup2_se6";
>> +					drive-strength = <2>;
>> +					bias-pull-up = <2200>;
>> +				};
>> +
>> +				scl-pins {
>> +					/* SCL */
>> +					pins = "gpio89";
>> +					function = "qup2_se6";
>> +					drive-strength = <2>;
>> +					bias-pull-up = <2200>;
>> +				};
>> +			};
> 
> Re-write all of these like the following:
> 
> qup_i2c22_data_clk: qup-i2c22-data-clk-state {
> 	/* SDA, SCL */
> 	pins = "gpio88", "gpio89";
> 	function = "qup2_se6";
> 	drive-strength = <2>;
> 	bias-pull-up = <2200>;
> };
> 
> Just like we did on X1E80100.

Sure, that makes sense, as the same properties apply to both the SCL and 
SDA pins.


