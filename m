Return-Path: <linux-arm-msm+bounces-60108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021DACC14B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 09:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50D413A3769
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 07:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164A3269B0D;
	Tue,  3 Jun 2025 07:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNZuuOQv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80148269AEE
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 07:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748936482; cv=none; b=p24yla15MYllRTpMKYp6nDwsrqe/hP5TuHNEO8Jj8CmlOJiG1cX7X++fjRGVsUPYafJ1Ohq6n37UvpP1Te4Hnee4A6wPmgzaoJKAhERVU3mICoQQbG96xyaJpcz+RX7wfbznWvDCZxTPaDcWD1X5WZEYL1yJIvQLyLZtZ7cBgvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748936482; c=relaxed/simple;
	bh=In8KGH84rQSlIQGJCX8qPgiH7qfMn5UKCVWmjMX7u5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pk9Pa+co29udX8r7LoeD4RGZdqeFv2EbUi3j1eJzfPCXsdeyqFWIGj8B3YHF3Q56XbP5R4YerJNjriidBJOQCSWRYIT0aOf9Xy5LTExtHRrqo2wDnkSuc//VXz7hBQPoiRJYgUXx6QjuQSJ7iVghIvx90ASFhVT2fjZr5LeFa4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNZuuOQv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5536srnM011819
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 07:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rn7HNqQKqhT5Xc11pa0QotTmX+wuzsGSTytyFvDOsL0=; b=PNZuuOQvCMw7rZZq
	X7bD4fPSjo0Xpcb857UQWEt7uX6B9QNVbP6gNs7kn7W1UOfUZD5KuVk2j765LH6R
	XR07XE99U6hhEzq9xpg6AHsH2OkKpF/9qWtvgD+zsoDOfx/MWdKGc8HNiovQOHcb
	8brx3a57J5DlcLzoqRaB2ySXFGymNAjukKO7KRvfr5Xiz5/2rXD0oSCqJ7Dacp/u
	F0ScmCPIHK636dlE4o+jDI5P/GdjIQj4ekFdk5xG8LClK0Bj1u+VM3t5U9teC5N8
	GqDHmNKul34qaPJHAmrietVfGJJHl1huMJGq6xJjpBVAnou0L/7RTQikhds629C1
	gnSK4A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t1rjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 07:41:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74620e98ec8so4530923b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 00:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748936478; x=1749541278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn7HNqQKqhT5Xc11pa0QotTmX+wuzsGSTytyFvDOsL0=;
        b=e0nJNlTAL1rjVx3p1eyPGneE3lIpvl+trSf1Uo/I52RHi7qHgfcOr8e6i7rbAS6mJz
         xP0+EulwQ3j5nqy/gC+C32zg/DMRqrfma8FKu1W73oAR1fADHvzTQV8Yo2NHApSUVQfE
         8did59s46dIOcFTqx2RmPwskOLi9RG9kRse0nyhlyWOp2Q7yX+URyqLAc3BoKt5KxgYn
         K67Kympevrgnhi9pTWjwXtx6T+uQJ7RttmlJ5yJzXzjHKXZijlg2Ic3n3DtPsqzTnivj
         GhMBrWOxGz1s4vtE+HHUY55BDut71Jt58rn1UlY3xvOEpFA3e4I3PAgk9UPELn50/8G9
         FdTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbqNmqV+hKXj6VmOr7+RH1R1wI3q+Ig1JylgF+0+IGk3tpTZ7E37IUfgWyqpj4/f2CZ6bTWP3yQR41Dr1N@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4rsUd1PiBLWYdRvsOLaRXLgdzHv67KtKOFf2/BlmutxBAf9Z2
	Tp0UC9j4hteo12wVIJH9hO4uuxv5cIpe+oRY5/i0fVcU/8rTwTpU4zO8u3hs+u8yO9mvnUdFgXh
	19AB0V/j1QAi9+fdS+YGwhPeH3KmaaGu8wQ2xh2oWmtWyAHFUlR4TobVL8ca4VUM3I+36
