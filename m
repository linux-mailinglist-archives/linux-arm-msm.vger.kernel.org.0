Return-Path: <linux-arm-msm+bounces-60837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B85FDAD3F34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 18:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96ADF1887A0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 16:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1ECF242900;
	Tue, 10 Jun 2025 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3n4m+wK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B7420EB
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573640; cv=none; b=XbbjIJ2qrIdZCjbAze9VsvyqeeqCy86KVK9SdrFyGmEm33r8NAgB+i5i/0HzWW24r4EN9X5COjpIyLRmXruvRlGDzOgTCyY8UUr3o8s+iYUWMNAwJlqq6IHYDwNRPRHrxfGKjifqg6nkc5m+INpVcckk17tejgjHxaGLvqU7U3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573640; c=relaxed/simple;
	bh=R4u/nslLUHbMND+b9K7BcBQWT+Us9jLpB3zN5QBBEaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9lOyipfxc70XiJMIMVZYseJANqVOpFqM5z2oyqq1k4huLyTJ4aqEzBzNb5QlMa0Heh/C2jUT1seqX5G5/Z3yThaNyQNCKLAFUIU/6ZMjpF872GOI5BriSc5DTJEO3TCAsffZStaxGx82EzL2RPXCqL3+fAGYA5ACk2Ts/ieXjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3n4m+wK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9Ccmr019082
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 16:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MKnPInc2o30lyqH7lBih+SX8O+7sgOmLePgA3wca4xQ=; b=h3n4m+wK+UVhBGaq
	F+yr9XHbMd6XaXfT2E7ancYdRqJzSJ5gsJ5+tCaYxyWLoljDqsX+bykPg1mXvlre
	tQZrce0nmuxWkluco+dY0ow7lxM2RuQaA3LnTnOGdLtxMdiBS9bnsx+gnj+OLC7L
	AVA8LMbVAZOy/ymmif+YBJ3g8uLiNvgooHpPyiif07imCqygqvZDjOuQMFWSJy7+
	RrcZP65lHidhGroq8H7/toAGOIyzsv3UcO8XCEK9JUT1c8wjoq2twCLl2/KAh6P1
	UhKEAkS6PudWvcwVIul1O1BfJm4VFEXvo6GuYaSi0/arVpdkcbwgyULQS7p4CyQz
	jc2gUg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpsupp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 16:40:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-745e89b0c32so8994800b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749573637; x=1750178437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MKnPInc2o30lyqH7lBih+SX8O+7sgOmLePgA3wca4xQ=;
        b=fRPf8fw2ywZ/7Kt/2kl5Uc64Nko/T04qokhPpwUTkV63zFEdx7cYbmNBJeXxmVSCb7
         up0M1E2biIX9M9/fjoTc8kEYe/gA66iT1w6SOMAbLMzxvGXJogLv2DIBN96VIIccfxph
         8D3OqTb4P1HWcCcc9u8/Bf3Q4ea3ja0Kztn7iSVcSPJMdB4tjWuGBoLJZnxIsShXVmiT
         6y29gv1RDnf3v79bQefLer++EpVcd1XJfE3YoRPHRBxyI6waxBHLRfzTmJKLJFwP6sny
         xowxrSDfWXxNBxLbSOplJObj32MeRpYi4ZDPNUuZbj0To5JM4swbEYunG8zHr7NXtynG
         K5kw==
X-Forwarded-Encrypted: i=1; AJvYcCU7EaanvQRdLFkqmNxJYvHBQjiwPR3IKsYer8pC95Cl9iDKMBOgP3R6Au5kvSy1IcX0DXOlaN5AmIM/zLZp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/WiIKHXY0kP/5czEv/M9AWIBxwdXY9T9gdf12lb+C6bTeHxpa
	CvE3V6NWIRAamx5K9nL1afPuhPRN7v6D6IYg+JguDI15XKB2LTUOpCVYK04GfjJLmHCR/ItY3SO
	3CW1p5FEr1nn7CS9BIZELHJ5iQas33hYw2BGACRU7mtzT6xYYvMmdZbSS+TO9W221Mzbn
