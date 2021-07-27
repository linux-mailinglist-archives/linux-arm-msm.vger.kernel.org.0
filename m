Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5793D8215
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 23:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232460AbhG0Vrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 17:47:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:44616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232088AbhG0Vrq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 17:47:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B8DF60F6E;
        Tue, 27 Jul 2021 21:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627422466;
        bh=+G2o0Ezf0G8Bq5pn4ktC8VGGLIE2gi8F2wA5efApP6w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=awWSZs71slX74asv0vhlq5y5ZgtaPRhoXyHjYLM9VQqDNMhblxvynq8idb6Z+Lm9q
         1cn7Q4pavpnGI8hIWMqqmqxzXLbqcNE/a+SN5ge+tGML+gdr5yvEzw0O4MAA2bksAg
         WoNGSdWVshOcpvJ01YdwbgpIFiSrkyR9iFq48E/hnL4H2ORrak82J4+9zA9atTINMn
         LtPMv5yuSk0Kx6Vd5y4s1z9jRa3dsiZ2f3OJy6PdkIWm5q8DbTuZjRd6vJaYV6U7N2
         i5JGS5LQboww1JZUUaGoQCTZzIsutXiezPLs3n53x7Z465G2fD0D20Iswfr4ManwdC
         nhhxTGE0e0NRQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210629102624.194378-2-martin.botka@somainline.org>
References: <20210629102624.194378-1-martin.botka@somainline.org> <20210629102624.194378-2-martin.botka@somainline.org>
Subject: Re: [RESEND PATCH v2 1/3] rpmcc: Add sm6125 compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        paul.bouchara@somainline.org,
        Martin Botka <martin.botka@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com
Date:   Tue, 27 Jul 2021 14:47:44 -0700
Message-ID: <162742246483.2368309.10033568257822595295@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Martin Botka (2021-06-29 03:26:21)
> Add a compatible for SM6125 and assing correct data
>=20
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---

This patch needs to be combined with the one that introduces
rpm_clk_sm6125.

> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rp=
m.c
> index 0e1dfa89489e..8200c26b968c 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -1070,6 +1070,7 @@ static const struct of_device_id rpm_smd_clk_match_=
table[] =3D {
>         { .compatible =3D "qcom,rpmcc-msm8998", .data =3D &rpm_clk_msm899=
8 },
>         { .compatible =3D "qcom,rpmcc-qcs404",  .data =3D &rpm_clk_qcs404=
  },
>         { .compatible =3D "qcom,rpmcc-sdm660",  .data =3D &rpm_clk_sdm660=
  },
> +       { .compatible =3D "qcom,rpmcc-sm6125",  .data =3D &rpm_clk_sm6125=
  },
