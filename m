Return-Path: <linux-arm-msm+bounces-67815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 500D6B1BDCA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 02:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED8D518A6813
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 00:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B722EADC;
	Wed,  6 Aug 2025 00:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="miCD0MGJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1BA749C
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 00:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754439499; cv=none; b=pCpxCAe1cY5kGmVcCyHYIWY9fyJAUnihIJFomB0cNiIlDyhRTBNfcGRcQKX0q+Ug04QvhXPsAc1HW8FUIgUBtoHvl1i7Lk0VbfvGDYqL7i4025Oxyc4pRg+d9j6GYUEB7loNlfiqBJb0ATObE9oaa7XqU1/KHZ6WcGzc9Oe/750=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754439499; c=relaxed/simple;
	bh=zWPcikdlxEOOuRq4NRJjmp4N50OmdJVYDyO+6q81MXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qu6562JhxpLVrnGPEihcJ2ts0z8QGRPiJ5Ivsn3LKJDWkalJVwK826MFFB6OgTdqr/C5GTTbkOQWfVmmlhLbXFIwREbBDEQCnb4y0u/g3K3wvirQvZfshY2bnxjJRdoAoQSIexcDgIIzSf0doXyMQT7BzT53hbpr55s8OdFMG5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=miCD0MGJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I2lSJ000550
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 00:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CvWBkDZvrB3ComyWr8P7lYQFA+xq1TzuFi0PKzr6en4=; b=miCD0MGJWGSXpIdr
	RBXWBZBt6OYa5Sjn4dnVQBy2GEXES+srAR7s5zRM9V9YLVfxsIfcuv7EETwFHCve
	MbKP6sXKujN3/hSVSpzkKp1ctSamiPl2K23qzswj8POQsxOysNZEkcEwdPc6NPP5
	UBlHykIMl4HUTDRtaMwutHqIeXLfjY4tBUFyyn2IgJWAWM9f33t/X5VyoFG4SAQM
	wR09GdARwEBaXbFuYzGbX9a2T14kbiKtcm0WeRX06uGzJN1hvp+EZ3WwNJHLfR7X
	duvzQ8termfmmgvVe80pa8ktUYpQ0fWb/S54WeytWKDwf+gv7c8DyCzqr3R9ehqu
	EciybQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw18tp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 00:18:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2425e41424cso44365165ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 17:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754439495; x=1755044295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvWBkDZvrB3ComyWr8P7lYQFA+xq1TzuFi0PKzr6en4=;
        b=BYq5oosmpVmoKPnhwUcZABi2Dac5ESmPPsHD/evRJ/ngQB39l5RD1SxO8qTjDETQfA
         CjLizBz8KuGjvkmBbfvnor5hmxlEuko04SGRpmyqsjUCbosf7epwDV2SQYe5O5HfuiGT
         Z+jaOHpktUTxTFHz63Ute1+nmaXmOnGsLVwJu6O5AkXsJm6vhxW3lnjKJ8jbOZLNxgXK
         U97xn7t5e/E8zyKIpqrNiG4YXxDYDW//RV3ksLYLZHAsZr/Fy9RsfevUfcNKywPEYwnu
         hULX6JPHrvTRik9DK8U9r1vzlH+8N3xr9jl8XYafbaPhOLQoC+ybS0HovQQbw40S53DV
         6SYw==
X-Forwarded-Encrypted: i=1; AJvYcCWP099A6v+0EDk+Ao4Kv41ghjMWdBZru6WaHILaecjVLSRhR2vhna+iabBW9KagPJ1BPQJFHN+an9HGNwdP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywinv5GctHDDQtBSWT8KrfL1Q1BytuyQN18TVmmgtSM2wMg7D54
	/Xg6gM+w6s4El92Rp3lE/F1T2062q3QgoZaWOS4HEvFdCCdIP+1qTW25pN/ieTBLPnhQ2bonkbr
	4YSopsAgYJdLJ/SQ4Q0Y/fZYgCwSit6sXcWVa5q88OhBr1pVCH/Sf+XsPAibemA1pGBOo
X-Gm-Gg: ASbGncsKFaspcbL2t3u+1FPikuPNnrBxAYnhH/gWUsAZF4yRUPnAIUH7nvbAA3OqrrQ
	oeeLZxwK3WbFzYHFHMHYEANWsCpMLJji8pr2pr2G4SBTcNMnEU9wvWlGPgPlL/AOcWDHC5hiXhr
	URoqKHDYkU2gzggaQjn8NzftuhWxuSO+uqs3mDdBkTthElbVFpfT5gYOF8H9lCDCAn7k5uvomIb
	lYZP7DMSgM35OeUgRiOHcpRcrsXuxQw7wkDLIJKrWaSr1AuvapVx+myYVu2h9NLJWP1+Rc/nEoM
	NqQ4jfPQCLwvxuI0qzO4iGs8Efv8+7LhJ1/m3XCwANuXmmhWR2qxEiBCP7uEJLAc6wAGoqg=
