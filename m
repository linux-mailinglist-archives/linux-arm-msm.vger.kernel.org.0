Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 377E752FEBB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 20:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244781AbiEUST3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 14:19:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiEUST3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 14:19:29 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E326D3BF92
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 11:19:27 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 484373F648;
        Sat, 21 May 2022 20:19:25 +0200 (CEST)
Date:   Sat, 21 May 2022 20:19:23 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v6 01/11] arm64: dts: qcom: sdm630: disable dsi0/dsi0_phy
 by default
Message-ID: <20220521181923.uqje7rclvblj6ofk@SoMainline.org>
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
 <20220521152049.1490220-2-dmitry.baryshkov@linaro.org>
 <20220521160652.oyqvurbjql23n243@SoMainline.org>
 <45462192-7c88-cdd9-19ae-e078915bf6c8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45462192-7c88-cdd9-19ae-e078915bf6c8@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-21 18:49:36, Krzysztof Kozlowski wrote:
> On 21/05/2022 18:06, Marijn Suijten wrote:
> > On 2022-05-21 18:20:39, Dmitry Baryshkov wrote:
> >> Follow the typical practice and keep DSI0/DSI0 PHY disabled by default.
> >> They should be enabled in the board DT files. No existing boards use
> >> them at this moment.
> >>
> >> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > I also added my:
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> > To v5, to confirm the Suggested-by.
> 
> Reviewed-by tag is not used to confirm other tags like reported or
> suggested. It means you performed the review and you state what is
> described in "Reviewer's statement of oversight".

That is obviously implied, otherwise I wouldn't have sent a Reviewed-by
in the first place.

However, I don't think Suggested-by quite carries the load of a
Reviewed-by (at all...), so I don't understand why my Reviewed-by's have
strangely been picked up for every patch except those where my name is
already listed as Suggested-by or Reported-by, those are completely
separate things.

- Marijn
