Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDC863A343
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Nov 2022 09:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbiK1Ikq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 03:40:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbiK1Iko (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 03:40:44 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CAEC17A94
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 00:40:36 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j16so16192070lfe.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 00:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NT5n4PWr0MoKZ+W7e/CnXrYaYWD8yksdvO5HBo9+w+c=;
        b=T1hyooHLRNRp/uwq07Iqz6ddP5xGghoOwv3ZQK24KU+J5TtuEeFdvR43Rg2LIDXGZu
         TO2DTD+w3P7WJteaTiGYzvhUUeHaaUTO1qeJgqmvuGwlsulCbLJAxDoaBbK8hplu5crU
         3Pp3gT6XEYAkpusMBcRlCM/SpnHtB8+LEcVAGnfBNdpHm3tHAH8ziJ3GcbtYijt+CNh4
         8ahsUAu+dBut9LF0fW6eO00Ie3NLLkTzDQ3vYC1Jk/mAxv4RBWmDEYlI6Ay2uvPSfpnm
         KCE9Jf6YI5W91eJ22O+9JPmi+Q9TYl6A1T9R+S42y0uBl9av7boBFODyFWZRpmz4KaMr
         sxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NT5n4PWr0MoKZ+W7e/CnXrYaYWD8yksdvO5HBo9+w+c=;
        b=JU44elWuyLLzIV1VplxpNHbVW3mrjG2cmE62lEwzWlvl/DGgfQ/K1D27x7kbE8W8u6
         6md5xNf+TZ7inc9BgN5EdhxRPsVTBk7DYAc6R1yzZYtJzXO6D2ZekfmDvsaLzcuB/TeA
         pp57QMtUjpioOYe4Nfo1Wteg8WmrAP/CabOmsP6vr2Fnv2OZwcTpsoB5BVshOSENZtde
         FvFAYbgkoGVZMDVII9kRe8MaNpB/LaIB5m9GyTkyGEY4srAV/R/vp3oOe118GqdikJTU
         YKZ9Wwf1Qq6GyhlOaFC5+s9aLp7ONT/LZy+EPkWjuZfkIlRWv6C3AQ8lFOYogxdXXJqS
         O/dQ==
X-Gm-Message-State: ANoB5plvmvtEcvhx7JCtBp/XAjdBitK+lNIrplSH5ZldfpUGUZ7/F4Hr
        Oq3NUnaJemwc0xcti2E0NVDDrA==
X-Google-Smtp-Source: AA0mqf4LwcPkyyNRLeEgjR8nqFpVVF/Wc6JWGQngl/W5gyVVtjd4nnTsKRXTf+AW4sQHI1z4oBseMg==
X-Received: by 2002:a05:6512:33d0:b0:4a2:2af6:98e5 with SMTP id d16-20020a05651233d000b004a22af698e5mr16354539lfg.5.1669624834596;
        Mon, 28 Nov 2022 00:40:34 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t14-20020a05651c204e00b002778a76a3c3sm1151126ljo.112.2022.11.28.00.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 00:40:34 -0800 (PST)
Message-ID: <d294edf4-9df3-5958-5a12-0f93bc74f28f@linaro.org>
Date:   Mon, 28 Nov 2022 09:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom: Add SM4250 APCS
 compatible
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        jassisinghbrar@gmail.com, devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20221127195418.1506876-1-bhupesh.sharma@linaro.org>
 <20221127195418.1506876-2-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127195418.1506876-2-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/11/2022 20:54, Bhupesh Sharma wrote:
> Add compatible for the Qualcomm SM4250 APCS block.
> 
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>

There is no need to store the regular CC list (coming from automated
output - get_maintainer.pl) in the Git history. Store it under ---.

> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

