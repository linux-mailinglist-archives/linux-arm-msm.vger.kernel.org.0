Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4CDA676D43
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jan 2023 14:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjAVNvK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Jan 2023 08:51:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjAVNvJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Jan 2023 08:51:09 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 824251DBA6
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jan 2023 05:51:08 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso3303899wmb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jan 2023 05:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JBQsna4Ml4m+CXKj50BA/m/QubV2oPbdfMdO4WVRYYc=;
        b=VLQgazTYjVfIt001bxaQt/FbWF7560Tm2HbPWameob7U/hMBFgmtO5QiueZDdoBgST
         yJRDUHKPcDtFlR13MfwK6UuMpmGd/SsY9jm8/56ZcX2A9c82dw/uikQ5rAqilaLe/AAP
         J0WyJ7vEcVPba/Y5NGTYvKgpEW6uxn1gOFOCq/R2CjuFU/COPhPmSg/syLVEs1LdD5BR
         uKL2zHK5Wj7t5i3jgeZLpULo6IME8uPpWMCqMAa6/ygs+p+fJP0GywNXldgX7EJ6mQRm
         N5ks7NmEbfrIZuWruK+nx1M60WisROVzxiueSsYiwDoXDdvIdTp5Yi8ukREaOlVTau2p
         1sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JBQsna4Ml4m+CXKj50BA/m/QubV2oPbdfMdO4WVRYYc=;
        b=Zn7eXeHbaB9ZoOZu5ojPbap7ljsktYaiTiPp0+H/xoiN3d72sNODcWgcHI4odC1fbx
         f4fkjp33CgdoyOkMYYG6JmTAw0DKvFvNnY8oYjvqclLfqN2kTLPo7nqsg886MeOGJGAe
         KZ88z6TpebCKqYCTwR7vzN2w2+is0ilxJuB/RwRjYsJ8JMk19jhLK4mQdEby9bhG894/
         8RWP6+qPPqbBI9w+fVYsiKDP0uq9J/LRWqTUBSKhfXBGYXG76c2w1BQfD3GjJvsw3hcb
         bRmGcXcbOAtpi2eN16U2ttyMIDpK4j/8ugVacb8aF75BnXan/ip4gxvp1igdlmG8rvey
         /VXA==
X-Gm-Message-State: AFqh2kq7d6U65PAYKF662uGTMwclAm1AD+0+cG82RUtU117nziWFPJDe
        iu/TF+X4z6vgzIdVaQB8fND5vw==
X-Google-Smtp-Source: AMrXdXsXRA6OI2AcFH5C60qUwEPyDPWkyeNw6lIIh9+btcIBhRDQrJ9zcvZzYhgFuv/QMs45W/Znng==
X-Received: by 2002:a05:600c:1c9c:b0:3d3:49db:9b25 with SMTP id k28-20020a05600c1c9c00b003d349db9b25mr17348348wms.26.1674395467083;
        Sun, 22 Jan 2023 05:51:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c378600b003d9fba3c7a4sm7953734wmr.16.2023.01.22.05.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 05:51:06 -0800 (PST)
Message-ID: <030115dd-f489-5d4e-c993-e9fa8b550f04@linaro.org>
Date:   Sun, 22 Jan 2023 14:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RESEND v5 0/6] Add resets for ADSP based audio clock controller
 driver
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        swboyd@chromium.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org, quic_plai@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
References: <1674322340-25882-1-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674322340-25882-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/01/2023 18:32, Srinivasa Rao Mandadapu wrote:
> Add resets and remove qdsp6ss clcok controller for audioreach based platforms. 
> 
> Changes since v4:
>     -- Update Fixes tag in Merge lpasscc into lpass_aon patch.
>     -- Revert removal of clk_regmap structure in Merge lpasscc into lpass_aon patch.
> 

Your v5 before resend have build issues. Please fix.

Best regards,
Krzysztof

