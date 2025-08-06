Return-Path: <linux-arm-msm+bounces-67887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B01D5B1C44F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 12:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7BD5182F7B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 10:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5667721ABC9;
	Wed,  6 Aug 2025 10:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mtgld+LP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A336205513
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 10:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754476336; cv=none; b=s6kzmgCHqE0R1v+KdLWW9N8xddqAjAWvXfhRxaktHuvBGBaUuWAhFmQp9eIKze23ekOJxunDd8DkuVBkV7ihKRUZJJwPlTQC86Ia21wdCoh8RZYXXpUWP1RElNNYMeDX+117Dm6uUq2dsAviFcnqBMLnUGzg0UbrLX3XFBFx93A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754476336; c=relaxed/simple;
	bh=tUcprFfXd9oAcJwqCv/w3dOR39GaGztYnBkemd5iOnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtJSIkYfhVPe92mQ208Ujm50bfK69sItbBiFFod7frUCQvHGSVAEzg7MAhGu/uVRqtbZIFncC7dqrTFAz9bR6+e4/Nb8Cw1ACsXqQBIf1cPi0VQjd9VYJp7/7W6hkPSibMi1/LfAMGoU7znuJEkC0RsEOKXT1AvZkV6aL5fZZDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mtgld+LP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766PUAH030921
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 10:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HEk/ULY6gK45IEnurP2aWib60KOhIepG3boZzjJxTdA=; b=Mtgld+LP5Qstevok
	W0BB0q2GJmeUj6hs63WvPcYhqla083K3Z32JldljfHTyaF4RAgYp3CSnlWg1kW4F
	MYVUDzf/+xEriO6oqYKmXdhMpHINS3G9qNWYg0DB8m/3+Tswzm5+OTOCPpglRhB3
	DAeLqBfY5CiBDUiO3Up4Pt6xfLQzCDa+Aq/lvUmPNko90vD4TuQRlVMCvdsZHUsX
	KJhD6GSAVAhW5+oQTFBweRmhGcwImPI0md7v+qoVaY1wrIBvD4u44AMLHVA1PZeb
	ipeGmZaAh7Tu+HmtD1t9Qd2yHDicJ2iuNbQrYFCt2BIUZERVQTnGjZVUyPPf8C+q
	UGyRFQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyctan0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 10:32:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b07ae72350so6970011cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 03:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754476332; x=1755081132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEk/ULY6gK45IEnurP2aWib60KOhIepG3boZzjJxTdA=;
        b=HzIdkmmdp3lqsadC7DzVLJjPSLU/e81sCD5C+LOnhHUmzRpLCG3oN2guFCpN9gT4Ro
         IT1Ni93wQiNSbTdFJLFJlGkYsiP95Zu/TOCR5LB4W6RTYYEGkXj4zkuKZYuYoo7Brbn1
         WREOyU5Lmg+UjFfOOUUTr9HmqXXYi4JrSJhWlvHUgHmTyHI1zJVMoo4ZRJWPYQehOBIf
         mOD/GYFRuuhnfmOupl6XYM92VOm202kLbsJYa16s25arPT2MoUHkti5i3jt9sOTS118D
         hoVk4enmK1WEhMSXTGQSafLvyUcv60VT8xC5yZ/hZnR8e0nP2/BOTdV94eIZiwAEMb98
         DwrQ==
X-Gm-Message-State: AOJu0YzC1OiY+k23ihHi1fzBx6I8qxNkitkfSMB6TrcLwfh5LQ4VjAw5
	5bBYcEwXKh8PcUQsqhBQL0RQ/MJI1y664rPly0/TVAO0XMF7upjAH3zlLSCV6STKHDtnt2bAPt/
	A8CalgSfch/tTc6eG3g8j0bVyDpb727+A/oW3L6rncb+mlaa7zYz5yCnBjVwgUHq26V5P
