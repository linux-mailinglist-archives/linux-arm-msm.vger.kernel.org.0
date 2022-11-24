Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D95BA63752C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 10:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiKXJ3b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 04:29:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiKXJ33 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 04:29:29 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F4011DA1C
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 01:29:28 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id r12so1703810lfp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 01:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KV6XnQXIA2eA5M0tB2UZYyfS4gcyR4tDitrUAvHiG64=;
        b=ijhZHfh2jZL9aCjySXnzWT2QAriwMLx4nzWxqr7Ct5pDlOBP8KRkshxp0DOqDNJByO
         7L1gG3ediEGbqNZtXkmUiS5f1BBtHFUMjohZaBYuFBLnMSR83bIKYosH3sATN+cxrgGO
         UnN91unOeAvkBjwP38VBGdL719rlnVhWSz19vIgv3TpWkfszBwLMHXC3QBP3KlQl61K4
         zcnlehxA1IvqfZjZ3cZFQWcBUk3CI5nTBO4RYimq3rWiFM2tBV1r210Z21h0LI/X9qst
         8g/5KaCMFzw7VGSWbi1epbLxQfjNrBOl3eVbOhuEIsRn8BVQH4Ani0vTU47nD7G53EbX
         I5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KV6XnQXIA2eA5M0tB2UZYyfS4gcyR4tDitrUAvHiG64=;
        b=AO75BaugoSdOLpCbZ2hMsEPCt023l88Ye4h28GB+evVIp9FQ9Df0Bp9LCXmbHGuyd1
         zOAITIQ7Z1LsdfKsonNAKsupCku1+oRD2VJjcXlDyJoiGdRKap+k6C8dWg+nE/fBK3gw
         LNzQ2fG8UpuX0HHwnAgtXMgqAR5Jt3tXKc5wr7ltLqe127seCPsMs1GDXPESOhHzWzyf
         kQ9nQqJt7OvmzSFx3WobaZ3BAGgdRNhmJZqmlIn7IxrtUGkjM0oNx8sJrdr5ewtZMp/V
         Fh45rWDsdfMOVf7l4eFHOINDrIrWKWkiiCiDq2pqZG9kKEajtWv7ZRHLKUuCtR7vrxtT
         090w==
X-Gm-Message-State: ANoB5pntT6/Y1fNHDngmP6V1PjsVcTKPbEhz5oudXh1++vFGZ7bDtFUx
        AJqNFrfqz/NgpULKlGYENaViSg==
X-Google-Smtp-Source: AA0mqf4FNz77r6ziMbhgr+xM19T1ZqJEOgq5L657yKXbaw70s+u1xJJYAzZYPPiE7MXfud8Zuu2ovg==
X-Received: by 2002:ac2:4bd0:0:b0:4af:ad36:7a85 with SMTP id o16-20020ac24bd0000000b004afad367a85mr10488664lfq.617.1669282166656;
        Thu, 24 Nov 2022 01:29:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k3-20020a2ea283000000b0027970c9aea4sm54673lja.57.2022.11.24.01.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 01:29:26 -0800 (PST)
Message-ID: <f58866c8-0164-2e59-4ff3-f9a4f9334e49@linaro.org>
Date:   Thu, 24 Nov 2022 10:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: qcom: Add zombie
Content-Language: en-US
To:     =?UTF-8?B?5qWK5a6X57+w?= <ecs.taipeikernel@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Bob Moragues <moragues@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, Harvey <hunge@google.com>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Gavin.Lee@ecs.com.tw,
        Darren.Chen@ecs.com.tw, Abner.Yen@ecs.com.tw, Vicy.Lee@ecs.com.tw,
        Jason.Huang@ecs.com.tw
References: <20221124115712.v4.1.Idfcba5344b7995b44b7fa2e20f1aa4351defeca6@changeid>
 <CAPao8GK93KMrtaXw7mNWOCE60zk=uCENLfBXhNRVxJXEnnaGFg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPao8GK93KMrtaXw7mNWOCE60zk=uCENLfBXhNRVxJXEnnaGFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/11/2022 05:30, 楊宗翰 wrote:
> Hi Reviewers,
> 
> I really appreciate your kind guide for this task, Matthias is right, I am
> newer to upstream kernel development.
> There are a lot of thing I need to learn, so I just try my best do not ask
> stupid questions. (please forgive me)
> 
> 1.
> Because I missed V2, V3 changed log, so I supply in V4 commit, and using V#
> to note which version's change.
> 
> 2.
> I notice Kryzysztof say he didn't in cc mail loop at beggin, and below is
> my updated mail list:
> ---
> Series-to: LKML <linux-kernel@vger.kernel.org>
> Series-cc: Douglas Anderson <dianders@chromium.org>
> Series-cc: Bob Moragues <moragues@chromium.org>
> Series-cc: Harvey <hunge@google.com>
> Series-cc: Stephen Boyd <swboyd@chromium.org>
> Series-cc: Matthias Kaehlcke <mka@chromium.org>
> Series-cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Is there anyone I missed?

These are not correct addresses and not complete list of them. Don't
invent the entries, don't add there some weird addresses.

Use get_maintainers.pl. That's it. Nothing more, nothing less.

Best regards,
Krzysztof

