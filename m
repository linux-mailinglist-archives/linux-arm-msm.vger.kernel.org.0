Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33448640ECF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 20:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234407AbiLBTzi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 14:55:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233888AbiLBTzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 14:55:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F87EE958;
        Fri,  2 Dec 2022 11:55:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 03236B8227D;
        Fri,  2 Dec 2022 19:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1279C433D7;
        Fri,  2 Dec 2022 19:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670010934;
        bh=UMwUIwq+M9H+o5Bxi/xKVwNlpCJ8/S67RkKQ+RvKbPk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aSZWgb4OdtdgpqgVuuqhAH4ha779pmcvj9diZsTnzkDU7UwzNkSzhBA0y2gXr911a
         xZ72AtHkKOtt6IM+/cJLH67hLWBs7TrZWa+ji8Dl1QZVlhyffzL2s4SZA7KDi0dB8S
         sHN1Mw6u2bREsVoYWXbFi5VYoYUtxo3EBDWzpjKGzmEB04+ACDekAJ3dLGLCMwQtq/
         YclP2bm7FwFWCJUzVB82wR33N12h9WFYL7nAJf5rtpuYslroJx2d4+YFXglTqx6KF8
         aB8oBEX2S8XkK6qxX/1TpjiLRvkBwS/VPR/s1W/qzyhCV7FpWVXGuASMsKtT044HwJ
         e/cm1Yc+AuJwg==
Date:   Fri, 2 Dec 2022 13:55:31 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: Re: [PATCH v3 0/8] clk: qcom: rpm/rpmh: drop platform names
Message-ID: <20221202195531.kwp4fqzgfzznuzzp@builder.lan>
References: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 02, 2022 at 08:58:35PM +0200, Dmitry Baryshkov wrote:
> Both RPM and RPMH clocks use platform (SoC) as a part of the clock
> definition. However there is nothing really SoC-specific in this
> part. Using it just leads to confusion and sometimes to duplication of
> definitions. Drop the SoC name where it is logical.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Changes since v2:
> - Additional rework of ARC/VRM clock handling as suggested by Alex
> 
> Changes since v1:
> - Reworked and split the Soc-name removal patch for RPMH clocks
> 
> Dmitry Baryshkov (8):
>   clk: qcom: rpmh: group clock definitions together
>   clk: qcom: rpmh: reuse common duplicate clocks
>   clk: qcom: rpmh: drop all _ao names
>   clk: qcom: rpmh: remove platform names from BCM clocks
>   clk: qcom: rpmh: support separate symbol name for the RPMH clocks
>   clk: qcom: rpmh: rename ARC clock data
>   clk: qcom: rpmh: rename VRM clock data
>   clk: qcom: rpmh: remove usage of platform name
> 
>  drivers/clk/qcom/clk-rpmh.c | 421 ++++++++++++++++++------------------
>  1 file changed, 205 insertions(+), 216 deletions(-)
> 
> -- 
> 2.35.1
> 
