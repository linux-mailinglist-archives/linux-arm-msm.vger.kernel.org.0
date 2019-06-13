Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 079E84384F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732461AbfFMPFM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:05:12 -0400
Received: from ns.iliad.fr ([212.27.33.1]:58456 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732540AbfFMPFL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 11:05:11 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id EC80020C0F;
        Thu, 13 Jun 2019 17:05:08 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id D67B020BC5;
        Thu, 13 Jun 2019 17:05:08 +0200 (CEST)
Subject: Re: [PATCH v1] clk: qcom: msm8916: Don't build support by default
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
References: <49b95f19-4da6-4491-6ed7-5238ecfc35a8@free.fr>
 <20190612191347.GE22737@tuxbook-pro>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <ca7c9fbd-d611-6ab6-6d23-54dfc4c2f165@free.fr>
Date:   Thu, 13 Jun 2019 17:05:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190612191347.GE22737@tuxbook-pro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jun 13 17:05:08 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/06/2019 21:13, Bjorn Andersson wrote:

> On Wed 12 Jun 08:52 PDT 2019, Marc Gonzalez wrote:
> 
>> Build QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 by default only when
>> we're building MSM_GCC_8916.
>>
>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> 
> Not sure why these are default at all.
> 
> But both drivers are used on platforms other than 8916 as well, so if
> anything a fix would be to rename the APCS_MSM8916 to something more
> generic (such as QCOM_CLK_APCS_GLOBAL) - but then the content should be
> updated and the APCS mailbox driver as well...

Used on platforms other than 8916?  do you see that?

$ git grep compatible drivers/clk/qcom/a53-pll.c
	{ .compatible = "qcom,msm8916-a53pll" },

$ git grep qcom,msm8916-a53pll arch/arm64/boot/dts
arch/arm64/boot/dts/qcom/msm8916.dtsi:                  compatible = "qcom,msm8916-a53pll";


drivers/clk/qcom/apcs-msm8916.c doesn't seem to support DT...

$ git grep qcom-apcs-msm8916-clk
drivers/clk/qcom/apcs-msm8916.c:                .name = "qcom-apcs-msm8916-clk",
drivers/mailbox/qcom-apcs-ipc-mailbox.c:                                                          "qcom-apcs-msm8916-clk",

	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
		apcs->clk = platform_device_register_data(&pdev->dev, "qcom-apcs-msm8916-clk", -1, NULL, 0);


$ git grep qcom,msm8916-apcs-kpss-global
Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt:                "qcom,msm8916-apcs-kpss-global",
Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt:            compatible = "qcom,msm8916-apcs-kpss-global";
arch/arm64/boot/dts/qcom/msm8916.dtsi:                  compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
drivers/mailbox/qcom-apcs-ipc-mailbox.c:        if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
drivers/mailbox/qcom-apcs-ipc-mailbox.c:        { .compatible = "qcom,msm8916-apcs-kpss-global", .data = (void *)8 },


Are you sure about other platforms?

Regards.
