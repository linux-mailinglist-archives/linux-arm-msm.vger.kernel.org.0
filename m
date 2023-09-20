Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 213CD7A7133
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 05:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232602AbjITDzJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 23:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232565AbjITDzC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 23:55:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B431C6
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 20:54:56 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F26C433CC;
        Wed, 20 Sep 2023 03:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695182096;
        bh=OolkSjx9WL9+PX/F8Hb+9RIQ3flKtK/kzoGxzyBpvi8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B2ZziXpHa2SwXI2W+beWexGP1ZAWRkhMy+nWE8JexDKRO7qdRpHUND6qfnC7ikL6d
         URaRFN/X/MpOrmIgvwWJgIMVxKfgyHwstirudIBAciZP9EMlkCBWYSZ5S7QOL7yHOe
         uUqviHtP8jY2fz0GeGAY4GXxY1vYjC79jjUmtvyMoiQCN8heflzPNelK8QTHut49hU
         dovjtb2JkM3dTCpM0/ZVXrkb9hyS9TXXRKQxOM3VXUyFEtV/E107+rrI6Ut5p6dVP8
         rGJ+jMFQg9PlZnqC56i0SmchLebyJFL2mGk3jxz6soXx0wn9LYlYWF/v8hpiN72jrv
         L75vxhd1Bd4QA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: sdm845-mtp: misc improvements
Date:   Tue, 19 Sep 2023 20:58:47 -0700
Message-ID: <169518233717.1055386.15383300126177175919.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230826221915.846937-1-dmitry.baryshkov@linaro.org>
References: <20230826221915.846937-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sun, 27 Aug 2023 01:19:10 +0300, Dmitry Baryshkov wrote:
> Several misc improvements, take away from testing recent kernel on
> SDM845-MTP board.
> 
> Changes since v1:
>  - Reordered PCIe properties according to Konrad's suggestions
>  - Fixed pcie1 perst to have bias-pull-down instead of bias-disable
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: sdm845-mtp: fix WiFi configuration
      commit: b33868a52f342d9b1f20aa5bffe40cbd69bd0a4b
[2/5] arm64: dts: qcom: sdm845-mtp: specify wifi variant
      commit: 84c7786499880d47fbcf0cee9661fd96e026ab2a
[3/5] arm64: dts: qcom: sdm845-mtp: switch to mbn firmware
      commit: 37857110db63783bac36960aa3bd335d4adea9d7
[4/5] arm64: dts: qcom: sdm845-mtp: enable Vol-/reset button
      commit: be30dc31823d46dca3a184896433ebf8beffa1a0
[5/5] arm64: dts: qcom: sdm845-mtp: enable PCIe support
      commit: da3620d7c7d78a375b21ccf046b6617598b7c824

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
