Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 862BD57F0C9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Jul 2022 19:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236732AbiGWRsn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jul 2022 13:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235743AbiGWRsn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jul 2022 13:48:43 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12628193E0
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 10:48:40 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id z25so12296390lfr.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 10:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ca0agAXrQfV+6xG3l60Phv2GWeZWIolmT9TMk5kLo6Y=;
        b=smPUBqcz4s3f2SGWp+UKn3+gckCTy6vWTcDl/NOFTYxUNmUitVpr3LWTebRo/u6dCj
         /k8xmsfhYEEo9BnXGNrV1BvuOV3Py7dlLsbYdcevkjM8hu4pfOqzoHwOx4Hp6S1md4y2
         bPUz/th1Vm/rfl+qWdn+4we3yG3Lu60VPKAXiWhViBxpUEtmsoopR0+QRKDJ6oyIemfh
         6+rXDKl39H94AzAcMyoP5cPvP5OiI4FE3vXXPn9nPrQvs7KMr3OrEoOPIKvDWLx+BNjd
         DOjdhsAYLJ0zmreuwhcAGnsjsb8A8DdAt28HtLQo4LiKMhQvVHPEWW83iCk4vneUlPMH
         m3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ca0agAXrQfV+6xG3l60Phv2GWeZWIolmT9TMk5kLo6Y=;
        b=pxW0fsDJsMG3iCJP848uXwEbTiOu7I/GJgRD6KoqpzOY5EoHcnPz+/APTjGWzHE7FU
         9mbhf5ifsTRzVfKBy0omwvp/ncte8zVINuw2QjPPFAWukBIHcSUHwYDqsbMpIuF4QWDa
         msaiJpz1IcDss7c2icF68vUCz0Po9UlcBgPyOAbXaIxXafj6WgvAaf19UkbedQsaamjn
         QBZWVSEzSN4sFLsgSlQNIMcSCv+ifStJ4ln/wKsAS9CT+BbVtfruDa9GGhPQkiYv80NZ
         37HlTw9qkON7Ob5sSBpYDfprJyXoRxFAw2D1bHpQvJr84Nh7nbuYsoB8ygazRbE5TQ7U
         uXpw==
X-Gm-Message-State: AJIora9pqfnsmR3w0vWBVIoWfti6LJGzSKqg6Fq99ZKz1SPp/eTti93b
        dwiG6goTD+FC4WrhfSVbNXfe3w==
X-Google-Smtp-Source: AGRyM1vJphSK/+gZsXQXPz20OliSdrxeumVrnZuUUegE5SJGNEW5DmcSCJkZ0Fb6G9F+TcwrE6x9Eg==
X-Received: by 2002:a05:6512:2202:b0:48a:8663:6120 with SMTP id h2-20020a056512220200b0048a86636120mr228776lfu.196.1658598518455;
        Sat, 23 Jul 2022 10:48:38 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id n1-20020a0565120ac100b00482ba723195sm1738158lfu.253.2022.07.23.10.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 10:48:37 -0700 (PDT)
Message-ID: <b1aafb00-f00a-2621-ad51-fb2f7491dace@linaro.org>
Date:   Sat, 23 Jul 2022 19:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom: define schema, not devices
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/07/2022 11:09, Dmitry Baryshkov wrote:
> Describing each compatible board in DT schema seems wrong to me. It
> means that each new board is incompatible by default, until added to the DT
> schema. 

The bindings do not document something because it is or it is no
compatible. They document the compatible. Your patch essentially removes
the documentation, so there is no point in having compatibles in board
at all...

>Adding support for more and more devices would grow this file
> indefinitely. Drop most of individual device-specific compatibility
> strings leaving just list of platforms in place. All entries which
> differ from two-item string array are left inplace.


Best regards,
Krzysztof
