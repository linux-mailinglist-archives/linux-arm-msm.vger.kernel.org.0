Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A39B56710C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 16:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbiGEO24 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 10:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232965AbiGEO2v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 10:28:51 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B241164
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 07:28:50 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id n15so14722441ljg.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 07:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=zlsNRm2X6MLPImZjQVBD4LQfVI28AfW4RyaLrq540Ig=;
        b=VyU9l7p3EytYWgY6C0c3ZWXTzJeb04M6alOtJc9BLR+BgTI27wjjOjjoKvBBLc/y5B
         UzLmVKUHIoTbD+c1uvcpX7ZykpZEb2oriNmU0DG+o2Qm7E4tVHki18tF8cROHNBV5Bd1
         UFhV3Lah4xrSyW2grgM4NoUA5+mR/1HKv7LoT/A1bQC/ew3yITwSPKpjHgKf6ArjqCUe
         mowf23xRm5og0F2ET24nHuti+AMxyNtnPyNBYO705LDquYvz2d21G/TUV2yJcLLPu9Ti
         HkmsEqagcQldEJozmHFYALyd11VAT/MSlnqLLqoYZSSA49fbPZMStx+uK4kAk0TG/2PH
         h56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zlsNRm2X6MLPImZjQVBD4LQfVI28AfW4RyaLrq540Ig=;
        b=Rb1ww2vfxo0z1R+pwAei95+volRbB25EeghZqXdHbBVkoztI0YKk7dMzD40cxwmn+t
         FgRFGgePBmEcIINMGih+nTQXbf8OGDVS9/2+YJAxOaHHFXXmxiSjyYySEKv77AFKM6+G
         9re5a6nqk9ge8OiBMalVPcNBQJmwwNb5X+9oaAj36OmRV70GJjP7V0Qi2431SE4LlX/E
         eIjfMF1hFqR8m+Yz+OVUMoaBl/Q/juA88yFVww0awWl3D0oK4bk8K4gEQixEhSJMRcs5
         dQyORwEJL3ZTvgLuyXCEaoQiTu2USAj7rJDHgtNXkNzk/wnY4PcdpvY7E0O8T0WcZ0yR
         Yj9Q==
X-Gm-Message-State: AJIora+rv3lk6ny1O++jCfL/3I2ToOQug8mLVQYR4taGP1me0qlsO8KO
        c6U80aGpOcQG30sd+c/hPsbo866jf5xzMA==
X-Google-Smtp-Source: AGRyM1tCyGcsny1RJepiIU6HQgUv3ZnyQnh+0PZjq3tARwJ642YpS3/ECcELuDy2rQjTlq5j4/L1Hg==
X-Received: by 2002:a2e:594:0:b0:25d:30fa:eaa5 with SMTP id 142-20020a2e0594000000b0025d30faeaa5mr2392706ljf.86.1657031328532;
        Tue, 05 Jul 2022 07:28:48 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id b21-20020ac247f5000000b0047f642dd78csm5726321lfp.17.2022.07.05.07.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 07:28:48 -0700 (PDT)
Message-ID: <e84bb14b-a3a5-728d-e3a4-9d2e898a7aca@linaro.org>
Date:   Tue, 5 Jul 2022 16:28:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/13] Add ipq806x missing bindings
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220705133917.8405-1-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705133917.8405-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 15:39, Christian Marangi wrote:
> This series try to add some of the missing bindings for ipq806x.
> 
> This still lacks of the cpu bindings and all the bindings required
> to scale cpu clk or L2. These will come later as the driver and
> documentation require some changes.
> 
> So for now we try to add bindings that can directly applied without
> making changes to any drivers.

You mention here and in subject bindings, but your patchset does not
have any bindings.

Best regards,
Krzysztof
