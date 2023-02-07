Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFBF168D41B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 11:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbjBGK2p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 05:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbjBGK2o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 05:28:44 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABE928214
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 02:28:41 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id jg8so2313032ejc.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 02:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s7J7u2Qz+7H4Ix8Zm45ziYf6fCeHhyW1BziAA2F0ItQ=;
        b=aj7HB7Pu427gQQvGUJlnNvf14ZCXd/FJAiIsyltyKM1WCE1KfkS/9ITk8ls280ce8r
         NprARlQSCzuxZLqwJxCNZERR1H9rGpw1vt8sDLlNFiOM9G97CAh4pvRk4d7kPGl0/1xs
         APUm/CP7her/HodDE2OBj3evbfnfdBzo6zfGiX42Dhl5uPpn/hN8b41bX6nEglV3zOra
         MEmhxn67hQ63EuoNpdRBhX5S4fufEMKWblQecPiAIVIkiVxDJNKe0l/j/dmFo6j5fOw4
         Eopa67LRlJ+FpN3BzgnaSMoW/EKoy9I0ss52u+Lq5/pvW9XXoEceFvA6C9FOsKoA5YCl
         q/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7J7u2Qz+7H4Ix8Zm45ziYf6fCeHhyW1BziAA2F0ItQ=;
        b=3ErJNMgjlhuDuqUOxAK7ysskdIcPKbRwmOs5xxi3SmI7sLqRkrlIhdFeuEjnx4mgRt
         6Jy8H1cTA3+XKThaO9rjBtDMbQoE94zSwHDFq8yz+3JMgsNZYxpslADrPFSyEgKEbB6F
         3r+6X/4od9dgUQovowfGZ7kTAsBjHGmRv899XFJTyh1JBJIGT+q8i+4XFfxt2wefUiRw
         CXDcJfAITi8m27Zc7H9MK7v+DuIFzvIkw8ZwgCwMJH2DgegOhiLH3bjalMaIMHkvV1QC
         pCrKA7cjGvXDo5JEdrINaxafU9O4CUe+TBwQAB1MqO12p3OMWgZgcX1rxGRfYKGVINEF
         Dzsg==
X-Gm-Message-State: AO0yUKX1CRsxjcjqlAhkj7sMT6E+sNlpDUBvZP+0JMty8uMe7nP7ofka
        lAerNdI1UNy8LuAugFaxaHvGTA==
X-Google-Smtp-Source: AK7set/EaBqF8xouQOIgcekGCjY7OPCOUlvuNohdQhhV7OuM4LjIS1dJcWL3P01Kpq+8GLKa2pMfxQ==
X-Received: by 2002:a17:907:d090:b0:88d:ba89:183d with SMTP id vc16-20020a170907d09000b0088dba89183dmr15187515ejc.14.1675765720124;
        Tue, 07 Feb 2023 02:28:40 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m19-20020a1709061ed300b0088ed7de4821sm6710003ejj.158.2023.02.07.02.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:28:39 -0800 (PST)
Message-ID: <a753b416-1f36-0104-8b50-f0485c732d6a@linaro.org>
Date:   Tue, 7 Feb 2023 12:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/5] arm64: dts: qcom: qcs404: align RPM G-Link node with
 bindings
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
 <20230207090852.28421-2-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230207090852.28421-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/02/2023 11:08, Krzysztof Kozlowski wrote:
> Bindings expect (and most of DTS use) the RPM G-Link node name to be
> "rpm-requests".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

