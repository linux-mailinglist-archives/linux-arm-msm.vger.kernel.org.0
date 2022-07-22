Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 592D157E681
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jul 2022 20:27:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236047AbiGVS1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jul 2022 14:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234717AbiGVS1p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jul 2022 14:27:45 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8746E8B6
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 11:27:43 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id bp17so8991743lfb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 11:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=I1vUGpwMpvsFijcK7rMVb17fRKbm3rXcOPS4jhYHo+s=;
        b=mfO9qhrEMeDSmoRTcZLxZYa7i+qL705xCNjz0AxbE+xl4krndTWTvD+DNwwqe8gCjo
         G158X6kjFckVPHj+JnJoQRjMHr5shekolrNQRyzGP0neK2bdQ5/hhs1WGwAGNPcqmN64
         46fWG/datwAYc0KLUSDxYt3Bw2StnfXl6gWgvZxBFSspFy2iTgiYwqCPqijK9lRMC33k
         97/IO6Jw3yQ9ha9/fmnNOFxwNXuJWhyigtB/mPwctGu5zzi04DwYKbh8Qd0XT2+DuyWr
         zmhtq428dE5g+fcKb/VJETBIBy7u3rFhdWh++s53ONHWZDWRzSwI1d+uL3gzB7pcSn+1
         JvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I1vUGpwMpvsFijcK7rMVb17fRKbm3rXcOPS4jhYHo+s=;
        b=lxzfvU3QfPYayHhumIPAowlJu+uZbteqHtyvbbmicpqGoq2E4vv+4mlRrIWQQRZepR
         qyEjYjhcmB1jiF1zrKRRDYAncopkkbIrPTYCqkexqZFQ9icZeHjqcpHqdwTJztr6MZOH
         6n9rLSGMxUIfuZvc7FZRmRXYK+27gWk1aJbkOJykuEpTzKn1EajzBsoTYZnCttNz5BuA
         TNC9KfTIHHNGAhIqWacahZA8UOGApcy6JZHd2FpLosRsa1Zkwl2tSPqrferdFZEAxMQY
         LoZVd3D5U9CA06wGsIEm02X0PKFxIYO2mI+RKl9URtVFNyK8Uq2gYe60Ij4jDdihsxph
         OfyQ==
X-Gm-Message-State: AJIora88eWTCQKdakOMGdWm5wZ/G/HyhHTX5DMMxqLZMZQm/IdaS/kxj
        AJLCvA1L+YiZOeCsRrh+n3fYAA==
X-Google-Smtp-Source: AGRyM1u5s9vPRllug8ZcmUKJwD6rKM+iYjo9EoPGp5f+2bxpIwcItZExHlxKP0O+ZhB0AaukTIb/IA==
X-Received: by 2002:a05:6512:ac5:b0:48a:74c4:3d90 with SMTP id n5-20020a0565120ac500b0048a74c43d90mr443420lfu.653.1658514462023;
        Fri, 22 Jul 2022 11:27:42 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id b27-20020ac2563b000000b00478ea0e4f66sm1181083lff.169.2022.07.22.11.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 11:27:41 -0700 (PDT)
Message-ID: <de7fc091-ed12-c585-d39d-2bcf2bda37fe@linaro.org>
Date:   Fri, 22 Jul 2022 20:27:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Document additional
 sa8540p device
Content-Language: en-US
To:     Parikshit Pareek <quic_ppareek@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220722142515.18592-1-quic_ppareek@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220722142515.18592-1-quic_ppareek@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/07/2022 16:25, Parikshit Pareek wrote:
> Add the ADP ride device to the valid device compatibles found on the
> sa8540p platform.
> 
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Additionally - please thread your patchset. Git send-email does it by
default. If you use other tools - be sure the effect is threaded.
Otherwise it is not possible to find the patches from you.


Best regards,
Krzysztof
