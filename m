Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9ABC662ECB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 19:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbjAISXl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 13:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237543AbjAISXE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 13:23:04 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B322DF64
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 10:22:09 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bn26so9139358wrb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 10:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvYugD5smOlPeb8yw4a3uYKIpMLS5cDQVS3icNcFMKA=;
        b=Z6PyaEpVm6gQZPhyOA+umXIzP1gj2ivonb832kvaPK2LHBAyLgqzEzWs+trmEE0Jln
         khMmlms5Uv6PhL4q8PhFwsygO3DHLGc4l5gyw4ZBVAMxJaFNOTa/D+37v6hQEgNUi6HJ
         MwrpiJXqxUpvHZ/jLL+pwFgBfNyRIeOFG6BE2kS+7uUlUG3H6z1r5xzHXB+rv1s49c7Z
         /cxqXGU2xlMj3qBcL9i+f7FQf/GhDu4ibCR+/YuG/aUITAgdMLmIeG9x8sQ8tEVru5a6
         NNDcVLsWYktntSaFMN0HlSbfAEBeUesEeaNrLaNMlba8+UyRhbCP48f1qqKf5QYGnay+
         VoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvYugD5smOlPeb8yw4a3uYKIpMLS5cDQVS3icNcFMKA=;
        b=TGYP6g61hjO0ZEx1EQdWuK6WUaehGjE9fFmc1vIZkrrSHmcf9Yz6PRZlZy9+Pcck29
         qyOVw5e+4m8B7peEeuYUre4SPTvT21XdPh/FH0u+TdEDV9hXI08LyM3r8RrsBhIUflp7
         NKlCY+6rW84juR2c5r4MioJCtmdV7VctTdAdTXbjEtsPc4TLLJzMLXgE5Nx85Zv86svq
         BCNpH8l2FB60MXjd5t7CxWnO+PrCg8S0PI+rQOHpGmMI/jwtq4TXJz4B+rr8JWzWyUi5
         GFIgW46MKBNU4PstVrlYvIB4nuS99+eAj4y7pe8sZNL4mhMAV7tn0xqjYrz0CKdrl15e
         kYCw==
X-Gm-Message-State: AFqh2kpHar9LPk4rQ7SbejMbnJON65kDkO1mZNb2uR+DZjflIN0fHHEu
        E0zNAY9v++NqAh9wbiWsZtYwBw==
X-Google-Smtp-Source: AMrXdXvjfzGBA2k+30sjPaP84E+50hgotZRZMLKqmz8cAfThUKaz2IKhBGPXhX7+mGfJd+LOudPNGg==
X-Received: by 2002:a5d:5544:0:b0:26d:2af7:420 with SMTP id g4-20020a5d5544000000b0026d2af70420mr40676769wrw.33.1673288528036;
        Mon, 09 Jan 2023 10:22:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o15-20020a5d62cf000000b002bbedd60a9asm3589168wrv.77.2023.01.09.10.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 10:22:07 -0800 (PST)
Message-ID: <e96fcaee-488f-53ff-5fb2-0cea411677b9@linaro.org>
Date:   Mon, 9 Jan 2023 19:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 07/18] interconnect: qcom: add a driver for sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org, Shazad Hussain <quic_shazhuss@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
 <20230109174511.1740856-8-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230109174511.1740856-8-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 18:45, Bartosz Golaszewski wrote:
> From: Shazad Hussain <quic_shazhuss@quicinc.com>
> 
> Introduce QTI SA8775P-specific interconnect driver.
> 

> +
> +static struct qcom_icc_desc sa8775p_pcie_anoc = {
> +	.nodes = pcie_anoc_nodes,
> +	.num_nodes = ARRAY_SIZE(pcie_anoc_nodes),
> +	.bcms = pcie_anoc_bcms,
> +	.num_bcms = ARRAY_SIZE(pcie_anoc_bcms),
> +};
> +
> +static struct qcom_icc_bcm *system_noc_bcms[] = {
> +	&bcm_sn0,
> +	&bcm_sn1,
> +	&bcm_sn3,
> +	&bcm_sn4,
> +	&bcm_sn9,
> +};
> +
> +static struct qcom_icc_node *system_noc_nodes[] = {
> +	[MASTER_GIC_AHB] = &qhm_gic,
> +	[MASTER_A1NOC_SNOC] = &qnm_aggre1_noc,
> +	[MASTER_A2NOC_SNOC] = &qnm_aggre2_noc,
> +	[MASTER_LPASS_ANOC] = &qnm_lpass_noc,
> +	[MASTER_SNOC_CFG] = &qnm_snoc_cfg,
> +	[MASTER_PIMEM] = &qxm_pimem,
> +	[MASTER_GIC] = &xm_gic,
> +	[SLAVE_SNOC_GEM_NOC_GC] = &qns_gemnoc_gc,
> +	[SLAVE_SNOC_GEM_NOC_SF] = &qns_gemnoc_sf,
> +	[SLAVE_SERVICE_SNOC] = &srvc_snoc,
> +};
> +
> +static struct qcom_icc_desc sa8775p_system_noc = {

This and several others are const, which means you started entire work
on some old code. It's quite a waste of your effort as now you have to
get all the patches we did for cleanups. Much better to start off from a
newest file. If you based work on downstream code, then this definitely
needs many fixes...

Best regards,
Krzysztof

