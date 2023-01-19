Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F836672ED2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 03:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjASCRX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 21:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjASCRL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 21:17:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E765C4E52C;
        Wed, 18 Jan 2023 18:17:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1DA0661A70;
        Thu, 19 Jan 2023 02:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB66FC43392;
        Thu, 19 Jan 2023 02:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674094624;
        bh=0g1QfJ5dxyE0Ykp6VWq6RnZLtnH+OXtcnu1C00e0PuA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fjvbZXkfr48kqYz2QP9K9Y0iaSzE5zk8Sftwf4O1l7vgFKYoEkiVHU8vwQr7q5DQU
         gfB49oxbanhkJVw815AJ161YRgIpaY5orIDhMsdbgOFA9zxiqUQoQk3KVc7TGi8fTr
         BCtZwFIc1VCTW553wPZi88Xma+UblEtGXOATtq+qvj59Fmq7n4MON/Hkp5Zco7N2no
         I6C0P4DXY4s/oVW8NMAx8fFdgE2X2//LyxA3g/QWBUw2PP7u+0uxljP9Pe1CZWa0wv
         76EDpSFb6QBrYVpmy4G2/f1G1aQ8CotwuDPMfmO3WIPTwA5o8+aFj3GCICH3ZXGprb
         z8To2sg15DhSw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, Andy Gross <agross@kernel.org>,
        konrad.dybcio@linaro.org, quic_tdas@quicinc.com,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v3 00/12] clock: qcom: apq8084: convert to parent_data/_hws
Date:   Wed, 18 Jan 2023 20:16:53 -0600
Message-Id: <167409461448.3017003.993714357493264054.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
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

On Wed, 11 Jan 2023 08:03:50 +0200, Dmitry Baryshkov wrote:
> Rework apq8084 gcc and mmcc drivers to use parent_data and parent_hws
> instead of parent_names.
> 
> Changes since v2:
> - Reverted the qcom,gcc-apq8084 example to use numbers for ufsphy clock
>   indices rather than defining them right in the example.
> 
> [...]

Applied, thanks!

[12/12] ARM: dts: qcom: apq8084: add clocks and clock-names to gcc device
        commit: b894f2cf915479f9b25266da394942db9736161d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
