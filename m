Return-Path: <linux-arm-msm+bounces-12843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CD286A7A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 05:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D381B1C23D7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 04:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADEE2232B;
	Wed, 28 Feb 2024 04:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="apj+aWKY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8392231F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 04:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709095362; cv=none; b=Qir4xi948KeZJmHj4QAFJUBidsqx6T/vKIgszYN5DR5rYBaDFXQRMpdXVmars1r+HWM4imDdNQ2Fkka1gHnDtayDZotaN/1eNHjkTn3EJOpUT8jEvugAicPPlcUWUXshlSeNzi+30tSCsqOmqQ6rW613Vm91MMvQAOyr1n/FHSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709095362; c=relaxed/simple;
	bh=stLauuj/vZlTbZIYkGiOWuraG7RR1rr2k/jpHLSYpUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:CC:
	 In-Reply-To:Content-Type; b=oSzoZ4VcVxYlJHwxAR1AXcl8+irhOrTBWqwcb8Az2EoffAJE2HA44pjNtQFGeXkcxK2bEcHFuVpA3jRLjNeCR/fXK2TGbqsRwlz9ruxwo2B4FCR2JIvqEu0GYowT8j/hW3191jhwCNdQ3uSleI5N7mgZG0r7GrNPhpAm8aRCb0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=apj+aWKY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S4gVCW014151;
	Wed, 28 Feb 2024 04:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from:cc
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=n0/g4DvoLU6HEkaxtN7IN1xshse8tftckaah7cVNQ0Q=; b=ap
	j+aWKYex612886FH1+51TnK/kOzotx8IUdCjAlZq2xg30QOmHZPPcRS7itCnM8c/
	MpNWoqOfFQ4oDiOfG3lsk4NUWE+F1u2AhQ5vAdbow9K/Ck81/e8cT9Ch2ZeTl4ff
	HzKEehoqbdWytbVipCPmgp+9UqcgHRAUvQYMRqO8xzKy1toas4xI1t9h6PrnNC69
	lH2jneFuRrPJybK4T9jt2HpPuYsJn5l5ioW7YOj/6+Te1r40SCONNgPNj7G/hsT7
	PpXLuBv5nu/QFMBD70/VF9sxQ4NpmmbL20MbUcQtjlSLHshLSIxlCM8+ZHNr6o0v
	dy9eiZ8qiK4eIdaQUiFg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whrqagj9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 04:42:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41S4gbof029931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 04:42:37 GMT
Received: from [10.216.37.64] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 27 Feb
 2024 20:42:36 -0800
Message-ID: <04859c35-c09c-4c08-a136-6d5c0b37fd29@quicinc.com>
Date: Wed, 28 Feb 2024 10:12:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UVC Configuration Issue on RB5
To: Robert Arndt <robertarndt201@gmail.com>
References: <CAEg6Gx6JqG1-OQyq=jBwKYy+J5TRCq68RXj8OLMo0+1W+uAh-A@mail.gmail.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>
In-Reply-To: <CAEg6Gx6JqG1-OQyq=jBwKYy+J5TRCq68RXj8OLMo0+1W+uAh-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: td3UeB4IOicBSRvmno_FLeMrawnYcUva
X-Proofpoint-ORIG-GUID: td3UeB4IOicBSRvmno_FLeMrawnYcUva
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_04,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402280034


On 2/28/2024 8:17 AM, Robert Arndt wrote:
> Hi Folks, I was wondering if anyone has gotten UVC working on the RB5?  
> I'm having trouble with the UDC probe and not sure if it's a problem 
> with kernel configuration, configFS script (haven't made into a service 
> yet), or some UDC problem.
> 
> I'm getting a ENODEV error 19 when I try to bind my UVC configuration to 
> the UDC according to dmesg, and stdin output says "Device or resource 
> busy".  I put printk statements into driver/usb/udc/core.c's 
> usb_gadget_probe_driver() which is producing the error line:
>  >>
>          mutex_lock(&udc_lock);
>          if (driver->udc_name) {
>                  list_for_each_entry(udc, &udc_list, list) {
>                          ret = strcmp(driver->udc_name, 
> dev_name(&udc->dev));
> 
>                          printk("****DEBUG: Driver->udc_name: %s\n", 
> driver->udc_name);
>                          printk("****DEBUG: udc->dev name: %s\n", 
> &udc->dev);
> 
>                          if (!ret)
>                                  break;
>                  }
>                  if (ret)
>                          ret = -ENODEV;
>                  else if (udc->driver)
>                          ret = -EBUSY;
>                  else
>                          goto found;
> <<
> 
> ...and while udc_name came up with the string a600000.usb, &udc->dev was 
> an empty string.  So it seems like the device is not in the master UDC 
> list?  I don't know why...maybe my ConfigFS script is wrong?
> 
> I've attached my kernel config, ConfigFS script, and dmesg output as a 
> single file.  Would appreciate if someone could tell me if I'm looking 
> in the right direction or completely off.
> 

Hi Robert,

  Can you check if dwc3 driver probe was successful or if it was 
deferred for the a600000.usb controller. And seems like you are printing 
&udc->dev instead of dev_name(&udc->dev).

  Also the symlink being created must be the following:
  ln -s functions/uvc.usb0 configs/c.1/f1

  You are directly linking it to c.1 in your script like the following 
which is wrong:
  ln -s functions/uvc.usb0 configs/c.1

  Can you check if fixing the symlink is helping with successful 
enumeration.

Regards,
Krishna,

