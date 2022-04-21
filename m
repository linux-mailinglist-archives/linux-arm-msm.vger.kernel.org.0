Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6319F50A259
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 16:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389336AbiDUOaf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 10:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389282AbiDUOaQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 10:30:16 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200CC3E5FC
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:25 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-deb9295679so5543495fac.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/B502ChT3poZts8YCPYz5xDZwyr0p5zHV9IaQgtAduM=;
        b=YJokhvHYtwCU4lkXd2dwDyWVceLbY39kVkkrn66Vfhbf6cmg2d66bPLwAU/vV00T7Z
         tCDVKCODBT67ycLr4MIrYtmuIsElypgl2yu02weO0myy4VElaSyONt9UuwDqHImxWSHN
         lNNacm2mMBd5eWlRY0NR3heA9qqiUcQUQymA4VbT07MCZNGnLKWXtt/ZMeodexe1SFX8
         0AQ3DlohQCWRrL4G8qPDJ1rWqpPgWpt0YKafBimHRXcnTdXr3C1zA7IgiQA6bEhjPF8+
         mSpUCpcWdJysUlKQdQtqnk5tRvjIe0+xLzjh6zozrt1mCnnmnxJGf/pYNa2n3O9vOiUE
         a++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/B502ChT3poZts8YCPYz5xDZwyr0p5zHV9IaQgtAduM=;
        b=g0u1IAirlq5PQly23KsH7FNH/FRHYC8A+UVKwQyhv2u+IXACsKe0JPGGKi76c1a2wU
         iPfxyBwg2ttPal00qYVHRwEKd4BTtK94mf3N023jVIZ7OWtnCtVseAQerze1SejkCJPI
         /BiSSeiHooPSI3WZWyxdZHq84FalqkuptQrMf77GYpyWxhwJoDz6gUM1us7AL9bw0+9/
         3w6lruEKFyNaHPkPP3qf0nJKjm0r63hXf9BTsqHgCYRVB5VFOrRkdVB1mzbTDBfxKumg
         lKxJyXQSCEMbLwwBWKVYdjUj6TyxPhDxL4i37bNh4uZ9HfL5nj4lw8v/+JE0j6dsKhO5
         kjHg==
X-Gm-Message-State: AOAM531QnxaZJZBd01TK3FskdNfA+G+MDkFyZmwfYzkFKQagekz2Erl0
        y3b28A8f2OuZ5UWMqeLKti7+uw==
X-Google-Smtp-Source: ABdhPJx5I93/gr/TtuBIYsuENa6bHuPnLnkAB0V0/GpdtFvLnZFeDlt/vLW1daZgSOemg9l8OmxABQ==
X-Received: by 2002:a05:6870:b152:b0:e6:77a6:7ee0 with SMTP id a18-20020a056870b15200b000e677a67ee0mr1193970oal.78.1650551244431;
        Thu, 21 Apr 2022 07:27:24 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s14-20020a0568302a8e00b006054e841915sm4296295otu.73.2022.04.21.07.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 07:27:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vamsi krishna Lanka <quic_vamslank@quicinc.com>
Subject: Re: (subset) [PATCH 4/4] dt-bindings: soc: qcom,rpmh-rsc: convert to dtschema
Date:   Thu, 21 Apr 2022 09:27:00 -0500
Message-Id: <165055095990.2574292.13140723180984898600.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220411085935.130072-4-krzysztof.kozlowski@linaro.org>
References: <20220411085935.130072-1-krzysztof.kozlowski@linaro.org> <20220411085935.130072-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 11 Apr 2022 10:59:35 +0200, Krzysztof Kozlowski wrote:
> Convert the Qualcomm RPMH RSC bindings to DT Schema.
> 
> Changes against original bindings:
> 1. Add qcom,tcs-offset as a property instead of one of reg (not used
>    that way).
> 2. Add limits to interrupts.
> 3. Add child nodes (bcm-voter, clock-controller, power-controller).
> 4. Extend the example with more complex one.
> 
> [...]

Applied, thanks!

[4/4] dt-bindings: soc: qcom,rpmh-rsc: convert to dtschema
      commit: 38d46b0f41ec57c734f1a647055644c2131c3d8f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
