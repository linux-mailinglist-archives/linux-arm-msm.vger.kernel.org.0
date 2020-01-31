Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6743C14F0B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 17:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgAaQjA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 11:39:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:59166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726668AbgAaQjA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 11:39:00 -0500
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 13623206F0;
        Fri, 31 Jan 2020 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580488739;
        bh=VpI6Sp9ytbmILt/JCxZcpGcjyWABm9z0PduVBfUuexE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YCfulT6I2cb7jMb72PzcxWhVL7n8wE3Sa2stzAyLWG4uiKC2ylEQmfGSneYLyTZLK
         5Uri9fjYhW8gYJTlud5zB0xOkC4JfUCurZE9vJ5wstCRoFos+TtuLpZXEK86r5oY6m
         DDSfPuYbpbKzrn1jBqPHxZHi/5t52NywzY80nfhg=
Received: by mail-qt1-f175.google.com with SMTP id w47so5862750qtk.4;
        Fri, 31 Jan 2020 08:38:59 -0800 (PST)
X-Gm-Message-State: APjAAAVxrsQYoNttyJH8U6fQ9mIJFOQZuU7T4ec7mSFgisHk6sOT8kDX
        KqeE4ysnExpGSgOXhfdW1Pbro05EmAePpr86/w==
X-Google-Smtp-Source: APXvYqwWHczInFh7uaGKKxummXJSDmakmN9eY3QRuyrI5DrFCoTGyNZpJXbAx5W0R4uNl69txIth0/2+vhIiol1RjIU=
X-Received: by 2002:ac8:6747:: with SMTP id n7mr11476022qtp.224.1580488738216;
 Fri, 31 Jan 2020 08:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20200130211231.224656-1-dianders@chromium.org> <20200130131220.v3.2.I0c4bbb0f75a0880cd4bd90d8b267271e2375e0d0@changeid>
In-Reply-To: <20200130131220.v3.2.I0c4bbb0f75a0880cd4bd90d8b267271e2375e0d0@changeid>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 31 Jan 2020 10:38:46 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+eKYm2Z9_2U3-FjvNc1ku690Qypuba=w_h_1wq4zJb-A@mail.gmail.com>
Message-ID: <CAL_Jsq+eKYm2Z9_2U3-FjvNc1ku690Qypuba=w_h_1wq4zJb-A@mail.gmail.com>
Subject: Re: [PATCH v3 02/15] dt-bindings: clock: Fix qcom,dispcc bindings for sdm845/sc7180
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
> The qcom,dispcc bindings had a few problems with them:
>
> 1. They didn't specify all the clocks that dispcc is a client of.
>    Specifically on sc7180 there are two clocks from the DSI PHY and
>    two from the DP PHY.  On sdm845 there are actually two DSI PHYs
>    (each of which has two clocks) and an extra clock from the gcc.
>    These all need to be specified.
>
> 2. The sdm845.dtsi has existed for quite some time without specifying
>    the clocks.  The Linux driver was relying on global names to match
>    things up.  While we should transition things, it should be noted
>    in the bindings.
>
> 3. The names used the bindings for "xo" and "gpll0" didn't match the
>    names that QC used for these clocks internally and this was causing
>    confusion / difficulty with their code generation tools.  Switched
>    to the internal names to simplify everyone's lives.  It's not quite
>    as clean in a purist sense but it should avoid headaches.  This
>    officially changes the binding, but that seems OK in this case.
>
> Also note that I updated the example.
>
> Fixes: 5d28e44ba630 ("dt-bindings: clock: Add YAML schemas for the QCOM DISPCC clock bindings")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Added include file to description.
> - Discovered / added new gcc input clock on sdm845.
> - Split sc7180 and sdm845 into two files.
> - Switched names to internal QC names rather than logical ones.
> - Updated commit description.
>
> Changes in v2:
> - Patch ("dt-bindings: clock: Fix qcom,dispcc...") new for v2.
>
>  .../bindings/clock/qcom,dispcc.yaml           | 67 -------------
>  .../bindings/clock/qcom,sc7180-dispcc.yaml    | 84 ++++++++++++++++
>  .../bindings/clock/qcom,sdm845-dispcc.yaml    | 99 +++++++++++++++++++
>  3 files changed, 183 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-dispcc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml

Other than the same $id problem,

Reviewed-by: Rob Herring <robh@kernel.org>
