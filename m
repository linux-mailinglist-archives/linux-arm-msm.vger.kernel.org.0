Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F32E475316C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jul 2023 07:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234317AbjGNFp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jul 2023 01:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjGNFpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jul 2023 01:45:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15892735;
        Thu, 13 Jul 2023 22:45:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4417761C15;
        Fri, 14 Jul 2023 05:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77E9C433CA;
        Fri, 14 Jul 2023 05:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689313523;
        bh=lWeTR4OTP/LHNQX3nR3ef7mhD9JpuGc3IjezNw8hmyQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AmX+vmdxxZVR0szLpu/70wAxNovxTxoelEgKxUpfJNpz2R/W2hFnzb10OptCAOPmq
         ErX86WuLLHc0oTgIUioLd99BySfZAYfcTMDSTD3dnRcNLIzbCpeRTpAuQHxiSEjQkV
         gkvneArcKbZy0Nw74WB6uNRS4SwOUB3/hnKIE8UgkB8YByyO6tabVz/wxm16ZyfORm
         rxbqszTiMZVYIQyf0Ou6lIAZ5oBQAJtNrntMseQUPBf4rLX7LmqFVD40Wo20avL54W
         fPx94ZYTLBRPqdebMwBr66b0wxYyOTsBBOOqO3f349oVzSkr4oU8IWAKI7zx5HkZvs
         zmrFmnPfDoHiA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: some sdm850/c630 bits
Date:   Thu, 13 Jul 2023 22:48:51 -0700
Message-ID: <168931373094.1571673.7339769841349619122.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627-c630-uart-and-1p2-reg-v2-0-496b581935c1@linaro.org>
References: <20230627-c630-uart-and-1p2-reg-v2-0-496b581935c1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 29 Jun 2023 22:00:52 +0100, Caleb Connolly wrote:
> A few DT fixes for the SDM850 laptops
> 
> * Add the missing eDP bridge 1p2 regulator on the c630
> * Fix bluetooth UART aliases
> * Enable debug UART on the c630
> 

Applied, thanks!

[1/3] arm64: dts: qcom: c630: add panel bridge 1p2 regulator
      commit: 2bc06b7604d214807918dea810b56e0840aa7ba3
[2/3] arm64: dts: qcom: c630: add debug uart
      commit: 443042bec49e896705bbfd1969729c9bd69e194f
[3/3] arm64: dts: qcom: sdm850-*: fix uart6 aliases
      commit: 2c2f83d9c32ea6e58ad30d88f1edfa67165f151b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
