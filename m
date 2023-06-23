Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 391A073BCBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 18:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbjFWQiF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 12:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbjFWQh6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 12:37:58 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E44B295C
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 09:37:46 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b479d53d48so15136921fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 09:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687538264; x=1690130264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6MuRgTADfsjk5ngIJikXnjsh+r7qvX+XW3TpvSj9IMo=;
        b=ueh6ohbOaiJXLaCpta4sCjf945kgj2zxI2OBTEPreBQocjs0ZqqCqWPEMoeRGCVYDS
         ZFF36ygF4Irg+5hmAbVeS4x0OnAiYfIVQpX37oPGyDh3+7qWIMJ+yhZg4UspnJdi+QZA
         /h5wBfXrSTXgue8k+0rN/H+/6cov3/2oA9wVJuJsjigJh6yC3IYwxZApXpv4Jox7a3tx
         7p/87/i6Pg5fg2rvlIPKeKlUB9hSh2olXYQBvV6gjCxhjiCnAPvS+gMYXCQNrrIzili2
         04ZjChbH2Hb3KumxPBjMsch6nyxTNVAjlZPuuCnmOJxHg+WpZw2IJNAmliaJu2sI3+xL
         fMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687538264; x=1690130264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6MuRgTADfsjk5ngIJikXnjsh+r7qvX+XW3TpvSj9IMo=;
        b=IOGVdAKe7Gwhkigk/qwf+ZIxWACsoRdV90UISxDI/wxIivor3BungXDf9qw53PODS9
         Si6uO1a7+UnVbLhI7kbVSCaEtMj9IzZ7qRw7SWRHZT3Dmfs7lj1faSL2LICH37b2Xtxo
         Tsp2yM6+i6H7N6G4EBnyBCvWL5andOcRd0VI2BzcEJNR3ZYA4ghUZcm3lFqmvbxD4u3r
         i3LaUx1z91pLfqhvL8SGDmzyPHLC/IP5kGQpolnSzu42Iq8SRCyKhx2wWqrl6xH37U2c
         SRRiOjKiu2IffT5o4fjjWx9vnkzFoQibhrtfAQXtzQ8pYwP0YiV04iQE3jeme13oU8lR
         NoYg==
X-Gm-Message-State: AC+VfDzLbl34pjJdbjU7mgdqFwq4tbD9Qlh3nA4qTlbF3xv+wotSRUGi
        RmWQcXmhqDCRd4bJ1laaULMPCA==
X-Google-Smtp-Source: ACHHUZ4m8Kj4+d93jQ/SETkZNyuSLQpkF0VNcHY6l2Wb7pD40+ISVuCcRVlIVUe8Ayo4r6E6xzo4YA==
X-Received: by 2002:a19:e003:0:b0:4f8:5886:1868 with SMTP id x3-20020a19e003000000b004f858861868mr7647259lfg.24.1687538264454;
        Fri, 23 Jun 2023 09:37:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id qw9-20020a170906fca900b0098963eb0c3dsm4686309ejb.26.2023.06.23.09.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 09:37:44 -0700 (PDT)
Message-ID: <b44b71d2-949f-8ae3-7369-4430e78de3ec@linaro.org>
Date:   Fri, 23 Jun 2023 18:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/6] dt-bindings: cache: qcom,llcc: Add LLCC compatible
 for QDU1000/QRU1000
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230623141806.13388-1-quic_kbajaj@quicinc.com>
 <20230623141806.13388-3-quic_kbajaj@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623141806.13388-3-quic_kbajaj@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/06/2023 16:18, Komal Bajaj wrote:
> Add LLCC compatible for QDU1000/QRU1000 SoCs and add optional
> nvmem-cells and nvmem-cell-names property.

Your commit should explain why you are doing this. I can easily see from
the diff that you add nvmem-cells. But why?

> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 


Best regards,
Krzysztof

