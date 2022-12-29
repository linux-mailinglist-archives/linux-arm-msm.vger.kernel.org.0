Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBA04658DB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 15:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbiL2OBM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 09:01:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233416AbiL2OBJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 09:01:09 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC6B2624
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 06:01:04 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id m6so17218204lfj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 06:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dWdcdzFREv5V6SPJe4nJ9WrjQaP+foHIino4lv73g54=;
        b=cQfwacO9fMts3lyQV2pz6a6+thsvJud3cvHWtX+VxFUXojtqK+nI8xvvWoZjlscD3b
         WoY7dZsM0DZ4cONKcOJYmU8wCn88ETrJ24NYIXgZ9swGTxP3AKs9jomGGXRCaiUIaGJ2
         EueunHBVrLvn4acWgPuAJvLWp8oaFqG6VebuVQkcSkKnIqNw1/48jzjF1xO0Q/55fIFx
         DtOSNEEVzXNLRwbCCXl66xN8ykk7DO+6xHF9R1Gi9sBMh4LYb4Is9o7fhUhjArDvTy9t
         ZRujMZUueui11IDiD5vRsjAWn8o7GO7Pomc0GzZN2S4C4iFTXhjMwhGJpFeyqfPSQgZx
         bYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dWdcdzFREv5V6SPJe4nJ9WrjQaP+foHIino4lv73g54=;
        b=edXRLeJBeUCcv0uERZ1OJf6ZYWkZVo8beuwrbYZL3IljAUgrocUZNwjPPAdzVr0b5B
         m48b13AwwNtkltTf9ewys7rQBcix0gNBcHNKdz0vUzAYGTDBtWOznz4it6IZVuQeZjto
         TtD/7ZQmX3S0OjM4ykaOKGJpHMSOOPC9V4mJKSPK7PCMOCCJRnuEy063iT5S48fIKxCe
         bZy/0i2J3i97oOMNJgbmC3EMu0Rxalg57FCvPfAds/tZxp0Ns0AqcVE0/E3mgaypzPOU
         4/x9MwIFTqFt+abzQ2CAYnoDYuOYqvQKiUbvihT35gZdjtKwHglprz+nEn3W52hy9Ppf
         JCdA==
X-Gm-Message-State: AFqh2kpo1K3GNtk6LvkS9LzRpgxv8B9WX3fBLWY8UGFDvY/jvLflLE5I
        j++dXTSr4Ktq09a7KS40DBjJMA==
X-Google-Smtp-Source: AMrXdXt4v6DQu4Wx3StmNSh0drgudTxpXbIAARtAiGvM5/Htc6reK7Ak6X/cOQjMJTlmotXT1kp62Q==
X-Received: by 2002:ac2:5975:0:b0:4b5:8f03:a2bc with SMTP id h21-20020ac25975000000b004b58f03a2bcmr7460398lfp.9.1672322463145;
        Thu, 29 Dec 2022 06:01:03 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e19-20020a195013000000b004cae648066csm3080925lfb.257.2022.12.29.06.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 06:01:02 -0800 (PST)
Message-ID: <1b11ca6d-3e28-f019-435d-06daea38d00c@linaro.org>
Date:   Thu, 29 Dec 2022 15:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom,pcie2-phy: convert to YAML
 format
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20221229115932.3312318-1-dmitry.baryshkov@linaro.org>
 <20221229115932.3312318-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221229115932.3312318-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/12/2022 12:59, Dmitry Baryshkov wrote:
> Convert the bindings for the Qualcomm PCIe2 PHY into the YAML format
> from the text description.

You got here Rob's tag.

Best regards,
Krzysztof

