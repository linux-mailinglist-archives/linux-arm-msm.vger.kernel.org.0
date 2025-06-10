Return-Path: <linux-arm-msm+bounces-60759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F351AD343B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A603172B4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998CD28DB67;
	Tue, 10 Jun 2025 11:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G90MMvdy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C110528DB50
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553257; cv=none; b=C30HXegP1BRJ7wLP3f2G+5UZWjPtPsNR40kiU5tBjayPEHh31LT4WFVvFpsYoiBBreVQ/XCXkHgpT3j7n+iDUVBE3Txrf4GY0d1qKREO1Nxu5MeE1BcZzLNrz9u2Q4GY9GiN8NYOydG6LQ/8ZV3oCY0pzJoryAh8iira6paGCZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553257; c=relaxed/simple;
	bh=+dIEq21bZDNm/F5wofLUI1T/a46ytCN/VL25CWWOfSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L9QhBDZzYzxr74CqU5nbGj9pnQ/x9vkwFDQjoFqYK8UEOJXBkbKg/yx/BVsBy8G/Huvags1wAaJ/fNVP1u9KO348BsxefZEPQJ9yt6YKfdHK9+LZy8csrmlGXpBemTSXBF5K/sMNJCfW+aLHM5Xum1Kih1RV5UbmHdpaKxhzDUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G90MMvdy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AADDX6011148
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pEBkMXzXpL7qUqFVNTnStfd7
	mGzv44qmPPxiUT7KNxU=; b=G90MMvdyzvFIDk95eDOCYkyYwHIwLdA6xjcmDaL1
	xr6zPmqs2t3pOS3pxEXq2c2DeF0mdBOpTyC+pzVhh54G1lh6oe76E7JkliwRxN9J
	24GTmYFBCWv8abcqYN52V6pDs7JcKEMME7GhcRqtghLd6ot2TTNBDT6fpzXCVz7n
	TlMdKWt+R/AhiEd2YNs4eA7ZdtCRim2LUkKPn+BKYDPhdZ3krZ1U8OctKbHgP14O
	fBDWK4zxYZd9dutrfB+reFsw2PC24kJFXFxpOltchj6euTf5X3tpeYNGGAuvMq+8
	VPzZkB8iF8WEfDd+/vACVIXFTuvDK3zYF66usDgrfRVTqw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrh84mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:00:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-4e7b071c243so103942137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 04:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553253; x=1750158053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEBkMXzXpL7qUqFVNTnStfd7mGzv44qmPPxiUT7KNxU=;
        b=u1hDR+gqLott9n+4DXz9Y7h1ezHqZE7suLfIqp/cdfbqF7Hlj8rrNdk0dhLjBcG8TC
         YnGK5hxjyw7LiVcGHBtKXcT3AzXXndgQlSIQ+IN1OR9pnaLNgaEXjEr18xl+goGt/0sV
         63zGxE7RqlAnXSZSKQz7oV/6sl+FI3MnukvFwQ1OnHlCYPs+LVjyRFiSmzTEkljg7uW9
         gDvi1OiyRQFIbWGFokDCVJwAieGCI8H3qAl7vWdHTyegKLtjsQ9eIUGwTZ/OeAbNczGs
         MAUogP8dUn5G7eQMuc3ExJDQfKB249IACDmWpD7QADLAUjcbZCt1jVPQh4zvwla166Qf
         u+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXPK0WIcg9FScdMa8AX3HWM7jNEBpRj9QJ95N1oN8vD73+y5srCsGIysib9isvwqADIZpvbpf4wnEDoSpNf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwasvx6ikQGJWep1+jarDpUtwb66QMcXc1Ko1qu+89x+L/rgWq
	3nGJDRPnBO+6wC4LvkJX1y4HHgTSEIsXSSsP4h9ur8KgZ+4SAnbqaGwwKw8q4ZHq0eCw/r14jZg
	UJao+AjdANeY9/TliraPy2SSOfyhzn8BrJGtvlQh7L2krkpAiypF4YGlFS9Z97+4Yca+9iZYByj
	lv
