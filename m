Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9930D09EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 10:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbfJIIbT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 04:31:19 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41696 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJIIbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 04:31:19 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2303861B1F; Wed,  9 Oct 2019 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570609878;
        bh=xNdG/PEd6lxfFGBRpF8UpZJDQ26jHWDZuE+vCRYdQT4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=I31PsMy5PIospB1rUaDVk7BT9k2J6OtsP8iIQ0G76916sX3wILlURMJR1yS2Jl3/s
         lc+YS7n1lq+eLUnRNMm46vxwBfGN7M4a+bBnIAAWKqmeXmD0xp6TF7T5Zi5JLSXOgl
         zU4FtxD/MjEaracw008ap0Xy0kYVcZs2rrq/xb6s=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.24.216] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61DF761B1F;
        Wed,  9 Oct 2019 08:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570609875;
        bh=xNdG/PEd6lxfFGBRpF8UpZJDQ26jHWDZuE+vCRYdQT4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Wjb29zwTjF/9toY6E3SJkx1mO0v8Xc3hW1V8jFmAzARoMkVyzac5rBMJBANzsOa6y
         IU4E3YhCdkR3OxQQye07Q9mXZyZzr52HviYbJWgS8CcvBt1AijUq+hIgHJA7E03khR
         tHenAQcNdtgwQt+1A5ppeQFwGjc+eCtG160ppI/I=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61DF761B1F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH v1] clk: qcom: Skip halt checks on gcc_pcie_0_pipe_clk for
 8998
To:     Stephen Boyd <sboyd@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Amit Nischal <anischal@codeaurora.org>
References: <a7e27415-02d9-bfe9-c0ea-59dc236a7f91@free.fr>
 <c1762201-a1fa-8ed1-24ff-f30916ee45dd@free.fr>
 <155389876377.20095.15037552865160559827@swboyd.mtv.corp.google.com>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <eba920f5-f5a2-53d5-2227-529b5ea99d32@codeaurora.org>
Date:   Wed, 9 Oct 2019 14:01:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <155389876377.20095.15037552865160559827@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Steve,

On 3/30/2019 4:02 AM, Stephen Boyd wrote:
> Quoting Marc Gonzalez (2019-03-28 09:26:59)
>> On 25/03/2019 14:49, Marc Gonzalez wrote:
>>
>>> See similar issue solved by commit 5f2420ed2189
>>> ("clk: qcom: Skip halt checks on gcc_usb3_phy_pipe_clk for 8998")
>>>
>>> Without this patch, PCIe PHY init fails:
>>>
>>> qcom-qmp-phy 1c06000.phy: pipe_clk enable failed err=-16
>>> phy phy-1c06000.phy.0: phy init failed --> -16
>>>
>>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>>> ---
>>>  drivers/clk/qcom/gcc-msm8998.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
>>> index c240fba794c7..033688264c7b 100644
>>> --- a/drivers/clk/qcom/gcc-msm8998.c
>>> +++ b/drivers/clk/qcom/gcc-msm8998.c
>>> @@ -2161,7 +2161,7 @@ static struct clk_branch gcc_pcie_0_mstr_axi_clk = {
>>>  
>>>  static struct clk_branch gcc_pcie_0_pipe_clk = {
>>>       .halt_reg = 0x6b018,
>>> -     .halt_check = BRANCH_HALT,
>>> +     .halt_check = BRANCH_HALT_SKIP,
>>>       .clkr = {
>>>               .enable_reg = 0x6b018,
>>>               .enable_mask = BIT(0),
>> Actually, 5f2420ed2189 is not the only similar instance.
>>
>> $ git log --oneline -G BRANCH_HALT_SKIP drivers/clk/qcom | grep -v controller
>> 924a86bf9793 clk: qcom: Skip halt checks on gcc_pcie_0_pipe_clk for 8998
>> 5f2420ed2189 clk: qcom: Skip halt checks on gcc_usb3_phy_pipe_clk for 8998
>> 2abf856202fd clk: qcom: gcc-msm8998: Disable halt check of UFS clocks
>> 5f75b78d3d67 clk: qcom: gcc-msm8996: Disable halt check on UFS tx clock
>> 12d807cd34b8 clk: qcom: gcc-msm8996: Disable halt check on UFS clocks
>> 096abdc296f1 clk: msm8996-gcc: Mark halt check as no-op for USB/PCIE pipe_clk
>> 7d99ced8f4c6 clk: qcom: Add support for BRANCH_HALT_SKIP flag for branch clocks
>>
> I keep asking Qualcomm engineers everytime this comes up why they can't
> fix their phy initialization sequence.
>
> Too bad they don't care anymore!


I have followed this up with QMP PHY hardware designers and they have
confirmed that QMP PHY must have pipe clock enabled at the beginning
of initialization sequence i.e. before bringing it out of reset and starting it.

Otherwise there is possibility of incorrect locking of pipe_interface/
retime buffers in PHY.
Hence, for both USB and PCIe we have to continue to use HALT_SKIP flag.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

