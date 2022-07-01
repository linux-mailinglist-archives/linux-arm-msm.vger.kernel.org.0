Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEF7E562A94
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 06:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbiGAEiW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 00:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbiGAEiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 00:38:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 550B11E3D3;
        Thu, 30 Jun 2022 21:38:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E234C6231F;
        Fri,  1 Jul 2022 04:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65372C341C6;
        Fri,  1 Jul 2022 04:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656650300;
        bh=KEyNJ9eUT/sOXo+mv21xjL4EVofxKSZw10KazOUxBNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UhJbKJqggaHMkj4LzN9lKFsXhD6+tsxDthQp5q8edm7yOl7jRwBiJ1fWXujffcpAD
         PG35C1rSFLVx4bO0qRuSlo3ceHxYU5Ax8sYNg/SkTrwxjSWVRtjWzN4cD4dywDRowB
         7x648cY2GoVcnGRXbASJaNgLp+OmmR78sjWWYEWtQU4eLdcOBi5XBU4fT/kWEwbOWz
         xdlL/uXge3Z05YCmy6oLfmGp6ZTMoTR9WrMT+3d9czs7QdUryD+EubGMgVV/WrtuYU
         i/i6P1WMNLVK3FBVCt8Awv3ZO2Pl4v+HWQrwTRiYKofilsX6lptkGvpMWTey173Qnd
         mXLSgOf+IUoOg==
Date:   Fri, 1 Jul 2022 10:08:14 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 7/7] clk: qcom: add camera clock controller driver for
 SM8450 SoC
Message-ID: <Yr56Nl/OANDaoVdi@matsya>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
 <20220630081831.2554107-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630081831.2554107-1-vladimir.zapolskiy@linaro.org>
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
> Add  camera clock controller driver found on QCOM SM8450 SoC.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
