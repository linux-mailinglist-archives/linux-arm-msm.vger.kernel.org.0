Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E43396BC494
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 04:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbjCPDTM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 23:19:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230030AbjCPDS1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 23:18:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1A914EA2;
        Wed, 15 Mar 2023 20:18:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E1C04B81FAF;
        Thu, 16 Mar 2023 03:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092D4C433A0;
        Thu, 16 Mar 2023 03:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678936687;
        bh=l9PCObsXGxQkrhbDcLz7t0COGOwV0NhigjEc0VjQjdo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lHUnG89uLATD+YY1Dag+0gVRIwi/ytX6+orFirMMaZ7mCStx6BLCPzFY/2w2Mg3CZ
         /YWVPgy/kWIXxNqYa6yxnDjDwl4o6W3fh7QvVyd+6Ldj4r/G36P8yMRNzjwvXqARcy
         JUag6HmJ1uQhp+3YPsAt3yDNK1j4mCqqMJ55zyjJWz4jOJBUmDOCVT9QesOQ4sIhGV
         nNLAygikVvixZ++kRkOqGv703H8DoXkvFYJphuGGmC+O3elwoWr/J8zpCYjxZzP/x2
         JZUbyyDvxd3Qum/MVSgPxpUTUAgS1LhO2SSZSG2MaxxjgVPsG5NiTvzK8mdTeiCx/u
         WGUx0W6u4cBBg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     robh+dt@kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        dmitry.baryshkov@linaro.org, krzysztof.kozlowski+dt@linaro.org
Cc:     danny@kdrag0n.dev
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: correct dynamic power coefficients
Date:   Wed, 15 Mar 2023 20:21:07 -0700
Message-Id: <167893686408.303819.18261808649360846465.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230106164618.1845281-1-vincent.guittot@linaro.org>
References: <20230106164618.1845281-1-vincent.guittot@linaro.org>
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

On Fri, 6 Jan 2023 17:46:18 +0100, Vincent Guittot wrote:
> While stressing EAS on my dragonboard RB3, I have noticed that LITTLE cores
> where never selected as the most energy efficient CPU whatever the
> utilization level of waking task.
> 
> energy model framework uses its cost field to estimate the energy with
> the formula:
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845: correct dynamic power coefficients
      commit: 44750f153699b6e4f851a399287e5c8df208d696

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
