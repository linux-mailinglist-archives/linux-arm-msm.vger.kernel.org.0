Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC5ED53A065
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jun 2022 11:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347828AbiFAJa5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 05:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351090AbiFAJay (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 05:30:54 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610E98FD6A
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 02:30:45 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id y19so2504842ejq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jun 2022 02:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=5IgpHecT0v2thcEdNy9dmhAzLNM0n7jwFfkompLh8aE=;
        b=QZmZ3udwMF+1BVssFRYeb/IuNUXSyd8Qp/RCO0xI7zOGUGWzR9re06s8o9pQJWFxWN
         OHpiyPeo+udBjSXBLTK8WBf+THibRabP/G/E+PAmOfZoVQv5pi3k2lhUjMO689oHTrag
         OSzcCPbc1iqMXY0mc3J5IJfp4l1kJGJ1wwH4SOSAwoBsZwLeZPl8Q+EjOvnldOmJUZGE
         xqO724vayRnZU6BHuLKN/cK40A6tUGuInyZ4DMElDuOLPAOts3BDS9mYbTV6VrcYsMfe
         ygiaooUiRb8cqbn6RKwTvWIUzbJksUsKXxoPkPKj2wDugiaT26nWwiU6kpEYFKUz8ClM
         rH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5IgpHecT0v2thcEdNy9dmhAzLNM0n7jwFfkompLh8aE=;
        b=k2Y6Fxv86aPBbfuz0DV7YuIHAcby05+XnkvOvlVXGOwvKmQhq64bQpvFPN0lpOyRPC
         GiqowbFzFjAtJAQgAndBB6oMc37zFPbnbVeV6bBM4LOWG4reilrv1kKiCGbxwXA4Ap8g
         qPCdAQO+TxuGUMmoKtcybUdSARAU+iKWv7oQb9zPldJHKD6SZrAMgX/NgjCXbPeJuDzy
         JVYZLtTy+8gKjBS6PV4yZmbytFiQTzFSCVdCY4E7lMvZwlEb7RWX5dwDC6eSyRoxNH7C
         h63Qo4gaIdkcsuOlNy5vwXsCzYxBLGMRmsihdDwDZMEunLewXcFiCUUMRgtZXM0Um0d2
         PwbQ==
X-Gm-Message-State: AOAM5318yZMQbCUhYf1xiUwNohA9DDIllqW9ODwEehU+6c2Gh86CyIwy
        aLfRBgr/2FHRewgIWjr8yA9bnw==
X-Google-Smtp-Source: ABdhPJxctyus0aVviZqlPHl9SGmJhm2M3lqLjAAgTBXgGpOe7SRt5ZSSOcgH7AEIlTWhEWVlKY0pkg==
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id fj2-20020a1709069c8200b006e12c941616mr56989534ejc.64.1654075843937;
        Wed, 01 Jun 2022 02:30:43 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h4-20020a1709067cc400b006f3ef214ddbsm494870ejp.65.2022.06.01.02.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 02:30:43 -0700 (PDT)
Message-ID: <e57de710-1997-d36c-72a7-a9d6db000079@linaro.org>
Date:   Wed, 1 Jun 2022 11:30:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: add IPQ8074 PCIe Gen3 PHY
 binding
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, kishon@ti.com, vkoul@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20220531214420.916278-1-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531214420.916278-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/05/2022 23:44, Robert Marko wrote:
> IPQ8074 has 2 different single lane PCIe PHY-s, one Gen2 and one Gen3.
> Gen2 one is already supported, document the bindings for the Gen3 one.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
