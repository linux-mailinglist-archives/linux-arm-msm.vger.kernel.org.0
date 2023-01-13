Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81E9D66A4FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 22:18:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbjAMVSQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 16:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbjAMVR6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 16:17:58 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC0148E9A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:15:05 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id t15so23907045ybq.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rE5GJmOWoLrmmtmr1ZiRc6lZFA32Ba8YbTIiq8KjYCU=;
        b=FbJNsENvCy8Q3dEkgzHZ2B+QydIyecG+w7hnVY1jI+O3K866Fs/TyVz+PSQeAFHS8P
         qkGTGdkeB/ttCAtTOlOTsmclCJMp4Rj5N2kLAQW9a5eE0aG3on81N1iy2XrjxwaBQA38
         PsqorpTvfS/snpkyxDBAVfZwrWqok7wrqwMOsfLLyOP1Er6LO8x82me0cvB4FdZFozmf
         CWunX4JJAYyF81qLTuy8WfqLZzX6tjjtXu+uA+3gxW7UQw68D5Z0e1rXn0FIj4y63QWl
         WLKPP/YuHMKq0CLBnR7N4a2eKQ6oKU4YOXLYR6kI8xNw+rTExeBtmFS3NObr2bYOvM6u
         oynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rE5GJmOWoLrmmtmr1ZiRc6lZFA32Ba8YbTIiq8KjYCU=;
        b=wbAvH0F6huWtlkuV0AsqNARQ9V4kdz+SHBW1FCrYEaBnQ8JEqcig4qjqMBHObZjpTi
         BRckySplo7rSINqMjbyA1gup334nX8NY2fqMygWEtwFQIfDYKUcvthVuqZ14v6h7kfTs
         Xr9F//ltU7MlsELyDlma/iyLLmsYxwpVkrmurQNSusi7RjWTTCc9As96YsKW7k5WNW+Q
         DOqiKANqxMFC0h1jggEJUXKsGHCrA9FN90RXQAX83Z7+PzPOOdzYvxuJLZpFPaqDRkOr
         qGDykJTe+zhPgPFOKwxSPyOUe41+RZwykPFGlsyEcoIroTpb74ubtmqpy2bSM3yb+dYE
         tgrw==
X-Gm-Message-State: AFqh2kq2j4tjBUJkCePBDmVtH0fSEFtaDE4TShnWo7e6w1Csy3f33umM
        TtrKJs4M+jlKtLuYVUYw1D7VNLAG4AtY0AMAu/Tdlg==
X-Google-Smtp-Source: AMrXdXufM+a0cNtAKwMruSwOhgbSmi5XuyfWOrdPyVuvRaWuv8J3cB39OBZ954HOwr1pSUGSX4+KqoQrdXapS/PccDg=
X-Received: by 2002:a25:606:0:b0:709:9335:236e with SMTP id
 6-20020a250606000000b007099335236emr7297951ybg.288.1673644503066; Fri, 13 Jan
 2023 13:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20230113063351.24131-1-dmitry.baryshkov@linaro.org> <20230113210807.GA2901424-robh@kernel.org>
In-Reply-To: <20230113210807.GA2901424-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 13 Jan 2023 23:14:52 +0200
Message-ID: <CAA8EJppi2254wTxMhC=M=Cfo3eA+K0aVqDVzbFAbYHCTnFF85w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display/msm/dsi-phy: drop unused allOf clauses
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 13 Jan 2023 at 23:08, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Jan 13, 2023 at 08:33:51AM +0200, Dmitry Baryshkov wrote:
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/dsi-phy-10nm.yaml          | 3 +--
> >  .../devicetree/bindings/display/msm/dsi-phy-14nm.yaml          | 3 +--
> >  .../devicetree/bindings/display/msm/dsi-phy-20nm.yaml          | 3 +--
> >  .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml          | 3 +--
> >  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 3 +--
> >  5 files changed, 5 insertions(+), 10 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> > index 3ec466c3ab38..71702151bafa 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> > @@ -9,8 +9,7 @@ title: Qualcomm Display DSI 10nm PHY
> >  maintainers:
> >    - Krishna Manikandan <quic_mkrishn@quicinc.com>
> >
> > -allOf:
> > -  - $ref: dsi-phy-common.yaml#
> > +$ref: dsi-phy-common.yaml#
>
> Convention is how it was. Partly this is legacy because earlier versions
> of json-schema required the 'allOf' form or everything in addition to
> the $ref would be ignored. I left these thinking more than 1 $ref here
> might be common. But probably more common is a $ref and if/then schemas
> and I'd somewhat rather keep $ref at the top and if/then schemas at the
> bottom. So maybe this is the right direction.
>
> I don't really care to define one way or the other if we can't enforce
> it in the meta-schema. I don't need more nits to look for in reviews.
> Adding a check (i.e. allOf must have 2 or more entries) would be quite
> invasive and wouldn't allow having 1 entry when we expect a 2nd entry
> soonish.

Ack, I'll drop the patch for now then, If I got your message correctly.


-- 
With best wishes
Dmitry
