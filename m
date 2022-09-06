Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E89005AF123
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 18:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbiIFQwX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 12:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238558AbiIFQwC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 12:52:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2ED01C91B;
        Tue,  6 Sep 2022 09:38:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D243F615C1;
        Tue,  6 Sep 2022 16:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85117C433D7;
        Tue,  6 Sep 2022 16:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662482315;
        bh=KrXzfsi+jQqLM6mCgxSnKLh0qcdy50n5+7pxMIhqQsc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Iu3+ZPckEWA9vipBAzjNuPXpj5laJpTN2X67Z/Y7kbKLTZpHTho+DLDjFg+Rt4b6L
         1d3zYdg5rFtK33meTL1MIn+PWZVXyxpLi+PulZ7rwquRDjEMULiF7uoaOPygROkFKd
         xRp8WPbtz62mudwVxkalrsAgmGg2aa1AlNfjKVD/cIa1J0+6EjsaJHexN7iVfJdRCy
         E2onBjBKIYx5ibkYUAknIirx5Qrk1jaC+vdtNk6pApRtRNW7GckVQrugCjVG8Yhrha
         p+gB4NlGb4++5k21Lv69JWFA0Ank43fnDS7ogY8pOye1GTgF3AFLGbSs+iOURJsuI1
         9z1J2SyDkLdRg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>, jahau@rocketmail.com,
        Bjorn Andersson <andersson@kernel.org>
Cc:     devicetree@vger.kernel.org, stephan@gerhold.net,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linus.walleij@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-serranove: Add magnetometer
Date:   Tue,  6 Sep 2022 11:38:27 -0500
Message-Id: <166248229992.53237.15506886459039449910.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220904214935.31032-1-jahau@rocketmail.com>
References: <20220904214935.31032-1-jahau.ref@rocketmail.com> <20220904214935.31032-1-jahau@rocketmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 4 Sep 2022 23:49:35 +0200, Jakob Hauser wrote:
> Add magnetometer Yamaha YAS537 to the DeviceTree of samsung-serranove.
> 
> The YAS537 variant was recently added to the Yamaha YAS magnetometers
> driver [1].
> 
> In the DeviceTree of samsung-serranove for the Android kernel, there is
> unfortunately no information on interrupts or pinctrl [2].
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916-samsung-serranove: Add magnetometer
      commit: 3ae82f22ed7a746a8a9e89ea840401c46deddbb3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
