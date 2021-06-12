Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A083A50F1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 23:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbhFLVXB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Jun 2021 17:23:01 -0400
Received: from vps5.brixit.nl ([192.81.221.234]:46338 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbhFLVXA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Jun 2021 17:23:00 -0400
Received: from [192.168.20.2] (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id AF46F607EB;
        Sat, 12 Jun 2021 21:20:56 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] arch: arm64: dts: qcom: Add support for SM6125
To:     Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
References: <20210612094652.90354-1-martin.botka@somainline.org>
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <d98a8361-5ee5-cde3-03e0-8f61af6686cd@postmarketos.org>
Date:   Sun, 13 Jun 2021 00:20:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210612094652.90354-1-martin.botka@somainline.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> +		sdhc_1: sdhci@4744000 {
> +			compatible = "qcom,sm6125-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0x04744000 0x1000>, <0x04744000 0x1000>;
> +			reg-names = "hc_mem", "core_mem";

ichernev: reg-names should be "hc" and "cqhci" and the 2 values you've 
supplied should be different maybe?

> +
> +		sdhc_2: sdhci@4784000 {
> +			compatible = "qcom,sm6125-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0x04784000 0x1000>;
> +			reg-names = "hc_mem";

Wrong reg names again?

-- 
Regards
Alexey Minnekhanov
