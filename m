Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBA337218EF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 19:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbjFDR5k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 13:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjFDR5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 13:57:39 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36E8DE
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 10:57:38 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-977c89c47bdso227754366b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 10:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685901457; x=1688493457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ls45VQQIUyzoH7noNjdXrCaXMXOXQFDg/zHramtLqdM=;
        b=PvmReiyAK7QRh5JN2sHHbdpCwbBfOriS3FNHDYsIkTUaaqQ/L8+FihSC4I2Wz5VIjm
         McYw/UsoCBp8WiMimkT7v+mK/I7Whr0XS7PwrqsSZvRQfv6iNkEvfWmLvCfHCCSiPLP+
         Qlb04qpALQJlQ1XY0y416zyf6SNFc21DjT73r9fSNULXwApEWk+gqsgZrEHlLY50VRvI
         FSsZHJmjSA6oxiTtv0ezbmj3MMIFO8p3PQysQX9paW6TlY+JVR0rCRd6tj9W/kPvkcSI
         gt1ZSAj+4jHMlrgIcXzL8EkZZu5ANo7IuK4VNpzWz+bsH/GXiTQubRMRUiB13kuoSYIl
         WXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685901457; x=1688493457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ls45VQQIUyzoH7noNjdXrCaXMXOXQFDg/zHramtLqdM=;
        b=FHdID+qbiOnh+C4fRiwaHdwEvpyZuRr7Syd2NXOnC/NO+E00fZ+LADcRmWy6YHcSeQ
         GoWkqUbuaNKd6JlIPCQOMa078i/tPdPisjITYwxt/l/bot2ZtV+P9gJC9D+1aOp/ZThv
         DSwGuAYHq/N9OlJH9bE+BpGS/PFArU2zcaCkdqTpRrWyN+N41LAbI8uJK+XXCV0MV6R/
         xscWJEspLuM9S/kgyN0DMXoSg6pv+66TmFhx7J2HWUObS3STdErL6v8Xkuz1xGJoj4Th
         2svmTgI6L+7qXkhi/WezOkIhDKOtei0GONx/a3k0n32R3moKECWtrPdet2aAEWsbOy0E
         s9Qg==
X-Gm-Message-State: AC+VfDz/9vpo1SoZuIkfsDNOL2WCFPO18FKeOnfV1BHa7qFWdeW92h0f
        LsZFR8S/Mr3JUNShRAaiynSYtQ==
X-Google-Smtp-Source: ACHHUZ7ZTbEOAIM4tY91C54D0FYjxaN4oqFmOFXsAHhex4sytDP6QvuKaoBFbxk10faqOQdXZp6Xaw==
X-Received: by 2002:a17:906:fe45:b0:96f:f046:9a92 with SMTP id wz5-20020a170906fe4500b0096ff0469a92mr4579876ejb.37.1685901457150;
        Sun, 04 Jun 2023 10:57:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id bj21-20020a170906b05500b009661484e84esm3294252ejb.191.2023.06.04.10.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 10:57:36 -0700 (PDT)
Message-ID: <f33106d5-ea0c-131c-f615-a8df4da58990@linaro.org>
Date:   Sun, 4 Jun 2023 19:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 03/12] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6350 and SM6375
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
 <20230411-topic-straitlagoon_mdss-v5-3-998b4d2f7dd1@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-3-998b4d2f7dd1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/05/2023 09:46, Konrad Dybcio wrote:
> SC7180, SM6350 and SM6375 use a rather similar hw setup for DPU, with
> the main exception being that the last one requires an additional
> throttle clock.
> 
> It is not well understood yet, but failing to toggle it on makes the
> display hardware stall and not output any frames.
> 
> Document SM6350 and SM6375 DPU.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

