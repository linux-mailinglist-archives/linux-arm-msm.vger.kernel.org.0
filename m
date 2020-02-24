Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D21FB169D0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 05:37:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbgBXEhE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Feb 2020 23:37:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:33936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727186AbgBXEhE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Feb 2020 23:37:04 -0500
Received: from localhost (unknown [122.182.199.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E67E820661;
        Mon, 24 Feb 2020 04:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582519023;
        bh=P5Qao53KIB3kKLtEhL3ENA/1Qg4vJttiLKMmauTZHwM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ewBQR6pVIKPrBiJR5jIKavdNiN5bHXovPDNL5epeduTDKGuszb0KwcL6I3Z8EJzdO
         UaZafLdb473sPnq2h3vQ1sAPAS3Q7QwbTYnO1yynhfDT20e7bZFURSlIBeKadgx5m5
         0iwvisMb55keuSIChleojblBwAbrykM223OLLR2M=
Date:   Mon, 24 Feb 2020 10:06:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, vnkgutta@codeaurora.org
Subject: Re: [PATCH v3 4/5] dt-bindings: clock: Add SM8250 GCC clock bindings
Message-ID: <20200224043659.GS2618@vkoul-mobl>
References: <20200216102725.2629155-1-vkoul@kernel.org>
 <20200216102725.2629155-5-vkoul@kernel.org>
 <20200218203345.GA19813@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200218203345.GA19813@bogus>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-02-20, 14:33, Rob Herring wrote:
> On Sun, Feb 16, 2020 at 03:57:24PM +0530, Vinod Koul wrote:
> > From: Taniya Das <tdas@codeaurora.org>
> > 
> > Add device tree bindings for global clock controller on SM8250 SoCs.
> > 
> > Signed-off-by: Taniya Das <tdas@codeaurora.org>
> > Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../bindings/clock/qcom,gcc-sm8250.yaml       |  72 +++++
> >  include/dt-bindings/clock/qcom,gcc-sm8250.h   | 271 ++++++++++++++++++
> >  2 files changed, 343 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
> >  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8250.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
> > new file mode 100644
> > index 000000000000..d48fb25b0d44
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
> > @@ -0,0 +1,72 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> 
> Dual license new bindings please:
> 
> (GPL-2.0-only OR BSD-2-Clause)

Sure will update, thanks for pointing

-- 
~Vinod
