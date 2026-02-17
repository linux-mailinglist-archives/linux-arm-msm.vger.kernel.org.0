Return-Path: <linux-arm-msm+bounces-93123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FhGLc9NlGktCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:15:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5978914B3B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DB8C301E238
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBF4330657;
	Tue, 17 Feb 2026 11:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AXqVugyX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g9PxTVOE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E1B32C33A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771326922; cv=none; b=I1IKJSKSMRYkUHKPOvgEolIDPGClDIwvOjPsIwDMjqpEYU5blfpgBYTaCWi2KYgLmgO7DIB6Abw2LzYI1CdWNdYxEPLv8vrPld2qgaXeq+KSXgpM555MGB/d8hJOxZDlKDWZLWN1vR5FWVjhBhg2aMl5SRRptJM3QBaEZ9dgDnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771326922; c=relaxed/simple;
	bh=+fijnD0Orpou5zkoCNt/U4oi6qz2glc6GWXMBDIZue0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BU97GyXpP6l9dS7rGk03A1m2v+QXCvnM6MEXLX7MNLPd0AFb0upOzXLerktTj24rElslzYEzIxTHMXL0b8uJKKqa/qixru2Wd1KHeGnYLamXS5kBZ7l4Kz27dL/C2j3OJnNZfIjsx4z47TSnbVcrrWJH1sHRNzgeD0gYmQLneEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AXqVugyX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g9PxTVOE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB3lGH1943250
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ejYTyEPMYZOCpO/IUcxs5fnrHWD1qqqFGZBOuXIwebw=; b=AXqVugyXbJ27KHzt
	zDbdh9EO+L/lB4uaw9JejUk7XN+ms6SpYxsVurwGGzbtNUKijwxIcPzaSOogJ6Jr
	9LbQBsMtnsYNVOvuTbLq/tX3Pc9ozVPb/jRA6Z/yhUfjhCxGDMx8yz/A1InuObhd
	zV1lkvcp84+Ibr5EIg9mS3pARlqJlG8ceoQbVaT720Cr5lTucpkTHw8cJvkPUjg8
	dJhvFtRe1g6ItZdKsi5Da7kbbryqvMbq0fxKFVcrgg8SzVmuI77jsOz8Ztda2G5P
	6XJclM/BoU4aKzbTTL30AD54v4ah1vimg1id3/1e1LAFBqgXkiS+Mp207aLhAjda
	iwKXOw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g015s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:15:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-895375da74bso28543406d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771326919; x=1771931719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ejYTyEPMYZOCpO/IUcxs5fnrHWD1qqqFGZBOuXIwebw=;
        b=g9PxTVOEuYSEalHy1qpd20zeO54nwXwdEfUgdQj57Udyse9hejU2hPloxXNW4z2PYP
         XqbwnFgTwkIPwzUYBd+0e0lff9XG5Td6A+il6b0y2GOq/UoVkKCzVGogwg6/0R8Y8h5E
         OdIcyFmZ0pAm1ItwGyKrBION4+mZIhQpJ9pLJT11NIjX5XgigoMokLIjLKXKwmhXv1Gz
         zw5psafBZLBfFBfns+aLW72GEoKardd18BYrbF1lEMTsnRKC1RyxHaaoQazssyHbVv3P
         QLLo4bJymWjIOPWXIIYEflQWKg06c0uVgU631LSbdklbIgmUkExOwsQpAhN68SGBhrfQ
         IiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771326919; x=1771931719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejYTyEPMYZOCpO/IUcxs5fnrHWD1qqqFGZBOuXIwebw=;
        b=XJsM2JfiEzV6XaPG9v26xrP9pIBIJ5/9H14aCBl7tNePKFZ+ofVtcGJBUtaj5/laoU
         7EtMp/rnfxk1gG3lKj+aGEjMXd1vewlK04IkQaLuI1CXT1UK1i82YwjZUSp7AmeAL2Jt
         TRDUgkfGwkq8xkwKMITngHVOLtbkxeKjlXCNL5xxMyxmm1CBlL8lD2gCk74iSMD4rCTI
         CuoK1gFOLwQZ3dBjBaAQ1LcWcgYC/hsuoFn4wXOW5IKijM6zaDov/lF3ZMLyF3kpTtrj
         9BHpjRNF8/hwqgIpP9mXBQIklXIV4j4ND2AejOWJCvgIkWeN+0SbGIIPLUc4u+XTutet
         Fiig==
