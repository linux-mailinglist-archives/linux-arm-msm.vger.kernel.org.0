Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6FA647B4C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 02:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiLIBW6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 20:22:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLIBW5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 20:22:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069805BD75;
        Thu,  8 Dec 2022 17:22:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9521662103;
        Fri,  9 Dec 2022 01:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD1CC433EF;
        Fri,  9 Dec 2022 01:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670548976;
        bh=EGbFc3zNer0a5qa8eKg+GATLk/pdezkNFQifEeZaRHs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jmb1FVdpSh+mFR0hnt8WkFf4Ixn+RsCdz0LLNFMOqHR84YcRy4inXAAPVzawHbK29
         W70YbAKjxWRJL2K1bXz3CH/L6bxh+bjn5ApSJbDEDFejTWQWn72j5Nzz6HalEeh5ab
         9mSmO4jmtqUoTzD8Vvd9mS8lvVcRgCPL7bfmu8sc3WjKpjjVarycrqgvfxizYLJ0wn
         5dv4VCLEaiUCmRIE9Wcb813M9NSXN2kdiCtzC5CduV7O6vh4amm6h+J5KiVtnvyC2F
         H8MAIMEEUNEi3DsA94NrCERaop0xZrf1VGfMCPnowRq5AzXKY8654AMDYkwrFnQ8Um
         vpX+z2g9x5pTQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221208141912.47262-1-dmitry.baryshkov@linaro.org>
References: <20221208141912.47262-1-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/3] clk: qcom: dispcc-sm6115: use parent_hws for disp_cc_mdss_rot_clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 08 Dec 2022 17:22:52 -0800
User-Agent: alot/0.10
Message-Id: <20221209012255.DFD1CC433EF@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-12-08 06:19:10)
> Rework disp_cc_mdss_rot_clk to use parent_hws isntead of parent_names.

s/isntead/instead/

>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
