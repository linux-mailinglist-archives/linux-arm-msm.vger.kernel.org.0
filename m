Return-Path: <linux-arm-msm+bounces-64846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD722B04443
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 17:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52EFC189206B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 15:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29005269830;
	Mon, 14 Jul 2025 15:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTpC8asi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D56F264A73
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 15:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506990; cv=none; b=MgKXAzijg4OdPp7aSpVjbMuA8JmSW9ubRPkLTfXk2Z/X1k07+tU/F5rnDaDF/gGkJ8Xk3ljKODsjqv35W2kYIH011nCcGOHz1ULoxuJWZ4Sd3RHr2/mFOEbQnJ23Ity0tlZ4gIZLX9fNRoS1v8LhkZDkx75CYvZ14FKEONRhCdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506990; c=relaxed/simple;
	bh=T1Mdsc4JM5JmPEJvdOVLsOzT/sLrlOvVRrsYyOrni7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpOeaLEgrEcagKsuCn5AYUBSwMTQBZcoAhHl0rlI8TNpZh4IycZXbFgMpVHKdrmN17bpt5gvLEjjiCM9M0x75Xux1xVLfDsmINbdTLc6piAHQx3/Gxd//plnGueZcmI2EYKfAI3SsuyDntgHM+/nCnyvCrquXd80xu4qrcZi7CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTpC8asi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9mEU2004164
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 15:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sc20yyLx6uwEm8iOhcdE1IlDb1WrP1gxUU+Y/eFAixM=; b=UTpC8asiIgxLFMet
	+KDFAGYeTfn8cJfBibG4IAf+5V3smzKmnyVl4Jn3ZwBbBRQ/YRodNoigqAmm/mVb
	BDhL7VIJCGP3SzSMxVpkqKKoQcajLrD1ADtYzEk33cZcKl7uju/wD6DY4EwojqJp
	mwPZHMEZhcqQGqDccfE2h5Bv/+8xOGFJB1ogdRcNxMzSP2qYE7e/pTsZRWjJ5wIl
	emCsXrKaa3dJmNA/UAJN/FbleWAYfVuGOYK9R3ezfksLQpBoKsfwwwzO1UySvPbf
	uNhEFp+Pf4afqHQW+VICCZ0Z0yejGN/j2ivyfQe7RUqH2PWYFMmzxLeI50q4wXEA
	S4aa7A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu850nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 15:29:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31f112c90aso3068106a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 08:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506985; x=1753111785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sc20yyLx6uwEm8iOhcdE1IlDb1WrP1gxUU+Y/eFAixM=;
        b=IXsR0BE1D7UZiBlR3AIfoLW3w4V+SrHvcgQLPF+w1oe+CjDAnftKEd8DBFZiGEUTgA
         GD5deq3RdWyqwBICJrr6N2Bcpiq2U3/U/eEzI3J7cSrRP0xjixiL/ry1ocDLUbxf4qFr
         e3j2EUnMPpmUVxkF9tkPRv7TqC9JLXXuPIhmiuNIQKnQUlUvWlMahsROIT+ZCh+AHuvL
         fp1Q8Jw5onyY6w7Pktd/Bugm1xPg/AERyW6kPSakkELcHZAcjHLoC0t4FqIDOcYlWUBG
         92ulNPOUFdRIsqbUxkqweHwVLxP5q/L3GXeSxD/bE5NHLjAGSXGKwuaDomewaWgRSlJA
         sHFg==
X-Gm-Message-State: AOJu0YxG6PfXIkX+0HqzO1pUMexgV1z71VgZ3YRyTq4/ti10pHCMw5sV
	dq2EQUZIUe8eGkY2RI1QwcHbyOyz69J1tKT2Pjb3sSCCK687aQyzYKPasqWQHULumX4sN+Q9Kqb
	1tLbnEDd5bud5nUAVqWreHVLHYPeFvO5UjaRkZHK6velNlYdXL2b8OKtmXrfLJUdC9R35
X-Gm-Gg: ASbGncvFmg6KHmkEfBzvkBnGQ2atZrIwPrQZ/3CwupM1B5msjaOj8PXPTX8zquw9Z3U
	I3kQSjVRuENAi/w+OAaZzvQybzw14ssKfD21KjV/pFF3eqMBocgc20fQiGhKEff7faeNBotpM8u
	/9vZ3HWExloU3MkLRcY6ljTLl/RD4/o4oATN+UNhOhTdrxP0ykF61VdhjvGWj0m+MM2pEAfKyJ6
	Dz7vgPCjdV8NNJry8T4l0Vofu6PL7UY1RN4uUvAnnTdb8T+7IZEr/JT5e4fQudL7PcVEbUmgqhs
	QnTDEQgUGa4wNNmM0zRZtl6dnTlxPgr30IlxWe5KmD/IzS7uGW7vdFKThL992ehUlY81PWU=
