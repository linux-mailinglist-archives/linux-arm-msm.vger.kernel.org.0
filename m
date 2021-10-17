Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E127D430A1B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 17:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344006AbhJQPde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 11:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344001AbhJQPdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 11:33:33 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99CC4C06176C
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:23 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id n63so20964901oif.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVXuil5pX3WidyyEtr+Pu7sZDx46PAXtxLYKzsKtPpE=;
        b=SYoRu3tCbHM1ZmdaqVMT+vsxsyLx3XvnMXS39STfOBydF3efa1XTiCz7XIK/11ashg
         dACh25luS+ctQbfiQoULkypg953pBBDloxiwryiw/u/MvtgGYpAsvKyzhB1I45xjOYWY
         TOqxEAhnRd6kkORfqQxwoF1I1aAGRQw/S3lXydH6efTfDmq9b/jovHdy7p5cgAm7w77V
         zhquAjDpJ0uZARDk8Q9rJWPbLuIufryKoVz5cs+tEbolQhzuSxLcCE4qOn5gGv0FLMiF
         0e3XZvJGluRldNl4/OCyPjBKe2fGxO8LhYUjcGJ4rpswh1pI9sVfzPCAP7VRHIGE5Y2B
         4x4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVXuil5pX3WidyyEtr+Pu7sZDx46PAXtxLYKzsKtPpE=;
        b=CV817f2XPQ5SRXIk3vN/2ROBRaHHIle5wQnWJtQFQqgxLgLdlilR0AD5hQjjjFo5Xn
         Q8MLR/zyQNzSqZl3e0TRaQYtPKGgCwpPXHBFRXVmyMNLsTDGovAmgsfWZEFYApHjlnKu
         OqMhzXYoZBGU/WR5w37srz6fpmFsJPSsX+B8O6b1c3ALEI48iIx8eQq0FfATJHIwENEd
         +XRTY0c5ViYXw05Macr92/nII2RYYUZzeMWkzBxjt12oUw7hYsDKyrcO8mBduFLxNaAC
         0Dgo72poYhIFNu9+blTKCyYgeV9G22UZbVXKSa8r55G2beNp3/bJEgCye4CNgD7WRN8R
         Yn2Q==
X-Gm-Message-State: AOAM530bdLKBRa+Q4rbCPMfrjzh0CGYzbThanTr6lgXyBw4o6wd5T88+
        4nTa40OCkjCT6vCoSBX6115YzT7F0ZmK1g==
X-Google-Smtp-Source: ABdhPJw63ytioosCIeet116yJMi0GvmfR1fogBQnw2mKRwKhiZObmhENNul2MeWb5KV0qiQpJOqYnQ==
X-Received: by 2002:aca:41d5:: with SMTP id o204mr25884414oia.41.1634484682970;
        Sun, 17 Oct 2021 08:31:22 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id x6sm2565698otp.49.2021.10.17.08.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 08:31:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v3] soc: qcom: rpmhpd: Make power_on actually enable the domain
Date:   Sun, 17 Oct 2021 10:31:08 -0500
Message-Id: <163448466184.410927.4981582823879350464.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211005033732.2284447-1-bjorn.andersson@linaro.org>
References: <20211005033732.2284447-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 4 Oct 2021 20:37:32 -0700, Bjorn Andersson wrote:
> The general expectation is that powering on a power-domain should make
> the power domain deliver some power, and if a specific performance state
> is needed further requests has to be made.
> 
> But in contrast with other power-domain implementations (e.g. rpmpd) the
> RPMh does not have an interface to enable the power, so the driver has
> to vote for a particular corner (performance level) in rpmh_power_on().
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: rpmhpd: Make power_on actually enable the domain
      commit: e3e56c050ab6e3f1bd811f0787f50709017543e4

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
