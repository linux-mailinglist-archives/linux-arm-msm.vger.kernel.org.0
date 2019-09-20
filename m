Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF80DB95EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 18:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390364AbfITQpq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 12:45:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389184AbfITQpq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 12:45:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68FFB20717;
        Fri, 20 Sep 2019 16:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568997945;
        bh=7uHZpCyprQ+ExDBGZqIoxuu9cl0f/lWQvotmf0EacHA=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=ceDU+qwuK9oo+gOGz+xEIQPbYNs+uXlRoiQwcFQpYWpEl+BJEsUuClxUZFtdIozhS
         V5a6zobi1vycFbhwmfKDa3+AzkItBBjMn1NAq3VX7+ydvGeAg2UsrdDhWFYIcWT07Q
         LnT7F3T1SXulg9eyo04RR5eolqZkazCMLxE0c6rU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190920145543.1732316-1-arnd@arndb.de>
References: <20190920145543.1732316-1-arnd@arndb.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Jassi Brar <jassisinghbrar@gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] mbox: qcom: avoid unused-variable warning
User-Agent: alot/0.8.1
Date:   Fri, 20 Sep 2019 09:45:44 -0700
Message-Id: <20190920164545.68FFB20717@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Arnd Bergmann (2019-09-20 07:55:29)
> Without CONFIG_OF, there is no reference to the apcs_clk_match_table[]
> array, causing a harmless warning:
>=20
> drivers/mailbox/qcom-apcs-ipc-mailbox.c:57:28: error: unused variable 'ap=
cs_clk_match_table' [-Werror,-Wunused-variable]
>         const struct of_device_id apcs_clk_match_table[] =3D {
>=20
> Move the variable out of the variable scope and mark it 'static'
> to avoid the warning (static const variables get silently dropped
> by the compiler), and avoid the on-stack copy at the same time.
>=20
> Fixes: 78c86458a440 ("mbox: qcom: add APCS child device for QCS404")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qc=
om-apcs-ipc-mailbox.c
> index eeebafd546e5..10557a950c2d 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -45,6 +45,12 @@ static const struct mbox_chan_ops qcom_apcs_ipc_ops =
=3D {
>         .send_data =3D qcom_apcs_ipc_send_data,
>  };
> =20
> +static const struct of_device_id apcs_clk_match_table[] =3D {
> +       { .compatible =3D "qcom,msm8916-apcs-kpss-global", },
> +       { .compatible =3D "qcom,qcs404-apcs-apps-global", },
> +       {}
> +};
> +
>  static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  {
>         struct qcom_apcs_ipc *apcs;
> @@ -54,11 +60,6 @@ static int qcom_apcs_ipc_probe(struct platform_device =
*pdev)
>         void __iomem *base;
>         unsigned long i;
>         int ret;
> -       const struct of_device_id apcs_clk_match_table[] =3D {

Does marking it static here work too? It would be nice to limit the
scope of this variable to this function instead of making it a global.
Also, it might be slightly smaller code size if that works.

> -               { .compatible =3D "qcom,msm8916-apcs-kpss-global", },
> -               { .compatible =3D "qcom,qcs404-apcs-apps-global", },
> -               {}
> -       };
> =20
>         apcs =3D devm_kzalloc(&pdev->dev, sizeof(*apcs), GFP_KERNEL);
>         if (!apcs)
