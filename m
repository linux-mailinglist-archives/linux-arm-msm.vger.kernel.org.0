Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9A855EF53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 22:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbiF1UV4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jun 2022 16:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbiF1UVb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jun 2022 16:21:31 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2F43CFE3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:23 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1013ecaf7e0so18513189fac.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jun 2022 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j+vuZJh1EOpnVUmXd33cUP43JD73Eo7CHwe/tmGFFMU=;
        b=TaHlKkbjPYWBrgC4FDo4XGh6qSa4XTUQ1l+iMqR8viY6FuInLcbMpEKdEBm+Z77zYs
         5+iFcbvb20YSar4aDc5c0Wfqz8rxET/kXe+XjM5wGin+zrdWjTPJBxaUNzLa5XywQ6/p
         Mm5rha/MeKynKV9ixiXaWVgORVSSctYs257nqnHa/d2LWGFyEPcxwuwhlcvfrXMv8Dtu
         EpMeisBxEFXvVg/EiacusSV3YhXjZykCJgXlQ9yL7XS7qVR4PGXtadKmz0vaVGKFmztM
         ihoIC05TjKKoncI8sTijONapRgFpQbKBWAjYcWZ61khcG+Jk4P/qoxJlFVM0I0en9wLc
         OCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j+vuZJh1EOpnVUmXd33cUP43JD73Eo7CHwe/tmGFFMU=;
        b=ojt2F8MRGXX2q99hObqaHC5xZwbv/XtJqebcmaKKmOvobWpkpkffw/ed97KBTxiPYA
         lCtN6b2RbZsRmFEU85MZrCfUy5k4V1+aNozAzyX5eoUGqyIoY7OoWuyrZBxktnukTnAe
         ZKTln369OoqqoPdPmh+gpUWl3iVGt4lM4HmRPVUeftL9tUu1yeXw3xJpwx63Jh5OiJWr
         h222LoywFYLq1xI03sErswG5LkHz1wwJj3/gwCnUluabCY+gmoRqRsjMLi02DMPQmtUp
         0TunkzJtOo0lOupSOYx2jmdmA17jnt2OR0+oXiJkK5IzGTovvVh51T/ZM9G38nJksu7V
         tGFA==
X-Gm-Message-State: AJIora+mOlSpEu8NMCMfys2Ol1AD9LZ/f7jGhry//PDn93SYjxqTPbFu
        PQgc/XcF1FmlLuY99SLsGNmGyA==
X-Google-Smtp-Source: AGRyM1s0XWitQB+QgkhZJJFRdOtjpbAlFmaVd8dEdg1vIHz6LUPs6bDF5OqGYOydslxtylRHLUDF6g==
X-Received: by 2002:a05:6870:a2c8:b0:101:337b:5277 with SMTP id w8-20020a056870a2c800b00101337b5277mr953434oak.74.1656447563181;
        Tue, 28 Jun 2022 13:19:23 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a12-20020a056870d60c00b000f30837129esm9536923oaq.55.2022.06.28.13.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 13:19:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     martin.botka@somainline.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        jamipkettunen@somainline.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        angelogioacchino.delregno@somainline.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: msm8996: Add SDHCI resets
Date:   Tue, 28 Jun 2022 15:18:56 -0500
Message-Id: <165644753307.10525.11876306379707662620.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220430162642.608106-1-konrad.dybcio@somainline.org>
References: <20220430162642.608106-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 30 Apr 2022 18:26:42 +0200, Konrad Dybcio wrote:
> On MSM8996, the default bootloader configuration leaves the hosts in some
> weird state that never allows them to function properly under Linux.
> Add the hardware resets so that we can start clean and get them actually
> working.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996: Add SDHCI resets
      commit: 68333a42fcf53f20aa09567f8b57216438cdd2f6

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
