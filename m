Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 952C464F8B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 11:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbiLQKfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 05:35:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiLQKft (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 05:35:49 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920E7140B6
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 02:35:48 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id h10so4540454ljk.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 02:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6cxt7pOx+yjxHzIOKE7PvpAXZf8eYOMSoAnUrzpOMQ=;
        b=QVghawtwgSpMfGtDoJXbg4K54IkutqOBAireTIcsWaEndSA5KZfMYzE1EvFXTPaOVD
         elsXbMkXzVUei2RGqNXJvYoU6OyIX/T1tw5qcc43dcsvm3qzxLYMxeCHGi4rAAVcWY+0
         UZD/QIkBCraE8YuaNUN0Zrn5hOOndOR2sQCcjiGo2Pa5062IQQkiDpzcy4izeE/8ntH0
         ZrdyqXxQoyVsaF2AFnEp6WnKkQmdP4Va/t0pEcboRLzEpCK1xjnXsp/i4eSn8MQrxyes
         XdyqSKccLFSPVl3Ubw1N15lZ/DHTkqlmCCfvAVF8EB1/MTqBMB6jmhFppiz/46WShddI
         V7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6cxt7pOx+yjxHzIOKE7PvpAXZf8eYOMSoAnUrzpOMQ=;
        b=AfHN1OsSCjIxCUi2JpWLDNsUlaxLz7g/k3IR3dtx9I5cFF3nDV1NMfs64aDfgxz11L
         pRkX28A37VXJBMdjoCwmF4+D0upd5qV7TkLvEr7tYyBob50Umn3FKCSHwWgiap4+7d3D
         mAEfp6xAA7iGIGKYBiv6e/pvtp0Wvc8iJBF1tFC1cDwjjo6JUihdlaKB99Dvxi9Pm22o
         3mCn38brvw1l+PZb20369SsCyomp6xEBUJtxtWkqytS8XMAIXVHVMCS9SguEDP86awg+
         KDiqEnfj87nR9b6pa2QQ9HV95PxaPZRTHCCmPu+P7zAtSlR+BI0vHLExSmKZ/KN+adjc
         9k4Q==
X-Gm-Message-State: ANoB5pmAs33eaPWEL62ZRWA9YC4gxUcm08Hqnlk1lLKesIgv5RdEJIMI
        ldSjwdeHAkmOtyhIxSFNgH9xpQ==
X-Google-Smtp-Source: AA0mqf6uxVSOy/0yIlItmN5uwMQTq8ElvVOsqcpLuKp1rU11/Oj6kweZpcWkl7PH49csb1C+Vn6FWQ==
X-Received: by 2002:a05:651c:1592:b0:277:8a76:90a4 with SMTP id h18-20020a05651c159200b002778a7690a4mr10873604ljq.0.1671273346754;
        Sat, 17 Dec 2022 02:35:46 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651c118c00b00279e41de7e6sm302760ljo.3.2022.12.17.02.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 02:35:46 -0800 (PST)
Message-ID: <9c56b7b0-b22b-b90c-a67a-5fa23825b166@linaro.org>
Date:   Sat, 17 Dec 2022 11:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5] dt-bindings: firmware: scm: Add QDU1000/QRU1000
 compatible
Content-Language: en-US
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc:     "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20221216231312.22574-1-quic_molvera@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216231312.22574-1-quic_molvera@quicinc.com>
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

On 17/12/2022 00:13, Melody Olvera wrote:
> Add compatible for scm driver for QDU1000 and QRU1000 platforms. These
> drivers only require the compatible field, so update the bindings
> accordingly for these platforms.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
> This patch is separated out from [1] and includes
> changes addressing comments from that patch set.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

