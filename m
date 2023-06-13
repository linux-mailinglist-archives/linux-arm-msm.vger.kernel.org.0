Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 158D772EF2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 00:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbjFMW1Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 18:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbjFMW1P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 18:27:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2612A19B5;
        Tue, 13 Jun 2023 15:27:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AEED063B9B;
        Tue, 13 Jun 2023 22:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53801C433C0;
        Tue, 13 Jun 2023 22:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686695233;
        bh=51MoJppV34T/CIXXW72UybEsYB7huHSljYK9dyWqjj0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iwnZ8oM/X/p8elVum9f4NDSVAcR24Ppxyl62PUfKvqR4PJuOlHQkJ0KeMEROQ3JTO
         pdJn+Z9I6nXvdN7r1aek6Sjv4fUZWi+VilAozJE1rsop+wKIQem/U9GhiubFyBTbX/
         X5ze5wsuC3STUBMP7pBwXzgDrrAAovRIDP7gzIHUlM1rzr9kaW6SNWHs9E/D1vVEb8
         aKoqr1iXNI7hPiJcwXjU+Er7bT1FhKIgYAzEIccp3weESY3Ia4PFu7et0sguG7dw7P
         FWk5ZYTx+/P8sZ5Kbx1ppYvCG0G+cNkqg6v7ALDCEjkAdM1EpIl8F7UYADhth5C/UD
         I8xMVExZhll+Q==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Enable PMI8998 charger on supported devices
Date:   Tue, 13 Jun 2023 15:30:11 -0700
Message-Id: <168669542896.1315701.3149628489535828081.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524-pmi8998-charger-dts-v2-0-2a5c77d2ff0c@linaro.org>
References: <20230524-pmi8998-charger-dts-v2-0-2a5c77d2ff0c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 26 May 2023 22:50:19 +0100, Caleb Connolly wrote:
> These devices have been fairly heavily validated with the driver and are
> known to not explode. Add the pmi8998_charger node to pmi8998 and enable
> the charger for the OnePlus 6(T), PocoPhone F1 and SHIFT6mq.
> 
> The charger depends on the RRADC for the input voltage and current. The
> RRADC was originally disabled by default, but there isn't really a need
> for this as it's used by all devices. Let's take the opportunity to
> enable it by default.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: pmi8998: enable rradc by default
      commit: 4e6b053768020f2117caf27b5e062d1e0a06de0c
[2/5] arm64: dts: qcom: pmi8998: add charger node
      commit: 7711c35fd67c762d65fa802d06411e7bdbd3f748
[3/5] arm64: dts: qcom: sdm845-oneplus: enable pmi8998 charger
      commit: 23cf50b13e0686cd9929f54f89580d7b22cbeb71
[4/5] arm64: dts: qcom: sdm845-shift-axolotl: enable pmi8998 charger
      commit: e5d83d4d5cb9e00befb497fe8a64001ac1cce157
[5/5] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable pmi8998 charger
      commit: e58cf964157bb2f875155a2dcf68f3a8db0da2e3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
