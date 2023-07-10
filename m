Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 293D074CB83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 07:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbjGJFEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 01:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbjGJFEU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 01:04:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4472CE;
        Sun,  9 Jul 2023 22:04:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 78BC660DE4;
        Mon, 10 Jul 2023 05:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D8FC433C9;
        Mon, 10 Jul 2023 05:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688965458;
        bh=ufYOuBUYuzI9w4Clsnbl5zs2aDpZHLV6tSGr0q2Xw70=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WZhTbOZ7uI0i+/ebRgsX7ELPg9f6jXAEpKJdUJeo0HAsv1hsXL1FSg5rNu0DT+12/
         wwT+fY5uTSKBmp43vuzDjrwso0IhdoROYlx4g4AW1BDTVm2MNPamOpmpxUyw2ToAxB
         PTGudaVJukRVtUSzsm9Q6ReBvBSDgZeRijKLHOfIiZ1unAANf7KNUOLzZSLmYAHfAZ
         +XPzUS8QAP3DStf4A+SqKIzt7QcTvDMQbdU6QTP+ZZgDf1Ot7uLi6yB6RZS75E7q3l
         xmz1W27ONT4ADGerUqfqgdLfqGTrPsK+HaChUJbdDU6yb/MvHOwqRyJEMPKYxm6i4J
         IDv5tF/8f352A==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: rename HDMI labels in a correct way
Date:   Sun,  9 Jul 2023 22:07:02 -0700
Message-ID: <168896565952.1376307.7552845471652960129.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230615083422.350297-1-dmitry.baryshkov@linaro.org>
References: <20230615083422.350297-1-dmitry.baryshkov@linaro.org>
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


On Thu, 15 Jun 2023 11:34:20 +0300, Dmitry Baryshkov wrote:
> In [1] Konrad noticed that the commit f43b6dc7d56e ("arm64: dts: qcom:
> msm8996: rename labels for HDMI nodes") is a mess, it changes all HDMI
> entries, which is plain incorrect. Rather than landing a fix, revert the
> offending commit and land a clean version.
> 
> [1] https://lore.kernel.org/linux-arm-msm/ZIrJ86IsLOm_Scbc@gerhold.net/
> 
> [...]

Applied, thanks!

[1/2] Revert "arm64: dts: qcom: msm8996: rename labels for HDMI nodes"
      commit: 2b812caf5f64df959555e48dfc7bf8f061d9fe8f
[2/2] arm64: dts: qcom: msm8996: rename labels for HDMI nodes
      commit: 1770394e68942f48d9b111694fccfef337905632

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
