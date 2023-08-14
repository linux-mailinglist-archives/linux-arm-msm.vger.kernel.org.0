Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C21077B5DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Aug 2023 12:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234532AbjHNKBZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Aug 2023 06:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232842AbjHNKBK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Aug 2023 06:01:10 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB0AE63
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 03:01:05 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5255da974c4so1474815a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Aug 2023 03:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692007264; x=1692612064;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nL+EHUA/uKFrlAinGpjs7G30G5W0XktNCbRRSoAi6U=;
        b=ngVd/4H407ieSEPUYCQ7XfVknlGj4f3pBa05+BUcO2bHQ4TbZj2sdqdzndMBcUzokw
         6eMEszRrZXxZ/HfThRXEtMnRQS/xCu6Ea1NHHc4xnWMWfuTzhR2tPvd2rph2t/1e0XIf
         kNvo/Qxb4rnrtNWeMUATU1u00pKB9li41HAiTnbNdXMmL/gC0AJRE6aiMu8jMo7tSYKy
         tWmUYjJQ1qm3nDwPr8pirz9ITp2RJowWvzY7mGBe6TkEX/RugFUO+vDgeVetKn5ui9vK
         T4HvqbxGTi/QZMNSEZ1p75bXQtE2rhPfQ3rnawqwZNLSko9jRzMKXfcLQU4lu+wuEWkK
         mEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692007264; x=1692612064;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8nL+EHUA/uKFrlAinGpjs7G30G5W0XktNCbRRSoAi6U=;
        b=klybpCMb4zqREyLWhzeM5UyrX1+GmcMuuCGYUz8RukorZMd0sxP+HmHBB/PDUi1eEP
         2ru4k6apgPvvrYG+94a1d/BgpClpX9jZqCrzJIWIZCYkPAZ2NSDUdgFjzTdP9iaXvVbQ
         ZB4WxDz+dc1i+oVg6yMTM+qix8Wd3VV+0RF0myVZNqlXSF8kx0QAbZaBXvLgyiSRJIeb
         2myl7ShwHTwDW3jPviUEQuiGLqGhW/9zN4515tXo5GECFhwI6KGtk/LB+cI5IKN/+Ujt
         NwYNtgys4qZFYRFECPkt5F12eqoxtGOdC6EwjJfA7N/UIMtRn6O4y6FjSyK8EESnmILG
         dzYg==
X-Gm-Message-State: AOJu0YzosAdv00qutXjwMlnnzCS80IQJl19SY+GFsAC/ykQ2hXUe2SmR
        yT1lN506Lkxjo5Z5liE1dgdP/Q==
X-Google-Smtp-Source: AGHT+IFORYoZVSjRXNji1ZPxubJnFI0NMgRDXWPH/Ay7EOCZUrczo1OdyxwohRnb4M0g3IdtdDrBNQ==
X-Received: by 2002:a17:906:291:b0:99b:efd3:3dcc with SMTP id 17-20020a170906029100b0099befd33dccmr7449321ejf.62.1692007264018;
        Mon, 14 Aug 2023 03:01:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id gs18-20020a170906f19200b00992e14af9b9sm5455340ejb.134.2023.08.14.03.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 03:01:03 -0700 (PDT)
Message-ID: <19616ba1-fcf7-b791-aa19-4128eaebee5b@linaro.org>
Date:   Mon, 14 Aug 2023 12:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: ipq5332: Enable USB
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        arnd@arndb.de, geert+renesas@glider.be, nfraprado@collabora.com,
        rafal@milecki.pl, peng.fan@nxp.com, quic_srichara@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1691660905.git.quic_varada@quicinc.com>
 <02317e86c1c8838e66a852b3576988719df8028e.1691660905.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <02317e86c1c8838e66a852b3576988719df8028e.1691660905.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/08/2023 11:56, Varadarajan Narayanan wrote:
> Enable USB2 in host mode.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v6:
> 	Add vdd-supply and corresponding regulator
> v1:
> 	Enable usb-phy node
> ---
>  arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
> index f96b0c8..b4099a2f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
> @@ -12,6 +12,15 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. IPQ5332 MI01.6";
>  	compatible = "qcom,ipq5332-ap-mi01.6", "qcom,ipq5332";
> +
> +	regulator_fixed_5p0: s0500 {

Generic node names, so at least generic regulator prefix or suffix.

> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <500000>;
> +		regulator-max-microvolt = <500000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-name = "fixed_5p0";
> +	};


Best regards,
Krzysztof

