Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3095A10EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 14:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241992AbiHYMqj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 08:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241976AbiHYMqi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 08:46:38 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B258670B
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 05:46:37 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id k22so4642283ljg.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 05:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=MlAO/HOwUYxrXRzuLcbJGzJd+wKSnLDy/6np4kDoRvc=;
        b=ePUbyYECvrWpUGdCbA3selUHBljQtCu6vs0bL7IPA2FWfs0vAKbmazxKyIeku1y/Ae
         UiHWUXcogbQO7LJkuc6GVTnGl700mU01gdpY4/nz1h1e9R7iQD2fJq0I71QT0w73VrB2
         yKgul7OrWD2h2NWcaFemI/Qai1zF1LvQK9uyAkFIQpqKgKdb8m+UpbsiIO7DJyu37Bwa
         h4Ob+QvzE5Lnf+B4zux0VZ2rZMQIK19Nz2sP9Zi4TeZIxsB70tjZ4QATWyc9TxLL/ZY3
         3Pr1+pzpaXkzBpUTk+p8PMUFUOmmuuIYTGNMsDYeHRoIlxIYdiLDkErGUI16fOBHsNXp
         7PhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=MlAO/HOwUYxrXRzuLcbJGzJd+wKSnLDy/6np4kDoRvc=;
        b=vIgnyfhF52/N+mpuWSM4DZRKpEJtrLu0QY+2fBi8+v+wooYjeSCn4yjvH+d0trvTEF
         eyS9uvRRnh31iDoAvtx/VDaPCdaAyaNBmPzheuPzVYh9zGTWTl9ojdmdaBKSCFaSmDSu
         cCDjL3ee5+UfCuuCMYxldLEgTrm1M6xskG20EtRsMlS4egr+Ke/qVlw0R3yFVhyu2hHC
         WHzOnGHxBzh/JMeF0eilK78eiw9XKJbWB/gQeR/twyI1zE2I51Nj7UgzVYIGqvPR3DX7
         mM6MyBSkkfayeu5o6gkO70Eg5LwsgxmwrV7Y91BdRR0VozJiLyvnSVUkUrlqWQzY7zZO
         E93Q==
X-Gm-Message-State: ACgBeo1agq1T1obUgqZgySqBR9s8tKdpJ/TQw2lH4j+jzi/vniNouuhj
        dnvbGQEcI7ElzC3ouATXbH5/Qw==
X-Google-Smtp-Source: AA6agR6S4ckgaNIlaLxF/iotYnqi3J7kEIilm0zoEwnO6oRfujEl4XHGQoD5BFlLb3T1jtLrbKaltw==
X-Received: by 2002:a2e:894e:0:b0:261:ea54:6c4f with SMTP id b14-20020a2e894e000000b00261ea546c4fmr576363ljk.191.1661431595673;
        Thu, 25 Aug 2022 05:46:35 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id p15-20020a2eb98f000000b00261e58f9883sm547143ljp.56.2022.08.25.05.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 05:46:35 -0700 (PDT)
Message-ID: <daaf6ad7-6204-2a13-442b-05068d29e734@linaro.org>
Date:   Thu, 25 Aug 2022 15:46:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND] dt-bindings: nvmem: qfprom: add IPQ8064 and SDM630
 compatibles
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20220720163802.7209-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720163802.7209-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/07/2022 19:38, Krzysztof Kozlowski wrote:
> Document compatibles for QFPROM used on IPQ8064 and SDM630.  They are
> compatible with generic QFPROM fallback.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>

This was sent ~4 months ago, then resent a month ago... and still
nothing. Bjorn does not want to pick it up, Srini seems as well. Let me
resend without Rob's ack, so this will go via Rob's tree.

Best regards,
Krzysztof
