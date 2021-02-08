Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06EA313D1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235342AbhBHSUL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:20:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:53002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235418AbhBHSTX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:19:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 39ABC64E37;
        Mon,  8 Feb 2021 18:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808322;
        bh=96MNIodpcXR/mW7T1ax+ZYH4V6b346/V4WuZthXRDCM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=N8LW/lRR47VtbE+4a8lW6Jaj0cKLZMWVFpFUVs6JL64Vw8tMQreuygRNPqgsDwabI
         qgRDXKuvcAkFduYw8UmXDb9C4l1D1aYqSm+mSI8qdRFSmUQopzQpxMma3jUxdDessL
         FMDYerSWW2kKlTQngJueKtJx+ERg/ghe0tm0gIf1MLKTgcKtshKutGiK5dQaLGpSy5
         eBUOstCxOO+GygKvlpscvlynqIwWAanVUnkj/dfwopMLMX+jWrZUjV3GYD0V9dnET3
         nwKZrUsS+rLdtCluF1GGchLP4Sej7YYwmH8fqwZqHj2HCrJQMTvMRufsd5PAEaVpr6
         +tmVU4FY+YnaQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114221059.483390-6-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org> <20210114221059.483390-6-angelogioacchino.delregno@somainline.org>
Subject: Re: [PATCH v2 05/11] clk: qcom: gcc-msm8998: Mark gpu_cfg_ahb_clk as critical
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-arm-msm@vger.kernel.org
Date:   Mon, 08 Feb 2021 10:18:40 -0800
Message-ID: <161280832085.76967.5394456316048533384@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2021-01-14 14:10:53)
> The GPU IOMMU depends on this clock and the hypervisor will crash
> the SoC if this clock gets disabled because the secure contexts
> that have been set on this IOMMU by the bootloader will become
> unaccessible (or they get reset).
> Mark this clock as critical to avoid this issue when the Adreno
> GPU is enabled.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@soma=
inline.org>
> ---
>  drivers/clk/qcom/gcc-msm8998.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm899=
8.c
> index c8d4c0348952..afea60a3ef43 100644
> --- a/drivers/clk/qcom/gcc-msm8998.c
> +++ b/drivers/clk/qcom/gcc-msm8998.c
> @@ -2081,6 +2081,12 @@ static struct clk_branch gcc_gpu_cfg_ahb_clk =3D {
>                 .hw.init =3D &(struct clk_init_data){
>                         .name =3D "gcc_gpu_cfg_ahb_clk",
>                         .ops =3D &clk_branch2_ops,
> +                       /*
> +                        * The GPU IOMMU depends on this clock and hyperv=
isor
> +                        * will crash the SoC if this clock goes down, du=
e to
> +                        * secure contexts protection.
> +                        */
> +                       .flags =3D CLK_IS_CRITICAL,
>                 },
>         },

Please send a followup patch that hits the branch on at probe time and
removes this clk from the kernel. That will save some memory and
overhead of worrying about this clk.
