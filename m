Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2785A57D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 01:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbiH2Xqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Aug 2022 19:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiH2Xqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Aug 2022 19:46:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB4998A66;
        Mon, 29 Aug 2022 16:46:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3A85EB815D5;
        Mon, 29 Aug 2022 23:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C93FC43146;
        Mon, 29 Aug 2022 23:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661816783;
        bh=BcISCDdMWOEJ+xzkFdwcDlRGMcDYB/o5RAI/t3OmKcY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bwQl48SSoyQuulN2Gy7WU4X004ZR/96+PACXaHzZL5CVvZZm0C3oKQVpLcCIzgjm7
         hEQKyPM5BBo7sXHJCEpqupq3jSb94Rm81jlZ5qNdfDHdOATA2z/FSBctMoraXvQSfq
         GHT+jT6Gjmd+49901Q+wHfeVCqVwHs3+l0MrnZlMz/F+QgPgcjzvboq2hhGFxfpzfX
         KYjsgs5goqDjDDH29aifS39I7S84TuJk50qziUk4IiPsZvgDfGh8MQ89N//rCHrd6a
         LLCjfDTDCFRWNfcQrstcDc/REqmoUFWUgZf1bASSmQ0tCCOgLe5calEsKvN+QDs1Pt
         tfAdp+mKXtrtQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
        agross@kernel.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: move DSI opp table to the dsi0 node
Date:   Mon, 29 Aug 2022 18:45:45 -0500
Message-Id: <166181675991.322065.10538388207761075162.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
References: <20220822191138.316912-1-dmitry.baryshkov@linaro.org>
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

On Mon, 22 Aug 2022 22:11:38 +0300, Dmitry Baryshkov wrote:
> It makes no sense to have the OPP table for the DSI controllers in the
> DSI1 PHY node. Move it to more logical dsi0 device node.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250: move DSI opp table to the dsi0 node
      commit: 9ea5ae629914c265c0ebb008865f93bd3480e09a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
