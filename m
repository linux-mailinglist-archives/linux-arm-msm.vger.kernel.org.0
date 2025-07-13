Return-Path: <linux-arm-msm+bounces-64714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82846B03074
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 11:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56E801899013
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 09:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC3822DF95;
	Sun, 13 Jul 2025 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyoYSocU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683058F4A
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752399001; cv=none; b=A09Z5K6K4rM+rCCOPxG94Ff5vk/ANZLH8cAxERhDlcag+CURAjxv3jdtkRWJb+kCb16m8jV8daqCJGnq4SyN9DZb7oP/BTP6Trz8d8BbpYXvRSLuoUG+dc1+yekcWmhl4QGFqVysTsG7KtW+fbuGWilxdeCYDhfoypfNSUlLRkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752399001; c=relaxed/simple;
	bh=jjmujOfz0YByvx6u1HvyFte3TNGEBmIAN0WgYDdBKpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5ZOqHjpxNrCxG1sKXNPSJnD9em4PVdmdXVsEp+TyvyX3SxqWHfCWZdNNVe+eD8x32k/xzR//SJlWjZ95DwIXPKWTVCZ4NjqZ/mbeYXLXbYG+dCctvHmlwxNCX6tin8PGIzUJ0Th1OJqETMpgjmeEltU/+j5mzDSLQhsL2krhmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyoYSocU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56D5geNL017750
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 09:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1dY6ZVa9DM+PzibcCkmZyv4ANviQi7JtP2IKQ1ChPXI=; b=TyoYSocUDSrD4s2V
	SUUkUAUj9OQ57WwvpnU19IBRKVuNeLTs2qZIpG0dlJffa0NxTofZuIXxNeO6f4dX
	Z0lhELhldHGttZfnbRiy/yk9ekfykahZAE/TYmpYoOee/mGI5qNJAiv2+dap+IH2
	PpXoGsLY+JLEERXtWjThY6RtwPqs+OzcMhvEkUz1G82No2cUbQQF24vakbhthatQ
	k/8lMbJR2l1glJ+WjNYCu9NoSpuXVdf57Ve7gn9mDsNwQUPYKpt3jRpEap8gNflk
	lTwhMjk26eEBpHO2QKC+QbxgJ6hDlDGbL8qtbVSh/UrTrRfQYvOG76Ud06J6lEHx
	t0AJUw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu81tsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 09:29:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748cf01de06so5185595b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 02:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752398997; x=1753003797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1dY6ZVa9DM+PzibcCkmZyv4ANviQi7JtP2IKQ1ChPXI=;
        b=J81thh1yToS0obAqDkYT7fhLQ2QW4tTCei6LWaTYjpE6iX+m49MOVTp4bXbvhChrvi
         MPCmAWROjkOtpgavs5aseNP+tEioAtwPnMcJQyPItUUBtd6sSwLiY+LTtGSxhq8S9vHJ
         WdmcC95sURLk/uho/r+s9AgbwWeOBo3JaJh75DnRwKvJsOaa3Z9DgkparvNnURwHZrex
         BKGUZo73b4yrzYXdwltEIlYw82aUX4cDGcOmPlWrQbkMkfz7YqvsT3hRn8J0YQEcvnDT
         nsu7zmXtN/W9eJZFPkDYBvwhxwM2FjzeBeG9mudIkuznVnzJZvQLbOPFZAMO/1Z7Sfmq
         LzGw==
X-Forwarded-Encrypted: i=1; AJvYcCUfe0DQ/HgQD3aWK9O6SxwzngTqgoBh5uIIgjJAG7UteE6CgvXEBOQTBt7L3YXzyrPc1LFWFDWaVbBRNhya@vger.kernel.org
X-Gm-Message-State: AOJu0YyBrJ5jy3g7xSCQVJ8kyIiGmmZsTKIaYn2UjIcNHJwRF0HgbCV5
	D3n83DWUskkT2S7ZE/IcNE/N7X7P2gcjiq3uiQK4NeQGEFTOhSLULFS+JfWc0IRn5u5J5mPUUrr
	zWxVYIqMYUhzER5Vd7LmBhy5O5HdEaeqwg8aBhpmLEGbyHWcAEiqZLkMHOYIUool5tI0h
