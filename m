Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C844A563C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233705AbiBAFUT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233757AbiBAFUS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:18 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C19AC06173B
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:18 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id e81so31207654oia.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iqXAaV/sPDogRgO8dgQ79brA6tX8/SxUkeACdNnwTRc=;
        b=z3Ld5S7HRkhH+JkXb8FKdtUI8jaXIhbfojWq6SogY2PfXKIu4IjVKAIMdsXQwrWoum
         L+hEffUMI7gSoyUEwojJ+b5ZiDGBkrjMEm0qo/ed4MQQgc1lOzQyqi5BHbpnP8Sig4uv
         /lSHWQZFniodLHwshGTDfAdor/oPOeO1HepZNPwuPYzBEPOrR6cHK5PCBYOcuRsbmd94
         N3bg2zfXf6vW5FPFAQemDWAOqpqgLtfK2ud5tyzRlue10nLtSYBbxaPtDQzUe8frKcEW
         /B6yO7NVIac4OvCoCPY3cmsnfkckZCoO+CGpsP7YE4RNQW86XDYrX6o7KaoZhB+sHBMz
         thEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iqXAaV/sPDogRgO8dgQ79brA6tX8/SxUkeACdNnwTRc=;
        b=iR7iTrQiqFJPc9fIrdkNdzi3/2E/x5UqdLHm1XOMcRMHz0yydza/+726FF+/sDyz3U
         6xquLDsWsPKumOjlO7UiZ28CIJL5KwOTkSH1/bTXhidoIQkE94Bzld1vDg9HqOFqKI0l
         FAajH3T+yvhWEVh26SmVNQLjOuCThCKOXQMYpScexcnyh/vUVQx7c50Wzzxgjmubw1ca
         JVZRJyFoxB9HuC1zjKYCG/9ASBBIvAqtzL+iLVI81Q6z3/rDbyl8cePCtDOSLwhgyRiH
         Wa3nLXc5Qcq2wv6q208IikfRlsKPGL3YGrqG9gB657J7qkqmYE2bjSYHm/ppq4ZSVwlx
         ke4A==
X-Gm-Message-State: AOAM532DT+zPYr/xd94+woClmtKEHItjcRoRb13lj6RA/8ECcpiPeZOx
        d+fOU1pyHT6m4kT9kET9xPI+mg==
X-Google-Smtp-Source: ABdhPJz4u9CdSpFEHQaUUaDVrqjOjOxTRkAQBdqK7nmVb20LLUegRW2NJ2TzBvg9+3M4J4fKkV8IWw==
X-Received: by 2002:a54:408e:: with SMTP id i14mr232260oii.200.1643692817657;
        Mon, 31 Jan 2022 21:20:17 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:17 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: msm8916: improve usb hs node formating
Date:   Mon, 31 Jan 2022 23:19:27 -0600
Message-Id: <164369277344.3095904.14409216810722485264.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211229193731.72690-1-david@ixit.cz>
References: <20211229193731.72690-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 29 Dec 2021 20:37:31 +0100, David Heidelberg wrote:
> qcom,init-seq registers are in pairs
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8916: improve usb hs node formating
      commit: 640e71aac554c70180a9b4faa455e80a58fb369e

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
