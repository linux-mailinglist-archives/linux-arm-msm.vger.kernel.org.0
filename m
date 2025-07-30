Return-Path: <linux-arm-msm+bounces-67046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED536B1577B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 04:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21BC2174AC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 02:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AD91B423B;
	Wed, 30 Jul 2025 02:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCENK9tQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFEA17BBF
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 02:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753841784; cv=none; b=sZy+XYNEHB18bM/trqFFpLHKli0lKx07vNVHt7IzKC720DnSfW1BsXmqQyFnIFXdVLWsF8k9m5KY/fHuvQYjMtqR3W9SsXGDW0kIMC0lwHHvNtegknZN15wAY9l5uz0rqDyQooR3QvbvGzeOI8JELfoP1xZczzXuReeGBVM2LJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753841784; c=relaxed/simple;
	bh=CJZCuRO95DGEzJAxKSQWElsFmSBaP61PRgA378Xrtko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rqct3QAI81WF5BDJ8/bM8v9JQXVH2jMmCIVsMs+x72W00dFQHmdCfEmztNptG3CQmpsZIumhnoR59uEsNvrhZWaIROqpPB1E+tfYUBxojyEXoJmyJBNeptlurkUepY6TqLE/4OvIROL9s7Wav1oTkaRKCdyZiJdhHceyDrfX974=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCENK9tQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TIGW7t031498
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 02:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Guw6KRbo8aw7wW9K/eK+M2MEQNE/hhgEQefs8riuf0=; b=mCENK9tQ2qj5Chfp
	8ZaACQ+YEqfRNtrBnc67vRrSqRp6DBfcckLxNXRiPEcR8N6KRkz2nrA7i5vPUIU5
	f6d3Y/YLg9DTuM1y0j31bApdW/UZNNsfPyoCs6kpf8ndAvDiGVidDjIv4ujfJG0c
	fCNTY9v80+LPMoWE63hJGh1RiweLsApiPM05BLIpV0uzv7K4XmZo0t9Z/ETEG0DK
	QRx5HbAJj6mAH7iHfQBJNabyJ1uw/DfCMsIEruMEq3dtu+Pk6jpmNa6+ClZ03JNv
	Mk/2tvHHHWXbK8nSvdi3Ds2xfrIjPrc47um7DfGSKGd969T7WSVH0tMpq/8zG34u
	j5JlWA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm20t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 02:16:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2400a0ad246so26046805ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 19:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753841779; x=1754446579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Guw6KRbo8aw7wW9K/eK+M2MEQNE/hhgEQefs8riuf0=;
        b=mERRnqgUW+5WsVwLEFEXaXM6FWS1JnDxXCAwB2C0Hh05lN9zu65prUwXuTqW6vxuvB
         b/tz+X88eszJQ3/8fk45273FzjrKfkpaDWo/OSzg5/oBHAM7r38BzAy9NAAwug/03Uvz
         xLJGi+VYOLu1W7QFoTf++crxJ07KoSEUy3DkxpymI6PB+pAmXHxBrrqSd8ARPmKf+h6v
         R9AftsMCaDdPJyf9RRmDNPTqVqBjN30o6uHMP6dYSaJS2hTrT9kHd0UqEeNU5ZsgiQAw
         4GMuSL8piAlY4W3uQMG4AwPkT9HPHjzoVUOK0i7204enQpZqYpvff1j/0lRTr3mKS6m4
         uSOA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0/3ZvroJqwTTBA7KT9tABLf3um59Mh9HC7fJXi+4QYeqvMq5+kdhMVX6Xqmx8Lm+r66+rHKqzB5ZQwbl@vger.kernel.org
X-Gm-Message-State: AOJu0YyNgGPTuOjNVDk/sGlDUqvgknRl0OyIyLS5pK2RF5xJ8PEPNdfz
	8oapOTQG6kSjveS/fxcq27OY7kwAYZggzn77ywOFUXBAgrncopnhIT6YHiUHznsgrZ5LWYOWNJU
	dnUEkhSC6Yqx1VEDZPhPw6WBHJUjB4N7Ksk8vjPO8tdX33Jh1wG24IhEezppAL6Sz4MHoGM39ZL
	j7
