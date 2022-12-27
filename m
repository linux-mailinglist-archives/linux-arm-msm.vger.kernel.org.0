Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45177656DCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 19:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbiL0SEL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 13:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiL0SEJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 13:04:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3AF92706;
        Tue, 27 Dec 2022 10:04:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 92196B8113A;
        Tue, 27 Dec 2022 18:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79196C433F0;
        Tue, 27 Dec 2022 18:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672164246;
        bh=6WyKMNXhf2SQbsWTG/h7dwiMw1LXD9aP/E86/YvSFQ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZYabOlnVDelbt39gVfFIQZgcVNpq06SPPY/N5LHf6cpP2NqKx98DRAO1hjpgYv37P
         9Nq2HO/yB4vBcgWH/tJoZGi6zT2iAODgv1/0/ITHPJhl50eCBXhab7yPqzNiUkva5j
         GNRFw/stsg8nSY+OYz8h82Ord9P8IgoV+VvOec1wNgD5w0zX1e+kiyVCE6S6qMLAMe
         PP3MrO7k3RhcvzcsZbTL6FrSM6qqHXS9/HDqKBpv8hDAIe1EFRswnBrZEqEGZ12zdv
         orsmX5DhV9D3Sew/syJkmc2hUltwWZVdAj5ExDCqzNc9aiXcy78HIcKp6RKQXRo6AJ
         Fjjk+hG/4eoJQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        quic_tdas@quicinc.com, konrad.dybcio@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/16] clk: qcom: gcc-qcs404: convert to parent_data
Date:   Tue, 27 Dec 2022 12:04:01 -0600
Message-Id: <167216423711.744668.16828918538111701639.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
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

On Mon, 26 Dec 2022 06:21:38 +0200, Dmitry Baryshkov wrote:
> This patchset reworks and improves the Qualcomm QCS404 global clock
> controller driver and it's platform usage.
> 
> It fixes some omissions (MDSS and oxili GDSCs, incorrect clock names,
> direct number usage in the qcs404.dtsi). Then it converts the gcc driver
> to use parent_data/parent_hws where prefereable and finally applies
> these features and fixes to the qcs404.dtsi.
> 
> [...]

Applied, thanks!

[13/16] arm64: dts: qcom: qcs404: use symbol names for PCIe resets
        commit: 41a37d157a613444c97e8f71a5fb2a21116b70d7
[14/16] arm64: dts: qcom: qcs404: add power-domains-cells to gcc node
        commit: 1eb309964e6384eda56c2d2816c3857c0b7c3ea6
[15/16] arm64: dts: qcom: qcs404: add clocks to the gcc node
        commit: 3494938a7e9e436be5dc989aecc1c800ecf2dba9
[16/16] arm64: dts: qcom: qcs404: add xo clock to rpm clock controller
        commit: f961fd2f6717c34a20a6951dcf9782a29e648f6c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
