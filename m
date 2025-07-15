Return-Path: <linux-arm-msm+bounces-64975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C9FB055B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B93DF3A42DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7062D1F64;
	Tue, 15 Jul 2025 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pc+0A6W6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47CA271440
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752570100; cv=none; b=QpIDS8fweR6wRmoc6NnSSAlJA+LFqRYWvsusSozskgOc8N+jfAsk/d/F4LQoxwFFgPsXqPt5c9Yt7+CcJaRn29sRXBO1qna0tb0zl3w4ctn7JYF+pHuDOFAvCN6wgeL0Iydt4YyhO3Eg8Tf4ljoj9VhwTsmIJSCOS/b3eBMOyXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752570100; c=relaxed/simple;
	bh=eWKL2Pfk9Fvzk6xqq6xZOUlHF4Q+kqfHm4qTAQTuWGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R3eXrIJqGDZTHfxVYelIQxwob9BAW09UDp5yY2Iz67hBBJdtxBYwnreJRQwSdNd4yZ05b/zGtSVikI2PB7okyGdocOux64cuRGRCO4qYpFseVai5IWtLGdZvE1isMHBPo7oPvydhHDBfSosV/MxtZOvzBQ237egYZjk87R+ZcII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pc+0A6W6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F7NobK020865
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8a77/rgWkOVThBy9w14I7Q1+EzmtuydM2ty3lJNP9g=; b=pc+0A6W6hdxvvbE/
	KhUzixK2WYyLJVnPP7GZ6SneWqH7VulEb0DCMvvJ/ujn/NY0TbR5AmIdeh/H6PhI
	Otyb9R2HiWAu8GOQzgMeEcEZuwlM6Z9dkqQXXutnGIyeiFIVriqr+VZLiQ4/iIbo
	gf7CuLT2TJl5W9SSnA6flTwVL33qPTiYKtM0pOX9N9xnnPvNdW6IpbN466GU7NGw
	P8GwpKtC7vkc63+j/5x099za08UDBk3P8yx6TqKwMEUoeE24sSEw2ydqpbx838xm
	oNzShPGdHuWQ3Q+e3B4EnteR/w7siLyOSLkOgzfOUzdZ0Yedq0P0v4dcmq5soszo
	JIRIOg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxayk6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:01:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7dfd0470485so110126785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752570096; x=1753174896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8a77/rgWkOVThBy9w14I7Q1+EzmtuydM2ty3lJNP9g=;
        b=EP9SCCQeFvYjCBMoLwm8PD5aSEcN0r/XTGIdfVamHOVj9NwTsaknoju7FlRT+5gbE3
         O09KBUprE6y3DCu9ycW+VSAGYUj1zIftiHSAkk7qQfRpogNFXAy2GfKJ0fKcuX39S7kO
         gUzpKfWn9mADML+/jh2JdwVXWagBk71p6wKA/abxUyymvz4A5gYDs2xCQfsy2ZqGIBaK
         EkfhX/DNUKlADBgKJtHpJ5U5AHRDZAncia7jCZUQwDyP+NYpZAelD1LvyyQvRL57XKUZ
         ebmTfCLqEk2yO7u+Ix3xQbPC3fL0ByACYsgGPxslhe3cVzX72Pmb3qi4VGhRjt96Ckyx
         duqg==
X-Forwarded-Encrypted: i=1; AJvYcCVWj6YvCjhHdTXHPkaTEkH5vMMZbboIPV7a3tOUVb0KAxlI0voDJ1BIpP1ah/B0A7D10zzDVLsnTBVV/WbV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy55ShQQfDGSpDVvrrAwHRWfXEELqNVnJKhnd71V8jZ7Xf02j/I
	p1jG7+dn1Y+uyN0Mt0nh8vYwmTueig5kNPKQEvy/wHHBBHnEwI0AjCnjzomvJh8sv8aWkUA8FYL
	SOXACdis+Tmlmdjr9rJ1UQmKEifY2fl0ToRyko2DbncXDr6S8YNezOah+oK/NVBrKoHD9
X-Gm-Gg: ASbGncu73Dc3S5wPzpZd2wSMlSKZ7SBwsMzce8cITsOahXwfCcpriIAvORO+pX9uvtt
	axxglnNmSGb4a0My9cooH3j8kbTviJTFdG5QPAzn36pCoR66wQpc/fNeY64N2pKCT6Ny8A0SPOI
	hBpDQEk4XNHIrTepC7EJZUlEuHIa7spB51O7e2pE6Pt9SGXPeOAnwSt/pDXNfKYsf0mxTwSlWd/
	4s0vM2mSsVbwGQYCjFj5LA/i175CjzZpIm1V9SN6296P7fo+OnDzpQaUooeLShMNsUBu3M20faE
	IwI3PGONmaZ0PRw7KxH8I+O+lkiDrI9uZ9UZT6LbDL0acW90sAD99GWtfbpmo8gvl+aS75PGANa
	PfZtVz2buDE3aGHIyY2rm
