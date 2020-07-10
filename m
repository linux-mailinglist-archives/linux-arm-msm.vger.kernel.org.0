Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B37A21C0DE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgGJXoE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:44:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:46592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726369AbgGJXoE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:44:04 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3F4C1206A1;
        Fri, 10 Jul 2020 23:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594424643;
        bh=O6pr3kBXRQxQ5c2SaDz3ETl2DXoncP1sUQ0qgTPJBCQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=yTDBzJ2A68xlHvJeQhf4rCKXKbMnOzqQz/qCz4eH03kSuc1bEylQFOTTPlLsWMar+
         hniiV1Zwo8O3320L0a8yGn89jcMoNaykE/30+3EFZ9ITvPAoEFa1SR7aFGbO12mczG
         LKglrlqb1P0XTPTWyoEZm3T/xipMR2zRtCqKbml0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1593766722-28838-2-git-send-email-gokulsri@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org> <1593766722-28838-1-git-send-email-gokulsri@codeaurora.org> <1593766722-28838-2-git-send-email-gokulsri@codeaurora.org>
Subject: Re: [v7 1/4] remoteproc: qcom: wcss: populate hardcoded param using driver data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, govinds@codeaurora.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org
Date:   Fri, 10 Jul 2020 16:44:02 -0700
Message-ID: <159442464252.1987609.9113647358389820731@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Gokul Sriram Palanisamy (2020-07-03 01:58:39)
> From: Govind Singh <govinds@codeaurora.org>
>=20
> Q6 based WiFi fw loading is supported across
> different targets, ex: IPQ8074/QCS404. In order to
> support different fw names/pas id etc, populate
> hardcoded param using driver data.
>=20
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> [rebased on top of 5.8-rc3]

This tag is not really useful and doesn't follow the style of having
your email prefix the text. I'd expect to see

[gokulsri@codeaurora.org: made some sort of change]

> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qco=
m_q6v5_wcss.c
> index 88c76b9..abc5f9d 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -70,6 +71,11 @@
>  #define TCSR_WCSS_CLK_MASK     0x1F
>  #define TCSR_WCSS_CLK_ENABLE   0x14
> =20
> +struct wcss_data {
> +       const char *firmware_name;
> +       int crash_reason_smem;

Is it signed for some reason?

> +};
> +
>  struct q6v5_wcss {
>         struct device *dev;
> =20
> @@ -92,6 +98,8 @@ struct q6v5_wcss {
>         void *mem_region;
>         size_t mem_size;
> =20
> +       int crash_reason_smem;
> +

Same question, why not unsigned?

>         struct qcom_rproc_glink glink_subdev;
>         struct qcom_rproc_ssr ssr_subdev;
>  };
> @@ -430,7 +438,7 @@ static int q6v5_wcss_load(struct rproc *rproc, const =
struct firmware *fw)
>                                      wcss->mem_size, &wcss->mem_reloc);
>  }
> =20
> -static const struct rproc_ops q6v5_wcss_ops =3D {
> +static const struct rproc_ops q6v5_wcss_ipq8074_ops =3D {
>         .start =3D q6v5_wcss_start,
>         .stop =3D q6v5_wcss_stop,
>         .da_to_va =3D q6v5_wcss_da_to_va,
> @@ -530,12 +538,17 @@ static int q6v5_alloc_memory_region(struct q6v5_wcs=
s *wcss)
> =20
>  static int q6v5_wcss_probe(struct platform_device *pdev)
>  {
> +       const struct wcss_data *desc;
>         struct q6v5_wcss *wcss;
>         struct rproc *rproc;
>         int ret;
> =20
> -       rproc =3D rproc_alloc(&pdev->dev, pdev->name, &q6v5_wcss_ops,
> -                           "IPQ8074/q6_fw.mdt", sizeof(*wcss));
> +       desc =3D of_device_get_match_data(&pdev->dev);

Use device_get_match_data() and drop the of_device.h include.

> +       if (!desc)
> +               return -EINVAL;
> +
> +       rproc =3D rproc_alloc(&pdev->dev, pdev->name, &q6v5_wcss_ipq8074_=
ops,
> +                           desc->firmware_name, sizeof(*wcss));
>         if (!rproc) {
>                 dev_err(&pdev->dev, "failed to allocate rproc\n");
>                 return -ENOMEM;
> @@ -587,8 +602,14 @@ static int q6v5_wcss_remove(struct platform_device *=
pdev)
>         return 0;
>  }
> =20
> +static const struct wcss_data wcss_ipq8074_res_init =3D {
> +       .firmware_name =3D "IPQ8074/q6_fw.mdt",
> +       .crash_reason_smem =3D WCSS_CRASH_REASON,
> +};
> +
>  static const struct of_device_id q6v5_wcss_of_match[] =3D {
> -       { .compatible =3D "qcom,ipq8074-wcss-pil" },
> +       { .compatible =3D "qcom,ipq8074-wcss-pil", .data =3D &wcss_ipq807=
4_res_init },
> +

Please remove this extra newline.

>         { },
>  };
>  MODULE_DEVICE_TABLE(of, q6v5_wcss_of_match);
