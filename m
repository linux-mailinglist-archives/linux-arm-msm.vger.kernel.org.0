Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E12377A1731
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 09:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbjIOHWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 03:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbjIOHWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 03:22:43 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8095D170B
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 00:22:38 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-502d9ce31cbso2987939e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Sep 2023 00:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694762557; x=1695367357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qd+0FjJZZQNF69fsyzcRFTUVJeEdZzRN74zuVczzR0o=;
        b=B72hNrpGPNUU3sdN0QIo65NV1pkEpj1AvwHf7XYVhRkQ4jfIrPAVKL+V2xDAZggU9p
         dBgRHs43m2W+Kt0f97z+7hWGPhXkog3q6Ntx52H6+rnwtKGX8PFx7hvGsj72OvAUr8A1
         2+B7RCTNZw9dW/siXQy4Yh72I9V2f+85KPqjVtorTzUpPxRAE5ThhGfDOmLR5uBp+TV+
         p4YjPjBH8++Y5USurvOPFtGvjIAMS1luHIWHW6dG35ft+u5F6mc8x52hLCxer42J4I3E
         F/CToqNns3mSVaIXd0EuOflhPFvbsl96zjsC4gY7YByz9HkXR5RO8nr/vi9wPGtL1Bes
         gBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694762557; x=1695367357;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qd+0FjJZZQNF69fsyzcRFTUVJeEdZzRN74zuVczzR0o=;
        b=lVbctT8N6YVGf+7QxLZIkoOOmY5JmetYJ3teaRhYJF0g0Rav0syaAAdd8OzE3l6ogB
         +a1LUHT7DPFpBd12Pbm3PLGQ0uXGHyuFLhXVkSoQZgkNW2i74Y++oK+UZ+YhYyfYOuSX
         hXZ+xtOmshmSduSl1ccwdwputpTydKDyha/eb3w/wgtKR4aKhoJqyr18Mm3Pglf6EUs7
         ZX9SMVN7/He/+FR4AbLNLEoXT0tTNuxI8Xdv3t885GiHQqwi1k2KsyCEVjOPYCA7XAxR
         Y8aLWMvT2skNyQ+gIq/wmDYbsm69OShZnG+zpJJhIAsrjj6LUAcfNFLQisBmsLkbqTVC
         7HyA==
X-Gm-Message-State: AOJu0YyFQR8BflzPEy3aIMRjt0HDnv3vttLG3sBewnF3D3ayd1OqjMJW
        Upe+cqj6pT2JAYWb+HElT1Ekag==
X-Google-Smtp-Source: AGHT+IEoMzCfsponZZoJR8s2GFFY4ypeG3S3VeMRGhIuQelid0wHsUDf3d4ojNtRye73A+fQCv6/mQ==
X-Received: by 2002:a05:651c:1207:b0:2b6:da88:a2d0 with SMTP id i7-20020a05651c120700b002b6da88a2d0mr768710lja.47.1694762556754;
        Fri, 15 Sep 2023 00:22:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id s14-20020a170906c30e00b009937e7c4e54sm2002507ejz.39.2023.09.15.00.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 00:22:36 -0700 (PDT)
Message-ID: <c4e95307-3f09-5704-e5ea-cb42befb9921@linaro.org>
Date:   Fri, 15 Sep 2023 09:22:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sm4450: Add RPMH and Global
 clock controller
Content-Language: en-US
To:     Tengfei Fan <quic_tengfan@quicinc.com>, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        catalin.marinas@arm.com
Cc:     geert+renesas@glider.be, arnd@arndb.de, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl, peng.fan@nxp.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_tsoni@quicinc.com,
        quic_shashim@quicinc.com, quic_kaushalk@quicinc.com,
        quic_tdas@quicinc.com, quic_tingweiz@quicinc.com,
        quic_aiquny@quicinc.com, kernel@quicinc.com,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230915021509.25773-1-quic_tengfan@quicinc.com>
 <20230915021509.25773-8-quic_tengfan@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915021509.25773-8-quic_tengfan@quicinc.com>
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

On 15/09/2023 04:15, Tengfei Fan wrote:
> From: Ajit Pandey <quic_ajipan@quicinc.com>
> 
> Add device node for RPMH and Global clock controller on Qualcomm
> SM4450 platform.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>

Warnings in your code:
sm4450-qrd.dtb: clock-controller@100000: clocks: [[28, 0], [29]] is too
short



Best regards,
Krzysztof

