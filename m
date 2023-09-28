Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08FB27B2248
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 18:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbjI1Q0Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 12:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229903AbjI1Q0X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 12:26:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15B5193
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 09:26:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5FEC433C7;
        Thu, 28 Sep 2023 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695918381;
        bh=3YeoBmK77jwkAjttNPSPgV+qKPQsMz8vnZFqGk3ImLs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sZ56fdBgcURX00o1ZZmaGGdUnHUY6dKGvUSkcSKbUVjHScyxvqbPHU2YIHK1srHCL
         Eut7bPwZQGzF4GN6DFKZb0ufLBgDi8xQW+vTP8+J2O5Z0wM5htOA8W1BtZ7bMLSvsy
         k6hC3nfM2PgmSowlc2z1Z475cKLQL1l6tiBD2EnmcxNtf6fJQ9WA+mTaFLsovNTPIF
         uYhcVlU10SQZh9zcqO4xRYoYq1rXSxAPRvKVMJmfSAGJ9Y14UIZSC2ePtMKT5B7qWj
         /cDsqoV/d+3jeISLzu3lKvLNn7QLfsD5BPXL1X1OR1f5Fb2ltrwVq4+E/lp6dj+2q8
         IsX370NPzEvpQ==
Received: (nullmailer pid 811759 invoked by uid 1000);
        Thu, 28 Sep 2023 16:26:17 -0000
Date:   Thu, 28 Sep 2023 11:26:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Robert Foss <rfoss@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liu Shixin <liushixin2@huawei.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, Andy Gross <agross@kernel.org>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 2/6] dt-bindings: display/msm: sdm845-dpu: Describe SDM670
Message-ID: <169591837694.811719.16275751393760332189.robh@kernel.org>
References: <20230925232625.846666-9-mailingradian@gmail.com>
 <20230925232625.846666-11-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925232625.846666-11-mailingradian@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 25 Sep 2023 19:26:29 -0400, Richard Acayan wrote:
> The SDM670 display controller has the same requirements as the SDM845
> display controller, despite having distinct properties as described in
> the catalog. Add the compatible for SDM670 to the SDM845 controller.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

