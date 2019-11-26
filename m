Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73EC810A3F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2019 19:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbfKZSLz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Nov 2019 13:11:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:49658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfKZSLy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Nov 2019 13:11:54 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 275EA20727;
        Tue, 26 Nov 2019 18:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574791914;
        bh=g6Pt8BENoBERMhWmoc+xJ+KNsVDQaHsuOtz12GWEL0A=;
        h=In-Reply-To:References:Subject:Cc:From:To:Date:From;
        b=PHCvdrDUxwVFk6Az3dmnF7fUMWgLKa6WULn/iuhDMB0oEq6mzTZKrqaKMy5LPDis6
         0dLw2WZQxD6eGforht/Ts7wm4swGwsXPDzPIBiRD8u7I4wKUkuckn7o+zasU9SeGYm
         0y8eUCLQafhfbEr/MlD2UAy3YlkoDAVfKSVNp+oE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAOCk7NqfHe6jRPmw6o650fyd6EyVfFObHhJ9=21ipuAqJo6oGA@mail.gmail.com>
References: <1573812304-24074-1-git-send-email-tdas@codeaurora.org> <1573812304-24074-4-git-send-email-tdas@codeaurora.org> <CAOCk7NqfHe6jRPmw6o650fyd6EyVfFObHhJ9=21ipuAqJo6oGA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: Add YAML schemas for the QCOM GPUCC clock bindings
Cc:     Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Tue, 26 Nov 2019 10:11:53 -0800
Message-Id: <20191126181154.275EA20727@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-11-15 07:11:01)
> On Fri, Nov 15, 2019 at 3:07 AM Taniya Das <tdas@codeaurora.org> wrote:
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/=
Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> > new file mode 100644
> > index 0000000..c2d6243
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/bindings/clock/qcom,gpucc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Graphics Clock & Reset Controller Binding
> > +
> > +maintainers:
> > +  - Taniya Das <tdas@codeaurora.org>
> > +
> > +description: |
> > +  Qualcomm grpahics clock control module which supports the clocks, re=
sets and
> > +  power domains.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,msm8998-gpucc
> > +      - qcom,sdm845-gpucc
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      - description: Board XO source
> > +      - description: GPLL0 source from GCC
>=20
> This is not an accurate conversion.  GPLL0 was not valid for 845, and
> is required for 8998.

Thanks for checking Jeff.

It looks like on 845 there are two gpll0 clocks going to gpucc. From
gpu_cc_parent_map_0:

	"gcc_gpu_gpll0_clk_src",
	"gcc_gpu_gpll0_div_clk_src",

