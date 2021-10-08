Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21878426CC9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 16:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbhJHOfa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 10:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230456AbhJHOfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 10:35:30 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14593C061762
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Oct 2021 07:33:35 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id v10so13956547oic.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Oct 2021 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QgfxwBmF1+monDAdjg0g2KuWwbKnod/mIT9QO6h2iro=;
        b=kZZWfT+PowKkZ01WdnR/B1jT/bbJbNn/nk3qm9dOEkSnkXGMSnwCE5oj5OyGVzAKlD
         8g7BU3Wbwxtygo0NG7m8z1G1h91Zn2H8Uzr6zZItNJ+ctbiNn8SP2V+Uei79rv/VMoD6
         ntkssCThEGK9QfAG36PGku21bWbycBVhaBd+4krVLC28qKTTxXCMLIp6Q6SLREmWI5YP
         poopFO0ZBSFYuieiYcNJh9uxZr4n3JzdYH53+9son7vCgu+hw17EoMk6xX/GYczF28lB
         NvWQ/hyqS4KHgD/S6OdDWD81XkhNT9Q0SJewpDCE1gE/AYAeqc74WsjlHK9Oj/CEj1Sk
         MeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QgfxwBmF1+monDAdjg0g2KuWwbKnod/mIT9QO6h2iro=;
        b=Oh3pX5uVPuRNwZY4e+5xYtUOvmaiORBla8K2oIK7727K42HfoOf9uino8rN8PNTrYD
         p8NsZ/EThJkdGJYMe0zbj7zLY+yD+4gX52Mp1A7BBQcQobWFOmxbnQ19bz1t5boIqsYA
         G5yoDwzb1Ux1oYCTziR75X4Htj6ldRqJUfXXMjMeZtKTqOQ9AMyrPf41w8b2q+qrw3wP
         D5cep/WV4QZg5fGCnvnqXrJrO5mj7va8LUGRkXv1XqBElJnHJAluMKLYGz6C8boNXJDq
         tXIyEgC7JrhTidvhXQ30D2qZHbUqxQmfcZwJJQnibuVn7Oo5OBwnEoVpr04RlQtjCzXi
         61LA==
X-Gm-Message-State: AOAM532d3mmqm5tRtHY9IDRyFiJdVdrNmGZsENfIN3tbtJgEtH9wfhJv
        amqiz6zT7FTRncz/FwIENlvhAw==
X-Google-Smtp-Source: ABdhPJztPy3B1mNAjhJ8cMLMpGBuT+PpLTVRAsaup4KklmIJNTxLcde2Bhdop0OObqSvkVfXvO+m7Q==
X-Received: by 2002:aca:3656:: with SMTP id d83mr16497564oia.176.1633703614214;
        Fri, 08 Oct 2021 07:33:34 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id u9sm720809oiu.19.2021.10.08.07.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 07:33:33 -0700 (PDT)
Date:   Fri, 8 Oct 2021 07:35:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: Re: [PATCH v3] ASoC: qcom: soundwire: Enable soundwire bus clock for
 version 1.6
Message-ID: <YWBXIIjPP7Qunyvf@ripper>
References: <1633671232-30310-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633671232-30310-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 07 Oct 22:33 PDT 2021, Srinivasa Rao Mandadapu wrote:

> Add support for soundwire 1.6 version to gate RX/TX bus clock.
> 

Are you really adding soundwire 1.6 support in order to gate RX/TX bus
clock?

Could it be that you're ungating the bus clock so that soundwire 1.6
starts working? The commit message should properly describe why you're
doing your change.

> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

Venkata is the first who certified the origin of this patch, yet you're
the author. Either this should be From Venkata (i.e. git commit
--author) or perhaps you need a Co-developed-by here to say that you
collaborated on this and both certify its origin.

> ---
> Changes since v2:
>     -- Update error check after ioremap.

What about the other things I noted in v2?

> Changes since v1:
>     -- Add const name to mask value.
> 
>  drivers/soundwire/qcom.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 0ef79d6..bd6fabd 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -109,6 +109,7 @@
>  #define SWR_MAX_CMD_ID	14
>  #define MAX_FIFO_RD_RETRY 3
>  #define SWR_OVERFLOW_RETRY_COUNT 30
> +#define SWRM_HCTL_REG_MASK ~BIT(1)
>  
>  struct qcom_swrm_port_config {
>  	u8 si;
> @@ -127,6 +128,7 @@ struct qcom_swrm_ctrl {
>  	struct device *dev;
>  	struct regmap *regmap;
>  	void __iomem *mmio;
> +	char __iomem *swrm_hctl_reg;
>  	struct completion broadcast;
>  	struct completion enumeration;
>  	struct work_struct slave_work;
> @@ -610,6 +612,12 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
>  	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
>  
> +	if (ctrl->swrm_hctl_reg) {
> +		val = ioread32(ctrl->swrm_hctl_reg);
> +		val &= SWRM_HCTL_REG_MASK;

Make a define with a name that clarifies what BIT(1) is and use that
here, hiding a magic number in an empty define isn't making this more
maintainable.

Essentially put the name of the bit in the register description in a
define and use that here.

> +		iowrite32(val, ctrl->swrm_hctl_reg);
> +	}
> +
>  	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>  
>  	/* Enable Auto enumeration */
> @@ -1200,7 +1208,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	struct qcom_swrm_ctrl *ctrl;
>  	const struct qcom_swrm_data *data;
>  	int ret;
> -	u32 val;
> +	int val, swrm_hctl_reg = 0;

Don't you get a warning from passing val as an int to a function that
takes a u32 pointer?

Also there's no reason to zero-initialize swrm_hctl_reg.

>  
>  	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
>  	if (!ctrl)
> @@ -1251,6 +1259,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	ctrl->bus.port_ops = &qcom_swrm_port_ops;
>  	ctrl->bus.compute_params = &qcom_swrm_compute_params;
>  
> +	if (!of_property_read_u32(dev->of_node, "qcom,swrm-hctl-reg", &swrm_hctl_reg)) {

As I said in my feedback of v2, this property is not documented in the
DT binding.


But more important, upstream we do not approve of the downstream
methodology of having properties pointing to single registers in some
memory block somewhere.

Describe the hardware block that you reference fully in devicetree and
make a proper reference to it.

Unfortunately your patch lacks details necessary to know where this
register lives, so it's not possible for me to recommend a proper
design.

Regards,
Bjorn

> +		ctrl->swrm_hctl_reg = devm_ioremap(&pdev->dev, swrm_hctl_reg, 0x4);
> +		if (!ctrl->swrm_hctl_reg)
> +			return -ENODEV;
> +	}
>  	ret = qcom_swrm_get_port_config(ctrl);
>  	if (ret)
>  		goto err_clk;
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
