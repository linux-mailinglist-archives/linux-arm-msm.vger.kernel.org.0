Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE18F0B24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 01:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730639AbfKFAhn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 19:37:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:60148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727046AbfKFAhn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 19:37:43 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7E6B22178F;
        Wed,  6 Nov 2019 00:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573000662;
        bh=jcUdGFFtelCAQuIk0dOynAZI5VAeCvQGh5mOqKat9ig=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=Zc6zZGm/UwCEFo5wxy3Qe9c7slZN7NqkOwpLTPheRsE4kWKmnfPu9PzceHq+URmOy
         0pFW3TqFUXZl5y0Kr4XlyHeK+A7Uf1GyJV8I0IpyPdsxYLkmTuI2/4Vx33UXwpcqee
         wvG2YGXqwjHsXB9x8dc5CLuPc994tXbnhQMuAwCM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572524473-19344-7-git-send-email-tdas@codeaurora.org>
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org> <1572524473-19344-7-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 6/7] dt-bindings: clock: Introduce QCOM Video clock bindings
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
Date:   Tue, 05 Nov 2019 16:37:41 -0800
Message-Id: <20191106003742.7E6B22178F@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-10-31 05:21:12)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/=
Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> index fc3fcca..9b8690c 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,sdm845-videocc
> +      - qcom,sc7180-videocc

Sort.

>=20
>    clocks:
>      maxItems: 1
