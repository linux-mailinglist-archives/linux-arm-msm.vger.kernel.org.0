Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 958D222A44C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 03:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733276AbgGWBF2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 21:05:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:51946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733270AbgGWBF2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 21:05:28 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0DEF2080D;
        Thu, 23 Jul 2020 01:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595466327;
        bh=W2CYa/0UitifMAE40ODWZqF2evqHAMepGzJ4pFCBC0k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=0J1pLNs4srdlY758oP/2THuIFMZVT9hxJQSMive90bFdHGH6+nbirfrxeGSVL3LTd
         FEDb7DfBOban1eIwGmg3oQ6s5N4HWHsvnHWpGitOtdFTll3xUArvAF+eU3pMkjpJ7h
         NU+Nrqr8VQxmfC9GaSPK3UK+i9+JAROIxT8UX4Y8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <01daee94-756d-3970-9057-849de2b76430@codeaurora.org>
References: <1594795010-9074-1-git-send-email-tdas@codeaurora.org> <1594795010-9074-3-git-send-email-tdas@codeaurora.org> <159531791606.3847286.11896325263133276429@swboyd.mtv.corp.google.com> <01daee94-756d-3970-9057-849de2b76430@codeaurora.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 22 Jul 2020 18:05:27 -0700
Message-ID: <159546632701.3847286.14646561815611231678@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-07-21 10:26:53)
> Hi Stephen,
>=20
> Thanks for the review.
>=20
> On 7/21/2020 1:21 PM, Stephen Boyd wrote:
>=20
> >> +...
> >> diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-=
bindings/clock/qcom,gcc-sc7180.h
> >> index 992b67b..bdf43adc 100644
> >> --- a/include/dt-bindings/clock/qcom,gcc-sc7180.h
> >> +++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
> >> @@ -138,6 +138,7 @@
> >>   #define GCC_MSS_Q6_MEMNOC_AXI_CLK                              128
> >>   #define GCC_MSS_SNOC_AXI_CLK                                   129
> >>   #define GCC_SEC_CTRL_CLK_SRC                                   130
> >> +#define GCC_LPASS_CFG_NOC_SWAY_CLK                             131
> >>  =20
> >>   /* GCC resets */
> >>   #define GCC_QUSB2PHY_PRIM_BCR                                  0
> >=20
> > This hunk should be in the next patch. Oh but then that patch should co=
me
> > before this one so the binding can use it. Either way, shouldn't be part
> > of this patch.
> >=20
>=20
>=20
> We had a problem with the bot complaining about the clock handles being=20
> used in the example.
>=20
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1582540703=
-6328-4-git-send-email-tdas@codeaurora.org/
>=20
> Thus I have kept the GCC bindings in the same patch.
>=20

Ah ok. Well I'll fix it when you resend to fix the comment on patch 4.
