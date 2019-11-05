Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFBFBF09A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 23:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730429AbfKEWg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 17:36:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:39036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728515AbfKEWg2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 17:36:28 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 332852084D;
        Tue,  5 Nov 2019 22:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572993387;
        bh=gjH+ZYotJRmYe2FcsXdY4/Sv6Qh2DPmqjFve/uDW4Ds=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=eLFHAdsLf3RlWD18ADrZ40vl5+EbKbpBBYYh2FzVZ+rtPY/6l2woPXYdRhfwphjsF
         qrGFNV9A9yoPtWbFr05zcbjitDIy+gLpCNsaaM3jlDxsBvpOatOYkVQC790MgI7HI/
         RNrrRsEg8kBnbSzBmPh08ze7aZEfxvbvbcgdneEc=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572371299-16774-3-git-send-email-tdas@codeaurora.org>
References: <1572371299-16774-1-git-send-email-tdas@codeaurora.org> <1572371299-16774-3-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: Introduce RPMHCC bindings for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Tue, 05 Nov 2019 14:36:26 -0800
Message-Id: <20191105223627.332852084D@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-29 10:48:18)
> Add compatible for SC7180 RPMHCC.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/D=
ocumentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index f25d76f..feed637 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -19,6 +19,7 @@ properties:
>      enum:
>        - qcom,sdm845-rpmh-clk
>        - qcom,sm8150-rpmh-clk
> +      - qcom,sc7180-rpmh-clk
>=20

Sort?

