Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1017F381D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 01:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfFFX35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 19:29:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:59358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbfFFX35 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 19:29:57 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C742E20868;
        Thu,  6 Jun 2019 23:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559863796;
        bh=s/IGr6FJIJTtmPkO0Rn/Sv11l8Exxwy3saMC055VrOk=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=VqBiD7KFYZ84pOvuOVKtaZhm5K5HuYc1LAGmMSPMVQ9a8n4+2/IvLRe03qqGchVbr
         rMc7Sx8P6IGt4pWUFvfFTNGxN3sAxKQNOX58qNOFKrM4WQbkuvjsvhgr0Ut0gIZmBq
         UdvS8FpNSz/Nb/RML4DckvRLWW1Tj5ceSrpvD1uo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1558449993-20902-1-git-send-email-jhugo@codeaurora.org>
References: <1558449843-19971-1-git-send-email-jhugo@codeaurora.org> <1558449993-20902-1-git-send-email-jhugo@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>, mturquette@baylibre.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: clock: Document external clocks for MSM8998 gcc
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 06 Jun 2019 16:29:55 -0700
Message-Id: <20190606232956.C742E20868@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-05-21 07:46:33)
> The global clock controller on MSM8998 can consume a number of external
> clocks.  Document them.
>=20
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Docum=
entation/devicetree/bindings/clock/qcom,gcc.txt
> index 8661c3c..7d45323 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> @@ -28,6 +28,16 @@ Required properties :
>  - #clock-cells : shall contain 1
>  - #reset-cells : shall contain 1
> =20
> +For MSM8998 only:

It would be nice to get the rest of the SoCs supported by this binding
to start listing clocks. But this is OK for now.