X-Gm-Gg: ASbGncsWPt5iqMAvbGyu+gu5QGAQ4l+HcXdp0E3ZTvdiOGyktHrgjYnZcDfYvPJo7uW
	NoM8bQ+3IvywulBuD/xKuqtvzPx6zZT4a32PeIWjkrbfK5QH/xusU48ehFkoFsIpKxMf1S0rhDM
	YWNmYMafFbhcsTjFR6KHHn706HBW6cgPfRpXv4gaAg6T5O8XkHPIpilvX/zSyT/MCeiHm9LG1Zi
	E3O+LHYQWqbudMbRpNkCOrIWvnN0TCILANKY0ebF+Z1CyLsJ6DzzAiaeulfzVOZY9yfkSJaW4iY
	CEQfeEJ2Hy0CiYYZqsTqQURXOGhlRdiE2e+FqWqOPGpgmj8sk3xUnOzI5p9oQOs+c4V2+rHVaOJ
	1feypAp13P0nhNIVyhaxn/emfmU5N3qA3owU=
X-Received: by 2002:a05:6102:54a5:b0:4e2:bacd:9f02 with SMTP id ada2fe7eead31-4e772a31678mr11943339137.16.1749553252097;
        Tue, 10 Jun 2025 04:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCnwVY9cWENSO5uE9wpn1rHEVj0l2S2/o8EK9oDN+YHWBDV4+pps3la8q1tc3n3DXG9UFWvQ==
X-Received: by 2002:a05:6102:54a5:b0:4e2:bacd:9f02 with SMTP id ada2fe7eead31-4e772a31678mr11943093137.16.1749553250944;
        Tue, 10 Jun 2025 04:00:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b3fa6dsm14218041fa.46.2025.06.10.04.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:00:50 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:00:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] usb: dwc3: qcom: Facilitate autosuspend during
 host mode
Message-ID: <20250610110047.4yc6zjcvkobxerml@umbar.lan>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-4-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610091357.2983085-4-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=68481066 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=iYtnYYCt-WnurzE34mkA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: rn0ldP4md7rxqOQ5hZe68NF_DcTTL0ys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NSBTYWx0ZWRfX7AZQvWGkwt3J
 UGRFo1cFacDTQlmAQELWL43dAW4RgS8Mw34oJ63HcXfDzCgsCI+79mJDM4qoGwfOp2avr2IguzJ
 QvlNkQGl74ipbGAJbf4l4FVgLXiKerR9MlgcDzxBuCrhdJHqecPJlj9ZnxIt8ne567xhJzZmiOH
 dTOuBGpMY9rx2QXkGTvO678BNzUgaNN40o6/4/ZSw6MVOs+CCZGFY8+AG8z5c4Otoajr5OOZYRZ
 wN7/53D1dXk26frB5Zfjh4BC7sEF72rCupHOqwC76iuwDCrYXiR0IuktwYhBKkKjFqQkW07EF6D
 ulp1xK/GURRGluZu9NUOuLi7py7oUTQNEHglSuAYyB3yKqHpzD6zAAy/rXa9rS6ZBv7lAkUNSly
 /8gtId4HjqouQf55v4sEnQWhQEmuvMHI0g8YKr+2jXtwiI+MQprnXSPwW/4Qd3WnlwnsIR2k
X-Proofpoint-GUID: rn0ldP4md7rxqOQ5hZe68NF_DcTTL0ys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100085

