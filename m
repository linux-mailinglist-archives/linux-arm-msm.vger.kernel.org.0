Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A39A252FECD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 20:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244726AbiEUS1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 14:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238619AbiEUS1q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 14:27:46 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623AE68F88
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 11:27:45 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3F5913F664;
        Sat, 21 May 2022 20:27:43 +0200 (CEST)
Date:   Sat, 21 May 2022 20:27:42 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 07/11] arm64: dts: qcom: sdm630: fix gpu's
 interconnect path
Message-ID: <20220521182742.vaisrfzuqyrnsv7u@SoMainline.org>
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
 <20220521152049.1490220-8-dmitry.baryshkov@linaro.org>
 <20220521161750.3jvvmlfrvk6yxwkp@SoMainline.org>
 <aed5ee02-90d3-fa0d-3563-c83987d011a3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aed5ee02-90d3-fa0d-3563-c83987d011a3@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-21 18:51:07, Krzysztof Kozlowski wrote:
> On 21/05/2022 18:17, Marijn Suijten wrote:
> > 
> > And also added my Reviewed-by there.  I think it is normal to have a
> > Reviewed-by on top of a Suggested-by/Reported-by, so that I as reviewer
> > confirm the contents of the patch?
> 
> The review tag is not used to confirm anything like that.

It is used to acknowledge that I agree on (confirm) the contents of the
patch as per how a review usually works.  I have reviewed the patch,
double-checked the numbers on my end.  That's the "contents of the
patch"?

> > Since this is the third patch missing these, It may just have been an
> > oversight.
> 
> If your review was meeting the criteria of "Reviewer's statement of
> oversight", then of course should be added here.

That's what I said above, the Reviewed-by goes on top of the Reported-by
as the latter doesn't imply the former at all.

- Marijn