X-Gm-Gg: ASbGnctZYZyt9xDJt6OtyjQ37/50d2iPahJav2P6adkvEJuP3ly4zNLMucKz5pY06xw
	MQ+G7aG9n5E8Gu61bn4WUeS5XQ3iqUKGiWrm60HJmcyulSRfzUfjqb32xiOUhmkdzpDbO6YEcs+
	BowkZsuNH4kGp9pUV13r5NBI3uh/Fk1NqVSJjhag43ZPXcdIQi/qA4wNuvb9V1rqpZRlpL2VKgu
	98oPjTuUt9Y1xB9e4ATw7zCf1pO/0keZRdPxFkfWFFnUzM7PwgLdfbCvyBTlOBjG8tHU2js4Snb
	5X6p2vvEBCClvzh6OGKYbuzWEoliEfRvXNRZ40Kw2+mUPN0hre8QE6I=
X-Received: by 2002:a05:6a00:23cc:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-7486cbea4d7mr298728b3a.16.1749573637175;
        Tue, 10 Jun 2025 09:40:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/mYx4d0rHuFRAt5j/ecGAM5VfkYNttUh+WRdcZism1DhdCtnbx5rXhQfdRTLka1tU3JzDzg==
X-Received: by 2002:a05:6a00:23cc:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-7486cbea4d7mr298694b3a.16.1749573636732;
        Tue, 10 Jun 2025 09:40:36 -0700 (PDT)
