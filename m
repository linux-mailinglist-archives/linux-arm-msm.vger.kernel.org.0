Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF0E666A14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 05:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236376AbjALENq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 23:13:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236549AbjALEMo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 23:12:44 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2467F4D49D
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 20:12:22 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b3so26650856lfv.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 20:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHLy6O4jqHDTKSztpi7y2ZBtM/9lIWsx/M8aFoCYq2E=;
        b=H1u9LiNnyHGfmPscslHjxDyCO203/4x90zy+Xk9OatTpYvkbMK87ZRAkBso5UTXN23
         S+rP+kmGyIvxmK5FJRsAhl6PN+r0RxZmigBNwl0MyizeN0EsxG+axMIbUed/MucEDxoK
         xlh+DHqjlJXkikm0G94qOGjIBgpZEm3LRTphUoD7jnN5Lg4f3/1pPkPEGNgQH2dQIf2K
         wuaB463jDTWT9o8dwisigPOFa2aWsKPOd7hbV2zoOaCt/fy/IJomk1XcQjhufZLQQLiM
         EqIrK0XkVuG6vWfTplmvefb9omY05xi57gDZQEGy1aaY4HexWvkGjlGEdeVQ+hjdt9R6
         7S3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHLy6O4jqHDTKSztpi7y2ZBtM/9lIWsx/M8aFoCYq2E=;
        b=gsGGMf/miTcAU8BsK2Q+kBQN4xfpZEzbUuXshmu94oqcv0lf9A4IERpfOKkSubdZ3y
         gH5zT3FyoI+LkxiiOCwh3CleG/2Vk8uaqYkDfviusvKgWBKbPnK21TYmVgbF8R0uVuvI
         aGIV4zUiY4WBI8cCqASEDsn8Jm/f4TZnqqE1+JQST5PxY+MHpFvoq9TZJi1PBLm1BAza
         XYtb6EJeiEPZi6HoFbMygNtgawkB05ar7bKa3dDdwF9SbIpI/nZsHzdSeQLHWS+YP6x/
         7OBBgqp8yJAzxpiZk4+GgXVV42bDBprxcR+rV9FGHa2ist/t1khv0JO8hkBYLq/HD2op
         pGXw==
X-Gm-Message-State: AFqh2kr6i/JRdaCSQz/meyZwqdrrSN6hxb69kL64oBiOeGEO9jP8EqHP
        jG9Kdxl1e9H38ofzRrM5hSicug==
X-Google-Smtp-Source: AMrXdXu0zASLL432Ldc39pvDctyaFF9ImEH0Re4xHuqAMoQnwm+xDAK/0m6p2WCCIOGrimgIrLfUwQ==
X-Received: by 2002:a05:6512:3190:b0:4cc:a111:2742 with SMTP id i16-20020a056512319000b004cca1112742mr219414lfe.15.1673496740548;
        Wed, 11 Jan 2023 20:12:20 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x26-20020ac2489a000000b004cb018ad4dfsm3053566lfc.135.2023.01.11.20.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 20:12:20 -0800 (PST)
Message-ID: <d09516d5-d67e-2314-0ab0-3af04b9d1f61@linaro.org>
Date:   Thu, 12 Jan 2023 06:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 6/6] ARM: dts: qcom: fix various wrong definition for
 kpss-acc-v2
Content-Language: en-GB
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230110183259.19142-1-ansuelsmth@gmail.com>
 <20230110183259.19142-7-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230110183259.19142-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/01/2023 20:32, Christian Marangi wrote:
> Fix dtbs_check warning now that we have a correct kpss-acc-v2 yaml
> schema.
> Change acc node naming to power-controller and add missing
> binding #power-domain-cells for each kpss-acc-v2 power-controller
> to reflect Documentation schema.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

If you pick up my power-manager suggestion, this patch has to be adjusted.

> ---
>   arch/arm/boot/dts/qcom-apq8084.dtsi | 12 ++++++++----
>   arch/arm/boot/dts/qcom-ipq4019.dtsi | 12 ++++++++----
>   arch/arm/boot/dts/qcom-msm8974.dtsi | 12 ++++++++----
>   3 files changed, 24 insertions(+), 12 deletions(-)
-- 
With best wishes
Dmitry

