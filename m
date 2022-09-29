Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 224505EFB2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 18:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235889AbiI2Qpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 12:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235884AbiI2Qpi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 12:45:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF2113D6B;
        Thu, 29 Sep 2022 09:45:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CDE4061F4D;
        Thu, 29 Sep 2022 16:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEB1C433C1;
        Thu, 29 Sep 2022 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664469936;
        bh=4LUW+R8rOSAwXa57IurjdCxjWuuiNTrXGcPkcWzPgH8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uipwp6LrFhMBegg1uBIslkdA9emPxXG64UlOpyBCISYCNreZYy2A59Or3jzcuO5Rq
         Z2fC+Wsr0PL2usEo6Frke3o8CoND8ujB1z4h1ntrU2lpvAyiXjd4FCaloCz6SK9cjT
         O021abSVj9Pp8RAEP8otY0rHsNBs63ymFXzOfTKq0UvS1oTmsC0XCBgTM3og3PN+VY
         6gc4loRA4PHuQxKJM91+jGnflhDQ68xwFkhChPsp1mYhk0g4aOP9eSCZAVDb7lxfJA
         lgs5S/06zhZCKt079V/pg4eOfhzRbmucKSXbndxm9dMSC/Svuk5ZTHCaRuQ8XxZdFz
         ysvexhzDlomPg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, mturquette@baylibre.com,
        krzysztof.kozlowski+dt@linaro.org, quic_tdas@quicinc.com,
        konrad.dybcio@somainline.org, sboyd@kernel.org,
        dmitry.baryshkov@linaro.org, robh+dt@kernel.org
Cc:     bryan.odonoghue@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] clk: qcom: gcc-msm8939: several small fixes
Date:   Thu, 29 Sep 2022 11:45:31 -0500
Message-Id: <166446992875.1979534.2685364283037988486.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
References: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 28 Sep 2022 17:56:06 +0300, Dmitry Baryshkov wrote:
> Apply several small fixes used for other Qualcomm clock drivers:
> - Use ARRAY_SIZE and parent_hws where applicable in gcc-msm8939 driver
> - Move gcc-msm8939 schema from gcc-other to gcc-msm8916 to declare the
>   clocks/clock-names used by this platform.
> 
> Dmitry Baryshkov (3):
>   dt-bindings: clock: move qcom,gcc-msm8939 to qcom,gcc-msm8916.yaml
>   clk: qcom: gcc-msm8939: use parent_hws where possible
>   clk: qcom: gcc-msm8939: use ARRAY_SIZE instead of specifying
>     num_parents
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: move qcom,gcc-msm8939 to qcom,gcc-msm8916.yaml
      commit: 2ab5b5663805ec8e5dc1dbdd9cb14ffac5b06ed1
[2/3] clk: qcom: gcc-msm8939: use parent_hws where possible
      commit: f565f9235a675e6eb5a105daa9b70ffa96aab715
[3/3] clk: qcom: gcc-msm8939: use ARRAY_SIZE instead of specifying num_parents
      commit: 994c77ed371e464ae4c1bfc316f7aff7309b2d59

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
