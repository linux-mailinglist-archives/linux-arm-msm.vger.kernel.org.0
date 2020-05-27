Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21FFF1E3645
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 05:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728450AbgE0DLq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 23:11:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgE0DLq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 23:11:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8954D206C3;
        Wed, 27 May 2020 03:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590549105;
        bh=6cFuzz5VZ5TvXscnHkWRGdYskgy6ptj61K2CrwaExMM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=D+aHxMzDG3uSTDyfydyuhQ4X7ehm072A6iFKdU9Ms94eXWUKO3fUL3rCl1wSqc1nV
         P4151DiGp5JWvKBTAqKNwJ3I1R3E1K7HdQiy8CUDO9YuzLjqvuM/BXwlAlO+oaKE7B
         fkWHBLqi2bnQ+f1yRVioiaBN0p19M1YvK7vBPslQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1589707344-8871-3-git-send-email-tdas@codeaurora.org>
References: <1589707344-8871-1-git-send-email-tdas@codeaurora.org> <1589707344-8871-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 26 May 2020 20:11:44 -0700
Message-ID: <159054910485.88029.14861222587907627358@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-05-17 02:22:22)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscor=
ecc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.=
yaml
> new file mode 100644
> index 0000000..c025a0ae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-lpasscorecc.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sc7180-lpasscorecc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS Core Clock Controller Binding for SC7180
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm LPASS core clock control module which supports the clocks and
> +  power domains on SC7180.
> +
> +  See also:
> +  - dt-bindings/clock/qcom,lpasscorecc-sc7180.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7180-lpasshm
> +      - qcom,sc7180-lpasscorecc
> +
> +  clocks:
> +    items:
> +      - description: gcc_lpass_sway clock from GCC
> +
> +  clock-names:
> +    items:
> +      - const: gcc_lpass_sway

As said on patch #4, maybe "iface" instead?

> +
> +  power-domains:
> +    items:
> +      - description: LPASS CORE HM GSDCR
> +
