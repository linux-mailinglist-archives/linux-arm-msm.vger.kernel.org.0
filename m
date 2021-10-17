Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2FE430A22
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 17:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344046AbhJQPdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 11:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343997AbhJQPdg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 11:33:36 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4D0C061765
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:26 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id o83so20955398oif.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3C1nfVxxpo8DEnKOn1vU+jAEnkcpspjoahSKslyTWpk=;
        b=UFde/uzVd9+iciFwxhwWxAp1m7BCmwShJjlCi0RYqiHld2RStpGuMjzqnvcoNILTt5
         7o1YjKgfPwCERGkUg6cnfciKxNPsFvQtZivhEQJUlhK2Jdkat1l+Su2mpKPTVj5TBTDr
         3fIr10IeupUMvAaYjsKRD9FYvD6eFFu0IZAO5YZpYJRUuzSsuM5AZtBudHU/3wxwxYvm
         +kLZaZoWUpRGoD3RjTHrRMkZWeMmZYnJcRKYC9BcfWiXBQFS9dQZjIoLXqcMrxwWff11
         AKDOac+hFPOdbratemd1rl0oW+I6SICEeN3YOkWg4ZJUZZt3Z8Knl/iGnBvdA+crtwGE
         3vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3C1nfVxxpo8DEnKOn1vU+jAEnkcpspjoahSKslyTWpk=;
        b=YKj1Rr24Nnk7r84rCzHMNmpBEgTF0xLsjFy6b0U2mckdnH6tvtKe3l5vihf1Bz37F/
         UyE8nZY0tjj7pXUgiz6BFDhCHdg9IGONqxnl6vJDko9kvKbEFtNzMLK7R6po3ziIQVpG
         Uf/iQTL5hWD0Ar8OYVQ8ogCMopPgcweQASZy0qxHpVfWxrPVNdlVlGEiOEDpuQeJcI8h
         ++M8L/pGMRlfYscZBWqSSfQCdfDDeBxhrW5R8vFZvgyCcNfzpKY3bLJ4Rt6lzw37eJRx
         S1GCl9F6dMxRjIOsYp7FKWxCkx1LAN+C1BdbAJMBhRMwtSEdLNKR1Bm/JIXGGCI4Tejq
         e1QA==
X-Gm-Message-State: AOAM530uQk/W0bI76GKeCCphOvT0oA20H8sW8X0gINvk13oNoWWkxaAf
        81bklN0jWmMJRRh/cvGBcm5T8w==
X-Google-Smtp-Source: ABdhPJy6/O7zvNOQxj+6AuRabQXfmIfqoU04TEr7dI4+SawtYpN0olrh8W/e6BQkSiigUOE+sYAsXg==
X-Received: by 2002:a05:6808:2388:: with SMTP id bp8mr8670146oib.106.1634484686376;
        Sun, 17 Oct 2021 08:31:26 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id x6sm2565698otp.49.2021.10.17.08.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 08:31:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mka@chromium.org, Maulik Shah <mkshah@codeaurora.org>,
        swboyd@chromium.org, evgreen@chromium.org
Cc:     linux-arm-msm@vger.kernel.org, dianders@chromium.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        rnayak@codeaurora.org, linux@roeck-us.net, lsrao@codeaurora.org
Subject: Re: (subset) [PATCH v12 0/5] Introduce SoC sleep stats driver
Date:   Sun, 17 Oct 2021 10:31:12 -0500
Message-Id: <163448466185.410927.1569159163846746824.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1634107104-22197-1-git-send-email-mkshah@codeaurora.org>
References: <1634107104-22197-1-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 13 Oct 2021 12:08:19 +0530, Maulik Shah wrote:
> Changes in v12:
> - Address Stephan's comments from v11
> - Rename driver and compatible to qcom,rpm(h)-stats
> - Skip reading SMEM for RPM targets
> - Make driver register in late_init to avoid -EPROBE_DEFER from smem.
> - Change size to 0x10000 for RPM targets since area contains many others stats.
> 
> [...]

Applied, thanks!

[3/5] arm64: defconfig: Enable Sleep stats driver
      commit: 551ed64388fd9a0a648eee81b534cd4765ff484a

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
