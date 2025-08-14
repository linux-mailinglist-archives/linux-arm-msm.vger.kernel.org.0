Return-Path: <linux-arm-msm+bounces-69095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6102CB2592A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 03:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24B259A212A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 01:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2B2A207669;
	Thu, 14 Aug 2025 01:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="morcl/Kv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0723C17A2E1
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 01:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755135379; cv=none; b=LTaxlXdQryPHxPJs1jGnWV687kAER451uci0va7vOSjD1Rs+RCu/uZJna09kSkNUNG22HU4lCM7h/OgkhFDAqWclgqVT20aY2L+QjSe9JrClPPnxcPiE+7Nc92T4FXJvQ4IxgGKba+nYQF5L4ZHQlu4HkE3upGVX2rVD9vLdDpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755135379; c=relaxed/simple;
	bh=J1ajpuE3Z7f+hzL+pLyA1kcEyqlc4Xr/4m10DsRsMtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBNZLX4I2tvCj17ugB+zN16uBGLARk24Tjdh5SqIVdw6NuvdelXDXJxz+p5PNb0lWEkGdOy+keY05ayDCtpSeCB9xFcLfKWdVQIbYexKIeAU2CPThbT0N0Q+vmZnSj5/TJZLrBwY3gk+DeOTGf/tqYgzF0wLntkcq2cnhgjDHkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=morcl/Kv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMUB6v000898
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 01:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEnEcAbfNrTJNlbTiR2Yql1yDDkhVAvZOyJH4OB5/sE=; b=morcl/KvENuPzMJK
	My779rkDBQ8XH+dvZkuGI/bOTCueOS9B6nXhjt4uE5/xxU28IjVL4967PeFF0UkR
	cHxw3UPmM0sCtX6puPTGRkYucKrBtIEJhbXQ/AlUkUPNN6eWwu8X1eFk7+Xuxngs
	CeQnRERbrK8FB3CWmfsObEidFQrNwZnlj76EJufg19xWr6+n3zmGyxv48pe7j5Fu
	aY97+/2nnJnWE/u5vlN5iHN/OglhTQz+DUmJynTnLci/4f0ggO4aS/57odJx4NKX
	eaoHcAnrY7vaQLmZSbGNNi9JRL7HWld4EfiUUSUQTnz7axAYk6fw8ECUdLnANacQ
	Ck645g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4hsha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 01:36:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2e8b4ab7so402660b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 18:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755135375; x=1755740175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEnEcAbfNrTJNlbTiR2Yql1yDDkhVAvZOyJH4OB5/sE=;
        b=e+m7O6oFxZV2ihf1EowBuEiu2phHwYi4MdIH0ryfm4aUGHqrw+mCV5+DGrzR5llNGS
         fWo9d3PaM+p6SfECXHeJqXGrhpK4BI9KZArDQC9BfPeW/J68Vu+aXG7tznuXAClMRUDY
         eH6tXToxsPjz/QGPgH8TM3dWqLnYdsWEFc06HaOUGj7QoCi31LysKc1AA8DuXMjj+YqT
         XhcS4cvcUwpoCMn7SEJ09MTkIEihwrE09mZsYypl8m2H+Gl0KqiqBBJxzw9fzdOBcMVT
         N8EIMFR2DfTZIHFM7K8yWcNypy+ZkVV/gtGreQuztIYkNJRqFk17gr8DuZdDjxkxRGVW
         GwNw==
X-Forwarded-Encrypted: i=1; AJvYcCV0TqV69kEL7q//UfSu1ypBkggzfzP7EIcPJtZbb9smXaMgJ7APHN6wdo2rGonpHGpj9T+X2wlmzU13I8YS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx73RIUrwQeSUn5q+sZr0x/x6MV4lAHACvWTx2saQBtgnhoazVZ
	ACor08shkYoIbdbslnKbohTQNW0inDMMMPKpAIx5wsY9EthBxXK1Bh3NYWZhxrKIEEXc+0WpRmZ
	yI5cTt6+Bzzs2cmvyfGva5kKBrNNeZRQafBFrcBmaKse8OLhu4TYyuSSvp0wTSbR2yPni3CWiq4
	or
X-Gm-Gg: ASbGncsixjkbWKrPGPQjfYgrM+t4Xkn9IXNPjEJVyc3J/D3VlxRHMLUrqup55BJXa97
	w0kUvP0SLDQ7ajgMdbKtAwN9WxrGHjIbuvjQEQ1HoA7l/igDB73w/jzFyJewGINaO5ViCmXziy0
	siVjpTPXyVncW+KRbzDZxLAm2qqc2M3bEidFPzV4chrMWBvHANFRunAU8DW91KfYXD7fpBXdm2J
	Q0zUfU4GNI8hwanIP2qjd/P5JbABjpbkJvlZiYuFPIau4Wtb1NKMNZS513D2/auXqhjdfaF2GTu
	j3PjiyDlV/Hu0IW/F0BK2Bfi4FJ5Ja66E6dGHNKPAZyRROotM3h44753OQQxH7G9LWu1hyXc
