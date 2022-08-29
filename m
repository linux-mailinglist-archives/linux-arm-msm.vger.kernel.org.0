Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 639CF5A57D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 01:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbiH2Xqg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Aug 2022 19:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiH2Xqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Aug 2022 19:46:30 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125E699275;
        Mon, 29 Aug 2022 16:46:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id ED7D6CE16CF;
        Mon, 29 Aug 2022 23:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7EDC433C1;
        Mon, 29 Aug 2022 23:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661816781;
        bh=4ZaELrMBK58SC+pH3H3x8zk8Iwfn8L+wtlnGDw4Gjno=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MZqE6cquW4uQq+qS454R+AeE3B19tLdPpufishZOsvJdhYE8YkaGt3+pB6KyiAuLJ
         WJnegcsdpI58jZOcmydpLlufdP+rQaKJ+bdkLN7qxlFbw2S/bpfPjUYfWSU2TcIsz/
         HOXxcw4/+5gpLAi7Gs/qd99hqUeVGKpBU6BhrU/jcHmzJKTSbSUZ2Dp5TVEzuAISLc
         V6BcLN9dHLhg+uhhPxWxTY9h3ibGIYmanR4Bo6Vi+WceDD3lctxEKxfSdDce6ToP45
         7Uzaple5hvv0KHEVeRFK6zlCV73PKh4ZbcYFlNWPQE6MLzTSClm/VRSSiBmWdxWuvn
         IQD+y4rVhpSHA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, konrad.dybcio@somainline.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org
Subject: Re: (subset) [PATCH v4 0/2] arm64: dts: qcom: pwm: Drop PWM reg dependency
Date:   Mon, 29 Aug 2022 18:45:43 -0500
Message-Id: <166181675987.322065.8296651935482445190.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220828132648.3624126-1-bryan.odonoghue@linaro.org>
References: <20220828132648.3624126-1-bryan.odonoghue@linaro.org>
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

On Sun, 28 Aug 2022 14:26:46 +0100, Bryan O'Donoghue wrote:
> V4:
> - Churn patch#1 prefix to "dt-bindings: mfd: qcom,spmi-pmic:" - Krzysztof
> - Add's Krzysztof's RB as indicated
> 
> V3:
> - Splits dtsi and yaml
> - Uses Krzysztof's suggested commit log in the yaml
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: pm8350c: Drop PWM reg declaration
      commit: eeca7d46217ccfe9289530e959c0fb29190af0d6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
