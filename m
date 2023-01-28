Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 496C267F70B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jan 2023 11:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbjA1KT7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Jan 2023 05:19:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234039AbjA1KTh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Jan 2023 05:19:37 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A8DC169
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jan 2023 02:19:35 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id n7so7058443wrx.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jan 2023 02:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYz+vi8tw+B66nlrFbg9zR+V3vjTShYFhKroNa0/+w4=;
        b=N7IIakkXuB3dWSwz5isrssWhLhjBjKg4lEfr2RlU6Ct7BEGSgK+eSqfXJUAjDracuB
         1ZBmd6PoeiWJ36JlkrPxn20K7biyY0J/+HaUY9Qp8W1Rw6l+55CqKGhvJgo1dV7mrd59
         eCCftwqH7y8+C0N5pBL1tzEnFx51yP3RVF9r2149Dpyvt/crLmdqa5v4CxPC8unR+yD8
         He+8P3eHN1P+nVWBLo3uRypkY6zhIoso5J6qygc3YhMu9pME1UWhRnXYhuWGxQOK//7c
         RKwZcuUHlkmL/76SODSAfT3UQzvg0UAySRaULOW/6dyWcjGDCgDF+umVBXK6Wsh/ygec
         159w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AYz+vi8tw+B66nlrFbg9zR+V3vjTShYFhKroNa0/+w4=;
        b=EzSLh36Xy4CAtlFQ6eY0/VNHejO9EZt5FH1DneMWP1ktWJ+RJ50H4SCfiKyFA7Q4iS
         v7b4HsxVKFp/0l1g/wkLrl4CT61qhY2kZpR7QvA7io1DckEmCV1J1g190aWmCIJb/d+Z
         sZEkm2bUHwHJhxEr81XTNjCcjWZqFKvWmH2yKiDmcuvinJZsU8s4ck6cz+zguoWxgMLm
         LYF9IPbkJaB3yWPG1FSCAJYuKE7NW9ydQfACyum5VBfVyL6HlZ16T5VArkIn5oqg7LBh
         t247MB1/+8pnMFtQO2X9TuHXlXRBjRQOmoRCDJyXte1dEun5tbLKL+1qfhi11awGciHi
         nHSw==
X-Gm-Message-State: AFqh2kpebPWtSDVK90qu2H0g3nFnAi8temUV/2LbcDjMelfxGUwLA/E6
        uLe6alEAKOOEtQ4CTyUlMgOPBQ==
X-Google-Smtp-Source: AMrXdXu7Ii8Mc14sPk8zxHayPTj92I+yxLHfVHEL31j9ODoLpVzR3gEr5TMXd2/9AZpaVhiSPnT5sA==
X-Received: by 2002:a5d:6b85:0:b0:2bd:d782:c2bc with SMTP id n5-20020a5d6b85000000b002bdd782c2bcmr37609068wrx.33.1674901174085;
        Sat, 28 Jan 2023 02:19:34 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4c8e000000b002bfc2d0eff0sm6188597wrs.47.2023.01.28.02.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 02:19:33 -0800 (PST)
Message-ID: <2dd3983b-3108-ea90-f5a6-7fd3522cd0a0@linaro.org>
Date:   Sat, 28 Jan 2023 11:19:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] remoteproc: qcom: pas: Add sm6115 remoteprocs
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     mani@kernel.org, mathieu.poirier@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
References: <20230128053504.2099620-1-bhupesh.sharma@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230128053504.2099620-1-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/01/2023 06:35, Bhupesh Sharma wrote:
> Among the subsystems in the Qualcomm sm6115 platform we find
> audio, compute and modem DSPs.
> 
> Add support for controlling these using the peripheral
> authentication service (PAS) remoteproc driver.
> 
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

