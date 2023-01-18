Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6347F6723CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 17:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbjARQne (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 11:43:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbjARQnG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 11:43:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E035367C5;
        Wed, 18 Jan 2023 08:42:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4DF38618F5;
        Wed, 18 Jan 2023 16:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B5FC4339B;
        Wed, 18 Jan 2023 16:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674060142;
        bh=lLru/ueyKXFJd97kgjfmvSzjxNHkeY2Xg+vEpCO45z0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TiiCODxs7dUpZp3QKKA32T4j251CuP6Q4yvHvFaVWdQ8AD1cCPC7BGpgTglSAKZ66
         wp4LkYvCWgCVUQAK59gWlKVTC/AoRA8IsKsqPrJLxc+yaQ/gZ18daE5YOAI3hkORlH
         mTXqjGWw4ugkeVN8gNyKHkBhTaUAKNVuEzBO/6iKpHQLBJGDs+/cxWAfv9uMcNN5WK
         hLuysVqEoIvgkVPAb3eopqRv6IWSH9t+tWsrOs7MpRu/izDddiwyfydhKkDHkrjqlm
         8CQcuNJgmPbxziQTvxgXatsAgJuw/Zq3r6h5q3+YixVv4PG1wUjLd75b+fKQrjlhzX
         fXhR2Q/7nke3w==
Received: by mail-vs1-f41.google.com with SMTP id d66so23900073vsd.9;
        Wed, 18 Jan 2023 08:42:22 -0800 (PST)
X-Gm-Message-State: AFqh2krLI3JqWc/9IPyK0NoG1zBUyCWIDzzNdmMpNMgvgJB4iF9ZXXnr
        p6qGjr2MmrsKBgKoNmjPjFg1ZaoETLx5rPWO4Q==
X-Google-Smtp-Source: AMrXdXs02ooa1JazZ/NMbxjasnSaPRPt3yvvlORq6f5Ei4Us34TTHAxwXTd5eSYHc5K2XU64xoQEMfgDmfg/lpSYEWQ=
X-Received: by 2002:a05:6102:5490:b0:3b5:1fe4:f1c2 with SMTP id
 bk16-20020a056102549000b003b51fe4f1c2mr1050100vsb.0.1674060141574; Wed, 18
 Jan 2023 08:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
 <20230118032432.1716616-5-dmitry.baryshkov@linaro.org> <167406005824.137582.10336637561777246237.robh@kernel.org>
In-Reply-To: <167406005824.137582.10336637561777246237.robh@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 18 Jan 2023 10:42:10 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+_SNyZXihPr9aS-pw1YC+fNNYfc2J-S4vx5+Fhs+k+FA@mail.gmail.com>
Message-ID: <CAL_Jsq+_SNyZXihPr9aS-pw1YC+fNNYfc2J-S4vx5+Fhs+k+FA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-binbings: display/msm: dsi-controller-main: add
 missing supplies
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 18, 2023 at 10:41 AM Rob Herring <robh@kernel.org> wrote:
>
>
> On Wed, 18 Jan 2023 05:24:32 +0200, Dmitry Baryshkov wrote:
> > Describe DSI supplies used on apq8064 (vdda-supply) and msm8994/96
> > (vcca-supply).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
>
> Acked-by: Rob Herring <robh@kernel.org>

That is, with the typo in the subject fixed.
