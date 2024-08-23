Return-Path: <linux-arm-msm+bounces-29323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEC395C3F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 05:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C7881F244A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 03:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8290E39AF4;
	Fri, 23 Aug 2024 03:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lnIfaKxz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6978376F5;
	Fri, 23 Aug 2024 03:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385393; cv=none; b=VnCEbfx7bsaM0q6oumgvRqFW9p4wZRtx0WQ+HYxYZvt6I4jkmlg23PQNYKO84IiA/MujrTr005l/DM9lJusaKsYXI67zkXf3xI7ESaTUdDgyJ4ys9WOl1zAqmLjziUmAfPqGYli9zy8QbJ2PMGYeWHKxzGSVUUfMt6R996XhOpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385393; c=relaxed/simple;
	bh=p5olKl/kZQxwUXny7WLg7xMX87uK0aQrduMVCj97MNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JhV/ksV9I++Cp/GmlhpoErgcslOMpMjuyhIwuY8azNQu2ba+vQ1LfBjR+H8IYg/wyv0Igiaj5Dj3bdzpRmPVIgpOWXNPfE7PxDG0y+laoCDM70SGnzsuV3ydC5QJH/T9PmXQu2I7f59du+NVAhNSBiZo1K4+SzX7/jBncRnJ4Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lnIfaKxz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N0UwkF001040;
	Fri, 23 Aug 2024 03:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvoXW5xNzapyrwvs/7uNgMycIqhmW6MMJABRvzxnH+M=; b=lnIfaKxz/PttBTGT
	hwAIKrZ2Q+qScQoeGN0JagmrGzp6iBZqyLicQZiLa1IKQhlXMsq1vdJYznMPqO/P
	Je2I58RrgCY72PK2i2P5TwkVUdnAm0UVyqr8UABCz4WFVD/Rd5ViL7H5kHCuCxtB
	eOECWteSEwe4clV/O+ifVatjsk3+9xjDmlozZKQ+JAlKTjMqQUyn3NFCgUDoDdvq
	bDcsuTUHBq5TDCDaXZMCEdLJg5RbqsMuCwqa6A8OXirXP+CWcCkP2cSQJ5imaDqM
	okLpLMPgTbg5v3LKmhNXedeFBVKv3NS+btjkRgqZ4Vgfwu5hWLsOUFt/yEos2Wuv
	YkQ4UQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415nrrv7td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 03:56:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47N3uOO3030923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 03:56:24 GMT
Received: from [10.216.30.134] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 Aug
 2024 20:56:21 -0700
Message-ID: <a3facdb7-e38e-4ef0-aff6-3e6aff0f9d88@quicinc.com>
Date: Fri, 23 Aug 2024 09:26:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: fix NULL pointer dereference on
 dwc3_qcom_read_usb2_speed
To: Johan Hovold <johan@kernel.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20240813111847.31062-1-quic_faisalh@quicinc.com>
 <ZscgKygXTFON3lKk@hovoldconsulting.com>
Content-Language: en-US
From: Faisal Hassan <quic_faisalh@quicinc.com>
In-Reply-To: <ZscgKygXTFON3lKk@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cL5MltyzUeBee7nCjtCyfOB0A7j_k4HJ
X-Proofpoint-GUID: cL5MltyzUeBee7nCjtCyfOB0A7j_k4HJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_02,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230025



On 8/22/2024 4:55 PM, Johan Hovold wrote:
> On Tue, Aug 13, 2024 at 04:48:47PM +0530, Faisal Hassan wrote:
>> Null pointer dereference occurs when accessing 'hcd' to detect speed
>> from dwc3_qcom_suspend after the xhci-hcd is unbound.
> 
> Why are you unbinding the xhci driver?
> 

On our automotive platforms, when preparing for suspend, a script
unbinds the xhci driver to remove all devices, ensuring the platform
reaches the lowest power state.

>> To avoid this issue, ensure to check for NULL in dwc3_qcom_read_usb2_speed.
>>
>> echo xhci-hcd.0.auto > /sys/bus/platform/drivers/xhci-hcd/unbind
>>   xhci_plat_remove() -> usb_put_hcd() -> hcd_release() -> kfree(hcd)
>>
>>   Unable to handle kernel NULL pointer dereference at virtual address
>>   0000000000000060
>>   Call trace:
>>    dwc3_qcom_suspend.part.0+0x17c/0x2d0 [dwc3_qcom]
>>    dwc3_qcom_runtime_suspend+0x2c/0x40 [dwc3_qcom]
>>    pm_generic_runtime_suspend+0x30/0x44
>>    __rpm_callback+0x4c/0x190
>>    rpm_callback+0x6c/0x80
>>    rpm_suspend+0x10c/0x620
>>    pm_runtime_work+0xc8/0xe0
>>    process_one_work+0x1e4/0x4f4
>>    worker_thread+0x64/0x43c
>>    kthread+0xec/0x100
>>    ret_from_fork+0x10/0x20
>>
>> Fixes: c5f14abeb52b ("usb: dwc3: qcom: fix peripheral and OTG suspend")
> 
> This is clearly not the commit that introduced this issue, please be
> more careful.
> 

My mistake, I should have verified that. I appreciate your feedback.
I’ll make sure to be more careful in the future.

> Also make sure to CC the author of any patch introducing a bug so that
> they may help with review.
> 

Understood. I’ll ensure to CC the author from next time.

>> Cc: stable@vger.kernel.org
>> Signed-off-by: Faisal Hassan <quic_faisalh@quicinc.com>
>> ---
>>  drivers/usb/dwc3/dwc3-qcom.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 88fb6706a18d..0c7846478655 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -319,13 +319,15 @@ static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
>>  static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
>>  {
>>  	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
>> -	struct usb_device *udev;
>> +	struct usb_device __maybe_unused *udev;
>>  	struct usb_hcd __maybe_unused *hcd;
>>  
>>  	/*
>>  	 * FIXME: Fix this layering violation.
>>  	 */
>>  	hcd = platform_get_drvdata(dwc->xhci);
>> +	if (!hcd)
>> +		return USB_SPEED_UNKNOWN;
> 
> This is just papering over the real issue here which is the layering
> violation of having drivers accessing driver data of their children. 
> 
> Nothing is preventing the driver data from being deallocated after you
> check for NULL here.
> 
> I suggest leaving this as is until Bjorn's patches that should address
> this properly lands.
> 

I agree that this part needs to be cleaned up. Currently, this is 100%
reproducible on our platform, and adding this NULL check is very
helpful, but I agree that the vulnerability is still not completely
eliminated.

Until this part is cleaned up, can this check be added to reduce the risk?

>>  
>>  #ifdef CONFIG_USB
>>  	udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
> 
> Johan

Thanks,
Faisal

