Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3C31E99AE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgEaRue (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgEaRud (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:50:33 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1509C061A0E;
        Sun, 31 May 2020 10:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=t5o4BK2xKZN+N/stDYG7dBasqIdG794v6sxkRmMBFD8=; b=TWiYxGu61btEaO8hn8j32LXiw3
        X5LqG4cxMFKkuL0yEG7F17BPTgwZHGSmrA3IncOV/BplW/J932GuQ6jN/PWZiVZMtTtLYV5LModnf
        aCAfm56XvyKX7dFRiZNgQFyJSY55MsPaSOoJkpA5ov6lAESunTN24k4avHzC+TzA+4Ddnj669PPf5
        zAJDAMlO/9NPOwL7tzqPCBCH36VkYpVeULkLuk9M9KUTqQYXrrrfVSJWnRY7wgqkbpfJcyqQXfmgY
        QdPreXeP7Sg7ix21HpOdaxjI+1pl+l0a1yAyLbYJEdC1Zr9lYiOkneyS0shxidtt8QPYyk3qN8ALD
        qeibsgTA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jfS6O-0001DW-JC; Sun, 31 May 2020 17:50:28 +0000
Subject: Re: [PATCH 4/4] driver: clk: Add msm8992 GCC Kconfig and Makefile
 entries
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200531174612.260113-1-konradybcio@gmail.com>
 <20200531174612.260113-5-konradybcio@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d5813ebc-dcb2-afc2-7a7e-71e73113f8fc@infradead.org>
Date:   Sun, 31 May 2020 10:50:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200531174612.260113-5-konradybcio@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/31/20 10:46 AM, Konrad Dybcio wrote:
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> ---
>  drivers/clk/qcom/Kconfig  | 8 ++++++++
>  drivers/clk/qcom/Makefile | 1 +
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 11ec6f466467..d102b4015289 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -197,6 +197,14 @@ config MSM_MMCC_8974
>  	  Say Y if you want to support multimedia devices such as display,
>  	  graphics, video encode/decode, camera, etc.
>  
> +config MSM_GCC_8992
> +	tristate "MSM8992 Global Clock Controller"
> +	select QCOM_GDSC
> +	help
> +	  Support for the global clock controller on msm8992 devices.
> +	  Say Y if you want to use peripheral devices such as UART, SPI,
> +	  i2c, USB, SD/eMMC, PCIe, etc.

	  I2C
please.

> +
>  config MSM_GCC_8994
>  	tristate "MSM8994 Global Clock Controller"
>  	help


-- 
~Randy

