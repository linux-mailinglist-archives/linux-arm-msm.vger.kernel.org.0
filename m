Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164BB5BB335
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 22:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbiIPUHB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 16:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbiIPUGt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 16:06:49 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A78A2AB8
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 13:06:47 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id w10-20020a056830410a00b00655d70a1aeaso3208555ott.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 13:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hgnUqlACSahkkKGPSxg+d/+QJ7Obq2vwSzlhBetjicM=;
        b=X/bCGjcyPoH3ZRseX4Ic3CbiODiqKLJ2a7EaCBnMMftyxg0C60f1DaF+bzDPWgTlXk
         xDp/uVNwdC87eRj0FtRviZEUCQb/TZ8lf3Hej9QdDhbiRLc18jvK+qKKTFrt/uCqteTp
         aNvUJ3XtfusS86JtD4fN+Y5FSNJ2JdenFitS+MXqGEgLJmOVsUR4NtdEzomYyOLtghrc
         xYROzzzCUHKyk7B/dkrVZ2Jj/s7NBetCK+I7z+ux43xlAOcDmW2XLLgwDN6F2PDVxAoZ
         a0/ah0WoCw5Sf99NF2dssAH1EszyJ5xbTn6fxQugDOFOuTXv1mQl0CPRDKkluwqwTZQH
         iXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hgnUqlACSahkkKGPSxg+d/+QJ7Obq2vwSzlhBetjicM=;
        b=rMllmD7fmvO4dLdNdcb82txMHfEBE/wHbNVVf9BOtl8/jyQeLuDRpxbCQVuRxHh+Jy
         FENMD9c88ABkevdjVH8WEPuSzqsMEPOenjtNlXg2SzVSLJaVykzU4MXFwQSJxHCvK8yG
         PFR1YJjg4w9Pidr5So8vfwp7KpDTP9CTK24UuZiujZ9BWQewoT7O3qAKr20JzyPVyOsa
         D+G8rYvDQIN3RAfZdPbjFQJCnotnUHIQvIQmauSdhswhRSlV2vDhKv/LVdLR/WjUplFK
         Dmo9KAjzDdCwa/0XljunB6xwiKw45zqSAnb4BG2X2GhFQSbV0nBX0XODbrrfigQfmCpW
         xlZQ==
X-Gm-Message-State: ACrzQf3PXOb5aAkPWvLZ1/PBkNxFdY6mpEc57dgcZp2oOnL3+f9a8FN2
        s1ldiSOya2VevqeSRGW6+Wqao0ecactvZ1wuoIkAKw==
X-Google-Smtp-Source: AMsMyM4LI/haScjx+w75HX53rbGxUkpFeFMWYeiCk3r+ArZJjJnJwxpPmfr16vcieKDggrmQoZdaIB7/Fn509SXH87s=
X-Received: by 2002:a9d:6458:0:b0:657:90f0:9c49 with SMTP id
 m24-20020a9d6458000000b0065790f09c49mr3068037otl.50.1663358807147; Fri, 16
 Sep 2022 13:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220914142256.28775-1-ansuelsmth@gmail.com> <20220914142256.28775-3-ansuelsmth@gmail.com>
 <20220916191715.GA1079300-robh@kernel.org> <6324d1be.050a0220.9d842.7b47@mx.google.com>
In-Reply-To: <6324d1be.050a0220.9d842.7b47@mx.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 16 Sep 2022 23:06:35 +0300
Message-ID: <CAA8EJprEQOsm4TxGWJYZo04D1PagT3QmhDdYQkEid-KSP-tpTw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: arm: msm: Convert kpss-acc driver
 Documentation to yaml
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Takashi Iwai <tiwai@suse.de>,
        Christian Brauner <brauner@kernel.org>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Marc Herbert <marc.herbert@intel.com>,
        James Smart <jsmart2021@gmail.com>,
        Justin Tee <justin.tee@broadcom.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 16 Sept 2022 at 22:43, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> On Fri, Sep 16, 2022 at 02:17:15PM -0500, Rob Herring wrote:
> > On Wed, Sep 14, 2022 at 04:22:53PM +0200, Christian Marangi wrote:
> > > Convert kpss-acc driver Documentation to yaml.
> > > The original Documentation was wrong all along. Fix it while we are
> > > converting it.
> > > The example was wrong as kpss-acc-v2 should only expose the regs but we
> > > don't have any driver that expose additional clocks. The kpss-acc driver
> > > is only specific to v1. For this exact reason, limit all the additional
> > > bindings (clocks, clock-names, clock-output-names and #clock-cells) to
> > > v1 and also flag that these bindings should NOT be used for v2.
> >
> > Odd that a clock controller has no clocks, but okay.
> >
>
> As said in the commit v2 is only used for regs. v2 it's only used in
> arch/arm/mach-qcom/platsmp.c to setup stuff cpu hotplug and bringup.
>
> Should we split the 2 driver? To me the acc naming seems to be just
> recycled for v2 and it's not really a clk controller.
>
> So keeping v2 in arm/msm/qcom,kpss-acc-v2.yaml and v1 moved to clock?

I suspect that qcom,kpss-acc-v2 is misnamed as the "clock-controller".
According to msm-3.10, these regions are used by the Krait core
regulators.

-- 
With best wishes
Dmitry
