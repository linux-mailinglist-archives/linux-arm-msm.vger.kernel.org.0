Return-Path: <linux-arm-msm+bounces-68708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0F6B22266
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 11:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A28887AA6A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 09:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B3829A30D;
	Tue, 12 Aug 2025 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kIwVq140"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E172E765D
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754989778; cv=none; b=pnwYXDslsSkPActd0oZFGD0iVu77LfGlvei3LgnzhZGT1Qf3PptwS1bGnDpenKWYFoWZXjq5Cf3iStKcH2i0J8DeoTmRIK+zh+DXdixECgKm72+CbIc1HNZBjV7m54U1DAU61yrMpDCqeeK0zdqRGOS+ixmQOKtZUulqcDSevqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754989778; c=relaxed/simple;
	bh=bcRgZxxZm5dMTAv+MCHtXygXGg1jBllmgGGPnkWK5iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MA943hurB1QH0fgMYSf2X7UDSllpmbwottiCFEdqgXULRzZBIcQfmy3uqnSY3+Glum5VXAC7uJAAW3WOOehtSI+EZP8BLLix69xS7W9MVlPYJ70iq986s7mPPu2hTdgE59rXhA16BUIWwRJ5YOlxwrJbN1p1OZinGraowppLExU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kIwVq140; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C734se007704
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uIMbl48QKb7Q2ta6KgDRhn0gdecz7ce+OLsivdgtlLw=; b=kIwVq140wOMCsZ/z
	38lqGTNdR63fGKjcY7b78+ZEEDMcooa3bn3nYqN66SAobsFaFp7j22xvkcOEID5N
	esrY/i6JljwMLbXo53oQtgWvXolzpBpKk2wpFcokiY8Z+7RohabcybKBOqJA5P5q
	rLfEtzgE9tB0NM/CLrNC5ARxKSEsja6fRmYQhZil0Omopt4lP5bsu/ByOhJRrvC8
	QP6UUmHhXmxtXaLUdWEvbQnLX1Ev04je/QJdgku/fcrglaiQP80rTXsgOoLfEDPa
	hgKXD3kxxpFYjxC3Qqgnc9EKyX4tIGBSoi764UbTvF3biClN+bqURxuj5IonwfcY
	8Eqlaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjkbr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 09:09:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e7fc43b261so97742685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 02:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989774; x=1755594574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIMbl48QKb7Q2ta6KgDRhn0gdecz7ce+OLsivdgtlLw=;
        b=EwF/WEOAl+NJKyRY3roGgBtQDJFqXCn/0vK474WA38qqhRl0IjaniapgVzkResolhv
         8Tzd28noHaO/juG/pvY13NFpmG3mDZepOAvVjgSX8O62I8ktF6pJ/n+pS2/FjacUzkwc
         2cu4lCvXEZrULmJ9c9MVR52UhP1LF74ghTKulHBzZhkbsmUU1ZJQ+i60ED6S9ciWpYUi
         chkGVju9cPXuevQUs0kkeRuKaxcA1I70KXFul2Y9dJGpmHH588dy/iuMcTif7mtTrfyk
         W6225EAsGzEkfz78ewVjG8sTFUlBzhlyCnLAZ8BQD7A4YLg7emUgjC8+F7BwELpfVlx7
         9VoQ==
X-Gm-Message-State: AOJu0YzrBOAI/GsIRO5A/AKQfVCZzRcpzqUw8flrPPExixTmasU63+sI
	U0f6eJw7dp68+yzwHlPPY6dUthAMBAe279kFAx9NPSD1m3bMjr+eThBa8Ay1UcfMuz3NRVbikpl
	azzpz5CbCY4yc1LuI7Z+8/T0YfLITzkaiDMDkAFHbGT7WsYPQwtzuHm+m+LYxKFxJh93v
X-Gm-Gg: ASbGncusO6MrPLIujjBK5LEhs3iDNA6oiG8BttSnhsNcHCPLU0WZWu6+cLq4TVUB9T3
	mt9GwIR11fJ/M4sCnJP9gbrLof3/Ws5qm79CDfEY+5GLFPs70YvVPkzOnpLdc2apZmWJpudwacp
	hG2dsaXuLkzX0DlBnf+7K5lNms35t0vR5EepwcecmYx1rfZ9vjjaM8/05TFuo2YgrMCnys9xZX3
	L1IGLbhSfRSeQuNpuAAQ5frNgwaL2r6hUVKPJZPrjeIengAdPq8cuYN2MbNH2zPi69OHdVpIbAT
	IYQpvcVKlOQHnXFFGkOgY80aMNSfB3ZsiickbJVEFlQWGJgbE2k61a69XpAERZslTgILc4d/9dN
	sAzMMLVlt63YVPL/hrw==
