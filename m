Return-Path: <linux-arm-msm+bounces-69501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F98B29BE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 10:20:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06B7D3AAC50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 08:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BB72FE05C;
	Mon, 18 Aug 2025 08:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+uX7YYj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01075283FC4
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505087; cv=none; b=n+k7nOr8hjhniHIGPPqkrXvihVYDS8ZXZbmsEtU8AvOyb1r/tAS1EQ6pDo0fD+NRBKrndsuJU+AC/wB+pPsLbSv6CPQHSv56MQJJ5ZAjy3+7MwwV6dRXuKvThZX8qM0oo+WQEyutpEIzOhw7Q9gxkoJ0wy/mNpBgZeUDG/F+OqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505087; c=relaxed/simple;
	bh=i42MxpHblmVuwVJ/gbO8Gr9xvuaq8dOxdNKlI7dRB2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBYaLNqOJIJE7q461OWLz1O1wZUiGPyUcoan08TW739q/9eKH7PJeUtZLSK8WKKF689WKo+N3/Jqyq/PWv5h3qmG8XBXFHIu+SUZWIWywfT6Vk/KGnA+8cavgykaJthqkDpuKp2QImuQXO/a8+ncEV50LjjhXGiGbOp+RWwErpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+uX7YYj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HMRH1J001137
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/6PqUZruvlLTGfXdzQffwxBhi8vwdKmBm+40lYCTVM=; b=S+uX7YYj27NBzMzU
	gox+Q0wEEfbF/GPGSqgNQXHYtYaRGFw41DaozrAMtjvbprVFjuiS24cK0aj04kus
	c7qA9OdSZb9nQ8TFUq8CIZ8PZ7VoS9hEGqPd6r0dcH7YeRdI2Zo6lq2sHe2ctjqe
	5d2HU6xiDH4W5QfTjNNGC9scW/BLH2NfjP2BsOs3qdWk+AzNPiHZW5ovL5Q3BB98
	JmcDvIakCbK6ICo4/4b61RfMztyJZKTUAOpuHGled4V29wUivXSKBWv4aWxw0l50
	r+2tY/nKsHOo5ShV3sxEVn9QxgdR1DxWvSmGHX0uy7qOWglQg0DKC063HgSxR9JR
	Gzl0yw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mbsdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 08:18:05 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b471737c5efso2971952a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 01:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505084; x=1756109884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/6PqUZruvlLTGfXdzQffwxBhi8vwdKmBm+40lYCTVM=;
        b=NdaW8GnTBLqwcLrpdx3U3bIS6KcoZ4Zmkmt1/Uq/Hbz6f/jLtQIQDgJD2EWK1mhwSg
         3cceueDcCC69dMDESkelrnLoGBvuaMDcLG4PyS2TdXu+6WmVdDBTDomVql7KnabGf5hG
         SljNj/85ETlh2/PMeDDbC/M584OWoTrqPfMI02/cD9iH20Nnq9tcORFU/CTFo8tWWTO3
         pkX/Er9TouQKZl13PbcYbRhE55Rv2s/WPccLkKY4zuAMtDYHBoQDllNe38M79XbN+8iA
         5b7F/eBfpjpAtUh2VoTicUD6oB5u7Rn2Z9HUkvLHMp90GZaGs3TwFm9pJuM6kiwP58P6
         VJ5g==
X-Forwarded-Encrypted: i=1; AJvYcCXr8XB59Ah+s2CaHaPe9YHgJF/3oIhYd5JXz7o/XWS4b+hwkzgzr4hu/WJGYIIEEg9862uVJPnCjuwwl0dc@vger.kernel.org
X-Gm-Message-State: AOJu0YyuL3x83pZN9pmrr7kM94WhwuJVsICVq/5ACPnMvdojHE5HnG4T
	GiMhkdT2R8RpwF8JTIRcQcdE471oFS4O7hAd8Rev8FVBylj7c3tWGGdchdFtRjhQBwrZ88Z3SEQ
	0oZW58Uen5HPuZyObIjFDO+YlS11WfI/XpbvBWMg5vf51t6PaUelHMZXlB4oD7E0e6iyg
X-Gm-Gg: ASbGncsmnSvT6dwQfDDdeVnKnTfweEwpOGzVgw5u1LDtvRIF08DSpxVkEvP+9twPrQ0
	gijZVqp5+xtOATn8YLn2ijBghb7upHy0ZAt4kf7eIFOa5FdO1DVHWo0tRBBnaLBq/vKwZM6mg7w
	7Py861v86jov/lW3ESXa6cvgoxK0yhsdQn1Ou0B75+CxQjNlZ7L9eipu85P1vtrltH1R8FjgQUr
	Kyiji51m08GFoXTAMFn7GnZGCRQF8EJYnA81ZAmMl15owYt0Pftn6Phb+xrKGXIFzJvBiuF7VEe
	0g71+Zm85LTZt5pZ9lHHSVXloD60nF70f6/24KNeWQPWkbTHx14YpoxsoXdE3afHm6OK64VWubh
	zBjI4w3NTTv3x8xgl1MoooBDfenQsubO2
