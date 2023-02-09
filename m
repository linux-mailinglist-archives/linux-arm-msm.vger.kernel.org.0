Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACCC69037D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 10:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbjBIJYI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 04:24:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230216AbjBIJXu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 04:23:50 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15918FF09
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 01:23:35 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so987085wmb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 01:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uws/CBgiWje9xjj3k3/n7//whTmN8ObyNa2vnxagJ4k=;
        b=eJXckxQDw0mUgYe6d9f9IrTkXOJPz9z03UqKqBmU0qRuUHiieEKqnJmXBvVrOSPXpI
         Y+JH096mCD7eI1S+WsuGKAXIcmzLS3LIMb1uYlyL3l0U0kJT8BKy34CqEfKAhwrpLmpf
         Lu2Bt18cEEHowqlYQCNak6o3PQ3BzyWHX0dAQOdskazzGklygKtmAhy+DokhMG52YN7j
         eaW6bbhfM3nTfqZlhs2e0psWFp7+PqYDaEGsO2A/kEFzL07aYPIqgSkmIHgKa1u2GgCn
         4oTMAP8nmtlxXYijJ+ZJ0y3ulhz+1U+dhbxdd7v7iNhE5GsgYnKWD6Cxf9bPF4+w/9PP
         s4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uws/CBgiWje9xjj3k3/n7//whTmN8ObyNa2vnxagJ4k=;
        b=Gk+NcdANx4xItKvf7TBPK/VGCWND4oqs7t/ryZE5al9SvS8U6InY5oC9D1TMEgRq7W
         NGF/wcWswrLFYDYENp+l5onIFWsNxU52uV0FHNKKXNBqJtC3S05kbM2I3STh4dQ9G3oT
         86X0ata57yLeGIbY0drGOzhb/+CgFBOMQjNZkuFCUeTsRPgFzAsivU04HvkK4VUwXKio
         eSh7VvnZp38sQFyQjNPjKNQXC4QZ3ot87O98zrFIjMIWuFgQAS3ACIgmbHEICR0QCDPb
         A+G/xXzLuma5nX67hQHfMWc6EHj9Wf3g6mcL9tDNcLDVs3627dBE1L+L05VOYXzvA5E8
         JIdg==
X-Gm-Message-State: AO0yUKWHBO+GP+wuTeK0i9l7TW8BwsLFbJIoVvX7wGd6Vt61M21sIcZr
        Xc6w/OgvdkKwCKYXg/TvmwGJrw==
X-Google-Smtp-Source: AK7set9Ry31R/lGcmWI+Ksf8p6G1cVrV0U57ur+XU0mrC8Ly9eEvbwJlP2ZeP8IcaC9iF5x8CkwxvA==
X-Received: by 2002:a05:600c:3083:b0:3e0:481:c897 with SMTP id g3-20020a05600c308300b003e00481c897mr9546335wmn.37.1675934613728;
        Thu, 09 Feb 2023 01:23:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z4-20020a05600c220400b003dfe8c4c497sm4456857wml.39.2023.02.09.01.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 01:23:33 -0800 (PST)
Message-ID: <5c9a9e4b-ad94-7927-22a8-41f41f688f4e@linaro.org>
Date:   Thu, 9 Feb 2023 10:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 09/14] arm64: dts: qcom: sdm845: update QCE compatible
 according to a new scheme
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
 <20230208183755.2907771-10-vladimir.zapolskiy@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208183755.2907771-10-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/02/2023 19:37, Vladimir Zapolskiy wrote:
> Change the old deprecated compatible name of QCE IP on SDM845 to new
> ones based on SoC name.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Same dependency comment.

Best regards,
Krzysztof

