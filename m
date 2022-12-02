Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40E2F640E9E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 20:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234514AbiLBTmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 14:42:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiLBTmM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 14:42:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C8B8E801F;
        Fri,  2 Dec 2022 11:42:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 862F661CD5;
        Fri,  2 Dec 2022 19:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CABC433D7;
        Fri,  2 Dec 2022 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670010130;
        bh=Q8Ldh2CarbtjRyADsmuRznQ616b8eNaOu+tBX+CQdEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JrwaIHeMFAW1xCdAjnaOq9JOv12wwffYFergE5JbIUUJkivr03Ymw1ZFBnSssT6n2
         rB24qZmn/cBmUmBlw5TaDOAQipYB6I0W9jjCyhqjc348CN5qvM92plEkL4j4uqDykU
         xZYahtSS9sVsm0hZ4fXeeYiQzQCJe9kLCCXkzctq+oahvLu7/Oq5rLIoxrUws4jSge
         bgAi97Ovpgwq34TPyZXh4YCED28vCIcPEBWeJI5dc8qn/zLsutm8dJrwL937aIeAay
         j581XdAESyYP0KQPqtM9klDvOV6wLbYj+FB8snhKrcaSivHX+xnnApil2laBcH6OEe
         kEh37lZtHR7gA==
Date:   Fri, 2 Dec 2022 13:42:08 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 0/4] clk: qcom: rpm: drop platform names
Message-ID: <20221202194208.rmr3nxj7a5bj4iri@builder.lan>
References: <20221202070814.482470-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202070814.482470-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 02, 2022 at 09:08:10AM +0200, Dmitry Baryshkov wrote:
> The RPM clocks driver uses platform (SoC) as a part of the clock
> definition. However there is nothing really SoC-specific in this
> part. Using it just leads to confusion and sometimes to duplication of
> definitions. Drop the SoC name where it is logical.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> 
> Changes since v2:
> - Split from the RPMH patchset
> - Dropped superfluous active-only clock names when there are no actual
>   clocks behind
> - Removed the _clk and _a_clk suffixes, moving them to preprocessor
>   macro, no need to have them all over the code.
> 
> Dmitry Baryshkov (4):
>   clk: qcom: rpm: remove unused active-only clock names
>   clk: qcom: rpm: drop separate active-only names
>   clk: qcom: rpm: drop the _clk suffix completely
>   clk: qcom: rpm: drop the platform from clock definitions
> 
>  drivers/clk/qcom/clk-rpm.c | 204 +++++++++++++++++--------------------
>  1 file changed, 94 insertions(+), 110 deletions(-)
> 
> -- 
> 2.35.1
> 