On Tue, Jun 10, 2025 at 02:43:56PM +0530, Krishna Kurapati wrote:
> When in host mode, it is intended that the controller goes to suspend
> state to save power and wait for interrupts from connected peripheral
> to wake it up. This is particularly used in cases where a HID or Audio
> device is connected. In such scenarios, the usb controller can enter
> auto suspend and resume action after getting interrupts from the
> connected device.
> 
> Allow autosuspend for and xhci device and allow userspace to decide
> whether to enable this functionality.
> 
> a) Register to usb-core notifications in set_role vendor callback to
> identify when root hubs are being created. Configure them to
> use_autosuspend.
> 
> b) Identify usb core notifications where the HCD is being added and
> enable autosuspend for that particular xhci device.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 62 ++++++++++++++++++++++++++++++++----
>  1 file changed, 56 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index d40b52e2ba01..17bbd5a06c08 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -95,6 +95,8 @@ struct dwc3_qcom {
>  	 * internally by mutex lock.
>  	 */
>  	enum usb_role		current_role;
> +
> +	struct notifier_block	xhci_nb;
>  };
>  
>  #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> @@ -647,6 +649,39 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
>  	return 0;
>  }
>  
> +static int dwc3_xhci_event_notifier(struct notifier_block *nb,
> +				    unsigned long event, void *ptr)
> +{
> +	struct dwc3_qcom  *qcom	= container_of(nb, struct dwc3_qcom, xhci_nb);
> +	struct dwc3	  *dwc	= &qcom->dwc;
> +	struct usb_bus	  *ubus	= ptr;
> +	struct usb_hcd	  *hcd;
> +
> +	if (!dwc->xhci)
> +		goto done;
> +
> +	hcd = platform_get_drvdata(dwc->xhci);
> +	if (!hcd)
> +		goto done;
> +
> +	if (event != USB_BUS_ADD)
> +		goto done;
> +
> +	if (strcmp(dev_name(ubus->sysdev), dev_name(dwc->sysdev)) != 0)
> +		goto done;
> +
> +	if (event == USB_BUS_ADD) {
> +		/*
> +		 * Identify instant of creation of primary hcd and
> +		 * mark xhci as autosuspend capable at this point.
> +		 */
> +		pm_runtime_use_autosuspend(&dwc->xhci->dev);

This feels like an overkill, using notifiers to set autosuspend flag.
Please extend platform data and/or other static code in order to set the
flag on the created xHCI devices.

> +	}
> +
> +done:
> +	return NOTIFY_DONE;
> +}
> +
>  static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
>  {
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> @@ -659,12 +694,22 @@ static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_rol
>  		return;
>  	}
>  
> -	if (qcom->current_role == USB_ROLE_DEVICE &&
> -	    next_role != USB_ROLE_DEVICE)
> +	if (qcom->current_role == USB_ROLE_NONE) {
> +		if (next_role == USB_ROLE_DEVICE) {
> +			dwc3_qcom_vbus_override_enable(qcom, true);
> +		} else if (next_role == USB_ROLE_HOST) {
> +			qcom->xhci_nb.notifier_call = dwc3_xhci_event_notifier;
> +			usb_register_notify(&qcom->xhci_nb);
> +		}
> +	} else if (qcom->current_role == USB_ROLE_DEVICE &&
> +		   next_role != USB_ROLE_DEVICE) {
>  		dwc3_qcom_vbus_override_enable(qcom, false);
> -	else if ((qcom->current_role != USB_ROLE_DEVICE) &&
> -		 (next_role == USB_ROLE_DEVICE))
> -		dwc3_qcom_vbus_override_enable(qcom, true);
> +	} else if (qcom->current_role == USB_ROLE_HOST) {
> +		if (next_role == USB_ROLE_NONE)
> +			usb_unregister_notify(&qcom->xhci_nb);
> +		else if (next_role == USB_ROLE_DEVICE)
> +			dwc3_qcom_vbus_override_enable(qcom, true);
> +	}
>  
>  	pm_runtime_mark_last_busy(qcom->dev);
>  	pm_runtime_put_sync(qcom->dev);
> @@ -774,6 +819,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	if (qcom->mode == USB_DR_MODE_HOST) {
>  		qcom->current_role = USB_ROLE_HOST;
> +		qcom->xhci_nb.notifier_call = dwc3_xhci_event_notifier;
> +		usb_register_notify(&qcom->xhci_nb);
>  	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>  		qcom->current_role = USB_ROLE_DEVICE;
>  		dwc3_qcom_vbus_override_enable(qcom, true);
> @@ -794,7 +841,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	ret = dwc3_core_probe(&probe_data);
>  	if (ret)  {
>  		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> -		goto clk_disable;
> +		goto unregister_notify;
>  	}
>  
>  	ret = dwc3_qcom_interconnect_init(qcom);
> @@ -817,6 +864,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	dwc3_qcom_interconnect_exit(qcom);
>  remove_core:
>  	dwc3_core_remove(&qcom->dwc);
> +unregister_notify:
> +	if (qcom->mode == USB_DR_MODE_HOST)
> +		usb_unregister_notify(&qcom->xhci_nb);
>  clk_disable:
>  	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
>  
> -- 
> 2.34.1
> 

