Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFB5A5ED340
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 05:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbiI1DHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 23:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbiI1DGz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 23:06:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EA51CE924;
        Tue, 27 Sep 2022 20:06:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ACCE8B81EE6;
        Wed, 28 Sep 2022 03:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765C4C433B5;
        Wed, 28 Sep 2022 03:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664334412;
        bh=R9JmZjDUJYbaR0xBm7pFZL+wx904hJna0PxJ2oGNRd4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ePm4kTuHVFHwZmWriD+tZk1/4nVcT9HAzurqfQB4ul15tb8Mk8o8LYMeoEX8nWYya
         zGq3HCTDb3TFFwEnexJQ+JvI6Rbbh/+GTSOBMxj6GwcDpcH65eDApvKZqqF9frQ5+i
         st4qVi9hIRP7lxMu4sD9Ze38VGf/5BZADNLvrJN2+uyodICD1C+xXuZcyEUgQDjDB/
         h1yfJO7WFifq7g8Rcgebjno3oUzPhrwWi2vLvXHRXjnJOJGlV0JdeGznRZYbXkFMKE
         6mMYGAUkMJsb85WTtE45n6W8QCB18gebHOvM6YgFp6fM6ii1Ujfxnht79ZZUyK50P8
         oTGKp/OaC9AAQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-arm-msm@vger.kernel.org, mailingradian@gmail.com
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        tdas@codeaurora.org, sboyd@kernel.org, linux-clk@vger.kernel.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org
Subject: Re: [PATCH v2 0/2] SDM670 RPMh Clocks
Date:   Tue, 27 Sep 2022 22:06:46 -0500
Message-Id: <166433439999.1849007.2964764834700967853.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220920223734.151135-1-mailingradian@gmail.com>
References: <20220920223734.151135-1-mailingradian@gmail.com>
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

On Tue, 20 Sep 2022 18:37:32 -0400, Richard Acayan wrote:
> Changes since v1:
>  - fix broken link
>  - accumulate ack tag
> 
> This patch series adds clocks controlled by RPMh for Snapdragon 670.
> 
> .../devicetree/bindings/clock/qcom,rpmhcc.yaml      |  1 +
>  drivers/clk/qcom/clk-rpmh.c                         | 21 +++++++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: add rpmhcc bindings for sdm670
      commit: c6648a402ced29ef826055583a96dcc85d9d3f55
[2/2] clk: qcom: rpmhcc: add sdm670 clocks
      commit: 2ded040cedf830c698c04ee79d436bd23014811a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
