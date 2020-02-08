Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 664701561DA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2020 01:15:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbgBHAPb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 19:15:31 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:56847 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726995AbgBHAP3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 19:15:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581120928; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=VpG+eyST5RsmDX3zT2VkIqnC3NB2/2TQvTi2z4BmXLc=; b=eFZdr7fz9e7Oc+tKeNqeu1aZLoklQ9oVJ/IorD2fSvFi6SKm/yRUZXCCTElGipTw2IJSCQRZ
 7PrqwF8nYnhL15y0rRXizXA/dNLaitKltOJgMUuwvX3e9SgHhO28rJ0CdgrUMphRpsqFE3Nl
 0Vg/DaIfEbvnrg56pVzIjrvhuHY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3dfd9a.7f86edca7a40-smtp-out-n02;
 Sat, 08 Feb 2020 00:15:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2837C447A1; Sat,  8 Feb 2020 00:15:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B9E0BC433CB;
        Sat,  8 Feb 2020 00:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B9E0BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Fri, 7 Feb 2020 16:15:20 -0800
From:   Jack Pham <jackp@codeaurora.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v5 11/18] usb: dwc3: Add support for a role-switch
 notifier
Message-ID: <20200208001520.GB18464@jackp-linux.qualcomm.com>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
 <20200207201654.641525-12-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207201654.641525-12-bryan.odonoghue@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bryan,

On Fri, Feb 07, 2020 at 08:16:47PM +0000, Bryan O'Donoghue wrote:
> Role-switching is a 1:1 mapping between a producer and a consumer. For DWC3
> we have some vendor specific wrappers, notably the qcom wrapper that want
> to toggle some PHY related bits on a USB role switch.
> 
> This patch adds a role-switch notifier to the dwc3 drd code. When the USB
> role-switch set() routine runs, the notifier will fire passing the notified
> mode to the consumer, thus allowing vendor specific fix-ups to toggle from
> the role-switching events.

Neat! This could work. But let's see if Felipe likes this approach.

If you need, here's a

Reviewed-by: Jack Pham <jackp@codeaurora.org>

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
