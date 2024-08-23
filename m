Return-Path: <linux-arm-msm+bounces-29322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC7E95C3F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 05:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3AAD1F24303
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 03:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70DF383BF;
	Fri, 23 Aug 2024 03:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fMD/EMXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A9E376F5;
	Fri, 23 Aug 2024 03:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385364; cv=none; b=s07musmpNJppAY4CkxYvcCV76HLuAMI6XcBaQ9MdIpU4JX7Iz55XssdUgfUoQLC8bL7ftwdrNMtjIZsMP/l/IT1zwVQ39azW6GszXtfVHu7BVvSQh585SDkLbTl98tNFW9Cih+TAxGZr+nkiZGHYbBzvm8Ck2SjetYh/EDobAdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385364; c=relaxed/simple;
	bh=2AyBwNgb7DIa0JNt2Fz81HViRTDcOhLiD0D1a3AaBmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=guk8zAsA+qJzTAsL8qz6AJr9k1dOBXOtTBk0BCoBWovPwzfZxZ4Jip1EhNiU7sDkMNiB37hZl5mFe24czxwm7RSe7+2TnyGVwtm0lCOAk3pW5b7qbHKBwGqLsLsnZfCBy6k+9s8eUnh1Guuw8y58YKVa2MuijGI4OTHtmm+UvaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fMD/EMXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N1bSpV029167;
	Fri, 23 Aug 2024 03:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hfVMfd86bB+e1t/sj0VCJowMBVBCH8eMSo0glFt878E=; b=fMD/EMXC79Hdqofo
	GXyfnRE95SWQuVak3/l5e/zyGK9XeboyaXjF0fF8skV4gKU+mR6kLZI2dOVyutlc
	UfxN8i4xfC5IX1lf3Ma8ois9+PW9YSawCB5vBm2Lny7I27fo8eaw7NW57jM8uaPX
	eylT/1zmKuWnmgXWo/G6mcnuzfTpu+B4TSA2hgQQSk9MEftxV4GqlZQjLo8Orj5x
	zBVHNVHtkQ/hsBifuxIH+uD5AhFhlgc4E82qntTzNEGCwEB+CKjsSd7w/tyPhC7w
	IBPqfFSKsRRtSULaWpCo/CBYxju8hL+i53Cj2oeOgTj11HaVYKbhbhI35d8/Wom4
	T//FiQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4159adexs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 03:55:58 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47N3tvEm008642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 03:55:57 GMT
Received: from [10.216.30.134] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 Aug
 2024 20:55:55 -0700
Message-ID: <70bc6ef9-32df-44a7-bb63-3741bb0b4cdd@quicinc.com>
Date: Fri, 23 Aug 2024 09:25:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: fix NULL pointer dereference on
 dwc3_qcom_read_usb2_speed
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20240813111847.31062-1-quic_faisalh@quicinc.com>
 <2024082211-eleven-stinking-9083@gregkh>
Content-Language: en-US
From: Faisal Hassan <quic_faisalh@quicinc.com>
In-Reply-To: <2024082211-eleven-stinking-9083@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vjaIg_SgraZiorTuFj5mDY4bTIX_a1wj
X-Proofpoint-ORIG-GUID: vjaIg_SgraZiorTuFj5mDY4bTIX_a1wj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_02,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230025



On 8/22/2024 3:03 PM, Greg Kroah-Hartman wrote:
> On Tue, Aug 13, 2024 at 04:48:47PM +0530, Faisal Hassan wrote:
>> Null pointer dereference occurs when accessing 'hcd' to detect speed
>> from dwc3_qcom_suspend after the xhci-hcd is unbound.
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
> 
> This change is not relevant to this overall patch, please remove it and
> submit it separately if still needed.

Understood. I’ll remove the change from this patch and submit it
separately if it’s still required. Thank you for the feedback!

> 
> thanks,
> 
> greg k-h

Thanks,
Faisal

