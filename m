Return-Path: <linux-arm-msm+bounces-84216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5028C9EE56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 12:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 826453A6BB7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 11:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713612F4A12;
	Wed,  3 Dec 2025 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VXzQJSk+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4E07yZr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4C72F0C6C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 11:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764762476; cv=none; b=KLO4S/b16Biqa+VmSR1vg8hE+F5VKwe04tH0HnQXesfS2IFTzV1pFnrhqQb/QYKeSRFymMLlsHMAcZoavWxVUtOjSZ82YtW3NXZX1WSrZfEQlQS3edow1VEXjLzb+FrS1K5mUFXJWpVszQccxmWeVDSQljeuxdtZZ4jrauJNVH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764762476; c=relaxed/simple;
	bh=R+yabMfq2CeFVv1mWTf7SfgSUt1s0X+c+O9zex1v7z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiwavBkBwUpkoJuSR6/IHWhFGxJ33roEk8qvmfpUBEIdjUkOhoQVZis2NlDXossb5n8GSQND0BXZNDNSepn61NqotCTJyybAXQF2JUUAgMZRTPHkTlPIda015JDdJaKxgXduUVCW3siiP8r0uWivfuIN6SOoy5IEKt78fk8Gqak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VXzQJSk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4E07yZr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39NgfN2113670
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 11:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nd9ki3tDwaPjkpseWA7+nqpKnc4JcNumJ/bvAFF5e0M=; b=VXzQJSk+/mp+WEJa
	P29s137LPWlzcWOLMnsWYXIz6ZGRC1QEA+8uTB7MTKIekl0hRXtSfKOQqbd+LjK2
	y0DFT3e+5rVrOKK25+9HCS+nwm48CnL7r6RFSJF6uLD8KwCurpJw/klet3Kd8mV2
	X+gljmZLa4kJsJ0i9uuahvDzyCG9FwyVyYAL4KGK1PWqb6WkNq3p/WrX0lp8pyEU
	3fY2FScMG8RwCyMzE7MCZQdE+liufgEBYN1C1zjc+htlKCauM2OCwCZv+wCHfdZ6
	d736t9nvRyomVKuATdxyEixDQ9AXh89wJ3Z8SBxtEFWy42h+Se0PFxMwDfsXmw9R
	PRssKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjhpgh46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 11:47:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1be0fdfe1so200865485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764762472; x=1765367272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nd9ki3tDwaPjkpseWA7+nqpKnc4JcNumJ/bvAFF5e0M=;
        b=h4E07yZrBzNlqAYt4sH3bYc7m0Jay2nOijpyY5YquyCGCE3URqkW3QMg5iP4mRnIrm
         AqIRldPxkKMec+2D0hLkt/kgXbGNPzHJer+rXV4Kg9RxgulNFYO5NVXACRIWwxpIBrPS
         tWpxIwJfoTmGRSemru6Bhfqb+IAwrnaDq1+J5yJ+B34/BP5g4OzdjLPsE9Xf6an0jTPN
         FnVPjniCXAkAgT6lq+6phlYDJlz81aCuO1voCXJo2EdP1XV3S45anALrl73exaWQVjem
         BB4VgH/YgYcQW5deS+0U2E6X8cOIoKkB7qW8hTsXnhmwku3uBnjjfqW4KnTOaTyRlX3V
         /4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764762472; x=1765367272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nd9ki3tDwaPjkpseWA7+nqpKnc4JcNumJ/bvAFF5e0M=;
        b=wu8hhbgvWWTtypHh48zmcayfmX3CLVagM9nd7jGTzO8/KZ7cAYAfDVhRKQsk4wQYMT
         G7UYkJXic8av1d1iUPJiv0wHln277HiYnVcU35gXmXqCqEhT1BrHQNyXkwv6IV4BI5YZ
         8WRmMF02lA6OmryIEWkfUEVQvIk4h//ftKWC/5GeQjlxXg7k0VZLGqw7+Yj+OJCC64n2
         OvkvrKn9V8w5kU7Owt+nlcj4mtCoMu5eS6oCAACOn+CCzakVXgeE3Ntmv2yo5fuSKiP8
         TIcCDcrep7jiYC0HUzUSPiL88gypNg/h8kRfEpTUq9TtUuG/tgUxujxoIIWqioH7iTyE
         5PJw==
X-Gm-Message-State: AOJu0YxB7E0i+0flZGpDH23bK5Dql18au748+PeuQC8BS5Qj6x7i2PWn
	axmTefm2d42YzSUEMt11SubvQJxRTxN+hnu08Ay66ocjvC/+62pwm7v4iJFeb6vTsR/IhfKpUsa
	S6gGRJpr//m+6Yo+2Op1sxdK1ZiBQjiclrWPsHzEJYTXQcOCtD1ZTOhyiAa2TtLNYXMpS
