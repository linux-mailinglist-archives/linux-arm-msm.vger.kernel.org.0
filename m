Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCC054299C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 10:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbiFHIkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 04:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbiFHIji (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 04:39:38 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B0C1E4BC3
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 00:58:58 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id y19so39798489ejq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 00:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6Q5FdgVP8OZg3GIdsAYNEY53XcA8611Hl5+gVXO7790=;
        b=zs5M0PlpBU5Rj6lc+tLkYZypPtYKTDLqoG/rfhvJL9CckMAyBX+rVUkFz32AhJ/B/P
         qv5MtYuLNGlp3NYHhj63Ue0Z17SIZAuCFqIrpEl5Keoy0fWcxlWGOmDH0++bzcxxb3VD
         Ri8075DQSjzLNjZwsHrT8x3SH7JZ6sHDRSQcJW5SnsIgypZxhT3aoxgdeT0ekYZnEhul
         hCjz6j8BoNAVI2gAxS7D48YlOF5od+8oFa8e1w4ohUzJjaPtD2EqQ+DnExzbWDEnrS7i
         i74zBQKG+Q9VMFAkHsgJm7ftrBPOLMIpGJu67CkLmzOl0Jmk8yaRyfn4FY+NfLQhzeas
         MicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6Q5FdgVP8OZg3GIdsAYNEY53XcA8611Hl5+gVXO7790=;
        b=AGDSsi49zzfUvoHfgwdRj+KOL/K+cjzpilSfVCAtpchOKUQyixsTt/H8ZGs75Jh4nS
         mggpR4osM3K+atzVIm351Vu+yZt9HaiVuksseNru4TzPlJoSoikmHfY0Y6veHVzMIXTr
         35itd50xGzTE/dcBGIEQKpuQNhBhYd/050siVtQotDX6QtCUpAn70i1MkOYqr/kD8v5w
         jcIiNddgLjenNGF0HxYN8n+EOhckPNRpyCfCZ+DIpbgHH6K7vTleOcqazI+KqJYnotjK
         7FGFKiyoTI2vCQpwz/kxrSqjE/JeJVSqCpbP7pMfgHBoT8YXmSTWHlZ+nyP3O5H5H94I
         1K4A==
X-Gm-Message-State: AOAM530Q/xGQFZlvkAAAoZhZCvntdGNiJeEKWSum1Y901qbe4+Flmry/
        1v+xzzTEz/IYE5zometBEcTYAw==
X-Google-Smtp-Source: ABdhPJzb/dsRL6rsb5Z4shOLN9Lbi+McEv1tdNHRTqEgCzD+sVevGLREksulT6tWaIIIx587nap+JA==
X-Received: by 2002:a17:906:49d4:b0:6d6:e5ec:9a23 with SMTP id w20-20020a17090649d400b006d6e5ec9a23mr30993322ejv.79.1654675136499;
        Wed, 08 Jun 2022 00:58:56 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y12-20020a170906470c00b00711d0b41bcfsm3584719ejq.0.2022.06.08.00.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 00:58:55 -0700 (PDT)
Message-ID: <543f3e82-9016-9a7e-4533-53ec8d5f0703@linaro.org>
Date:   Wed, 8 Jun 2022 09:58:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: qcom,qmp: Add compatible for
 SC8280XP USB phys
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220607213543.4057620-1-bjorn.andersson@linaro.org>
 <20220607213543.4057620-2-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220607213543.4057620-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/06/2022 23:35, Bjorn Andersson wrote:
> The SC8280XP platform has a pair of 5nm USB3 UNI phys and a pair of
> 5nm USB4/3/DP combo PHYs, add a compatible for these.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
