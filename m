Return-Path: <linux-arm-msm+bounces-60997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 636F8AD592F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 16:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 635733A43C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 14:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD0626A081;
	Wed, 11 Jun 2025 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlTwfVJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F67B2686B9
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749653092; cv=none; b=YuXbld2qf1kKl3WS3kBIroHgy+LitlptUbpsALjG7E0UhxJ26JPbCQ7oj09eVpDgKQyKzWeLNtM9pdVr7VHnvlmCwHKGSfLXgZ+IM9uXaKP0NE0GB6X+3g5OvEZ/pBmz6EbOmRQmMdZIVujb8JLTG46p/Bl4fWg2m2iWUGmJ5j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749653092; c=relaxed/simple;
	bh=F2Jj7JQYOr0bGKIrJykpH6xhfugCSppdTgHIfl+oWAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yoet2TOPCj54CUy9gCFTfy9BNMkizJxAh6ltMuL1Szz4pMtn6Y8OZmK4SOlqZr8k5NFWQfzvoGmMnYKA2JoHQd4Y5PvEbZcx+wjZoJgOM6P6/iArfG/gTZEq8V6alfUlJmdWPY0boI2X+ASj6lp6/1ykLrJX753dFCRfqzSafXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KlTwfVJ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BAncMq002608
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bVAdPF/ZtAHG3MlZ3STwT5kvAGxZ65bgsw/vMfN1Bdk=; b=KlTwfVJ6pfgNXdnH
	0GFWJO8TlMq+39Lx9hLxkMnCyau1+PXgmIocIRF48jlQZ0lZR6+KoMmApi88tIAS
	8Gg254nL6Z/l5H1scEYP+SinPK+cymg8loYp1+L/4kZqIzICagv9hP54ZEX3Vvj1
	2dXn65Nm1OO2+OGM8WcDz5AJAH0DCWeRpvtNvegb8iWvRN9F9gMLQ4ak5wmHjCDb
	OlkEghcRuJHUkPOwN7aBch0Ry3aNBpUr8YuvGJpNWjpPcrbhjJ0huWKO5CFkjqrS
	auroeYlD83FRlYELt4DH00NO+wX9hglhgrNcCYB8FCUTnQ6BgdvfVcqt/pnQI7pb
	b0ju1Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4778cwgnb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 14:44:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235f77f86f6so46323325ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 07:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749653087; x=1750257887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bVAdPF/ZtAHG3MlZ3STwT5kvAGxZ65bgsw/vMfN1Bdk=;
        b=gnfhlEsFpMImRlMrwnioyhd9AF5wwUPo4iY1bO5cPd+VIf8hr+NDa5RvxI1bbl6Oex
         mDW/DaKLiuoiXtolL8d2yh1sK54MngXDySVOo2wgpjFmj3kjgrtQ1Jj83nhbUzXOmlC5
         dSg/9MeXZesVDbLZvt5G2xRYs6wtAKbi8H+yXtkA0eG34g8JP+IeFBU0JbmHYPj2Rb+I
         mbzCX6Zx63M4oWiBmWI5cw+Ap/h/Bf6xrFRTw3zuGUj9vgsF/H55rz62bi1+YRFuC7ji
         T3vy618D7nXwZR6i+0eRQ3FX4fETCqR+xy2A61A0+x5PpBp/h6cc4JT1QMZyEv4tOlQc
         +naA==
X-Forwarded-Encrypted: i=1; AJvYcCXO+hDLpYadA2aC/HW0H4B/wIAhGcEksR8uhutHCa6wegerqH3NpwFIjn1PgVRfxcRL2e78lKSTGXLMB3zh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1SGomhAfmDvZYXpfa0aWqT+FX7p5asWcbRnnlJWuxc9S7zJ2u
	8S1Ax/Iw/7yICl5Efj/sTn6nMtnBsweEfz76858SHnUA2z/DUawIxgeXVeSSduBbiaHKi7d0CIk
	T7quvfMKJxuX5ezClcgsLINK5jy/VTF+P1CwhlnCrYYSnQkaYe/q3r7BZcPhCOb/awnOl
X-Gm-Gg: ASbGncuXEV45YItioalICCFul/yRa2XY7f1rVsA0RV1ppQ+8leVoz4dRG6lO/Bw0Z5j
	bs63p8QQk5mPGYm7InqkxR31Bcl4PQDH33dmLSoTBja6qajjvzTKyoWjc0KPXInCVrZfnXs5w6D
	jJDjQ30K3BV+ZepE4RaJvxYQdSDPhs0RHQaWL1IXmxbPJzGa6SKhne421mc1eXXbwTLrJ6fNhhR
	39cxA4Fm+ibm5L5XKfv9FTbKw6slipTyTLflSkm4Wejy2wKOuyHRjrt42RXiKqBu6Y+zkqlNYRE
	ahDWCavJn3S8ZCIaqRLxRyjx67e6hHgcIZauX1XInAynVrWlCiMS