X-Gm-Gg: ASbGncuUbyVFoetNrGzQ9E8c9vvqVjR76Fpe2sjLUB+Gom8s1jEpugHeMKXfnXZMVc6
	sW+ruJw3zxkFt+oCdXTxNZDoCwvhbAat+VMUFI+/NDagKcunC/8bsS2d76IxUKvXpPsFA9qKxk6
	ift/s4euKAjKvLaSxZrqzPb0QMvl3xLxKTxkdcTVLwkaLweigipYPTrmKVVJGBNggktMF1Ll8xC
	87wXxdDuXd6XivHwLpaZD5i3RFne3q29eyKzemwS1n+NYt8FFMJAey/lJexPjshlNiP/J0zq2CD
	Ob41W/lf8gGaSz5obxWvwRfRORoyHrdydY6QSf4r0s00QoEzpnE7GuODt8WCiEwTfE/fEf3yDEm
	SFemD/yR3cVjTUGFUkNprS4xmfJ/O0tRV74LaWa3yF3OskgjQO4aECBRKym+vbFJrrw==
X-Received: by 2002:a05:620a:4589:b0:8b2:e5c6:b4a2 with SMTP id af79cd13be357-8b5f8c42528mr87847785a.1.1764762471815;
        Wed, 03 Dec 2025 03:47:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBRMlDQPA1Ek9CZxMtlKfL/JpqaSfedRc8S7pSaotdOtL2dXOJnNoBhDBqB5UQ54dOvo9PwQ==
X-Received: by 2002:a05:620a:4589:b0:8b2:e5c6:b4a2 with SMTP id af79cd13be357-8b5f8c42528mr87846185a.1.1764762471383;
        Wed, 03 Dec 2025 03:47:51 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5199852sm1755995466b.15.2025.12.03.03.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:47:50 -0800 (PST)
Message-ID: <638f4184-b582-4a48-ad63-7c1fd2db492f@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 12:47:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: lemans-evk: Add host mode support for
 USB1 controller
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com>
 <ffd6dc9a-372d-4db9-9c2e-92f126cb5ebe@oss.qualcomm.com>
 <49ecd190-1aee-42d9-9e6b-c155170aa38b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <49ecd190-1aee-42d9-9e6b-c155170aa38b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JJg2csKb c=1 sm=1 tr=0 ts=69302368 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cwXdGsxWxYVqnuK_q20A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: p1hZcHiDfKoTiVLZWQk6f4uzzjYowBul
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA5MyBTYWx0ZWRfX93a/6udiNpDN
 AFKLJu2+94Bt9cVdf+dk2+LOM7cdPP2/I7rT+luwqA8YCbQ+q0l8Tyz1OMa4aY9XptOWCNlrFOO
 Gq6iXbP8gf0UmIjiml4cftWuCVCMk6d2qZYaQjEbA9I2ZzzM+JSqOXjBF1MpxKv8qzrM+AtQcVr
 VwqqJt9aGvh6Bs7rbXwGDGtQ8iDa3wOT9+NIia5xEocD8q+eRunr0cUHEfoUHDEVAIlfT6GsWjj
 9nT6CCVaAhzO+lKOLkHm9Y3Os/IT+BcNjeItBbzynJoKkpmxU9OqmXjlkDV1dNb0l5jB/SOvhWw
 PC/yDbNe9S962bOzyExsppJnWvE4h02EO7OliU8UHfJDDVG/lVZAM9a6XYLy7JqJclKdW4UKNIO
 cvuLWcCom8hSqIg3d3hOyFehOeNiPQ==
X-Proofpoint-GUID: p1hZcHiDfKoTiVLZWQk6f4uzzjYowBul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030093

On 12/3/25 12:41 PM, Krishna Kurapati wrote:
> 
> 
> On 12/3/2025 4:59 PM, Konrad Dybcio wrote:
>> On 12/3/25 3:42 AM, Swati Agarwal wrote:
>>> Enable Host mode support for USB1 controller on EVK Platform.
>>>
>>> For secondary USB Typec port, there is a genesys USB HUB sitting in between
>>> SOC and HD3SS3220 Type-C port controller and SS lines run from the SoC
>>> through the hub to the Port controller. Mark the second USB controller as
>>> host only capable.
>>>
>>> Added HD3SS3220 Type-C port controller along with Type-c connector for
>>> controlling vbus supply.
>>>
>>> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
>>> ---

[...]

>>> +                hd3ss3220_47_in_ep: endpoint {
>>
>> How about rename the other one to hd3ss3220_0 and name this one hd3ss322_1?
>> _47 doesn't really tell us anything and may re-appear if there's another
>> instance of this IC on another I2C bus
>>
> 
> ACK. Can we rename them as "usb-typec_1" and "usb_typec_2" ?
> Krzysztof suggested to use generic names and hence we used "usb-typec" instead of hd3ss3220.

The generic names rule only applies to node names (text before '@'),
the labels are generally only expected to "make overall sense", I think

>>> +&usb_1 {
>>> +    dr_mode = "host";
>>
>> The connector states it's a dual-role data and power device. Is there any
>> reason to keep this in host-only mode?
>>
> 
> As mentioned in commit text, there is a onboard hub sitting between SoC and the HD3SS3220 port controller. Hence device mode can't be used. This was the reason we left the above port nodes empty since we can't connect them to port nodes of controller.

It would have helped if I had paid more attention to that message then..

> Can we mark the connector as host only and remove the empty endpoints ? Would that we sufficient ?

The connector should definitely be marked host-only, but the endpoints should
still reflect the physical connectivity.

If I understood your case properly, this is analogous to what &usb2_2_dwc3
does in arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts - see Commit
c02716951e66 ("arm64: dts: qcom: sdm850-lenovo-yoga-c630: add routing for
second USB connector")

Konrad

