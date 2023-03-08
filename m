Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F41296B01B3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 09:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCHIkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 03:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjCHIjo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 03:39:44 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3712880907
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 00:39:38 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id k10so38657445edk.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 00:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678264776;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QV33eH+ykxwbUybukXwLXgzkOq//xh6M0p/2E4thszg=;
        b=F5sw6+NI5MKYyRDziglsIANzgjpM5uGQq50VPA0af/PYUgRscfMwuf7vHwij/eTlLb
         eq4Q3qhmi8rcckTe4d8IVzZbGpbx/EFi5ImXc7fDqbm4RvTFDxcSJfZzy74vxBS2ol4u
         1ajCeVGHlDEbhRqy6TT/sdks8Od7SleYgEG7zl4YONYcl4LoPUbdH5oBlDryktUPAD7i
         vXIs3qsFHm2nDp4FqwHtsr4tVh9aYvPNgU6k9o46RV0xwkvfZ7yAkxsFaT4NQJp4nK0o
         YMLhX8RHku6Q+59fBUqIvOztJUWA6Rl9bF9qJwTOfE6xLN1mToSlB0IzHi3wbB10MC2E
         M+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678264776;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QV33eH+ykxwbUybukXwLXgzkOq//xh6M0p/2E4thszg=;
        b=6pgWwJxwa4hgEz9YVwb13xOnulKkNITklUbUKQSanCteTE1SqM+nu6gMoeI7TuSqdH
         FwIou6Ug106NXZ9K0yBM8In5AuuJ8XauSROd5s5d2nETbgSsxBwV0bYsISKrHUFTIA+o
         8VgfJtsxSOEX9yVrJ4xGTzA4vmlPtSl5eTB0u0+f96VGQFYxL0PkWPW5Q6ZLIq5j1rOq
         RDglWNhRRsOajO2heP6lge+SLean2Jjb1mvAlfyNZyplHq8z3H850sG/93e3aEKxv7O+
         bvm1KUQLBXhQcMhOg1dLk/Xh1sHyJg/UNtZ51BIQu/V62azscb3qod0ZQrZDXh28vXCL
         yo7g==
X-Gm-Message-State: AO0yUKUw9fGBtywKYS9n4wYe0yQ5vXcY2RFqYbl4uD7hPgnWDJ1TLYUT
        0CVued/jWbSiCMm0ZMSX3BARxg==
X-Google-Smtp-Source: AK7set9RYweSEcpIutoYbv25yEtf9A6U9Kj3ulxv1ZtPdvgVA1++7zaTtFsCfRAzzBsb7B8K7+6oOA==
X-Received: by 2002:a17:907:a508:b0:878:545b:e540 with SMTP id vr8-20020a170907a50800b00878545be540mr17660968ejc.51.1678264776716;
        Wed, 08 Mar 2023 00:39:36 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:bba:fbfa:8aec:a133? ([2a02:810d:15c0:828:bba:fbfa:8aec:a133])
        by smtp.gmail.com with ESMTPSA id h1-20020a50c381000000b004cbe45d2db5sm7260809edf.37.2023.03.08.00.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 00:39:36 -0800 (PST)
Message-ID: <50605eb0-e142-6d8e-f269-424adabfa62f@linaro.org>
Date:   Wed, 8 Mar 2023 09:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 09/11] arm64: dts: qcom: msm8994: correct RPMCC node name
Content-Language: en-US
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230305125954.209559-1-krzysztof.kozlowski@linaro.org>
 <20230305125954.209559-9-krzysztof.kozlowski@linaro.org>
 <CAB1t1Cz9vmAjdDS6C0CA+UEqAZeEJ5H===MajbtyAbZR8M1ohA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAB1t1Cz9vmAjdDS6C0CA+UEqAZeEJ5H===MajbtyAbZR8M1ohA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/03/2023 20:49, Petr Vorel wrote:
> Hi all,
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

It's empty email with review tag. What did you review?

Best regards,
Krzysztof