X-Received: by 2002:a05:620a:17a5:b0:7e6:5598:1fc6 with SMTP id af79cd13be357-7e860356a6fmr22572685a.8.1754989774430;
        Tue, 12 Aug 2025 02:09:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnlXnf/YbCuLIOKn9HG8+7RKUuvqXBGNTEXyk2OzW1YhsoxvxHMG/eUXzv5HDAXMbcSY96LA==
X-Received: by 2002:a05:620a:17a5:b0:7e6:5598:1fc6 with SMTP id af79cd13be357-7e860356a6fmr22571485a.8.1754989773890;
        Tue, 12 Aug 2025 02:09:33 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615cc38aeccsm18158600a12.2.2025.08.12.02.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:09:33 -0700 (PDT)
Message-ID: <575c80d1-5f68-4863-8ba3-9769a5047b8d@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:09:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] usb: dwc3: qcom: Implement glue callbacks to
 facilitate runtime suspend
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
 <20250812055542.1588528-3-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250812055542.1588528-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX7RPD2+ihlP6v
 /ftsvENc9ua7pUy9uOxInI/uDAXRomqNYEPErvJftTwVQ6pdCmtWo4SK7rvcGz2bHSjfNMK0vlB
 TgNJIgpQI/6N0gZXYlAUMgaY8fCHf8m9H9ADLn43GJgeSAdaM9+MYE/vgVxFA85oEX8gSaDKged
 CS/e0KfDceDPlfzvxUb1eicqTm2ynhQsC5XABc/nR7THyMy/9etrBAssqagWeHmvmTHOT56m2mZ
 o2lvR4/DP/IoaOOnJp8/wPh678N4lvjHLd93GkapxAZEUisS/AdR2URWqUzKSYm/VoznuUmuBmw
 Yp/6r4PsOtWeLQTqje97fGW4oHErUFm+4Ioiycz43ISJ6ul38bOSLl6Ve/OZljwjyTck5vFffSg
 WGxjdxJa
X-Proofpoint-GUID: 4GNTNMWyeX3xbmE1UTtgTws52M2cxdGz
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689b04cf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=t7pkRBm_AtVa8SjYk78A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 4GNTNMWyeX3xbmE1UTtgTws52M2cxdGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

On 8/12/25 7:55 AM, Krishna Kurapati wrote:
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

[...]

> +	if (qcom->current_role == USB_ROLE_DEVICE)

I think it makes more sense to check for next_role here (we know
it'll be the opposite of current_role, but this is confusing to read)

> +		dwc3_qcom_vbus_override_enable(qcom, false);
> +	else if (qcom->current_role != USB_ROLE_DEVICE)
> +		dwc3_qcom_vbus_override_enable(qcom, true);

I think the formerly proposed inline comparison grew on me..
or at least drop the 'else' condition, '==' only goes two ways

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
> +	dwc3_qcom_vbus_override_enable(qcom, true);
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
> @@ -636,6 +683,23 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (ignore_pipe_clk)
>  		dwc3_qcom_select_utmi_clk(qcom);
>  
> +	qcom->mode = usb_get_dr_mode(dev);
> +
> +	if (qcom->mode == USB_DR_MODE_HOST) {
> +		qcom->current_role = USB_ROLE_HOST;

Should we explicitly clear the VBUS override in this and the last branch?

Konrad

> +	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
> +		qcom->current_role = USB_ROLE_DEVICE;
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +	} else {
> +		if ((device_property_read_bool(dev, "usb-role-switch")) &&
> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
> +			qcom->current_role = USB_ROLE_HOST;
> +		else
> +			qcom->current_role = USB_ROLE_DEVICE;
> +	}
> +
> +	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
> +
>  	qcom->dwc.dev = dev;
>  	probe_data.dwc = &qcom->dwc;
>  	probe_data.res = &res;
> @@ -650,12 +714,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto remove_core;
>  
> -	qcom->mode = usb_get_dr_mode(dev);
> -
> -	/* enable vbus override for device mode */
> -	if (qcom->mode != USB_DR_MODE_HOST)
> -		dwc3_qcom_vbus_override_enable(qcom, true);
> -
>  	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
>  	device_init_wakeup(&pdev->dev, wakeup_source);
>  

