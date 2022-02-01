Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE2D84A5678
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbiBAFV1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:21:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234139AbiBAFUm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:42 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA73C061765
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:41 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id v67so31180858oie.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j0Sm1ybUCneqTyIY3hidk0w03V7qLnrgIwlToVmhPfk=;
        b=Pzb3k1+JIq+2MtOA0yqBbzVwZBnQYEBpHyhjklmMt8N5J+ryFJattL5mzQqeLtM99O
         Xz8Ljuo8N58xOUt1a2iNLKzCRIKlw6Gp3nUW5TdG3nvdnsnnx0XsnM0ZjcYUigxdOg37
         5yxZpmL1pKnRAr2OxWWtDyLDT8EKIDzxZvkDpGMckOyc8r733d4WoHaeND0zHOm2nA7Y
         yk7xYLdc4HN/IjtcvpyigmFQjP3o4mE17I9yURofnAI1y8kwNHL+7RqkQDyZyCR1yR5e
         oi1klMPslB5ZuP2P4pnuroJQ3oCXsGCnRbQO/aSFcdkZCzzajwTt52o40x0Y+T82X+68
         4Ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j0Sm1ybUCneqTyIY3hidk0w03V7qLnrgIwlToVmhPfk=;
        b=qQ0VnEPW+uQ0tmKezbqTL2E1YQakP2SMr9a7rXCtJYb4/d59/wIMgesOvemFy4x7hg
         QhzvFnmdni9EoQ1y+e8I9nxrvI/npjT7+I44udXAsvC0A+E9jgleosIEqTFZj+YP6jAV
         O+n9dP/mbyN91AghpvPMT7v8S7Cpj5deyadK8tVaQnQOKBRJUathkik4wn1x4teFot0J
         Epwmoejb030gC95KQUuv+BS5+zHBEj6xVJbKr4G5uCW/glYRYW2ohIh3iZzt902U8BTk
         Px3g/ZIcSRNUKX9UzfoZzji/BGPsKbip9mgQnbqaDL2Ip1jaARBOkfx8r7RpRA3OCicQ
         kSYQ==
X-Gm-Message-State: AOAM533b9gHch4kinL1ut/XYQ+9JF+BfMmhogCD5t9Blx952WaVGUO8D
        lLV0fj1ZwGhbk59bN94cmxT4Ww==
X-Google-Smtp-Source: ABdhPJzhttDk/Frhf6kwxi5jgwfK1+KcsTYNHkagbvFNpx/3R8LTIGq/HpRA2IBGC+i3sOz9sSLnMQ==
X-Received: by 2002:a54:4486:: with SMTP id v6mr207711oiv.121.1643692841329;
        Mon, 31 Jan 2022 21:20:41 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:40 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8450: enable GCC_USB3_0_CLKREF_EN for usb
Date:   Mon, 31 Jan 2022 23:19:50 -0600
Message-Id: <164369277345.3095904.13835466857141707804.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220122162932.7686-1-jonathan@marek.ca>
References: <20220122162932.7686-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 22 Jan 2022 11:29:31 -0500, Jonathan Marek wrote:
> USB doesn't work at all without this clock enabled. This fixes USB when not
> using clk_ignore_unused.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: sm8450: enable GCC_USB3_0_CLKREF_EN for usb
      commit: 197769fede5824d218f1f13f7620243015801d81
[2/2] arm64: dts: qcom: sm8450: fix apps_smmu interrupts
      commit: 7baa00bef336254e2cea5d4b064afe6430a05309

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
