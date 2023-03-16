Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11BBF6BC486
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 04:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjCPDTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 23:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbjCPDS0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 23:18:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4AB196B2;
        Wed, 15 Mar 2023 20:18:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6694661EF6;
        Thu, 16 Mar 2023 03:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF96C4339B;
        Thu, 16 Mar 2023 03:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678936686;
        bh=frmEwP1FhaJV98y2VHfd0dL7/eeEEIKgA4ThRruFNVo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iDer8K6P3KCf4Zn/byIXBY4YadOKGCFXbXHNkpT1Mc3eNck2M/5K0AgG+ttPXDxQI
         QOJJYple5BhS9OeqNplFlutqy26o8hntUY524vZOzPgPszCUQKRt6ePqt23jhJ4+oI
         lGGH6QaNdHSvWxw34oOoDd6DRLQ8uyOlsP2QNPZVeAhLB/c4xOAZyj5TfLEbZLOdwv
         xBgJiDZVOopBcSGx+tP1x1bYQt9+vtN5EkQBwzor1P9J1+9f91bFIwW+OuwAi4Ucok
         SuWVtgR6fWesk/8rl/Gk+k0SuoSF/1whIFrZtr78tGEBVsi2CzPU4T5PDlL3+trsfg
         vjTAqdOx74rHQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: Fix tsens_mode unit address
Date:   Wed, 15 Mar 2023 20:21:06 -0700
Message-Id: <167893686411.303819.18210628570777155592.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308123617.101211-1-stephan.gerhold@kernkonzept.com>
References: <20230308123617.101211-1-stephan.gerhold@kernkonzept.com>
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

On Wed, 8 Mar 2023 13:36:17 +0100, Stephan Gerhold wrote:
> The reg address of the tsens_mode nvmem cell is correct but the unit
> address does not match (0xec vs 0xef). Fix it. No functional change.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916: Fix tsens_mode unit address
      commit: 608465f798bb3eaf6773a49b893902860858e294

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
