Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 958154C3730
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 21:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234529AbiBXUzK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 15:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234527AbiBXUzE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 15:55:04 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E98279477
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:54:24 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id l25-20020a9d7a99000000b005af173a2875so2216987otn.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IrvVABFS5etqsO4Q23dKzvCPtJmOIF0hBvQ4gEirm3A=;
        b=C6rrrzpeYz5W+MIX0MI3q9wlQzxpqGWNMehFQTXHj8AWDqrUHbkvK9oquxHx6Hf/Zo
         DcGFdoF34Jaj1KKdlQ/dDfaLsuKc5y0DrXX7DqytHRqZ3ai0XMEDqG95Pn1hdsPQQ3EK
         WMHgWKsYLN98tj4WX26pfwIViV6Kaeyry6Ti+NIEeX2YXQ6+8JaLw0BDIGdC36Db7nTx
         /uP+8iez3FbZrcS6NGOgV6Fkr3uUT4ll2lq64g2vCkjUoypstu7JsM2xsjt6lSacbvBz
         m1B1inWDwzheHVMHDJ5MKvCD2hpOFQiOJv3EP3jfWjC3db6r6HaKstmjlH1MEvmaXBSC
         jxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IrvVABFS5etqsO4Q23dKzvCPtJmOIF0hBvQ4gEirm3A=;
        b=4aYXTHUAse3ZCOxszVstH1jKk6yvBRhXsVYuff0JoKhAYP9ZHa6zxcqY77elg+RXcY
         EYbzpmikkZay+QxCu4MBTxAMAASAhg+1kvIiHnQ2epH77qWygySB3vqdGhK3IGgMnkQq
         O+QMqXNAEShAMFn4HuyIQRzdePZYeMESpmRc9eIRYsZyv+pAcPtMG2f5GtT4IEgCng8b
         wQgs1jPD7v6pq72962Ze2quaD3Q+woqI81l/mjsQ63ZQDsRpyMi5DfMHqAgFVvlHLj+4
         chge1cV4DXNsru7pTxn5YyqBR4tx7pDLiD1QVfibVfDesp5KK4LyL4++wsOrPx5ll9wv
         A43g==
X-Gm-Message-State: AOAM530Fb7IqYrPluJee6kHtOek70mwlHGCYsLEawpFKgBMbuSZOY72e
        z4ii/dE/TiFp9zWP2RZXwWvVMg==
X-Google-Smtp-Source: ABdhPJx+u47Sk8oCQnFYol8UefPcr8VrTzgUlUSNfHJ1i52MIm71NluXd/Few0A3W7gFMV80UZkLaA==
X-Received: by 2002:a05:6830:4126:b0:5af:b9dd:14be with SMTP id w38-20020a056830412600b005afb9dd14bemr1365286ott.366.1645736064217;
        Thu, 24 Feb 2022 12:54:24 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c8-20020a4ad788000000b0031ce69b1640sm191259oou.10.2022.02.24.12.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 12:54:23 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845: Add gsi dma node
Date:   Thu, 24 Feb 2022 14:54:08 -0600
Message-Id: <164573604161.1471031.18375061694907696431.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222041951.1185186-1-vkoul@kernel.org>
References: <20220222041951.1185186-1-vkoul@kernel.org>
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

On Tue, 22 Feb 2022 09:49:50 +0530, Vinod Koul wrote:
> This add the device node for gsi dma0 instances found in sdm845.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sdm845: Add gsi dma node
      commit: 29aed4b4eb992966f6f29a6a9885fe4357d604da
[2/2] arm64: dts: qcom: sdm845: enable dma for spi
      commit: 8f6e20adaaf34cfe1101f1b1bc9d2af01d05ee1f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
