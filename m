Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E14516C30A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 14:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729721AbgBYN6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 08:58:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:37172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729253AbgBYN6c (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 08:58:32 -0500
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5BB8424676;
        Tue, 25 Feb 2020 13:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582639111;
        bh=t6y4ed1PLF1YCpiLXkMfIss2UpXqGJbG2hojsdADI9g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=f32zw9C0HfAdsMFNkR/SSZgTMMd51Yox8rfhODv5V66ybbzFYX82uNSO9d8WnnZOW
         jroenNy7iLx1B2AIc/gPxv3Vo4wHCTw8ivpk4ssE2LEYAXVY5LPULd7Ersj6VQTrmg
         8efTrJSNPey+Gan+KmEaUudMJEQZ8NEr2FCyPF8I=
Received: by mail-qk1-f178.google.com with SMTP id j8so11934784qka.11;
        Tue, 25 Feb 2020 05:58:31 -0800 (PST)
X-Gm-Message-State: APjAAAXA3S0rBc2BzCVM0eAKlRq7a2efW21V9kx0vSWkHOTSl2mVew/D
        2rPSmNQG7aDUA7d6F2vhe/E8yWYQtwRbXg5Zqw==
X-Google-Smtp-Source: APXvYqycr1cIrkZDL636h3Say9Q5rIeytzoWFbqhPQujtpYITXrOa2jNW6Rhb9XWTsPBcgeSvBtiMfIR22F5FTfDteY=
X-Received: by 2002:a05:620a:1237:: with SMTP id v23mr39928955qkj.223.1582639110486;
 Tue, 25 Feb 2020 05:58:30 -0800 (PST)
MIME-Version: 1.0
References: <1582540703-6328-1-git-send-email-tdas@codeaurora.org>
 <1582540703-6328-4-git-send-email-tdas@codeaurora.org> <20200224184201.GA6030@bogus>
 <eec22330-2bf4-f4f5-3d28-6b69aa71f992@codeaurora.org>
In-Reply-To: <eec22330-2bf4-f4f5-3d28-6b69aa71f992@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 25 Feb 2020 07:58:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKRr3aOpcbPOtkArxnnJOBd-XaUGRVesR_CnA11pFHYXQ@mail.gmail.com>
Message-ID: <CAL_JsqKRr3aOpcbPOtkArxnnJOBd-XaUGRVesR_CnA11pFHYXQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 24, 2020 at 11:49 PM Taniya Das <tdas@codeaurora.org> wrote:
>
> Hi Rob,
>
> On 2/25/2020 12:12 AM, Rob Herring wrote:
>
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> > Error: Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dts:21.26-27 syntax error
> > FATAL ERROR: Unable to parse input tree
> > scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml' failed
> > make[1]: *** [Documentation/devicetree/bindings/clock/qcom,sc7180-mss.example.dt.yaml] Error 1
> > Makefile:1263: recipe for target 'dt_binding_check' failed
> > make: *** [dt_binding_check] Error 2
> >
> > See https://patchwork.ozlabs.org/patch/1242999
> > Please check and re-submit.
> >
>
> The error shows syntax error at line 21, below is the example.dts from
> my tree and would compile for me as I have the dependency of the include
> file when I compile.

The header should be part of this patch if possible.

Rob
