Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44A54A5692
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233763AbiBAFXJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:23:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234333AbiBAFVA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:21:00 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F75C0617AF
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:53 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id m9so31143884oia.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8eJDK8k9PLNksLwTNgF92CJDyZen/m8QxzhQHEelcXE=;
        b=GFOMq8d2CVyMLlstH8xW5YydCafbemE7NlZGGPOcShD6VWLjEcI/dnZBq/NB9TNatM
         3LifrHzPJQgC48TyqnweQquAx3hey6etHYR+cOZkJR9SRdPIybZbR3yuFhlTYxIWCEXO
         ZzLN3dtuxhceef1o+Pfuh0vlL1L+pVOaVp6JLRWLaT9SlKJmTySTTql/rQu/69GjXYwV
         yxAvQ0ZbS4EDaBQhrRzGoER33FFClhuYLfyyMG1VN51u+XovauH9yNBnrfx0BXw6/4SU
         PZIFui3OV5b/kZKHvosmnXmMAt2cHdK8Fr1tgEC6weOlgEKZpmD6oI2HEZV1EV33M4vy
         +nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8eJDK8k9PLNksLwTNgF92CJDyZen/m8QxzhQHEelcXE=;
        b=DOpNZVerlsG2RXoxSBl0svzd95fA/Bs5EEu+4gDWWDzrnXO1YlQEgLfd0LIfV6+9J0
         /LllQ8HbVsZyUglzPyFmSg9ZTbGA3CIYCG1gUoZah+YGSi2dEcQx1g9K/QfIT6tFuHPx
         G8r3VtGgPYdNVj+mn2WrA1DfTEoQOQxiGyo5V+noudBmbdtric5ASyCN5TzLXuTyEiCK
         lG3glkgtLTNCYSXVG/zgeM2JNkO9bVW+dpv5GzlRN/zdL5zzHxjC4K7EQ2H8thSKOpyl
         FF6gJSD4hOSJwRAfkTjiYE0dL3BqP9t0Vy9ynBecWwEXOw4/CShJ3787Gb88167Zf2MS
         LwGg==
X-Gm-Message-State: AOAM530I64XMQ5T/ycPZS8SJS2795gS+dF4gZw1pcX24B8kHfyHqmlTE
        fikZCM3bwrXP0LjzOQXw3r3rnZdbpzBz/Q==
X-Google-Smtp-Source: ABdhPJwcWntPtAK7lvVeiFgffQtfCps0k+8Sz49Jrk8SUZwiZTu+lb9zhlJtFVDSpQdtPAeOMyaCTg==
X-Received: by 2002:aca:59d5:: with SMTP id n204mr208977oib.291.1643692852470;
        Mon, 31 Jan 2022 21:20:52 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:52 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     devicetree@vger.kernel.org, agross@kernel.org,
        Robert Marko <robimarko@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org
Subject: Re: (subset) [PATCH v2] arm64: dts: ipq8074: add SMEM support
Date:   Mon, 31 Jan 2022 23:20:02 -0600
Message-Id: <164369277344.3095904.15034660056285619770.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220106212512.1970828-1-robimarko@gmail.com>
References: <20220106212512.1970828-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 6 Jan 2022 22:25:12 +0100, Robert Marko wrote:
> IPQ8074 uses SMEM like other modern QCA SoC-s, so since its already
> supported by the kernel add the required DT nodes.
> 
> 

Applied, thanks!

[1/1] arm64: dts: ipq8074: add SMEM support
      commit: 42124b947e8eee401b778e9bdc5017d205ad8b71

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
