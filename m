Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED1BF18A9C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 01:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgCSAaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 20:30:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:46422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgCSAaL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 20:30:11 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 614D92076C;
        Thu, 19 Mar 2020 00:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584577810;
        bh=s+daCmIgkJ7+NjKAff/EpwgrnpoE3Bw4gorFJuVK7lE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=J0RvQjwcG4ECsSP0uhPm3cSZa7LVzDMQj3cpywfskfbNYITmDrVz/CvifyrnbvZU/
         G0C4vtFoyBuHIG2jWmnIxdMEmUIQ/Rt6AKielMZXPFocRPhkc9YaL0V86rAvIEofJ+
         0Zb1/a9SxuLYoyXbGrfweKaXGWgVI4pLIwWz5dFM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584211798-10332-2-git-send-email-tdas@codeaurora.org>
References: <1584211798-10332-1-git-send-email-tdas@codeaurora.org> <1584211798-10332-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: clock: Add YAML schemas for the QCOM MSS clock bindings
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
Date:   Wed, 18 Mar 2020 17:30:09 -0700
Message-ID: <158457780952.152100.6665964541366590027@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-03-14 11:49:56)
> The Modem Subsystem clock provider have a bunch of generic properties
> that are needed in a device tree. Add a YAML schemas for those.
>=20
> Add clock ids for GCC MSS and MSS clocks which are required to bring
> the modem out of reset.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,sc7180-mss.yaml | 62 ++++++++++++++++=
++++++
>  include/dt-bindings/clock/qcom,gcc-sc7180.h        |  7 ++-
>  include/dt-bindings/clock/qcom,mss-sc7180.h        | 12 +++++
>  3 files changed, 80 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-m=
ss.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml=
 b/Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
> new file mode 100644
> index 0000000..72493dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,sc7180-mss.yaml#

remove 'bindings' above.

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Modem Clock Controller Binding
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm modem clock control module which supports the clocks.
> +
> +  See also dt-bindings/clock/qcom,mss-sc7180.h.

Can you follow how for example gcc-sc7180 does this?

  See also:
  - dt-bindings/clock/qcom,mss-sc7180.h
