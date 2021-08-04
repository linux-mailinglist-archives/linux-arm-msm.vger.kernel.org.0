Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C483E08EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 21:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhHDTqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 15:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhHDTqs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 15:46:48 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C9BC061799
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 12:46:34 -0700 (PDT)
Received: from [192.168.1.101] (83.6.167.155.neoplus.adsl.tpnet.pl [83.6.167.155])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 001EF3F31C;
        Wed,  4 Aug 2021 21:46:30 +0200 (CEST)
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm MSM8996 CPU clock
 driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210804193042.1155398-1-bjorn.andersson@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <bd464d12-6d1c-fff0-9119-fe4ff9d3c5ba@somainline.org>
Date:   Wed, 4 Aug 2021 21:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804193042.1155398-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 04.08.2021 21:30, Bjorn Andersson wrote:
> The MSM8996 supports CPU frequency scaling, so enable the clock driver
> for this.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Konrad Dybcio <konrad.dybcio@somainline.org>


> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c7cf0d1ad34e..3bf6f8a86aae 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -974,6 +974,7 @@ CONFIG_TI_SCI_CLK=y
>  CONFIG_COMMON_CLK_QCOM=y
>  CONFIG_QCOM_A53PLL=y
>  CONFIG_QCOM_CLK_APCS_MSM8916=y
> +CONFIG_QCOM_CLK_APCC_MSM8996=y
>  CONFIG_QCOM_CLK_SMD_RPM=y
>  CONFIG_QCOM_CLK_RPMH=y
>  CONFIG_IPQ_GCC_8074=y
