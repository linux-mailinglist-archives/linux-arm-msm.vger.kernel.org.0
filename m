Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA5C5B3CDE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 18:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbiIIQWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 12:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbiIIQWk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 12:22:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD49134634;
        Fri,  9 Sep 2022 09:22:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D6FBAB82588;
        Fri,  9 Sep 2022 16:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94184C433B5;
        Fri,  9 Sep 2022 16:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662740556;
        bh=7fF4IrN6AlYfdpqogMPqCGxOLOmLXkA8Gdztj+5igwI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tK7V1bC1/PF4UjMeLoMRV/BaGeSiKYwrr1rFWc46kcS3v7zQxJ5QXOLgd4Dd8b3zp
         /hSBaib08e2Ca9xiaQWUMA7UjvH03CD0FaIfxawh6oW2bLZoMj1D/zHEo6x4TxhD4u
         HLMi2e7I/Lbv4CbTFip3JrQ9cmcX6ix3T4vSwdc7tk5QZWSESbHuKIyYDMV7Fc569v
         /FXbjzZYzAQ5wg3nenMJWtoYLrhLEOomALnUVcqFe1dciX1ee7zMAixHvxCu78WBdR
         WcPGPVXLziY9alwflY3jJo5iFpqCQX2IN/swd5hkTMAPFvm66xU/7DU+FWSNJcod2p
         16cG7OnDNO4og==
Received: by mail-vk1-f176.google.com with SMTP id b81so1016698vkf.1;
        Fri, 09 Sep 2022 09:22:36 -0700 (PDT)
X-Gm-Message-State: ACgBeo3C5UwvN+lxfAWC1lEzPd9DVfXkVz7Jy37l5zTYZ78WN4J3kveC
        x3o40lz4edWj2rBdVpL1Duz7dZRyf+6PwNDYMg==
X-Google-Smtp-Source: AA6agR7XYr3chyHIilodtUy3m/zNckZhkiWyrNWArks+2XjFCWJnDFiXBa11ro9RGam0OhRasAN7wBNI2DAXRhTRnYE=
X-Received: by 2002:a1f:2995:0:b0:39e:9c49:7f60 with SMTP id
 p143-20020a1f2995000000b0039e9c497f60mr5155705vkp.14.1662740555480; Fri, 09
 Sep 2022 09:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220908181432.458900-1-stephan.gerhold@kernkonzept.com> <20220909161652.GA1448908-robh@kernel.org>
In-Reply-To: <20220909161652.GA1448908-robh@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 9 Sep 2022 11:22:23 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKVb54yckiky79mK5FdEf-Vf7SyVU01Jdpo9whOqq0spQ@mail.gmail.com>
Message-ID: <CAL_JsqKVb54yckiky79mK5FdEf-Vf7SyVU01Jdpo9whOqq0spQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,smd-edge: Add APR/FastRPC
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 9, 2022 at 11:16 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 08 Sep 2022 20:14:32 +0200, Stephan Gerhold wrote:
> > Similar to qcom,glink-edge.yaml the smd-edge can also contain
> > apr/fastrpc nodes for functionality exposed by the modem or audio DSP.
> >
> > These nodes are already used in existing device trees, adding them
> > fixes the following dtbs_check warnings after converting
> > qcom,msm8916-mss-pil to DT schema:
> >
> > arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: remoteproc@4080000: smd-edge:
> > Unevaluated properties are not allowed ('fastrpc' was unexpected)
> >   From schema: remoteproc/qcom,msm8916-mss-pil.yaml
> >
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> > ---
> > Since qcom,fastrpc.yaml only exists in Rob's tree right now and
> > a similar change for qcom,glink-edge.yaml was applied there it is
> > probably easiest if this patch goes through Rob's tree as well.
> > ---
> >  .../devicetree/bindings/remoteproc/qcom,smd-edge.yaml  | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
>
> Applied, thanks!

And dropped for Krzysztof's series instead.

Rob
