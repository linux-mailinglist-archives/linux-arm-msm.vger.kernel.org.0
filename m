Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA1AADCC4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 18:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfIIQKx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 12:10:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:50300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbfIIQKx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 12:10:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0FC62084D;
        Mon,  9 Sep 2019 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568044986;
        bh=jv+lB6acHNmcxzA4svQYs31plQCvgdNvK7cuKzZn79s=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=NHGQIQa6hXnkYMu8wrfBHNikhz5+XfEZxuV3XIBK8yIY7rWHVB46YkUaclIv0ba1g
         bRRhXmBcPHP6POSR/izAQ9O7Kf0qYnzZmjvnHpalWk3Z/4UGuLkJyOkKeezuRkGsN7
         zqZ7uv4XnG5O1PvoC3FQ57GfU96wQtG7GgiKChxU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190826121453.21732-2-vkoul@kernel.org>
References: <20190826121453.21732-1-vkoul@kernel.org> <20190826121453.21732-2-vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: Document the parent clocks
User-Agent: alot/0.8.1
Date:   Mon, 09 Sep 2019 09:03:05 -0700
Message-Id: <20190909160305.E0FC62084D@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-26 05:14:50)
> With clock parent data scheme we must specify the parent clocks for the
> rpmhcc nodes. So describe the parent clock for rpmhcc in the bindings.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt b/=
Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> index 3c007653da31..8b97968f9c88 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> @@ -9,6 +9,9 @@ Required properties :
>  - compatible : shall contain "qcom,sdm845-rpmh-clk"
> =20
>  - #clock-cells : must contain 1
> +- clocks: a list of phandles and clock-specifier pairs,
> +         one for each entry in clock-names.
> +- clock-names: Parent board clock: "xo".

Ok. xo is fine!