X-Gm-Gg: ASbGncvz0WTIknO7qIIPkrkFANH22v5awYwSYAgXpj28oYWzYyFu4qB5wEavua53jlb
	iaNUorZ5UZSFp7Go/aqoo/6IOteXd4wR/loY5HfXkDBUOiC/9usVxUXnp302slAEYFliTGq9Jhd
	Ja57smoh/4hvOcwZ/QRKzn51rdIXNOt95yzdL7reEDdIUtp5EzFfnYUA9uPGOIQbGdyBZ2N5Ys5
	hcmILAwRPnJOYA+xH2Zsmovpf/yF7zkRbx8HlnvVqULNu9VBMfV8WRQS+4dcIgDVQPPzuG/CLE+
	ZvJKwDskvsc5aZtniJkZHdMafSSf2ZJuImMqwSq3gMCgYj5KC+/Jf6/X/pbfCBgiW2uzVmQk
X-Received: by 2002:a17:903:198d:b0:23f:b112:2eaa with SMTP id d9443c01a7336-24096b23962mr21349225ad.41.1753841779432;
        Tue, 29 Jul 2025 19:16:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCO7PfvQBZIpKYCxswdWwjantW3V7M8AzHyUikb4G/e86wNuagzDSGsQz5a61YXXgBauozXA==
X-Received: by 2002:a17:903:198d:b0:23f:b112:2eaa with SMTP id d9443c01a7336-24096b23962mr21348845ad.41.1753841778930;
        Tue, 29 Jul 2025 19:16:18 -0700 (PDT)
