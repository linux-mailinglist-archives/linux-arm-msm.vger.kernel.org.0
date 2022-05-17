Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB28529BEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 10:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242601AbiEQIME (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 04:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242579AbiEQIMD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 04:12:03 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE0463CA67
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 01:12:00 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id ks9so33134940ejb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 01:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=wgki0G9Wv5/n5UTtWnBOnizEKI49Vz+o/9uXaANdQKM=;
        b=KH000ohs4fSRZFwYuUErgsFjS+0iNt/SolTKyFfq26a3M3FIDXGsqXxQEfc5l8K4mu
         3sWrag2zururob2VyYFZxro19RauMPzVqz4rLMmCA/XP1pPNk0b9bxkrk9obSUqCWZAw
         IpgWgDAPdSpYAiMun3VHd2A1jY8fF581XNbGbs0BFzR5W/muhOob3IM/cf5qt/l4HpKd
         /u4qbkk60mPFKIp6lUcL5PziR5DToDcieBM24iVWCKjYqQMF5Pcd7+bKCBBOVIWE9HNj
         LUHTOyd4M6BSh14CfxJMclr9f+7hRnFdPTkusygmS9+yp4rVJwSiE4DCt9PVeDNLJRnz
         eFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wgki0G9Wv5/n5UTtWnBOnizEKI49Vz+o/9uXaANdQKM=;
        b=DVcPL6+91DkFzKDWe47i0e1WM0AZ596RtE/1yYbTA+ni35/isWdzsGzyakHPZRMDG9
         kRE2B1cvl0zHYlJgvkaZnstxa1ZISWLdJU2UxNejVpGoLRaA7SoYaCzY1OixxMVpVmN3
         EHH1vYXGQX7Fv05IKI3gNNj7R8hjU/AINoKr+CKkfBQZ4AAzjSEDQstFREC35RoxJ106
         CUXFEpKQy8wHr47Ho52cKa5OmfHt7FwlRnLvL+a9//skTwa8J9/M8uWn+nAdWT285uIo
         Y5bPbroN+k0Tw/pDa59lIo0kWivlm+boiSfwui2I0AL6rnFNfQhHGl409ZnS0pZnAe95
         Ul0g==
X-Gm-Message-State: AOAM530ByXdBGAKtNF6dhxzWUf/RgYOFDg88sYfnjLHQM1DB9K8z9uSo
        odJAHwfOWqYyPjcO0gj21fWEkQ==
X-Google-Smtp-Source: ABdhPJyiJ3rLUoJTATJaGDEwhiHxCghwyEgdBWxx+/58U3F4TRYwNr4DHdavl9jouiCx3wsL9t04uA==
X-Received: by 2002:a17:907:2bde:b0:6f3:8e91:3a60 with SMTP id gv30-20020a1709072bde00b006f38e913a60mr18053727ejc.434.1652775119498;
        Tue, 17 May 2022 01:11:59 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f4-20020a056402194400b0042aa6a43ccdsm3830418edz.28.2022.05.17.01.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 01:11:59 -0700 (PDT)
Message-ID: <824e71c1-11e9-a5f6-1706-e3970e42ef90@linaro.org>
Date:   Tue, 17 May 2022 10:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 07/11] dt-bindings: clocks: qcom,gcc-ipq8074: support
 power domains
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, bjorn.andersson@linaro.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        tdas@codeaurora.org, absahu@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org
References: <20220515210048.483898-1-robimarko@gmail.com>
 <20220515210048.483898-7-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220515210048.483898-7-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/05/2022 23:00, Robert Marko wrote:
> GCC inside of IPQ8074 also provides power management via built-in GDSCs.
> In order to do so, '#power-domain-cells' must be set to 1.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v4:
> * Alphabetically sort the cells properties


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