X-Received: by 2002:a05:620a:2953:b0:7e3:31c2:2808 with SMTP id af79cd13be357-7e33c74677cmr44165985a.5.1752570095553;
        Tue, 15 Jul 2025 02:01:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnFcI+xso0wXHQrA1YLMhJJGyjMb4Uc71Eps9YMyLdxP02OOfX8h0vUGMbiD85MbssFlE5nQ==
X-Received: by 2002:a05:620a:2953:b0:7e3:31c2:2808 with SMTP id af79cd13be357-7e33c74677cmr44163085a.5.1752570094928;
        Tue, 15 Jul 2025 02:01:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611ed4c1830sm5595614a12.69.2025.07.15.02.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:01:34 -0700 (PDT)
Message-ID: <3b760685-97db-46e3-80a3-7fad69ad31cd@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 11:01:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
 <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
 <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
 <53a19b1d-5665-4937-a07c-5dd1fcde06c5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <53a19b1d-5665-4937-a07c-5dd1fcde06c5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jf3fr0sXS-Z2pQJNdGzGP47H3YCyQUlN
X-Proofpoint-ORIG-GUID: jf3fr0sXS-Z2pQJNdGzGP47H3YCyQUlN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA3OSBTYWx0ZWRfXwtJKjjLNMH8i
 sv9BTWTc94T3z0R42DsFAju//cog6hoa/CHzrAV/5TacNyT1ySEFx9iTwByAyyB0mdAE7NVEZAZ
 nDz0o0fBBJ0NZVB5BHABfO7oIRXr4w6u70rl9+XRwOImtE9BvPT07ykVoPmEf9xmk4rkxl+MLXO
 Pc5491YOnbStECPq1EdK7WWAXP7JDjS+q4iGWx4rzYw4svl7/Wnn1qY8PszhiTQCDrk5p/DtfK8
 yY9ymEIHjhTSTOMAl9Rh3UIan6A/ADME/XJhds4dXBOKVnTO96+pp8R0uSraYZ6/XVw+QTHdWEx
 XtQatdS9eWIKd9EKkRKKcq9C2HVDY9toZhN1NwGoFhekoWped+LpedLJLnvkUX36vP8FM8wQxDO
 wB7gIZ9sW3ghjA5wLqFdwIqVbW2MMyMPffZSv6lvIOAz2kQl4NqiDkP4aW0fP++Gdggzg4OS
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=687618f0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Smkn-MmeJTYLAJgBHQQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150079

On 7/15/25 8:35 AM, Vladimir Zapolskiy wrote:
> On 7/15/25 03:13, Bryan O'Donoghue wrote:
>> On 14/07/2025 16:30, Vladimir Zapolskiy wrote:
>>>>
>>>> I think that is genuinely something we should handle in camss-csid.c
>>>> maybe with some meta-data inside of the ports/endpoints..
>>>>
>>>
>>> This is a CSIPHY property, a CSIPHY hardware configuration and a wiring
>>> of sensors to a CSIPHY. Where is the relation to CSID here? There is no.
>>
>> All the PHY really needs to know is the # of lanes in aggregate, which
>> physical lanes to map to which logical lanes and the pixel clock.
>>
>> We should add additional support to the Kernel's D-PHY API parameters
>> mechanism to support that physical-to-logical mapping but, that's not
>> required for this series or for any currently know upstream user of CAMSS.
>>
>>> Please share at least a device tree node description, which supports
>>> a connection of two sensors to a single CSIPHY, like it shall be done
>>> expectedly.
>> &camss {
>>       port@0 {
>>           csiphy0_lanes01_ep: endpoint0 {
>>               data-lanes = <0 1>;
>>               remote-endpoint = <&sensor0_ep>;
>>           };
>>
>>           csiphy0_lanes23_ep: endpoint0 {
>>               data-lanes = <2 3>;
>>               remote-endpoint = <&sensor1_ep>;
>>           };
>>        };
>> };
> 
> Don't you understand that this is broken?.. That's no good.
> 
> Please listen and reread the messages given to you above, your proposed
> "solution" does not support by design a valid hardware setup of two
> sensors connected to the same CSIPHY.
> 
> I would propose to stop force pushing an uncorrectable dt scheme, it
> makes no sense.

If all you're asking for is an ability to grab an of_graph reference
from the camss (v4l2) driver, you can simply do something along the
lines of of_graph_get_remote_port(phy->dev->of_node)

Konrad

