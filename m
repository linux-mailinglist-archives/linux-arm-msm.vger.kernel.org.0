Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 946E65BB95D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Sep 2022 18:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiIQQ3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Sep 2022 12:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiIQQ3U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Sep 2022 12:29:20 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F03A2E686
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Sep 2022 09:29:19 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id l9so2682807lji.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Sep 2022 09:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=7tB9EZTG3PEkklzL2kk8X5WIzx34pekk02vFSwaGxV4=;
        b=wd6ibdnEHUqCrWmvAEMpeCyL/cGqIGhk6hVuA08svRYV/JYMUluTuGLA8QNrVoTn9J
         TpgwfoFvfeqSnhToQ1bAg7hZ+fMoEDhJIHjKICMEN96TJB85fLVKej6ZJmQ6AYooW8/j
         S+YT7tI4orbAlGCl+9xGglUZ2OuqbpxjLIIzDXnOdS4RAcfJN9Q1xTvi0Co8OIunCUQb
         WjBdM41ERWLKOe2iyWxP6I33LNgoa9kAANIIG4AevCVgq7jocc7kfwXeI+Orz86l4g+W
         N6mQXlLGmCwYaaZQhTx4fCYUSt7pGtGlvB1nZRB9u0wTvTdGr+GCSouAhSIcLqb2AouF
         f6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=7tB9EZTG3PEkklzL2kk8X5WIzx34pekk02vFSwaGxV4=;
        b=VkIFNUDvwpA9VTq7DnlYGGkl/ha0zxc+Hc1m+ZzmdAHLQ3YuXKxn/Uv74/0pMuh+X9
         J+yDVuEUqgJwG3huRY6ZzMKEbmq1iOi2U9C9E7YVzGXmmeUSjSQB+fMqJwoZIWuoqxzP
         csg2PuUxzFHCdTbBjIpkrYZcfH5G9qfAqq3GgKtV6SU0k4EZ14K2lsRrf/OETdDwn6K1
         rsNWFoxUSNf9J1Z4XqggMaV7XRyJ7RLCZvIkws5ioQa/S2Bh/skia0u7boHehCRCN7wa
         sShYRB8RLhSssptlNEkRw0uxsR9iwwLLSIGdqsFO3L+KBLkMlG/SSUtNEHk4qohJnz6u
         5cWQ==
X-Gm-Message-State: ACrzQf2epK6IRxbjMQoT8Uhew2jijJIEVENycF5dUVX4cX6cuVLZYCZY
        1fv0p7+qE1iBa1fYiFiwBmxlCGNTar7zbuQc
X-Google-Smtp-Source: AMsMyM4A+YO8CUScLEMBn5p9Mna/jYFF+iZiZoMR2ircNNLP0g0nQYs/UlMVskMwixTvLFTg9gV/BA==
X-Received: by 2002:a2e:bc84:0:b0:26c:3bee:575f with SMTP id h4-20020a2ebc84000000b0026c3bee575fmr2166257ljf.389.1663432158251;
        Sat, 17 Sep 2022 09:29:18 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s15-20020a056512202f00b0048b003c4bf7sm4170665lfs.169.2022.09.17.09.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Sep 2022 09:29:17 -0700 (PDT)
Message-ID: <4ab42192-1447-a178-4667-507351bbffd1@linaro.org>
Date:   Sat, 17 Sep 2022 17:29:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/6] dt-bindings: firmware: document Qualcomm SC8180x SCM
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220916121204.3880182-1-vkoul@kernel.org>
 <20220916121204.3880182-2-vkoul@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220916121204.3880182-2-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/09/2022 13:11, Vinod Koul wrote:
> Document the compatible for Qualcomm SC8180x SCM
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
