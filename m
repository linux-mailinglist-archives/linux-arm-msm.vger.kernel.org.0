Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3375170325C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 18:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242346AbjEOQJ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 12:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242628AbjEOQJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 12:09:49 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794A61706
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 09:09:23 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-953343581a4so2034598666b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 09:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684166948; x=1686758948;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=341TNjLWrBgE06nFCXy3o4trQtS4Kz/UyWl3asj+o58=;
        b=ONmAmt0S8b3OAN/l1TQZYtuIvY0578ZosX/w1FdaADgF8DjUcfRXTTvt6hP0d1v2cc
         37EtDRvHGmFf4ep9TBiC40u+2tTqMMNYSuoa8B6CLxXznVl7Zj35gzWrnXen5rSXtF0a
         BocBIDBVOBCCg7EFXXvjjEuecNXt2zn252WGHbfckcca8W/gGY3x/zvcscQtjUHbzkge
         B2jmXvLUsvMd1doGDaq0ZGSCjWKA0li4kyHZMuAHXOTcDEgPmuv0soWQVLCqx507aqzr
         b8xiTDG0qL3WGBSSM6vtYcp0LL1c7ZVjP6F6ZwVUa+cgJz/ns5O17zYKDsKb6V0g1t6R
         4T0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684166948; x=1686758948;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=341TNjLWrBgE06nFCXy3o4trQtS4Kz/UyWl3asj+o58=;
        b=i9HC2lXqerba0uEj5s3PtBnlBSf+7h2fhhKDIpF9OMqY1AcWRLYr+f6rw6WyAWTwNT
         izPGkH8joFhdRsDhvK/FMH7dfkNxl0nZFFlkye1SgOq1WM/oKwDAnBP5kHbAGfUP9Emo
         HTVMWKs2UjyO2jHdjA4R/Jmzz/QtNA8pRzbbdgSbx0LQ+8FaZGIY02yZ+ry0AZrq22o0
         CHTSonHe6jauCd2X803DhK2IX+Edy4xGAtIuxzk8YvTPTdG/5Wlhxmb/rZ5sc1xjUOem
         bfmYt4+6022S1i4nTQ555NyBMHJ+pkGd/k3skpqc5UXdx8FCqTaKEyUK/JghDMML0/lH
         4fLw==
X-Gm-Message-State: AC+VfDx22it9QAKQYeC8d42OSQUUpA2iCvTs8UzrgBHvSRhaV00gOx5V
        X4v/5kblj7/5VnpKagegA3qAAA==
X-Google-Smtp-Source: ACHHUZ4odzxwMAuZw7Ku9tt9Loesq0gqkp8UBDEeokIAa/0wKQVcMK8RQ1H3FKZsj1eTfL2Hu17Z/w==
X-Received: by 2002:a17:906:fd83:b0:94a:845c:3529 with SMTP id xa3-20020a170906fd8300b0094a845c3529mr29009595ejb.9.1684166948208;
        Mon, 15 May 2023 09:09:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id bm11-20020a170906c04b00b00965ec1faf27sm9738207ejb.74.2023.05.15.09.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 09:09:07 -0700 (PDT)
Message-ID: <d6ea080e-f16b-d5e3-d826-3d7d620af820@linaro.org>
Date:   Mon, 15 May 2023 18:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/4] dt-bindings: thermal: tsens: Fix "make dtbs_check"
 error
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1684140883.git.quic_varada@quicinc.com>
 <72707b76a717b410b06ed7fcc854314104f5f845.1684140883.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <72707b76a717b410b06ed7fcc854314104f5f845.1684140883.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/05/2023 12:13, Varadarajan Narayanan wrote:
> While verifying make dtbs_check for ipq9574, qcm2290-tsens and
> sm6375-tsens threw the following errors.
> 	['qcom,qcm2290-tsens', 'qcom,tsens-v2'] is too long
> 	...
> 	['qcom,sm6375-tsens', 'qcom,tsens-v2'] is too long

Subject: Fix error can be anything, so this should be specific, e.g.
Document missing QCM2290


https://lore.kernel.org/all/20230314-topic-2290_compats-v1-6-47e26c3c0365@linaro.org/

Best regards,
Krzysztof

