Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F88E66E6A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jan 2023 20:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbjAQTNC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 14:13:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbjAQTKa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 14:10:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00A85C0D2;
        Tue, 17 Jan 2023 10:24:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 79675614FF;
        Tue, 17 Jan 2023 18:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B42C433D2;
        Tue, 17 Jan 2023 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673979874;
        bh=WDhbwJrnsjSVFDK5hazs5EdjTyNhhPx07U8zTXvvfPY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uOUNoo5/F6NnqVPdFkGajoQ2t+cN1Msirka/YdgRUcKsYfuNYLTUsUzSN/7LaFoCt
         jbNlUTsQ1E+bI/JVLtrnJN55ty/Q2PNXOag5+wbLtJ/p+58FFtvNVKyOWL0Bn34eFz
         +vTo98Gt113vCao9wNhBuwh1aEcShDjYySW50cVg9s+cg4TR3IJSsQYa7KkRAszVYQ
         W4kgO/qYqCyJh1EAdxm7m7KoZLyndgSZnSbvfeRxacOEB5b++Mj7VO3ioxFrD2OV/s
         nTkEmKWkI/+XIHbhqsWP8QC5926KLg7Jzyb5kypa0+Kd7mDS0Y4o8PXOknIrLwDS1l
         fqyFl2fVdnHHQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@linaro.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom: msm8974: add xo clock to rpm clock controller
Date:   Tue, 17 Jan 2023 12:24:20 -0600
Message-Id: <167397986255.2832389.9290602827452441726.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221227001547.2830656-1-dmitry.baryshkov@linaro.org>
References: <20221227001547.2830656-1-dmitry.baryshkov@linaro.org>
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

On Tue, 27 Dec 2022 02:15:47 +0200, Dmitry Baryshkov wrote:
> Populate the rpm clock controller node with clocks and clock-names
> properties.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: msm8974: add xo clock to rpm clock controller
      commit: 7d8ccfaca31e69e60a3abd696abbfcbc00005ee1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
