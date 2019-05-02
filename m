Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0C9117A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2019 12:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfEBKxf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 May 2019 06:53:35 -0400
Received: from ns.iliad.fr ([212.27.33.1]:54500 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbfEBKxf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 May 2019 06:53:35 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 7CCDF216A4;
        Thu,  2 May 2019 12:53:33 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 5C36921681;
        Thu,  2 May 2019 12:53:33 +0200 (CEST)
Subject: Re: [PATCH] clk: gcc-qcs404: Add PCIe resets
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>
References: <20190502002138.10646-1-bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <ecc6a7fb-14a8-3314-d376-433c9f98b692@free.fr>
Date:   Thu, 2 May 2019 12:53:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502002138.10646-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu May  2 12:53:33 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/05/2019 02:21, Bjorn Andersson wrote:

> diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bindings/clock/qcom,gcc-qcs404.h
> index 454b3f43f538..5959399fed2e 100644
> --- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
> +++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
> @@ -166,5 +166,12 @@
>  #define GCC_PCIEPHY_0_PHY_BCR				12
>  #define GCC_EMAC_BCR					13
>  #define GCC_CDSP_RESTART				14
> +#define GCC_PCIE_0_AXI_MASTER_STICKY_ARES		14

Seems weird that there would be two names for the same entry at index 14?
