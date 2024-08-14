Return-Path: <linux-arm-msm+bounces-28450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 083A19513F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 07:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA835284EF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 05:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2C4502B1;
	Wed, 14 Aug 2024 05:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aYbxL442"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D5542A90;
	Wed, 14 Aug 2024 05:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723613715; cv=none; b=PwHq/HUnF6q16Qb3gvBH3IY4ZZdaONfgyb7WAf0YTYlf+t6kXS9DLYT/8vm49A+6vdoQLjhnCGUD431wRyaUfm6tpRbxedavWaL+9cmvm3jcDIyE2x5/rUFMC6O6sf6XMXfFhPcx1R4d2dyDMmysm5m6VnUk4B71BjBL+zoxJ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723613715; c=relaxed/simple;
	bh=9IKpXMGwe4dCJjZKsmbAa/wqCA0aKzkzGbM2fSVdjz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rRFq2khARugx8HsNQkun0zOHxLGwQm8zN7m0k6rYAp3wEI9G8QSin1TVyWw0JQtjWCMADfxGAf4UghV/eJo6mcGFMZwra2JKpjKFjVfCWAcA/EQj69kzm69gxF9VmFH9Le3XlgHjtZKyUWG5A4zhG6Kd1krpLa/Me648gUZl3cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aYbxL442; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNFTxK031225;
	Wed, 14 Aug 2024 05:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98fCPF9GKy9gMo9iUX9FZDLf6m48HTIb41hYJkt76kg=; b=aYbxL442nQz1DbaW
	i9AFohgfc9T1YzqoUy0BimEEZnS81RWmS4YM6lIjCVM1DJqjaBHXAdNFoLsbXuUi
	9ZvY1QAKqa+T2pqGKtJlQRcsLVN1f8mHCGR/UIbdF5lUHodnVm4yQL8Tf2PsHqbq
	ofMtFM6hOXzGZj8RU/mY8W80foG2zLJ3YkQFmOhNCO6Ekl1ATSU/TuxEY0x0lcgQ
	wwXY5n8MiBp1SEZAnApO6+VCDOoRqisakpy5rpV2aPBct3Jd8x/Gc4pCOXgDuB33
	JlBUgp22iLNH99xI3P5exQuia2ChXSldf3vrB68qdrVOQd+Pp4So6yTJu5oamBi4
	eAJd0g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41082wj3m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 05:35:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47E5Z85v002677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 05:35:08 GMT
Received: from [10.218.35.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 22:35:05 -0700
Message-ID: <ec3a918a-df09-9245-318e-422f517ccf68@quicinc.com>
Date: Wed, 14 Aug 2024 11:05:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] usb: dwc3: qcom: fix NULL pointer dereference on
 dwc3_qcom_read_usb2_speed
Content-Language: en-US
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Faisal Hassan
	<quic_faisalh@quicinc.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20240813111847.31062-1-quic_faisalh@quicinc.com>
 <20240814001739.ml6czxo6ok67pihz@synopsys.com>
From: Prashanth K <quic_prashk@quicinc.com>
In-Reply-To: <20240814001739.ml6czxo6ok67pihz@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YE-wrZ7Lb0xL5ug-bgfrTgAvqoxURtjk
X-Proofpoint-GUID: YE-wrZ7Lb0xL5ug-bgfrTgAvqoxURtjk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_04,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=850 clxscore=1011 mlxscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140037



On 14-08-24 05:47 am, Thinh Nguyen wrote:
> On Tue, Aug 13, 2024, Faisal Hassan wrote:
>> Null pointer dereference occurs when accessing 'hcd' to detect speed
>> from dwc3_qcom_suspend after the xhci-hcd is unbound.
>> To avoid this issue, ensure to check for NULL in dwc3_qcom_read_usb2_speed.
>>
>> echo xhci-hcd.0.auto > /sys/bus/platform/drivers/xhci-hcd/unbind
>>    xhci_plat_remove() -> usb_put_hcd() -> hcd_release() -> kfree(hcd)
>>
>>    Unable to handle kernel NULL pointer dereference at virtual address
>>    0000000000000060
>>    Call trace:
>>     dwc3_qcom_suspend.part.0+0x17c/0x2d0 [dwc3_qcom]
>>     dwc3_qcom_runtime_suspend+0x2c/0x40 [dwc3_qcom]
>>     pm_generic_runtime_suspend+0x30/0x44
>>     __rpm_callback+0x4c/0x190
>>     rpm_callback+0x6c/0x80
>>     rpm_suspend+0x10c/0x620
>>     pm_runtime_work+0xc8/0xe0
>>     process_one_work+0x1e4/0x4f4
>>     worker_thread+0x64/0x43c
>>     kthread+0xec/0x100
>>     ret_from_fork+0x10/0x20
>>
>> Fixes: c5f14abeb52b ("usb: dwc3: qcom: fix peripheral and OTG suspend")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Faisal Hassan <quic_faisalh@quicinc.com>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index 88fb6706a18d..0c7846478655 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -319,13 +319,15 @@ static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
>>   static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
>>   {
>>   	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> 
> What if dwc is not available?

Thats unlikely, dwc3_qcom_suspend() -> dwc3_qcom_is_host() checks for 
dwc, calls dwc3_qcom_read_usb2_speed() only if dwc is valid. But adding 
an extra check shouldn't cause harm.
> 
>> -	struct usb_device *udev;
>> +	struct usb_device __maybe_unused *udev;
> 
> This is odd.... Is there a scenario where you don't want to set
> CONFIG_USB if dwc3_qcom is in use?
> 
AFAIK this function is used to get the speeds of each ports, so that 
wakeup interrupts (dp/dm/ss irqs) can be configured accordingly before 
going to suspend, which is done during host mode only. So there 
shouldn't be any scenarios where CONFIG_USB isnt set when this is called.
>>   	struct usb_hcd __maybe_unused *hcd;
>>   
>>   	/*
>>   	 * FIXME: Fix this layering violation.
>>   	 */
>>   	hcd = platform_get_drvdata(dwc->xhci);
>> +	if (!hcd)
>> +		return USB_SPEED_UNKNOWN;
>>   
>>   #ifdef CONFIG_USB
> 
> Perhaps this #ifdef shouldn't only be checking this. But that's for
> another patch >>   	udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
>> -- 
>> 2.17.1
>>
> 
> BR,
> Thinh
Thanks,
Prashanth K