X-Received: by 2002:a05:6a21:3391:b0:240:198:7790 with SMTP id adf61e73a8af0-240e619e927mr11347069637.10.1755505084226;
        Mon, 18 Aug 2025 01:18:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi6hFRgCNHsg3moFg877y02xXaU+8ZCaqRa/xIfqEoaqdHAwhXHaMjGGnM0ajj1o6Qtjzn+Q==
X-Received: by 2002:a05:6a21:3391:b0:240:198:7790 with SMTP id adf61e73a8af0-240e619e927mr11347043637.10.1755505083762;
        Mon, 18 Aug 2025 01:18:03 -0700 (PDT)
Received: from [10.133.33.85] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45293ddbsm6539498b3a.49.2025.08.18.01.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 01:18:03 -0700 (PDT)
Message-ID: <de2b3a70-2e69-4d01-b7ad-38761fe18f16@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 16:17:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Initial support for Qualcomm Hamoa IOT EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Yingying Tang <quic_yintang@quicinc.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
References: <20250814-hamoa_initial-v5-0-817a9c6e8d47@oss.qualcomm.com>
 <5reeryefhw7burzf2lymhg5wivaq2n4gq5hszvfp57dergvpyx@qehaf334gdrn>
 <7e5d39e0-115e-40be-b44f-0195a4827a0c@oss.qualcomm.com>
 <63ecde5c-8234-4630-97e8-5806b9ff3eea@kernel.org>
 <a56b3e85-0d42-4945-8b6b-dcff20c7b104@oss.qualcomm.com>
 <nruypjmek7f76m5nbv6vs63koscrwcqknswfm67rkcjtqxpwhe@3ijzkbbaxj2p>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <nruypjmek7f76m5nbv6vs63koscrwcqknswfm67rkcjtqxpwhe@3ijzkbbaxj2p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a2e1bd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FDvvkfF-Sd8HMvbO3OkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: KvnfDpz44vg1N2siqEhrW_UDYvD8Lisk
X-Proofpoint-GUID: KvnfDpz44vg1N2siqEhrW_UDYvD8Lisk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX9XFdjVfQXQ2U
 oSenEaiDF9CxDtYespnzrgSlDAtsiKXY9XKbCQ3ZPrFzjs4z4udOMdi0ai5ZQBSe7A2nbp3J6Nq
 4jmJXa/T9jSt5INQgFTtmQWqRuaY+EqHlrKFPQ9B4FoB78LCbmL+4UaMMfh9BCKkIxNfOKxVRi5
 W2RfvRuez5DDr3y7R32VsvFX6G8Lk2giQWWt/ueUf3yWS+Y5OsBUI/IiXogIpM3wJV09rBgNhxN
 uHk1zoA3zZb0DU7LMrllh86Ds/ccVfneaubQ79W6DJ9FyktxLKdFrhOGw8IXOxD81I8e6aEV6tG
 7ZwdfM5ptPbZVYFt/j0JjopN2+m5qGlzNeg3I781Bc/ENej3NRwUs/0Vrt97tBZWTUoHqTExiT/
 moXyhGst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042



