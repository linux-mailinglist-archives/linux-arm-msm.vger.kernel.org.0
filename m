Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6DA590EAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 12:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237786AbiHLKF6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Aug 2022 06:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233008AbiHLKF5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Aug 2022 06:05:57 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 977877AC3F
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 03:05:56 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id d14so659600lfl.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=IO7so1201LCfMcIFny+9ruzvEPMZiRRert/i7tnBZi8=;
        b=hGkEc8OoOo4q8ohhtTgulAqSMGWFmQV7Kp+Hqhe5r9kdgSYD+x5QgyuJ89ZvNjtMYY
         7N/SGx8r4gdeAABgtKSfLvL13ubXlOqDPe/fIOL6QycTjezx4Q53UkWT8rMpoGRVDBlx
         tJlKtSfkN4qEhkCM7P+p/ZHu9i5w36/blNVKZWfaGz+HriLRW/fdLOP4szer9hJsrMPe
         Y7mcrCizGa5j4m4/gXJU3zNpH/mBa+U8bMzN7yn34LgaAjGetvgkfYa8TfsuxhEGJHxC
         QCdAX1PGrkPtz7iWCXPMbWf8FLSzSsdku9tbl3/rt13s9K7GrOwkx2SeV1idImXvE+lr
         ++0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=IO7so1201LCfMcIFny+9ruzvEPMZiRRert/i7tnBZi8=;
        b=q+qhy1aCZjLhEVPLfiF+kYFtEPMo/4//3N68Et8ihsAPii4Lpy3yTsLzKOFIi3fUDv
         iZv65REjR/pKYB5BKp2sgEgumxPrvw0Yfy1BunzM1qfBF66Ir6kHW+pBz+jkTU5bj4cn
         sBvrwCo9rZ8oiLFxuPyjQxU1gOErQRgfQwDG2A6QTNuPN2HLO0fnD2qbQxCKn6XgKmmC
         l5KEIO//5I0x0AO2RdnTsSqMoO/LyrzFUS51BbgE3Icb/fc2C1s6Vtk0WncZ9z08xXS+
         O9GAW0Md+w6dtNGILPeGqvYjdYY0AC2qdaxez43ilnSuuP7tQAdie006ffhnZ2+FZq3t
         8voQ==
X-Gm-Message-State: ACgBeo2niRrIJCim6rgsqARaqr/y+FlmLFj7VAH7Kc736piBLwhvdRr3
        iJj5oltEVyszvdQaSHbAhKzu4g==
X-Google-Smtp-Source: AA6agR6fzUskvP6InRv+oxetqHdNsHTS4o7mioyPTv9TSP3493LiUEJKces/OsoPzUKEazRp8tWuow==
X-Received: by 2002:a05:6512:260e:b0:47d:ae43:62b3 with SMTP id bt14-20020a056512260e00b0047dae4362b3mr1170146lfb.77.1660298754958;
        Fri, 12 Aug 2022 03:05:54 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id x27-20020a0565123f9b00b0048a77a2c4b2sm158340lfa.158.2022.08.12.03.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 03:05:54 -0700 (PDT)
Message-ID: <2ee101f8-7466-c437-76f0-ae480b921cff@linaro.org>
Date:   Fri, 12 Aug 2022 13:05:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: dmaengine: qcom: gpi: add compatible for
 SM6350
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220812082721.1125759-1-luca.weiss@fairphone.com>
 <20220812082721.1125759-2-luca.weiss@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812082721.1125759-2-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/08/2022 11:27, Luca Weiss wrote:
> Document the compatible for GPI DMA controller on SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
