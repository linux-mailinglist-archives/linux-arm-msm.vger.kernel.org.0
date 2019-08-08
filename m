Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69BB58652B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 17:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732662AbfHHPJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 11:09:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:43390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730678AbfHHPJC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 11:09:02 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D6C932184E;
        Thu,  8 Aug 2019 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565276942;
        bh=B0eHh/WZOcD8xWHkwc6hMMbCfT1pvVEPY36as1jU25E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LY4/j5NsBljPXpzM+7voo5j3o/JQvsHPjUzE2MyIMMZ6fFgSApQN4B8u3zRB5Y62S
         6eshUcHuq6CXBchpm6zAdWLn9knVy/7rINWnDsE4ei6LBUUmDG8F6jCMnxh17m0+mK
         dQavqSCriWOMHTi3kWksYxE2f7gpYmuTUOPkPLuE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190726092332.25202-5-govinds@codeaurora.org>
References: <20190726092332.25202-1-govinds@codeaurora.org> <20190726092332.25202-5-govinds@codeaurora.org>
Subject: Re: [PATCH v5 4/7] clk: qcom: Add Q6SSTOP clock controller for QCS404
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     andy.gross@linaro.org, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
To:     Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Thu, 08 Aug 2019 08:09:00 -0700
Message-Id: <20190808150901.D6C932184E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Govind Singh (2019-07-26 02:23:29)
> diff --git a/drivers/clk/qcom/q6sstop-qcs404.c b/drivers/clk/qcom/q6sstop=
-qcs404.c
> new file mode 100644
> index 000000000000..b6281986b077
> --- /dev/null
> +++ b/drivers/clk/qcom/q6sstop-qcs404.c
> @@ -0,0 +1,223 @@
[...]
> +};
> +
> +static struct platform_driver q6sstopcc_qcs404_driver =3D {
> +       .probe          =3D q6sstopcc_qcs404_probe,
> +       .remove         =3D q6sstopcc_qcs404_remove,
> +       .driver         =3D {
> +               .name   =3D "qcs404-q6sstopcc",
> +               .of_match_table =3D q6sstopcc_qcs404_match_table,
> +       .pm =3D &q6sstopcc_pm_ops,

This got some weird indent.

> +       },
> +};
> +
> +module_platform_driver(q6sstopcc_qcs404_driver);
> +
> +MODULE_DESCRIPTION("QTI QCS404 Q6SSTOP Clock Controller Driver");
> +MODULE_LICENSE("GPL v2");