X-Gm-Gg: ASbGncuj13sO3Lcg9TeVe8sJvdZndafybsvbK9KBw713WzssO6tlze7LD2GTUzn+aZZ
	3G4JfS3GXOtgAPOl6l66Z6bwFt+ymZVAvcCurnY8RqaRaDkHSHYAcKnmY2sTaK5ciXvrdlsnLwl
	KjjW5BBXPmk8AnQDWrZf1P728bUzYVnzjJK5EbEda5JQ75KDoZAXHOqmitmVyq01OI8y1cPi22c
	pdb/4cOb/S1bH5MRPr44v7HMNOmb6ccM2hukVHisd/QLX6i3ADWnpOPTfRP0edUs2fQbqIVzRpI
	YSgVtMcsfV3Yyt5dzjLyB7r3Zdcd72bgvZTlyXs07lIoxvEk7HgjqVAY/InlM0+AIHfXEYSElHZ
	VPWWGRgOKjaTnaB6X9A==
X-Received: by 2002:ac8:7d0c:0:b0:4a9:b181:cdd1 with SMTP id d75a77b69052e-4b09133d2camr15361661cf.1.1754476332234;
        Wed, 06 Aug 2025 03:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8617zK76RWr+ilfFqm3EQxEshxMceq8P5bYKx3Fh7J1HbMsxXFxOycWQ3N+WaatQ4jGVpow==
X-Received: by 2002:ac8:7d0c:0:b0:4a9:b181:cdd1 with SMTP id d75a77b69052e-4b09133d2camr15361361cf.1.1754476331615;
        Wed, 06 Aug 2025 03:32:11 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b6csm1071709466b.48.2025.08.06.03.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 03:32:11 -0700 (PDT)
Message-ID: <83c54b3e-8e31-4ca1-9ca6-31703211d507@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 12:32:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250806095828.1582917-1-krishna.kurapati@oss.qualcomm.com>
 <20250806095828.1582917-3-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250806095828.1582917-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6zkv7Ass1GYllpuSmAjAhGtDcGW5kCi6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX3BOH1C52JV2k
 azDuMesX0n0qZRLi9eWSGlFYTSb/Yg+5OVdZ9a/EFmkCUUSSYxd2I5x2aiqta0RjrxbVnpEK+pU
 AkCXXwc3VHfUoRsP87cUHKt14AEEw9QhEipFbsuVwaqkjcDtvaj3IjLQV8FnJFeq5f5dbH/4vaf
 RF5NUV4eUJSR12XUQvE6KNysFU3qlIhTqoihubX0K34hTN7GZFWyeTqC4P85ggCSLnDwHUuoGje
 b/0WcURWNXn16J0p/wwYX7lS6u/emR/Dp/ZCjv4SiRhmOmat2mG0tA/Qp9EFSB8caYboG8vafsr
 5WVRjpxWcEgpCEtY4FI+EOwj7PLAAxmkmU6WOGC4jGNHVfQNn86x+ZfGrbny326Fbov500k3+/7
 fXfLEsDr
X-Authority-Analysis: v=2.4 cv=JIo7s9Kb c=1 sm=1 tr=0 ts=68932f2d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=jpV4xLzjOhFdEjUPh5wA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6zkv7Ass1GYllpuSmAjAhGtDcGW5kCi6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

