Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6E6F155376
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 09:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgBGIHh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 03:07:37 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:60824 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726586AbgBGIHh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 03:07:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581062856; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=pYSt7Z+Q2zmcmoG4oe8kLafuFqbUDpnUTVpgBQVYYe0=; b=JeWTwDcOHyD+6H4NHEvjC8u3RC3MyhMjD/qU3sw3wAZr+8wJbE5eUbvYgKcL+cs/yk3p+wGo
 6yguvf0N5a96d9pa/dcWD1JLM2MMhgzscch5Ji3ZZVgqsqQb71sBOYIRj5+Z4sjZn2huThJI
 oOtXDOBIC68eNkcnNWnjtBYeiSg=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3d1ac8.7fcc90630148-smtp-out-n01;
 Fri, 07 Feb 2020 08:07:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 47C29C4479C; Fri,  7 Feb 2020 08:07:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36778C43383;
        Fri,  7 Feb 2020 08:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 36778C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Fri, 7 Feb 2020 00:07:29 -0800
From:   Jack Pham <jackp@codeaurora.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v4 09/18] usb: dwc3: qcom: Override VBUS when using
 gpio_usb_connector
Message-ID: <20200207080729.GA30341@jackp-linux.qualcomm.com>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
 <20200207015907.242991-10-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207015907.242991-10-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On Fri, Feb 07, 2020 at 01:58:58AM +0000, Bryan O'Donoghue wrote:
> Using the gpio_usb_connector driver also means that we are not supplying
> VBUS via the SoC but by an external PMIC directly.
> 
> This patch searches for a gpio_usb_connector as a child node of the core
> DWC3 block and if found switches on the VBUS over-ride, leaving it up to
> the role-switching code in gpio-usb-connector to switch off and on VBUS.
 
<snip>

>  static int dwc3_qcom_probe(struct platform_device *pdev)
>  {
>  	struct device_node	*np = pdev->dev.of_node;
> @@ -557,7 +572,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	struct dwc3_qcom	*qcom;
>  	struct resource		*res, *parent_res = NULL;
>  	int			ret, i;
> -	bool			ignore_pipe_clk;
> +	bool			ignore_pipe_clk, gpio_usb_conn;
>  
>  	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
>  	if (!qcom)
> @@ -649,9 +664,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	}
>  
>  	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
> +	gpio_usb_conn = dwc3_qcom_find_gpio_usb_connector(qcom->dwc3);
>  
> -	/* enable vbus override for device mode */
> -	if (qcom->mode == USB_DR_MODE_PERIPHERAL)
> +	/* enable vbus override for device mode or GPIO USB connector mode */
> +	if (qcom->mode == USB_DR_MODE_PERIPHERAL || gpio_usb_conn)
>  		dwc3_qcom_vbus_overrride_enable(qcom, true);

This doesn't seem right. It looks like you are doing the vbus_override
only once on probe() and keeping it that way regardless of the dynamic
state of the connector, i.e. even after VBUS is physically removed
and/or ID pin is low.

>  	/* register extcon to override sw_vbus on Vbus change later */

As suggested by this comment, if you look at the extcon handling, it
intercepts the VBUS state toggling in dwc3_qcom_vbus_notifier() and
calls vbus_override() accordingly. That way it should only be true when
the role==USB_ROLE_DEVICE and disabled otherwise (USB_ROLE_HOST/NONE).

To me the gpio-b connector + usb-role-switch is attempting to be an
alternative to extcon. But to correctly mimic the vbus_override()
behavior I think we need a way to intercept when the connector child
driver calls usb_role_switch_set_role() to the dwc3 device, but somehow
be able to do it from up here in the parent/glue layer. Unfortunately I
don't have a good idea of how to do that, short of shoehorning an
"upcall" notification from drd.c to the glue, something I don't think
Felipe would be a fan of.

Could the usb_role_switch class somehow be enhanced to support chaining
multiple "consumers" to support this case? Such that when the gpio-b
driver calls set_role() it could get handled both by drd.c and
dwc3-qcom.c?

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
