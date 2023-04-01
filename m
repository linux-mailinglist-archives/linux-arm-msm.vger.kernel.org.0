Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6FA6D3379
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 21:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbjDATXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 15:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjDATXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 15:23:16 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AABF26591
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 12:23:08 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id ew6so102444419edb.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 12:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680376986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxubnhYm3jfKN0Ni+OwaWHmeJgo11h1uYRx+ExBZagg=;
        b=dxGgfjhp7yW18ErPJ6AtgVqAzDIKJQBiQp9bXFdKCfFwCnISVqC8opflw9rCXmYjCd
         RLa7u/LNPZ3qjvkSDwON62jF3LJF3iM3o1GDWaeD2p/O7fMXIVkorf+x88cGetUPpAXV
         uqjRltcX9nI9LNhHjEk0yecNraB4BT4OojWFICsI+qH3rg0K3pETyCX4KPt71KMeeTxt
         9azGohH0AfqtLIRSozBJD6lP0J6+uIUj3ARQXF03f1BK18qNjVPs0FP7JcnYWRXVyC7O
         VeulW1gwCXuA9MtxFyZmRJOJdNV0E16wE+limzxOk7pnJL4SoKAnVaPKh5TqYiQcPl2U
         CWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680376986;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxubnhYm3jfKN0Ni+OwaWHmeJgo11h1uYRx+ExBZagg=;
        b=0U8BCPslk8sMOXtaowKl/TD4i87LtV+Cz/+J6oCOYo2BXSY5jhDYalPqVUyXDi9xBB
         /yfgV53cQ7g/RzoEWUEN/peLbGNqFOKmVpNiz2EpcksC631+Q8E12jNnHXq8f4FlCggO
         rHmd7BQG14O/GKF7SEuH5rnTEqXfonR6I7BH94cYHnV2bEcFfs38aiyFJ6abV4kFMx9z
         CuYLQpoWiSbrHUxmwTmjEKAkLTHKt8CwUEm9A0u+XXFV4qvOC3iCxf6etceoMsErQVrK
         zYWsFeGNZMbmInZICln36S2x7ALhf9g1QFZUA4qs5Z0rDdnQig0u8n349QrO1wd0rRUC
         DkHQ==
X-Gm-Message-State: AAQBX9ckF/J+YwbR3GU3nJ9dILg2k0W7Je6Pm0RjgXjg5DShW8fywHKt
        5JlgYIXnS/HoNSWPtINacieW7Q==
X-Google-Smtp-Source: AKy350b0NXjR/U8vfwo3A5JtmgyMjcISvzCcUb2nQvie/SWSShZk997o5fmaRBVBxusyDmayNttG2Q==
X-Received: by 2002:a17:907:2d29:b0:8fa:b2b:9de with SMTP id gs41-20020a1709072d2900b008fa0b2b09demr38707076ejc.25.1680376986626;
        Sat, 01 Apr 2023 12:23:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ec00:3acd:519:c7c2? ([2a02:810d:15c0:828:ec00:3acd:519:c7c2])
        by smtp.gmail.com with ESMTPSA id d20-20020a170906c21400b00947792df079sm2385584ejz.115.2023.04.01.12.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 12:23:06 -0700 (PDT)
Message-ID: <fdfc3914-ea61-a281-53ce-7271fab61dad@linaro.org>
Date:   Sat, 1 Apr 2023 21:23:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/5] dt-bindings: ufs: qcom: add compatible for sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230331195920.582620-1-brgl@bgdev.pl>
 <20230331195920.582620-2-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331195920.582620-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/03/2023 21:59, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the compatible string for the UFS on sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index c5a06c048389..4abd3c0950e2 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -27,6 +27,7 @@ properties:
>            - qcom,msm8996-ufshc
>            - qcom,msm8998-ufshc
>            - qcom,sc8280xp-ufshc
> +          - qcom,sa8775p-ufshc

Please keep the alphabetical order (also in your second hunk).

Best regards,
Krzysztof

