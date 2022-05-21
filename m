Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29ABC52FFBC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 May 2022 00:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346532AbiEUWPd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 18:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346344AbiEUWPb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 18:15:31 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 411AA45079
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 15:15:29 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3F19F3F637;
        Sun, 22 May 2022 00:15:27 +0200 (CEST)
Date:   Sun, 22 May 2022 00:15:26 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH v6 01/11] arm64: dts: qcom: sdm630: disable dsi0/dsi0_phy
 by default
Message-ID: <20220521221526.fadfblxd3inaqj35@SoMainline.org>
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
 <20220521152049.1490220-2-dmitry.baryshkov@linaro.org>
 <20220521160652.oyqvurbjql23n243@SoMainline.org>
 <86ac74b5-2964-fd0d-bf50-12aee73d5fec@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ac74b5-2964-fd0d-bf50-12aee73d5fec@linaro.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-21 23:13:49, Dmitry Baryshkov wrote:
> On 21/05/2022 19:06, Marijn Suijten wrote:
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
> 
> Please excuse me. I didn't pick up your R-b tags by mistake.

No worries, it just seemed coincidental to have them picked up on every
patch except the ones which already had a Suggested/Reported-by tag,
thanks for picking them up now!

- Marijn
