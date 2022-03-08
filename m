Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4D44D21B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Mar 2022 20:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244195AbiCHThY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 14:37:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235536AbiCHThX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 14:37:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E38854692;
        Tue,  8 Mar 2022 11:36:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 30C07B81D04;
        Tue,  8 Mar 2022 19:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BACADC340FB;
        Tue,  8 Mar 2022 19:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646768183;
        bh=oD0VhZlZShLXXL0VtyiSN7OYDVRpJLyegMXQzT9D+UA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ey77ykuhs4E7ZaV6YzBUicdBDA4cjypVH7cJtFwZVB8NnFwIFeXthZTsJUnCLmie8
         rka8c6JmvwWFY0lQKh+z1l+6QG/LA5l7xATgYgZrNMUEk8MvDsxTlQp/dRXH2jWxX7
         wlqn5cXCoOOdOJ+Y6m2M5sWQXHnUQdCkp0VksnGEcvVWeM6/nGz8xJ775oJE4LMHYn
         5UetBO5K5gJ3gxe481YktKxaNtsAInoOtcnYJ6tQGqBKROzi1EnIDVLcbNPrtqHhXC
         IwDipKRXMrQM/Gg8Scp7WnZHe8ApjUwyFiHF78Vnn0HOlpliT8qrRE8oshhaCMLPnr
         Wa6YiYmYUneRg==
Received: by mail-ej1-f52.google.com with SMTP id qa43so84436ejc.12;
        Tue, 08 Mar 2022 11:36:23 -0800 (PST)
X-Gm-Message-State: AOAM5330fP2RVMFy6lfYqW3E4Jdoff5kVwIpNwM0mFTiy3GW214a7AfA
        Z2FtoMSxPotz7SRXBV/mMV9a1Be6rT8PMCY8jA==
X-Google-Smtp-Source: ABdhPJzZzoUPz4XaizE/zi66xXVmww6DX4HQPJpJ5wI1spp5ElEOP/8Wi4Qx2bFZCZ7dUrhMObCmG0cWDv+ss8lCgpw=
X-Received: by 2002:a17:906:584:b0:6b0:8987:90af with SMTP id
 4-20020a170906058400b006b0898790afmr15279019ejn.264.1646768181983; Tue, 08
 Mar 2022 11:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 8 Mar 2022 13:36:10 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+TwPpZSZa3Jq-qYg0kUpb2ord5bWKVAwqsdVP40RKFuQ@mail.gmail.com>
Message-ID: <CAL_Jsq+TwPpZSZa3Jq-qYg0kUpb2ord5bWKVAwqsdVP40RKFuQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] dt-bindings: display/msm: add missing brace in dpu-qcm2290.yaml
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Loic Poulain <loic.poulain@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 1, 2022 at 6:14 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
> indentation for another brace, so it matches the corresponding line.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Didn't include freedreno@ in the first email, so resending.
> ---
>  Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Now that the example actually builds, we get just schema warnings:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml:
mdss@5e00000: compatible: ['qcom,qcm2290-mdss', 'qcom,mdss'] is too
long
From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml:
mdss@5e00000: 'mdp@5e01000' does not match any of the regexes:
'^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml


I would have assumed upon reporting errors with 'make
dt_binding_check' that the fixes would be tested with 'make
dt_binding_check'...

Rob
