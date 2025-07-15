Return-Path: <linux-arm-msm+bounces-64987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5E7B05664
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39174E5622
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09F222D6414;
	Tue, 15 Jul 2025 09:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7TU44qq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC1C2D63FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752571987; cv=none; b=ML2Ej5kAJBllF5Lx9ZFxbFsBXj3djQ4F1VLrUxKUsuZH+u0QhIcjdq6bFuwM7umA2v3xviHf4/AjyK0gavSDdmujM+qHPBRmBWiA+vaRwpOuQtZTXuTckm3rieGFYesdNz+nEcs32O9C3kLlrGPCBoMmgWR44Ps5C0t77/OnW/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752571987; c=relaxed/simple;
	bh=UmVZaGJsu9p+gSw3gRVYkjWOW1ZiNpKv4kj6EGPUUYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wxw46M/KbgTJ2pMirNEd2mxBQwmo+09fMWr5LJ6E+4mRrldoorSU+1wuBE5IOclWdNx5RQeGgpr8URGi1nf72dcdl4UNwrg+ItcaK3BhMxUtQ5vxYM/hhYTuad3MMTmo+YEWCb7sLljxvWAkGH4BVfN1wXerH4PWqhxXtO9aLSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7TU44qq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F7ULTm022596
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZVKYKZI50CRu8kFfLOssIBGcOuWlmDEa2DIvNCnCY7s=; b=g7TU44qqEKoX/E5n
	ZKw1/jZstXtfBQHMJMHbVLubG83iuy6I0tciArG0dzRrmhqtd5iTMIECYqHxJTRQ
	E0jKB0fnVz0DSd+bjwfry8J7clWxezfgy4FwA24Xbm5PPMRmeZt9W+4vMbQ+2rPO
	lLubHRW5bG3WLSTyrw1yiX0N0yBK8yYAz7qVcu248c63jvhiFYTCtfdejJdpRKdl
	9t49INgET1aFb3cC0HodaSR6Nrjhn66WTsftXNipBlUJXExsYt9Bf1vP5Hl66Hts
	uCA8QrYgYtyBlvjLDuIFOnGK8MhjBYh2kOooco14zUgmFTY2w7xp63t2QE3Mby1B
	T0SqdA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxaypf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:33:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab716c33cdso7200191cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752571984; x=1753176784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVKYKZI50CRu8kFfLOssIBGcOuWlmDEa2DIvNCnCY7s=;
        b=QBs7Ig3w/+rWsDwhmgjW2Gpy+VTPU92i44aU17JTdbm7X1yQ1KQfS9Jnfhu0aG6eWi
         7CN7r5D2yFyDynlg22J5r/OngZMpbz7x1hIFSkmpLS/m+WzTNcaT9iLlc72RtNopOCWP
         ITSFZIMh2PsISQhAhKob1pSP5YV/GyFjaYJrHv72kvxqbdoN2urEPXwCZm2rbkoaH5B0
         lzzbLzvabYWlL5OWffbHyf8oP96jtC5R6689lSPL4cXZunE34oAxS9ri9RvIQbVr/s1Y
         27Fh0PWwsGOi2A0is3JuwqXhbGHgPdAreYjdbtC/lELuE7Y2YEdBOrPEJdDr9zSXfqsD
         YbnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwDRNYIxDzzStEp2AHB4SeBU4RvzKlI8HWgtxHOkGG3mfreSL85ryXA9eLpxItkYLdmNxsIKQP9QoDBO9R@vger.kernel.org
X-Gm-Message-State: AOJu0YwrmfMaxCHTHuH9uP+W5t+Ib0B6NkogAnfcBT/LguasvEkNzeVt
	QSg7J+rtPPg5SUp/EUZuP3447Y7O3HWFe/GlkSbpftraPggutLuqk/gJENmdAWPXPMwqiTINWUz
	MyhlvApllFlHE5RWd/PYIfSmpL2sHpeuC4RwgZfjlthiJRWDzGHseBi/niYxoGWVlPlBE
X-Gm-Gg: ASbGncvcGxGINfJWKE4WMx5/TwY5fkFiJdOctE7E5ZewuSp5TJjQMe6EhycVJyZn5rw
	x87R+QCioOAFkmz4J8qjARM7UtZtXY1Q7NpobpvMyFyk91W3Bd7C+NvQXEg/m3pPxBMqYf8SF+8
	OhUlLIs9Q5gNvC6rlaz4HZEjrItXYIbESjZV52slURMT8PVLL6qNjTg36CpR0g2XwsVVPZJ36ed
	RAz5bU300QsngH0eiSvRmUJ9tsLf7WLutGXaVAMr9eWDCCjOwHw9R95DRL7hPNm5LyarMuQoDzm
	gDuVRIT5i2OOnKaNE61xGDX4pWO+5S/y9wv9m5ZvPZe81ttCNfDOFU+lBZ0bZy7ax1K/i/6zIkn
	NGT2OaIayxr7gtimWy9dq
X-Received: by 2002:a05:622a:82:b0:4a9:e326:277a with SMTP id d75a77b69052e-4ab86e207f0mr4752261cf.5.1752571983985;
        Tue, 15 Jul 2025 02:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCcr4nANIHsBRbxeeXFSYzXrr7BOuMOwD02ol+PSNYDc+EIBk8wmnfYeAHim0Yt70dnuwwlg==
