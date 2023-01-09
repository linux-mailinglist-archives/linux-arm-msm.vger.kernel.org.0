Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A768666253A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 13:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233884AbjAIMPb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 07:15:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237226AbjAIMPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 07:15:20 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29161A81C
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 04:15:19 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso6540859wmq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 04:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sf2TZznzR94HwbxPhrrDg7FkzybRt5Em8Lc/blKdqH8=;
        b=SzEGagKva5XOYlfYjF0turJTD/NqRAWhsxpnDTO8Bw/EzKXMjgL4qlfBv8D1TjmLyt
         IBozLxYW4mOY10zCNAdNj46Ur/AMrhKmQZ9fZe6dOHH6EJxc1seHhu+qVUFWYk3Q9eOS
         swgt02fhDMZYimDxUQ/rkescISOKQoKqMIP9HXwZ6jak84gktnrPCPPHaekZGxTdXiE3
         w9RkSPxRzDdhN7pTTrYe5Uv/etW/xaLclLIybO0+bJHUZqFQFmECqsjUpkC6HgMIW/QM
         SNF2meC7vaBtxQYWtXEYcRrb34LM18X3YSq9BhAYLFXKzrJA2782nSE+oY6j3MHnFMMZ
         YyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sf2TZznzR94HwbxPhrrDg7FkzybRt5Em8Lc/blKdqH8=;
        b=thdtA8dM0RfgLMrlZf/z1sufJ8FX3PGuyw7q5FsOalbLyVm/uicWovhq944wu78nqI
         N5O4vsgBYZTa09tY701W4I74WEninG+ReLiARHsBQtun2ykq1N/zQCuQi+ICIv/CQvVN
         r6LfVnk9He/xVnoGFn422EapX7ceMmo+crOQyCoacex+CJaJy9BicpKBTpCNsiSBICM1
         ccqfsEjJY8R/jXlmIATBc/r1SArX/68yQ+Fy0bJO9aNsit5ZlQfN4fafMkihApPnrU7h
         nQtLDV2HEZjUJjbgmT5e/7CQuuSMWG7Zqos1dYKl22yImHG8+0dv7Ac8JWrNJ56xtryD
         bIvQ==
X-Gm-Message-State: AFqh2koRLxYYmTIQjT8/0XK3ntchpTfaC7rs2a4Cz3FwoQwVm6+jZqOY
        k/t9Mtth+7l4mqj8KHg5vU149Q==
X-Google-Smtp-Source: AMrXdXtmVMaoiczR9d03qwRGWbgZHDTNvXuMvAvIqtS2eVUgL38gXdUkMeGdBX/TO4oTGIKbhnIUkw==
X-Received: by 2002:a05:600c:5022:b0:3c6:e61e:ae8c with SMTP id n34-20020a05600c502200b003c6e61eae8cmr56295366wmr.28.1673266518601;
        Mon, 09 Jan 2023 04:15:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id az28-20020a05600c601c00b003cf57329221sm15656813wmb.14.2023.01.09.04.15.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 04:15:18 -0800 (PST)
Message-ID: <4b7458ce-18cf-8222-b5c7-349e07dc6b87@linaro.org>
Date:   Mon, 9 Jan 2023 13:15:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: document the Visionox
 VTDR6130 AMOLED DSI Panel bindings
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-0-dd6200f47a76@linaro.org>
 <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-1-dd6200f47a76@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-vtdr6130-panel-v2-1-dd6200f47a76@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 09:49, Neil Armstrong wrote:
> Document the 1080x2400 Visionox VTDR6130 AMOLED DSI Panel bindings.
> 

If there is going to be resend:

Subject: drop last, redundant "bindings".

Best regards,
Krzysztof

