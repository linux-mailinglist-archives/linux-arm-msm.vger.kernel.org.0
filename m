Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39E7F45812B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Nov 2021 00:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237929AbhKTX7Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Nov 2021 18:59:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237869AbhKTX7D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Nov 2021 18:59:03 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3407EC06173E
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:59 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso22820259otr.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Nov 2021 15:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oRs8pcHKzOwFtwPnpI03F+5/gUi86PgkdSbR6nGBFkM=;
        b=CxagGW5ZekzTojU1lIx3gTcSghwkqNe9lzfiWL2UWcrNsgOUurdc5XVSl+oN8myGqh
         eP75utnqLpcAtLva25ixq78/4bdfVWyHFkS9f6kVlJmAwIvIsmHrnwENj2E6XU59aZUc
         6vJJgMA9OmC8LxQBJk7iYvi4mq1DuCbJMnMMm6+2ghrv2c2OKB7wyl5poUhplqnt1ewL
         JCChqnODMho7hBcL9lgaFohMQWGtj934EoxWluPO2m0JjZ/u90Wt5k8OFrr+lt47Qm4x
         mqD0/9XOQCXJVRxNQaifizboJb86U8qRxIi7zDu7G4MJEQ3u8J4OhR1EYmsFSEl6bfEA
         d5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oRs8pcHKzOwFtwPnpI03F+5/gUi86PgkdSbR6nGBFkM=;
        b=1PYLPYpSol7gdQCZy+GGczqkqKJOiOCkkU7IhvqMpoewTq8tRxrP3UqJQDbIe5itIk
         nw74DOtFrhIODz/CDW5m+gQUFcnet99fT9+Q0ef2OdP/0Xkmof1xM/plDgiWt0npZRuf
         EPmykL9f7fF7ogIyt4aRwei2UXWKeYrQFXxucfz8/dXoBKbG1X1wOVdimp9LziPuBzQe
         sHOqixshFYsPeiXeOhhaKhrOBRpiTt39isoJlK3P3hqF1pprWLh6A4Dr/To5JqalBE2X
         k94oYWaiDeZHqR0T6cFnIRfEIi4cQrm2OhB/JHBOcl4RnjulfzjkuN7DkPwqsgSlddpX
         5syA==
X-Gm-Message-State: AOAM531/0s46VajeGKsIlSoA8tInN2j8zBP3b0emJZ7o6n82Tgho+wNZ
        /fOEEo+y8eclIWX+ur8BnNhC7A==
X-Google-Smtp-Source: ABdhPJyYeQOEFimNkd2oZh4dMcyaHGWumvrwEDBmumnooECIxqBGJOs+UHcpSCDrUmYfZ+l17V4ahQ==
X-Received: by 2002:a9d:6b81:: with SMTP id b1mr14468443otq.12.1637452558607;
        Sat, 20 Nov 2021 15:55:58 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o26sm828474otj.14.2021.11.20.15.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 15:55:58 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        Arnaud Ferraris <arnaud.ferraris@collabora.com>,
        Andy Gross <agross@kernel.org>, Luca Weiss <luca@z3ntu.xyz>
Subject: Re: (subset) [PATCH] arm64: dts: qcom: Add missing 'chassis-type's
Date:   Sat, 20 Nov 2021 17:55:34 -0600
Message-Id: <163745250541.1078332.12455510280552513237.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025102224.23746-1-stephan@gerhold.net>
References: <20211025102224.23746-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 25 Oct 2021 12:22:24 +0200, Stephan Gerhold wrote:
> Add the "chassis-type" to msm8916-samsung-serranove and
> sm7225-fairphone-fp4 that were posted before the patch that added the
> chassis-type to existing device trees, but merged after it.
> 
> Also, looks like sdm636-sony-xperia-ganges-mermaid was missing in
> commit eaa744b1c101 ("arm64: dts: qcom: add 'chassis-type' property")
> so add it there as well.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: Add missing 'chassis-type's
      commit: 0112b06fde557d407c0d477ee7ed973e44e65c75

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
