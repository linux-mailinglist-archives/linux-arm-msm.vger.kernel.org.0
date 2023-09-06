Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B29C793DC3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 15:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241095AbjIFNei (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 09:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232951AbjIFNeh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 09:34:37 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0BD10E2
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 06:34:33 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c93638322so206862866b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 06:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694007272; x=1694612072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUvSvKUaI9jM7APVyUfAw53E9ZhyDpJtbSHLwdTGqM8=;
        b=l/cCpz4oFGpGYiRgSD2cKZwFltpj/Ame8thJsY5UzmP2fiLRPQu9uLdFL+yV32b6NB
         J98i4xxn4eBXD/wHgagujTBqGGaT7M6qtNiKLEcxyFYZdPbPZCk+VFkK1UXP2Bns2w6F
         HGU22RsQ2sMpbBNIDO+pEyI/usVMvfpXYU/x5nWbqYiTVvtf+KlM5SQD1QY9WCAEkMg0
         0SnRpvEsAm3i9xk9kjMbUuR5inM6KsVTU2hBDbQH2bO3Z1SpkRshaLi4sv2U5OXJoSS1
         hy/BcPjjrM37Qt1BeFSwn1M3WgN6OaylYADxNviYIJgKBHa8tC8dmhgcTQRLf+zh2Jnm
         523Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694007272; x=1694612072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUvSvKUaI9jM7APVyUfAw53E9ZhyDpJtbSHLwdTGqM8=;
        b=PfbXQ0K/Cx5fjWmk5wENIgvNpHBeDTP4xhstcg6tlUCd/IGTx6nl1I1nDiNobEcDdW
         4bi6bZ+M2VkmxARe+NIbIXPK/6q5nSWTt0pT7+0wE72QdasB9MwasMdxJkaHKU2NuKov
         3Lfx1bj8udLVuDsG1opalETj1OAzsHhiVsaaF2YxeXqBqnm1QOp23OrGUgB5YBRbHmfi
         LxkRMU85lL8oXJiDaWZcJ1rexlHR5OT6Nty1d9NfMUnCz1RsvDK/4PgRXdyREDhvN+ER
         uq5S1ClpKqvP83/QwfFC5qyaNfxUJdVdOG8hApkLxxk1oqOSxZMjFJ8ZYamAgUQSpm9A
         3shQ==
X-Gm-Message-State: AOJu0YxAZM4EJyodeLJlLlAqPiYlTErWHNhEeawobqwiCB8CmjjPpHcO
        7MoRmO1OgzNu4OjN1NSEVBzPHQ==
X-Google-Smtp-Source: AGHT+IH0ewRIkYKg0go+8hBWldfPMNlrRyX/G/TxBFdICsMBmJS+8NZ3XjbC8n+zTti1vGaHWz2XGg==
X-Received: by 2002:a17:906:3003:b0:9a1:eb4f:56f with SMTP id 3-20020a170906300300b009a1eb4f056fmr3273088ejz.13.1694007271951;
        Wed, 06 Sep 2023 06:34:31 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id p26-20020a1709060e9a00b0099cfd0b2437sm9070145ejf.99.2023.09.06.06.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 06:34:31 -0700 (PDT)
Message-ID: <04bf71a9-cfa6-60c1-ecbb-c8e2865d8d15@linaro.org>
Date:   Wed, 6 Sep 2023 15:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: qcom: sc7180-pas: Add
 ADSP compatible
Content-Language: en-US
To:     Nikita Travkin <nikita@trvn.ru>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     David Wronek <davidwronek@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230905-sc7180-adsp-rproc-v2-0-8ab7f299600a@trvn.ru>
 <20230905-sc7180-adsp-rproc-v2-1-8ab7f299600a@trvn.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230905-sc7180-adsp-rproc-v2-1-8ab7f299600a@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/09/2023 12:41, Nikita Travkin wrote:
> SC7180 has an ADSP remoteproc. Add it's compatible to the bindings and
> refactor the schema conditionals to fit the ADSP.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
> v2: Refactor similar to qcom,sm8150-pas.yaml
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

