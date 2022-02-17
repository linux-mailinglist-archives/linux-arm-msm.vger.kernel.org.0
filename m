Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 308D24BAB32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 21:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242964AbiBQUmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 15:42:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiBQUmN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 15:42:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5536274;
        Thu, 17 Feb 2022 12:41:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2AFB1B821B4;
        Thu, 17 Feb 2022 20:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93071C340ED;
        Thu, 17 Feb 2022 20:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645130515;
        bh=FfuWLt2qkFo49yUGcc9UTipqYLvnJTGZKpodO+8tvgY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TX9ekv8amg/IDCa7aQx2MypntcxhNwrT8J7EbTTpNFfLxyUfQMs0aRHM6nQpJp7/i
         0E9/wLSW2xm4sRlDnBrl2w7i0VPLQ+WmKzzU0RFFBaI0PvKfj+xjBVtPkbgdjjrOZk
         a1wx/EkUwJePsXTNevAQx66lbxucssn74NrM2k+F96fjzLxMZn5QxtjAKxZac67CnF
         utm/XWfX7WtladfXZfHCbiQCbbBb77nmUI/eBsT7F6cfbPVdzaabuKffADZOzGWae1
         cNSiwhC/js7yindqN0QLBoNO4CdtxyBvJyrI0oMdB57juTF4LOGn3yjj2JvPmmntdP
         8pA7bsh1SVe4w==
Received: by mail-ed1-f48.google.com with SMTP id w3so11795701edu.8;
        Thu, 17 Feb 2022 12:41:55 -0800 (PST)
X-Gm-Message-State: AOAM530LczmgtWSrYIoSdj0VpWsh+KlwEYIWSOguzelpCwizedydBsgM
        oGmcjAplliUw6I8wbYz1wIiTOhN34d2LrUFmdw==
X-Google-Smtp-Source: ABdhPJxVNuENXfDdPdWGPvTwokJkWjnZtAChSuCjq5CILCN23vtVYVrmGGzs9RIT+XdlpxE7KlkyLI1tVDcs1CD2gbg=
X-Received: by 2002:a05:6402:5242:b0:40f:6a4f:ff33 with SMTP id
 t2-20020a056402524200b0040f6a4fff33mr4733548edd.30.1645130513931; Thu, 17 Feb
 2022 12:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20220217113004.22757-1-michael.srba@seznam.cz>
 <20220217113004.22757-3-michael.srba@seznam.cz> <1645130031.752215.3729187.nullmailer@robh.at.kernel.org>
In-Reply-To: <1645130031.752215.3729187.nullmailer@robh.at.kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 17 Feb 2022 14:41:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJkVmkApJHcXmujW3yx3GVScb-hjN=KTwtpmQYooAKz0g@mail.gmail.com>
Message-ID: <CAL_JsqJkVmkApJHcXmujW3yx3GVScb-hjN=KTwtpmQYooAKz0g@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] dt-bindings: bus: add device tree bindings for qcom,ssc-block-bus
To:     Michael Srba <michael.srba@seznam.cz>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 17, 2022 at 2:33 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 17 Feb 2022 12:30:02 +0100, michael.srba@seznam.cz wrote:
> > From: Michael Srba <Michael.Srba@seznam.cz>
> >
> > This patch adds bindings for the AHB bus which exposes the SCC block in
> > the global address space. This bus (and the SSC block itself) is present
> > on certain qcom SoCs.
> >
> > In typical configuration, this bus (as some of the clocks and registers
> > that we need to manipulate) is not accessible to the OS, and the
> > resources on this bus are indirectly accessed by communicating with a
> > hexagon CPU core residing in the SSC block. In this configuration, the
> > hypervisor is the one performing the bus initialization for the purposes
> > of bringing the haxagon CPU core out of reset.
> >
> > However, it is possible to change the configuration, in which case this
> > binding serves to allow the OS to initialize the bus.
> >
> > Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
> > ---
> >  NOTE: this applies against v5.17-rc4 just fine; dt_binding_check seems
> >        to have an issue with indentation, but the indentation looks correct
> >        to me as well as to local dt_binding_check; also, it seems that the
> >        rest of this series doesn't get applied before checking for compile
> >        errors on the example, which results in missing defines for
> >        GCC_IM_SLEEP, AGGRE2_SNOC_NORTH_AXI, SSC_XO, and SSC_CNOC_AHBS_CLK.
> >
> >  CHANGES:
> >  - v2: fix issues caught by by dt-schema
> >  - v3: none
> >  - v4: address the issues pointed out in the review
> >  - v5: clarify type of additional properties; remove ssc_tlmm node for now
> >  - v6: none
> > ---
> >  .../bindings/bus/qcom,ssc-block-bus.yaml      | 143 ++++++++++++++++++
> >  1 file changed, 143 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.yaml:86:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

Please fix your yamllint install (or lack of).

> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.example.dts:39.32-33 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:378: Documentation/devicetree/bindings/bus/qcom,ssc-block-bus.example.dt.yaml] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1398: dt_binding_check] Error 2

This failure can be ignored. I believe the problem is with my script
applying series without a cover letter. However, series should have a
cover letter.

Rob
