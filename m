Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE3142F5529
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 00:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729446AbhAMXVS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jan 2021 18:21:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727932AbhAMXUd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jan 2021 18:20:33 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1AE9C0617BE
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jan 2021 15:19:07 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1F0423F1D1;
        Thu, 14 Jan 2021 00:17:24 +0100 (CET)
Subject: Re: [PATCH] soc: qcom: geni: shield ICC calls for ACPI boot
To:     Shawn Guo <shawn.guo@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Akash Asthana <akashast@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org
References: <20201228135625.4971-1-shawn.guo@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <32e270de-3d23-f26d-9dd3-85a654a4ad52@somainline.org>
Date:   Thu, 14 Jan 2021 00:17:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201228135625.4971-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 28/12/20 14:56, Shawn Guo ha scritto:
> Currently, GENI devices like i2c-qcom-geni fails to probe in ACPI boot,
> if interconnect support is enabled.  That's because interconnect driver
> only supports DT right now.  As interconnect is not necessarily required
> for basic function of GENI devices, let's shield those ICC calls to get
> GENI devices probe for ACPI boot.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>   drivers/soc/qcom/qcom-geni-se.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
Hello!

To avoid developers booting on ACPI getting "strange slownesses" and 
possibly timeouts with no apparent reason, wouldn't it be a bit more 
proper and friendly to actually send a kernel message to advertise that 
there is *no interconnect support* and that this may lead to the 
aforementioned potential issues?

--Angelo

> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index f42954e2c98e..9feb1d78a5df 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -760,6 +760,9 @@ int geni_icc_get(struct geni_se *se, const char *icc_ddr)
>   	int i, err;
>   	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
>   
> +	if (has_acpi_companion(se->dev))
> +		return 0;
> +
>   	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>   		if (!icc_names[i])
>   			continue;
> @@ -785,6 +788,9 @@ int geni_icc_set_bw(struct geni_se *se)
>   {
>   	int i, ret;
>   
> +	if (has_acpi_companion(se->dev))
> +		return 0;
> +
>   	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>   		ret = icc_set_bw(se->icc_paths[i].path,
>   			se->icc_paths[i].avg_bw, se->icc_paths[i].avg_bw);
> @@ -803,6 +809,9 @@ void geni_icc_set_tag(struct geni_se *se, u32 tag)
>   {
>   	int i;
>   
> +	if (has_acpi_companion(se->dev))
> +		return;
> +
>   	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++)
>   		icc_set_tag(se->icc_paths[i].path, tag);
>   }
> @@ -813,6 +822,9 @@ int geni_icc_enable(struct geni_se *se)
>   {
>   	int i, ret;
>   
> +	if (has_acpi_companion(se->dev))
> +		return 0;
> +
>   	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>   		ret = icc_enable(se->icc_paths[i].path);
>   		if (ret) {
> @@ -830,6 +842,9 @@ int geni_icc_disable(struct geni_se *se)
>   {
>   	int i, ret;
>   
> +	if (has_acpi_companion(se->dev))
> +		return 0;
> +
>   	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
>   		ret = icc_disable(se->icc_paths[i].path);
>   		if (ret) {
> 

