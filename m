Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073283D81F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 23:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbhG0Vki (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 17:40:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:41746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231445AbhG0Vki (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 17:40:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC27E60EB2;
        Tue, 27 Jul 2021 21:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627422037;
        bh=RG9Y5mEABOP2Zfajpg0c6IEQUjXaHwO+h+7pQW1y0y0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=IF5USOQunlvbtCVtqaXPPLuA0tEOJIuD4kFn9dmgFfWOBx3I7tPlTWW60pnZBkZm2
         31ab5Tw18iC63zgLt30DRvcDNuZE4rOSioQfYwerO7QA0K+aePY3r6VZ1Q8QcsEwvv
         A62zEz7QD2GjaM4HgwR3dAUsv9OVuRxHkMOykUu+eS/LruLSOi3mlYKfKfxp78rmWf
         76j6HoAMgkb58RZbYatSNn39RgtXw306J7+fIWN3GL2FCcIyEMFGozyfrWBB50HdNx
         xvtXxdufFTWwuDMCaGMUOpHFbOUCtk4J/klCJxNd4zfY1g1RWywoehKI157NRZcwxl
         NYOd1PLckRYig==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210627185927.695411-4-iskren.chernev@gmail.com>
References: <20210627185927.695411-1-iskren.chernev@gmail.com> <20210627185927.695411-4-iskren.chernev@gmail.com>
Subject: Re: [PATCH v2 3/5] clk: qcom: smd: Add support for SM6115 rpm clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>
Date:   Tue, 27 Jul 2021 14:40:35 -0700
Message-ID: <162742203549.2368309.17168877833046620648@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Iskren Chernev (2021-06-27 11:59:25)
> diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
> index bc0be1d4be5f..dfdd4f20f5fd 100644
> --- a/drivers/soc/qcom/smd-rpm.c
> +++ b/drivers/soc/qcom/smd-rpm.c
> @@ -242,6 +242,7 @@ static const struct of_device_id qcom_smd_rpm_of_matc=
h[] =3D {
>         { .compatible =3D "qcom,rpm-msm8996" },
>         { .compatible =3D "qcom,rpm-msm8998" },
>         { .compatible =3D "qcom,rpm-sdm660" },
> +       { .compatible =3D "qcom,rpm-sm6115" },
>         { .compatible =3D "qcom,rpm-sm6125" },
>         { .compatible =3D "qcom,rpm-qcs404" },
>         {}

Does this hunk need to be part of this patch?
