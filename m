Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92F3F554786
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 14:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354793AbiFVIgY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 04:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354763AbiFVIgC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 04:36:02 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D9F38D8F
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:55 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id g26so11226187ejb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 01:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CF1BqQKT1hgBLJkos1ruapqCj3ymi0hfKws/MXschig=;
        b=MciDs+Dj+/wXPn0G+hR+kiZqaTKTIBA8RZVikRDEymftJYbK/dXt5oWYlLokQOFFhy
         vivq8P68399miRN5TwYy1rJQDB9WY0mFfSpsURHdUSIbyg6GMwLO55AsYAmu3Mj91SiK
         av6RPp5MX3zwclz7LgsTtFFC4BfsrxcIEopjqp4aMepdG/GIR+9F5VFUNQZkADSJFys8
         jOnBd0tttnnUUIa0xbqkIZB1jIfFWHnkOVcqdyAKaRQ/wVpsRThj2OoAO85uIPALI5Hr
         bCyhhNHG4DN70l8eDVvYIsbNC4FfY9xTexkGUgeVGkLolFip2XCtiLoubLVzd4atVsT3
         1CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CF1BqQKT1hgBLJkos1ruapqCj3ymi0hfKws/MXschig=;
        b=eAGqK8pm81om3pzxSBLxPr6cyLfgJqEpuF+oRkc+BQlY7hWfYtD0rIdWplDLxsIVZD
         ttQzl+AKOtlFsKjP7tHt/ytgmLeH0DfSrJnd5BeSxhAeRbUcVKPWoeET/xUdiBtKKZ/+
         2Vvsxf7N9yxQfZOmSY3JfvmrdKWdMYnVpDE6j9/3/Xpbxbh6FRzdb90ZF1Dv4848LqUq
         V4uYuhzUSacmbQc96SGsWMGxHL4ObJ+WiQrbvWNATn/1lIT2rYGHlTSB//059P54UrOB
         dWmkJBzvR1J50vybTcXfkfsBDOGQwFg+BpEtKpES0NHmWBPjAewuQ4gHMuAht0bs7y+d
         pqEQ==
X-Gm-Message-State: AJIora8ERDpB1jZ3VrjOw6UfNjar5Sp1DSmY6krY8C1ao8cbCI6saAme
        ncEOIVN+CIioWDyYlKslWxHwgA==
X-Google-Smtp-Source: AGRyM1ur7WeJlwdEaX6WnHMLmmDWQbXARIOcdOLhKFO+7/2C6vCMDaR48E8sF3V9r0UOG0tS7jSBWA==
X-Received: by 2002:a17:906:b53:b0:715:7d4a:dd74 with SMTP id v19-20020a1709060b5300b007157d4add74mr2054806ejg.90.1655886954791;
        Wed, 22 Jun 2022 01:35:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ku10-20020a170907788a00b00722e603c39asm1979733ejc.31.2022.06.22.01.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 01:35:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        srinivas.kandagatla@linaro.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, krzysztof.kozlowski@linaro.org,
        agross@kernel.org
Subject: Re: (subset) [PATCH 5/6] arm64: dts: qcom: use dedicated QFPROM compatibles
Date:   Wed, 22 Jun 2022 10:35:39 +0200
Message-Id: <165588692598.15720.14963454113723569897.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505113802.243301-5-krzysztof.kozlowski@linaro.org>
References: <20220505113802.243301-1-krzysztof.kozlowski@linaro.org> <20220505113802.243301-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 5 May 2022 13:38:01 +0200, Krzysztof Kozlowski wrote:
> Use dedicated compatibles for QFPROM on MSM8916, MSM8996, MSM8998,
> QCS404 and SDM630 which is expected by the bindings:
> 
>   msm8996-mtp.dtb: qfprom@74000: compatible:0: 'qcom,qfprom' is not one of ['qcom,apq8064-qfprom', ...
> 
> 

Applied, thanks!

[5/6] arm64: dts: qcom: use dedicated QFPROM compatibles
      https://git.kernel.org/krzk/linux/c/8d57e5b8203c46cd5ec96cb2202dd5878ae453b0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
