Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5FBF4C91A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 18:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236068AbiCARgW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 12:36:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235879AbiCARgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 12:36:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956D62BB1F;
        Tue,  1 Mar 2022 09:35:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4CC8BB81BE8;
        Tue,  1 Mar 2022 17:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95E0C340F1;
        Tue,  1 Mar 2022 17:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646156137;
        bh=PEiejDSUY1k4MnU/4nOtk9UWonjtqT6nqjDBDSe2n5I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=p6QPTB1v+6ZwauZfmHyIJCwmYZEqj2Fidy4BmgQEh6J1gGUSlSPsVovYasy2RYLwQ
         kvEwemgoM4fWt4jTM/cfueD++vhS2s7N5fHOBPUP7iFZlXCb+tfhUILmHG/KOMlGzW
         PMI1UGdtrNliatVqv/0It8yGUxOCyrjLu7GeGWEgEXfcolHIB8JVK8LjcARo5QTbhf
         awzH1WG5fIWCnMKv8r1INFkfGecyc7t55Rvhcdt1OOS/jsNwiJB6Yaoy1tORm55ftn
         6m8WUn0XKnhXYl3YH/tng5sdWfJZ+RDYC6P38L3bhxS3U0KDRCBCiMP4NABCOPyeJW
         kWw05SmBNjwnA==
Received: by mail-ed1-f43.google.com with SMTP id x5so22961627edd.11;
        Tue, 01 Mar 2022 09:35:37 -0800 (PST)
X-Gm-Message-State: AOAM533fSqJi12+w7RoL6JBozJhFmLM/teMDIxPMGRknZ4r4kCr9JkmG
        DJw/4d0KuszlTfkN9nUmwn15IiO2SVGGYI9wZA==
X-Google-Smtp-Source: ABdhPJwhTYbzmnAgzwsjhoCIYrCWTDzQdNRDTWtDhUMgy4u2nP1CxHhhVU7hF4VFU3HyG9xqHf9dn54nSnSViLNBIYU=
X-Received: by 2002:aa7:d415:0:b0:410:a0fa:dc40 with SMTP id
 z21-20020aa7d415000000b00410a0fadc40mr25204137edq.46.1646156136108; Tue, 01
 Mar 2022 09:35:36 -0800 (PST)
MIME-Version: 1.0
References: <1644852547-10067-1-git-send-email-loic.poulain@linaro.org> <1644852547-10067-2-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1644852547-10067-2-git-send-email-loic.poulain@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 1 Mar 2022 11:35:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKg06h818-kMDrtROzHn8zPcjwgzWAE_q=egXPJHmg=-w@mail.gmail.com>
Message-ID: <CAL_JsqKg06h818-kMDrtROzHn8zPcjwgzWAE_q=egXPJHmg=-w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: msm: disp: add yaml schemas for
 QCM2290 DPU bindings
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 14, 2022 at 9:29 AM Loic Poulain <loic.poulain@linaro.org> wrote:
>
> QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema for DPU device
> tree bindings
>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: no change
>  v3: no change (resent with reviewed-by + freedreno list)
>
>  .../bindings/display/msm/dpu-qcm2290.yaml          | 214 +++++++++++++++++++++
>  1 file changed, 214 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml

This is now failing in linux-next. Please fix or revert:

Error: Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dts:81.3-82.1
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml]
Error 1

Rob
