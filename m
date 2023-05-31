Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5F07179F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 10:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbjEaIY2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 04:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232250AbjEaIY1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 04:24:27 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 371E393
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 01:24:26 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51491b87565so7170319a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685521464; x=1688113464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7/tPM97+ixfB8TGDp/bQzzt7wmHeXbjLj3vGjIL85M=;
        b=HEFIw5btRQu1bchZauFcEAzopwCzK90tcqrlscyQ7VWmzwdXLp3QxgH3h4BGpTJcbv
         bL8CYMBqgB8VYU8xL3HoKldk2CP43VguDhP38bOoLGwIAj8oWPxIBbRe19JhHIZ/iLEU
         dGwQcyj/+peSM8qdbO0sz9WPQAS15NtuRI3WDb4nD7ndsawDl23Mamo+DmfK35bIXP+X
         6KCiMilZQFqjied0ZUcVJmTm+c7BM0s1xmjqOgWSgKAv2HQj7+ygV+9NfoYy/11dT7Do
         R8OdAEhmz48pxkUVD4vJ7AN6FlptF6j9t85lYHoEHT8QljomEhqxLTLDqiCNRLtRmkMt
         kiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521464; x=1688113464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7/tPM97+ixfB8TGDp/bQzzt7wmHeXbjLj3vGjIL85M=;
        b=KoqLZHr8OKnMp8rlzG8ZAXMXDn7IwlZ3np1Z47tYkqegsWNngctJEpGV3ry6wlYZs8
         ytOG/l5zzuDfPCw4tRcYYgulSGFd5AOK8qlAPyAIP1znUg3biMsbmN7DLHQgb2emzmax
         hjGNTyGXfPxFnjxbP+jRzJQWMVOfjN8iruv89FbIJwvX3JlCq4apQHJtHKM4g9rV/uej
         hnCzZM2KKQo8Lm/N3q2PjDmWExcdATRcFDK9GDRUDniUfVlnAgSEgvtcCUcPfFkY4YfZ
         T+LXmT3ZXe4gaXZeFauXFdvFOmSpqtBcwBOGNiZAp+SORjEibd8CRiIjjgKlnDNuQle8
         fWgg==
X-Gm-Message-State: AC+VfDwfZ/nknmYjTvk4BVgeN/FoNIQJNbxjbbhrg5rQqvPBxYMdqqz1
        rkB6/8D4p8ziuUbOHXwOkyeMiA==
X-Google-Smtp-Source: ACHHUZ4wiQr0aDOh1HHknnfz6rabMIF5zmnzY6T/SaEwLpozbf0hBSiy/0VRb0dgYN+ZvDTr2qGhyg==
X-Received: by 2002:a17:907:6e0d:b0:94e:afa6:299f with SMTP id sd13-20020a1709076e0d00b0094eafa6299fmr4623253ejc.22.1685521464725;
        Wed, 31 May 2023 01:24:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id n2-20020a170906088200b0096f7ae359a5sm8605987eje.30.2023.05.31.01.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 01:24:24 -0700 (PDT)
Message-ID: <38a93add-9c78-de13-4301-8929bb712525@linaro.org>
Date:   Wed, 31 May 2023 10:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 04/15] scsi: ufs: dt-bindings: Add SC8180x binding
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Avri Altman <avri.altman@wdc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230530162454.51708-1-vkoul@kernel.org>
 <20230530162454.51708-5-vkoul@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230530162454.51708-5-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/05/2023 18:24, Vinod Koul wrote:
> Document the UFS HC for SC8180x SoC
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Nothing improved. :(

Best regards,
Krzysztof

