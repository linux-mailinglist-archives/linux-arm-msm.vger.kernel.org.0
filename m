Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 244704A9F17
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377563AbiBDSf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:35:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377559AbiBDSf2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:35:28 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B26C5C06173E
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 10:35:28 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id u25-20020a4ad0d9000000b002e8d4370689so5594945oor.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 10:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KZ34fdHu8Q3424gbiZjFrV05OxGvkiCw9Gj/tnbBpXU=;
        b=mG5JZPffX9dhTRwJXtsHTFER/a2rf7XORYsrqgBgDNs/2xlmo3TXr+PqdjFzfy84R+
         1t9LitqauaO9Kt5qqaPg+cz2g1bvni34qPxjZWxPZU5Dn3CzrbKab9848/cq/LqYSW/w
         JNzmYXmDBc5eoMSW8cEx1DgeGhpeVxVZmd2f98iQtwMVRsYB/dEhl8+hwKc9HbXJe8o5
         V56qHuDXqShqancsRCCgreWyqWYpxrFWBrL5ZZCvgtV09wiFzHk6GEHOQ9Qo3sU9htVW
         GP6qk5gKYcPD16i9gg1g1ecVYDpcK07miRHrvAsgpE+tbWwynu0SbBCzXN5QEFNaPE4Q
         vqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KZ34fdHu8Q3424gbiZjFrV05OxGvkiCw9Gj/tnbBpXU=;
        b=6Brhln7D3g0C5fhXJX5V9CgF/VupoHQ6b+bYzbSyBUDeCHovR/RCKSlWd6o273Rojs
         VkyF7VLq/9J0zZWHXvRIJc4yzL8TJkqRqRvT9/qIugXCcplqWPEzfk+80nZCaZFa5ypH
         H8UlePd8AHX9uxDGzy1So7ihOWJpYPKiSYzKNLb+7BRx3Bujtpiyq85dGNc8qIUFQF1m
         ic0so/isqQ/h5x2yzUsRmMYGVHSE6sl5+Jytb8iAesJdPpfTFGaA8Yik0Q1rdYOPgpaK
         drhiVq2mO42wbMSSNrTPEA3X7QGHuuqxUZI1wT4R7hxCklmQA31ku3vuKAzRgkPI1/2y
         +g/w==
X-Gm-Message-State: AOAM533d3TDpwpjZinp5t0DchaWXnYXmuYTGsLkQXrVwmnEykBO+iK3I
        Z9uTWrIQtcLAIh62kG5S+2hilg==
X-Google-Smtp-Source: ABdhPJwYwe+/9ygm04AiGDLUcSTS24Yu4hEPP1GHPcqb2iD7c53MI/c1KwsZeHFnKB3l0CZ1tE2pXA==
X-Received: by 2002:a05:6870:d2a6:: with SMTP id d38mr1008822oae.65.1643999728119;
        Fri, 04 Feb 2022 10:35:28 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id 100sm1044182oth.75.2022.02.04.10.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:35:27 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 00/13] soc: qcom: mdt_loader: Support Qualcomm SM8450
Date:   Fri,  4 Feb 2022 12:35:16 -0600
Message-Id: <164399969245.3386915.6870326931875089818.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220128025513.97188-1-bjorn.andersson@linaro.org>
References: <20220128025513.97188-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 27 Jan 2022 18:55:00 -0800, Bjorn Andersson wrote:
> The Qualcomm SM8450 platform comes with both some smaller changes in the
> firmware packaging and a new requirement to hold onto the metadata buffer until
> PAS auth_and_reset has been completed.
> 
> Extend the PAS api and rework the mdt_loader to meet these new requirements,
> then wire this up with the PAS remoteproc driver and finally add the SM8450
> remoteproc instances.
> 
> [...]

Applied, thanks!

[12/13] arm64: dts: qcom: sm8450: Add remoteproc enablers and instances
        commit: e57f31b02784bdafd35940ea2592df8151ea1190
[13/13] arm64: dts: qcom: sm8450-qrd: Enable remoteproc instances
        commit: b48007d6d098dfeb57888c7bc50fbfb99e4e3695

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
