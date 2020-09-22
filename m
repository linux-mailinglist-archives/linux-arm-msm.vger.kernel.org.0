Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C148274891
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 20:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgIVSto (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 14:49:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:49484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVSto (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 14:49:44 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A6C220715;
        Tue, 22 Sep 2020 18:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600800584;
        bh=e/bauI6KzlrLmtHCtM52JPSCV3l2aIUxMwYl7MvFZDY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=w+7FqOPrWiOong7GKDxBuJDLW1DQUWOaatPbXXBQsvNDH/ekcL90K7z32FGh2Msl5
         mbtMebUiyr1ltJ4XPHHgX1VHhBHGaB8lx/g8sL4E0NZPkKnWjWz0yFUUpOBlO6pc7d
         ITN4CH7suYgeTlp+t6KHVSrQ9w0CltxroVJ2mFvw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200904030958.13325-4-jonathan@marek.ca>
References: <20200904030958.13325-1-jonathan@marek.ca> <20200904030958.13325-4-jonathan@marek.ca>
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: add SM8250 QCOM video clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 22 Sep 2020 11:49:42 -0700
Message-ID: <160080058276.310579.5580925712920687353@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-03 20:09:52)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/=
Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> index d04f5bd28dde..66a6066ae353 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> @@ -24,14 +25,19 @@ properties:
>        - qcom,sdm845-videocc
>        - qcom,sc7180-videocc
>        - qcom,sm8150-videocc
> +      - qcom,sm8250-videocc
> =20
>    clocks:
> +    minItems: 1
>      items:
>        - description: Board XO source
> +      - description: Board XO source, always-on (required by sm8250 only)

I'd expect every SoC to need it. Can you leave it out for now and we can
add it when it becomes required?
