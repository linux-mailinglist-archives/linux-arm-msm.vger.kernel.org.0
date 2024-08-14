Return-Path: <linux-arm-msm+bounces-28484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7285B9519AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 13:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8B011F2410E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 11:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4A971AE86A;
	Wed, 14 Aug 2024 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kn/9MsqP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135B01AE851;
	Wed, 14 Aug 2024 11:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723633943; cv=none; b=pfEIIf5hwcD12cOIgpBIiPi6Y7FUBtcdoR9KNImzrBJ0k1V1K8ix0g1jNkklhoDOa+DLrFQe4b1oQChiRnWGfWnT7uiPPvrhLNIUVAU7Xxc8Sy3WOzG0VB54OYdGQJrL/cSPSeV0JA3SaguxMv+BExD+Vf6+sexFXsiFKSPSa38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723633943; c=relaxed/simple;
	bh=w8FGOf6XoIorTPA0onCSDNz0YqeAb5+N618grpFo2H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=URPCm27k2A+oqtbUxzaOpcgQMcXtva0ORC2BTx6aMCM39v3Wd0hXB3kOa7OGEHgZ++nr/6marocjMywDJHqkYCMAA0wxtBPNRw8b6zAcHGp+MWaCDPf9w+78qPq/BsbJqN1Aqd5BjHTyP/yIBo4Xkdt7AffOsWUxeFEyNr+KpvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kn/9MsqP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EB5k2J031804;
	Wed, 14 Aug 2024 11:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtlVxWbaUSDeOBQ6P4YT+7imLbtS4jYLDQtPJRL0bEs=; b=Kn/9MsqPZAq9S0Cc
	LImMK64clfApyJtqyMp7/lva+N6IMCx/+EFquo+iVNH0Hhph396fm9Ye1GeIuf82
	LOh958o1z3vzTelnRV1PBYD1tQ3xI1tBlLrVXInYZ29qX+awIPJ+fr7gJD2hajao
	jE5TCsxQeB0Z0xCwMhPILxAKWfWYDt2+gi0UHIfxpqkDp0JnquDNmAz3Xg4TAMHo
	ZCq0wOE5U+4P3dxPjbrggk4DTjyxxS5DRE1yJxMLi27bZLUs1SFzjFW0S5FmF+pS
	/uGeIdgna+F0f7n64A69G/nOxZoXDa7Jyf0xSwKrCPcXh7+NsU3IPeQSsx50kCup
	mgdAYQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41082wk08n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 11:12:19 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EBCIcp005745
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 11:12:18 GMT
Received: from [10.218.38.222] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 04:12:15 -0700
Message-ID: <48651728-a4bb-4bef-81d7-6100a6c2a1fe@quicinc.com>
Date: Wed, 14 Aug 2024 16:42:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: fix NULL pointer dereference on
 dwc3_qcom_read_usb2_speed
To: Prashanth K <quic_prashk@quicinc.com>,
        Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20240813111847.31062-1-quic_faisalh@quicinc.com>
 <20240814001739.ml6czxo6ok67pihz@synopsys.com>
 <ec3a918a-df09-9245-318e-422f517ccf68@quicinc.com>
Content-Language: en-US
From: Faisal Hassan <quic_faisalh@quicinc.com>
In-Reply-To: <ec3a918a-df09-9245-318e-422f517ccf68@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F7p3xsx2rAk5bAra8m9sgzB7zj2kD7Fm
X-Proofpoint-GUID: F7p3xsx2rAk5bAra8m9sgzB7zj2kD7Fm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_08,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=961 clxscore=1015 mlxscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140078



On 8/14/2024 11:05 AM, Prashanth K wrote:
> 
> 
> On 14-08-24 05:47 am, Thinh Nguyen wrote:
>> On Tue, Aug 13, 2024, Faisal Hassan wrote:
>>> Null pointer dereference occurs when accessing 'hcd' to detect speed
>>> from dwc3_qcom_suspend after the xhci-hcd is unbound.
>>> To avoid this issue, ensure to check for NULL in
>>> dwc3_qcom_read_usb2_speed.
>>>
>>> echo xhci-hcd.0.auto > /sys/bus/platform/drivers/xhci-hcd/unbind
>>>    xhci_plat_remove() -> usb_put_hcd() -> hcd_release() -> kfree(hcd)
>>>
>>>    Unable to handle kernel NULL pointer dereference at virtual address
>>>    0000000000000060
>>>    Call trace:
>>>     dwc3_qcom_suspend.part.0+0x17c/0x2d0 [dwc3_qcom]
>>>     dwc3_qcom_runtime_suspend+0x2c/0x40 [dwc3_qcom]
>>>     pm_generic_runtime_suspend+0x30/0x44
>>>     __rpm_callback+0x4c/0x190
>>>     rpm_callback+0x6c/0x80
>>>     rpm_suspend+0x10c/0x620
>>>     pm_runtime_work+0xc8/0xe0
>>>     process_one_work+0x1e4/0x4f4
>>>     worker_thread+0x64/0x43c
>>>     kthread+0xec/0x100
>>>     ret_from_fork+0x10/0x20
>>>
>>> Fixes: c5f14abeb52b ("usb: dwc3: qcom: fix peripheral and OTG suspend")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Faisal Hassan <quic_faisalh@quicinc.com>
>>> ---
>>>   drivers/usb/dwc3/dwc3-qcom.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>>> index 88fb6706a18d..0c7846478655 100644
>>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>>> @@ -319,13 +319,15 @@ static bool dwc3_qcom_is_host(struct dwc3_qcom
>>> *qcom)
>>>   static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct
>>> dwc3_qcom *qcom, int port_index)
>>>   {
>>>       struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
>>
>> What if dwc is not available?
> 
> Thats unlikely, dwc3_qcom_suspend() -> dwc3_qcom_is_host() checks for
> dwc, calls dwc3_qcom_read_usb2_speed() only if dwc is valid. But adding
> an extra check shouldn't cause harm.

Thanks Thinh and Prashanth for reviewing the patch.
Since the caller is validating 'dwc', I think there is no need to recheck.

>>
>>> -    struct usb_device *udev;
>>> +    struct usb_device __maybe_unused *udev;
>>
>> This is odd.... Is there a scenario where you don't want to set
>> CONFIG_USB if dwc3_qcom is in use?
>>
> AFAIK this function is used to get the speeds of each ports, so that
> wakeup interrupts (dp/dm/ss irqs) can be configured accordingly before
> going to suspend, which is done during host mode only. So there
> shouldn't be any scenarios where CONFIG_USB isnt set when this is called.

From history I see CONFIG_USB was added to fix build issues for gadget
only configuration. So configuration without CONFIG_USB also exists.

>>>       struct usb_hcd __maybe_unused *hcd;
>>>         /*
>>>        * FIXME: Fix this layering violation.
>>>        */
>>>       hcd = platform_get_drvdata(dwc->xhci);
>>> +    if (!hcd)
>>> +        return USB_SPEED_UNKNOWN;
>>>     #ifdef CONFIG_USB
>>
>> Perhaps this #ifdef shouldn't only be checking this. But that's for
>> another patch >>       udev = usb_hub_find_child(hcd->self.root_hub,
>> port_index + 1);
>>> -- 
>>> 2.17.1
>>>
>>
>> BR,
>> Thinh
> Thanks,
> Prashanth K
Thanks,
Faisal

