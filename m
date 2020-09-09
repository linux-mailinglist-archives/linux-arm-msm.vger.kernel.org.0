Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0673B2633B1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 19:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730721AbgIIRIj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 13:08:39 -0400
Received: from a27-56.smtp-out.us-west-2.amazonses.com ([54.240.27.56]:45228
        "EHLO a27-56.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730379AbgIIPgt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 11:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599661222;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=S/7AGadvVgxsZIouyH+XWr5+pvCP3bzpW2mtxfDx8qk=;
        b=aZOUYOkeZpw+9JYvdA+FjaxuyIwgeP8O0cKnAnraHnSPTWZfVSJCPUyHp3CYJP6j
        EcEQKvoENMcpJWXOc8fyLeqGrCNljRwRVHI859qzARJbpLi0m5+O/gKYQkvS1m34luj
        iWtYtrrt0nbjJb0AAElCcjijZz9sKlkRzpG921m0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599661222;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=S/7AGadvVgxsZIouyH+XWr5+pvCP3bzpW2mtxfDx8qk=;
        b=QCoHORN2R0ql7fZ0513y1nm0Tv+1Ib0mlYHXU2r0E3jJ6BIABXYeMXtYz2A0Yb5W
        NSOUbR/5ZtLRALaXWMjXhti/7TqzVbjmCfDl1MhILtSJqe5quT/bRrCviX3RJFsbw4o
        wH7G+lD4dTVTP2thPgv+bGN8hcJlBF2Mp6zUZdSE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 9 Sep 2020 14:20:22 +0000
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V4 1/4] arm64: dts: sc7180: Add wakeup support over UART
 RX
In-Reply-To: <20200903171711.GL3419728@google.com>
References: <1599145498-20707-1-git-send-email-skakit@codeaurora.org>
 <1599145498-20707-2-git-send-email-skakit@codeaurora.org>
 <20200903171711.GL3419728@google.com>
Message-ID: <01010174733d2ad7-69390477-c9ca-4d17-a1c6-9754cc3cfd3a-000000@us-west-2.amazonses.com>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.09-54.240.27.56
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-03 22:47, Matthias Kaehlcke wrote:
> On Thu, Sep 03, 2020 at 08:34:55PM +0530, satya priya wrote:
>> Add the necessary pinctrl and interrupts to make UART wakeup capable.
>> 
>> If QUP function is selected in sleep state, UART RTS/RFR is pulled 
>> high
>> during suspend and BT SoC not able to send wakeup bytes. So, configure
>> GPIO mode in sleep state to keep it low during suspend.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
> 
> One more doubt: does it actually make sense/is it safe to add the
> sleep config for all UARTs in the SoC file?

yes, it is not good to have it this way. We are going to remove all this 
and add sleep config for only uart3 (BT uart) in board specific file.

> I wonder if there could
> be undesired behavior (like noise on TX or RTS looking active to the
> other side) without the corresponding pinconf in the board file. If
> the pinconf is needed to avoid unexpected behavior then it is better
> to change the muxing in the board file to have a sane default
> configuration in the SoC .dtsi.
> 

ok, will add pinmux for uart3 sleep state in board file.

> From a quick grep it seems that most SoCs don't specify a sleep config
> for their UART pins and some boards add it in their DT.
