Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD122739E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 06:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbgIVElQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 00:41:16 -0400
Received: from z5.mailgun.us ([104.130.96.5]:15711 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728039AbgIVElN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 00:41:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600749672; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=bUKlnnp/+YrMJ97S9eeXpqFjRMf7jnKLhBdWon25zlI=; b=kDpXLyrefvUltc5rVib1KdBcA2zMBMBPaXNYO75dy+l/S+vbfGm6FSGVUkAdQ9wduJwT/x+j
 vISGVB1nz3aJaOF+bQ9oBihmgFgll9gRmc3ttnGP5nkhJMuwqt7VUEqoWKtM+WYZrzCZI2vG
 FaMX+OuZrcJNmGBFmTXPv1a7E2M=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f69806828e87a878b125f71 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Sep 2020 04:41:12
 GMT
Sender: akashast=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 98AAEC433FE; Tue, 22 Sep 2020 04:41:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.101] (unknown [47.8.232.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 113ACC433C8;
        Tue, 22 Sep 2020 04:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 113ACC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akashast@codeaurora.org
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7180: Provide pinconf for SPI
 to use GPIO for CS
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200921142655.v3.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid>
From:   Akash Asthana <akashast@codeaurora.org>
Message-ID: <bebf3d2d-0e40-ee63-70be-eb6fb6bf9a68@codeaurora.org>
Date:   Tue, 22 Sep 2020 10:10:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921142655.v3.1.I997a428f58ef9d48b37a27a028360f34e66c00ec@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/22/2020 2:57 AM, Douglas Anderson wrote:
> When the chip select line is controlled by the QUP, changing CS is a
> time consuming operation.  We have to send a command over to the geni
> and wait for it to Ack us every time we want to change (both making it
> high and low).  To send this command we have to make a choice in
> software when we want to control the chip select, we have to either:
> A) Wait for the Ack via interrupt which slows down all SPI transfers
>     (and incurrs extra processing associated with interrupts).
> B) Sit in a loop and poll, waiting for the Ack.
>
> Neither A) nor B) is a great option.
>
> We can avoid all of this by realizing that, at least on some boards,
> there is no advantage of considering this line to be a geni line.
> While it's true that geni _can_ control the line, it's also true that
> the line can be a GPIO and there is no downside of viewing it that
> way.  Setting a GPIO is a simple MMIO operation.
>
> This patch provides definitions so a board can easily select the GPIO
> mode.
>
> NOTE: apparently, it's possible to run the geni in "GSI" mode.  In GSI
> the SPI port is allowed to be controlled by more than one user (like
> firmware and Linux) and also the port can operate sequences of
> operations in one go.  In GSI mode it _would_ be invalid to look at
> the chip select as a GPIO because that would prevent other users from
> using it.  In theory GSI mode would also avoid some overhead by
> allowing us to sequence the chip select better.  However, I'll argue
> GSI is not relevant for all boards (and certainly not any boards
> supported by mainline today).  Why?
> - Apparently to run a SPI chip in GSI mode you need to initialize it
>    (in the bootloader) with a different firmware and then it will
>    always run in GSI mode.  Since there is no support for GSI mode in
>    the current Linux driver, it must be that existing boards don't have
>    firmware that's doing that.  Note that the kernel device tree
>    describes hardware but also firmware, so it is legitimate to make
>    the assumption that we don't have GSI firmware in a given dts file.
> - Some boards with sc7180 have SPI connected to the Chrome OS EC or
>    security chip (Cr50).  The protocols for talking to cros_ec and cr50
>    are extremely complex.  Both drivers in Linux fully lock the bus
>    across several distinct SPI transfers.  While I am not an expert on
>    GSI mode it feels highly unlikely to me that we'd ever be able to
>    enable GSI mode for these devices.
>
>  From a testing perspective, running "flashrom -p ec -r /tmp/foo.bin"
> in a loop after this patch shows almost no reduction in time, but the
> number of interrupts per command goes from 32357 down to 30611 (about
> a 5% reduction).
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Reviewed-by: Akash Asthana <akashast@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

