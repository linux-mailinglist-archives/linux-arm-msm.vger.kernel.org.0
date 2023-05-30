Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25B2C7160CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 14:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjE3M6g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 08:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbjE3M6a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 08:58:30 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D46511B
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 05:57:50 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-96fe88cd2fcso787701766b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 05:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685451468; x=1688043468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y8nrvZCnLeNA9XqFVfQliG+UkeK7H3UuAJ/vrhzt5N8=;
        b=tOpBR2qHhz8Y5+8fGdIJtDXKTjoub3qdMnSVZt2FlFEFqMzdw3FLNNLEyU6Y+aAS+6
         OmP1ldAmCV1TAaS9kBNfhIpf9HQ0U8TNMKH224Uvnl9qIp9n1ovIIH4gAtjaoGllpVTQ
         NNEtg57i05eYsAAHFyXsqlOn4Svajc5hOJFexlN8DfXKOiv9osAuo1K4PuumIM3MLXVs
         T/M2gYN+Cq/qelGP+82YMQVcCPrEXnZxYHJElcA9KfwxfMjqPTdiyrML4Jq/ytCBRcUP
         VAWggMynia9vDGG2SU9GvsJcxsVjadHciSLeeJLyhD1cQ0JKQmX6whGOf6znelmXeXC9
         5uYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685451468; x=1688043468;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8nrvZCnLeNA9XqFVfQliG+UkeK7H3UuAJ/vrhzt5N8=;
        b=Hqj29lvxvye8y5vqjzeEdMjMsNewnMm5f9rkDXHmmFL/OUVkQBunUQ/+sW+6N+bOhL
         Q0FvKAikjT2Seb6XoRs9WLfybYMAmUbFl/BTrt8bio/JSK86pB7XV0RPup8qkirVZ/mG
         1+LvGNP7N12/Pn9mY3pb66pvBjjO9lLlxMjl82ZkzFkKRse+MWfo4lP9EzqauDIJWf6q
         lzC3mmU3W3VOpzSJzpCQJuD3Yv/hvlqWHQTfoSISaxgXeiJv5MwWWLnUYBUNfCA3DY8O
         c8HkkLCfLFS+XIW4PoQ68x20AM0wFm9/dmjID4gjAwkJo2BCXPiSe9NW85KmqO8rSJ/S
         H7OA==
X-Gm-Message-State: AC+VfDxUgZ+hTTfLXD7bMd/64vkir9by1qeHtqSN8Ka+GKDX0R89iyaw
        NHOR4v970oTWh+TXUrmPDiiaMg==
X-Google-Smtp-Source: ACHHUZ5j75si6JaQVxIJyh5Z6yqFoPGjctiJLF48SPBx/H0MmZO8dD3x07xHbqxD5hv4du4ojdh+MA==
X-Received: by 2002:a17:907:d16:b0:960:ddba:e5c3 with SMTP id gn22-20020a1709070d1600b00960ddbae5c3mr2428277ejc.32.1685451467865;
        Tue, 30 May 2023 05:57:47 -0700 (PDT)
Received: from krzk-bin ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id m13-20020a170906160d00b0095342bfb701sm7488806ejd.16.2023.05.30.05.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:57:47 -0700 (PDT)
Date:   Tue, 30 May 2023 14:57:44 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rudraksha Gupta <guptarud@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, soc@kernel.org,
        Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, Olof Johansson <olof@lixom.net>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Samsung Galaxy Express
Message-ID: <20230530125744.n2pxo6jhsgeq3xgn@krzk-bin>
References: <20230527040905.stmnoshkdqgiaex6@ripper>
 <20230528001010.47868-2-guptarud@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230528001010.47868-2-guptarud@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 27 May 2023 20:10:06 -0400, Rudraksha Gupta wrote:
> Add a compatible for Samsung Galaxy Express SGH-I437.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1786779


/: qcom,board-id: False schema does not allow [[8, 0]]
	arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dtb

/: qcom,msm-id: False schema does not allow [[194, 65536]]
	arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dtb
