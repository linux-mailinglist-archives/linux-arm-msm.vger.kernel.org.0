Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD2E1700D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 15:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbgBZOLF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 09:11:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:60486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727127AbgBZOLE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 09:11:04 -0500
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4388B24685;
        Wed, 26 Feb 2020 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582726263;
        bh=uaxhrG2+qYrxEy77XEkuFEqR8wmasHFTTjlXFbJwFOo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oS5kHYoBFGoNhZ2vYgzWChng1LoOu1/m+yGHz8fud9iAm3a8dw0YjR8Tq2FMLD7Pc
         mExj5NQgkzjs/PJ2pPdGrwuSczbKa/fle7375DVYDyTLoflf3ssG0EPu8/2P+4z0af
         1rWrJT2clzlCOG+3i2IKzpGooSqfWEaXu91NjJYY=
Received: by mail-qk1-f174.google.com with SMTP id 145so2736086qkl.2;
        Wed, 26 Feb 2020 06:11:03 -0800 (PST)
X-Gm-Message-State: APjAAAVLdGd22eF0ku3PE/aPbW4MU1Q7ALLu4mwRtmgnQTuYHv2naa9d
        rXeQmFpDY0Q+xQqrLzQ85l78kO9T+q/1QSUv9g==
X-Google-Smtp-Source: APXvYqwrXOVrjkVnM7tWc7OJZxdwuYTlCyBnf9Tjy7k+sJEvvVSTYyACDZA2PP4X7nvvkglS3cLLt3wFTI0radZS7VU=
X-Received: by 2002:ae9:f205:: with SMTP id m5mr5761202qkg.152.1582726262401;
 Wed, 26 Feb 2020 06:11:02 -0800 (PST)
MIME-Version: 1.0
References: <1582540703-6328-1-git-send-email-tdas@codeaurora.org>
 <1582540703-6328-4-git-send-email-tdas@codeaurora.org> <20200224184201.GA6030@bogus>
 <eec22330-2bf4-f4f5-3d28-6b69aa71f992@codeaurora.org> <CAL_JsqKRr3aOpcbPOtkArxnnJOBd-XaUGRVesR_CnA11pFHYXQ@mail.gmail.com>
 <158267707817.177367.4165827948994155128@swboyd.mtv.corp.google.com>
In-Reply-To: <158267707817.177367.4165827948994155128@swboyd.mtv.corp.google.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 26 Feb 2020 08:10:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJiB08vtDKP18Xzdzan-2TFVxJJ-rFgvXsqVHKB5-L18g@mail.gmail.com>
Message-ID: <CAL_JsqJiB08vtDKP18Xzdzan-2TFVxJJ-rFgvXsqVHKB5-L18g@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT <linux-soc@vger.kernel.org>, linux-clk
        <linux-clk@vger.kernel.org>, linux-kernel@vger.kernel.org
        <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>," 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 25, 2020 at 6:31 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Rob Herring (2020-02-25 05:58:19)
> > On Mon, Feb 24, 2020 at 11:49 PM Taniya Das <tdas@codeaurora.org> wrote:
> > >
> > > Hi Rob,
> > >
> > > On 2/25/2020 12:12 AM, Rob Herring wrote:
> > >
> > > >
> > > > My bot found errors running 'make dt_binding_check' on your patch:
> > > >
> > > > Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> > > > Error: Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dts:21.26-27 syntax error
> > > > FATAL ERROR: Unable to parse input tree
> > > > scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml' failed
> > > > make[1]: *** [Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml] Error 1
> > > > Makefile:1263: recipe for target 'dt_binding_check' failed
> > > > make: *** [dt_binding_check] Error 2
> > > >
> > > > See https://patchwork.ozlabs.org/patch/1242999
> > > > Please check and re-submit.
> > > >
> > >
> > > The error shows syntax error at line 21, below is the example.dts from
> > > my tree and would compile for me as I have the dependency of the include
> > > file when I compile.
> >
> > The header should be part of this patch if possible.
> >
>
> Are patches tested in isolation instead of in series? I see this define
> in the first patch in this series so it seems like automated checkers
> should be able to apply the patches in series and see if they still
> work, unless that is broken somehow.

The series should be applied, but it's all very fragile. It's going to
stay that way until someone else writes and maintains the applying
patches to git logic.

In any case, the header is part of the binding (being an ABI) not the
driver, so it belongs in the binding patch.


However, in this case, the problem was pointed out in v4 to be a typo
in GCC_MSS_MFAB_AXIS_CLK.

Rob
