Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9397634F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 13:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbjGZLaO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 07:30:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233740AbjGZLaH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 07:30:07 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1788D19BE
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 04:30:01 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52227884855so5700989a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 04:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690370999; x=1690975799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=onPbV8Yv+Ue98mrxtxqkTtpVYJaOzehqj+NNEv4BhAY=;
        b=T5Oly7FluqjUGaa3lMgD/oPQ2J+nYChOgoHh0jYspY5uXfnE5MYT68UsCB3SjoGnFQ
         FppOWSh1MMLtLlGVIhLDk80CzltGf8n0bY7LbZRLYLaCBZDOqOZ1HtmVYMQnHzseWQzX
         v4w1WbDM/bozmL701yPTBbu6Ixc2TBHPJdHGhfqc6T9O1T/Qa1N43ddjF25ap/TZnj7y
         5hk3yJUQlIFxnRWT4FNF242L13jbB7r1iEGB5w+kTDi/te5hlCGLKFxTkNjC23DSJdfA
         6gRlLeuyAOh7mpG+mGiCeuxaWY71tVSERdRQ3u6jpvurjUHVpuwxU1y8CbGt9pDVVYYi
         QpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690370999; x=1690975799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=onPbV8Yv+Ue98mrxtxqkTtpVYJaOzehqj+NNEv4BhAY=;
        b=YRuZhDAwNeRPN2MvhvURQfbCa2IVON2mMjBBVyzDH6smWv0tMO0cX5jSpLBFByTn6y
         PLheLSpkgButWSpLSEgnYtIhRtuu6dpDA4+DCN9Eqhl5TJvBbfvzt8TB9sBw5Ph9+c7i
         T1zGuD21x8waECTYm5kSXKXJM0X5hivi9xmLW29n4UndB+kDg7VS7/4Cf/ceWR1VFL+l
         jq7BPuUGwmy7HNOnpqMNL3KxWyjxM/CpehhQ/7n/BlUbChyJvdL5qvhmlJTSCcVzNWsX
         RS2BshCegKxk4ttlHdfAtXIIP3dQ8VIWJrGkb6FQYAng6MPo4KIhr0jLNhMsjJZ+4LVw
         FKwg==
X-Gm-Message-State: ABy/qLb2cm3wT1f4Bl6TFpq0s71JYGSMTnr2gz9Y++l/54qI4iem5guF
        ILtELBCinoY7rDPzzVUvcpTPjA==
X-Google-Smtp-Source: APBJJlGhsZALbMTZop+J6WRH+YKEaAOscUT56bRny+XG/qT9JQFYAWirvKrTQSzu9bEF7f9tZf78gw==
X-Received: by 2002:aa7:dcca:0:b0:522:4de8:f3e2 with SMTP id w10-20020aa7dcca000000b005224de8f3e2mr1563220edu.22.1690370999558;
        Wed, 26 Jul 2023 04:29:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id b9-20020aa7c6c9000000b0051d9ee1c9d3sm8686862eds.84.2023.07.26.04.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 04:29:58 -0700 (PDT)
Message-ID: <3ef4f91f-0afd-0246-4f8a-210aedb0b94c@linaro.org>
Date:   Wed, 26 Jul 2023 13:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sdm845-db845c: Mark cont splash
 memory region as reserved
Content-Language: en-US
To:     Amit Pundir <amit.pundir@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Bryan Donoghue <bryan.odonoghue@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20230713165238.2814849-1-amit.pundir@linaro.org>
 <20230713165238.2814849-2-amit.pundir@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230713165238.2814849-2-amit.pundir@linaro.org>
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

On 13/07/2023 18:52, Amit Pundir wrote:
> Adding a reserved memory region for the framebuffer memory
> (the splash memory region set up by the bootloader).
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---

I think your commit msg misses describing the actual problem, impact to
users and finally cc-stable.

Best regards,
Krzysztof

