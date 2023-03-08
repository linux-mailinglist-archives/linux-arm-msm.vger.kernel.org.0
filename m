Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 488986B0ABB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 15:14:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbjCHON6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 09:13:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232163AbjCHONb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 09:13:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129C55A1B3;
        Wed,  8 Mar 2023 06:12:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AD1B6B81CD1;
        Wed,  8 Mar 2023 14:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48833C433D2;
        Wed,  8 Mar 2023 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678284750;
        bh=oIeKZ0KEjAA3KIZ3yI5vaTg8K0enSbNU5TtQ9ZNBrlI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k2AkGTlHvq+kDK9xcAt1W8u7U0lgX42KbmePskJlSkQpV6V8wgUEGmsMkIHOZCw0L
         e/336P8OJWb6gUy4kDw/7MlL+L3Iv5JpDJnY8ZD8m281dYJrwg44yTJ2pqSp2b3IAj
         r6CvZmRKA8O0HYYweSm0D3eUDqpEjeAyKDtvB/00FTUY/YF5mF3VVp/6R/0oQMDblA
         twk3rSSkib59nG4PNjq6DRJC2wHHWy8DMDVOGiuL5XT+jIQjZbQF1qWUdjn0zuNzRe
         ESXV25H6iKOQeWqB0ymOLUany60PT9qzlVue4+013olDS/2OV8GMnMn4/tXkai8aap
         uLmz/WbH/0c6A==
Date:   Wed, 8 Mar 2023 14:12:25 +0000
From:   Lee Jones <lee@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom-spmi-pmic: add pm8450 entry
Message-ID: <20230308141225.GP9667@google.com>
References: <20230306112129.3687744-1-dmitry.baryshkov@linaro.org>
 <518fd95b-4b8c-108b-8525-4ffd093380f0@linaro.org>
 <de172647-8261-3f8e-2aa7-a1c47b307c8e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de172647-8261-3f8e-2aa7-a1c47b307c8e@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 06 Mar 2023, Dmitry Baryshkov wrote:

> On 06/03/2023 14:11, Krzysztof Kozlowski wrote:
> > On 06/03/2023 12:21, Dmitry Baryshkov wrote:
> > > Add bindings for the PM8450 PMIC (qcom,pm8450).
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> >
> > https://lore.kernel.org/all/20221217003349.546852-2-dmitry.baryshkov@linaro.org/
> >
> > Keep changelog and tags.
>
> Argh. I stumbled upon the patch in the sm8450 branch and thought that I
> forgot to include it for some reason. But it seems the problem was that I
> didn't include correct maintainer (Lee).
>
> Lee, how should I proceed? Should I resend a patch with proper tags?

Yes please.

--
Lee Jones [李琼斯]
