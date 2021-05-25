Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1365390763
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 19:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbhEYRVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 13:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233734AbhEYRVZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 13:21:25 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF311C06138A
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 10:19:54 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id c10so26204487lfm.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 10:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KPA85+pVUMYupdXZPma0ObO1PTTUfnEpzIAuWKgyd0E=;
        b=DMMCiaWwFnD8V/gfW/+kj1uqfbf0mGEegArCjJrHG3Ka2L5Xp1vnBH299eWfCoYbv9
         R8D42RDi5v+1k3TgohnL4yJjRNG+P9rrfUbGGlPOE1bx1tIti0lSHAUSG9nZyqL5Cnvr
         RtR8yRLNEqCitv3PjQ2S8M/64Vqi4S+0YCnSYlunhCJpwMefFFA5Oaonk4DlYNQcw+S/
         exS+PEYxUNK/ASTdhi4FY0IsDwjuFgFzSUqPINWCMmJkUb5eP8qFFqQ0O6/V4T22MobP
         aLjkj9pCKIwJnByFZg+DcX4ZqjRtr1AYDcOplvQFLOl5+belOrBwhW6XS/EvChsbO7gl
         0LGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KPA85+pVUMYupdXZPma0ObO1PTTUfnEpzIAuWKgyd0E=;
        b=tJEmY7mZkvNs2bD9XbWVkADuBIsoId+yhwXo2fOvCwifjFpEBW5dzSVynkJlyf1Gq+
         L7EcSKZvAyrhoPJrBHx/Sf77ZGB8Q44BWFgLRY2JAv+rYVLvmoMWIDVCS0YNW4yBOkR8
         Wv5d1IUbfrUJ6KjyaFyMFkgitT6q2311j+hKoz+9xHWmN1P0Ci8JPOg1tUoKpLJrBXwl
         fIxB4XoY7T9gokC8KojG1hfcTiagS4zvxfiVHzKwby8LiYJcWgemo39EI6kb4ku1eSZX
         D56qRgqqMXl8jeaep/OBXA56lgPGEZ5CjreaUGwIQ9DMXxLcYrdc+lbBC2xXMvW9/Szt
         Qseg==
X-Gm-Message-State: AOAM530euzgDk7cDMn2XNyLN6D3z8LfRsbfer+1IBj+oNY/N89UKiF7h
        soxn3MPtrDoCqUs/gW6P7mBNKw==
X-Google-Smtp-Source: ABdhPJyK0vIdrS8VO9V+kghbhtH/MsTnD5At14brJd+4kwYjU1T00vJXDjmvGxQERyVqtLNeAEsqcA==
X-Received: by 2002:ac2:48b9:: with SMTP id u25mr14413867lfg.409.1621963193003;
        Tue, 25 May 2021 10:19:53 -0700 (PDT)
Received: from [192.168.88.254] ([85.249.41.56])
        by smtp.gmail.com with ESMTPSA id 127sm161629lfc.120.2021.05.25.10.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 10:19:52 -0700 (PDT)
Subject: Re: [PATCH 03/17] media: camss: csiphy-3ph: add support for SM8250
 CSI DPHY
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210511180728.23781-1-jonathan@marek.ca>
 <20210511180728.23781-4-jonathan@marek.ca>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <e1188621-aa8d-d825-7454-491ffdec27c1@linaro.org>
Date:   Tue, 25 May 2021 20:19:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511180728.23781-4-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jonathan,

Thank you for the patchset!

On 11.05.2021 21:07, Jonathan Marek wrote:
> Add support for CSIPHY (2PH/DPHY mode) found on SM8250 hardware.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   .../qcom/camss/camss-csiphy-3ph-1-0.c         | 144 +++++++++++++++++-
>   1 file changed, 137 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index 783b65295d20..61947576ddfb 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -62,6 +62,7 @@ struct csiphy_reg_t {
>   	u32 csiphy_param_type;
>   };
>   
> +/* GEN2 1.0 2PH */
>   static const struct
>   csiphy_reg_t lane_regs_sdm845[5][14] = {
>   	{
> @@ -146,6 +147,121 @@ csiphy_reg_t lane_regs_sdm845[5][14] = {
>   	},
>   };
>   
> +/* GEN2 1.2.1 2PH */
> +static const struct
> +csiphy_reg_t lane_regs_sm8250[5][20] = {
> +	{
> +		{0x0030, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0900, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0908, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0904, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0904, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0034, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0010, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x001C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0008, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x0000, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x000c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0024, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +	{
> +		{0x0730, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C80, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C88, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C84, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C84, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0734, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0710, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x071C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0708, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x070c, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0724, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +	{
> +		{0x0230, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0A00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0A08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0A04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0A04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0234, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0210, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x021C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0208, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x0200, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x020c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0228, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0224, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +	{
> +		{0x0430, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0B00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0B08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0B04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0B04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0434, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0410, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x041C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0408, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x0400, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x040c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0428, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0424, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +	{
> +		{0x0630, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C00, 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C08, 0x10, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C04, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0C04, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0634, 0x07, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0610, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x061C, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0608, 0x10, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
> +		{0x0600, 0x8D, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x060c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0628, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0624, 0x00, 0x00, CSIPHY_DNP_PARAMS},
> +		{0x0800, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +		{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	},
> +};
> +
>   static void csiphy_hw_version_read(struct csiphy_device *csiphy,
>   				   struct device *dev)
>   {
> @@ -298,13 +414,23 @@ static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
>   static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   				     u8 settle_cnt)
>   {
> -	int i, l;
> -	u32 val;
> +	const struct csiphy_reg_t *r;
> +	int i, l, array_size;
> +	u32 val, lane_enable;
> +
> +	switch (csiphy->camss->version) {
> +	case CAMSS_845:
> +		r = &lane_regs_sdm845[0][0];
> +		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
> +		break;
> +	case CAMSS_8250:

CAMSS_8250 is only introduced in "[PATCH 16_17] media: camss: add support for SM8250 camss",
and this breaks bisecting.

Thanks,
Andrey

> +		r = &lane_regs_sm8250[0][0];
> +		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
> +		break;
> +	}
>   
>   	for (l = 0; l < 5; l++) {
> -		for (i = 0; i < 14; i++) {
> -			const struct csiphy_reg_t *r = &lane_regs_sdm845[l][i];
> -
> +		for (i = 0; i < array_size; i++, r++) {
>   			switch (r->csiphy_param_type) {
>   			case CSIPHY_SETTLE_CNT_LOWER_BYTE:
>   				val = settle_cnt & 0xff;
> @@ -331,7 +457,10 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   
>   	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>   
> -	val = BIT(c->clk.pos);
> +	if (csiphy->camss->version == CAMSS_8250)
> +		val = BIT(7);
> +	else
> +		val = BIT(c->clk.pos);
>   	for (i = 0; i < c->num_data; i++)
>   		val |= BIT(c->data[i].pos * 2);
>   
> @@ -349,7 +478,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>   	if (csiphy->camss->version == CAMSS_8x16 ||
>   	    csiphy->camss->version == CAMSS_8x96)
>   		csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
> -	else if (csiphy->camss->version == CAMSS_845)
> +	else if (csiphy->camss->version == CAMSS_845 ||
> +		 csiphy->camss->version == CAMSS_8250)
>   		csiphy_gen2_config_lanes(csiphy, settle_cnt);
>   
>   	/* IRQ_MASK registers - disable all interrupts */
> 
