Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4566F544A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 11:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjECJP5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 05:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjECJPz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 05:15:55 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC5E4ED5
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 May 2023 02:15:41 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3064099f9b6so405599f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 May 2023 02:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683105340; x=1685697340;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nnxyxW2LIpf3FgeSjcXMHAhw+bRdl8x1S9X/p8vOn8g=;
        b=feDSc/GDEr/cMdnO8DNyIkvRHLZWiFTFiTYkgBFr/SofSWuU8hc9ghLqVwAPHd7/RF
         C7cuIDPZwxNzL7BGVyEw6FJlowwUq1Z8X80XYlqn1ntGgXVB9xfmefP6GtWs7CM7kPFK
         nYIUk3o+dyLfUy0tmXAXn5yu5Oyxd/n5gg74cRb/IB/kz98y327PagIk9YjKtxKN82JG
         0mGqcnuUvuZrM+uKOzZPIcBUVRF0Oa+uKhwX1S7+5u1R0vN+UG1sn1Cb7gns4hwJzaW7
         1PQhcZ3EfEne/B/G1AAqtFuq2pyt6fCBq76rUTKPEhr1XnV3MAAJ4dQ/9U48bgxQbiqa
         9H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683105340; x=1685697340;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nnxyxW2LIpf3FgeSjcXMHAhw+bRdl8x1S9X/p8vOn8g=;
        b=NqsUdgdfG0P/Fn1iJaHkU1qO7hPX3TFpWUgS0/c4K2NELj26XSG72gv/HZB01Fk1Mz
         iEPWCjufNqArAMgYJz8Mewc0WxmXB6I8uBsHFzUywlXZRXWrpuCRI/DFXYP8oldAuCr7
         VWxuTTVSQ6xWJNMlRXoh+buYP3bLe8mlGpRDDrS0Dq6nqtwukYBJtPlBwtPFyosuoqac
         H7c5soKwnEF8AhDA5P71QIMZrang1hzvEcEezFLrglELd3IJ6Wci4Oersq/gv2Fw6UII
         x/Fj05tVDDuYyKI2Oub6OnaoCF1TmzUCbXCOpo5WaTKdC8P76yd2TALxJpShQZQ3MJO6
         8gfA==
X-Gm-Message-State: AC+VfDxcyiXwngjRzSGZZZvr+EwxaenNSvkGZa/CN4cHgVYJhxSo/U/L
        rjlOP63o++TFnTMloobgQw90wg==
X-Google-Smtp-Source: ACHHUZ6eaGsYv3iCIVixt5Sj/mxQl+JmS4dm2WtL7LWCgzs7EZI/uUAjKQonoxTmKNjnBFAaXy59Ww==
X-Received: by 2002:adf:e28a:0:b0:302:1b72:b951 with SMTP id v10-20020adfe28a000000b003021b72b951mr14017544wri.26.1683105340350;
        Wed, 03 May 2023 02:15:40 -0700 (PDT)
Received: from [197.55.55.58] ([93.107.151.186])
        by smtp.gmail.com with ESMTPSA id p1-20020a05600c204100b003ed2c0a0f37sm1259871wmg.35.2023.05.03.02.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 02:15:39 -0700 (PDT)
Message-ID: <5d2814e8-b44d-39b2-8f1e-2751b66c33a9@linaro.org>
Date:   Wed, 3 May 2023 10:15:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] media: camss: Link CAMSS power domain
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Hans Verkuil <hansverk@cisco.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230503072543.4837-1-y.oudjana@protonmail.com>
 <20230503072543.4837-4-y.oudjana@protonmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230503072543.4837-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/05/2023 08:25, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The CAMSS power domain was previously enabled implicitly when the VFE power domains
> were enabled. Commit 46cc03175498 (media: camss: Split power domain management, 2022-07-04)
> delayed enabling VFE power domains which in turn delayed enabling the CAMSS power domain.
> This made CSIPHY fail to enable camss_top_ahb_clk which requires the CAMSS power domain to
> be on:
> 
> [  199.097810] ------------[ cut here ]------------
> [  199.097893] camss_top_ahb_clk status stuck at 'off'
> [  199.097913] WARNING: CPU: 3 PID: 728 at drivers/clk/qcom/clk-branch.c:91 clk_branch_wait+0x140/0x160
> ...
> [  199.100064]  clk_branch_wait+0x140/0x160
> [  199.100112]  clk_branch2_enable+0x30/0x40
> [  199.100159]  clk_core_enable+0x6c/0xb0
> [  199.100211]  clk_enable+0x2c/0x50
> [  199.100257]  camss_enable_clocks+0x94/0xe0 [qcom_camss]
> [  199.100342]  csiphy_set_power+0x154/0x2a0 [qcom_camss]
> ...
> [  199.101594] ---[ end trace 0000000000000000 ]---
> 
> Link the CAMSS power domain in camss_configure_pd to make sure it gets enabled before
> CSIPHY tries to enable clocks.
> 
> Fixes: 02afa816dbbf (media: camss: Add basic runtime PM support, 2018-07-25)
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Same comment as in the cover letter, your Fixes: tag is broken

WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> 
("<title line>")' - ie: 'Fixes: 02afa816dbbf ("media: camss: Add basic 
runtime PM support")'
#28:
Fixes: 02afa816dbbf (media: camss: Add basic runtime PM support, 2018-07-25)

> ---
>   drivers/media/platform/qcom/camss/camss.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 1ef26aea3eae..9aea8220d923 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1453,6 +1453,7 @@ static const struct media_device_ops camss_media_ops = {
>   static int camss_configure_pd(struct camss *camss)
>   {
>   	struct device *dev = camss->dev;
> +	int camss_pd_index;
>   	int i;
>   	int ret;
>   
> @@ -1496,7 +1497,13 @@ static int camss_configure_pd(struct camss *camss)
>   		}
>   	}
>   
> -	if (i > camss->vfe_num) {
> +	/* Link CAMSS power domain if available */
> +	camss_pd_index = device_property_match_string(camss->dev, "power-domain-names", "camss");
> +	if (camss_pd_index >= 0)
> +		device_link_add(camss->dev, camss->genpd[camss_pd_index], DL_FLAG_STATELESS |
> +				DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> +
> +	if (i > camss->vfe_num && i != camss_pd_index) {
>   		camss->genpd_link[i - 1] = device_link_add(camss->dev, camss->genpd[i - 1],
>   							   DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
>   							   DL_FLAG_RPM_ACTIVE);

The rest of it seems reasonable to me. I'll give it a R/B T/B on your 
next iteration - including Fixes: fix as I'm OOO ATM.

---
bod