X-Received: by 2002:a05:6a00:4f8d:b0:730:9946:5973 with SMTP id d2e1a72fcca58-76e2f8a26f5mr1697550b3a.5.1755135375326;
        Wed, 13 Aug 2025 18:36:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKcgHXNlU4FAU79GrgXGLx2YCdtWA3iFVXz3nLVJSXAYEdE7UjTkH+udB8uxDtwGSK6gZmAA==
X-Received: by 2002:a05:6a00:4f8d:b0:730:9946:5973 with SMTP id d2e1a72fcca58-76e2f8a26f5mr1697520b3a.5.1755135374803;
        Wed, 13 Aug 2025 18:36:14 -0700 (PDT)
Received: from [192.168.1.4] ([122.181.203.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e277bfbf4sm2199447b3a.115.2025.08.13.18.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 18:36:14 -0700 (PDT)
Message-ID: <4d160c86-cfbf-4f08-b3e9-f1f8235d20a6@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 07:06:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <20250812055542.1588528-3-krishna.kurapati@oss.qualcomm.com>
 <20250814001552.gtbrgqthtjpilq23@synopsys.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20250814001552.gtbrgqthtjpilq23@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YW8Jx5C7o9rYoEb4caxe8l19biXX7Ewj
X-Proofpoint-ORIG-GUID: YW8Jx5C7o9rYoEb4caxe8l19biXX7Ewj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfXzSPWDETDRExS
 TA6iht6/bGyohpy4Kj+QsTx0Sj5Okjs3dPfqJQz3KVFwFgYc9SN+k51d2rJ7zltQOyq1srKJ2Jb
 vhDtEu9z1CNbUve4HIzSdJ+aE+iE8PGAmR0Rmp3u18mjqkzBVcQkpjCmaGgmqa1UKahnk7oXxmh
 NGQ9DXbzjuFddEKIbyLBtxMV2fpNX6wInJVeMidfKx+cRodcj9OsH2sp/xXDtXUWscXazLDWIY3
 9Osrlm8l3kAem0mtwj8WZwT+mklliTIu+vzOPWOBoYuBNVGS9Flje3Kq5ExoP4v9VkW4xnT1U8r
 k1BnnKqy427Oc268CU4Fr47dqMkp/Y/9Hc7faXfeY0TbJwKMVyvVnNrz4Z4AuLbqvBFY1wyNxE0
 nj+JW+Ny
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689d3d90 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=8GxWK2/7jzpMbo9U3bXwdg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8
 a=0Udd3H8GFMBbaGnnyygA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068



On 8/14/2025 5:46 AM, Thinh Nguyen wrote:
> On Tue, Aug 12, 2025, Krishna Kurapati wrote:
>> On Qualcomm DWC3 dual-role controllers, the conndone/disconnect events in
>> device mode are generated by controller when software writes to QSCRATCH
>> registers in Qualcomm Glue layer rather than the vbus line being routed to
>> dwc3 core IP for it to recognize and generate these events.
>>
>> UTMI_OTG_VBUS_VALID  bit of QSCRATCH_HS_PHY_CTRL register needs to be set
>> to generate a connection done event and to be cleared for the controller to
>> generate a disconnect event during cable removal. When the disconnect is
>> not generated upon cable removal, the "connected" flag of dwc3 is left
>> marked as "true" and it blocks suspend routines and for that to happen upon
>> cable removal, the cable disconnect notification coming in via set_role
>> call need to be provided to the Qualcomm glue layer as well.
>>
>> Currently, the way DWC3 core and Qualcomm legacy glue driver are designed,
>> there is no mechanism through which the DWC3 core can notify the Qualcomm
>> glue layer of any role changes which it receives via role switch. To
>> register these glue callbacks at probe time, for enabling core to notify
>> glue layer, the legacy Qualcomm driver has no way to find out when the
>> child driver probe was successful since it does not check for the same
>> during of_platform_populate.
>>
>> Hence implement the following glue callbacks for flattened Qualcomm glue
>> driver:
>>
>> 1. set_role: To pass role switching information from drd layer to glue.
>> This information is needed to identify NONE/DEVICE mode switch and modify
>> QSCRATCH to generate connect-done event on device mode entry and disconnect
>> event on cable removal in device mode.
>>
>> 2. run_stop: When booting up in device mode, if autouspend is enabled and
>> userspace doesn't write UDC on boot, controller enters autosuspend. After
>> this, if the userspace writes to UDC in the future, run_stop notifier is
>> required to enable UTMI_OTG_VBUS_VALID of QSCRATCH so that connect done
>> event is generated after run_stop(1) is done to finish enumeration.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>>   drivers/usb/dwc3/dwc3-qcom.c | 78 +++++++++++++++++++++++++++++++-----
>>   1 file changed, 68 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
>> index a7eaefaeec4d..d89fbb1d8994 100644
>> --- a/drivers/usb/dwc3/dwc3-qcom.c
>> +++ b/drivers/usb/dwc3/dwc3-qcom.c
>> @@ -83,6 +83,8 @@ struct dwc3_qcom {
>>   	bool			pm_suspended;
>>   	struct icc_path		*icc_path_ddr;
>>   	struct icc_path		*icc_path_apps;
>> +
>> +	enum usb_role		current_role;
>>   };
>>   
>>   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
>> @@ -111,10 +113,6 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
>>   	readl(base + offset);
>>   }
>>   
>> -/*
>> - * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
>> - * validate that the in-core extcon support is functional
>> - */
>>   static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
>>   {
>>   	if (enable) {
>> @@ -560,6 +558,55 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
>>   	return 0;
>>   }
>>   
>> +static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
> 
> Minor nit: There's no notifier here, can we rename to
> dwc3_qcom_pre_set_role() for clarity?
> 
>> +{
>> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>> +
>> +	if (qcom->current_role == next_role)
>> +		return;
>> +
>> +	if (pm_runtime_resume_and_get(qcom->dev)) {
>> +		dev_dbg(qcom->dev, "Failed to resume device\n");
> 
> Minor nit: should this be dev_err?
> 
>> +		return;
>> +	}
>> +
>> +	if (qcom->current_role == USB_ROLE_DEVICE)
>> +		dwc3_qcom_vbus_override_enable(qcom, false);
>> +	else if (qcom->current_role != USB_ROLE_DEVICE)
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
> 
> Minor nit: can we rename to dwc3_qcom_pre_run_stop()
> 
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
>> +	dwc3_qcom_vbus_override_enable(qcom, true);
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
>> @@ -636,6 +683,23 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
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
> 
> Shouldn't you determine if there's connection before setting vbus valid?
> 
> There are a couple things that seems at odd to me:
> 1) Typically we use "vbus override" to describe the vbus control on host
>     to turn on/off vbus. Where as here, the vbus override is used for
>     vbus valid in device mode for vbus detection.

The register was named that way even in HW description we get 
internally. So it was kept as is.

> 
> 2) It seems like you always enable vbus valid without checking for
>     connection status. You also set vbus valid even if it's in host mode.
>     Only when there's role-switch away from device that you'd clear the
>     vbus valid.
> 

In device mode, we do not get any role information (or cable connection) 
as role switch is not present and set_role notifier is not called. So if 
we keep the vbus_override set, it is still harmless because, it is used 
to generate a connection done event (which comes after bus reset) only 
when cable is connected to a host. If there is no cable connection, then 
keeping the bit set is a NOP and hence I set it by default when dr_mode 
is peripheral. I am setting this bit only is dr_mode is peripheral and 
when we are switching from any role to peripheral in case of a role switch.

> But I'm not familiar with your platform/design, so I can't judge much on
> the above. Base on the description provided, I don't expect functional
> issues from your implementation.
> 
> I think the comments above should not be blocking your change.
> 
> Whether or not you decide to make the updates for the minor nits, here's
> my ack:
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> 

Thanks for the review.

Regards,
Krishna,

> BR,
> Thinh
> 
>> +	} else {
>> +		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
>> +			qcom->current_role = USB_ROLE_HOST;
>> +		else
>> +			qcom->current_role = USB_ROLE_DEVICE;
>> +	}
>> +
>> +	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
>> +
>>   	qcom->dwc.dev = dev;
>>   	probe_data.dwc = &qcom->dwc;
>>   	probe_data.res = &res;
>> @@ -650,12 +714,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto remove_core;
>>   
>> -	qcom->mode = usb_get_dr_mode(dev);
>> -
>> -	/* enable vbus override for device mode */
>> -	if (qcom->mode != USB_DR_MODE_HOST)
>> -		dwc3_qcom_vbus_override_enable(qcom, true);
>> -
>>   	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
>>   	device_init_wakeup(&pdev->dev, wakeup_source);
>>   
>> -- 
>> 2.34.1
>>