X-Received: by 2002:a17:902:e5c3:b0:234:948b:91c7 with SMTP id d9443c01a7336-23641b26595mr43495355ad.51.1749653086706;
        Wed, 11 Jun 2025 07:44:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGaqLwVaEWT3D/CjRRL7ifpbTzxvP3dyEUn26Gdsc2CRLIm8DLjFh837SZyj8Uql4Cxqevow==
X-Received: by 2002:a17:902:e5c3:b0:234:948b:91c7 with SMTP id d9443c01a7336-23641b26595mr43495035ad.51.1749653086283;
        Wed, 11 Jun 2025 07:44:46 -0700 (PDT)
Received: from [192.168.1.4] ([122.171.85.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034065f9sm88795965ad.183.2025.06.11.07.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 07:44:45 -0700 (PDT)
Message-ID: <ccff34b1-4245-4fcf-92cc-5021b2d78ea4@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 20:14:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-3-krishna.kurapati@oss.qualcomm.com>
 <20250610105812.jepct55ic5snglno@umbar.lan>
 <aaeafb33-9897-4f47-b4f8-4b92885c3795@oss.qualcomm.com>
 <shpn2wf64trpnulc7dsyyc76mafeila3amxl53wh4ksmtv2jte@3lccqv6wz72q>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <shpn2wf64trpnulc7dsyyc76mafeila3amxl53wh4ksmtv2jte@3lccqv6wz72q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AaixH2XG c=1 sm=1 tr=0 ts=68499660 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=o0TqBejDJiuxdU5pGTGLYg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=32dR0GxqrRMHydjLwi8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: bSiPbqYcojrswPVn-oyeqGZxk_nhjbPQ
X-Proofpoint-GUID: bSiPbqYcojrswPVn-oyeqGZxk_nhjbPQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyMyBTYWx0ZWRfXyT5hyx9cwmti
 nye+uqTEPogH1Qzq3TAjm3DeahkAdqDzXJrEU8eLT3+uxDebkVi1EkAWdueUOTSoGuag4+rXTm3
 Uv3GERlhtCjSXo/OVOqvyQIUmR+UPmkCwTsN2DKqAg73MsQ1Hx9uDetXKclpJUrGzrqBs/yp9Jt
 SxUu1r1p0GVHbkGDrIB3k2bF7SSnAFPYlinpCFXxUuSp2LkAFRTPluf6idicdMywUinjUQ/XWvH
 /qRYbTQatr10pNHvCnezVdoxhBXrhGdyoPqtKzyCRqrsv8A+iXx9AfkToFgLW2C9ibtvvd/hBWW
 HRLOsnpLNRHrKbuFnrnktAqAq7htclAvKTbBjMKLVL6gnJygulLOJVKdiXXUuwlIzh5xIgsFQRH
 dsVVNXAfQaorGfwCZF39a9iQY0x4bXfljzw3T0FNm+gUl0Ufp9gEiA+L9b4Qgikr0Bzg0Zkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110123



On 6/10/2025 10:53 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 10, 2025 at 10:06:24PM +0530, Krishna Kurapati wrote:
>>
>>
>> On 6/10/2025 4:28 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jun 10, 2025 at 02:43:55PM +0530, Krishna Kurapati wrote:
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
>>>>    };
>>>>    #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
>>>> @@ -118,9 +124,9 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
>>>>    }
>>>>    /*
>>>> - * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
>>>> - * validate that the in-core extcon support is functional, and drop extcon
>>>> - * handling from the glue
>>>> + * TODO: Validate that the in-core extcon support is functional, and drop
>>>> + * extcon handling from the glue. Make in-core extcon invoke
>>>> + * dwc3_qcom_vbus_override_enable()
>>>>     */
>>>>    static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
>>>>    {
>>>> @@ -641,6 +647,53 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
>>>>    	return 0;
>>>>    }
>>>> +static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
>>>> +{
>>>> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>>>> +
>>>> +	if (qcom->current_role == next_role)
>>>> +		return;
>>>> +
>>>> +	if (pm_runtime_resume_and_get(qcom->dev) < 0) {
>>>> +		dev_dbg(qcom->dev, "Failed to resume device\n");
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	if (qcom->current_role == USB_ROLE_DEVICE &&
>>>> +	    next_role != USB_ROLE_DEVICE)
>>>> +		dwc3_qcom_vbus_override_enable(qcom, false);
>>>> +	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
>>>> +		 (next_role == USB_ROLE_DEVICE))
>>>> +		dwc3_qcom_vbus_override_enable(qcom, true);
>>>> +
>>>> +	pm_runtime_mark_last_busy(qcom->dev);
>>>> +	pm_runtime_put_sync(qcom->dev);
>>>> +
>>>> +	qcom->current_role = next_role;
>>>
>>> How is it protected by the mutex? Which mutex?
>>>
>>
>> I see a mutex lock in usb_role_switch_set_role() that invokes set role. I
>> think that should be sufficient here.
> 
> Please add a comment to the source code.
> 

Hi Dmitry,

  I added the comment at the declaration of variable in structure. Will 
move it to the function.

  Thank you for the review.

Regards,
Krishna,

