Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9C92A2EED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 07:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfH3Fcw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 01:32:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:38030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726405AbfH3Fcv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 01:32:51 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D772A21897;
        Fri, 30 Aug 2019 05:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567143171;
        bh=0bCUCOe9JrT9J4vZlQHLm2jLYT2lBAJOVkLa79zh0sg=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=gMxOGEp16fYHUr2YlQpldiMD08oslWv5R+hSAL98lpYlqNVuGDa4pvGdBqBES6zpK
         HUSFudiTftAlH6BKsQCIUMPSzcfMK+UHhMIWi7H2Fi9/ErPe2uzb+NL5HQimlQFG6C
         +IxTpKiwQeaKaOazOecBkaDnhw+oGR+PDuFZFlmo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190824152411.21757-2-sibis@codeaurora.org>
References: <20190824152411.21757-1-sibis@codeaurora.org> <20190824152411.21757-2-sibis@codeaurora.org>
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [RESEND PATCH v2 1/2] dt-bindings: reset: aoss: Add AOSS reset binding for SC7180 SoCs
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        p.zabel@pengutronix.de, robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 29 Aug 2019 22:32:50 -0700
Message-Id: <20190830053250.D772A21897@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2019-08-24 08:24:10)
> Add SC7180 AOSS reset to the list of possible bindings.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 4 ++--

Can you convert this binding to YAML/JSON schema? Would help to describe
the 'one of' requirement below in a more structured way.

>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt =
b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
> index 510c748656ec5..3eb6a22ced4bc 100644
> --- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
> +++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
> @@ -8,8 +8,8 @@ Required properties:
>  - compatible:
>         Usage: required
>         Value type: <string>
> -       Definition: must be:
> -                   "qcom,sdm845-aoss-cc"
> +       Definition: must be one of:
