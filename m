Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDCB669E4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 17:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjAMQiw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 11:38:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbjAMQib (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 11:38:31 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0A57D254
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:35:40 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id j16so31870189edw.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 08:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j+i5YU1JrTXRnDcI+3MtGP5JXCVMjZlHjuJt57lEasY=;
        b=hTYNHQ3kVgma7efrxWhS0jCG4N/WaAWX360BUOmAkkbuyrAJSmJnKbv9j6eekdpubS
         awGnoV7CxiLNlgaFk6P8IDtxENoZ/QL6sr6mVcfk8eCAnr8a0vngNAgtUJyEyIQBQCvE
         QCVH/TfPdKSqM2V/RLZvWjqABe8c9Zgx67JiOIHH0Fci39DEQhb+k+DopL1cuk3ZQNtC
         kmhS3rpsS3+/3eDvlkTobH8TmZIDYD5p9ChcQOrgWc7i+c5R7Ag1kjI5NN7LM9l5leFq
         B+WTOwYqyff87WOmemM5VstAEytH1VZS02e9bUI4DiX4YuMtD/NYR1XgxYbb+HzXyMYt
         8CBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+i5YU1JrTXRnDcI+3MtGP5JXCVMjZlHjuJt57lEasY=;
        b=533U86LMxyOkpV7hGyYBXpIaTxAUKL3HDiNlJRSYcd43U9yMSdzvICStynEIImvFf+
         tVfKVf9/TTWBkS6/glQczdEKFKaZR8QHfTszv6bCsGGqjI0iWFapWLIALrz0mqg+yaAp
         v3o8DC2S2HR8xoBV6pRxk2IQBTrESdaz8BiwH0L4n75nyVILh+XGBKMdJoste2QDxRsF
         bWyAT8zcqB69S9PS4qwhLe2RmLU1a43b2QJPLv3Kv8jH/R6Ed7Jd71FdDzDB6qINIOwo
         azy38kZjPt8s7sczl+MrBwGQ9jP0/KCmBKHt8R+vdO+HBEA4b2xe73xbdhmU550byfpm
         iI9g==
X-Gm-Message-State: AFqh2kohBTu1zRnsgnoCbRiJnwksfSZ0iM5l0kjkHtPX5MZ3sVrLjR1M
        rXGcwoJCaCbTszE4lknhfLRbGQ==
X-Google-Smtp-Source: AMrXdXvjyqT9/V9pwWK1lgdBBUpd5OgsR8LKuFm0wtI0SNnmsfAhSWd/dQhOl9f5KkuCEBQaT1KwxA==
X-Received: by 2002:a05:6402:3818:b0:49c:1fe4:9efc with SMTP id es24-20020a056402381800b0049c1fe49efcmr3137324edb.40.1673627738757;
        Fri, 13 Jan 2023 08:35:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id el14-20020a056402360e00b00458b41d9460sm8045410edb.92.2023.01.13.08.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 08:35:38 -0800 (PST)
Message-ID: <8a305883-7f7f-2f2d-a7a1-8c2a6b5e72fd@linaro.org>
Date:   Fri, 13 Jan 2023 17:35:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] dt-bindings: scm: Add compatible for IPQ9574
Content-Language: en-US
To:     Poovendhan Selvaraj <quic_poovendh@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, robimarko@gmail.com, quic_gurus@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_devipriy@quicinc.com
References: <20230113160012.14893-1-quic_poovendh@quicinc.com>
 <20230113160012.14893-2-quic_poovendh@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113160012.14893-2-quic_poovendh@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/01/2023 17:00, Poovendhan Selvaraj wrote:
> Add the scm compatible string for IPQ9574 SoC
> 
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Co-developed-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>

Three people were co-developing single compatible line? I have some
doubts... Please include only real entries.

Anyway you miss changes to allOf (and/or rebasing on
https://lore.kernel.org/all/20221122092345.44369-2-krzysztof.kozlowski@linaro.org/
)


Best regards,
Krzysztof

