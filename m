Return-Path: <linux-arm-msm+bounces-62215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CF7AE65E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 15:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64BAC1BC132B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 13:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9F6298CCF;
	Tue, 24 Jun 2025 13:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbZx1uyl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD28290D85
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770510; cv=none; b=u1zFCRx9AMEqvkioymrV2xpIrgoW0O2C46w+zxf1oXV3wXLPMmbYCELRZ9B5c5z4fk0d0JdnrNTywM6QxVEZ3pBRfoiQtAWv3mRbBE22hUbICxcxvGAsfWpadXp/u1uwHhoTwX1T65s/MowQVr93oalTh1Vm1w5G9rploJS6DTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770510; c=relaxed/simple;
	bh=OWhxjim2hzRwp44IATiri7aWjY41RYVfuAGrMg9lkKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlBKrTZOS7IyEOOkz234dq2x05ELpCZ3ISDeDXD6uV3VqNHf+6z4asajd0k+BGW7J9DxGKcqAtNaoSvW7HAXh/xd39m1FewsYY4o50VfMntXkOu8cFXxal+sLQrNVd2+0bvNtsOZoyNAo7+fGuij9pirOcpAKIHcLNbl6BYEQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbZx1uyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O7D6lA025855
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXCLZ7wAY3gbFYvClwpaaAkNVDWwCvFGSPtbvkJl6S4=; b=QbZx1uylK1oDoaHE
	AxheQ3bLH0vLEbfkRRSrZr/l2/yYim17/kmALfwpQKFR+X7ovIUY+p+RU1+vC2X5
	16iDRtyt4ZtNqI5TQ3L9yhwhFrAByVNva9qHM7gfny2S9up19BvOq6IeuWY8wYBR
	LVNGeTg/p3/rL63xnhH4ICX3TOjSiWEiI6v1bOtNBAZQRzGeA9Drh6rO2C3uoPMG
	UX4/IRvcJTzQHoHMWehZfO/2pQ/FhCv0SvK2L5cRcsJWUK5mNfn4ovwOQr+AkjIn
	3nObZbjWy0cXguNZsKogCNwLcEPrDKXEvNE/gosHHSTce7idiG0uCHwontU8EFH2
	c3cdoA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmnuj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:08:27 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so346603a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750770507; x=1751375307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXCLZ7wAY3gbFYvClwpaaAkNVDWwCvFGSPtbvkJl6S4=;
        b=DzvQ9V9sSq2y+wqsOGR8jzZgdfXz0tm+E+92fQVWo6KD1UGMViGiLAdrd9eJ/Q39Ge
         JA2moNSsBaoWW/NGnBKcyz6WCmIrpZB1SSQTxrgZMVVk9/gfURzmHrwBmEfXa4YmOXIT
         agx970fvec5e5TJ0t25+PSnUPaNHWQ6hFhlEhTi18FcLsrZEGA2FsWxopHN7VRKoYnH6
         qGiBsMFI7gvAXWZ1NXC36f5IsHglNkcMfb1XPMllGE86ydPyYtDp9cXSpWmlJqdExDkA
         ipvtUn7CRC0wLDEhuoGPamN2AmZwL6+/nIuKMK7qmGQyCddbshoyyxf89Q1wzPrv+vdT
         nsbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxWln3xIOQS7E94dWZBsZNMG4fSRTzRB0bm/uWHiItjsw1336oA+2tBR0BLPonxDVx13Ief+8T3l28hxq/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4McNRX3bg5HsB5a7FjL1y/u/pyr9E8kSNbiyGMV8cciAu9sVD
	34dMNx/mrKZpWhEkco4ehKLx7JeJPARD8ifkmD04M0R+IZFuCpypNMGp1l016EAALQhTZC4lBck
	Q1fJzn0LFQFZqV4iLJ6KzbfvfLiCU2ZWVNF6+8M21DeYvTiM6pun7/Yu/gykVgdzqlfl3
