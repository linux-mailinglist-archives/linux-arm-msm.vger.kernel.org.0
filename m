Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 368DC746BCB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 10:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjGDIZy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 04:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjGDIZx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 04:25:53 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4E39E5B
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 01:25:51 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51d9128494cso5013487a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 01:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688459150; x=1691051150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gwa9ayC7Ak6RXmEufOqadJR2qAcIK0aMmR7v8FlPPcg=;
        b=CRPRH2PyUYCZ1jK1Qc0h/9aUTyNGCI7F1DbFRKdNYEJzxiLghWmBvg2uQxeUayOqFP
         faWZ0F5v21L53zpq36yVs/pIuqDnnDVjIakPoMMtwPQbRUxUOqcrd6XKAQp8pp4xkGWa
         65onm1TjV2PwfEWnJbSi6tTnqFMCXzkFtgLjh+scy4eW3ZXS5ZnwKlwWrFtoqkwVlSSn
         tG6pZeLXUJ1ajbuUYW2VKt6l/XzX+PborZGxViE8jZZKVDS7eJBohEW+txOVmLAoFBnq
         djLy9h4thHI27b80+l+Zuuk3VK0dJlWt9Vd4kuMJhYlda1hCqf6OBNbYbZENs7zCMZIi
         NAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688459150; x=1691051150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gwa9ayC7Ak6RXmEufOqadJR2qAcIK0aMmR7v8FlPPcg=;
        b=MzLNch9CbxszMr61RVEsHocYqy4xz5zlMA4syLwR2E5msjRd/Wxi+67F2o9tUXYv5M
         KjVzkFGUiraNBXWkMghZGPSH85D89jINXdFnOpjlyM7Km7Znt3ASgxAO/vIAIYVjDdLI
         XqCtstp0IrXpOaWP9h+93YH3v4fMO93XGWTECU5tClzIO5OtPtBXoC8Of4Xpdz4R0ufU
         GX0KSVY1ghO1hbTvgGrMaaMy6C3QHdpP3PsWeIv3TW8QcOcDPGj2gYaWfCTTjSoxQNp9
         ENvpZ7I2NeYPxM+mC5QltcoyHucHisTDRYapLi2t2UcTYgRnOhGbYCKo04584zwVRSDZ
         6qzw==
X-Gm-Message-State: ABy/qLZzKDRJq21BUYUKHW3naeu7BeIM6ss2Sat18RY6pc1P7FHTRCAz
        xjCpOA7dxz2R6OEnV54GI9kYyUuNxewzzKYKEymSoQ==
X-Google-Smtp-Source: APBJJlHmgyzlsuarhw/Jt8z/t9Vhtcu+0imkXk0L/rtTWGMWw+BjO//QTPgqUJNNXVge1SpoIsgC8w==
X-Received: by 2002:a05:6402:4496:b0:51d:d41b:26a5 with SMTP id er22-20020a056402449600b0051dd41b26a5mr9166945edb.14.1688459150303;
        Tue, 04 Jul 2023 01:25:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t4-20020a05640203c400b0051ded17b30bsm5493120edw.40.2023.07.04.01.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 01:25:49 -0700 (PDT)
Message-ID: <05fde533-05df-a7c9-c36a-689e476f8c2e@linaro.org>
Date:   Tue, 4 Jul 2023 10:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/14] dt-bindings: display/msm/gmu: Add Adreno 7[34]0 GMU
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
 <20230628-topic-a7xx_drmmsm-v1-1-a7f4496e0c12@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-1-a7f4496e0c12@linaro.org>
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

On 28/06/2023 22:35, Konrad Dybcio wrote:
> The GMU on the A7xx series is pretty much the same as on the A6xx parts.
> It's now "smarter", needs a bit less register writes and controls more
> things (like inter-frame power collapse) mostly internally (instead of
> us having to write to G[PM]U_[CG]X registers from APPS)
> 
> The only difference worth mentioning is the now-required DEMET clock,
> which is strictly required for things like asserting reset lines, not
> turning it on results in GMU not being fully functional (all OOB requests
> would fail and HFI would hang after the first submitted OOB).
> 
> Describe the A730 and A740 GMU.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

