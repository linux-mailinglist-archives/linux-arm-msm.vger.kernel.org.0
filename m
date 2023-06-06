Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13565723727
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 08:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbjFFGG7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 02:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232421AbjFFGGw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 02:06:52 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2954A10E3
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 23:06:27 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-97458c97333so698779866b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 23:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686031583; x=1688623583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kvDh5BsnU3tF3jOG1nk9VooktqarbPV+7D1/4gVZFeU=;
        b=PpVLxDUIMRzQlN/pvWtGQLa7SpeCYQ1H05zs/yOGO3P5SXkR578MQ6gxdfls1LX2JA
         tDI7ct04Oi0CT28GjgsHsiK7mRRuKjbGb//3UVagqp3/aQt++aFXnlYQZKyNwZcgEyFE
         xm0r94rVOqhHBF6/xyAgKLdIEK7TrQ7zMdkGpcPAID5NEtg+PepBl9qRq3q3UD92AT1H
         h8FJB4EhBj/Rpw5UWx5/yROTKn0YhbUWlKyUqRMJlfJ6Je+8yN24Lzvz6fuTKMqfRHu6
         /8G+q8JVBV2AFFFfrNxjA3JCTV02cM20YojRv43SXusj9tbtZWjfhIJC+64Iip3XL+wJ
         ypPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686031583; x=1688623583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvDh5BsnU3tF3jOG1nk9VooktqarbPV+7D1/4gVZFeU=;
        b=csePC9FQ2zHwdxoM127Bza3OPVTf+xZ/190oJghURTGmposnRQR49WeNiiJCgeWqoA
         wQYwOjGlFlp2qZV67R4hZcdHq/t0iGzVAD0yNtunKtT0bpWb8gZz6QLo6e36Hca99YP8
         p/WU9v10UbaXXzica44drYqo27JwKCQxGwwbmbtaUkC+R6oI6yzh7ntaCIL7ldoRjC2d
         Tm03A91+FtAkt4kWcLQxAF/ON0QHX39PcQ1WAvfI1H+7NgIavJvy3ft55q/6lhndqfB0
         lONFNYnGZyg/YOhbQBmYBYp+iAi4TM1BtaOIjOPTIddDKBJ2rfXbEaNnZfbeNNw3L6gs
         h6Dw==
X-Gm-Message-State: AC+VfDx3mrTO/Efu+BZXU7xd3sjIBqKre0kN4Re5vNKpj0VR+bzxoSQ1
        ItKxxFktA/SdiP2rplmjmWQpbA==
X-Google-Smtp-Source: ACHHUZ7aR5/H9xX8f558HHUOk+j277NWhkqZokqLSzVflv5qVSUKTBACmv4OYehJ9JH+WgM8BErYQQ==
X-Received: by 2002:a17:907:3d93:b0:977:c7f6:4e9e with SMTP id he19-20020a1709073d9300b00977c7f64e9emr1096759ejc.33.1686031582796;
        Mon, 05 Jun 2023 23:06:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o12-20020a170906358c00b00966447c76f3sm5179810ejb.39.2023.06.05.23.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:06:22 -0700 (PDT)
Message-ID: <7a6544b0-5c8d-8b61-71e8-32f59e93c2d4@linaro.org>
Date:   Tue, 6 Jun 2023 08:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 08/10] arm64: dts: qcom: Add QUPv3 UART console node
 for SDX75
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, tglx@linutronix.de,
        maz@kernel.org, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, mani@kernel.org, robimarko@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <1685982557-28326-1-git-send-email-quic_rohiagar@quicinc.com>
 <1685982557-28326-9-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1685982557-28326-9-git-send-email-quic_rohiagar@quicinc.com>
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

On 05/06/2023 18:29, Rohit Agarwal wrote:
> Add the debug uart console node in devicetree.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sdx75.dtsi | 49 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)

GCC and UART are parts of basic DTSI and do not make sense on their own.
Otherwise, what exactly boots on your "basic DTSI" commit if you do not
have any clocks and serial console?

Best regards,
Krzysztof

