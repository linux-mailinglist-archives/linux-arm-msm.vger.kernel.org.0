Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E40907839FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 08:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233006AbjHVGbJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 02:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233010AbjHVGbG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 02:31:06 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF83F1A1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 23:31:04 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-525597d891fso5193767a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 23:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692685863; x=1693290663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qF3XsrvkCmdC2tWJHy9NJb8hDFmSm0IyZ1p8Hm+JGjE=;
        b=BBFt8dXOP/k5IJhehsjI4KdqyFfTFNjWRtD8aepd+LTyOfbatkgonVPluLG0+inLp2
         RLXs0y8YLguwmExPhwyx+Sx8uWrp5Tn6kayCObTh61StHQPAYFV5hSYtDZ1gUwc2ceBm
         cJ1d9JFU6GxuDVEx/W0PFLjpD9cAnI8S+x1OfsP2UifM3iV2kVLCUKwz9hTmWo7+u0Sq
         tC5KNe52h0RsRKXFu8TGl7Lq2Pp/o2xtPf+OJ0W378coWj+J8w4ME06VseisMqgQbXbg
         3wHQ1Z/PjrwvfVbju7jhd/EokPXfLtbtiHOdLLo9BP5lxW4Im+94mFypaObr3m/em+mZ
         Vpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692685863; x=1693290663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qF3XsrvkCmdC2tWJHy9NJb8hDFmSm0IyZ1p8Hm+JGjE=;
        b=MXQedJylqBdyEWbYaVP4K8pgVFPJ/BdKo+vj59QleIvYWTOENVewMPqqIlm7CdWmWc
         OGDW6fW1il05EQZxBHie6qa9AFwnkWtw7Ujo3n0c3LyLWE9SXxjSP/uvM7ns7a2PG6/z
         ryRo9mzs29GsnpHxZOmOsHRUCag3GFX9b70sCwJEsSj3bsVZAEBBvAoIN7pViKRJE302
         0ftiK7jokR62IRJ/QkknxGlXe9NmWExLYHJa4Xh8DnNIPK2EOSIOuh3EdbCHGkKO49XN
         zLJ6fixAWs2mZzvsd/ChOvptGNbgdixb3AXtLymNVEtQMd2qF7EawcR/orXnybJZ6siC
         yGsQ==
X-Gm-Message-State: AOJu0YwE0BVvro3KsI0hoxeKss8Q4Od6IFupmH48Zk4pcs+ofVM+HnZg
        eKnzfndQ3y33HuCCga6RmDDxpQ==
X-Google-Smtp-Source: AGHT+IGMEHTyeoPeIgNE/HIIUoDPkzLTgoK6YfDxPVTz+PmAaoHcG16QaEXJEgcRviWpASYwsdoRZQ==
X-Received: by 2002:a17:906:14:b0:96f:1f79:c0a6 with SMTP id 20-20020a170906001400b0096f1f79c0a6mr6367813eja.70.1692685863290;
        Mon, 21 Aug 2023 23:31:03 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id c8-20020a170906528800b009887f4e0291sm7667934ejm.27.2023.08.21.23.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 23:31:02 -0700 (PDT)
Message-ID: <74291298-6ca4-99d7-bf7c-741b8220c066@linaro.org>
Date:   Tue, 22 Aug 2023 08:31:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 04/32] ARM: dts: qcom: apq8064: correct XOADC register
 address
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
 <20230822001349.899298-5-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822001349.899298-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/08/2023 02:13, Dmitry Baryshkov wrote:
> The XOADC is present at the address 0x197 rather than just 197. It
> doesn't change a lot (since the driver hardcodes all register
> addresses), but the DT should present correct address anyway.
> 
> Fixes: c4b70883ee33 ("ARM: dts: add XOADC and IIO HWMON to APQ8064")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 2 +-

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

