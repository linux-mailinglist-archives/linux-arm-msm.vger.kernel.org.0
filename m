Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF8F7656DD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 19:04:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiL0SEN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 13:04:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiL0SEL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 13:04:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2681162;
        Tue, 27 Dec 2022 10:04:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8F79EB81134;
        Tue, 27 Dec 2022 18:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81420C433F1;
        Tue, 27 Dec 2022 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672164247;
        bh=Sk+eRGqbQxY+FkYS/vPbI7730UoTKfjHoqFEEZ/bhcY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LRF9zjWsiFmhlsp2NvnRSHpuMWFDFW4OIUBf6FUs/2pGw12TW7AeYRINA+L+nO7Rj
         dNmi/u1ZrxgtjLy0zfvYZpH2kRzIsu+mpw3fujrZtOfqx9HCEyJmUMK4KYU7Nq96GM
         nc0zqaSVSywHZFyKhzgO7zrS4AeV7zstvaepnLnbs8EzgjqSMnmdG/GToDoPGgH0rf
         7RgrH8zLU4F4F4b5C2zCFEqIPAw9x/lQuFlQ68KXNSYQQbFgGXpF9GCmcYu4a8aySw
         +spmdIcKEweX7wO+XvnBGooeOX8MRRtvfGShGorjDywKqUbCDxb1SHVkC4hql9zSwj
         tDp7M0eagvhnA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, robh+dt@kernel.org, kishon@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, linux-phy@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/3] phy: qualcomm: pcie2: register as clock provider
Date:   Tue, 27 Dec 2022 12:04:02 -0600
Message-Id: <167216423712.744668.9651166253347600955.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221226031059.2563165-1-dmitry.baryshkov@linaro.org>
References: <20221226031059.2563165-1-dmitry.baryshkov@linaro.org>
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

On Mon, 26 Dec 2022 05:10:56 +0200, Dmitry Baryshkov wrote:
> On Qualcomm QCS404 platform the PCIe2 PHY provides PIPE clock to the gcc
> (Global Clock Controller). Register the PHY as clock provider.
> 
> Changes since v1:
> - Dropped 'phandle to' from supply descriptions in schema (Krzysztof),
> - Reordered clock-related property definitions in schema as suggested by
>   Krzysztof,
> - Dropped extra empty line at the end of the schema (reported by
>   Krzysztof).
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: qcs404: register PCIe PHY as a clock provider
      commit: 977e9262c3542e87b513d4dad4c57b2c85e16c8c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