X-Received: by 2002:a17:902:d551:b0:242:9bc6:6bc0 with SMTP id d9443c01a7336-2429f4b9658mr10609345ad.55.1754439494699;
        Tue, 05 Aug 2025 17:18:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHjRDsaO4MljEr1iMsoRkdj7X8sHmBzQE3vb9b55B1dSs79SABb8p1NT5aC68wMZ/RzkMB2Q==
X-Received: by 2002:a17:902:d551:b0:242:9bc6:6bc0 with SMTP id d9443c01a7336-2429f4b9658mr10608995ad.55.1754439494165;
        Tue, 05 Aug 2025 17:18:14 -0700 (PDT)
Received: from [192.168.1.4] ([223.230.69.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f1efe8sm141916405ad.69.2025.08.05.17.18.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 17:18:13 -0700 (PDT)
Message-ID: <98f9936b-3833-4350-8249-169784be1e53@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 05:48:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
 <20250623233211.aeehndz2nxqovepd@synopsys.com>
 <a46b9870-207b-45a1-b3e6-5c13e1857640@oss.qualcomm.com>
 <20250711232929.5oukafed5lnvsu2v@synopsys.com>
 <27ff2c46-9402-47e6-b5ea-8a1f783220b1@oss.qualcomm.com>
 <20250730012307.7rwh3lzz4ohd4mob@synopsys.com>
 <ac7212fe-5c22-46cf-ac3b-ac6b93cb1384@oss.qualcomm.com>
 <20250801010119.tvhb6tjlf4fq7zhg@synopsys.com>
 <d28a61ff-e40a-438d-afd7-5a4bc5cb3625@oss.qualcomm.com>
 <20250805231808.cjht64mfabaw2ik5@synopsys.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250805231808.cjht64mfabaw2ik5@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDE3MCBTYWx0ZWRfX7lJLmdPipa64
 70THRU2NbyNcrrfUZGN4GMLZNTg2flpJv/39JP7jqiZ45r/Xm/cOViHjq5Si1waB/SLw/Kiugwo
 d7AzxKxXCJXztoW8gDOQ2b1j5bEGpiEpWef2I3BlGehbC8PwcQF0HQ2Lp4AVdSrRtYUQMl6oKbp
 yPS4bU3UfdyT6B3j7/o5Jk0Y/VmjVW510hAgQbNGCbGWKtK6NxBJ9/AiKnZ6XkBxq+Cx2Ja0A4s
 NOj52R+PKBZEXOt1eHQRhcRO46VxY0r9FKErRfNtLA65p687DawpeJmh1cEGBPXhsnu9rKXE1R0
 Dmi/tjpFFA+0yMpgMFplq5rD9/WxLfSo/X5VIWpknmRa3gKZ6Sbpm8W3WTLERXqvIRZr5jFu5s4
 Wxhl7Dti5Hj6KLmu77eirm1KMfIsiUpBO9aF6AyRbXRcDKreUDXinfPfvPgnuumgaY2WJXSy
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=68929f48 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=dFKNRnJIrmssHmy2/bds8Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=6Or4dFEDmD3b5ZOWyvAA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 7lIEAmXKDuFNWYGbSvibTn60D-mepTHL
X-Proofpoint-GUID: 7lIEAmXKDuFNWYGbSvibTn60D-mepTHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508050170



On 8/6/2025 4:48 AM, Thinh Nguyen wrote:

[...]

>>>>>>>>>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>>>>>>>>>> index ca7e1c02773a..d40b52e2ba01 100644
>>>>>>>>>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>>>>>>>>>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>>>>>>>>>> @@ -89,6 +89,12 @@ struct dwc3_qcom {
>>>>>>>>>>       	bool			pm_suspended;
>>>>>>>>>>       	struct icc_path		*icc_path_ddr;
>>>>>>>>>>       	struct icc_path		*icc_path_apps;
>>>>>>>>>> +
>>>>>>>>>> +	/*
>>>>>>>>>> +	 * Current role changes via usb_role_switch_set_role callback protected
>>>>>>>>>> +	 * internally by mutex lock.
>>>>>>>>>> +	 */
>>>>>>>>>> +	enum usb_role		current_role;
>>>>>>>>>
>>>>>>>>> Can we just track the current role through dwc3 core instead of an
>>>>>>>>> addition field in the glue?
>>>>>>>>>
>>>>>>>>
>>>>>>>> Core caches only mode. We need ROLE NONE to identify cable connect. So
>>>>>>>> adding that in glue to keep track.
>>>>>>>>
>>>>>>>
>>>>>>> The controller is always either host or device, not somewhere in
>>>>>>> between. You're using ROLE_NONE to indicate connection, which is a
>>>>>>> separate state.
>>>>>>>
>>>>>>
>>>>>> Yes, but there is no flag that indicates that in dwc structure today. Also
>>>>>> since only dwc3-qcom needs it at the moment, I added that role info in glue
>>>>>> layer.
>>>>>
>>>>> How are you using ROLE NONE? Do you send a role-switch call to "none" to
>>>>> indicate disconnect? Let's not do that. Currently the dwc3 driver would
>>>>> switch back to the default mode if "none" is selected, but this is not
>>>>> well defined and implementation specific. It can be no-op and would not
>>>>> violate the interface.
>>>>>
>>>>> The role-switch interface should only be used for role-switching and not
>>>>> connection/disconnection.
>>>>>
>>>>>>
>>>>>>> I feel this should be tracked separately for clarity. The dwc3 also
>>>>>>> tracks the connection state, can we use that?
>>>>>>>
>>>>>>
>>>>>> Are you referring to the "connected" flag in DWC structure ? I see that it
>>>>>> indicates connection status only in gadget mode.
>>>>>>
>>>>>
>>>>> Yes, that flag is only for gadget.
>>>>>
>>>>> Can you provide more info of the setup? Is there a type-c controller or
>>>>> phy that can detect attach/deattach? Or it only propagates to the usb
>>>>> controller?
>>>>
>>>> My response didn't show up on lore since the mail client I used before sent
>>>> the message in HTML format. So resending my response again.
>>>>
>>>> Hi Thinh,
>>>>
>>>>    Yes this is for cases where role switching is present (either with a Type-C
>>>> controller, USB-conn-gpio, or a glink based role-switch).
>>>>
>>>>    Actually the requirement is as follows:
>>>>    1. When in device mode, if we receive a cable disconnect, we need to clear
>>>> OTG_VBUS_VALID bit of QSCRATCH register in glue address space.
>>>>    2. When cable is connected in device mode, we need to set the
>>>> OTG_VBUS_VALID bit of QSCRATCH register in glue address space.
>>>>    3. When the runstop is set back after a suspend rotuine, then we need to
>>>> set  OTG_VBUS_VALID bit of QSCRATCH register in glueaddress space.
>>>>
>>>>    To take care of all the 3 scenarios above, the set_role and run_stop
>>>> notifiers have been added.
>>>>
>>>>    The role info propagates only from core to glue. It is not sent to the phy.
>>>>
>>>
>>> When does ROLE NONE occur? Did you have the type-c driver set the role
>>> switch to "none" indicate disconnect?
>>>
>>> The vbus-valid is only for gadget, and you only care about the
>>> OTG_VBUS_VALID right? Can we just use the dwc3->connected flag? Just
>>> make sure that it's cleared on role-switch, which should be the case
>>> because we always perform soft-disconnect on gadget unbind, and make
>>> sure to set vbus-valid on pullup or gadget binding. Is there some
>>> scenarios that dwc->connected does not cover?
>>>
>>
>> Hi Thinh,
>>
>>   In case of just a cable disconnect in device mode (and default dr mode is
>> peripheral only), there would be no role switch. In that scenario, connected
>> flag would stay "true" even after removing cable. In that case, we can
>> generate disconnect interrupt only by clearing this VBUS_VALID bit and
>> inturn the suspend will succeed. So wanted to use notification from set_role
>> which would cover all cases:
>> 1. cable disconnect/cable connect
>> 2. Role switch from host->device and device->host
>>
> 
> Ok. Thanks for the explanation. How everything tied together seems
> awkward: The connector does a role-switch to "none" to trigger a
> role-switch in dwc3, which then triggers a callback to dwc3-qcom to
> clear vbus_valid, which then allows the controller to see a disconnect
> event in dwc3. Is that right?
> 

Yes, that is right.

> The connector driver should have a separate interface for
> attach/deattach in addition to role-switch. But I don't think type-c
> controller, USB-conn-gpio, and glink share the same way to handle
> connection/disconnection.
> 

I think although ROLE_NONE is for selecting default mode, it still means 
the same in USB-conn-gpio / ucsi-glink and hd3ss3220 (not sure about 
typec-controller).

> Let's keep what you proposed, and keep in mind that ROLE NONE is for
> selecting the default mode and not necessarily mean disconnection.
> 

Sure. Will do the following in v3:
1. Instead of adding host notifiers, will add 
"pm_runtime_use_autosuspend" in xhci-plat.c
2. Fix up coding issues pointed by you in patch 1/4.

Let me know if this sounds fine.

Regards,
Krishna,

