Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5246783FBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 13:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbjHVLk0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 07:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbjHVLkZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 07:40:25 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0857E58
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 04:40:00 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52683da3f5cso5286466a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 04:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692704343; x=1693309143;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=swtdZ6iWxZkwX4JLChr/7mfm4cT7UFQIrvk9nhlFwu8=;
        b=TPmTNZHvxiq7S1kpFeok1VPQ7IF3mZnrnz07IcXRQMymJ9KyKC3bkhhgxd5wKrUO5j
         F4c4ASZ7V98gFFbWL8F7KvzG3Xtfa+njT55ft2MDw4jqwAzfN2uLgOuDgm2pa+Xs4pPd
         MkGua9VAMKgXX5L7KKu6ZW/M7xoM3RlBBC6rF5inMHUWfB8xUFYHloeKugcUybmNSM4K
         v1mdqpFpT7aLeqMR7MhB0/l8v4CRQZidm+f5g0KV0v3g/x5ZvfOcG38LMP7sMD3JuQrQ
         M6NGmQ19pKFj5xrpfmKmj9lSPDe2iPjngWjXpgsi3ZkD8S8qoxpcI6K4jyMDrqrtCl7z
         AoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692704343; x=1693309143;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=swtdZ6iWxZkwX4JLChr/7mfm4cT7UFQIrvk9nhlFwu8=;
        b=FJQHnkwVLEcY+IbgC7+VTJbzCZhR0Lec33+2tDv0+NN6wDPtsB4HQN//KbOHf+iyJ8
         +p9ehfELdN/mJk8Xwk9QUZpjIasDVR5Ki2225dobKMVfadoa6QI8WVfhWNQ4LMaBKQPv
         MiulD8/ugIWZ01iPJTaCTPfPbLDCInovgfaI2NOPSzEF2+ipf2BP7cMQy1SejZUOxb1A
         INtnps+xlasVzVMaJWrLusCIuEtcRPEacQB0eIS0Jd2K90daBGdEAxiyZWR5p1811dNr
         1IqLpRr7/GbElp4KiVrneqji3foLgrSRMxVe1+uJAnLXeExfYj5VlcHu0dnlnlOnAXPP
         ITrQ==
X-Gm-Message-State: AOJu0YzOsvJFheUqk6DSKkg8emwHqatpIHh0LMj+p9RQDOUbpo20xcym
        0d0lxAdYB5wOOnBCTU4AT3C6QA==
X-Google-Smtp-Source: AGHT+IHUjfXRdbb5xkWxvSmHYtiXNjA44zx5N05SQQus1ESIq5Ng+XMglFSU3mnkglNjVtBmwz7itg==
X-Received: by 2002:a17:907:78d0:b0:98e:1c4b:10bb with SMTP id kv16-20020a17090778d000b0098e1c4b10bbmr7236522ejc.35.1692704342896;
        Tue, 22 Aug 2023 04:39:02 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id y6-20020a170906070600b0099cadcf13cesm8051872ejb.66.2023.08.22.04.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 04:39:02 -0700 (PDT)
Message-ID: <c534e39f-f8dc-b9eb-ef27-3ace29192cfc@linaro.org>
Date:   Tue, 22 Aug 2023 13:39:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v9 3/4] arm64: dts: qcom: ipq5332: Enable USB
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, arnd@arndb.de, geert+renesas@glider.be,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <cover.1692699472.git.quic_varada@quicinc.com>
 <27d6303008be83131048ddf2ecef91cec9519ee2.1692699472.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <27d6303008be83131048ddf2ecef91cec9519ee2.1692699472.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/08/2023 12:29, Varadarajan Narayanan wrote:
> Enable USB2 in host mode.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v9:
> 	regulator_fixed_5p0: s0500 -> regulator_fixed_5p0: regulator_s0500
> 	"make ARCH=arm64 -j 16 CHECK_DTBS=y DT_SCHEMA_FILES=qcom,ipq5332-usb-hsphy.yaml dtbs_check" passed
> v6:
> 	Add vdd-supply and corresponding regulator
> v1:
> 	Enable usb-phy node
> ---
>  arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
> index f96b0c8..53696f4 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp468.dts
> @@ -12,6 +12,15 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. IPQ5332 MI01.6";
>  	compatible = "qcom,ipq5332-ap-mi01.6", "qcom,ipq5332";
> +
> +	regulator_fixed_5p0: regulator_s0500 {

No underscores in node names. If you look at any source code, you will
notice lack of them.

Best regards,
Krzysztof

