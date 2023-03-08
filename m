Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B977B6B0543
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 12:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbjCHLCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 06:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbjCHLCI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 06:02:08 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2899F06C
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 03:02:07 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id cy23so63938154edb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 03:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678273325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E0ZB63Z0EuHBGN7h3pjkBD+vV3b+1Ob9vWpelsqrwK8=;
        b=K8r0k70dpa/9ezVzeJMQzrnE66QawLgu6Pn1RdHD9q1MyH/kwBz0JI5QSXKvaJyy4d
         Eibj/Q6uX5XO9aXEFxFbm7j6KaZKKhVRr4DbV7VDZ/EEcnYxS3SswweOLheJmTqN7Dat
         4p8yOkTAWfUklkTEnmN0F4RIdaoHXaP9PbQHi+GEi1Y1I3QoZSI8qbgB+A7Qt4dE9niL
         qTnALIqWDjTGUuaL9muEaFy+CGLo31VJqrEnJqh+C8iK448eG+TG38/GcdAbyg5PEILb
         NReLa4jcDH5yEfetU7gcuflHRLT2F50lZPGE/6Gy1oyemCD0AwP/afVNBx4xg6n9nzGY
         vw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678273325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E0ZB63Z0EuHBGN7h3pjkBD+vV3b+1Ob9vWpelsqrwK8=;
        b=z9S24STjtcbcjhlbdEsLr/Ykh/p7kZCe59GZ/ARdGAmm7LuZoHCvJBmiVhAlB0sg1f
         TuWaNfEVfBdd4/NxHBgh0/afg7pRfxtVNuzdxIXUugbGV6C9RnrYZNO950OEHdNydYgQ
         Yb2EiMDyfX0sCqGfXAo1Sp6Fh4woRPVzfffTbcvoZlpMCx9sV+u0SntEc+mDYRLEz1WO
         Tg7ZB8Mw8kZazidbDLe9yx2iTmU+USEKt7u5Bwzamm5CF5SH4Qj+3Q9DOaIVw5+sMVaO
         ZH4wjHsAcmGLQTaaqXzevTnXsGkcVijqF0AYWOd3pDgqj7+OUa5Hjp57E6+vgnYWnjGI
         jk2w==
X-Gm-Message-State: AO0yUKWyZWUZ8QJQKyaUjU3Wgj4skTRm/iuMWDn/26uXvl/+NdbobW1R
        FBNjrogQPfqd/EaDL9BCftBk7w==
X-Google-Smtp-Source: AK7set+yQObMeUURTtJuMCj/guA7XpAEF7aR9VxBzmGvqwCoEJDhQcT7JOmpVfvcLrnK3Avbf6fLFA==
X-Received: by 2002:a17:906:d51:b0:886:50d:be8d with SMTP id r17-20020a1709060d5100b00886050dbe8dmr19716178ejh.13.1678273325755;
        Wed, 08 Mar 2023 03:02:05 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id le16-20020a170907171000b008da6a37de1bsm7474357ejc.10.2023.03.08.03.02.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 03:02:05 -0800 (PST)
Message-ID: <1a915c33-ef32-852c-a856-10c8d35be151@linaro.org>
Date:   Wed, 8 Mar 2023 12:02:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: qcom: sa8540p-ride: correct name of
 remoteproc_nsp0 firmware
Content-Language: en-US
To:     Brian Masney <bmasney@redhat.com>, andersson@kernel.org
Cc:     quic_shazhuss@quicinc.com, agross@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230307232340.2370476-1-bmasney@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307232340.2370476-1-bmasney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/03/2023 00:23, Brian Masney wrote:
> The cdsp.mbn firmware that's referenced in sa8540p-ride.dts is actually
> named cdsp0.mbn in the deliverables from Qualcomm. Let's go ahead and
> correct the name to match what's in Qualcomm's deliverable.

I don't think vendor deliverables matter. linux-firmware is here more
important. The file will be cdsp.mbn in the firmware, won't it?

Best regards,
Krzysztof