On 8/6/25 11:58 AM, Krishna Kurapati wrote:
> On Qualcomm DWC3 dual-role controllers, the conndone/disconnect events in
> device mode are generated by controller when software writes to QSCRATCH
> registers in Qualcomm Glue layer rather than the vbus line being routed to
> dwc3 core IP for it to recognize and generate these events.
> 
> UTMI_OTG_VBUS_VALID  bit of QSCRATCH_HS_PHY_CTRL register needs to be set
> to generate a connection done event and to be cleared for the controller to
> generate a disconnect event during cable removal. When the disconnect is
> not generated upon cable removal, the "connected" flag of dwc3 is left
> marked as "true" and it blocks suspend routines and for that to happen upon
> cable removal, the cable disconnect notification coming in via set_role
> call need to be provided to the Qualcomm glue layer as well.
> 
> Currently, the way DWC3 core and Qualcomm legacy glue driver are designed,
> there is no mechanism through which the DWC3 core can notify the Qualcomm
> glue layer of any role changes which it receives via role switch. To
> register these glue callbacks at probe time, for enabling core to notify
> glue layer, the legacy Qualcomm driver has no way to find out when the
> child driver probe was successful since it does not check for the same
> during of_platform_populate.
> 
> Hence implement the following glue callbacks for flattened Qualcomm glue
> driver:
> 
> 1. set_role: To pass role switching information from drd layer to glue.
> This information is needed to identify NONE/DEVICE mode switch and modify
> QSCRATCH to generate connect-done event on device mode entry and disconnect
> event on cable removal in device mode.
> 
> 2. run_stop: When booting up in device mode, if autouspend is enabled and
> userspace doesn't write UDC on boot, controller enters autosuspend. After
> this, if the userspace writes to UDC in the future, run_stop notifier is
> required to enable UTMI_OTG_VBUS_VALID of QSCRATCH so that connect done
> event is generated after run_stop(1) is done to finish enumeration.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 80 +++++++++++++++++++++++++++++++-----
>  1 file changed, 70 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index a7eaefaeec4d..5195267cd34d 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -83,6 +83,8 @@ struct dwc3_qcom {
>  	bool			pm_suspended;
>  	struct icc_path		*icc_path_ddr;
>  	struct icc_path		*icc_path_apps;
> +
> +	enum usb_role		current_role;
>  };
>  
>  #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> @@ -111,10 +113,6 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
>  	readl(base + offset);
>  }
>  
> -/*
> - * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
> - * validate that the in-core extcon support is functional
> - */
>  static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
>  {
>  	if (enable) {
> @@ -560,6 +558,57 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
>  	return 0;
>  }
>  
> +static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
> +{
> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> +
> +	if (qcom->current_role == next_role)
> +		return;
> +
> +	if (pm_runtime_resume_and_get(qcom->dev) < 0) {

no need for the "< 0":

"""
Return 0 if the runtime PM usage counter of @dev has been
incremented or a negative error code otherwise.
"""

> +		dev_dbg(qcom->dev, "Failed to resume device\n");

This probably belongs in the suspend/resume calls themselves

> +		return;
> +	}
> +
> +	if (qcom->current_role == USB_ROLE_DEVICE &&
> +	    next_role != USB_ROLE_DEVICE)

The second part is unnecessary because the first if-condition in this
function ensures it
> +		dwc3_qcom_vbus_override_enable(qcom, false);
> +	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
> +		 (next_role == USB_ROLE_DEVICE))

similarly here

meaning this can become

dwc3_qcom_vbus_override_enable(qcom, next_role == USB_ROLE_DEVICE)

(I'm not sure if it's easier to read, up to you)

> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
> +	pm_runtime_mark_last_busy(qcom->dev);
> +	pm_runtime_put_sync(qcom->dev);
> +
> +	/*
> +	 * Current role changes via usb_role_switch_set_role callback protected
> +	 * internally by mutex lock.
> +	 */
> +	qcom->current_role = next_role;
> +}
> +
> +static void dwc3_qcom_run_stop_notifier(struct dwc3 *dwc, bool is_on)
> +{
> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> +
> +	/*
> +	 * When autosuspend is enabled and controller goes to suspend
> +	 * after removing UDC from userspace, the next UDC write needs
> +	 * setting of QSCRATCH VBUS_VALID to "1" to generate a connect
> +	 * done event.
> +	 */
> +	if (!is_on)
> +		return;
> +
> +	dwc3_qcom_vbus_override_enable(qcom, is_on);

this argument logically becomes true, always

> +	pm_runtime_mark_last_busy(qcom->dev);
> +}
> +
> +struct dwc3_glue_ops dwc3_qcom_glue_ops = {
> +	.pre_set_role	= dwc3_qcom_set_role_notifier,
> +	.pre_run_stop	= dwc3_qcom_run_stop_notifier,
> +};
> +
>  static int dwc3_qcom_probe(struct platform_device *pdev)
>  {
>  	struct dwc3_probe_data	probe_data = {};
> @@ -636,6 +685,23 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (ignore_pipe_clk)
>  		dwc3_qcom_select_utmi_clk(qcom);
>  
> +	qcom->mode = usb_get_dr_mode(dev);
> +
> +	if (qcom->mode == USB_DR_MODE_HOST) {
> +		qcom->current_role = USB_ROLE_HOST;
> +	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
> +		qcom->current_role = USB_ROLE_DEVICE;
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +	} else {
> +		if ((device_property_read_bool(dev, "usb-role-switch")) &&
> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))

currently this will never be true on any qcom dt ("role-switch-default-mode" is
not present anywhere)

> +			qcom->current_role = USB_ROLE_HOST;
> +		else
> +			qcom->current_role = USB_ROLE_DEVICE;
> +	}
> +
> +	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
> +

Konrad

