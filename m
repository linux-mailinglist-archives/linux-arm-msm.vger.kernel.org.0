Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8CA6021B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 05:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbiJRDGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 23:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbiJRDGe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 23:06:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C108923C0;
        Mon, 17 Oct 2022 20:06:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BD0D36136F;
        Tue, 18 Oct 2022 03:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C7BC43143;
        Tue, 18 Oct 2022 03:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666062392;
        bh=0FrYBIHOcFvABZC2u2pDzjT4FuHOH1mnHAfYHrsIdxs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RogU8QQTgLKzfs2MuOQB/P3Kr4Pf8cucD5HFnJxu8wVzhSszaWsTJZantzy4MJPhA
         mXXlEUvRPyhQPYYRjNki02h3OzppnpQGsnEgnmDS13/KGDMmWTMF1VgMMYbf/0M0f+
         LU/R7vVSKAQ+7SX5JBrKXpamWWTAqBU1/xUhsk4t0CT6v7AnHcBpoUXdM/CzOv6/ME
         5mtL1AIp0LeekVysMjJOBcw8Dt2A3Pr3y/4pq0T5vX9305rOGWQPYVIk7cNokI7CoW
         t+lSboUNCZ4MRpXYRzNfygQE6DuJrTWZzmTmIpkL0V5tDVuW0itIiQa1KqzSGVfUO/
         4tHOQMXi3XuEQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>, quic_tdas@quicinc.com,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        robh+dt@kernel.org, agross@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: split qcom,gcc-sdm660 to the separate file
Date:   Mon, 17 Oct 2022 22:05:13 -0500
Message-Id: <166606235842.3553294.8673493942495529471.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220929091216.471136-1-dmitry.baryshkov@linaro.org>
References: <20220929091216.471136-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 29 Sep 2022 12:12:16 +0300, Dmitry Baryshkov wrote:
> Move schema for the GCC on SDM630/SDM636/SDM660 to a separate file to be
> able to define device-specific clock properties.
> 
> 

Applied, thanks!

[1/1] dt-bindings: clock: split qcom,gcc-sdm660 to the separate file
      commit: 7da54ced3a79ffaa687d99a4b7bfb7591202de9a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
