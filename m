Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61B9A7788F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 10:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbjHKIah (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 04:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234404AbjHKIag (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 04:30:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658302728;
        Fri, 11 Aug 2023 01:30:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 05B8564CD0;
        Fri, 11 Aug 2023 08:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF59C433C8;
        Fri, 11 Aug 2023 08:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691742635;
        bh=BxoR3h1Xm/5aIfnrQFcfnCoMc2XIZ9dRKlQfHzrEN2w=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=gR2jgZkaKgtH8KNlmqdxvF8Dmz3IlPWFQD3Bn408nRpsn0tqepiDrjQ3KjEcH2E6D
         toazjPwgcBCmF+AN3ywl1Bkc8ZZp7IRY3aVh8SxZ173aItOClAyI/uzow6xIpEZZWk
         9/K2PB2ST9yfBvHv+o/qdH+ZPqgGphOp84TcZw9hZdYR4SRhItYLIyMkj/YAfRTdFV
         EQ9gFxHip6X7U3JAwnxdM9xDCXYlk0HTJpUz13GtPsPuCZBDGdLdXda8ijGrx4ldwg
         EEkfJQsWz+EKiCSaPW149rrQ+8zo4a/EgegDjgtkKDBZowXdfpUgmwKV2/Pr0+lY8d
         0BeC3gM+7MawQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20230731111009.3998089-1-dmitry.baryshkov@linaro.org>
References: <20230731111009.3998089-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] phy: qcom: qmp-ufs: add missing offsets to sm8150
 configuration
Message-Id: <169174263330.106197.17152520204220185726.b4-ty@kernel.org>
Date:   Fri, 11 Aug 2023 09:30:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 31 Jul 2023 14:10:09 +0300, Dmitry Baryshkov wrote:
> The conversion commit 7559e7572c03 ("phy: Explicitly include correct DT
> includes") misses offsets configuration for sm8150 (most likely it was
> developed separately from the series adding HS G4 support and was not
> adapted for the sm8150/sm8250 configuration split).
> 
> Add missing offsets to sm8150_ufsphy_cfg.
> 
> [...]

Applied, thanks!

[1/1] phy: qcom: qmp-ufs: add missing offsets to sm8150 configuration
      commit: b102ce6d847a715732174cfe7119a350f69f3511

Best regards,
-- 
~Vinod