Received: from [192.168.1.4] ([122.183.154.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fcd8fb34asm84416435ad.33.2025.07.29.19.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 19:16:18 -0700 (PDT)
Message-ID: <ac7212fe-5c22-46cf-ac3b-ac6b93cb1384@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 07:46:14 +0530
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
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250730012307.7rwh3lzz4ohd4mob@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=68898074 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=A1H60L6fWQAu95VAuYzdKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4h9d9IEXO_emyrEtyuEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDAxMiBTYWx0ZWRfX2HvRxJP9XKRG
 EN59j0W/8H4Gv+OdYsoDe3oTyftwLExt/28OnT9PcmjOeK31FzBsAC4lnDYj78yCPCxtcb3KF3D
 boXE/zHJf5LvZIpl6GEZe06sNcp5KgFn56pF3R8FcgaBWh8nYaID6BFA1k8Wehsr+bpTLkVWbUE
 EtozWCN8Boko5SN/2UeNuMrutAMo0jlAQf1X0flsyQmVEy5vcLyLq+aUjCqcy5eaNeq0JnZTFnA
 oi+uxyw9/8U9HTOcdx2CK4EsVKO2RDrjZsc3G6tRrU/MrgQdnyFnp3rBDRTzAdJhxGCiwK36Hxj
 DUOV4H0N/N6rOLvQcoD9+C5njSh6t+QIk13O/2b5ALNNgIpQT8pRx8eL26QJRnaFpwBUAdM1zUB
 w0qbWnNZ2XV+vR14+1HQwRTA13bfpCqHV88NVD+dAzBhZkU/GgQLMB/7n5m8sYLD5c2i6ji2
X-Proofpoint-ORIG-GUID: bSxjfRTo58gi77XU5b-OX1EHfggIrPGv
X-Proofpoint-GUID: bSxjfRTo58gi77XU5b-OX1EHfggIrPGv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=854 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300012



On 7/30/2025 6:53 AM, Thinh Nguyen wrote:
> On Sun, Jul 13, 2025, Krishna Kurapati wrote:
>>
>>
>> On 7/12/2025 4:59 AM, Thinh Nguyen wrote:
>>> On Tue, Jun 24, 2025, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 6/24/2025 5:02 AM, Thinh Nguyen wrote:
>>>>> On Tue, Jun 10, 2025, Krishna Kurapati wrote:
>>>>>> On Qualcomm DWC3 dual-role controllers, the conndone/disconnect events in
>>>>>> device mode are generated by controller when software writes to QSCRATCH
>>>>>> registers in Qualcomm Glue layer rather than the vbus line being routed to
>>>>>> dwc3 core IP for it to recognize and generate these events.
>>>>>>
>>>>>> UTMI_OTG_VBUS_VALID  bit of QSCRATCH_HS_PHY_CTRL register needs to be set
>>>>>> to generate a connection done event and to be cleared for the controller to
>>>>>> generate a disconnect event during cable removal. When the disconnect is
>>>>>> not generated upon cable removal, the "connected" flag of dwc3 is left
>>>>>> marked as "true" and it blocks suspend routines and for that to happen upon
>>>>>> cable removal, the cable disconnect notification coming in via set_role
>>>>>> call need to be provided to the Qualcomm glue layer as well.
>>>>>>
>>>>>> Currently, the way DWC3 core and Qualcomm legacy glue driver are designed,
>>>>>> there is no mechanism through which the DWC3 core can notify the Qualcomm
>>>>>> glue layer of any role changes which it receives via role switch. To
>>>>>> register these glue callbacks at probe time, for enabling core to notify
>>>>>> glue layer, the legacy Qualcomm driver has no way to find out when the
>>>>>> child driver probe was successful since it does not check for the same
>>>>>> during of_platform_populate.
>>>>>>
>>>>>> Hence implement the following glue callbacks for flattened Qualcomm glue
>>>>>> driver:
>>>>>>
>>>>>> 1. set_role: To pass role switching information from drd layer to glue.
>>>>>> This information is needed to identify NONE/DEVICE mode switch and modify
>>>>>> QSCRATCH to generate connect-done event on device mode entry and disconnect
>>>>>> event on cable removal in device mode.
>>>>>>
>>>>>> 2. run_stop: When booting up in device mode, if autouspend is enabled and
>>>>>> userspace doesn't write UDC on boot, controller enters autosuspend. After
>>>>>> this, if the userspace writes to UDC in the future, run_stop notifier is
>>>>>> required to enable UTMI_OTG_VBUS_VALID of QSCRATCH so that connect done
>>>>>> event is generated after run_stop(1) is done to finish enumeration.
>>>>>>
>>>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>>>> ---
>>>>>>     drivers/usb/dwc3/dwc3-qcom.c | 82 ++++++++++++++++++++++++++++++++----
>>>>>>     1 file changed, 73 insertions(+), 9 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>>>>>> index ca7e1c02773a..d40b52e2ba01 100644
>>>>>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>>>>>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>>>>>> @@ -89,6 +89,12 @@ struct dwc3_qcom {
>>>>>>     	bool			pm_suspended;
>>>>>>     	struct icc_path		*icc_path_ddr;
>>>>>>     	struct icc_path		*icc_path_apps;
>>>>>> +
>>>>>> +	/*
>>>>>> +	 * Current role changes via usb_role_switch_set_role callback protected
>>>>>> +	 * internally by mutex lock.
>>>>>> +	 */
>>>>>> +	enum usb_role		current_role;
>>>>>
>>>>> Can we just track the current role through dwc3 core instead of an
>>>>> addition field in the glue?
>>>>>
>>>>
>>>> Core caches only mode. We need ROLE NONE to identify cable connect. So
>>>> adding that in glue to keep track.
>>>>
>>>
>>> The controller is always either host or device, not somewhere in
>>> between. You're using ROLE_NONE to indicate connection, which is a
>>> separate state.
>>>
>>
>> Yes, but there is no flag that indicates that in dwc structure today. Also
>> since only dwc3-qcom needs it at the moment, I added that role info in glue
>> layer.
> 
> How are you using ROLE NONE? Do you send a role-switch call to "none" to
> indicate disconnect? Let's not do that. Currently the dwc3 driver would
> switch back to the default mode if "none" is selected, but this is not
> well defined and implementation specific. It can be no-op and would not
> violate the interface.
> 
> The role-switch interface should only be used for role-switching and not
> connection/disconnection.
> 
>>
>>> I feel this should be tracked separately for clarity. The dwc3 also
>>> tracks the connection state, can we use that?
>>>
>>
>> Are you referring to the "connected" flag in DWC structure ? I see that it
>> indicates connection status only in gadget mode.
>>
> 
> Yes, that flag is only for gadget.
> 
> Can you provide more info of the setup? Is there a type-c controller or
> phy that can detect attach/deattach? Or it only propagates to the usb
> controller?

My response didn't show up on lore since the mail client I used before 
sent the message in HTML format. So resending my response again.

Hi Thinh,

  Yes this is for cases where role switching is present (either with a 
Type-C controller, USB-conn-gpio, or a glink based role-switch).

  Actually the requirement is as follows:
  1. When in device mode, if we receive a cable disconnect, we need to 
clear OTG_VBUS_VALID bit of QSCRATCH register in glue address space.
  2. When cable is connected in device mode, we need to set the 
OTG_VBUS_VALID bit of QSCRATCH register in glue address space.
  3. When the runstop is set back after a suspend rotuine, then we need 
to set  OTG_VBUS_VALID bit of QSCRATCH register in glueaddress space.

  To take care of all the 3 scenarios above, the set_role and run_stop 
notifiers have been added.

  The role info propagates only from core to glue. It is not sent to the 
phy.

Regards,
Krishna,

