Return-Path: <linux-arm-msm+bounces-67960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A14CB1D1EA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 07:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80C02162EB7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 05:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF751C6FF4;
	Thu,  7 Aug 2025 05:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EhUOKP8z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B28943164
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 05:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754543880; cv=none; b=Qu9su6IhE/ULrPhjPLSwqeTojaDOW426MlfxMl4RHjZkXz5ObqJ/LNpIbu+rGkrpseKaoBMS4V4cgqAF3oMwxqXxbecBBzE0mO2yS+9XxBEDw/4Dq8XdjneStod7yWTAg5QRLkTygnWandRSSibhwyXnxShGtu7W8zr1QoB0Khc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754543880; c=relaxed/simple;
	bh=yR8nPo7RSy9ugmPK/WjtObiXayyd1C4FDZVmWCnradU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdFwNw+RdMqbMDA8x3juAfd1XBjzTQoqpsWnbtEo+oPNS1GjJvU5D9uC1/BO3wdn/jy+h2LVUUb9rZ4mVuXwhQINm0uux877NzUxgt0XhAPFlbHsJC2eVqyAc7fwZFrol4FKCl0RYN59QJifb5LKeCQ329dnbFxKU5fBCDfHM4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EhUOKP8z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576MHKMm016517
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Aug 2025 05:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/N41zxGY1+cas5ZIhVd71J8vDadK1hcCRra6b7f/VvU=; b=EhUOKP8zAXodSKEF
	nhbU78sykofaz2Z0ihIrFuXJ5qS4Ky5byRoWDi8qwb5FDxjc9V1XqSIKd1A9VFde
	SQ+31y/sdTlAIrxA3CfvwLM+AuVLnI1W57qB4dkNp6sZjnWtuu8m6mQqZn/wGKxP
	t/nEIfJuqBUimpEuVYrLMwRHMFupuCDRYA2saMZe7vzr1yomLIPpU1EChFP5K/gY
	ewccLfdDQqxr7+8mTivGvGLlhs6diHRM1/HDC/T8xRsrGE3Z6rb22vaWlKsuATqA
	Sk88nPm1EG50wgFxEFDIfU4S6iiHerkehFGLyOBxDOjia//yeR5OPsfwZBMjKtW9
	RxRAtg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u222qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 05:17:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2400b28296fso9494495ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 22:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754543877; x=1755148677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/N41zxGY1+cas5ZIhVd71J8vDadK1hcCRra6b7f/VvU=;
        b=shwTVP6xTfpppUJ5s+TtRbU5KpMpewFE/KlLXxOaEZIOeuFXsF5QmEyaZv1+tMeNiH
         64Ww2o8VjIPB7RftNlbD/+CkPsZF7ZvQL+OQaFv+3xBVwxQ9c92WO/I8b1/zRtTBHf5v
         VYP5WcBxJ163mM/KP1GJLT8S9gv3Ors3tkrOh2RlIV7ovnGfW1X75wFQV7sdcKUDc2IA
         1j4NnCtcHWOqKTF8OeQ5ZCg3iyNCjE6yWAHceyRAYaB3TKJ/fAfUTYns6eUc2Ehn7JrI
         K0I6DBzJuKvzzG2kjzdn6js0iQwdh/GpzqeuqNWMihHD7O9GYQaImflFBK5Upk2u8QUS
         mfiA==
X-Gm-Message-State: AOJu0Yzr+VcgAsMNz5EVO0MMkeUO+y/zjktBeLttqlv5FPWD57R3khIv
	MhKJbJSVbFR3yNqvCQip7DGoDDNH0Uut2A+U3o/JdM7rzxHFpuJYcawZzdwIUyLuPgcpWQ/ulAp
	NahoZXJDXj1PPXY8xSn1xkpGlSmQqmDRkjXMymnvFo5WLVLECLWvYpQHYz0ZbH4Y5riTN
X-Gm-Gg: ASbGncv6X7O92cU3MW32hD+eGfRQ3Wg8DTcpetm8IiM6d0MSXtNWaOESwVBI2TXsLVD
	DFpBz/BN2yNjMKk39oYsJLeJ1CzR/MqAyKOphflABBmAfoaWAbF+cDMFbyWq3SY1DFU3sVmStt/
	Aef/jHG/AL52N8V4czN5SaBfI1Z8StJEX0ejyCX3PG7HBtIC5H1cXcSoWfhfCZt9+LKmRV+BNp7
	X2P1uAO+ysuate9XqX2GkQl+JtKA3Ex7SC+X24wIl4d9q2VLmbSnsgStaNmXDfELrUZdmmr94mW
	lqOdTmbwYBOTTgkiudWk5BAtBIMtdeIGxbZ087Vke81OdxivAbS1udtDJTHC+dq3wO3gqbk=
X-Received: by 2002:a17:902:d4d1:b0:240:70d4:85c3 with SMTP id d9443c01a7336-2429f2f51d6mr84744785ad.9.1754543876999;
        Wed, 06 Aug 2025 22:17:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyDbF9PoBrZHlRqp8MesiFzENicYPrJrcmGr8gsjTe0RO1TwTc/K/NDHivovGPgpVa/mGgng==
X-Received: by 2002:a17:902:d4d1:b0:240:70d4:85c3 with SMTP id d9443c01a7336-2429f2f51d6mr84744525ad.9.1754543876602;
        Wed, 06 Aug 2025 22:17:56 -0700 (PDT)
