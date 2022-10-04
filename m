Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C31FE5F4C5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Oct 2022 01:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiJDXFD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 19:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiJDXEu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 19:04:50 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790552AD9;
        Tue,  4 Oct 2022 16:04:40 -0700 (PDT)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9A7A01F557;
        Wed,  5 Oct 2022 01:04:32 +0200 (CEST)
Date:   Wed, 5 Oct 2022 01:04:31 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/msm/dsi: Add phy configuration for QCM2290
Message-ID: <20221004230431.y44mek7i7tyixpb7@SoMainline.org>
References: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
 <20220924121900.222711-3-dmitry.baryshkov@linaro.org>
 <20221001160054.gmrlnjvdwyn5ttzw@SoMainline.org>
 <CAA8EJpqX0PVkx9TWYHAHT-Rvne_9nzVnV-xcsHWYB0VTs6oRbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqX0PVkx9TWYHAHT-Rvne_9nzVnV-xcsHWYB0VTs6oRbA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-10-04 17:29:32, Dmitry Baryshkov wrote:
> On Sat, 1 Oct 2022 at 19:00, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> > [..]
> > For sm6125 we also need this exact io_start (and a single PHY), do you
> > think it makes sense to add a compatible that reuses the same struct (I
> > can do that in a folloup patch) and/or generalize this struct (name)?
> >
> > However, our regulator setup appears to be different.  I recall not
> > finding any `vcca` supply in my downstream sources, and had this in my
> > notes for a similar dsi_phy_14nm.c patch:
> >
> >     sm6125 uses an RPM regulator
> >
> > https://github.com/sonyxperiadev/kernel/blob/f956fbd9a234033bd18234d456a2c32c126b38f3/arch/arm64/boot/dts/qcom/trinket-sde.dtsi#L388
> 
> I'd prefer a separate config for sm6125. This way you would be able to
> add voting on the MX domain if required.

Ack, I'll queue up a patch series for this SoC, with a dt-bindings patch
that makes the vcca register optional for the sm6125 compatible.

- Marijn
