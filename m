Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 397FA72F08C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 01:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240832AbjFMXrp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 19:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241434AbjFMXrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 19:47:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6022D4A;
        Tue, 13 Jun 2023 16:46:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0F0F463C7F;
        Tue, 13 Jun 2023 23:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BBDC433C0;
        Tue, 13 Jun 2023 23:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686699940;
        bh=XsopPBex4ccSdOc7bdd0Oed/Yv7Ws0bxsD9v0d939j4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Loyc0OSlzRAOUCN3ADFa/5k4voDe3j5jApLXUW3izNDO0XCsnGpcC03KIPJvyAqx9
         KaHgsy8XImpDwgP4hSYa01SY9XsyqoaTbvUIcnCBU6ra8XIYcXcvaxYUY4In3vbGZc
         U5IwrrM+ahL4BcbfEHwT6JQeSKnxut8Xt94JufOCX359kcH7/86XWcNpzBwRtbNelm
         K7K51msRkGJzbAbQvqQOBKKdN0il65PSTyHDnzpmRaOhoODhA43XKz2wYEtUCQ48ji
         KEWGqfQfnfVzp2WG3GL5kjsZvhYWrf9Fu+WuAUVHql2/2OUbOWFV2XESQiIQaCow25
         1LKCP3GW9mkJA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: dts: qcom: apq8074-dragonboard: add LEDs and GPIO keys
Date:   Tue, 13 Jun 2023 16:48:44 -0700
Message-Id: <168670013503.1400697.2234083238538825458.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531012627.3813060-1-dmitry.baryshkov@linaro.org>
References: <20230531012627.3813060-1-dmitry.baryshkov@linaro.org>
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

On Wed, 31 May 2023 04:26:25 +0300, Dmitry Baryshkov wrote:
> Add device nodes for the LEDs and several Volume-up and general GPIO
> keys. The power-on and Volume-down keys are not supported, as they
> require extra pon/resin patches.
> 
> Dmitry Baryshkov (2):
>   ARM: dts: qcom: apq8074-dragonboard: add onboard leds
>   ARM: dts: qcom: apq8074-dragonboard: add gpio keys
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: qcom: apq8074-dragonboard: add onboard leds
      commit: b9a0de7d5719aa54199da2932c1b1fdb948ff753
[2/2] ARM: dts: qcom: apq8074-dragonboard: add gpio keys
      commit: 6198772ec4d9dcd2fea63b4020cef117a786d738

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