Received: from [10.92.173.209] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b5bbsm172162015ad.128.2025.08.06.22.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 22:17:56 -0700 (PDT)
Message-ID: <233c62be-c0fa-499e-9f8f-e90cf0b23aa3@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 10:47:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250806095828.1582917-1-krishna.kurapati@oss.qualcomm.com>
 <20250806095828.1582917-3-krishna.kurapati@oss.qualcomm.com>
 <83c54b3e-8e31-4ca1-9ca6-31703211d507@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <83c54b3e-8e31-4ca1-9ca6-31703211d507@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8B0WhnA9jOhQg1iVqFm-eFGMjXVjgeJd
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=68943705 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=A0m8u_RplU-AeOqBTYgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 8B0WhnA9jOhQg1iVqFm-eFGMjXVjgeJd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX08z4rldQQ+is
 gF5R5tF59WUoGg2GclU1aBh2xOAVvpaEiO2prGKPnztEarDOyLcCvicPi5wQNOdyQ04VdTPyjv2
 YCmg/OqojTl0Aci9EJLREW5ckjgP/sCEm1oUK+w4ImPnUMJERk64yH0fH7C7NQV+BM2y1VGoGck
 vcjlG/gSJYYgf3wqoJm9VCoftNtNqWjAvwgPUJudmd3IcZEd8OhGPUiPVn4GpvUddGJFbAIZDiS
 H2/UrGnBI4duEV4qgWBzJSih7W0HmTRsNH0iVZNOvkWUYmVlUuFlXAH+t8ufc26lGxPmuMBo7rl
 TOAv8tiFIAqLYGW5YR2rTK3/jlwfcUUAWa7W4+Z5WQsitFcgvTtC7nB8+wEYBm3C68jU9te3xXN
 cgcEyuEG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090



On 8/6/2025 4:02 PM, Konrad Dybcio wrote:
> On 8/6/25 11:58 AM, Krishna Kurapati wrote:

[...]

>> +static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
>> +{
>> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>> +
>> +	if (qcom->current_role == next_role)
>> +		return;
>> +
>> +	if (pm_runtime_resume_and_get(qcom->dev) < 0) {
> 
> no need for the "< 0":
> 
> """
> Return 0 if the runtime PM usage counter of @dev has been
> incremented or a negative error code otherwise.
> """
> 

ACK. Will remove the "<" condition here.

>> +		dev_dbg(qcom->dev, "Failed to resume device\n");
> 
> This probably belongs in the suspend/resume calls themselves
> 

I think today, resume fails only if "clk_bulk_prepare_enable" fails.
Would like to keep this log here for now.

>> +		return;
>> +	}
>> +
>> +	if (qcom->current_role == USB_ROLE_DEVICE &&
>> +	    next_role != USB_ROLE_DEVICE)
> 
> The second part is unnecessary because the first if-condition in this
> function ensures it

ACK.

>> +		dwc3_qcom_vbus_override_enable(qcom, false);
>> +	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
>> +		 (next_role == USB_ROLE_DEVICE))
> 
> similarly here
> 
> meaning this can become
> 
> dwc3_qcom_vbus_override_enable(qcom, next_role == USB_ROLE_DEVICE)
> 
> (I'm not sure if it's easier to read, up to you)
> 

Will keep the if-else check as is for now.

>> +		dwc3_qcom_vbus_override_enable(qcom, true);
>> +
>> +	pm_runtime_mark_last_busy(qcom->dev);
>> +	pm_runtime_put_sync(qcom->dev);
>> +
>> +	/*
>> +	 * Current role changes via usb_role_switch_set_role callback protected
>> +	 * internally by mutex lock.
>> +	 */
>> +	qcom->current_role = next_role;
>> +}
>> +
>> +static void dwc3_qcom_run_stop_notifier(struct dwc3 *dwc, bool is_on)
>> +{
>> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>> +
>> +	/*
>> +	 * When autosuspend is enabled and controller goes to suspend
>> +	 * after removing UDC from userspace, the next UDC write needs
>> +	 * setting of QSCRATCH VBUS_VALID to "1" to generate a connect
>> +	 * done event.
>> +	 */
>> +	if (!is_on)
>> +		return;
>> +
>> +	dwc3_qcom_vbus_override_enable(qcom, is_on);
> 
> this argument logically becomes true, always

ACK. Will just pass true here in v4.

> 
>> +	pm_runtime_mark_last_busy(qcom->dev);
>> +}
>> +
>> +struct dwc3_glue_ops dwc3_qcom_glue_ops = {
>> +	.pre_set_role	= dwc3_qcom_set_role_notifier,
>> +	.pre_run_stop	= dwc3_qcom_run_stop_notifier,
>> +};
>> +
>>   static int dwc3_qcom_probe(struct platform_device *pdev)
>>   {
>>   	struct dwc3_probe_data	probe_data = {};
>> @@ -636,6 +685,23 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   	if (ignore_pipe_clk)
>>   		dwc3_qcom_select_utmi_clk(qcom);
>>   
>> +	qcom->mode = usb_get_dr_mode(dev);
>> +
>> +	if (qcom->mode == USB_DR_MODE_HOST) {
>> +		qcom->current_role = USB_ROLE_HOST;
>> +	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>> +		qcom->current_role = USB_ROLE_DEVICE;
>> +		dwc3_qcom_vbus_override_enable(qcom, true);
>> +	} else {
>> +		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
> 
> currently this will never be true on any qcom dt ("role-switch-default-mode" is
> not present anywhere)

Agree. But I wrote for the sake of covering all cases and just in case 
anyone uses this property tomorrow.

Regards,
Krishna,

