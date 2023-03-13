Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12C3C6B863D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 00:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjCMXok (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 19:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjCMXok (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 19:44:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C110975F
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 16:44:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2827B61540
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 23:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25619C433D2;
        Mon, 13 Mar 2023 23:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678751078;
        bh=kkbqSuaI4+vfNHxSrBJqccWZHB+5rPft9289TVpFJYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d/RqeOmkx+IuNhvwxQpzbfpNaajMK6hgkyLHlEWU+65oXwzwRDAYPRolK//9Fnmso
         4iRBPRdE+r9t6MMRIpO0z3x5W9gfd3+9DEwiB8+wyJuyPzT46AUSiyR0dJmrz68wNx
         ppOO+WiuA42efA94SjZQT27L+ujbStMaD/WhuzOro7MK7a6raNYzjvmVioo3NTUS9t
         o2xLoNXknkkvWcW/TOCNWUCeAHOjCyZIhdApRaDK0NI9ehMwT/5NfYijsMmTecYiO4
         I1WdyF5Id+gc1nVkKZmx35nCnZvZlLlgtxiM+W6mxqqpjzi4h0VLR6xWpQJukfrXqA
         x1lyYYAp7wtkw==
Date:   Mon, 13 Mar 2023 16:48:02 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        krzysztof.kozlowski@linaro.org, marijn.suijten@somainline.org
Subject: Re: [PATCH v2 0/9] RPMPD cleanup + parent PD
Message-ID: <20230313234802.w4wnaj43uxvfsmh4@ripper>
References: <20230213143524.1943754-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213143524.1943754-1-konrad.dybcio@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 13, 2023 at 03:35:15PM +0100, Konrad Dybcio wrote:
> v1 -> v2:
> - reorder the cleanup for better reviewability (read: redo the
>   thing from scratch with the only thing being shared is the idea)
> 
> - move parent pd patches to the end
> 
> - clean up even more duplicates (lpicx vs lpi_cx)
> 
> - remove the vdd prefix from pd names
> 
> - use a single tab instead of a single space in [6/9]
> 
> - only pick up the rb on [8/9], as the rest is essentially new
> 
> v1: https://lore.kernel.org/linux-arm-msm/20230125032728.611640-1-konrad.dybcio@linaro.org/
> 
> This series provides a big and necessary cleanup for RPMPD..
> Lots of redefined objects were trimmed as well as some stylistic
> and maintainability fixes have been made. Also, support for parent
> PD is added and put to use on SM6375 where VDDMX should be scaled
> together with VDDGX.
> 

Series looks good, but first patch fails to apply. Could you please
updated the patch you pointed out the _ao issue and rebase this on
v6.3-rc1?

Thanks,
Bjorn

> Konrad Dybcio (9):
>   soc: qcom: rpmpd: Bring all definitions to the top
>   soc: qcom: rpmpd: Unify Low Power Island definitions
>   soc: qcom: rpmpd: Remove vdd* from struct names
>   soc: qcom: rpmpd: Expand struct definition macros
>   soc: qcom: rpmpd: Improve the naming
>   soc: qcom: rpmpd: Make bindings assignments consistent
>   soc: qcom: rpmpd: Add parent PD support
>   soc: qcom: rpmpd: Hook up VDDMX as parent of SM6375 VDDGX
>   soc: qcom: rpmpd: Remove useless comments
> 
>  drivers/soc/qcom/rpmpd.c | 800 +++++++++++++++++++++++++++------------
>  1 file changed, 564 insertions(+), 236 deletions(-)
> 
> -- 
> 2.39.1
> 
