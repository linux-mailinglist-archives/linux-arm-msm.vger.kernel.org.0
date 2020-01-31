Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E7514F0C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 17:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgAaQnj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 11:43:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:33398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726193AbgAaQnj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 11:43:39 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 139242082E;
        Fri, 31 Jan 2020 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580489018;
        bh=dcG8NLMUHRnjiTnnFkv7SM8FQTdo7P01F6ozQIzzroY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XBNpfievlG4NIexK/B5BVWR7d1MGF+OlKAifaYr1ZU8Y9TOxykWDdPhMQggLXzE2i
         m5RmoOEFgDSp2lgqKI4Lpfn3jnWb3uPIFJNtBZ0whtL8QXHR4qjZ6Aq0VkPc/FTion
         7BIU1RZ6hUXNmnGxFDW6TC9sxf4KnZZrayysm3+o=
Received: by mail-qt1-f170.google.com with SMTP id h12so5911007qtu.1;
        Fri, 31 Jan 2020 08:43:38 -0800 (PST)
X-Gm-Message-State: APjAAAX9QFjJktmMN09l9JPpoCPl0w543IWT/xX86mQ0QjCrzpi/Uh0D
        iBe2kx3jt1G4hDRGJAnRT8NNIYKiUPUQWlz9oA==
X-Google-Smtp-Source: APXvYqwCAPGiNXBSYn6EM/ra6iIgv+Org4yFgElqW19yZ4ehMloqYiN9lT1FOFl8JlJVA/yMDf4WZx8drnrxynECj9Y=
X-Received: by 2002:ac8:6747:: with SMTP id n7mr11498995qtp.224.1580489017216;
 Fri, 31 Jan 2020 08:43:37 -0800 (PST)
MIME-Version: 1.0
References: <20200130211231.224656-1-dianders@chromium.org> <20200130131220.v3.7.I513cd73b16665065ae6c22cf594d8b543745e28c@changeid>
In-Reply-To: <20200130131220.v3.7.I513cd73b16665065ae6c22cf594d8b543745e28c@changeid>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 31 Jan 2020 10:43:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLj8WbP=oXAovyVFOc-58eFr5xS5EJK=kpAK-eT7_TyNw@mail.gmail.com>
Message-ID: <CAL_JsqLj8WbP=oXAovyVFOc-58eFr5xS5EJK=kpAK-eT7_TyNw@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] dt-bindings: clock: Fix qcom,gpucc bindings for sdm845/sc7180/msm8998
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 30, 2020 at 3:12 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The qcom,gpucc bindings had a few problems with them:
>
> 1. When things were converted to yaml the name of the "gpll0 main"
>    clock got changed from "gpll0" to "gpll0_main".  Change it back for
>    msm8998.
>
> 2. Apparently there is a push not to use purist aliases for clocks but
>    instead to just use the internal Qualcomm names.  For sdm845 and
>    sc7180 (where the drivers haven't already been changed) move in
>    this direction.
>
> Things were also getting complicated harder to deal with by jamming
> several SoCs into one file.  Splitting simplifies things.
>
> Fixes: 5c6f3a36b913 ("dt-bindings: clock: Add YAML schemas for the QCOM GPUCC clock bindings")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Added pointer to inlude file in description.
> - Everyone but msm8998 now uses internal QC names.
> - Fixed typo grpahics => graphics
> - Split bindings into 3 files.
>
> Changes in v2:
> - Patch ("dt-bindings: clock: Fix qcom,gpucc...") new for v2.
>
>  .../devicetree/bindings/clock/qcom,gpucc.yaml | 72 -------------------
>  .../bindings/clock/qcom,msm8998-gpucc.yaml    | 66 +++++++++++++++++
>  .../bindings/clock/qcom,sc7180-gpucc.yaml     | 72 +++++++++++++++++++
>  .../bindings/clock/qcom,sdm845-gpucc.yaml     | 72 +++++++++++++++++++
>  4 files changed, 210 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8998-gpucc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-gpucc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm845-gpucc.yaml

I'm not seeing any differences in sdm845 and sc7180. Do those really
need to be separate? It doesn't have to be all combined or all
separate.

Rob