X-Gm-Gg: ASbGnctFMFDwuM3ozjeyXWX0zureJRYc7xomorZ2h0HmilTzcs5nElmZ7wCnWz5Hdv8
	LcrXRwX6lVbpZ5Ss7vrtlOSJiy9AFoOSpi7N7fkra2UAT5LL/Du2OFzMl689FFFLrruAfHc4RjQ
	5W/RXqohzmCp1bjAw/ZgUbgcdOvQm0kvjkA3m1VZYbra9PeoPCmvYeP0IGKhKXXfFDdOwHxHIeS
	KcK6/8sP6X8Q/a+v+fRW3+FopWu284LuI19sHLDev+pgPolQU3gBamxcVlRvnjoAizqClOVsRbV
	Cju2SNlWUGslvpDtYKR49A7Omd8jvym3k0lhd4dlDwmuSrncoSSJEHDc/fxlc9MNADH5RflKZTe
	T5IhYe6wo53CrroBZFB+QyK9v/xlVbXoeZ+CNjw==
X-Received: by 2002:a05:6a00:2352:b0:740:9e87:9625 with SMTP id d2e1a72fcca58-74ee04ade9cmr14364992b3a.4.1752398996774;
        Sun, 13 Jul 2025 02:29:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz2YfpMT3tzMVZtVk/aJfp5mnzyvhKOdjKfF3sS31t6p0qgfYXHXVFuYF2XRE2ePI/Wi61RA==
X-Received: by 2002:a05:6a00:2352:b0:740:9e87:9625 with SMTP id d2e1a72fcca58-74ee04ade9cmr14364955b3a.4.1752398996212;
        Sun, 13 Jul 2025 02:29:56 -0700 (PDT)
