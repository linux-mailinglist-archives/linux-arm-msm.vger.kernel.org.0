Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1EA273CA2D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jun 2023 11:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbjFXJbZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jun 2023 05:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbjFXJbZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jun 2023 05:31:25 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF551993
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 02:31:23 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98df6bc0048so31205766b.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jun 2023 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687599081; x=1690191081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwFIAccLIYNITGdMmhfyslt2bwDng0x/ZpNayYHghu8=;
        b=gc9/259HB7eikMHCQoNfzHBy/dycbEU/NjOFFnU8PbxsvPGyfNqoAKoAttafP2LK3K
         o8T887iu1nUWr8WHUlorPc2GkgFZqr90iFjwHQhPBsi2sF1sSxGB52kj4CmKlPDCq8BM
         9LbSM1ZwP1UK8Rl3mgeAq+IsMhGGArCApiHtotYKsX4U4up0ZEe9AnGqGORSAJmafl5M
         bpyubo+oVuadRCq3PFmiBKS/XJP3UBqd8FG+l06PHSS6AjgDQvzgQ7NXRzAqxLt8Hqy8
         JzWDz4sBifpXB99IaCL4BLgAR8765gFH3HZmDw32SGCMnXXJ3TcvvNyXRHLH6L50/stk
         fFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687599081; x=1690191081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwFIAccLIYNITGdMmhfyslt2bwDng0x/ZpNayYHghu8=;
        b=gz6Zv3TGYThgPjAy9QFJZbLzVcYXjeJw5N07h98zJm6cizCPwk7bOJ2pXe0YqOxmXR
         Nax3iOBu4XQ8HFlZLq6/Kopbw26VQJAWRsq/3hzMiQHiFEXeIlTLqaAStTCAQ4Z+zdVg
         QfuuSR9Br5CAoHpKX0L4wHsuXvO719fPJ24cQZZByIw1/i9DdgOGIgYUt7LhinaT+1BW
         YLSc5VKMR0znO4xMJ9ii73EWDbKAN/0CEH6FTDWzvmqtM6O01uswDGd3rdPNvdxgGooN
         konCqt75oHOhNmqKNBQRJHXsSJWhhPWlEqCMO2nHTqGZ7oZqG8fQk3XT0d5QOSYqIuxM
         +24w==
X-Gm-Message-State: AC+VfDxtT8qTlUnwgjvlhYnWe3CfVEMkRPeRt17h53L6mQ3SNQ4oIAcx
        J4J2adodgTgBC8N56xJqjlw0mg==
X-Google-Smtp-Source: ACHHUZ7LC+7hcCDvBte5xgktiTToiRBYnv91b8Sj+cbLeoDMK97jXgfSs6kpS0Rkuj/xi6REicP9TQ==
X-Received: by 2002:a17:907:5c2:b0:974:55a2:cb0b with SMTP id wg2-20020a17090705c200b0097455a2cb0bmr21160376ejb.55.1687599081475;
        Sat, 24 Jun 2023 02:31:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p26-20020a170906229a00b00986bf50fe7asm699359eja.60.2023.06.24.02.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 02:31:20 -0700 (PDT)
Message-ID: <0747247e-22ac-f798-6d95-9cd14fb24cb1@linaro.org>
Date:   Sat, 24 Jun 2023 11:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 07/15] dt-bindings: display/msm: Add SM6125 MDSS
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-7-1d5a638cebf2@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-7-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
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

On 24/06/2023 02:41, Marijn Suijten wrote:
> Document the SM6125 MDSS.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

