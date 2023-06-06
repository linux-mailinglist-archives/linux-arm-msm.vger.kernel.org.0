Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACEED7237AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 08:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235439AbjFFG15 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 02:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234700AbjFFG1a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 02:27:30 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB62410DB
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 23:27:12 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-97458c97333so701622166b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 23:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686032831; x=1688624831;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rK8qNpSdVsIWQ91gDYIe7HyAHHmRHGCxSKG2M0gGQV8=;
        b=RRrnPHogFqv2PfbPtGsKjFM6En7p+nppwhoP9ZmE8jfwtJ4JoyAtuSFOT4t00rtIBn
         VKquiaQsqojxOZDimQbVdTLTUeLt+wm/34AeYggUOJgw+9ZFKe3xR+dPHgSu2ybrJeyY
         YLLT+HIG8/jsHn7fRVwSUAbn7OqZea1dI4DHB+6x/63g7ovJIgthnAf1p6EQfanHezXG
         9ZYjEF9i0JM6h9c5CErwbcBxbG3HonAJfR34QKetTXt7b3HJHdycroi+00fukLuYxxpe
         RpMNzQ3A6YkKqgDb5jOBlmQ0fVl40M68aalBkes/DE1i1gkX3V8douMd5klngM7Yd8Mg
         +UYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686032831; x=1688624831;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rK8qNpSdVsIWQ91gDYIe7HyAHHmRHGCxSKG2M0gGQV8=;
        b=JmVzz7mFY6EpO7Ys5nRl3UVNuwJ9YOQ7MV9GOm7CGduF+m9P93yA8tnMkBgpAlmJL5
         6fIDj+7vfuY9TYh5lr6WPEdA1cqJpDTHDTB2MajLJ2PqxCZzdNILmkJG28ovQp6MMZRB
         +RRD91ZXQAAJUb9LSPpo4mXiysqrAQgU6SWFZZlM5FhEX0JNcLztJXBElbOCprUQ7JSF
         1EGRT/g2uBpphL62wrvQdvMK+jPLXW3ZeaagF2u+0PFoLgOGpY+KXb9vA1e8fu1BAXcf
         2glWAM3hDXQAWs3WAV6BAFR+amPM1ChHmdBc4LniAmyoNE5ls/bW5mibA5M8hs2C/l8q
         HpkA==
X-Gm-Message-State: AC+VfDyxE1xebq0qZ06xxuDEfgs7/NnSqDX/PM01Jv3+3yf6WLdQeTUe
        C6MZY+aXMi2XuvEXb83/ahptVQ==
X-Google-Smtp-Source: ACHHUZ7Yl1ScVMauUKOUaf+wW+hsHr3CHV4ReJlPek5ELSREkESKpXUakNSJOQf0/BrORVtTW62XoQ==
X-Received: by 2002:a17:907:3f10:b0:96f:c46f:d8fe with SMTP id hq16-20020a1709073f1000b0096fc46fd8femr1376571ejc.27.1686032831330;
        Mon, 05 Jun 2023 23:27:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id bw6-20020a170906c1c600b0096a91ab434fsm5142160ejb.40.2023.06.05.23.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:27:10 -0700 (PDT)
Message-ID: <53cf28e2-3893-40be-4d76-50ff0b4edd4e@linaro.org>
Date:   Tue, 6 Jun 2023 08:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 03/14] dt-bindings: soc: qcom: smd-rpm: Add some more
 compatibles
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v1-0-e0a3b6de1f14@gerhold.net>
 <20230531-rpm-rproc-v1-3-e0a3b6de1f14@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v1-3-e0a3b6de1f14@gerhold.net>
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

On 05/06/2023 09:08, Stephan Gerhold wrote:
> To avoid several more small patches adding new RPM compatibles in the
> future, add MDM9607, MSM8610, MSM8917, MSM8937 and MSM8952 at once.
> All of these have been worked on over the time by some people and are
> definitely compatible as-is with the smd-rpm driver.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

