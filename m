Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80385B6C06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 12:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbiIMK4n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 06:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbiIMK4m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 06:56:42 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C645F104
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 03:56:40 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso9225973wmr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 03:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=S/DDh4Dc4NwKbIspCCOFeZLSTNJTP49Y+3Pko2NGQsI=;
        b=RjZYdegDG1Eper+2N2K/QB6WEnHlsT/EOJ5/CYgMqvX/vAdQxoSpZ767A+c8cSjTZZ
         7a1VkRmK2P2BsFL1E9iQ7LQGibfHI5jD0IJYOxBgb3Kci3dEWQCLnSSbMgsEvad1HsBF
         y7nlpmJ2Lm+F58BUulFDhhLAUelmQnlmmNAnXmK3DhIqqwRrW8/rmNEC/qnXwW3n/KBu
         oqdJyOv1szzTrcAn6n9lH5F1/fhMjowOXjGMc+YdaJ3aicmdTauFUaz5tbxbygPsFqMi
         iW7tezfQxRuK3dpV6VIppQ+oG2jSUe+Yl2Ki31/zstQR7aWThCJi3e5rvRsAy+UWQ+/b
         fsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=S/DDh4Dc4NwKbIspCCOFeZLSTNJTP49Y+3Pko2NGQsI=;
        b=45JJuUbP3fdRdEqEu8H//aj1QwjMXF7c9E9FeRUVLsfG0pldT88+VXAqLPNkmuU4CG
         v/RaEB6oDLx7NXZ5fXiiS5m+ILsw8ngVntjwf2YC0Fxwma5ftCCdeaekPAk2Z3BjIyt5
         cCd9gZEVQdTR4m0z7T3di5VH09Dyi4PCr1i3v3zRuavm+M8K+wBcmFOeewj3fLsPiDA7
         Eevya5NJ4Q2Rc4syBPDTHxYxgaVecf3Qze0y93kkEyoodIVhT6OqYptSpBrO6Wr+ZW5L
         0x1ud0nL8hAwRNsFsX9Oub12h2vevcL7GUCnz5OjrQmhzn+MO13bY8ESFRBMfw8vxVMX
         +z0w==
X-Gm-Message-State: ACgBeo2ryU3aIfsYPMq1pP5AP4dxFx7QCHUrljMR2wNT82f1dm/KV9qZ
        nw1jfdSmSb4msoSGDePy6Gz5MQ==
X-Google-Smtp-Source: AA6agR4Aq9H8Q+MOOVu+M1poly4g+vo6TAxHNZjrt3t0xRJtJmP20cPpB/mMfqXgX7aHUWQc6IHRjA==
X-Received: by 2002:a05:600c:3b1b:b0:3b4:92fd:559a with SMTP id m27-20020a05600c3b1b00b003b492fd559amr1930831wms.69.1663066599193;
        Tue, 13 Sep 2022 03:56:39 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.70])
        by smtp.gmail.com with ESMTPSA id k4-20020a5d4284000000b002286670bafasm10238117wrq.48.2022.09.13.03.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 03:56:38 -0700 (PDT)
Message-ID: <7146d3f6-1bea-bfe4-c5c6-88be45ffa10e@linaro.org>
Date:   Tue, 13 Sep 2022 12:56:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/4] pinctrl: qcom: spmi-gpio: Fix the GPIO strength
 mapping
Content-Language: en-US
To:     Anjelique Melendez <quic_amelende@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_jprakash@quicinc.com
References: <20220912210624.4527-1-quic_amelende@quicinc.com>
 <20220912210624.4527-3-quic_amelende@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220912210624.4527-3-quic_amelende@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/09/2022 23:06, Anjelique Melendez wrote:
> The SPMI based PMICs have the HIGH and LOW GPIO output strength mappings
> interchanged, fix them.

This looks like a fix, so should have Fixes tag and Cc-stable.

Code looks good, thanks.

> 
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---
Best regards,
Krzysztof
