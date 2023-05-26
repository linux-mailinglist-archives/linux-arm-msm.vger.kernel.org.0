Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CACAF712E75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 22:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243783AbjEZUuE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 16:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243688AbjEZUuA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 16:50:00 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B017E1BF
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 13:49:33 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-309553c5417so1046524f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 13:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685134172; x=1687726172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L2eJzpBFnXHIGc80MTi/wXk17yj9BqAfKVx85U8nI24=;
        b=HVp3g30eA6AO4d3QS2C/LDqkSKj+Ycql6tdC0sm3+9KRI9Q6Qs/CR9PV53r59qSSYO
         O9GgtVCMLI6f43N9gvUoiENfDlsFPmEDEhAjsn9BjIzyFpuNIhZaz2AgC5sEx1VIrpIG
         N/VV7NENpLn0bM9EKixH1gIzznLAvdtpjzwxYO/KF9CR/VAjFW96sE8dql80yEhH0cTr
         N1L2ygiD00/ykEDcbGL9bsd/1F9IDEEkeeZDyWi+JzXXZk4+16gVQQ+MoMVYVBS5CaoI
         V3QWfh8YZsC2ea8oij+YD5KZ2ftAqHu6uNlDpPb5HRhieE+hrtnONnEu+wgF8qrfXCX0
         H5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685134172; x=1687726172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L2eJzpBFnXHIGc80MTi/wXk17yj9BqAfKVx85U8nI24=;
        b=kyE2ifw6iHaCWmRwHeJ3fFcV5TeoeDPi4dHS+I+1uD92JY3g9OApm/DvdOm8LQgSVT
         c3uXco8q/VvUUzsw4no4q1lPzNqKBJXV3zhFeW3RWydv5UTiAp2KPpGFnzFewg2T9TCJ
         7LY6B41M0+M/9AULpEbQ1hfpRy9nTaIvZo3HJdq52SXajxnuLZy9G2IYB1XYvNfDrpcH
         idkVobmt7XAbrTf2K6keff94lNoiDrPuXYK6jjHwyX2AAW6/WnKZsTNKp7/JTKkraNMK
         6RoZ6MyywsG3Cs5HzA6n7MhOWX1e7j7VNaaSEWxHmZ3qvCosvlZNHS86oVDM/YIdWOHd
         ZZrQ==
X-Gm-Message-State: AC+VfDzLRzF6cUyLs0hD9eyiqIeaqXqbdgz2E1baRkPS99KWyGkdyZ67
        IY1iSt4cBlZLU54IsvUs7O8e1Q==
X-Google-Smtp-Source: ACHHUZ7HpQdsR4PfrxZLQju1m6nXXnr/3ZNsI3xxtIDXe1dbYwKuiV52E/s/I1Rh6nN23xuIImNJ8g==
X-Received: by 2002:adf:f6d0:0:b0:305:fbfb:c7d7 with SMTP id y16-20020adff6d0000000b00305fbfbc7d7mr3029438wrp.44.1685134171682;
        Fri, 26 May 2023 13:49:31 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id w8-20020a1cf608000000b003f18b942338sm6243004wmc.3.2023.05.26.13.49.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 13:49:31 -0700 (PDT)
Message-ID: <fa395680-0e6c-3eb0-9d5a-f90a95c394b8@linaro.org>
Date:   Fri, 26 May 2023 21:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/3] media: camss: Link CAMSS power domain
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
References: <20230526180712.8481-1-y.oudjana@protonmail.com>
 <20230526180712.8481-4-y.oudjana@protonmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230526180712.8481-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/05/2023 19:07, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The CAMSS power domain was previously enabled implicitly when the VFE
> power domains were enabled.
> Commit 46cc03175498 ("media: camss: Split power domain management")
> delayed enabling VFE power domains which in turn delayed enabling the
> CAMSS power domain. This made CSIPHY fail to enable camss_top_ahb_clk
> which requires the CAMSS power domain to be on:
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
> Link the CAMSS power domain in camss_configure_pd to make sure it gets
> enabled before CSIPHY tries to enable clocks.
> 
> Fixes: 02afa816dbbf ("media: camss: Add basic runtime PM support")
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
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

Konrad pointed this out.

Are you 100% sure you want to do this. We already have a way to count 
the # of power-domains in camss_configure_pd().

Your series is now adding a dependency on power-domain-names.

Is there a good reason to add that dependency ? If not, then lets just 
take the code from camss_configure_pd() and make it so that it can be 
used/reused here.

---
bod
