Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2D96645CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 17:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbjAJQRc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 11:17:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233241AbjAJQRa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 11:17:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC6C5BA03;
        Tue, 10 Jan 2023 08:17:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ADEAFB8188F;
        Tue, 10 Jan 2023 16:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8852EC433F2;
        Tue, 10 Jan 2023 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673367445;
        bh=/8ixJ0FRiTV6sp1QD9mpmHIBrQ0y5oJw7AolxgL+f7g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GouM3kJ7WOOO08mLdeX1hy+OUen2ZdcclSJbGkcWhPazvNFICF5e1Oj2REGAz4rIL
         /usGN53KDEBFgulAHaEdvO/aKw5ANp++ctm6ATaoUJIz5cbiWVNKaeac3idWJh7lQw
         /BE7Wum8yoCbqRlKazLJJQVXYa9ZP6OhWysY5n01VFlv31ys4Mn52Hxb8YclVsCymM
         UnCXuT7FcDJxznrSKbHddTQmhQPsr6Fvj5kIO76Tg5dgbSOC3z8uNARmr3s84s53IR
         NkOR3BSXLxULGKb0Rug77eEVkewc+H34CaypD2eM9RrDbgwR2OYajSWAJTSXZLy0mE
         yCbzW766IY+Zw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     jorge.ramirez-ortiz@linaro.org, ulf.hansson@linaro.org,
        christophe.jaillet@wanadoo.fr, nks@flawful.org,
        rafael.j.wysocki@intel.com, agross@kernel.org,
        konrad.dybcio@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        niklas.cassel@linaro.org, kernel-janitors@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] PM: AVS: qcom-cpr: Fix an error handling path in cpr_probe()
Date:   Tue, 10 Jan 2023 10:17:18 -0600
Message-Id: <167336743973.2134489.6560821756335725257.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <0f520597dbad89ab99c217c8986912fa53eaf5f9.1671293108.git.christophe.jaillet@wanadoo.fr>
References: <0f520597dbad89ab99c217c8986912fa53eaf5f9.1671293108.git.christophe.jaillet@wanadoo.fr>
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

On Sat, 17 Dec 2022 17:05:41 +0100, Christophe JAILLET wrote:
> If an error occurs after a successful pm_genpd_init() call, it should be
> undone by a corresponding pm_genpd_remove().
> 
> Add the missing call in the error handling path, as already done in the
> remove function.
> 
> 
> [...]

Applied, thanks!

[1/1] PM: AVS: qcom-cpr: Fix an error handling path in cpr_probe()
      commit: 6049aae52392539e505bfb8ccbcff3c26f1d2f0b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
