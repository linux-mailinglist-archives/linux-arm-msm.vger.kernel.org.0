Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17D4658632
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 20:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbiL1TEg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 14:04:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiL1TEf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 14:04:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C5A1409A;
        Wed, 28 Dec 2022 11:04:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C3E18B818B5;
        Wed, 28 Dec 2022 19:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD2BC43392;
        Wed, 28 Dec 2022 19:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672254272;
        bh=0VZiqtCF4pkoCkzBKBjQ/4h6ytwFlXoYWQvyYjatyoo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WeEFo6POZC/Zs4FLso5eYLIY+OJiIh/qvZoszqDbzjLCa8got/rHymbhH8sptW46q
         eB7ZGzuUwnlONIpv+3soRptuEYzC0km+44cFJhiBwH5MnW1tKpZLnXDmhdUrauxNKD
         sdE8tL+6c2eHXhMJrnZNafhPBMHmoaO1I452CJUiU9QEuZme2qwZ0C9zCeYMBD2iNe
         /WGIYt6oe9la2cBUKUr8j9kBvHSWC+7i9UL+dVK5hBMsmsbadoZvbwWolZVN71Yh4t
         U8FVQVvazukSpO4ZBMUlchoxocaaRUyaRKqnwOhO9+I/gUQL7BTZQyB02w00jMHMvv
         qD9JfrxtPoL3g==
From:   Bjorn Andersson <andersson@kernel.org>
To:     mturquette@baylibre.com, dmitry.baryshkov@linaro.org,
        agross@kernel.org, konrad.dybcio@linaro.org, sboyd@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        quic_tdas@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/11] clk: qcom: update MSM8974 clock controller drivers
Date:   Wed, 28 Dec 2022 13:04:27 -0600
Message-Id: <167225426551.971585.1377589763090802186.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
References: <20221204124508.1415713-1-dmitry.baryshkov@linaro.org>
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

On Sun, 4 Dec 2022 14:44:57 +0200, Dmitry Baryshkov wrote:
> Modernize drivers for global and multimedia clock controllers on the
> MSM8974 platform. Switch them to using parent_hws/parent_data, use
> clocks through the DT links rather than fetching them from the system
> clocks list, update schema and platform DT files.
> 
> Changes since v3:
> - Rebased on top of for-next
> - Changed gcc-msm8974 description and title to follow Krzysztof's
>   changes
> - Fixed commit messages to describe the reasons for xo -> xo_board
>   change
> 
> [...]

Applied, thanks!

[09/11] ARM: dts: qcom: msm8974: add second DSI host and PHY
        commit: 60446dc63f5d0be7a5e691caa239417ead885cf0
[10/11] ARM: dts: qcom: msm8974: add clocks and clock-names to gcc device
        commit: cd1dc49ad4cc773d96092dd871703b165dca2a87
[11/11] ARM: dts: qcom: msm8974: add clocks and clock-names to mmcc device
        commit: c8d4a609162e0cf179a99e283a8a621e4c140bec

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