Received: from [192.168.1.4] ([122.174.137.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0837c8sm7904836b3a.94.2025.06.10.09.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 09:40:36 -0700 (PDT)
Message-ID: <02bfd468-5f92-4d06-bc90-f138c5153ee0@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 22:10:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] usb: dwc3: qcom: Facilitate autosuspend during
 host mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-4-krishna.kurapati@oss.qualcomm.com>
 <20250610110047.4yc6zjcvkobxerml@umbar.lan>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250610110047.4yc6zjcvkobxerml@umbar.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68486006 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=oYmrSCt18pvj5yoFrZalCQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=sZyqXp3NEevGH2Wsh7sA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEzNCBTYWx0ZWRfX6l1AyXT2AELc
 wqSaNvDICxBE/BKS54hUS8Tr3J8YrFzuA1SOv8sGXYjdqGbOxxuUcUQ1QnGCYHORnY1qriWMKW1
 aLLI1flvZBblBtJZk/OCHwgz7VsR1U2/oe2vROGZLoAQ4XMhBwP9Mgi4apDEIWcytHjJsSTskam
 vAP6EfjDo03GuvI90/jLbx8Quk9isCV4IJlT1MA9Ps7cOTUYGyxmY3OPO+VnabzoFoZ3axklvPp
 LvH15RiWR2r3Q0V6BnuHqvs8UbrR68jxNrRy9bxinoFuQwuRuckeMiwbltIwtWtQNySwnGHM4Pl
 WHMcPEqCIRVFTBFSHCRp2h8PuVxAkHh+oNAm33I/uWpvUFYWQjFAxO+fjNsIb+Os1L0Ah4xnPn4
 AbeDn5reC8OM+ACBmzDkWin7Fx38tIA+aGmWyrP/GWd8VK9HgLDZLzbuJtIuRi1m6nO8d3rv
X-Proofpoint-GUID: VyulTw5A4cNQCXRZ0V3PsZGvTQONi7A3
X-Proofpoint-ORIG-GUID: VyulTw5A4cNQCXRZ0V3PsZGvTQONi7A3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_08,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100134



On 6/10/2025 4:30 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 10, 2025 at 02:43:56PM +0530, Krishna Kurapati wrote:
>> When in host mode, it is intended that the controller goes to suspend
>> state to save power and wait for interrupts from connected peripheral
>> to wake it up. This is particularly used in cases where a HID or Audio
>> device is connected. In such scenarios, the usb controller can enter
>> auto suspend and resume action after getting interrupts from the
>> connected device.
>>
>> Allow autosuspend for and xhci device and allow userspace to decide
>> whether to enable this functionality.
>>
>> a) Register to usb-core notifications in set_role vendor callback to
>> identify when root hubs are being created. Configure them to
>> use_autosuspend.
>>
>> b) Identify usb core notifications where the HCD is being added and
>> enable autosuspend for that particular xhci device.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 62 ++++++++++++++++++++++++++++++++----
>>   1 file changed, 56 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index d40b52e2ba01..17bbd5a06c08 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -95,6 +95,8 @@ struct dwc3_qcom {
>>   	 * internally by mutex lock.
>>   	 */
>>   	enum usb_role		current_role;
>> +
>> +	struct notifier_block	xhci_nb;
>>   };
>>   
>>   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
>> @@ -647,6 +649,39 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
>>   	return 0;
>>   }
>>   
>> +static int dwc3_xhci_event_notifier(struct notifier_block *nb,
>> +				    unsigned long event, void *ptr)
>> +{
>> +	struct dwc3_qcom  *qcom	= container_of(nb, struct dwc3_qcom, xhci_nb);
>> +	struct dwc3	  *dwc	= &qcom->dwc;
>> +	struct usb_bus	  *ubus	= ptr;
>> +	struct usb_hcd	  *hcd;
>> +
>> +	if (!dwc->xhci)
>> +		goto done;
>> +
>> +	hcd = platform_get_drvdata(dwc->xhci);
>> +	if (!hcd)
>> +		goto done;
>> +
>> +	if (event != USB_BUS_ADD)
>> +		goto done;
>> +
>> +	if (strcmp(dev_name(ubus->sysdev), dev_name(dwc->sysdev)) != 0)
>> +		goto done;
>> +
>> +	if (event == USB_BUS_ADD) {
>> +		/*
>> +		 * Identify instant of creation of primary hcd and
>> +		 * mark xhci as autosuspend capable at this point.
>> +		 */
>> +		pm_runtime_use_autosuspend(&dwc->xhci->dev);
> 
> This feels like an overkill, using notifiers to set autosuspend flag.
> Please extend platform data and/or other static code in order to set the
> flag on the created xHCI devices.
> 

Do you mean modifying pdev of xhci from dwc3/host.c ? Or adding the 
use_autosuspend call in xhci-plat.c ?

I thought adding this notifier would be a better way to identify when 
the xhci probe is in progress instead of touching pdev of xhci device 
from dwc3 layer.

Regards,
Krishna,

>> +	}
>> +
>> +done:
>> +	return NOTIFY_DONE;
>> +}
>> +
>>   static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
>>   {
>>   	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>> @@ -659,12 +694,22 @@ static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_rol
>>   		return;
>>   	}
>>   
>> -	if (qcom->current_role == USB_ROLE_DEVICE &&
>> -	    next_role != USB_ROLE_DEVICE)
>> +	if (qcom->current_role == USB_ROLE_NONE) {
>> +		if (next_role == USB_ROLE_DEVICE) {
>> +			dwc3_qcom_vbus_override_enable(qcom, true);
>> +		} else if (next_role == USB_ROLE_HOST) {
>> +			qcom->xhci_nb.notifier_call = dwc3_xhci_event_notifier;
>> +			usb_register_notify(&qcom->xhci_nb);
>> +		}
>> +	} else if (qcom->current_role == USB_ROLE_DEVICE &&
>> +		   next_role != USB_ROLE_DEVICE) {
>>   		dwc3_qcom_vbus_override_enable(qcom, false);
>> -	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
>> -		 (next_role == USB_ROLE_DEVICE))
>> -		dwc3_qcom_vbus_override_enable(qcom, true);
>> +	} else if (qcom->current_role == USB_ROLE_HOST) {
>> +		if (next_role == USB_ROLE_NONE)
>> +			usb_unregister_notify(&qcom->xhci_nb);
>> +		else if (next_role == USB_ROLE_DEVICE)
>> +			dwc3_qcom_vbus_override_enable(qcom, true);
>> +	}
>>   
>>   	pm_runtime_mark_last_busy(qcom->dev);
>>   	pm_runtime_put_sync(qcom->dev);
>> @@ -774,6 +819,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   
>>   	if (qcom->mode == USB_DR_MODE_HOST) {
>>   		qcom->current_role = USB_ROLE_HOST;
>> +		qcom->xhci_nb.notifier_call = dwc3_xhci_event_notifier;
>> +		usb_register_notify(&qcom->xhci_nb);
>>   	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>>   		qcom->current_role = USB_ROLE_DEVICE;
>>   		dwc3_qcom_vbus_override_enable(qcom, true);
>> @@ -794,7 +841,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   	ret = dwc3_core_probe(&probe_data);
>>   	if (ret)  {
>>   		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
>> -		goto clk_disable;
>> +		goto unregister_notify;
>>   	}
>>   
>>   	ret = dwc3_qcom_interconnect_init(qcom);
>> @@ -817,6 +864,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   	dwc3_qcom_interconnect_exit(qcom);
>>   remove_core:
>>   	dwc3_core_remove(&qcom->dwc);
>> +unregister_notify:
>> +	if (qcom->mode == USB_DR_MODE_HOST)
>> +		usb_unregister_notify(&qcom->xhci_nb);
>>   clk_disable:
>>   	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>>   
>> -- 
>> 2.34.1
>>

