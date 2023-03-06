Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5D56AB6EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 08:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjCFHXq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 02:23:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjCFHXp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 02:23:45 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4074229
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Mar 2023 23:23:44 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id ay14so30774364edb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Mar 2023 23:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678087423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2N94/1Xhj9qXMqUlQwDJnZPD8HeYu62iaiv4axEi5M=;
        b=wxZYj5ZluREcyXpkYMngM1M+FVNHyF9b2qDDwHZAksLIkbRU356L54OOkjfQZFAPNk
         0G/aN8pgPsm9LOlxaiE8qxtz757GjFQfNj2/dSVVYJUDe0Y+HPfuf2Qhb6s9a4QRXLDQ
         ghrLTBcQDzEtzSDDLluKpRF5ev2hZwtLXWyfBuIUqDPNSYxvl8CyH6PbrhqAWZ7X4DYD
         VDQh+6er/C5SooPri/an9dMvrhzqV5xmyBPCNsH15TaMis0Se/duiV0CiSwyn+EHYNea
         +mz7CECqPKE+uc2J4xlrY2o6GeROBloxbtEB7dihHVEvXGrC90ZSSK2F/amQrPAOXDBt
         DkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678087423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2N94/1Xhj9qXMqUlQwDJnZPD8HeYu62iaiv4axEi5M=;
        b=HdWaAr4m3Yi8w3xvvyg8i9m8rSeXdWoiLSs4qMoNS9jvJKSVSDKdl16cb46uTsFgp6
         QB8r97OgT2dnmQSgzywjQVnSTgqzS8UtGWAC1vVUgP3+73Iligh5iCaPk5en7UFQiOjD
         aGDND8KJf9YjKjA4cfAtFl6UUY41RBmzfAHCdyT2lWh4eR8DLYSWCJO4aJUNSkbXHxgo
         ytMKDPwdkwWhxL8Y506a2+t8AxDHNqYG1ah2NReHNKJt9JrNdVzsKVue+NGmiAVWTKgX
         DEQk3iLggSK2FqhmS0VsazYKGwjLS1G2ov28/kRO7dMAjOhk8nNczvK+kEIOvOd11nsQ
         2teQ==
X-Gm-Message-State: AO0yUKX72RCXSWEso7djnOHPLK4Lj0CA8JgOsJenxTJwNC52544E5lrG
        hPk07VdC3aHmMZ+wVKNszRivOA==
X-Google-Smtp-Source: AK7set8u9Z0/pdGLcufZ8CgMc7Urz+3WCAmLQuZz/uD6xSsgdOEWVLy45Y3+FgvuqbK6E2TjNXBstQ==
X-Received: by 2002:a17:906:edb3:b0:907:80e6:f8af with SMTP id sa19-20020a170906edb300b0090780e6f8afmr9663101ejb.67.1678087422823;
        Sun, 05 Mar 2023 23:23:42 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:d85d:5a4b:9830:fcfe? ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906c00700b008cff300cf47sm4138559ejz.72.2023.03.05.23.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 23:23:42 -0800 (PST)
Message-ID: <91061e39-024a-6a8a-9fa9-181bbf9d1dd2@linaro.org>
Date:   Mon, 6 Mar 2023 08:23:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/6] dt-bindings: mfd: qcom,tcsr: Add compatible for sdx65
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, lee@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mani@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        bhelgaas@google.com, manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <1678080302-29691-1-git-send-email-quic_rohiagar@quicinc.com>
 <1678080302-29691-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1678080302-29691-2-git-send-email-quic_rohiagar@quicinc.com>
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

On 06/03/2023 06:24, Rohit Agarwal wrote:
> Add the qcom,sdx65-tcsr compatible.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

