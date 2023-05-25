Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 611AD71044F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 06:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238882AbjEYEvq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 00:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238532AbjEYEvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 00:51:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E661A6;
        Wed, 24 May 2023 21:51:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 50E4D64210;
        Thu, 25 May 2023 04:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EE7C4339E;
        Thu, 25 May 2023 04:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684990267;
        bh=rTxClRKigzmO8F9+NM4wwN+fKG+QVVqfOpULoh4tYAo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dabqI/I4uzTJ05yafTZ1RzUZfsYmU6EfKexcK6qQkpTxaQHh7dUhSaUxRWcMSwe0R
         0gHedUc/Mp+559RQMGAF/Mi8X0dq1cdpc+m7LC71UFEnac67ELYSQ9qkAUfuk5PrET
         n9otUOdKis+lzkFgfGuwlu2aqAow9Ir/ktLIMpdBV1bbKsLL602aeo+vwYgeMXYXQ2
         Ih3lXT7BWUJ5aAxOxNIEn/rKIeTOCYiIbtE3rRMUr5f6+gA8uPB8SRNeqktrv3ygkg
         oNQKCbS5XGX7syLfUfrZUPilI0KeM5VDWGbOwtHP9Mo4Dr1wNd1ZyaGm4NVaptj53I
         b9LXDRis29gsg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: pm8998: don't use GIC_SPI for SPMI interrupts
Date:   Wed, 24 May 2023 21:53:47 -0700
Message-Id: <168499048183.3998961.1631397400826262701.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230409182145.122895-1-dmitry.baryshkov@linaro.org>
References: <20230409182145.122895-1-dmitry.baryshkov@linaro.org>
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

On Sun, 9 Apr 2023 21:21:45 +0300, Dmitry Baryshkov wrote:
> Unlike typical GIC interrupts, first cell for SPMI interrupts is the
> USID rather than GIC_SPI/GIC_PPI/GIC_LPI qualifier. Fix the resin
> interrupt to use USID value 0x0 rather than GIC_SPI define.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: pm8998: don't use GIC_SPI for SPMI interrupts
      commit: d9ef7a805a709a0b07341857d97a25598a7f92da

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
