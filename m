Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03E106BC466
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 04:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbjCPDSE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 23:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjCPDR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 23:17:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5374698E8E;
        Wed, 15 Mar 2023 20:17:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BCC9F61EEE;
        Thu, 16 Mar 2023 03:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BAEBC4339E;
        Thu, 16 Mar 2023 03:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678936674;
        bh=YPODKJ6s2pOiZrSu/pEnZIA2i3Oz801nnUTl9EJl+uU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IldUvNZdGA+v5ahmEq3R0J95O5BT9zSyOf0almh1Lg2+cOWlCkiNsPlHLsR1IkYIb
         Df2TRgFxwdmLP71QruUkOd98tXInpGJYrLQH136RDFJaxu860f9PKsABZXzpy277+y
         mS3oR2rfOillaceolzzIviIQv/1Yi0LcSL3Sq5ElWJ8USYbi1uJ5c48BsCs0H7TemZ
         QueKVWOAoHsJ3osAZdOZAC/j3Wzzg9UVQjjTEOO3gue/eFe9h9tjXjGRlT/4F+DCkV
         NK8qfp/3G0V7g0K5gslr5Rh/UVBjvnsHWjroZw3z4j5K8nQZkBUZEYHEI0ZjrLNVvl
         dfIY+ksurrncQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: (subset) [PATCH v2 0/4] clk: qcom: Add clocks for MSM8917 and QM215
Date:   Wed, 15 Mar 2023 20:20:58 -0700
Message-Id: <167893686409.303819.1874963270508917052.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223180935.60546-1-otto.pflueger@abscue.de>
References: <20230223180935.60546-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Feb 2023 19:09:31 +0100, Otto Pflüger wrote:
> Add support for clocks, resets and power domains provided by the global
> clock controller (GCC) and clocks controlled by the RPM firmware on
> MSM8917/QM215 SoCs.
> 
> The only clock configuration difference between QM215 and MSM8917
> is the source mapping of the GPU clock, so a single driver is used
> for both SoCs.
> 
> [...]

Applied, thanks!

[2/4] clk: qcom: Add global clock controller driver for MSM8917
      commit: 33cc27a47d3ab6b598bf7f7dcd3a858458a4ec1d
[4/4] clk: qcom: smd-rpm: Add clocks for MSM8917
      commit: 134da70c6406184d815a491fc9535627a05e764b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