X-Gm-Gg: ASbGnctA2MIBvJRdIc9hyTiKKXnDglfXFI3mRdaajUGK9DTFXR79yfUMgXjwKExiFu3
	huZjYivXy9FucgYFYBZl13Q66O0fl+o0XKeh1IvgNZo9IsH67XMPHZBRQLwjPUSihOIYqjBLSg/
	w5pY+iWUTyrnZBtTz201wTW59bfqy1TDLoTo2FFrGye2EJD2nAnwUoa5oYK54mS/tkFZWC4jrQm
	ijhZBaXSl2MeuCmSSQtvLhR3YhM8I5m9iZxOiF77+qty69yD0GDxvT3xpButXS2gEJNgV28x882
	fkIq1RzudrbST0qYw6iO4KJveBeY1fgi04EipsWgUFmSp43U2xK9XWbzjHqDB2ZJ5gDziK9cTA=
	=
X-Received: by 2002:a05:6a00:9a0:b0:749:93d:b098 with SMTP id d2e1a72fcca58-7490db4278fmr17729270b3a.22.1750770507032;
        Tue, 24 Jun 2025 06:08:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaLKteWP9POVkOhi2cCkGrtK+lX6AAeVvFFXqxc3EwlHw8pY4QVWlpLKOHl1nNiBko7q5DOw==
X-Received: by 2002:a05:6a00:9a0:b0:749:93d:b098 with SMTP id d2e1a72fcca58-7490db4278fmr17729252b3a.22.1750770506624;
        Tue, 24 Jun 2025 06:08:26 -0700 (PDT)
Received: from [192.168.0.126] ([2401:fb00:ffff:fffc:0:1:ac11:493f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c88721b9sm1836215b3a.150.2025.06.24.06.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:08:26 -0700 (PDT)
Message-ID: <72f9de63-dc19-4467-b883-8637f95a8e82@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 18:38:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] usb: dwc3: qcom: Facilitate autosuspend during
 host mode
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-4-krishna.kurapati@oss.qualcomm.com>
 <20250623235856.b2jwgf5j6yup2sww@synopsys.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250623235856.b2jwgf5j6yup2sww@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZLdb0aoP6Ch9iVBHVr5t98ZAPoYUAgyR
X-Proofpoint-ORIG-GUID: ZLdb0aoP6Ch9iVBHVr5t98ZAPoYUAgyR
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685aa34b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=biFwQZO8mOkSj3tXal0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExMCBTYWx0ZWRfX0/uTEGISnoz3
 TUF8TDwJDSyAR/BA6vHdDU1zTPeXzeVHuKOqLTyxi8gUCnOp5nmlBifOQNOZ9tgX3mt4+01QHOB
 NQhU6VpjJVtHB04scrCIz2K7CttiIEek4P9fkAkSo4HFgGB9FcuOaT4JkC+Gtc1hjPL08NtPK9G
 GpD0HYs7op8TuItd1eRzdxnKYlWteNlruA+vXRymzBNhD8tKHrddJAW+e+PwxfnfX4eqvJSCK5K
 NW8lN6AXegcRvicpD88RbPD9q/NypHyXqFHTH/mJCOAZN5xyO3HONDE05HkcThXUYtQyPeKSkMD
 4hQh9gPP40mqAImWkUrY/JYJRug3piTB4WDv+1Ivh1/T/opMhQaeKK4FNvPMSrsLsyzdxL0BB37
 hUCmR5iVXsneOvvfhJRCVo3d9xqxDoWgiz8lwA/r/5d1k/xmtTXyNeYAxRZsVBulzOsUt1+U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240110



On 6/24/2025 5:29 AM, Thinh Nguyen wrote:
> On Tue, Jun 10, 2025, Krishna Kurapati wrote:
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


[...]

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
> 
> Can this be false? If possible, I'd like to avoid these pointers and
> strcmp here.
> 

Needed this to identify if the dwc3 pointer corresponds to this glue or 
not. This can be false.

BTW, Dmitry suggested to just do "runtime_use_autosuspend" inside probe 
of xhci-plat.c and remove this logic. Hope that would be fine ?

>> +		goto done;
>> +
>> +	if (event == USB_BUS_ADD) {
> 
> This condition is redundant when you have the check a few lines above.
> 

ACK.

>> +		/*
>> +		 * Identify instant of creation of primary hcd and
>> +		 * mark xhci as autosuspend capable at this point.
>> +		 */
>> +		pm_runtime_use_autosuspend(&dwc->xhci->dev);
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
> 
> We don't unregister the notifier when switching from host to device?
> 

ACK. My bad, missed it.

Thanks for the review.

Regards,
Krishna,

