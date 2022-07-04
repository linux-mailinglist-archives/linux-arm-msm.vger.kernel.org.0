Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 079AF565D19
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 19:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234646AbiGDRgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 13:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234288AbiGDRf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 13:35:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8975212AB4;
        Mon,  4 Jul 2022 10:35:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 277A961594;
        Mon,  4 Jul 2022 17:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5C0C341CE;
        Mon,  4 Jul 2022 17:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656956153;
        bh=YlxJxaybDGcBETe4bRsCXPACATkTBpIuUGJaDL2c1XY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=YjIpkQJ5qvWiYXKcT4+q1AGPT2o/iIKF7mRYQZ+eqGIHF8AjDEq/g/NYhOxEYz32u
         uJYq+j9cFozMkCNnIXRGBWvVaMUWE94j6k40axqUJj8HeUGZcYmxQUkgmQIkktc1q2
         yBzih9nt4s+OluoODXxNJuOZNUVbCv0R5bd0zU8M1AWCe/+Uan2Yww/9iUw/RK2Tjb
         j3IuBvgwcibR8HT+xeZQmvQH0buvZD2b3DbQLQQpVmtoFdtkqLrcGtUmCeqKruaUiZ
         tEZBImgPclhAE8DWYnCoCTLUtNnTQ5cMcVDUJj49P40xN5KmTSIyRQYLxmjZ2/th0T
         cXTF60NWrQMtQ==
Message-ID: <457c9b4d-dba7-75c9-3772-006e58319286@kernel.org>
Date:   Mon, 4 Jul 2022 20:35:44 +0300
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/7] clk: qcom: gcc-msm8916: use ARRAY_SIZE instead of
 specifying num_parents
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
 <20220704172453.838303-4-dmitry.baryshkov@linaro.org>
From:   Georgi Djakov <djakov@kernel.org>
In-Reply-To: <20220704172453.838303-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4.07.22 20:24, Dmitry Baryshkov wrote:
> Use ARRAY_SIZE() instead of manually specifying num_parents. This makes
> adding/removing entries to/from parent_data easy and errorproof.
> 
> This conversion fixes an issue present since the first version of this
> driver. For the gp1_clk_src, gp2_clk_src and gp3_clk_src it was
> impossible to select sleep_clk as a prent of the clock, since
> num_parents was limited to 3 rather than 4. Switching to use num_parents
> automatically makes sleep_clk available for selection.

Thanks for fixing it!

> Fixes: 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
> Cc: Georgi Djakov <djakov@kernel.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Georgi Djakov <djakov@kernel.org>

> ---
>   drivers/clk/qcom/gcc-msm8916.c | 108 ++++++++++++++++-----------------
>   1 file changed, 54 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
> index 9a46794f6eb8..265df21e24af 100644
> --- a/drivers/clk/qcom/gcc-msm8916.c
[..]

