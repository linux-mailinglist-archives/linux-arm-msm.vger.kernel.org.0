Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1524A566D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233821AbiBAFVF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:21:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231947AbiBAFUj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:39 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41606C061748
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:38 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id r27so9033823oiw.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ps1e+VQnnTSsMLq4/5P81Kcn1XrEFf0BB2ryjWoMJuo=;
        b=BnEhtSYqBjIYXbMzvsWvMl+sEpm3PD0/eYyC4xteB2zIrHE+GPPYIXmoRzLSPScXa5
         4847hbYd+BrO+SfSxr5M97619Ym4UzgRdxJIhQ9Eig7AbABExU0UhtNanWhOsih4RtHI
         +XqmK2VVBbLARTs49gEqrcpKQX2wLNPYFQR46DykX6nFFiPSM9+qu08JZc8f7qcQWMIr
         m4enB9ZYem5g1zeAF8TKSAOl+uVXa5FkpgL6572QAr7jBfVCubwpxasuV9igOMZrbL/v
         1KXxDOPLsRw8vOXiLgXNu4RcbbQhp+tr99WHu6S3hMiF9V53w5XTZs11AGuTYIc2ssSl
         lIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ps1e+VQnnTSsMLq4/5P81Kcn1XrEFf0BB2ryjWoMJuo=;
        b=iiclxs6EhDg8aMiXGY6d0ZzPT+FTkkm2pfOin5nUoRcIlrJfOP1JZ0BCXu1lzqpJTL
         Bo3V0j9oPms4Lc055VxmXCaGNS9fuNjdc78irJs5H+CIbWpRmxK4ozVJ5fHlocfv+P19
         fNU3NWCfSvXuhsikbvjjRG+oZgqHWy/s0OIe/dAPG/csrjxszt/WHYg9V9kCfwVw7Avx
         OVcgOtcAeqaUzipJILPzzoExTN+oLh78hJLCvM2Cy9y5MrpmRnhM63dYB0r7xzXUrIq0
         nAlOBPorVieEGYqfGslOtCuotMIxibrq6KpQSffYl4e9WZLUwbCrqVZSn2NMB1QedDuQ
         SSyA==
X-Gm-Message-State: AOAM533PwdU7fDiwRmpsrJGBUlcyQngViVxLdJdr6vY2/TzuHY+uRHHV
        GsnDxv1SZwvbeVoo5b1DWSUzbw==
X-Google-Smtp-Source: ABdhPJzm0fT6gwPIFSSYWo0QVpml2FrhvY6/ztxvMkCcyJBHD6a71/NEIIudSOve83/4eOrDLHN6XA==
X-Received: by 2002:a05:6808:1a8d:: with SMTP id bm13mr219320oib.152.1643692837657;
        Mon, 31 Jan 2022 21:20:37 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:37 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] arm64: dts: qcom: sm8250: fix PCIe bindings to follow schema
Date:   Mon, 31 Jan 2022 23:19:46 -0600
Message-Id: <164369277343.3095904.738892748466471300.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211214231448.2044987-1-dmitry.baryshkov@linaro.org>
References: <20211214231448.2044987-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Dec 2021 02:14:48 +0300, Dmitry Baryshkov wrote:
> Replace (unused) enable-gpio binding with schema-defined wake-gpios. The
> GPIO line is still unused, but at least we'd follow the defined schema.
> 
> While we are at it, change perst-gpio property to follow the preferred
> naming schema (perst-gpios).
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm8250: fix PCIe bindings to follow schema
      commit: d60507200485bc778bf6a5556271d784ab09d913

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
