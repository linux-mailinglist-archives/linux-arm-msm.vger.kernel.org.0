Return-Path: <linux-arm-msm+bounces-40622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4B19E6019
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 22:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A8421651CC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 21:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076081C1F02;
	Thu,  5 Dec 2024 21:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElZEW0SV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658E4192D69
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 21:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733434194; cv=none; b=ZPNCAxYO4PVbj9Iw5rsOFDk2zE1Pz1z6ctCZnv4uuHvnaUcLnQPvGy/gMGjchtFA0Q+4oexrD4mynepTXjFL03FnC88OXQrP8uvVwiX+zL+KXLv6wr3TaNXOQiJ0qbj1Tn9byDyv09VXhggoj2GEh9ntX2n3xOxZCW0H9fHhqaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733434194; c=relaxed/simple;
	bh=gBhI0bm83nD4F6ci3DPATOQR64oPTgFRK5nJLhi4Rfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHf6dLcxjC7snef6FrL4NwTwVoGWXYmRYxZgNJrvYmM0aUYVPAmaPqp7/P3f5Fv1qYUayDnKYHvosvwZAgWcOzK274Fy3zcotf13515LIPV1Pqabhtf8sMujZeAb7w8m3CBpBKH2fzhXMJ1V9krLINTQcozMb3Mdc2Qohue1X10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElZEW0SV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaHnF017344
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 21:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	efl0ofco0IcUEUS0WoevpM0QoH5hWyp/iE3lVMb/DzA=; b=ElZEW0SVJfO9pS11
	cUSh327DNKJBdwuL2r2eogyVQUISzwyUAHuE3reKmhiajUP14Da/ipdeRle0sLsy
	8iXbS85xYPtXhtKIZJb732ogzaJDlA9Qj1N+hS1TGCxGxclf0vUYR8QJ5L31hD8A
	I7qPKsawcqZCaJ5RUnEQPveU9sJGzHNQID3bSyVHgP/sWpe3jnhe/OW7vio9Nco2
	NbpYs7cqyXWb18BwG7tG0TT85AlH3A9PQD8KU6cuPj2XOewvtpGeibdVsnKl+ZPV
	fZq9KBs19tB53fzLn3G4/Hfq5EqUq1jpNz5Jc7IsQQ9A2pfw7bqpvDDX6w/Bi0De
	544OIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbnj1g8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 21:29:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b66ef699afso6638585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 13:29:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733434191; x=1734038991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=efl0ofco0IcUEUS0WoevpM0QoH5hWyp/iE3lVMb/DzA=;
        b=eM5b5YcBaGMVyh6q+1t/iX4yk6JI1UIKgBTI1gymZmX6ZbeqS7fsMeSw/1k//ZflKY
         fEa/aujFyknqxd0KvEs599+SsgoFw5IhSy8SJ4a/aGpKHfAacTYV0xIHD80EBeK+RYLU
         ukKNNxxMTd0kR9KYdQB8mhr6M86lONC2qfeVjYFVzhwKG+wKs3Q2EnVSwrZdlzWsONsL
         Mdfh0LD5+WQQXA6Jo1bSywYZ7J7PdQxN+FdwxZR6Q5j6UsQ5zDo/09/LLKlFAt+oAyGw
         2YtOaq+FVAc7OG5RjSdMHp2XD8VSW4AAqPk5qBfjtqqHDye3GqHFNpHy+0fOxnSMDw20
         9+YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhBMrMjVeJI6ZEG2rHSAs6ZwHm9eX5HJ4dXtNR58WKpSCZBfOncgx/uB6/X2KMZSyRgL75ORxhIELo+qFM@vger.kernel.org
X-Gm-Message-State: AOJu0YyR4UPjxr4/gXp5pfsnGCJqfM8q7Hf+mvXR/MgIn9FSsN68NBua
	7kUU1AQiMpl5FyYmMj5fI81+YDjT8A1M1ruGY+llCf+Kbvx/ccbeZ3FC5Bf6eVlTVEYG+BiJIcV
	vBwF1AFkeOWXYQ6Hm9tmoMToY//8cOimFjFWn8WjurBkyqwsrAewy8lSlSsBi/KbT
X-Gm-Gg: ASbGncs2btHpd36xfATnZq2ZpL74fptJ4OaUr0h8JdsVgmwkDVP5bVs0HTgHrAsMhdI
	cSdhFl6bvUrz74GdlGX6kk4yRDMlQ+qJKilV3UpgleHy5NyFl1vJkxSMww2IWe67GrKixpW9bJo
	+hnAOO5ybOMFvZCgn/70p3PvIrgyeJHgE58YPCnR8mkqDf+KhcHJw+Jc+SXNeGBKCGtWFdBD7PB
	0HWRMQTxdFjbz3zsnCJLur9nHrMMIipGU81a6Z5VkK6os/MQN8GvkVcIhXHvRbdWqDqJrXVAd2k
	quIs0t3PiSrTT9oGzkSFQQVgqThJYms=
X-Received: by 2002:a05:620a:4081:b0:7b1:4537:f57d with SMTP id af79cd13be357-7b6bcafd13dmr49007185a.9.1733434191377;
        Thu, 05 Dec 2024 13:29:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3uIvTj0pHgIm/CkCxzyUcggXhdHNl9bKj1nZMK1Odu5jBfhEPSkmMsCiJxa1S0NUQzbwqmA==
X-Received: by 2002:a05:620a:4081:b0:7b1:4537:f57d with SMTP id af79cd13be357-7b6bcafd13dmr49005485a.9.1733434190919;
        Thu, 05 Dec 2024 13:29:50 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260edc66sm143944466b.203.2024.12.05.13.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 13:29:50 -0800 (PST)
Message-ID: <14682c2b-c0bc-4347-bcf2-9e4b243969a7@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 22:29:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300-ride: enable ethernet0
To: Andrew Lunn <andrew@lunn.ch>, Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20241123-dts_qcs8300-v4-0-b10b8ac634a9@quicinc.com>
 <20241123-dts_qcs8300-v4-2-b10b8ac634a9@quicinc.com>
 <cbd696c0-3b25-438b-a279-a4263308323a@lunn.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cbd696c0-3b25-438b-a279-a4263308323a@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cmhZT_xK9eySYyhnenG8RfJSD7-a5H76
X-Proofpoint-ORIG-GUID: cmhZT_xK9eySYyhnenG8RfJSD7-a5H76
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=861 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050159

On 23.11.2024 8:41 PM, Andrew Lunn wrote:
> On Sat, Nov 23, 2024 at 04:51:54PM +0800, Yijie Yang wrote:
>> Enable the SerDes PHY on qcs8300-ride. Add the MDC and MDIO pin functions
>> for ethernet0 on qcs8300-ride. Enable the ethernet port on qcs8300-ride.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 112 ++++++++++++++++++++++++++++++
>>  1 file changed, 112 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> index 7eed19a694c39dbe791afb6a991db65acb37e597..af7be26828524cc28299e219c1f0ad459e1c543d 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
>> @@ -210,6 +210,95 @@ vreg_l9c: ldo9 {
>>  	};
>>  };
>>  
>> +&ethernet0 {
>> +	phy-mode = "2500base-x";
>> +	phy-handle = <&sgmii_phy0>;
> 
> Nit picking, but your PHY clearly is not an SGMII PHY if it is using
> 2500base-x. I would call it just phy0, so avoiding using SGMII
> wrongly, which most vendors do use the name SGMII wrongly.

Andrew, does that mean the rest of the patch looks ok?

If so, I don't have any concerns either.

Konrad

