Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C063E68E970
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 08:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbjBHH6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 02:58:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbjBHH6V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 02:58:21 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C93393F9
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 23:58:20 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id j25so12311858wrc.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 23:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53XamUUloQYj/jVvLSV4moBLsa3YomfACjfIwHnHSNI=;
        b=GPBZVn7ZfcdsfPWdTduklU51G2rhQj364fR41ayHVt3aCFDsimiVDN1DdOb1z3LBuv
         WC8jbiLlLWU3kA+VFDyVwlkUnAu+f4QeXBSkF4swK4M5gOV8xe0QyBuzfPyf1dJPkCOw
         7EwXxcVpThdDQU2owzRuXxAVGGooH5pZ1UDZVljur9hQK0XLAQWXWZY+PcYtZ2iLYRUc
         rUz6xFvjSYDoZ++L4Fk1zal+ejxx9vkIgw9B/wS9OhVND/RiyqA81WO3AemORRvoU0NW
         zmuE09d4ITmqfTAxEm1hK44GFGMcEq9RVvLrXUIBWAGvbxvS08Kwjv5LjoCGtuW7D0XD
         xynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=53XamUUloQYj/jVvLSV4moBLsa3YomfACjfIwHnHSNI=;
        b=KmeSn7tjrSvA73jFdfY71MwHPB9DxoLYl7g/iSn3VAFj1vr3I+4IMI2DJhHrP9fSU9
         tOuYPBFlYpluVoEocIDskG25Ro2WFK6lrh2IqCsPFogAxPUJ3yMLLg/ZEmP9BXTUoxPv
         Anp8EnRRwne1LWHLiHoYWL+8R+g7O3NXQSMarmQMiVzcBzLYNaaDZV+PO3iFNJDPgcqa
         SXx8UckL11jkN7FfsbbEuLwIQ1ChAP7oWt6o/CFImIIno00Dt/4V51qFPnjSS/AVv28F
         hwpgFPAnVPVc4JdUXVFbonISx7ZW23CY9nzBBAeMnHKvzbFJbleL2iCFVWoEZLQtdoRU
         t2Bw==
X-Gm-Message-State: AO0yUKUQESL/e9uRMOWkvPvhZYOgolhPgs6ITc2AC/a2HQ9SnqjlmGly
        IYIe28v56HIloPxLx6l9PXzGPg==
X-Google-Smtp-Source: AK7set8lQDcsnWmrx0kQMFtwUSItD+vLMs7AH/LE1ruIcfb91C9M8IKgZBf4CI5Iglz2RaKzuYEBAA==
X-Received: by 2002:adf:f749:0:b0:2bd:f71a:5b32 with SMTP id z9-20020adff749000000b002bdf71a5b32mr5428250wrp.58.1675843099089;
        Tue, 07 Feb 2023 23:58:19 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f9-20020adff989000000b002c3e6b39512sm7566243wrr.53.2023.02.07.23.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 23:58:18 -0800 (PST)
Message-ID: <f0b5e056-50de-4712-d600-8abd147f9c13@linaro.org>
Date:   Wed, 8 Feb 2023 08:58:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V3 1/5] dt-bindings: scm: Add compatible for IPQ9574
Content-Language: en-US
To:     Poovendhan Selvaraj <quic_poovendh@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        robimarko@gmail.com, dmitry.baryshkov@linaro.org,
        nfraprado@collabora.com, broonie@kernel.org,
        quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230208053332.16537-1-quic_poovendh@quicinc.com>
 <20230208053332.16537-2-quic_poovendh@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208053332.16537-2-quic_poovendh@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

On 08/02/2023 06:33, Poovendhan Selvaraj wrote:
> Add the scm compatible string for IPQ9574 SoC
> 
> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

