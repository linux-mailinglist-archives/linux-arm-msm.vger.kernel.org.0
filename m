Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6FF4627941
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 10:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235611AbiKNJmk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 04:42:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235862AbiKNJmZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 04:42:25 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85171AF1E
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 01:42:23 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id p8so18302876lfu.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 01:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uE1x8glUwHIvmVjXriLnCvJOrdPoBpaK9jKD4omjyQI=;
        b=vFj4XOw7MV81wnWGbn0Z5BFfV6Aq3b3MoE7OGxs4tmhcEmkQ1IRlhO/cbHoLnUTBbj
         ui8GCzgr26izaQGfV+LVBlHTGm7jFKNnJk32ohVOg3Zx6vyprWIU2OdtoaHKhV2csmSy
         3tAar3tGJqEpf5PaV9nv38wqcti/7jte3RgFanQBHKzkkIqgqbic1nUgE1p8Fuh1r1NQ
         PDdkOYukmqQj4Y4/3rAq/Wu3Oab3aJaoc5a7LTpIpHnBgxoTOJrX7MKW2NEcAUk6ncgy
         QBUmibo3YPUATXXrhD0Wmc81lWIeVIjZ6loBd6CYlqe4PUqr/10lk2dphg1tRfTs76Dx
         r3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uE1x8glUwHIvmVjXriLnCvJOrdPoBpaK9jKD4omjyQI=;
        b=K5zSiT146cAmAkqiEvL3px//qKL6rtR3Wl/DaQl8IvUkXZIEUK7dMkxDgCeTNPpDFu
         2ooORYpCoaRK9uwkNPoyJL8yu/3vUGzG4C2RdT6eAIY6X8N+fUqoghQNaFW3CruGtT/6
         /YJoV1AYMhVmlYtniNjyhAKBb3L3YulLNhD/SI4OFERb6ZjfYHMKC0ywER+MvddqR2zX
         /cXcIP54HqJDRlHtq+1I/Nz+64ZLFXQIrVkB6nUhDrQdD1e2Newe5pF1sWQCB//DofV0
         SCe1stBWGot4/FyrZmr34Imux4GOc/1/MF46jPrmnPnKjjt3i56uTf7z+6znFMDbuuGD
         IDTQ==
X-Gm-Message-State: ANoB5plCZo9xmCtF6sczmSvIcS9NeK0yM/SQA2fSqS7Q/lfss6xrVvh+
        orPT5DRGjR2QML71n/Ck70f5xg==
X-Google-Smtp-Source: AA0mqf5m8Tdkw/V/7878uZeNONbQOA1jOBGUILfLlw4DyF/Sqij0f9DeA62dZkI4Bp0IdBkEaLy1/Q==
X-Received: by 2002:a05:6512:1316:b0:4a2:5be6:c0bf with SMTP id x22-20020a056512131600b004a25be6c0bfmr4425660lfu.390.1668418942174;
        Mon, 14 Nov 2022 01:42:22 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v2-20020ac25922000000b004946a1e045fsm1748963lfi.197.2022.11.14.01.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 01:42:21 -0800 (PST)
Message-ID: <1d0e04d6-a42b-e52e-68ed-0b00d0606e30@linaro.org>
Date:   Mon, 14 Nov 2022 10:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V4 1/2] dt-bindings: firmware: qcom-scm: Add optional
 interrupt
To:     Sibi Sankar <quic_sibis@quicinc.com>, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robimarko@gmail.com,
        quic_gurus@quicinc.com, quic_rjendra@quicinc.com
References: <20221114082644.28739-1-quic_sibis@quicinc.com>
 <20221114082644.28739-2-quic_sibis@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114082644.28739-2-quic_sibis@quicinc.com>
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

On 14/11/2022 09:26, Sibi Sankar wrote:
> From: Guru Das Srinagesh <quic_gurus@quicinc.com>
> 
> Add an interrupt specification to the bindings to support the wait-queue
> feature.
> 
> Signed-off-by: Guru Das Srinagesh <quic_gurus@quicinc.com>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

