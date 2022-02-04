Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10EAD4AA33F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 23:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344982AbiBDWhq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 17:37:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348584AbiBDWhp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 17:37:45 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57136DD02DF3
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 14:37:44 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id m10so10239242oie.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 14:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FrPLdOb0ywA5n4FsTGhx+oWZMq1l74LPEC44v8CHjgg=;
        b=WktAdZCGgZ6Zn/cahPUzCB7h5BfAfaFgynQFGLDjzy8k8d0TqdDeOUkmuYYwwyLujI
         eTRG9gJmpDPFV+C32XuFeYODE5SIl3rQYtKfD/EOaot3/vWxNDS25P0zqWTvxEWkQhtb
         NSc5So7jd1HLveq0PdVp9B9eBKtMtaXBlgOsP6aN7z4iDbHJysXA/frI1a0AX6MWQrKQ
         ZlqbGjcCqgSfKAubPoY2IlhrHYx2GwikXAMMchLg4JO1XC5G3kHcoF5uqDUPK4TNgp7n
         4qc9fD7gpLCxaJaVNq9PjzevWyAnJcRSAUNoAGbgCe64hmaFJgvcsygk8PD/VZfDFg5w
         d0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FrPLdOb0ywA5n4FsTGhx+oWZMq1l74LPEC44v8CHjgg=;
        b=yuUZuxH54Xspg8Qq9d9Z6Y3Xaz80Y2rWRJoQ28sKSlb4Iam+eAtfkg/WrW/sFKzaQD
         iTBxK+FNAhzolkNRsoI50YhmvGLikyhE25F/XG3P7Y7AkKV/QaKp7zf/CdOPGQo6787b
         jSmo1eunm8wLDgNSI0tleRT/3BQSZmLRYy4WSa4DyPjwn1luSjzwtnpzWibQq60hLO/w
         pB6FJj6QWiEloUetvs6777OerUyp97GJpYQC0Jq7FlkTNXp1of0nzIpteQjnFwtFeAqQ
         sYBgjc4Wu00j4mxtJ3nY2dm73t8EJwQCFmlQWhHuvKPpsH43AUXb5ftKB4Sm8i91atMx
         FMDQ==
X-Gm-Message-State: AOAM532FqtqCBHG7Wn7EXWzX9mwASj3PKXSTxBSIMM617cjGyjZ4SQBC
        AcCVs57tWQpZg7TaIDwk1EX4bg==
X-Google-Smtp-Source: ABdhPJzZTuDshfNIfsWjWiFB1PJVauHPWjhBEN/CJdnDWIbo0tNrXwppyzGYkV+sqquaWnZL+oCwIA==
X-Received: by 2002:a05:6808:3096:: with SMTP id bl22mr577705oib.280.1644014263728;
        Fri, 04 Feb 2022 14:37:43 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id 71sm1263073otn.43.2022.02.04.14.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 14:37:43 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document SM8450 HDK boards
Date:   Fri,  4 Feb 2022 16:37:41 -0600
Message-Id: <164401424604.3413232.13684740891173293910.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220203090031.3128702-1-vkoul@kernel.org>
References: <20220203090031.3128702-1-vkoul@kernel.org>
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

On Thu, 3 Feb 2022 14:30:30 +0530, Vinod Koul wrote:
> Document the SM8450 HDK board
> 
> 

Applied, thanks!

[1/2] dt-bindings: arm: qcom: Document SM8450 HDK boards
      commit: 42d3ce71ebcee2233f8a21adb44cb707f2ea3a57
[2/2] arm64: dts: qcom: Add SM8450 HDK DTS
      commit: 067b2b3616cd5ed924b51064bcaab23ea1ffd18b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