On 2025-08-14 19:27, Dmitry Baryshkov wrote:
> On Thu, Aug 14, 2025 at 05:28:01PM +0800, Yijie Yang wrote:
>>
>>
>> On 2025-08-14 17:05, Krzysztof Kozlowski wrote:
>>> On 14/08/2025 10:54, Yijie Yang wrote:
>>>>
>>>>
>>>> On 2025-08-14 16:24, Dmitry Baryshkov wrote:
>>>>> On Thu, Aug 14, 2025 at 03:27:27PM +0800, Yijie Yang wrote:
>>>>>> Introduce the device tree, DT bindings, and driver modifications required
>>>>>> to bring up the HAMOA-IOT-EVK evaluation board—based on the X1E80100 SoC—to
>>>>>> a UART shell.
>>>>>> This patch set focuses on two key hardware components: the HAMOA-IOT-SOM
>>>>>> and the HAMOA-IOT-EVK carrier board.
>>>>>> The HAMOA-IOT-SOM is a compact System on Module that integrates the SoC,
>>>>>> GPIOs, and PMICs. It is designed to be modular and can be paired with
>>>>>> various carrier boards to support different use cases.
>>>>>> The HAMOA-IOT-EVK is one such carrier board, designed for IoT scenarios.
>>>>>> It provides essential peripherals such as UART, on-board PMICs, and
>>>>>> USB-related components.
>>>>>> Together, these components form a flexible and scalable platform, and this
>>>>>> patch set enables their initial bring-up through proper device tree
>>>>>> configuration and driver support.
>>>>>>
>>>>>> Qualcomm SoCs often have multiple product variants, each identified by a
>>>>>> different SoC ID. For instance, the x1e80100 SoC has closely related
>>>>>> variants such as x1e78100 and x1e001de. This diversity in SoC identifiers
>>>>>> can lead to confusion and unnecessary maintenance complexity in the device
>>>>>> tree and related subsystems.
>>>>>> To address this, code names offer a more consistent and project-agnostic
>>>>>> way to represent SoC families. They tend to remain stable across
>>>>>> development efforts.
>>>>>> This patch series introduces "hamoa" as the codename for the x1e80100 SoC.
>>>>>> Going forward, all x1e80100-related variants—including x1e81000 and others
>>>>>> in the same family—will be represented under the "hamoa" designation in the
>>>>>> device tree.
>>>>>> This improves readability, streamlines future maintenance, and aligns with
>>>>>> common naming practices across Qualcomm-based platforms.
>>>>>>
>>>>>> Features added and enabled:
>>>>>> - UART
>>>>>> - On-board regulators
>>>>>> - Regulators on the SOM
>>>>>> - PMIC GLINK
>>>>>> - USB0 through USB6 and their PHYs
>>>>>> - Embedded USB (eUSB) repeaters
>>>>>> - USB Type-C mux
>>>>>> - PCIe6a and its PHY
>>>>>> - PCIe4 and its PHY
>>>>>> - Reserved memory regions
>>>>>> - Pinctrl
>>>>>> - NVMe
>>>>>> - ADSP, CDSP
>>>>>> - WLAN, Bluetooth (M.2 interface)
>>>>>> - USB DisplayPort
>>>>>>
>>>>>> DTS Dependency:
>>>>>> https://lore.kernel.org/all/20250724-move-edp-endpoints-v1-3-6ca569812838@oss.qualcomm.com/
>>>>>>
>>>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>> ---
>>>>>> To: Bjorn Andersson <andersson@kernel.org>
>>>>>> To: Konrad Dybcio <konradybcio@kernel.org>
>>>>>> To: Rob Herring <robh@kernel.org>
>>>>>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>>>> To: Conor Dooley <conor+dt@kernel.org>
>>>>>> Cc: linux-arm-msm@vger.kernel.org
>>>>>> Cc: devicetree@vger.kernel.org
>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>>
>>>>>> ---
>>>>>> Changes in v5:
>>>>>> - Update base commit.
>>>>>> - Drop an already merged patch:
>>>>>> https://lore.kernel.org/all/20250804-hamoa_initial-v4-2-19edbb28677b@oss.qualcomm.com/
>>>>>> - Link to v4: https://lore.kernel.org/r/20250804-hamoa_initial-v4-0-19edbb28677b@oss.qualcomm.com
>>>>>
>>>>> Please keep full changelog rather than trimming previous iterations.
>>>>
>>>> Sure, I will restore them.
>>>>
>>>>>
>>>>> Also, is there a reason why you didn't pick up audio and display chunks
>>>>> as it was requested on the corresponding reviews?
>>>>
>>>> Display-related changes have been merged into '[PATCH v5 3/3] arm64:
>>>> dts: qcom: Add base HAMOA-IOT-EVK board' and are already present there.
>>>>
>>>> Audio support is still under debugging due to unresolved issues, and
>>>> it's unclear when it will be ready. Would it be acceptable to proceed
>>>> without it for now?
>>> Audio was sent to the lists, so this is confusing. What was the point of
>>> that posting? It clearly said:
>>>
>>> "Basic test is good in Hamoa-IOT-EVK board."
>>
>> Additional issues with audio were discovered during further testing, and
>> the current audio series on the list is not suitable to be merged into
>> this series at this time.
> 
> What if the maintainer had picked up that series, with the issues?
> If you uncover an issue, please respond to the patchset, descring that
> it should not be merged (together with the reason and the description of
> a problem).

Quill has provided an update on his series. What should be my next steps 
regarding this series?

> 
>>
>>>
>>> So was that true or not?
>>>
>>> Best regards,
>>> Krzysztof
>>
>> -- 
>> Best Regards,
>> Yijie
>>
> 

-- 
Best Regards,
Yijie


