Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28484792772
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 18:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239243AbjIEQHh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:07:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353618AbjIEGxs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 02:53:48 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDABCCB
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Sep 2023 23:53:44 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-500c37d479aso3326201e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Sep 2023 23:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693896823; x=1694501623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Izf9D/2+QCxj63n+3E1FgS/vF5uxnLmMdD6owrWKaTI=;
        b=yS15iqhGiqR/WLZpBWmrFNX7fw4bnZ2mNwCS/ekLGW/AAi7YWdGKuRDD7yG/Ho2QXv
         w52ltrpNfkwq7gwfUUq4MxUC2HlYd9gXAOw0vytajxaHEftVfzS0sW+26rzn5/nfX6D+
         kWjSqFtBcswG8SwTYAyzXpxUd8HyyLNeBqfoyu0NORrH1x2vqvqw4PXO7bK2IG1nG3s9
         ntM6X98ETztUuXLV8ioHm9zwDkwOX4SpFDGw0GNCIqHyn8XMVLfXJppqTcTLN3fNQEEO
         ywJQT0I9k+urjng1hvqaI6jJGbXnIfRC/qYnEfZ7lBBv88MVtOu0rduQUwJzhrN5DFyR
         myMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693896823; x=1694501623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Izf9D/2+QCxj63n+3E1FgS/vF5uxnLmMdD6owrWKaTI=;
        b=T5OYT4WG33SaiIvi31WA7lTWPT04unOdsmz+SfCztQvJSKWMTA9iCaZ9y3xuqxui1X
         N0mmHRoQAGRaOjDCrLh98Bw7BApm76ezXp4FaGcuqhnD8It5IVkQnhqxeIV7QZeaju/p
         0iFyVibIUGIphSHbb4orDlltls0RnBjnbr+2iXPzQLplbHrpASe1blHfGKxzzyV9BO1f
         mXAAFEPbFUwtIBYbmmNjg5b7hMeiS6YVFbP20TV7WhMnm8uGBp0RHTrf1bbXAEXAI4e8
         HJa+Zs4UBfSaQbeSD79ujHQCaoXshDdz8/q2pp+znGsvLvLdXR0RjVctpUpdUappLF8p
         5aiA==
X-Gm-Message-State: AOJu0Yzhthh7BCWdHXWaOQWKdA/CPNt+zrZmKlmjCDF5Q+zqSiHxC69f
        2pHYI20BjWqnhWybSLNY/nSf0Q==
X-Google-Smtp-Source: AGHT+IFpYW2gPZ9YVcWIrdDgHaIlEODhpL1a8LmUe3Zf9ieJIDPP1nIiNG/9Jz9wjz5FFSW2ODeJJQ==
X-Received: by 2002:a05:6512:b8c:b0:500:8725:1351 with SMTP id b12-20020a0565120b8c00b0050087251351mr10635688lfv.47.1693896822729;
        Mon, 04 Sep 2023 23:53:42 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id w26-20020a50fa9a000000b0052a401d8ef6sm6759359edr.71.2023.09.04.23.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 23:53:42 -0700 (PDT)
Message-ID: <f49b9075-93b7-6f4a-ef80-543bd5b497e2@linaro.org>
Date:   Tue, 5 Sep 2023 08:53:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 5/5] phy: qcom-qmp-usb: Add Qualcomm SDX75 USB3 PHY
 support
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, abel.vesa@linaro.org,
        quic_wcheng@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel@quicinc.com
References: <1693889028-6485-1-git-send-email-quic_rohiagar@quicinc.com>
 <1693889028-6485-6-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1693889028-6485-6-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/09/2023 06:43, Rohit Agarwal wrote:
> Add support for USB3 QMP PHY found in SDX75 platform.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---



>  
> +static const struct qmp_phy_cfg sdx75_usb3_uniphy_cfg = {
> +	.lanes			= 1,
> +	.offsets		= &qmp_usb_offsets_v5,
> +
> +	.serdes_tbl		= sdx75_usb3_uniphy_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(sdx75_usb3_uniphy_serdes_tbl),
> +	.tx_tbl			= sdx75_usb3_uniphy_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(sdx75_usb3_uniphy_tx_tbl),
> +	.rx_tbl			= sdx75_usb3_uniphy_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(sdx75_usb3_uniphy_rx_tbl),
> +	.pcs_tbl		= sdx75_usb3_uniphy_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(sdx75_usb3_uniphy_pcs_tbl),
> +	.pcs_usb_tbl		= sdx75_usb3_uniphy_pcs_usb_tbl,
> +	.pcs_usb_tbl_num	= ARRAY_SIZE(sdx75_usb3_uniphy_pcs_usb_tbl),
> +	.clk_list		= qmp_v4_sdx55_usbphy_clk_l,
> +	.num_clks		= ARRAY_SIZE(qmp_v4_sdx55_usbphy_clk_l),
> +	.reset_list		= msm8996_usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= qmp_v5_usb3phy_regs_layout,
> +	.pcs_usb_offset		= 0x1000,
> +
> +	.has_pwrdn_delay	= true,
> +

Stray blank line

> +};
> +
>  static const struct qmp_phy_cfg sm8350_usb3phy_cfg = {
>  	.lanes			= 2,
>  
> @@ -1985,6 +2141,7 @@ static int qmp_usb_init(struct phy *phy)
>  	void __iomem *dp_com = qmp->dp_com;
>  	int ret;
>  
> +

No need for this.

Best regards,
Krzysztof

