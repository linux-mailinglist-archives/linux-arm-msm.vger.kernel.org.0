Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 669AC561AAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 14:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234641AbiF3MqU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 08:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234824AbiF3MqP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 08:46:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C417A2A734;
        Thu, 30 Jun 2022 05:46:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B5B9B82A7D;
        Thu, 30 Jun 2022 12:46:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9BDC34115;
        Thu, 30 Jun 2022 12:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656593172;
        bh=V9MEmeKEeiohNLpXwu1MxUWpi7Dg5HhG14rTKC9onXI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KDHMcuslxCDNbeCC218MpOmJ2+QmCsyhr3EU7rCpKJtRpzxnqwmUaovg3f4SayDMf
         nLOQ+5vOH+wxWd4AT0l0jcqBXFPm9rE1tvkvKLks5zdHpQxSkGymkFyRSEuKN4zOvF
         e/gvPee1lMslfNnpMNvot9U4Uh4AApM7gBHmmdgjGZHM06Sqn39gp4w8JrtB+fto1V
         Va87BMEVr3mhufzXbVkSjy333uV+ap+KDfiaP1uPXH1mqfAStMnxxBbanRNLe5/PBp
         wYU6x1xSuuO5U65qEMpelvTPdXLlnszlWCsvsaIL9RGlbcDsZ8/D2exJXtN4j+m0/7
         xLU9U8ls3YdMg==
Date:   Thu, 30 Jun 2022 18:16:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 6/7] clk: qcom: clk-alpha-pll: add Rivian EVO PLL
 configuration interfaces
Message-ID: <Yr2bDzhj0KoY1RVi@matsya>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
 <20220630081828.2554088-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630081828.2554088-1-vladimir.zapolskiy@linaro.org>
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
> Add and export Rivian EVO PLL configuration and control functions to
> clock controller drivers.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
