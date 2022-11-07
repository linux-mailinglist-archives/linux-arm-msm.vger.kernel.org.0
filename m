Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3BC61F0AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 11:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbiKGKcR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 05:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231901AbiKGKb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 05:31:57 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E148D15A23
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 02:31:56 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id p8so16082789lfu.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 02:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2KjXpbYDjWuB8Bvq0F/itLLQSxvTUuilJ2G47EDrJs=;
        b=WpdmloYf4T0MEnJl8mxhlPJ3EHcwSi97TejgPtT7wNeH+S6hDeHskkvswovRO2sWXY
         b0Liy9qHgNntrCrjjeFyLeB4KWRIQw0LNnNColDQswCl2U2jeQ9plarIyOT6JIWxcc7j
         tt8pB1PSq6m3L0WLfz3ik1rGkf4DQ3VkwggkFqZ9XBIVutOno5ON7T5KJ3vSulht1aqH
         jGC3sguMP0E+2XDNF1anbB/RJYkGLJiCO3fvhNduhbKQ1PeNOnWDbrPsnSRfrNbABal5
         NWDM+nGSFhcd2PoWBVUEZhA7H3V+W/9slfR/gVHp9iFuf6/8H82ZRf6b6AxOecaB7Jkl
         omFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2KjXpbYDjWuB8Bvq0F/itLLQSxvTUuilJ2G47EDrJs=;
        b=wIleNaGFrRvhEVDT15gAcvo8vXL2QhlMkJ8mCYwPuZJ5q4PbE1dPbKzwXF60McmkQ/
         8qEavqvtaJc2hYrp8XYVNAVzL5gsBCpVtBFAcLOou5XUwO6rOIZG2vXPlwvv/gSkHAm1
         3HJuUVgNPoEMqwWUxNpPcLgdx60LCGyBuUU/pv5P9/ef1WZYprg1MWOQsojqjc9ar5kV
         JLvMit98Ae6Ar+knU1FV/ZHGe7GWN6P6tjR0T3xAE0YT1PYPcflUNtpKWtnJ2cvl/79t
         Irysoo0l1h21s+nXlDkogRU7W8e20J6lGwSC9ieaMGaCeHBIAJTM1vGzB2yfMSAhUnPA
         wcfg==
X-Gm-Message-State: ACrzQf1J4Pb71v0KMOUQmMtm6s9YDxGkFH9/AgO8SCECy4WQhw+eoJSm
        0eg6P3KrJZUFOmO7qL66ts1qeA==
X-Google-Smtp-Source: AMsMyM7ZqJN+I5JBYuzDOtZ4QzxGlANcrKIfFK12izToLp9QEfnvQB7539DMUkmL3AGpiuFy7PwPpA==
X-Received: by 2002:a19:7718:0:b0:4b1:3625:4c96 with SMTP id s24-20020a197718000000b004b136254c96mr9598757lfc.439.1667817115320;
        Mon, 07 Nov 2022 02:31:55 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id a7-20020a056512200700b004949f7cbb6esm1179391lfb.79.2022.11.07.02.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:31:54 -0800 (PST)
Message-ID: <cae429e1-753b-f7db-ca5a-1f485e0c9f2e@linaro.org>
Date:   Mon, 7 Nov 2022 11:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] arm64: dts: qcom: hk01: use GPIO flags for tlmm
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221107092930.33325-1-robimarko@gmail.com>
 <20221107092930.33325-3-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107092930.33325-3-robimarko@gmail.com>
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

On 07/11/2022 10:29, Robert Marko wrote:
> Use respective GPIO_ACTIVE_LOW/HIGH flags for tlmm GPIOs instead of
> harcoding the cell value.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

