Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A96775F287
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 12:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjGXKQW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 06:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233239AbjGXKQG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 06:16:06 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2DA4C12
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 03:08:31 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-992f15c36fcso735592666b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 03:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690193308; x=1690798108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qH1xPhg/Am+ZrA/6voevZTtm38nK8XnjsWRckc1S8Y0=;
        b=ZTiiSaU1IaI2SrroOHb6gFEVIV9ivSr06C1uBf9H1PBMO9LNpv1ux0Q/XRnV9sZ5YC
         rHxsetQKF90XRjVx6km//LViHpIbPIoaj9TkAJKW07E/4kq6VNUs0vuYW2o6ZzIp64kI
         j5jQJLtqFYsZOzIPuDURdbsz7exYWHuoM0Xwpe20Jz8mc7+1nVfEIBUCa0tuQNoHX5cj
         Zcr1m84q0nOfrEnQ6E0mn/GVv6v3t2g6l7/Lpq3aMFtQTuwpreVTrzC2RbZ4yzLD7Smb
         iO0xWcYlMseXh+gi+BfShcA5PKaO3UaAqjCm0QL+j9FRdOtuZPXEOcqm02KSmacjinWI
         9NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690193308; x=1690798108;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qH1xPhg/Am+ZrA/6voevZTtm38nK8XnjsWRckc1S8Y0=;
        b=KKwAZ4rh6lyJy/Ak3GHqdB2BMDhOm7ttd3YJVP0u2B0y7i04foaH/cwpXDLuU0rb4e
         Xh/iJRtZYEjsQvGxO87eROtNYGETARDGgsPyS/PkRCjeNs1EuoHHZ1jUXyQxjinKX/Sn
         MdrZQfrsdnn4uOld0yugAOUaBGgWa3fXVr1PK8TBQvXFEFpdhiNHaJx1GQCEn5KadKrj
         6OGS/D2Zb+etoUjJ4robAbzt8ORN6+cP8xcU5LWox8o+cZP+RR+4zHzrQ8V7uaGZ5uKo
         bD5Le5dYEE3k2A/hKdiWaVfaHZqnfuXmwgEnc5t5r14pXPpVHRiXpH8PyF09mWgsLkIH
         5fWw==
X-Gm-Message-State: ABy/qLYuXai8cpCt1/TF/K1iaxqsVMWi94BfexSKhyz/BWKaI5e6hVKw
        G3VwkG4rHV7uo4Ywrj7H6aT/FHQm3IBja996v23tnw==
X-Google-Smtp-Source: APBJJlGV4XG1oZ6mf5FuCv97rwX7+atN757Oexd4FcjKk5uHoW5XYBMwCJwhh9zXKY+U05Om/FOqtw==
X-Received: by 2002:a17:906:5a4c:b0:992:345e:831b with SMTP id my12-20020a1709065a4c00b00992345e831bmr10299061ejc.50.1690192279269;
        Mon, 24 Jul 2023 02:51:19 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id v19-20020a170906489300b0098e2eaec394sm6486372ejq.101.2023.07.24.02.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 02:51:18 -0700 (PDT)
Message-ID: <488769bd-8373-5f53-204a-3739f104cd99@linaro.org>
Date:   Mon, 24 Jul 2023 11:51:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/6] dt-bindings: cache: qcom,llcc: Add LLCC compatible
 for QDU1000/QRU1000
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230724084155.8682-1-quic_kbajaj@quicinc.com>
 <20230724084155.8682-2-quic_kbajaj@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230724084155.8682-2-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2023 10:41, Komal Bajaj wrote:
> Add LLCC compatible for QDU1000/QRU1000 SoCs and add optional
> nvmem-cells and nvmem-cell-names properties to support multiple
> configurations for multi channel DDR.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

