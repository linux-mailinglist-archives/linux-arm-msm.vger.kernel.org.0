Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54DAB50A23C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Apr 2022 16:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389208AbiDUOaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Apr 2022 10:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1389229AbiDUOaE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Apr 2022 10:30:04 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 811D43DDDF
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:14 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id m22-20020a056820051600b0033a41079257so880321ooj.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Apr 2022 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6G3ijLKNyDDc/mZRGh4zwowxuAWJ+vKWOmhVh+DZA0E=;
        b=D92rmDJD0KLi8PP+nbRA/K0XqEuEn80VTNWbBt81Rfg5O5a1ewQidFesTzWNmqzT9Z
         GhxK6A/X/WXVtv6MROm+8YKVhOP2b/PsOVtx89NHcKRmyjjUwTWGUG6DEbRl6y5Qld5g
         zOnig7RNa1yVFFTndCAbRte8U6Tr6sPR6ByB4s159P1dvSAIittr5+RKh1pF0ztAClij
         WUh8Y2dKwEdguHR16gsYecj0084H23CkgUOSQv4VY15jKOYtEH/miiqmjB3UzZXRUa44
         YI/w3j9HS+jtfDj8F8q+WtjJtkJkxvShXvqJbyvlbOOJRXJbmV3xbyRupYC6fmYRpgia
         B90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6G3ijLKNyDDc/mZRGh4zwowxuAWJ+vKWOmhVh+DZA0E=;
        b=ju5RVAHfGnHYnEro0F4nJTVl1dobeLWABgdGU+tGy6QgCPHAOSXS/RQs+/bTSF7nG1
         DYrkx29N677dI57MjN22ASTeOymuavrlUfp2QXYp1WKcBlz78QAETotlTmgmtp4pFum2
         a7Ek6FABpCqf9GWx4Jx0DwG6apJM8jhwo8hQfzSHAoJkZ28HGXRvsTtHiuNOq9SOGOrR
         +0hlgxtZkbdu4ARty74auupVvHft2sWcl4kzFHGdoI/MiCkzUPPS3WS/LPwT5u58RlNO
         HRQKHJ96wlMmlbzd2ClM7pGCHBvvb4rQE9J+//25p/9XjWf3R+xGmSr6zZCdMwtKNzxt
         OVIA==
X-Gm-Message-State: AOAM533FslLNU/U8B7VGwTzJ1ejiBKF/tTOpSuCuqVtrNNhbayM/invb
        jYLMYiwrlZpL9nhcq7rmZWuV/X/7krttk5Fu
X-Google-Smtp-Source: ABdhPJwAndPn8oSz9YYQvVD+Cc3kcZRaN5Ta1i60rh7Uirxz3/EHFXiDCm3DxqOWSKiaZ+Jzw/Up4g==
X-Received: by 2002:a05:6820:1690:b0:329:a21f:388f with SMTP id bc16-20020a056820169000b00329a21f388fmr8886075oob.69.1650551233798;
        Thu, 21 Apr 2022 07:27:13 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s14-20020a0568302a8e00b006054e841915sm4296295otu.73.2022.04.21.07.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 07:27:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 2/3] arm64: dts: qcom: sm8450: Add thermal zones
Date:   Thu, 21 Apr 2022 09:26:51 -0500
Message-Id: <165055095989.2574292.12906303083204903322.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220410234458.1739279-3-dmitry.baryshkov@linaro.org>
References: <20220410234458.1739279-1-dmitry.baryshkov@linaro.org> <20220410234458.1739279-3-dmitry.baryshkov@linaro.org>
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

On Mon, 11 Apr 2022 02:44:57 +0300, Dmitry Baryshkov wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> Add thermal zones handled by tsens sensors. The definitions and the trip
> points were taken from the downstream dts. For the CPU core thermal
> sensors, the trip points were changed to follow the example of other
> Qualcomm platforms.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: sm8450: Add thermal zones
      commit: fccf8e31ac3d7c3f874ae5d78de495edaf1ead58

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
