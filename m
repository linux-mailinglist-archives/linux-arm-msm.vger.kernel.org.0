Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE3C783FF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 13:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbjHVLsa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 07:48:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235263AbjHVLs1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 07:48:27 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3764CCA
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 04:48:02 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99c353a395cso582727466b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 04:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692704837; x=1693309637;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55bIwn2d7j3dnR0hLojkzpFkh9GKaVLHWENI/qttC+Y=;
        b=BaZ1u4I0kXduhaoSIIgRXCfnZP1vXeZq9wbxNFNAC2d0I05kZX2pEC1g59msCdZyZy
         h3+pQkTCydm8ugvPeM+VmZ1VJxp2Rm8XAI5hlBlc0mBeEdgqePZoEfEAb/tpIWHihoEM
         LDIszR8GMnxgFI8O9A9Cd3MaMi/ilwIMhazYclGZ5pjvPG1MoJ/royNiItorFt6yJ2qq
         z0FvWmAJH14Yzx5sROk/MIaLviwTTGvtLrpbHLT4yc3mO7HBW6uHatlme4s8IQz5xOIv
         3G+UT5+qR+T6EVehsGHi/ChOEEthkyH4GL5+SUWs5azWv9NshGFXL4Ba+m8tdkqbTLeg
         EebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692704837; x=1693309637;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55bIwn2d7j3dnR0hLojkzpFkh9GKaVLHWENI/qttC+Y=;
        b=cK4ltghHppPoY8GmQnXzcfO3oCcrN7QR9vuO7dcW+1CMwbutcEF8J8Izx0KGNpsFZ2
         0FriVWbRS3MvHPGV4i5k1IJwRZ7dXONML8fMxRB4zMxd/1c8sv8C3aBwzGdKTLZOfCCa
         R0GYlSppBm+m1n8DDuoOA4V+u5OHh2/26MlOdMvNQ2cd+nf3Ti/eTpwCXyfW64bgAEtg
         aTU+B71KBRtIsHgLhdPzUhr7N2oXTbj8ncck8qgf47vkrykWGSgzgJVXuyJDDM6RMclB
         uxymlMH5jYWrvdr7D/sTPLO2IemGKCRkyWMFE31tWaArL10c4i6ZeqIhI2aAtGEmFZXN
         V7Rg==
X-Gm-Message-State: AOJu0Yxk4TDb0dfRkgfv+Q2dQ5qWUts9/JQ/3zU9dTEudadZIaBDIPPE
        mqzzbmLQ9YvXQEZFoycsbz0JBw==
X-Google-Smtp-Source: AGHT+IHF5Zi2ypBZqCfcQok6ofhRkICDoU4oIEgfBDJunkp2sXwdHtuMYbfri0HDGcQg6FYtYGJaqQ==
X-Received: by 2002:a17:906:109e:b0:99b:4956:e4df with SMTP id u30-20020a170906109e00b0099b4956e4dfmr7858232eju.11.1692704837137;
        Tue, 22 Aug 2023 04:47:17 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id ja24-20020a170907989800b00992b8d56f3asm8097682ejc.105.2023.08.22.04.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 04:47:16 -0700 (PDT)
Message-ID: <bd24990a-9cc4-533a-0443-9e91e3b61a71@linaro.org>
Date:   Tue, 22 Aug 2023 13:47:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v9 1/4] phy: qcom: m31: Fix indentation issues
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
 <6d1638daf9b0616816fdecb529df86a394db7942.1692699472.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6d1638daf9b0616816fdecb529df86a394db7942.1692699472.git.quic_varada@quicinc.com>
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
> * Fix indentation
> * Drop simple success messages
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v9:
> 	Fix line break alignment

I wished we run checkpatch before sending patches, not after :/

Best regards,
Krzysztof

