Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D031B352A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 04:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgDVCuM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 22:50:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:60056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725912AbgDVCuM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 22:50:12 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A53D3206D5;
        Wed, 22 Apr 2020 02:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587523811;
        bh=jeKrgn+vYwXwg75fzJr3ucFd8MMCv3flh6yGk+f3Pv0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XoGzn7sHNE9IV5gmu3y02AdQzZFYq/yUkPoRUxGhldCDhrsPHbLB5xZea4Zx40jwD
         qV60y+HChfjrWQ6PhFaq/dD091NV2zUNxxO15vnCeBT7gvsJqzEaXC3GzYNieanfJc
         XodtmPFw/1zIe5JVy3VK4T5Fl5pGKdrHf9p+9OoQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200419121808.440780-2-bryan.odonoghue@linaro.org>
References: <20200419121808.440780-1-bryan.odonoghue@linaro.org> <20200419121808.440780-2-bryan.odonoghue@linaro.org>
Subject: Re: [PATCH 1/3] clk: qcom: Add DT bindings for msm8939 gcc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Tue, 21 Apr 2020 19:50:10 -0700
Message-ID: <158752381090.132238.9198658810848946174@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bryan O'Donoghue (2020-04-19 05:18:06)
> diff --git a/include/dt-bindings/clock/qcom,gcc-msm8939.h b/include/dt-bi=
ndings/clock/qcom,gcc-msm8939.h
> new file mode 100644
> index 000000000000..f9ac936590f3
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,gcc-msm8939.h
> @@ -0,0 +1,215 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2020 Linaro Limited
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

Please remove the boiler plate that SPDX already covers.

> diff --git a/include/dt-bindings/reset/qcom,gcc-msm8939.h b/include/dt-bi=
ndings/reset/qcom,gcc-msm8939.h
> new file mode 100644
> index 000000000000..a8c8135ce24d
> --- /dev/null
> +++ b/include/dt-bindings/reset/qcom,gcc-msm8939.h
> @@ -0,0 +1,119 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright 2020 Linaro Limited
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

Same.
