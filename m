Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1363A621E0C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 21:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbiKHUwS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 15:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiKHUwR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 15:52:17 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F38D14AF3F
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 12:52:15 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u11so22899984ljk.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 12:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OGSFwgK3Xru6xCg2uioQoFI439LPe03CP0uz0+rdENc=;
        b=GLC1ZcJ0YHbvGQPLlsyDO8T3sYfnOrfBlA9PpjqJDYjIAbtM3t2oxb8MKlrgWQMfCI
         yR2PU0Fp9spXSjEj8rC/KUIzQAFEPuzt3AhtXb75i54X8Op0X9z4fnSbhdwl9A272HHb
         XWr9Z8dhsmQMpPKhY2rA/E3qTvihCAk/PDTPVT8RlX3c1C2ZQFE5v+LDNuUjtmH6ys+Z
         YPgczrYlKmO74iUBMpfgKTjqH55S/t4boxzEDqU6m8P1mMWimgW/gJt9MzDJfsfGPOfu
         sT7BaDdhnuKYheEVJnFeUiORnG+aXyIy9u9P7SFDco0yDJJC4jfCCrjya0DrebL+Fe58
         IWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OGSFwgK3Xru6xCg2uioQoFI439LPe03CP0uz0+rdENc=;
        b=L/RbKfjv3gWdLcq5fMnzM9AlZNYBwDNq8J7QjWXqeZ0pZDGngQ+41+6t2rUmnzjh9H
         CpNPHgW7fUBOnSkEfBGJ7XF56/DWTrUbpLWqIxZWkGxefvRLMH+QhJvA2gDqgAeg5ZFJ
         eSLi4U6dErtuLJsNlLJOWABDF8rToe5Hws/9FZz/Kq5iFkjQhDQ+DX4Aj23swIwwJK5h
         3WQ7K2Xe9uWUeSFv+DZQEvXXAQ8ANWTRsv35HYulyUsAmVCk3aCpgIrrtimuQeTs/2D4
         c/to22Q0UXeroAyICwVst5Y9VT6Yl4kA+Xw7fuSRfu9SBuRohWudIR5DH+fOA+A+L6PL
         go9w==
X-Gm-Message-State: ACrzQf0cfIhZePybjO87ZGn0oZ2FfJqOOzj4v8uy2GfNUarBCBtU+bWA
        nUzS3LT1Wyt2ptK1Zbz95111Ew==
X-Google-Smtp-Source: AMsMyM4+Srzcu1J/9xM3Zj4N39hyIqva+7koOAAaEOrOfaiCYynGG2BoCs53NkJ4GzIE+I986Ykwlg==
X-Received: by 2002:a2e:834b:0:b0:26d:ffb1:dae7 with SMTP id l11-20020a2e834b000000b0026dffb1dae7mr19975488ljh.128.1667940734376;
        Tue, 08 Nov 2022 12:52:14 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id e4-20020a05651236c400b0049ad2619becsm1921310lfs.131.2022.11.08.12.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 12:52:13 -0800 (PST)
Message-ID: <cba8a036-2e70-17df-809a-36924899a5b9@linaro.org>
Date:   Tue, 8 Nov 2022 21:52:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] arm64: dts: qcom: sc7280-idp: don't modify &ipa twice
To:     Alex Elder <elder@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, agross@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221108201625.1220919-1-elder@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221108201625.1220919-1-elder@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/11/2022 21:16, Alex Elder wrote:
> In "sc7280-idp.dts", the IPA node is modified after being defined.
> However that file includes "sc7280-idp.dtsi", which also modifies
> the IPA node (in the same way).  This only needs to be done in
> "sc7280-idp.dtsi".
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