X-Received: by 2002:a05:622a:82:b0:4a9:e326:277a with SMTP id d75a77b69052e-4ab86e207f0mr4752121cf.5.1752571983473;
        Tue, 15 Jul 2025 02:33:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82652b9sm980622966b.78.2025.07.15.02.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:33:02 -0700 (PDT)
Message-ID: <427548c0-b0e3-4462-a15e-bd7843f00c7f@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 11:33:00 +0200
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
 <3b760685-97db-46e3-80a3-7fad69ad31cd@oss.qualcomm.com>
 <94b75177-9401-4e0c-966b-5847a29cb6f7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <94b75177-9401-4e0c-966b-5847a29cb6f7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8nftIZAztbzrW69w-dun4snWxZi0zAQE
X-Proofpoint-ORIG-GUID: 8nftIZAztbzrW69w-dun4snWxZi0zAQE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA4NiBTYWx0ZWRfX6TNnQN2aibSO
 R5Q/v8/whF81LF5yibGG5ymRxLB2F2p295o9jGapbzwMRJJhbDvTXG7r1PIw9n+jULZiUej/aEO
 SR+5u25XyvkRKHtVx9OLXKvLrUQlb7QwRpFNrjmT5jQ/eJf3biDMzvsY5q+EwdgNWRPjRyJF68y
 7lEvpGMT0FjIo+UJdKFLmFhgBDeMHcDrmCsqh+oHfNgegHBJfSBGlCFTzjFxwApL4NdxPVz5y/U
 QB8KTJB23swjbfoKkwH03wAG8v3bsObN8DkOBd8TlMNQXoRpuguxhc8tOHtFIgrOtdFu+g7Qufm
 8cGB5LEwRyKsQr/yrp3pkZ2fKjrhdkvviryVp+ocNgdn6PP7DlkJtUdUE8fa/zyAPayPMPjCbVs
 SI0Tu8FydejKc+ed3kC35ir1STQ/jYPIWKyyWKZry3oWKA/ifyWQQCn8nsvI9Qo+cAKlH4p+
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68762051 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=93KYx9Pn6tzsntpFjOoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150086

On 7/15/25 11:20 AM, Vladimir Zapolskiy wrote:
> On 7/15/25 12:01, Konrad Dybcio wrote:
>> On 7/15/25 8:35 AM, Vladimir Zapolskiy wrote:
>>> On 7/15/25 03:13, Bryan O'Donoghue wrote:
>>>> On 14/07/2025 16:30, Vladimir Zapolskiy wrote:
>>>>>>
>>>>>> I think that is genuinely something we should handle in camss-csid.c
>>>>>> maybe with some meta-data inside of the ports/endpoints..
>>>>>>
>>>>>
>>>>> This is a CSIPHY property, a CSIPHY hardware configuration and a wiring
>>>>> of sensors to a CSIPHY. Where is the relation to CSID here? There is no.
>>>>
>>>> All the PHY really needs to know is the # of lanes in aggregate, which
>>>> physical lanes to map to which logical lanes and the pixel clock.
>>>>
>>>> We should add additional support to the Kernel's D-PHY API parameters
>>>> mechanism to support that physical-to-logical mapping but, that's not
>>>> required for this series or for any currently know upstream user of CAMSS.
>>>>
>>>>> Please share at least a device tree node description, which supports
>>>>> a connection of two sensors to a single CSIPHY, like it shall be done
>>>>> expectedly.
>>>> &camss {
>>>>        port@0 {
>>>>            csiphy0_lanes01_ep: endpoint0 {
>>>>                data-lanes = <0 1>;
>>>>                remote-endpoint = <&sensor0_ep>;
>>>>            };
>>>>
>>>>            csiphy0_lanes23_ep: endpoint0 {
>>>>                data-lanes = <2 3>;
>>>>                remote-endpoint = <&sensor1_ep>;
>>>>            };
>>>>         };
>>>> };
>>>
>>> Don't you understand that this is broken?.. That's no good.
>>>
>>> Please listen and reread the messages given to you above, your proposed
>>> "solution" does not support by design a valid hardware setup of two
>>> sensors connected to the same CSIPHY.
>>>
>>> I would propose to stop force pushing an uncorrectable dt scheme, it
>>> makes no sense.
>>
>> If all you're asking for is an ability to grab an of_graph reference
>> from the camss (v4l2) driver, you can simply do something along the
>> lines of of_graph_get_remote_port(phy->dev->of_node)
>>
> 
> It's not about the driver specifics, my comment is about a proper
> hardware description in dts notation, please see the device tree node
> names.

I'm a little lost on what you're trying to argue for..

I could make out:

1. "the phy should be a multimedia device"
2. "There is no ports at all, which makes the device tree node unusable,
  since you can not provide a way to connect any sensors to the phy."

I don't really understand #1.. maybe that could be the case if the PHY
has a multitude of tunables (which I don't know if it does, but wouldn't
be exactly surprised if it did) that may be usecase/pipeline-specific

As for #2, I do think it makes sense to connect the sensors to the PHY,
as that's a representation of electrical signals travelling from the
producer to the consumer (plus the data passed in e.g. data-lanes is
directly related to the PHY and necessarily consumed by its driver)

Konrad 

