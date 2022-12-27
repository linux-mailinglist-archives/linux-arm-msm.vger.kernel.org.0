Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C462656DCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 19:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiL0SEK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 13:04:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiL0SEI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 13:04:08 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC68B1162;
        Tue, 27 Dec 2022 10:04:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8F822B81135;
        Tue, 27 Dec 2022 18:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A911CC43396;
        Tue, 27 Dec 2022 18:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672164245;
        bh=Ypk41tuA86U16Uqle9L4yd+svVMPORMQpSCqzXlvYFA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QKnD170yGp06aLPWj9G0iIPpffeTM+ZKmKrEXruQ0/Zfeh5mbF1mOcTzo7i9OBqAC
         5GRG+If7Ai6JCRhpkZSGJbQjQXWrwM8tarF71V//y+kdKTzv2xvQOf57No7Y0LEdsT
         Ai1jkOYn75utV+ETW1pivpiSeUUWGNp239F5h3N+IB9RSdEcmVuf943zklstnbHctG
         sJXZJt4JSl+O5ZxoMpQjXsL9Nrl1mQ2z6W0LcAQdtcnCHIY3w7JgmMVSe/FBkb235W
         2QLkUw9qsbef2g0XQErhoR4iTj3vEGky/vpxrwxahAAnOpia87fod4O+CKUaXPMX8+
         VLOryfGpdEGcQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        konrad.dybcio@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs404: use symbol names for PCIe resets
Date:   Tue, 27 Dec 2022 12:04:00 -0600
Message-Id: <167216423712.744668.16120771596363450137.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221215154824.84198-1-dmitry.baryshkov@linaro.org>
References: <20221215154824.84198-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 15 Dec 2022 17:48:24 +0200, Dmitry Baryshkov wrote:
> The commit e5bbbff5b7d7 ("clk: gcc-qcs404: Add PCIe resets") added names
> for PCIe resets, but it did not change the existing qcs404.dtsi to use
> these names. Do it now and use symbol names to make it easier to check
> and modify the dtsi in future.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: qcs404: use symbol names for PCIe resets
      commit: 41a37d157a613444c97e8f71a5fb2a21116b70d7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
