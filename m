Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81D1B56187A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 12:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbiF3KnP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 06:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235017AbiF3Kmh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 06:42:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A054D4D5;
        Thu, 30 Jun 2022 03:40:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 166B16227F;
        Thu, 30 Jun 2022 10:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAED5C34115;
        Thu, 30 Jun 2022 10:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656585630;
        bh=6g1EAWaJYoZ7/A1lNl7RJY+2mIc+MU6cpTp4LNWrgb8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GxHPclZ+rbTdaTFp1yLvc0Y4oKqAwnWJlupZMuMFWd5NpG7S7TAhXcxS7U6TDtI39
         B948/OpJNyPQ5LpedR+F/igWkekBxVdQjrA0owSfgx7fAAZt9a8gH73AV2ABydpzus
         mpp1Fm3i7i+U8AnqlP4uGY8l878ikR9tDfvF1tZMhuSM4lEbJIGqHoBx1fvFNHEAz2
         yieMAeKa0CvO/0tq4YxJN4mlnljlprBDHPiv6AcpKj5kU1dAP4f1LLDfAR6wboQR6s
         y+3npTWfP3p+LG18v5iTJdt402Z/MvO0Nvn3cKoRbsuXcc5iFCRlhwbnnWOv2RDKie
         HRee1SW+WAffQ==
Date:   Thu, 30 Jun 2022 16:10:26 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 4/7] clk: qcom: clk-alpha-pll: limit exported symbols
 to GPL licensed code
Message-ID: <Yr19mh71Av41dbIb@matsya>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
 <20220630081821.2554050-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630081821.2554050-1-vladimir.zapolskiy@linaro.org>
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
> Unify all exported PLL clock configuration functions and data structures
> as GPL symbols.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
