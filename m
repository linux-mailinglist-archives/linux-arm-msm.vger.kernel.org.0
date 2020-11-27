Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7F72C6C70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 21:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731841AbgK0UM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 15:12:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:39562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732474AbgK0UMH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 15:12:07 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59058206D9;
        Fri, 27 Nov 2020 20:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606507851;
        bh=XZK4Ium8QBFZyL2pO4Bad1qag9+adR3MRiJx1hMiA2E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=NWdOEYmyhdJ6mI86E67rwQqQO15TzORO23RXi5lGJ8WLlyqjoL8GgRN8C5kkM6I4U
         MLaiVEDWyOz+D1UrDO91AeN15XBlmw7Cj2WLLk7zrK/Y+f0+H1LVbfTGQTIFFfvj8Q
         vxV8G4M/vdDWg3fEvQpN+/kx2kwK2cfW1eXq9yOQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <E796D737-E343-4EDB-BB34-CE6E0295CF3E@linaro.org>
References: <20201119072714.14460-1-manivannan.sadhasivam@linaro.org> <20201119072714.14460-2-manivannan.sadhasivam@linaro.org> <160627045053.2717324.16519747693186632490@swboyd.mtv.corp.google.com> <E796D737-E343-4EDB-BB34-CE6E0295CF3E@linaro.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: Add SDX55 GCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Fri, 27 Nov 2020 12:10:50 -0800
Message-ID: <160650785008.2717324.9878053018301696255@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-11-24 19:49:24)
>=20
>=20
> On 25 November 2020 7:44:10 AM IST, Stephen Boyd <sboyd@kernel.org> wrote:
> >Quoting Manivannan Sadhasivam (2020-11-18 23:27:11)
> >> diff --git
> >a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
> >b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
> >> new file mode 100644
> >> index 000000000000..9d8981817ae3
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
> >> @@ -0,0 +1,73 @@
> >[...]
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: qcom,gcc-sdx55
> >> +
> >> +  clocks:
> >> +    items:
> >[...]
> >> +      - description: PLL test clock source
> >> +
> >> +  clock-names:
> >> +    items:
> >[...]
> >> +      - const: core_bi_pll_test_se
> >
> >Is it optional? As far as I know this clk has never been implemented
> >because it's a hardware validation thing and not used otherwise.
>=20
> It is implemented in drivers but not used as you said. But since it is th=
e parent clk of PLLs I'm not sure we can make it optional.=20

We can leave it out completely if the bootloader code never uses it as a
parent of the PLL. That scenario would be pretty weird and is why we
removed it from the video clk controller in commit abc8f93f33e7 ("clk:
qcom: Get rid of the test clock for videocc-sc7180"). I'm fine if you
want to keep it, but I'm confused why you care so much :)