X-Forwarded-Encrypted: i=1; AJvYcCXmN5dGvKkMXwzjW+Op5Qam1j4lnlVlUzRW4QHx+F4apgA4UHN2MkneXW3zAzKhncMstlayUttEXoGzAW4l@vger.kernel.org
X-Gm-Message-State: AOJu0YyDt6OxU+I/mwXPvfJQzNEXjN6vSS7ErsZGlMIiKSZApDdYDON2
	mrSZcWZd74en9iY8dKEdiDI7+LZf51CUHthrNkuE14G4d1h+au+1wTzewMZgN813920q/c5C64H
	nj8m7lArwjRVQIQFOsqMFa24aO/2sPcb/7a9pu6RW8qfOjZtVqfiWwxBuulKM0dSYq4BKHpDQy8
	SW
X-Gm-Gg: AZuq6aKPJHHDSlupd7b+aNoJh83QQ7XP8SQjJtncSTxYulzszeq5oxzzkA91JaKze7l
	EXM9gyPueI/77mFliCc1cHF4OnRygEnVzG+7yE8yJJHDxwQB1crlwYoZRDcRm669MuslT+Tvywc
	gHaqaxK/iGOUoOV1yFSKg8XMj4lFRT8/1vUTcwALFQ9dFitIrnmmV9cRIsetpRxH9tuP9nXQgpV
	Gs0V6dAd141D5q7hw0P99GU1joxw+f2yVhZg85b3ZMslvcZYRKanLg0kkBILuWu7cF7+TIVJeIP
	nH5uaelM/eFUUtiBKqD9/yKTOIpImoRIMUOEsJdqdZKa3R3eLW76AO24LAReVT2GOFoQIsyXNWR
	V8QYpxzejFSM54FDj/HnEP4W81ZyV+4ftitK3+9dQfYrWR20W2RimHoZSdNq63Cz1FhEeA9/FcU
	+N9aE=
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr140536356d6.0.1771326919601;
        Tue, 17 Feb 2026 03:15:19 -0800 (PST)
X-Received: by 2002:a0c:e002:0:b0:895:3b2c:7708 with SMTP id 6a1803df08f44-897346241b8mr140535866d6.0.1771326918904;
        Tue, 17 Feb 2026 03:15:18 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766554bsm343137766b.46.2026.02.17.03.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:15:17 -0800 (PST)
Message-ID: <465ab63f-3d0c-46f7-a08e-cdc5fc26b600@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 12:15:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com>
 <20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com>
 <n6affntgff5wy4xmm255v5h2ejpepicpz2cybcuvsxmry5td6u@jucskv7zrzvv>
 <5cdfe5a5-3c78-45a2-886c-768b224ad776@oss.qualcomm.com>
 <wbx2qrkhpsntggzqkzkpi4sa6qv3buhkjbwmjoa7zgw2oc4b7u@qugyhcxb6qrh>
 <316fa702-6cd8-4842-aecf-c176a5a53e2e@oss.qualcomm.com>
 <qvuokwiqllm6zmlzj3pfvziylrr5krjya5rnf3ojeycdoutlro@fl5qukh4vorm>
 <5486697e-d02e-4b12-9a60-99d0de343515@oss.qualcomm.com>
 <2ho25tzct6t7gsuyufyg7m4a2ikmblhukb4uddwc7p35wd6yne@heippz3lh4kj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2ho25tzct6t7gsuyufyg7m4a2ikmblhukb4uddwc7p35wd6yne@heippz3lh4kj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5MyBTYWx0ZWRfXwOUmNVcrRhFJ
 Y2zH16Iw9Vpey/ZuLXl9uZV1jTlGHbOiGyIzhWrYTdZhQv4RVS+EG3quPq8zNRuG3b9fGLSBPLO
 LDJxYITFUgcUW4zmd3ulIeNkyhAGyHsIk0foBaizU1v5KoEJoZGrJlUtmB50vznnUhNGNYi5MWK
 WrVP1OlW3iyda3gvTJUJlVKY8tjIHciQVpggXLvGaUbnjdUZhlAa6TnIBnL7SeC0BWcxT9DlWit
 ENfD0X5xl4Vf3ileUtKPcDILVzCgc/K1iPCcn2NA6IUcY3vCNkv8ASbKwNi2pdfgdiwlCIwJChR
 yRH1wYQaMLgwn6aK2Kxhtf7xmto/m+P6SFjcGrZUUw85okXJki9XBAWGuYbfS/ljmtlkIp5jh4K
 ntDuntBYPtj+qDQrpQjc67rL41zz84gwERpvoylPrYm7vozabwOj5wjH2l+XxgYU+KRMWLbvzqB
 cERf+u0MKrgdQSjuTHw==
