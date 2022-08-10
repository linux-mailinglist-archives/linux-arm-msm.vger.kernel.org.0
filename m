Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48F8458EEBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 16:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232799AbiHJOs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 10:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbiHJOs1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 10:48:27 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032957390D
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 07:48:26 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id v10so12850896ljh.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 07:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=HNShlj7tzx1hQcUnIHN5n05CFf+GUbbVjxhrLuy3zYU=;
        b=C57adzjE4mm48bZtyMNVcnlgkKqKbd1kEXs15BIKvCud3r0pQIH/KyPmzOk3Uit9Ud
         4rqqCTskV2iPFmljPLyBzyKq97VJNpr56igwSbDRPCsjIk+06LeVVk2qLX1NRsFmH8mc
         PlVjzUdmgX40OWN0R1EoW0CJ7XY+5Ku2oNaBsNHrJGUZMd97LoBJLA45oLwx5D4EaHdL
         Qomf1b0KW9rQNCypDgGCCBi5Y0nfby9hWmd9qcAREHLsPwcO8KqE24Ugn535RnlghzzF
         aEjG/8M2GnV2hbbYBR2r+EgH99zhdSX1CqDxo5/hkwfPS5pnD0oEUnBlSJ4etjqJqa9h
         /+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=HNShlj7tzx1hQcUnIHN5n05CFf+GUbbVjxhrLuy3zYU=;
        b=oqr8c0LKeZQbAYrhWTuUSerd5IafYW/K16Mzrr+zksw6mOsh/JdkAubBtoZM2CGBHf
         xsmCiTIJhqCfZk0Jd0mi2p5U4+Bz5a2ZwIy9hWv+m4G7GZodj/GmBIQs+ea7KQ9Tp1PP
         5dV+adnX2MSts1KokwyxecCbGFMokFZu0e+RaAiEYG0llILPhG9wBblBbs0m+1K0Wd/v
         iIXSvUnh6Q/uLloJ7mzW+2jNlzYuqKWkb0DT3XineyNrJXoN3mQG2baq7pp0+YGv/ceA
         u+M6TeNBfo0gk72Ea8462pS+TKM2p+PfjRoCj8rvneRdvJxI6flkKzY4qNha1Q+5trrn
         FOuQ==
X-Gm-Message-State: ACgBeo0xxsMJjnb+ldTg8nJajEhGyR53vfWSwffvDVLTzwxCBSyDtt2z
        MfhVuE64C4eyquKvUIPUpas1Ow==
X-Google-Smtp-Source: AA6agR5j2fIU0budtFLy//tUTBDqrjUq/+V2bMgZlNmrQBOxYzrFUSjv1JL+sAVn5xagbzrVZCDmmg==
X-Received: by 2002:a2e:b8d1:0:b0:25f:f4fb:357 with SMTP id s17-20020a2eb8d1000000b0025ff4fb0357mr2377539ljp.66.1660142904425;
        Wed, 10 Aug 2022 07:48:24 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id 7-20020ac25f47000000b0048b0ef93248sm370093lfz.62.2022.08.10.07.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 07:48:23 -0700 (PDT)
Message-ID: <86f8b129-d3b8-c0a7-ff89-372cc75ac897@linaro.org>
Date:   Wed, 10 Aug 2022 17:48:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: qcom,qmp: Add compatible for
 SC8280XP USB phys
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220810042303.3583194-1-bjorn.andersson@linaro.org>
 <20220810042303.3583194-2-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220810042303.3583194-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/08/2022 07:23, Bjorn Andersson wrote:
> The SC8280XP platform has a pair of 5nm USB3 UNI phys and a pair of
> 5nm USB4/3/DP combo PHYs, add a compatible for these.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
