Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5D2561873
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 12:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234003AbiF3KmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 06:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234300AbiF3Kl5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 06:41:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6942858FF9;
        Thu, 30 Jun 2022 03:40:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C850862280;
        Thu, 30 Jun 2022 10:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFDFC34115;
        Thu, 30 Jun 2022 10:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656585594;
        bh=UQaLn3eS5gGqu/Ay8p6kLakDREDsUF2N1Q0Xyiu1ROk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jn14XDn/BjKJrdKECuyJMMGBXJyB1WEpM7vknGmW9pq6Chcs2UEEGq1MmdxedqXZQ
         6lbh9ykNHCylQ1kbKz6lxvaRRs3KVEauVONuxE4KOQVOK66+HvX9nFTCSiTIQxgaRX
         tSl6TKuEcJN9L6VQlqPoXo4YHO7vmwD4zvpOv3kdcohCRS2OjjETFaJkChlyQV8LAw
         6D/WHLW8A3co4eAUxgqVXU1v3fDK/B0O2X8+QrdQ+Dxq1kTEq98G1rInS4OfgsQ8CJ
         nFc0uZ0Jm/EWxy8QYqeaMB9cjEScTLUhUNYOSU5xx/9bcbYTjgc6DlWy8j3wMyU/QE
         yaqAD29zhFpyw==
Date:   Thu, 30 Jun 2022 16:09:49 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 3/7] clk: qcom: clk-alpha-pll: fix
 clk_trion_pll_configure description
Message-ID: <Yr19dUHBDSj4Yoke@matsya>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
 <20220630081816.2554031-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630081816.2554031-1-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-06-22, 11:18, Vladimir Zapolskiy wrote:
> After merging lucid and trion pll functions in commit 0b01489475c6
> ("clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid")
> the function clk_trion_pll_configure() is left with an old description
> header, which results in a W=2 compile time warning, fix it.
> 

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
