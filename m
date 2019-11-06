Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27FA8F0AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 01:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbfKFA0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 19:26:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:53838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727252AbfKFA0F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 19:26:05 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1BC72087E;
        Wed,  6 Nov 2019 00:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572999964;
        bh=VXbUZ4KP8QXE6F919GIoaA8/5d6Bwk12wYF5B3idnQI=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=uJvTqiHUujNfGUavE5LTIOkTuaiaQQt7dxXKZ5bySTJOUJar7VaT+RD+CvTOJ/gvl
         RFTlE29nr/VwdwQmcJ0MiClkhY8B9Eqdzn7xvPwV2EGf/iW/KEIGWMk7TGMPpJh5tn
         rbHjV3U9FXYyXciOEt9EnNtoRLn+gB1Fnrlnke7I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572524473-19344-3-git-send-email-tdas@codeaurora.org>
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org> <1572524473-19344-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/7] dt-bindings: clock: Add YAML schemas for the QCOM GPUCC clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Tue, 05 Nov 2019 16:26:04 -0800
Message-Id: <20191106002604.A1BC72087E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-31 05:21:08)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Do=
cumentation/devicetree/bindings/clock/qcom,gpucc.yaml
> new file mode 100644
> index 0000000..96aaf36
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Can it be GPL2 or BSD? I think Rob is asking for that sort of license on
these files.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,gpucc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Graphics Clock & Reset Controller Binding
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm grpahics clock control module which supports the clocks, rese=
ts and
> +  power domains.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sdm845-gpucc
> +      - qcom,msm8998-gpucc

Sort please.

