Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC44A719591
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 10:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbjFAI2s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 04:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbjFAI2Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 04:28:25 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B622C1B6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 01:28:20 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f4f757d575so831415e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 01:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685608099; x=1688200099;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3JaUYYseOOR1R5d/w1KWzjRPShmvJQ99IwvOrfCTtD8=;
        b=kyjaFKGlVHtkgiS7AeIPYAxVpfoDRZtNX7g/jpyd2QRt+Z3F+N8HWMgKXY0hPQspIw
         cflIasbBv0qnkUEYdUxba+5O2RGZstZ5b7QJMxdKWLsjypkSEFzwM/xgaO6zIwm25W9B
         JHfmtqUQzS8MX/wwvFkaWnNNiJYUgo0tGPJE0QX9YMeX1NLVrEurQhwZeX0IEfAYuFlw
         Y3ASRyk+iVdbl5a7a74vkaeQW8p4KeKHpHuwoZ2gAGn3B98DsdI3tq/KsMWNO6SuW2Kl
         zGRXAn5AK6Jl8lduDGwoDTQSbyu8PtxiLKFZTJxRBUHuJ3E0BQT0Np0WA7ucPQt7/xlJ
         ljGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685608099; x=1688200099;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3JaUYYseOOR1R5d/w1KWzjRPShmvJQ99IwvOrfCTtD8=;
        b=Jxqp6Vruj9Z2IdOW3gBv0LkYDIdxmkmgWMFCZYAb90V1nuNCIui7nDrqAJ+IH9q5gZ
         XktRr2IYfoaJHmuQNK+qK2xLD7/xoC+TO/BABar8oSskIlhVhPHFHqQxXvGfEKha9hIv
         tFQl+zromaBJS0kRBTbtaSShOCMtE6WZDSCoBc9z8nkVvHRzrzpzjFmBGUvYImfD/MSj
         l8yzf28ZOokX3cmIWbW1Qr80B+iZ+do5PJTN1NxbR+LcDuHIXL9lccaaGDWljHEH7BDi
         HvAqT56Z9OBmysxyjjDPcbUJwMxqAeTzSfQ0a9gbdY3vljZyGiq4+oZERQF4Gvuh+nZY
         /CAg==
X-Gm-Message-State: AC+VfDxgzWmXsOLPbVbZmCqSgDXE46QYsStURc1KaF8tkKaltYMryI/6
        1NWsP/x+nnKoAPYhfkq3tPyuQw==
X-Google-Smtp-Source: ACHHUZ4y/eNZdAB2djIfl0TSzTeH+aF3XX5y9faw3mmCYSyHd5sMa7YaASS9oCqpOP15lIkUZ2ruyg==
X-Received: by 2002:ac2:59db:0:b0:4f5:bc4e:80f7 with SMTP id x27-20020ac259db000000b004f5bc4e80f7mr352194lfn.14.1685608098640;
        Thu, 01 Jun 2023 01:28:18 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id q20-20020a19a414000000b004edb0882ce7sm1002385lfc.133.2023.06.01.01.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 01:28:18 -0700 (PDT)
Message-ID: <9e67709a-246e-95be-dc85-21e652306ea6@linaro.org>
Date:   Thu, 1 Jun 2023 10:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: qdu1000: Add SDHCI pin
 configuration to DTSI
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Komal Bajaj <quic_kbajaj@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230601065805.18079-1-quic_kbajaj@quicinc.com>
 <20230601065805.18079-4-quic_kbajaj@quicinc.com>
 <96f40b17-ad7a-ede2-dcbc-a35b6b7df1d2@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <96f40b17-ad7a-ede2-dcbc-a35b6b7df1d2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.06.2023 09:00, Krzysztof Kozlowski wrote:
> On 01/06/2023 08:58, Komal Bajaj wrote:
>> Add required pins for SDHCI, so that the interface can work reliably.
>>
> 
> This is not a separate commit. The pin configuration by itself does not
> make sense and we don't need it. It's part of adding SDHCI, so squash it.
keep my rb for the squashed patch

Konrad
> 
> Best regards,
> Krzysztof
> 
