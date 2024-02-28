Return-Path: <linux-arm-msm+bounces-12871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2760A86B1D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 15:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A298FB214F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 14:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0096041C73;
	Wed, 28 Feb 2024 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="caasHT+r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C3A2E620
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 14:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709130677; cv=none; b=gEAtomIBzs5RS4n9WQjJBMAfy4cmJjcij/4StG2sgyIDE8/KJYlRwG2+xShs9BLn5EA2ljfFp/CMCRNx6FNio/P3DoFvdgnbx8URa+9Ljb41ZiMYY+nWGFrb4gGoE1TXkDWR7ZWmF1SJPE8EZUXJK3/Imofj+yGmTS6nRntT1ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709130677; c=relaxed/simple;
	bh=DMCOTsnC+yC1+aiZd7HQPkLf88YX5aBLT0qzUUaOgeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LjdPqCscADr9NcNEoRymHqLR/eJKWxIHo6i1Db9FqOVO37zUsBhYu3hHm3fFwtxoBCegm5CMfG+ELRua6Sb3ssq2qZLcfAiXrPATNRH6I4w16P7+owSRFyFpVcxIhuxsU0L2xuGd3rYwEGgLVn2fr9qayt96H+mWKz4wdiMc4MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=caasHT+r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S5qEiK001221;
	Wed, 28 Feb 2024 14:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=KpOApEEFvNhihVxTgFpSXSrwEYoG2ZVgeSlP3Wk/SpU=; b=ca
	asHT+r6PCKOpQJs9+5E0Rp4WAzJOZMa9I2qHWnj69IWs5KWrdluhLt0dHx94r4DC
	rViU8QV4nEHyvrYCUjoXiTu3AcB4EownrCVauVFOng0ik6cKvBVxXhaKOcmnTWL8
	+YIyHmQBIx0TVr5l9F4csU052sR21X7vZka7ye9fj/wNN2FtfEQiQfj+mkqLU5ws
	JvGko+k0ywP/ArLvSCkTWrxhN8+rKl67Lyr8X7UrfOfzpQIjSF2qMhkIpSBag90i
	T2WMr8OAyXbKJgCkZv88aYZdPzYparzrEQC+CObQ2+TScVpgMPdDAsCI9aOIiXCG
	fmPmcgp0vx3epnVXKwMg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whw3f1buc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 14:31:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41SEVCNv002609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 14:31:12 GMT
Received: from [10.216.61.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 28 Feb
 2024 06:31:11 -0800
Message-ID: <beee8602-6fc7-49ed-b603-a66013bc600a@quicinc.com>
Date: Wed, 28 Feb 2024 20:01:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UVC Configuration Issue on RB5
Content-Language: en-US
To: Robert Arndt <robertarndt201@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>
References: <CAEg6Gx6JqG1-OQyq=jBwKYy+J5TRCq68RXj8OLMo0+1W+uAh-A@mail.gmail.com>
 <04859c35-c09c-4c08-a136-6d5c0b37fd29@quicinc.com>
 <CAEg6Gx6kmAYES9UG1HeTzF2t6Ri3E6voo2S0vCkPUQ3Hx2CMxg@mail.gmail.com>
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <CAEg6Gx6kmAYES9UG1HeTzF2t6Ri3E6voo2S0vCkPUQ3Hx2CMxg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5FYRX2tqpAi3PkTtXrkOY7Q8GXFG74d1
X-Proofpoint-GUID: 5FYRX2tqpAi3PkTtXrkOY7Q8GXFG74d1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_07,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=743 spamscore=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402280114



On 2/28/2024 7:27 PM, Robert Arndt wrote:

Please don't top post on the mail.

>    I added the "f1" subdirectory, and noticed an ss header missing, and
> I finally was able to bind, then run the ideasonboard's uvc-gadget
> app, then see a video device on my 18.04 laptop host.  The device
> appeared for a second but the host said the device wouldn't accept the
> address it was providing.  But still the best progress I've had in
> weeks.  Thank you so much Krishna, it was getting frustrating.
> 

Good to see it working.

Regarding the device address failing, I am not sure but you can add logs 
and check "dwc3_ep0_set_address()" in drivers/usb/dwc3/ep0.c. Also check 
if the wValue of ctrl_request is proper or not. You can do so by 
enabling traces for "trace_dwc3_ctrl_req".

If the address being referred to by Linux machine is something different 
and specific to UVC, then I have no idea.

> I'm not sure what you meant by "deferred for a600000.usb"...does that
> mean the UDC driver went into the "pending" list of drivers?
> 

You can ignore the deferred probe comment. UDC for our dwc3 device 
generally is not created if the dwc3 driver probe fails or gets 
deferred. I was thinking in that direction. But seems that was not the 
issue.

[...]


>>> ...and while udc_name came up with the string a600000.usb, &udc->dev was
>>> an empty string.  So it seems like the device is not in the master UDC
>>> list?  I don't know why...maybe my ConfigFS script is wrong?
>>>
>>> I've attached my kernel config, ConfigFS script, and dmesg output as a
>>> single file.  Would appreciate if someone could tell me if I'm looking
>>> in the right direction or completely off.
>>>
>>
>> Hi Robert,
>>
>>    Can you check if dwc3 driver probe was successful or if it was
>> deferred for the a600000.usb controller. And seems like you are printing
>> &udc->dev instead of dev_name(&udc->dev).
>>
>>    Also the symlink being created must be the following:
>>    ln -s functions/uvc.usb0 configs/c.1/f1
>>
>>    You are directly linking it to c.1 in your script like the following
>> which is wrong:
>>    ln -s functions/uvc.usb0 configs/c.1
>>
>>    Can you check if fixing the symlink is helping with successful
>> enumeration.
>>

Regards,
Krishna,

