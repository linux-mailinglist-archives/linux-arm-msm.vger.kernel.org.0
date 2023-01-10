Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F21FC6641D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 14:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238385AbjAJN3m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 08:29:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjAJN3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 08:29:40 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F7F3B3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 05:29:39 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id t5so7333174wrq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 05:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tk4ngejoateTOnuRvuEbZaowxEstl1Mpo6A89AJMiP4=;
        b=UT/elzAIsCF6Nf/bHS3Igb/5WnLu1BNKrS+zRE6zVnSagHAAKSUlquO5ALKSOfdUzI
         L8/0pODUMjEgYAd44wZ5XDpEBDNgNE03QWnrzGAQcQ/CAmov3MsiS3KfnnDSPGAxdLFq
         Oe1vM1mgN5sGsMsj4ONmDFrF0f3WGzNMcnEgzlH1Q3xrfytSzf9iX/lr2Q7IJkUtO7DU
         ZyeWuFLodK5jio/TKuq4Nu90bXWOoJ7jTtKwV9DVJKz4EwaR3hWBMNViX05K3QNIcPQy
         IT4emey/0akvvg+iYXNaK826XqDbDMCAryYfLXSaqZ8/ZaBOu7QR0ohaAfZqvo0vMCJV
         Py9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tk4ngejoateTOnuRvuEbZaowxEstl1Mpo6A89AJMiP4=;
        b=FVaThpPvSzhIeo3bAMln5ICHBHCzRgVCBh9TXaQGjYUGE2Vqne4wETZ3eZ9gteucr/
         kKm6fWhwvF9Nsx22soI3Zv1BwPmSjDpOKjXt8IcIZmE4pnxEgAoySSXRI5vzARPo4bQi
         9v0zBM0E+Ku6kv694YaVfhc/LHiH9B+MY6eV3zqKwKisci7/bFhTIwyXfhLlxlG3/uCM
         HpwiI8XilwA3tL8zvOyauOkISZe3mzBW7Vz2qSSZ4tlr6Xw1tIIEomwCTyXOg42qO39M
         mQTb6DEeSaeuwGXpzhRJ2Hh9QEHtANlSVe2+uM3hO5EzJ6VRT3IZLtfnKVNuuoTPwZg2
         Z+6g==
X-Gm-Message-State: AFqh2koq9oicrBSivPO1s64kP2UMm4LApOvpS7ZzCztDB4XHWMey1kdX
        mDZ5qmBEucVA5kxMul2AWKM36g==
X-Google-Smtp-Source: AMrXdXve7gJlNkmy3N9h3WlImuuYFTrNoWz1rN1hGwiWIFHPVweWebtb5wlP/OLlvUBb5uE/CouA0A==
X-Received: by 2002:a5d:4304:0:b0:2a1:328f:23aa with SMTP id h4-20020a5d4304000000b002a1328f23aamr14647892wrq.6.1673357377847;
        Tue, 10 Jan 2023 05:29:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6686000000b002bb3229a03csm10166325wru.34.2023.01.10.05.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 05:29:37 -0800 (PST)
Message-ID: <9ede1521-1f2f-90ae-73a3-d81a926fe8b3@linaro.org>
Date:   Tue, 10 Jan 2023 14:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V1 0/1] soc: qcom: dcc: Add QAD, Cti-trigger and
 Bootconfig support for Data Capture and Compare(DCC)
Content-Language: en-US
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alex Elder <elder@ieee.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>, vkoul@kernel.org
References: <cover.1673270769.git.quic_schowdhu@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cover.1673270769.git.quic_schowdhu@quicinc.com>
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

On 09/01/2023 15:02, Souradeep Chowdhury wrote:
> This patch adds the Bootconfig, QAD and CTI-Trigger support for DCC.
> 


(...)

> Souradeep Chowdhury (1):
>   soc: qcom: dcc: Add QAD, Ctitrigger and Bootconfig support for DCC
> 
>  Documentation/ABI/testing/debugfs-driver-dcc |  24 +++
>  drivers/soc/qcom/dcc.c                       | 284 ++++++++++++++++++++++++++-

No need to send the patch to unrelated people. Be sure to rebase it on
latest kernel and then use scripts/get_maintainers.pl to get folks and
lists necessary to CC.

Unless your code adds here DT properties, but then you miss bindings, so
would have to be fixed.

Best regards,
Krzysztof

