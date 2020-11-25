Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC2962C369C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 03:31:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbgKYCOM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 21:14:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:37748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725287AbgKYCOM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 21:14:12 -0500
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF1452075A;
        Wed, 25 Nov 2020 02:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606270451;
        bh=uGc3hDzgE86z5ms9BsFahgf4jdHWbwk2TZn74OngWv4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TfFtoKwNoAGqN4IFV6vIfILCG4UTH8R7sIrgTCwp4fv9ZJtlds6gCT0lwSBS16sJR
         AFYuQ12AUV3FTmFP/MMfU1N84u/zR70ofxlcSRwviw3U8x6qzE6oD6lcMV73KycQLY
         LaD4486+AFwHlPkbQVbncnCmN7tNNzNLChQEt/9s=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201119072714.14460-2-manivannan.sadhasivam@linaro.org>
References: <20201119072714.14460-1-manivannan.sadhasivam@linaro.org> <20201119072714.14460-2-manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: Add SDX55 GCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Tue, 24 Nov 2020 18:14:10 -0800
Message-ID: <160627045053.2717324.16519747693186632490@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Manivannan Sadhasivam (2020-11-18 23:27:11)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml =
b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
> new file mode 100644
> index 000000000000..9d8981817ae3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
> @@ -0,0 +1,73 @@
[...]
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-sdx55
> +
> +  clocks:
> +    items:
[...]
> +      - description: PLL test clock source
> +
> +  clock-names:
> +    items:
[...]
> +      - const: core_bi_pll_test_se

Is it optional? As far as I know this clk has never been implemented
because it's a hardware validation thing and not used otherwise.
