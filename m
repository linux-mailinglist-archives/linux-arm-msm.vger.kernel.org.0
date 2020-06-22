Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1B26203288
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 10:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgFVIvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 04:51:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:35478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbgFVIvn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 04:51:43 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11EED20708;
        Mon, 22 Jun 2020 08:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592815903;
        bh=zZU2CHuLFqnK4HbBINlII1Iia0QVhzVmBgAshjaxrEs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=b4AYHwLCJMc9D7WFTeQ0tGime4u9LvggVD8RioNpey4HMM+dSCByUCdS6Lm9sZSXv
         goQKp6s1D6vW80tHcmh+YHp+sQ8UpNQEskeqN7ePmbSH+V7hWJOSerxOaq/6srUXSG
         O810vXpD4UWW3mSvIYjUuVpiqrAY2IwDtnTVN1Bk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200620182010.395097-1-konradybcio@gmail.com>
References: <20200620182010.395097-1-konradybcio@gmail.com>
Subject: Re: [PATCH 1/1] clk: qcom: gcc-msm8994: Add missing clocks, resets and GDSCs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To:     Konrad Dybcio <konradybcio@gmail.com>, skrzynka@konradybcio.pl
Date:   Mon, 22 Jun 2020 01:51:42 -0700
Message-ID: <159281590234.62212.14723968355916401794@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2020-06-20 11:20:09)
> diff --git a/include/dt-bindings/clock/qcom,gcc-msm8994.h b/include/dt-bi=
ndings/clock/qcom,gcc-msm8994.h
> index 938969309e00..d32c3fd2500c 100644
> --- a/include/dt-bindings/clock/qcom,gcc-msm8994.h
> +++ b/include/dt-bindings/clock/qcom,gcc-msm8994.h
> @@ -106,25 +106,62 @@
>  #define GCC_GP1_CLK                            96
>  #define GCC_GP2_CLK                            97
>  #define GCC_GP3_CLK                            98
> -#define GCC_PCIE_0_AUX_CLK                     99
> -#define GCC_PCIE_0_PIPE_CLK                    100
> -#define GCC_PCIE_1_AUX_CLK                     101
> -#define GCC_PCIE_1_PIPE_CLK                    102
> -#define GCC_PDM2_CLK                           103
> -#define GCC_SDCC1_APPS_CLK                     104
> -#define GCC_SDCC2_APPS_CLK                     105
> -#define GCC_SDCC3_APPS_CLK                     106
> -#define GCC_SDCC4_APPS_CLK                     107
> -#define GCC_SYS_NOC_UFS_AXI_CLK                        108
> -#define GCC_SYS_NOC_USB3_AXI_CLK               109
> -#define GCC_TSIF_REF_CLK                       110
> -#define GCC_UFS_AXI_CLK                                111
> -#define GCC_UFS_RX_CFG_CLK                     112
> -#define GCC_UFS_TX_CFG_CLK                     113
> -#define GCC_USB30_MASTER_CLK                   114
> -#define GCC_USB30_MOCK_UTMI_CLK                        115
> -#define GCC_USB3_PHY_AUX_CLK                   116
> -#define GCC_USB_HS_SYSTEM_CLK                  117
> -#define GCC_SDCC1_AHB_CLK                      118
> +#define GCC_LPASS_Q6_AXI_CLK            99
> +#define GCC_MSS_Q6_BIMC_AXI_CLK         100
> +#define GCC_PCIE_0_AUX_CLK                     101

You can't do this. The numbers are an ABI that should not change. Just
keep tacking on new numbers and new defines instead.

> +#define GCC_PCIE_0_CFG_AHB_CLK      102
> +#define GCC_PCIE_0_MSTR_AXI_CLK     103
> +#define GCC_PCIE_0_PIPE_CLK                    104
> +#define GCC_PCIE_0_SLV_AXI_CLK      105
> +#define GCC_PCIE_1_AUX_CLK                     106