X-Gm-Gg: ASbGnctm5E1gTWOmW//pswvqeanHrGsHkh0WcrH7HECSewqKOLll6rty4pbR8J1+V0h
	xkkQNYX0CsWowMqRatIA5lAlihnGDQVUyKBHBQgwRIwMslNlZxCA0qMtPhNcSrQevba63TcSBQh
	do4AXlEvb0nXJOOFiTDJkaygurrKhWHtolEijAHe0ubRixFuQK902fgap4R/CDv+9UFIC90x2NE
	UT9lv+Mqq2iqV7o5rxKtSrpL17ax5FxHoI42a/wUtPwxYg5YFa5E2Z+nEsFIfVDutLhM4CsF7aA
	v055amZ8PgqoU3ffNW9M28iP5tCUipxTMJqzJSiIJxvujzKME4B9jV4iyD/ZqmRP294IzoLv2M/
	1YADpNHuF4Zo=
X-Received: by 2002:a05:6a00:198a:b0:744:a240:fb1b with SMTP id d2e1a72fcca58-747fe26f390mr2416070b3a.5.1748936478471;
        Tue, 03 Jun 2025 00:41:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxDdY+DvTThVS555Bkd87SdzVaej4kipGmlkAAc0IcgdaXB8CqEZUdpp/TxJdPYRMWzhVo2w==
X-Received: by 2002:a05:6a00:198a:b0:744:a240:fb1b with SMTP id d2e1a72fcca58-747fe26f390mr2416038b3a.5.1748936478058;
        Tue, 03 Jun 2025 00:41:18 -0700 (PDT)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf4b9sm9071161b3a.133.2025.06.03.00.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 00:41:17 -0700 (PDT)
Message-ID: <a840aa80-75ef-4527-bc17-226ba5157a85@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 15:41:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] dt-bindings: soc: qcom: pmic-glink: Move X1E80100
 out of fallbacks
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-6-9e377193a656@oss.qualcomm.com>
 <4e093835-af3b-4a84-b42f-fa7d3a6f60a1@kernel.org>
 <14cba9ae-e3bb-46e8-a800-be5d979b2e06@oss.qualcomm.com>
 <b07200a2-4e7b-480e-a683-d116e7da8de8@kernel.org>
 <c4be4b97-6104-45e3-b555-6691e369c3a4@oss.qualcomm.com>
 <bcf487c9-e522-44a3-b094-daf98823a195@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <bcf487c9-e522-44a3-b094-daf98823a195@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=683ea71f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zsytL_p2Dl488aa6HTsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: LvfXrBwP_i1VpH0lVDT1JxFlp_UleVY4
X-Proofpoint-GUID: LvfXrBwP_i1VpH0lVDT1JxFlp_UleVY4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA2NSBTYWx0ZWRfX5hhR590iHw90
 Rf/FtKKnr9a1vfG80E4r8hs6ChAoJeOrLYzwsi6NoIIwi8kWkRwNPZB7xaEre61tNWa+4NQ9RXX
 561/nNTYAiz1lCb9zWmkQvY4UkypY+srzqAub+hUut00lY2p1U/BbbAXLDDGv23Y8SIbnT0YROc
 fVfwU3lHSKCGIVbdfVaWc8/GR0ZY0Gqo4lV6cHMWwBVT/CRD2YqVLmA9bLnusR32H2YY7pu5r9u
 6L6GTrJltaSfQUc33oHsZaqgW6Wz1o7iZNUZ63vRO1WM2qWjdP+1Zm7kHa7W9N0iyygQzk2FwcC
 uH+IEzJxilEf8Fh4czeoOuPMl7tMor1oGx7xyHYeGfup4aGPV7chpIJXrAZosSuquZIn8N9vEPr
 v5NVLkT+egWCk3SQ+w69KMOAfufWfTfXrmRL4ENMHfhlRSLls2bItkSDbL3THzi15TJ84LuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030065


