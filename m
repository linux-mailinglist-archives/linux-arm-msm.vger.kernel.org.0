Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB017B2222
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 18:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbjI1QUl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 12:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjI1QUk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 12:20:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABBCB7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 09:20:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771B6C433C7;
        Thu, 28 Sep 2023 16:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695918038;
        bh=UlmHL2MYIeetXX5KGpkapFIPaVtMKWJwuBP9544pnao=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RGJH7sGHDCCRByzAB10xIGEEni1DnJfJy2JvFhPdHSIytggfSgwIFMzw9bFHfFTfZ
         2acZhEPPXXiQ+46eCnSpX2cZDBpQDKypnDVegs9fAqYb1uzr2kGSqYPlfaxX921rVR
         UlH6WJ5uYRmYqmn7ztkX11QD8N1OyxTviyZXgwIy/pJmDtnU1Ui8TtQSa0FA3mlRwt
         lRZWVmAHIvUkIfMi4QHMAJpXWAVrYrX1B1UmpCxJjBjrAeur7YijJgNphgVpx6rig1
         8EiDuD2cXyyhJ9FDvD7T/w+WGF3TSzwKeY2K2hpw/hhO3RnMXmnzFOcrI2GVfVdQFp
         MU4L8IRA+bXMw==
Received: (nullmailer pid 756683 invoked by uid 1000);
        Thu, 28 Sep 2023 16:20:33 -0000
Date:   Thu, 28 Sep 2023 11:20:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        David Airlie <airlied@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Robert Foss <rfoss@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Ryan McCann <quic_rmccann@quicinc.com>,
        freedreno@lists.freedesktop.org,
        Liu Shixin <liushixin2@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 1/6] dt-bindings: display/msm: dsi-controller-main: add
 SDM670 compatible
Message-ID: <169591803268.756483.10293315880191956926.robh@kernel.org>
References: <20230925232625.846666-9-mailingradian@gmail.com>
 <20230925232625.846666-10-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925232625.846666-10-mailingradian@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 25 Sep 2023 19:26:28 -0400, Richard Acayan wrote:
> The SDM670 has DSI ports. Add the compatible for the controller.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

