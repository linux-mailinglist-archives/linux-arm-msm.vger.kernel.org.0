Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9177C4FAFAD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Apr 2022 21:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240894AbiDJTMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Apr 2022 15:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235150AbiDJTMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Apr 2022 15:12:53 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E78760CFB
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 12:10:42 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b24so15835487edu.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 12:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=N8ogQDlkv/YncYDLitO+ZzY4zCeqZnsOOoWX3crcddY=;
        b=biDtNxdPPd1Cssfs5BTWVtn4W5wFEfaXWB/8o7xryYj8kILF7pFw7xQ0n6ZVhH5Bii
         kONLXZKWGRDsDGcHsGlQ4eWMTukRMTS0qhk7iYYXJ/3kwvIGqXAxJ5QE7l9z1FjYwDHx
         97x8ywJ5NwpbQMDyodmOhk0LO92jRjRP8w6ClVeBD5vz7nftv4z37IUPzkW8mezlmbbG
         eTWnIKyf4/kXolW9rFHinul/xLFXHWnTlar006wUH8H3b56sqTx8WQeoxhpBUma7GnS6
         fVfylszT/LVBlHmIEx4RLCBffwBFtGII45r6DbmwLQXeZglpeRh2xKLjQKl7nX5uiHC4
         IP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N8ogQDlkv/YncYDLitO+ZzY4zCeqZnsOOoWX3crcddY=;
        b=6zORuM5vtntWG105hBvGDoNmN6HsxGEAn2W2UspLcxP1NYoMUYQxMhjlYQlL50iEsz
         jD90ylsFisWsn9+HW3Va0RQDNPsd0Alge74VVDV4sOXEfUvd+1DsZdpSAcYFXR2C69L+
         x8hmbkK5awu1QFtVQ8ZziGdao8L93MPs5z7LzQ+L1hHtgFJnKP16GBIbZE/SDtbp5IBW
         SYbVqfLzDchAbWgNRedb8yTdzI3FD+xl9YqMijvBOER2BghjXsccdHw9LKLAJw3k4zWh
         lCVIchJ2ikj/3inwXFCEaZe+0GNYs+QxLi/y9Ai4jJbFDmAXCiPm+s5I8Em40u9vr9Co
         6BZw==
X-Gm-Message-State: AOAM5308Dnrhn4m60IJzAZItt1tm64VZArxRkyE1vMWADWXi1p3bf+bK
        oO41ELX/1OeR+VvbDyNSST9y/g==
X-Google-Smtp-Source: ABdhPJwPYAjKWOeMBZg9+TfHTBh8t9CBvZTbit/20elRwUocnWp4J4XZic654M9df1XmEKYLZWL3mg==
X-Received: by 2002:aa7:d494:0:b0:41d:704f:7718 with SMTP id b20-20020aa7d494000000b0041d704f7718mr7120246edr.147.1649617840574;
        Sun, 10 Apr 2022 12:10:40 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id d2-20020a170906040200b006e84213fdffsm3706692eja.201.2022.04.10.12.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Apr 2022 12:10:40 -0700 (PDT)
Message-ID: <b480ec98-3538-43d7-0595-afe859d40a77@linaro.org>
Date:   Sun, 10 Apr 2022 21:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 5/6] ARM: dts: qcom: ipq8064: User generic node name
 for DMA
Content-Language: en-US
To:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220410175056.79330-1-singh.kuldeep87k@gmail.com>
 <20220410175056.79330-6-singh.kuldeep87k@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220410175056.79330-6-singh.kuldeep87k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/04/2022 19:50, Kuldeep Singh wrote:
> Qcom BAM DT spec expects generic DMA controller node name as
> "dma-controller" to enable validations.
> 
> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