On 6/3/2025 3:06 PM, Krzysztof Kozlowski wrote:
> On 03/06/2025 08:59, Fenglin Wu wrote:
>> On 6/3/2025 2:47 PM, Krzysztof Kozlowski wrote:
>>> On 03/06/2025 08:42, Fenglin Wu wrote:
>>>> On 6/2/2025 3:40 PM, Krzysztof Kozlowski wrote:
>>>>> On 30/05/2025 09:35, Fenglin Wu via B4 Relay wrote:
>>>>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>>>>
>>>>>> Move X1E80100 out of the fallbacks of SM8550 in pmic-glink support.
>>>>> Why?
>>>>>
>>>>> Do not describe what you do here, it's obvious. We see it from the diff.
>>>>>
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>> Previously, in qcom_battmgr driver, x1e80100 was specified with a match
>>>> data the same as sc8280xp, also sm8550 was treated a fallback of sm8350
>>>> without the need of a match data.
>>>>
>>>> In ucsi_glink driver, sm8550 had a match data and x1e80100 was treated
>>>> as a fallback of sm8550. There was no issues to make x1e80100 as a
>>>> fallback of sm8550 from both qcom_battmgr and ucsi_glink driver perspective.
>>>>
>>>> In patch [5/8] in this series, in qcom_battmgr driver, it added charge
>>>> control functionality for sm8550 and x1e80100 differently hence
>>>> different match data was specified for them, and it makes x1e80100 ad
>>>> sm8550 incompatible and they need to be treated differently.
>>> So you break ABI and that's your problem to fix. You cannot make devices
>>> incompatible without good justification.
>> I would say x1e80100 and sm8550 are different and incompatible from a
>> battery management firmware support perspective. The x1e80100 follows
>> the sc8280xp as a compute platform, whereas the sm8550 follows the
>> sm8350 as a mobile platform.
> Not correct arguments for compatibility.
>
>> The difference between them was initially ignored because the sm8550
>> could use everything that the sm8350 has, and no match data needed to be
>> specified for it. However, now the sm8550 has new features that the
>> sm8350 doesn't have, requiring us to treat it differently, thus the
>> incompatibility was acknowledged.
> So they are perfectly compatible.
>
> I really do not understand what we are discussing here. Explain in
> simple terms of DT spec: what is incompatible that SW cannot use one
> interface to handle the other?

1. x1e80100 was a fallback of sc8280xp, it used "sc8280xp_bat_psy_desc" 
when registering the power supply device.

2. sm8550 was a fallback of sm8350, and they all used 
"sm8350_bat_psy_desc" when registering the power supply device.

3. x1e80100 and sm8550 they are incompatible as they are using different 
data structure of "xxx_bat_psy_desc"  and other “psy_desc" too, such as, 
ac/usb/wls.

4. For charge control functionality, it's only supported in the battery 
management firmware in x1e80100 and sm8550 platforms. And the change in 
battmgr driver (patch [5/8]) adds the support by using 2 additional 
power supply properties, which eventually need to be added in the 
"properties" data member of "xxx_bat_psy_desc" when registering power 
supply devices. Hence, "x1e80100_bat_psy_desc" and "sm8550_bat_psy_desc" 
are created and used separately when registering power supply device 
according to the "variant" value defined in the match data.

The main code change is in [5/8], I am pasting a snippet which might 
help to explain this a little bit:

-       if (battmgr->variant == QCOM_BATTMGR_SC8280XP) {
-               battmgr->bat_psy = devm_power_supply_register(dev, 
&sc8280xp_bat_psy_desc, &psy_cfg);
+       if (battmgr->variant == QCOM_BATTMGR_SC8280XP || 
battmgr->variant == QCOM_BATTMGR_X1E80100) {
+               if (battmgr->variant == QCOM_BATTMGR_X1E80100)
+                       psy_desc = &x1e80100_bat_psy_desc;
+               else
+                       psy_desc = &sc8280xp_bat_psy_desc;
+
+               battmgr->bat_psy = devm_power_supply_register(dev, 
psy_desc, &psy_cfg);
                 if (IS_ERR(battmgr->bat_psy))
                         return dev_err_probe(dev, 
PTR_ERR(battmgr->bat_psy),
                                              "failed to register 
battery power supply\n");
@@ -1394,7 +1628,12 @@ static int qcom_battmgr_probe(struct 
auxiliary_device *adev,
                         return dev_err_probe(dev, 
PTR_ERR(battmgr->wls_psy),
                                              "failed to register 
wireless charing power supply\n");
         } else {
-               battmgr->bat_psy = devm_power_supply_register(dev, 
&sm8350_bat_psy_desc, &psy_cfg);
+               if (battmgr->variant == QCOM_BATTMGR_SM8550)
+                       psy_desc = &sm8550_bat_psy_desc;
+               else
+                       psy_desc = &sm8350_bat_psy_desc;
+
+               battmgr->bat_psy = devm_power_supply_register(dev, 
psy_desc, &psy_cfg);
                 if (IS_ERR(battmgr->bat_psy))
                         return dev_err_probe(dev, 
PTR_ERR(battmgr->bat_psy),
                                              "failed to register 
battery power supply\n");

>
> Best regards,
> Krzysztof