X-Received: by 2002:a17:903:7c7:b0:231:9817:6ec1 with SMTP id d9443c01a7336-23e1a47c514mr62905ad.17.1752506984869;
        Mon, 14 Jul 2025 08:29:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGES5Y2dRxhfcCMM+wJvXYd9ZZrcxo8M21VCbQ4zrhDX3UO9/CvLZWBR+xQ8CwxnG8n1ulaaA==
X-Received: by 2002:a17:903:7c7:b0:231:9817:6ec1 with SMTP id d9443c01a7336-23e1a47c514mr62395ad.17.1752506984223;
        Mon, 14 Jul 2025 08:29:44 -0700 (PDT)
Received: from [192.168.1.36] ([202.164.130.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de435bbc1sm94750925ad.228.2025.07.14.08.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:29:43 -0700 (PDT)
Message-ID: <b3767f6b-9793-47bc-9b09-70fc931ce8f3@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 20:59:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: qcom: Remove extcon functionality from glue
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20250714044703.2091075-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA5MSBTYWx0ZWRfX2uCX+JAvSkD2
 VKA+snGVQYpflWw7qI67ovuu+MCCHYiueecDC1EhFe5hPN1nVA1G4+1PxMB62qxcq3499yl7SwE
 +tpzYj6Zh4Z9QppYFH/9ShJYlW0Sqv2GRfw0tToEJ4+dLmCyX68ATGsEgbp6i5WCB9djhd5ayHL
 Ozl/m5967WediejmAUC/cL9udlmJRbHI+pppiGQRhQZ1nYhT0YShxwMggG56jX0SGHGf4LyOFPT
 CpqpxuYpXz6y1oji4EVXkZzc42JQL8ZxkGYp//pwEKDXWN3fvZAUEWS9PntLUhk+ecSi0z7OW0s
 re93UvLSNeqJSDlhnki0ptXcZgBWsAA12xwbr69pFwJ1fm0pbOa9ofWspNNoY/2//JBSJXACLIH
 n+tvNnywDT4ubGuiXgs7N38So/Vx2AtZq6Ix7K0yAP78uSv4o0ZZBxuTeFV+L9sEelSOdI33
X-Proofpoint-ORIG-GUID: jfjAN6_Ac8qBzm6gWLVKX4RLz4ywiM4z
X-Proofpoint-GUID: jfjAN6_Ac8qBzm6gWLVKX4RLz4ywiM4z
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=6875226a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=5MqDkbE+qPoSl7Gb0QG4vw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2Tj7kaNsuKJ3Ycti4bYA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140091



On 7/14/2025 10:17 AM, Krishna Kurapati wrote:
> Deprecate usage of extcon functionality from the glue driver. Now
> that the glue driver is a flattened implementation, all existing
> DTs would eventually move to new bindings. While doing so let them
> make use of role-switch/ typec frameworks to provide role data
> rather than using extcon.
> 
> On upstream, summary of targets/platforms using extcon is as follows:
> 
> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
> effect on them.
> 
> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
> driver which relies on id/vbus gpios to inform role changes. This can be
> transitioned to role switch based driver (usb-conn-gpio) while flattening
> those platforms to move away from extcon and rely on role
> switching.
> 
> 3. The one target that uses dwc3 controller and extcon and is not based
> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
> This platform uses TI chip to provide extcon. If usb on this platform is
> being flattneed, then effort should be put in to define a usb-c-connector
> device in DT and make use of role switch functionality in TUSB320L driver.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v3:
> This change was 4rth patch in [1]. It was suggested to make this as the
> first patch of the series. Since this is independent of role switch
> patches, sending this out separately. Removed RB Tag of Dmitry since the
> patch has been changed.
> 
> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
> 
>  drivers/usb/dwc3/dwc3-qcom.c | 90 +-----------------------------------
>  1 file changed, 1 insertion(+), 89 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ca7e1c02773a..a7eaefaeec4d 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -11,7 +11,6 @@
>  #include <linux/of_clk.h>
>  #include <linux/module.h>
>  #include <linux/kernel.h>
> -#include <linux/extcon.h>
>  #include <linux/interconnect.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> @@ -79,11 +78,6 @@ struct dwc3_qcom {
>  	struct dwc3_qcom_port	ports[DWC3_QCOM_MAX_PORTS];
>  	u8			num_ports;
>  
> -	struct extcon_dev	*edev;
> -	struct extcon_dev	*host_edev;
> -	struct notifier_block	vbus_nb;
> -	struct notifier_block	host_nb;
> -
>  	enum usb_dr_mode	mode;
>  	bool			is_suspended;
>  	bool			pm_suspended;
> @@ -119,8 +113,7 @@ static inline void dwc3_qcom_clrbits(void __iomem *base, u32 offset, u32 val)
>  
>  /*
>   * TODO: Make the in-core role switching code invoke dwc3_qcom_vbus_override_enable(),
> - * validate that the in-core extcon support is functional, and drop extcon
> - * handling from the glue
> + * validate that the in-core extcon support is functional
>   */
>  static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
>  {
> @@ -137,80 +130,6 @@ static void dwc3_qcom_vbus_override_enable(struct dwc3_qcom *qcom, bool enable)
>  	}
>  }
>  
> -static int dwc3_qcom_vbus_notifier(struct notifier_block *nb,
> -				   unsigned long event, void *ptr)
> -{
> -	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, vbus_nb);
> -
> -	/* enable vbus override for device mode */
> -	dwc3_qcom_vbus_override_enable(qcom, event);
> -	qcom->mode = event ? USB_DR_MODE_PERIPHERAL : USB_DR_MODE_HOST;
> -
> -	return NOTIFY_DONE;
> -}
> -
> -static int dwc3_qcom_host_notifier(struct notifier_block *nb,
> -				   unsigned long event, void *ptr)
> -{
> -	struct dwc3_qcom *qcom = container_of(nb, struct dwc3_qcom, host_nb);
> -
> -	/* disable vbus override in host mode */
> -	dwc3_qcom_vbus_override_enable(qcom, !event);
> -	qcom->mode = event ? USB_DR_MODE_HOST : USB_DR_MODE_PERIPHERAL;
> -
> -	return NOTIFY_DONE;
> -}
> -
> -static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
> -{
> -	struct device		*dev = qcom->dev;
> -	struct extcon_dev	*host_edev;
> -	int			ret;
> -
> -	if (!of_property_present(dev->of_node, "extcon"))
> -		return 0;
> -
> -	qcom->edev = extcon_get_edev_by_phandle(dev, 0);
> -	if (IS_ERR(qcom->edev))
> -		return dev_err_probe(dev, PTR_ERR(qcom->edev),
> -				     "Failed to get extcon\n");
> -
> -	qcom->vbus_nb.notifier_call = dwc3_qcom_vbus_notifier;
> -
> -	qcom->host_edev = extcon_get_edev_by_phandle(dev, 1);
> -	if (IS_ERR(qcom->host_edev))
> -		qcom->host_edev = NULL;
> -
> -	ret = devm_extcon_register_notifier(dev, qcom->edev, EXTCON_USB,
> -					    &qcom->vbus_nb);
> -	if (ret < 0) {
> -		dev_err(dev, "VBUS notifier register failed\n");
> -		return ret;
> -	}
> -
> -	if (qcom->host_edev)
> -		host_edev = qcom->host_edev;
> -	else
> -		host_edev = qcom->edev;
> -
> -	qcom->host_nb.notifier_call = dwc3_qcom_host_notifier;
> -	ret = devm_extcon_register_notifier(dev, host_edev, EXTCON_USB_HOST,
> -					    &qcom->host_nb);
> -	if (ret < 0) {
> -		dev_err(dev, "Host notifier register failed\n");
> -		return ret;
> -	}
> -
> -	/* Update initial VBUS override based on extcon state */
> -	if (extcon_get_state(qcom->edev, EXTCON_USB) ||
> -	    !extcon_get_state(host_edev, EXTCON_USB_HOST))
> -		dwc3_qcom_vbus_notifier(&qcom->vbus_nb, true, qcom->edev);
> -	else
> -		dwc3_qcom_vbus_notifier(&qcom->vbus_nb, false, qcom->edev);
> -
> -	return 0;
> -}
> -
>  static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom)
>  {
>  	int ret;
> @@ -737,11 +656,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	if (qcom->mode != USB_DR_MODE_HOST)
>  		dwc3_qcom_vbus_override_enable(qcom, true);
>  
> -	/* register extcon to override sw_vbus on Vbus change later */
> -	ret = dwc3_qcom_register_extcon(qcom);
> -	if (ret)
> -		goto interconnect_exit;
> -
>  	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
>  	device_init_wakeup(&pdev->dev, wakeup_source);
>  
> @@ -749,8 +663,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> -interconnect_exit:
> -	dwc3_qcom_interconnect_exit(qcom);
>  remove_core:
>  	dwc3_core_remove(&qcom->dwc);
>  clk_disable:

Shouldn't we cleanup the Kconfig also? Anyways it's not critical, so it
can be handled in a follow-up patch if preferred.

config USB_DWC3_QCOM
		tristate "Qualcomm Platform"
		depends on ARCH_QCOM || COMPILE_TEST
-		depends on EXTCON || !EXTCON
		depends on OF

Regards,
Prashanth K

