Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B89B6DD1AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 07:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjDKFeC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 01:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbjDKFeB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 01:34:01 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E008272A
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 22:34:00 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50489936a7bso1917508a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 22:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681191238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkWD79ipH+po5ISBlzkaKK3V7RlQmj+WDbDZ6NA6eNE=;
        b=OmfNA020h/697ESQhqcF3FPp8ZOviAEurDFUlaWkoytba+zXb7KDbxxmuSw3gjELed
         1C1hoIpU3aImiqsA9V6R3YjB5AzeanBuv8k5z5bS5aXweQsHRiqFOV1MsU2tcfjf9872
         Ha8AN5DuKDGzgUDagPA0D+kFmxVol1LGCqwj8RF32mEhoffjYC2sYiSAnUeWm3P0S2ts
         5ti/lVMtNEC2MOQzzIFLPAEqbPU/f7e8LVNwim1GJIsLElEPa++33TAdqkOif2NvZ3gj
         8tNaJNIIYzO0MFsRj9D0mWm1T8icbi6FuGNKh7FLmSvY6NdgMsYNDiCalXvbalk2yY92
         HUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681191238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkWD79ipH+po5ISBlzkaKK3V7RlQmj+WDbDZ6NA6eNE=;
        b=klvMurC7jsOJZboZ+dv2SExu5pOAhBM3q6wDCrXvzHTG6Wj1U/W5LegBDjQDTurBQt
         64U06SZZuStQs/GyIBZPPOkzgj0AxPTTeAfu81WI1eXpi5kCy49RdOX5ULWY1bW466cL
         NWXACPThSAEChj06FJr0S+2nVZkXufUfaXKVoBYSRKtbAlVirAd9vWGAcXqrRgCS+au8
         xuoWXDeZYGe+WVr2vjSONkK70cB0HPCVswgSDsZ6xCk9h5UL7/N3IUuoHttORXY+eOEa
         MJyn3IGoGsdxdE3Splv2GaLJR5af8PsNFhq2w42HhLReaKPiHC+oYR729ZZ+r8n0YBjj
         ch9g==
X-Gm-Message-State: AAQBX9cNU5dy6tKLt966dkM/lhQc9vNn2SxC8TXOEklX0Vi8xwdNNKK8
        a74DdiKVnNXzFWYdXKLGmvc2mQ==
X-Google-Smtp-Source: AKy350bQYGlaHy4QryASpqvVadU3bZ30sQLxHLHpnwjSurrdvLijghPUlqa53Q/kk+9D0EPOXdUDwg==
X-Received: by 2002:aa7:da17:0:b0:4fa:4810:95f9 with SMTP id r23-20020aa7da17000000b004fa481095f9mr11438378eds.34.1681191238596;
        Mon, 10 Apr 2023 22:33:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:dad2:72b7:3626:af61? ([2a02:810d:15c0:828:dad2:72b7:3626:af61])
        by smtp.gmail.com with ESMTPSA id b15-20020a50cccf000000b004c10b4f9ebesm5509934edj.15.2023.04.10.22.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 22:33:58 -0700 (PDT)
Message-ID: <eca378d3-8743-a0c3-5f54-faf4ad37e9d1@linaro.org>
Date:   Tue, 11 Apr 2023 07:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom,qmp-usb: Drop legacy
 bindings and move to newer one (SM6115 & QCM2290)
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, bhupesh.linux@gmail.com, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, kishon@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
References: <20230410171010.2561393-1-bhupesh.sharma@linaro.org>
 <20230410171010.2561393-2-bhupesh.sharma@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230410171010.2561393-2-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/04/2023 19:10, Bhupesh Sharma wrote:
> 'qcom,msm8996-qmp-usb3-phy.yaml' defines bindings for several PHYs
> which predate USB -> USB+DP migration. Since SM6115 and QCM2290
> nodes for USB QMP phy are being added to dtsi files by followup patches,
> move these bindings instead to the newer style
> 'qcom,sc8280xp-qmp-usb3-uni-phy.yaml' file.
> 
> Since no device trees use these bindings presently, so we have no ABI breakages
> with this patch.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

