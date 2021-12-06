Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38F946AC17
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 23:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357042AbhLFWej (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 17:34:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350545AbhLFWeg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 17:34:36 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB9CC0613F8
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 14:31:07 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so15552247otg.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 14:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jkNu+sQQbh1svj1J5HVeOI6+nZbkgVsWxvs2HPtP1gE=;
        b=tMqNifmRP2/MDZVb+WKj4dZHTW6MnFtMhl0/J9vVCfKK7DUvQMJLTnH9IF4eACd0tR
         ZR0buatTHPr8Cxo9bwgYUw2Wv7Ic9kYYFQkuCXzMDC+sXBVnr6K+rvj+BY9IQ/JvKnMj
         LQ34QsNPLPzMb87Qf0DSU2CXhDgqohy8iheCamh0ywa7eAYRRDL/gS6zbpZht1JfahBO
         LjZlG9a4L7qrIkX8mM50FviwQ/1o6cO4hYDJGEdJZeHrSAha7ENrUy/7HvGo8+UMiCKp
         AK6xZ+ZmZ1qv/ivta/NExnu58Jngb4j6Eb1kThUhSyHJW1FlZI4Xg0pToWtU3jhRVjUI
         2Ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jkNu+sQQbh1svj1J5HVeOI6+nZbkgVsWxvs2HPtP1gE=;
        b=t237bnrBzhLU+QW/ByRy9fxIflCT+VZkaST8AAvI8s1xpF4UuNTmvPH10bv6il8HfW
         mTIItlqopzy+EZ40vSSVu7MSeis2lQU9pbXMD3/OlrVMil/0M3tRPy5YLE6yLQJSACuI
         WmbYkbSwff+HPL3d3vDz57e+uIRzZKlEcposQcGK85+YoTuv9XcAL+FJwiA3me0J1C6W
         NaydlyPkPKzfRs6ClNi+LhJrMriWSPmDVgKTafs8j6WrqoC5gDixnUi7XMrmosXTXnH5
         0UloGAzG4H+u9jSaalR5sODO1sOTF8RRGrcpYXj95xMnpQB62HnEorr9BYSTpDkQUL96
         mrxg==
X-Gm-Message-State: AOAM533nWVXdWUxtBYK2ZSt1n1YvQDzOQpTOewcMqB/6roDE2vRCNb88
        LgwE5wQLKv+G++lnYtNNbAeZlw==
X-Google-Smtp-Source: ABdhPJx2habeMBrNnH673Vh0EbGU0tPpCEpbdTe/asjlJFah/h8O9snJTF3rDogED62rmSbLM6969w==
X-Received: by 2002:a05:6830:4d1:: with SMTP id s17mr33185913otd.246.1638829866810;
        Mon, 06 Dec 2021 14:31:06 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r5sm2911815oiw.20.2021.12.06.14.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 14:31:06 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, tglx@linutronix.de,
        agross@kernel.org, quic_vamslank@quicinc.com, robh+dt@kernel.org,
        maz@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        manivannan.sadhasivam@linaro.org
Subject: Re: (subset) [PATCH v6 0/5] Add GCC and RPMh clock support for SDX65
Date:   Mon,  6 Dec 2021 16:30:57 -0600
Message-Id: <163882985136.2324147.510083114560044799.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1638402361.git.quic_vamslank@quicinc.com>
References: <cover.1638402361.git.quic_vamslank@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 1 Dec 2021 16:21:30 -0800, quic_vamslank@quicinc.com wrote:
> From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> 
> Hello,
> Changes from v5:
>  - Collected Vinod Koul's and Rob's Reviewed-by for the patches
>  - Rebased on the latest tip of Torvald's tree (MAINTAINERS: co-maintain random.c)
> 
> [...]

Applied, thanks!

[4/5] dt-bindings: clock: Introduce RPMHCC bindings for SDX65
      commit: aa848c8ee8915b2a8c973d90f1c7f8e96d17fd25
[5/5] clk: qcom: Add support for SDX65 RPMh clocks
      commit: 40affbf8e615addd8cc877f0a4fff1faafc4bb34

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
