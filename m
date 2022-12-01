Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB97763F2B4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 15:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiLAOXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 09:23:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbiLAOW6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 09:22:58 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 501398DFE1
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 06:22:55 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id l8so2021224ljh.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 06:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9iFsZv3cbflfd0iXr72+f/UJOaMLz+n6AvbilmWkaus=;
        b=oE0R9fLlWkCZdU453zYYSxl7EKUMe6JQBTfFM9my8L4XCzyVSDBzQnOpHCDLQ1+qgD
         lynpKkp9rPS9ay7uN/HKG0M8cF32Z46bLAivqIYIo8+tdJO8/Qte10BgNf8g3U2eSmQe
         I3WOlRgs8+/wJrVffqRrrLL0J5uZjEXYvt0kBdFo3GLlaqnymnGG+UfUJ2T+NlcTQxU4
         sBjlgikOz9pBI94pX8gGplLo9i5aExkD1BMj60WmRiexuG+o+9GeFdf4Ak7iWaIht+WE
         eoaGooK6xUrLKfcxxAmn//RbMSt5hwv9mOE+PArOoHamq6XV0W1ck16fmU37x6XfRb7D
         RgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9iFsZv3cbflfd0iXr72+f/UJOaMLz+n6AvbilmWkaus=;
        b=LP2R8e7w2K17Djr5mMk+ju1Bk28FK4NfoD2mV56W72FCulXGuHczg82lGaZaAzfoPS
         K4/6sMDy0hbLCunIyDcUu1XxNVmxTNpoSQnmSKdcid77pKOVZlbDKCmbjH/WHV/6G/pw
         4hJaQyuJRJ+s6vCfb/AlEImRqD/AXAiAcCGF1FvpX9OyecEFeMFiCFYoEcVuWKj0SOpE
         SP/e1tYOYyse3oByIelI5P/sS6JmVJaPbXxKtviDx8x97Cedz0MghecfCHoDSAhLhWmg
         8i9w4arlBHuZ0fcBkRJm1IYjIEMKXHsp7bgzlNAFGaZOMetVmjy/POeJTWLfxryWtY6g
         2J4A==
X-Gm-Message-State: ANoB5pmzVyuvaKyiqJ6SWY9hmEIoa8LEP9Z5UDGTcbpnO71f5Rr4lb5w
        bX72YfDXKUgRLCBaxkFNdOG/mw==
X-Google-Smtp-Source: AA0mqf7xD/Jkb+lgOKtkI8jWh7RztAlQeTezKB2+l3CoXG9Hfjruc0/pjkMibi3HSXx0SNOrEZhGag==
X-Received: by 2002:a05:651c:54b:b0:276:d9a6:dc00 with SMTP id q11-20020a05651c054b00b00276d9a6dc00mr22490570ljp.379.1669904573898;
        Thu, 01 Dec 2022 06:22:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c17-20020ac25f71000000b0049311968ca4sm658343lfc.261.2022.12.01.06.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 06:22:52 -0800 (PST)
Message-ID: <26384fb5-4fb1-d629-8153-5577d75c5492@linaro.org>
Date:   Thu, 1 Dec 2022 15:22:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add SoC IDs for SM6115 /
 SM4250 and variants
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        a39.skl@gmail.com,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221201141619.2462705-1-bhupesh.sharma@linaro.org>
 <20221201141619.2462705-4-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201141619.2462705-4-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/12/2022 15:16, Bhupesh Sharma wrote:
> Add SoC IDs for Qualcomm SM6115 / SM4250 and variants.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

