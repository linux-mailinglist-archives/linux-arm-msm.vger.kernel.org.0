Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC9168B914
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 10:54:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjBFJyO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 04:54:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjBFJyF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 04:54:05 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417821E5E0
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 01:53:37 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id dr8so32436574ejc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 01:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTkg/roRzmemX7G/uhR5oNJshKVw19d8+958sf+qu08=;
        b=cNAyomhu29cvsFdp1c1BLu99BG4ms6a+ALKVkKPd6cLOgg5KzgHZpOtYSAaamE1QjJ
         Izyq3rQ5ptB/st0tOJaQgWITai3pGEtBAPvPR6yiy69Cj4BwVTpQdRu7TP9ujVEBo4tW
         VrsRpxxBRyKfEHspYemj7PgmOkRvCnhojrDLrlLEJ9Arm6avYW6m+GiqKj3Gw8zSuITB
         mdW0wAxWhm3VJPZl0GRsJ7ANFpx5C6U0CeqsifQvdLuRTMLByacEFgBzNy+JBcAFna7c
         m10xJGdVnaeX63ykFzZpoYPdOo9KA6Xq+v3KfIdzcSangQwgLbjBynvPGIrEjEhOCLQc
         awlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTkg/roRzmemX7G/uhR5oNJshKVw19d8+958sf+qu08=;
        b=L2AGbdGsz5wRLWMoC6WNKe1btI+KSPDcN6q6sLLeGIbxWjI4rEVAelHqMQCwIsLABN
         fmXi4KT4ExK11u6Z2KiL3q9mQhH1WKvS738IK3ROvy0vK/KZ+7rTvHPOqiYEZG6Rdm4O
         qhIe0p8xhwl0U73BdyDTbHwg6wV8kN+t4uOjl9n0p9JeH8pFguXeizrPpaQ9dYL6pCIR
         ELI+UkDEn2EmgceWNr0fkilnUI1Tj3DKgdZDOJVBntkD0Lk7LdWeSJr4TY1FipxfEeXs
         EYJ119eFS65CCWjdD0ndyKCG2HgfQoMKtbqYOMyo1hn5bjl9n4kKm5eVGdZATO9xnOQI
         B2yw==
X-Gm-Message-State: AO0yUKXUNLUEP7smcJklubONHl0ZRMD5M27zR5V1HMH91NvV+/Qzwhoq
        dS0OLDXjGM2RS+9jl/IPW6PDCg==
X-Google-Smtp-Source: AK7set+LWCTeqVcNiglLes9BbOrRFWkTL9xZx0MTB31XgVQs2Oun2YOF09yCFMSf2sSmv/EF9D3ZiA==
X-Received: by 2002:a17:906:1810:b0:878:78f9:d1be with SMTP id v16-20020a170906181000b0087878f9d1bemr17568425eje.23.1675677214231;
        Mon, 06 Feb 2023 01:53:34 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id gh25-20020a170906e09900b008841aa86484sm5275095ejb.211.2023.02.06.01.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 01:53:33 -0800 (PST)
Message-ID: <61a3d352-ca1d-588f-c30e-b01f313f78b8@linaro.org>
Date:   Mon, 6 Feb 2023 11:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V3 9/9] arm64: defconfig: Enable IPQ5332 SoC base configs
Content-Language: en-GB
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        krzysztof.kozlowski@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        arnd@arndb.de, marcel.ziswiler@toradex.com,
        nfraprado@collabora.com, robimarko@gmail.com,
        quic_gurus@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20230206071217.29313-1-quic_kathirav@quicinc.com>
 <20230206071217.29313-10-quic_kathirav@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206071217.29313-10-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/02/2023 09:12, Kathiravan T wrote:
> Enable the clock and pinctrl configs for Qualcomm IPQ5332 SoC
> 
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