X-Proofpoint-ORIG-GUID: RfMEEMeNJYm-wqMu2nxwC7RJE6CihNhc
X-Proofpoint-GUID: RfMEEMeNJYm-wqMu2nxwC7RJE6CihNhc
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=69944dc8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=l_9iY-1xcGPmI7VCd-QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93123-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5978914B3B3
X-Rspamd-Action: no action

On 2/4/26 2:09 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 03, 2026 at 05:07:11PM +0530, Viken Dadhaniya wrote:
>>
>>
>> On 1/19/2026 11:59 AM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 19, 2026 at 10:21:37AM +0530, Viken Dadhaniya wrote:
>>>>
>>>>
>>>> On 1/9/2026 7:35 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, Jan 09, 2026 at 06:23:39PM +0530, Viken Dadhaniya wrote:
>>>>>>
>>>>>>
>>>>>> On 1/8/2026 7:33 PM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Jan 08, 2026 at 06:22:00PM +0530, Viken Dadhaniya wrote:
>>>>>>>> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
>>>>>>>> The controller is connected via SPI3 and uses a 40 MHz oscillator.
>>>>>>>> A GPIO hog for GPIO0 is included to configure the CAN transceiver in
>>>>>>>> Normal mode during boot.
>>>>>>>
>>>>>>> The main question is: what is so different between RB3 Gen2 and previous
>>>>>>> RB boards which also incorporated this CAN controller? Are there any
>>>>>>> board differences or is it that nobody tested the CAN beforehand?
>>>>>>>
>>>>>>
>>>>>> The behavior is consistent across platforms, but I do not have details on
>>>>>> how other platforms were tested.
>>>>>>
>>>>>> On the RB3Gen2 board, communication with the PCAN interface requires the
>>>>>> CAN transceiver to be in normal mode. Since the GPIO-controller support
>>>>>> was recently integrated into the driver, I configured the transceiver using a
>>>>>> GPIO hog property. Without this configuration, the transceiver is not set
>>>>>> to normal mode, and CAN communication does not work.
>>>>>
>>>>> How do we verify the mode on a running system? I have the boards, but I
>>>>> don't have anything connected to them over the CAN bus.
>>>>>
>>>>> BTW: can you recommend any simple setup to actually test the CAN bus on
>>>>> those devices?
>>>>>
>>>>
>>>> I tested the CAN controller using the following commands:
>>>>
>>>> 1. Loopback Mode Testing (GPIO hog not required)
>>>>
>>>> ip link set can0 down
>>>> ip link set can0 type can bitrate 500000 loopback on
>>>> ip link set can0 up
>>>> cansend can0 12345678#1122334455667788_B
>>>> candump can0
>>>>
>>>> 2. Testing with External CAN FD Adapter (PCAN-USB FD)
>>>
>>> Thanks! It's price doesn't make it esily available, but it answers the
>>> most imporant question: by the USB CAN adapter.
>>>
>>> Did you add
>>>
>>>> A GPIO hog was required to configure the transceiver in normal mode.
>>>
>>> I'd phrase it differently: to pull the transceiver out of standby mode.
>>> By using the GPIO pin you make it always stay in the normal mode. It is
>>> fine, but it is not optimal. Instead a proper solution would be to use
>>> the MCP251XFD_REG_IOCON_XSTBYEN bit. Could you please instead implement
>>> support for setting that bit, based on the DT property.
>>
>> Thanks for the suggestion.
>>
>> I tested enabling IOCON.XSTBYEN, but on this hardware it doesn’t bring
>> the transceiver out of standby by itself. With only XSTBYEN set, the bus
>> remains inactive and no frames reach the CAN adapter. Clearing LAT0
>> (driving GPIO0 low) is required to put the transceiver into normal mode;
>> data transfer works only after LAT0 is cleared.
> 
> Why? It should be doing exactly what is required. Could you please check
> the voltage on the pin with the XSTBYEN bit set?

If I'm interpreting the datasheet correctly, XSTBYEN only muxes the pin
into its function and does *not* actually impact the operating mode,
which would match what Viken is observing

Konrad

