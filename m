Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF0E28D861
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 04:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgJNCQk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 22:16:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:59242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726981AbgJNCQk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 22:16:40 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88AEB21775;
        Wed, 14 Oct 2020 02:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602641799;
        bh=42E3KgsXC8dH9rso8TURVBVFNR9JiVlIPxE0XUzrkHw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AZKQUJGwRAddE+3qOEbM4UZB1LlDxZQR8mQFiJvyCKCVICRSc93QeD3YLoEmC/HOC
         LKeFhXVgoaWlzLkHDKHKIr60N6jlHN5c1k8dihyTYEVbTjQX4Awotheiw5Inw7/pcc
         P3p15HCz0hcDwuEbBehvKA2mmi+y6BZ8j1Q6hZKI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201005225914.315852-4-dmitry.baryshkov@linaro.org>
References: <20201005225914.315852-1-dmitry.baryshkov@linaro.org> <20201005225914.315852-4-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v1 3/3] clk: qcom: dispcc-sm8250: handle MMCX power domain
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 13 Oct 2020 19:16:38 -0700
Message-ID: <160264179823.310579.6191463434860127602@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2020-10-05 15:59:14)
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-s=
m8250.c
> index 07a98d3f882d..3941054a7b07 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -963,6 +963,8 @@ static struct gdsc mdss_gdsc =3D {
>         },
>         .pwrsts =3D PWRSTS_OFF_ON,
>         .flags =3D HW_CTRL,
> +       .domain =3D "mmcx",
> +       .perf_idx =3D 0,

Does a perf_idx of 0 mean off? Or just "not off"?
