Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83F79734545
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Jun 2023 09:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjFRH6q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Jun 2023 03:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjFRH6o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Jun 2023 03:58:44 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB4110F5
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jun 2023 00:58:43 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-519274f7b05so3255667a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Jun 2023 00:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687075121; x=1689667121;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0UdxZfDcPUlDpD43gdZsWKGOdE7a/Yn1reoUhJvBHxk=;
        b=uhOrnYFNCQ+C2+f6C1F/rbxizbKkkufYoyddT6Pb50KdGrYKbVcYdVhBK5yIxNQ7Uo
         46Dw+x5JZ+ZKBP8Bk/iXXyodCVcMcrLupqjSgxR5yy6m0IuNzHUdnEUi2G0JVmKukfbw
         iXc4iHz8PThFQBk9TZUlCN+ZFzOeFGhWNipGYsyZdE0vKaLQlI5AlZQPexe745U86GKM
         CTAN3frXGN/5C7qVox7LQBNnyhMKHJVJfSjDXhK4C4JUdj3G4HBbEg7LcHxPbXOiN4Jg
         esa4+0gkccTrvV/ye8CrMX3igNGEn1dAQdKOcKopMldzkTYBmvuJ5jM2cHsyLoTQWDaH
         677w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687075121; x=1689667121;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0UdxZfDcPUlDpD43gdZsWKGOdE7a/Yn1reoUhJvBHxk=;
        b=e6FiylGdHgZ6BdJk6sTG6dxe784Rf8fv1LeAvm63Vqm7I8/r80lWsDApbP6SqlxLeR
         9d12NpiPjmZV0ulL50o6str2JsdDLHjFhNcWpZd1FGtkjN1mSQJCsq6DgYqmrSoSXDZp
         2QEbLDrAsIcLDz7SgfAZ8zEkEEVyLoOeFU0fmW40myMsyURP4epgZc/PTLhiJW0CKWiO
         wKX+4rCvDIfplC/QTcyJMbcxhLj4+RduvLL/o1nKEAiHDMq4fk3awS1Xu7qgpvePKGwX
         rxRpcsk40iXI/cPG+jb9GDH/rMS9237UffdlpurECCRZjZRMgJoIG8JIsLHbkd2/lJ3O
         KjFg==
X-Gm-Message-State: AC+VfDw5xBD2q16gOYIXxfRhEYLBAdgQ1oe7xad68SEkMNVszrpKcjHp
        0OKnhk2ZXUR7e387h9sEgaCq2p0c6Pftu2W+tRw=
X-Google-Smtp-Source: ACHHUZ4G3uMvmrqr4DlXXXF/fh+Kzxyhw3IsFjpwX4r46T1RjiBrd84NiI644rxYbFd/208o2CqdBQ==
X-Received: by 2002:aa7:dc01:0:b0:51a:216e:7df9 with SMTP id b1-20020aa7dc01000000b0051a216e7df9mr4036693edu.30.1687075121515;
        Sun, 18 Jun 2023 00:58:41 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id z5-20020a170906714500b00985767bb5f9sm3204369ejj.70.2023.06.18.00.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 00:58:40 -0700 (PDT)
Message-ID: <b00a058b-035a-a792-cd3b-e1501e824b47@linaro.org>
Date:   Sun, 18 Jun 2023 09:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8150: Fix OSM L3 interconnect
 cells
Content-Language: en-US
To:     Markus Elfring <Markus.Elfring@web.de>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
References: <20230617204118.61959-1-krzysztof.kozlowski@linaro.org>
 <78cc123f-3899-5102-09bf-b00d95311475@web.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <78cc123f-3899-5102-09bf-b00d95311475@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/06/2023 07:47, Markus Elfring wrote:
>> Qualcomm Operating State Manager (OSM) L3 Interconnect does not take
>> path (third) argument. …
> 
> Can such a small patch series become a bit nicer also with a corresponding cover letter?
> 
No need.

Best regards,
Krzysztof

