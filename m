Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFDD672D33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 00:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjARX4d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 18:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbjARX4Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 18:56:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF0A474E3;
        Wed, 18 Jan 2023 15:56:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9DE4FB81E12;
        Wed, 18 Jan 2023 23:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37DEC43392;
        Wed, 18 Jan 2023 23:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674086160;
        bh=av5a60cd35yCZdEI7pA/z4YSR1zn18F8Hdbx0/dxol8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WZsZ4iHxkr4jraFHFcOEp/qwfCWwThSIzUQkKVPs21ClhTovwLN+XQVRKaDDLG/FI
         JZLO1bZU1ylF9gRoQzOI82r0or5rub+I0mtM1rCLh0VPMh2FFVHcprGAKIig5bz92a
         /zIsfKrHfdtc0Wt6qlYt9L1jFTI3rI1CotJCmC+MWCXRzd1uyY5+htsXZnYd/8eCJL
         RFQiib1Mqb9LVv7ht+BJduczG29sOqtuWWHLg1LG8Yh1vK91/MGmgwZ7AuB47vUke1
         gF8a5Hxb7Z+rv4GoV4UgjgXq0S1TcgWWSVl0SS0xM6b37KVW228eD/Aooqqees0/LQ
         l02/P1NaF/xmg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     stephan@gerhold.net
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 0/4] soc: qcom: socinfo: Add a bunch of older SoCs
Date:   Wed, 18 Jan 2023 17:55:44 -0600
Message-Id: <167408614061.2989059.3900500212019182555.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230104115348.25046-1-stephan@gerhold.net>
References: <20230104115348.25046-1-stephan@gerhold.net>
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

On Wed, 4 Jan 2023 12:53:44 +0100, Stephan Gerhold wrote:
> Sync the SoC IDs in qcom,ids.h with relevant entries from Qualcomm's LK
> bootloader that is used for almost all older Qualcomm SoCs. This is
> meant to reduce the effort for future SoC bring-up (to avoid having to
> send a separate patch series for each new SoC) and will also benefit
> other projects using the same dt-bindings, e.g. bootloaders where
> adding support for all these SoCs is a bit easier than on Linux.
> 
> [...]

Applied, thanks!

[1/4] soc: qcom: socinfo: Fix soc_id order
      commit: 017a7c11a8a29e266aa40c6d1bf2ba83f880f719
[2/4] dt-bindings: arm: qcom,ids: Add QRD board ID
      commit: 8b949c0e2ce59c376818bc3f80db4b94b06981b7
[3/4] dt-bindings: arm: qcom,ids: Add a bunch of older SoCs
      commit: 56abffc793befb19f30ec9d4bec24343529377f1
[4/4] soc: qcom: socinfo: Add a bunch of older SoCs
      commit: 40017cebb111eed65bddfa993df7b0636be98de8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
