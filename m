Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0422F4A561D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 06:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbiBAFUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 00:20:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbiBAFUI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 00:20:08 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B9DAC06173D
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:08 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id m10so6177206oie.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 21:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6CQJAF3aH8lfYp0bzeYY2RdYRUlGfNg+KYmMYRTkV0k=;
        b=rFVwUYojxyqvXvc5rNwUP/lfl9p/kHDEVH/cvgJgyFk1aC4SRuyeV4EdeJtuvd6ZP+
         yUAHSe4TzfylK9fWLCOVoy/AdREuTD/CdmZQAeNCldFw+WCYqgLrORlLAqSXhx8KW7X6
         kvuFXnBVsFIAoHaK2kf98Ibmen+fKWOrhPCb/6+iceJZuIo5rPsMhnzoEekobpheW+f7
         vYw3C5tu/JJy0tysMj/YrEbG+kpWTU2yP/kOuKUd7omUAyRJUhMf3c5hLa7yov2xbT1L
         unRPH9+0IvnO+SXfMPayFHlBijib5HLF84gJ9Y2yHAjGsAvGoTenM7cGEe0aE7cizSH3
         92jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6CQJAF3aH8lfYp0bzeYY2RdYRUlGfNg+KYmMYRTkV0k=;
        b=OUaZ5g9wgjv08aXPUcof077KXEgu2ntkH2ZhvyaK9uZlPWEZDE69IsA8D4JhlY52t0
         S8AI+65/BzpaVSisDghE5LECPEXVYTaNGcqGSCsffXI5alneOw1cxsplQRkqqrDl42F6
         CmGmtVqIzsv0zT0zmzBjrhOo1ASTQfWzGnsV/L9Ga8/CCYWxfn4mGiLZycNyY/OWiKfj
         szc8RgERhAJ262runUO1YSV16FB27x+o5AvbE7oQzJfqPjng2Eb7FuUGBaPB3VClyAPK
         n32mxKVF/xl3RuDQKRRV0aLyQMaITQM7XF0AdZfPtUUDcNNeFXcp/pzDPYGSsNMsO0aI
         RF0w==
X-Gm-Message-State: AOAM532v82I3uOGkXiZUY1NZfX4rYhdBqJ2FM0K2xFS7yQU808d1aVqb
        B+sQos18EDpALW77/fd2+xEXfQ==
X-Google-Smtp-Source: ABdhPJyC9U0WiH8CSSZ1X2nXwzcRTvjRdIQZkk+hMsplJkvyZfcMtIktmhvB/7/YqzLSH3QBcKkuog==
X-Received: by 2002:aca:398a:: with SMTP id g132mr203059oia.207.1643692807848;
        Mon, 31 Jan 2022 21:20:07 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id u3sm8193107ooh.19.2022.01.31.21.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 21:20:07 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>, Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: (subset) [PATCH] arm64: boot: dts: qcom: sm8150: add i2c and spi dma channels
Date:   Mon, 31 Jan 2022 23:19:17 -0600
Message-Id: <164369277343.3095904.415765092006433725.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216124348.370059-1-balbi@kernel.org>
References: <20211216124348.370059-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 16 Dec 2021 14:43:48 +0200, Felipe Balbi wrote:
> From: Felipe Balbi <felipe.balbi@microsoft.com>
> 
> By listing relevant DMA channels for the various QUPv3 instances, we
> can work on adding support for DMA to the respective drivers.
> 
> 

Applied, thanks!

[1/1] arm64: boot: dts: qcom: sm8150: add i2c and spi dma channels
      commit: abdd4b7a7a70b861c77151afab23880b5f80e9bc

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
