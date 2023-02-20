Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D11F69D0AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Feb 2023 16:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbjBTPcT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Feb 2023 10:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjBTPcS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Feb 2023 10:32:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73FC7166DA;
        Mon, 20 Feb 2023 07:32:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E321A60EB7;
        Mon, 20 Feb 2023 15:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5E7C4339B;
        Mon, 20 Feb 2023 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676907135;
        bh=D28+gFbA5h/dfr/CYXilVnfRZE4cuHKNU1jTZwnAf7M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aCA+xGuAQFoOdUwiAdCOy4tTJg2YB8Zj0AHlF68bHUvDDe1NGNm6jFvp8krBmiRex
         dzqLeIaszZy1kl8uVyWLrnFzZN1GyiBt+HkxifOq0D/MOHw55j5U3IhN9PlOw9WgJr
         aib5NQKetvuCZ9xiwfBFBld2b9Iuh+N3x54qYACvjkh9CpPMJLZM35pQubQxTi/2Lw
         /f0xSIGgq0a1KW5BdBBMQ1Cr5dnYFAsWkH11M/L1gK5ob2bz64dJnCoUslJa3q3R3P
         g96L2vLT52hGtgnyLaJUw4RN7HQFrHVUlpjZA6ZRRpeGEbp9fLRz4iOq62mHw0oRIW
         LIOn8wNZWt+9Q==
Date:   Mon, 20 Feb 2023 07:35:44 -0800
From:   Bjorn Andersson <andersson@kernel.org>
To:     Kathiravan T <quic_kathirav@quicinc.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Robert Marko <robimarko@gmail.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Sricharan R <quic_srichara@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: Re: [GIT PULL] Qualcomm clock driver updates for v6.3
Message-ID: <20230220153544.cda5uqnjnir6jrdx@ripper>
References: <20230219045318.564342-1-andersson@kernel.org>
 <6d5eb527-7e1c-29bb-e13c-e48c989bf8cd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d5eb527-7e1c-29bb-e13c-e48c989bf8cd@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 20, 2023 at 05:17:39PM +0530, Kathiravan T wrote:
> On 2/19/2023 10:23 AM, Bjorn Andersson wrote:
> > The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> > 
> >    Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> > 
> > are available in the Git repository at:
> > 
> >    https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-6.3
> > 
> > for you to fetch changes up to 7935b534d32a1823a7d5db449d340f56c201f284:
> > 
> >    dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml (2023-02-08 19:29:25 -0800)
> > 
> > ----------------------------------------------------------------
> > Qualcomm clock driver updates for v6.3
> > 
> > Support for requesting the next power_off operation for a genpd to be
> > synchronous is introduced, and implemented in the GDSC driver. To allow
> > the GPU driver to request power_off to wait for the GDSC to actually
> > collapse.
> > 
> > clk_disable_unused() is altered, to not consider clocks which comes from
> > a provider with sync_state defined. This makes it possible for
> > individual clock drivers to invoke this process once all clients has
> > been probed, avoiding the need for booting many systems with
> > clk_ignore_unused.
> > This is then enabled for SDM845 and SC8280XP clock controllers.
> > 
> > Support for QDU1000/QRU1000 Global clock controller, SA8775P Global
> > clock controller, SM8550 TCSR and display clock controller, SM6350 clock
> > controller, nd MSM8996 CBF and APCS clock controllers is introduced..
> > 
> > Parent references are updated across a large number of clock drivers, to
> > align with the design changes since those drivers where introduced.
> > Similarly, test clocks has been dropped from a range of drivers.
> > 
> > A range of fixes for the MSM8996 CPU clock controller is introduced.
> > 
> > MSM8974 GCC is transitioned off the externally defined sleep_clk.
> > 
> > GDSC in the global clock controller for QCS404 is added, and various
> > parent definitions are cleaned up.
> > 
> > The SDCC core clocks on SM6115 are moved for floor_ops.
> > 
> > Programming of clk_dis_wait for GPU CX GDSC on SC7180 and SDM845 are
> > moved to use the recently introduced properties in the GDSC struct.
> > 
> > The RPMh clock driver gains SM8550 and SA8775P clocks, and the IPA clock
> > is added on a variety of platforms.
> > 
> > The SMD RPM driver receives a big cleanup, in particular a move away
> > from duplicating declaration of identical clocks between multiple
> > platforms.
> > A few missing clocks across msm8998, msm8992, msm8916, qcs404 are added
> > as well.
> > 
> > Using devm_pm_runtime_enable() to clean up some duplication is done
> > across SM8250 display and video clock controllers, SM8450 display clock
> > controller and SC7280 LPASS clock controller.
> > 
> > Devicetree binding changes for above mentioned additions and changes are
> > introduced.
> > 
> > Lastly, a change to pad a few registers in the SM8250 DTS to 8 digits
> > was picked up in the wrong tree and kept here, to avoid rebasing.
> > 
> > ----------------------------------------------------------------
> 
> <snip>
> 
> Bjorn,
> 

Hi Kathiravan,

> 
> I don't see the change got picked up v6.3 https://lore.kernel.org/linux-arm-msm/20230120082631.22053-1-quic_kathirav@quicinc.com/.
> Please help to understand what is missing to get it picked up?
> 

Afaict, this patch introduces support that doesn't have a user today,
and as such should be merged together with:
https://lore.kernel.org/linux-arm-msm/20230217083308.12017-4-quic_kathirav@quicinc.com/

Which hasn't yet been picked up...

But please send such patches together in the future, to make it easier
for people to review and me to merge them.


I will resume picking up patches for v6.4 after the merge window.

Regards,
Bjorn
