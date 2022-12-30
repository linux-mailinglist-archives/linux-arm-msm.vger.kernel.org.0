Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C79C6595FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Dec 2022 08:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234691AbiL3HzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Dec 2022 02:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234717AbiL3Hy7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Dec 2022 02:54:59 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B437C1838B
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 23:54:57 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 1so30784591lfz.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 23:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7y9/9dqJRPgZvL3rwpxNc7byREOsvmcfrCiAJsoPaaY=;
        b=mOLozdir8QpzzKqdRCjek6mwVKVeE1bQZlxTVvBwFq7laAT8Doge7fy5R+Du/JuyAP
         s2JdpA60y3e7KAOo9kiMQZGCTENqjt8a4LzODcj/bPFQi8qetYOrF6jOSqI9DxGTvTLj
         /mibjuxy57lmczyGuNMucB4a/KviIreDtJKXYqikMAnUYSw9mGl2usI9TYk2PsAyeS+S
         Ne7DfQzn4caFqyINKmdziskFK1ozhLl/ux6CK3IzQ/bt4PmpORJ0bUj+y7fDpyu49cwW
         u/W+v/vhgr+976SDapmNwsn+lg79fzulRBVuqDVb+gPW0BkE26vhn/ucTMcxziPAS4kI
         nSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7y9/9dqJRPgZvL3rwpxNc7byREOsvmcfrCiAJsoPaaY=;
        b=6KlBrLIYIHd86IkHhj4bPCbPecCOSxF6OOtpLxRURUFkmuL7uwGulnJuVWxt6rO1tI
         NRlZ4lDWnAHCrB6Ss+36J6GicyYClOR6dEQHSGTqyf6k3rqGGemczm063HcCQB7hFZ/z
         WbKl+jKtpe59YEz9SQLFovwvSKw6oUYJdvUUARFsiHrBvd6xN83psGcwOaw4FWbnb1oc
         NSsS+yP07No9Y/kch8IabWli2ByidiP7MHCFcvF92nlZ6Nf2x0p1dvqUYa7GwGSUvy1t
         GO74+9zCSZYRVRv8+Sh1Q2ArQTsD5QsEn656dixhQYDv6Qf9AaEJ1tiVUIvaONORzImL
         b4qQ==
X-Gm-Message-State: AFqh2kpv4/NLzhfDxMMAdY3yyzP7klP4cFBDlJVSZckKF4zt6GjRnr+X
        yrGgBgm2eTL2f2/TwVUTJOGNhw==
X-Google-Smtp-Source: AMrXdXt2Xdw3MQFjEugmriAxPXpE2ODwiNibR/Qgt36bOws4pf3FJ9f+luPYT6LlzaLrqbnk5JNTsg==
X-Received: by 2002:a05:6512:3601:b0:4b7:13b:259d with SMTP id f1-20020a056512360100b004b7013b259dmr7853811lfs.48.1672386896122;
        Thu, 29 Dec 2022 23:54:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i22-20020a056512319600b004947984b385sm3353055lfe.87.2022.12.29.23.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 23:54:55 -0800 (PST)
Message-ID: <f04570e1-b8aa-be21-b0d6-9f56440c4158@linaro.org>
Date:   Fri, 30 Dec 2022 08:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/3] dt-bindings: ufs: qcom: Fix sm8450 bindings
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20221209-dt-binding-ufs-v2-0-dc7a04699579@fairphone.com>
 <20221209-dt-binding-ufs-v2-3-dc7a04699579@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209-dt-binding-ufs-v2-3-dc7a04699579@fairphone.com>
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

On 30/12/2022 08:42, Luca Weiss wrote:
> SM8450 actually supports ICE (Inline Crypto Engine) so adjust the
> bindings and the example to match.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