Received: from ?IPV6:2401:4900:1cb1:5cc8:5574:6ccf:b356:9c65? ([2401:4900:1cb1:5cc8:5574:6ccf:b356:9c65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f949adsm8742795b3a.174.2025.07.13.02.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 02:29:55 -0700 (PDT)
Message-ID: <27ff2c46-9402-47e6-b5ea-8a1f783220b1@oss.qualcomm.com>
Date: Sun, 13 Jul 2025 14:59:40 +0530
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
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250711232929.5oukafed5lnvsu2v@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEzMDA2NCBTYWx0ZWRfX0SSlwljCISRD
 hi/d7iLviDaJvT3WhafKvIWqPoHeaF9oiScEWWqL49NojYdRtqaCf567ID404zyxZDJBdQhsYa+
 wfEVc+bAWT98+3x2iortCd7/WrDMQvjItKOytBaBKu5PMhf6pjyNopNmRP8kTiRB0gcThmZCvLS
 aA8FhoJFXcQau+rz9YPn0+IJN8Mqxuf8qRLU4s49+T2oZXhiC39s+KH9oCZ/YnWz6Qsa0A0146I
 cDgbWKU7N8SrfEZEVpdzVG39ttCqUli+9RkQkvZNk84aQI2JQoZEeMYAH8lhs98omezjunTwmPb
 abfmDCc8I/Iq4P811PUNT0ggIiE8eGaAf5Q5WAwHQxeJkEmyl0YUHpJbw8tyjs48UIwXB3wRizg
 HDOuYxvkZGinKEQiVXdXSXaiyKaFYduUCBmh+FgkZw9vyGHWk1/kleslink2RV2Cv4AaqtQy
X-Proofpoint-ORIG-GUID: YGOQWLQc0R-CqxrW-_FIgzHsquTXsBRu
X-Proofpoint-GUID: YGOQWLQc0R-CqxrW-_FIgzHsquTXsBRu
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68737c96 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=O1qQoxS_gdKAj5MKBqMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-13_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507130064



On 7/12/2025 4:59 AM, Thinh Nguyen wrote:
> On Tue, Jun 24, 2025, Krishna Kurapati wrote:
>>
>>
>> On 6/24/2025 5:02 AM, Thinh Nguyen wrote:
>>> On Tue, Jun 10, 2025, Krishna Kurapati wrote:
>>>> On Qualcomm DWC3 dual-role controllers, the conndone/disconnect events in
>>>> device mode are generated by controller when software writes to QSCRATCH
>>>> registers in Qualcomm Glue layer rather than the vbus line being routed to
>>>> dwc3 core IP for it to recognize and generate these events.
>>>>
>>>> UTMI_OTG_VBUS_VALID  bit of QSCRATCH_HS_PHY_CTRL register needs to be set
>>>> to generate a connection done event and to be cleared for the controller to
>>>> generate a disconnect event during cable removal. When the disconnect is
>>>> not generated upon cable removal, the "connected" flag of dwc3 is left
>>>> marked as "true" and it blocks suspend routines and for that to happen upon
>>>> cable removal, the cable disconnect notification coming in via set_role
>>>> call need to be provided to the Qualcomm glue layer as well.
>>>>
>>>> Currently, the way DWC3 core and Qualcomm legacy glue driver are designed,
>>>> there is no mechanism through which the DWC3 core can notify the Qualcomm
>>>> glue layer of any role changes which it receives via role switch. To
>>>> register these glue callbacks at probe time, for enabling core to notify
>>>> glue layer, the legacy Qualcomm driver has no way to find out when the
>>>> child driver probe was successful since it does not check for the same
>>>> during of_platform_populate.
>>>>
>>>> Hence implement the following glue callbacks for flattened Qualcomm glue
>>>> driver:
>>>>
>>>> 1. set_role: To pass role switching information from drd layer to glue.
>>>> This information is needed to identify NONE/DEVICE mode switch and modify
>>>> QSCRATCH to generate connect-done event on device mode entry and disconnect
>>>> event on cable removal in device mode.
>>>>
>>>> 2. run_stop: When booting up in device mode, if autouspend is enabled and
>>>> userspace doesn't write UDC on boot, controller enters autosuspend. After
>>>> this, if the userspace writes to UDC in the future, run_stop notifier is
>>>> required to enable UTMI_OTG_VBUS_VALID of QSCRATCH so that connect done
>>>> event is generated after run_stop(1) is done to finish enumeration.
>>>>
>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>> ---
>>>>    drivers/usb/dwc3/dwc3-qcom.c | 82 ++++++++++++++++++++++++++++++++----
>>>>    1 file changed, 73 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>>>> index ca7e1c02773a..d40b52e2ba01 100644
>>>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>>>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>>>> @@ -89,6 +89,12 @@ struct dwc3_qcom {
>>>>    	bool			pm_suspended;
>>>>    	struct icc_path		*icc_path_ddr;
>>>>    	struct icc_path		*icc_path_apps;
>>>> +
>>>> +	/*
>>>> +	 * Current role changes via usb_role_switch_set_role callback protected
>>>> +	 * internally by mutex lock.
>>>> +	 */
>>>> +	enum usb_role		current_role;
>>>
>>> Can we just track the current role through dwc3 core instead of an
>>> addition field in the glue?
>>>
>>
>> Core caches only mode. We need ROLE NONE to identify cable connect. So
>> adding that in glue to keep track.
>>
> 
> The controller is always either host or device, not somewhere in
> between. You're using ROLE_NONE to indicate connection, which is a
> separate state.
> 

Yes, but there is no flag that indicates that in dwc structure today. 
Also since only dwc3-qcom needs it at the moment, I added that role info 
in glue layer.

> I feel this should be tracked separately for clarity. The dwc3 also
> tracks the connection state, can we use that?
> 

Are you referring to the "connected" flag in DWC structure ? I see that 
it indicates connection status only in gadget mode.

Regards,
Krishna,

