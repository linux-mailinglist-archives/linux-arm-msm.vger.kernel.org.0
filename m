Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2F4B4E53E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 15:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244619AbiCWOEJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 10:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244629AbiCWOEF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 10:04:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3E17EA23;
        Wed, 23 Mar 2022 07:02:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4CE42616CA;
        Wed, 23 Mar 2022 14:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26DCC340E9;
        Wed, 23 Mar 2022 14:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648044153;
        bh=JxYjL1a/RqmPUfkRn2b3Bnz8DtavbdauzsNtNCTAyYA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oieN1aCzKvsVfn12YfFRhONaJvev2wuG5HlGd48E/hkTVcyxN5y4by+9isp6uB0qa
         sU3XvLHPErb8dH3TQrsNCPpruV8PjYxtyAbt9olbXZ8oIoYW/rf/e3qvuP302tyfiT
         MCwg7dTNW0kcum4698cWuAtfSJxWUh0F4fcZ8H+OYjGwyg7kz30NgFvfhHea+Tb9v5
         kUUP9r9rcSaCgpMbOnaFsA4/RQgYda/xERiZHXioLj476QSc+no9l93wDFvXjxdgAi
         AkSvfY64eQbYNk/Y11SszxuRpk7WtL/NrM+nMyJcb51oERc4JuRhG2bVMkXx2w0e/4
         yufXW/tfwlJxg==
Received: by mail-ej1-f50.google.com with SMTP id o10so3076315ejd.1;
        Wed, 23 Mar 2022 07:02:33 -0700 (PDT)
X-Gm-Message-State: AOAM532KESkBXdubdWibucwVD2CGwBDs2eQq6b9Ro4n8wQ4fmi0VmTaT
        4UbZxdJUgVGFiDwftZcvwZjNCR/cjhEzov4ueQ==
X-Google-Smtp-Source: ABdhPJx2TFWrM7icRG1WmcNLDv99GAOvmhqZlzEVH4q/kNWKTlIGOLxQ9V863+3ejraj2Zqd64uKHsl0Oob/a0vBacY=
X-Received: by 2002:a17:906:d204:b0:6d6:df17:835e with SMTP id
 w4-20020a170906d20400b006d6df17835emr119400ejz.20.1648044145846; Wed, 23 Mar
 2022 07:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org> <CAL_Jsq+TwPpZSZa3Jq-qYg0kUpb2ord5bWKVAwqsdVP40RKFuQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+TwPpZSZa3Jq-qYg0kUpb2ord5bWKVAwqsdVP40RKFuQ@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 23 Mar 2022 09:02:13 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+dQDBoWST6+HfhsQjT4=Gks2F72S7iPyHzapp2eEdwfA@mail.gmail.com>
Message-ID: <CAL_Jsq+dQDBoWST6+HfhsQjT4=Gks2F72S7iPyHzapp2eEdwfA@mail.gmail.com>
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
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 8, 2022 at 1:36 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Mar 1, 2022 at 6:14 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
> > indentation for another brace, so it matches the corresponding line.
> >
> > Reported-by: Rob Herring <robh@kernel.org>
> > Cc: Loic Poulain <loic.poulain@linaro.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Didn't include freedreno@ in the first email, so resending.
> > ---
> >  Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Now that the example actually builds, we get just schema warnings:
>
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml:
> mdss@5e00000: compatible: ['qcom,qcm2290-mdss', 'qcom,mdss'] is too
> long
> From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml:
> mdss@5e00000: 'mdp@5e01000' does not match any of the regexes:
> '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
> From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
>
>
> I would have assumed upon reporting errors with 'make
> dt_binding_check' that the fixes would be tested with 'make
> dt_binding_check'...

Still failing. Please send a fix ASAP.

Rob
