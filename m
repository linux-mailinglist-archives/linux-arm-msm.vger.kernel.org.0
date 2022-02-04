Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6009A4A9F24
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377609AbiBDSfl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:35:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377572AbiBDSfg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:35:36 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8155C061741
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 10:35:36 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id y23so9448573oia.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 10:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+YeDXrSaTsKwJr5hwLf03qpBrP3hJgVmDGEXVBjwbhI=;
        b=PlZFAsHZLMruSJWk1AWXmQ+99gk5cBjkuT3quRp1oYR9aG1UGnZRj0+bpQyjdEk4Yl
         EWhxJtzfj20YkkxVCdgBrGNgE4GLN7PtvAuYvZxvR3aecqH5FWgreQBKJc8iiLTYEi2Z
         nhOHAhBcCh0FyCAKU3uKbB/tArrpH4DM2wnaUthU4ZuUi/OWgrTHt9J0oG/dQjXnYvM5
         dmibNKHl4SA4/QbRuvXF16CXHBQOM3rW0CWNkb1uDNSCIr5wJCnM6HdP86kFoFhp+5iB
         uL7qD2MSqSqkAqiCuopRag+owLL55ShjaAcInERKGCnXnyAsNfQOJPSlQlQvomKY8nQU
         AOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+YeDXrSaTsKwJr5hwLf03qpBrP3hJgVmDGEXVBjwbhI=;
        b=A/QmYXxkJ7qxnx+IBj9S0+aT3QzpAcp44wX+VNe2EwjFyaBVW7yxApMFQcnes9TgSh
         6Wc0TeYzqZ3XbtC2G/cQRIT1uA4+EFo8EYJHf/Ozz2DdRvWBBuMKWpSddNepWLU5Jnfd
         KRndAdEmM9z+0r3LGpuZCjTlsMd3ISFC9XrsXj3wQnBYvBOcvOUqMR0l23rKK4vlayLV
         zeiHyHhkyrtEczHtLjirsSqXRUKDSk+e4EEBYygcYYWn+lo8nnfLRymJ3ZYnvTeU3h8T
         hSYpLIwSEWZ/jemZS1Ay8Rg8TQHgXe7Wam6r0i23JRL5B9tS3vifgl8sz1xggfTLS5yc
         p05g==
X-Gm-Message-State: AOAM5317mLmK8CFBWb+vW0xoh5D463Hxgs/ACByBQEjfjtrvpGEpEKdL
        PwTeo9GBApmEWIaPkTInOkFDeQ==
X-Google-Smtp-Source: ABdhPJwetBAy+jRJO/nh7qxpk2M6EUaaEjGE8HhDLGzjXVOKLj4Yu4nQDAGoJDbGBFGIxk+LR5kCKQ==
X-Received: by 2002:aca:a891:: with SMTP id r139mr2017231oie.337.1643999736169;
        Fri, 04 Feb 2022 10:35:36 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id 100sm1044182oth.75.2022.02.04.10.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:35:35 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-pm@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 0/4] qcom_scm: Add support for MC boot address API
Date:   Fri,  4 Feb 2022 12:35:24 -0600
Message-Id: <164399969245.3386915.4570233686283734930.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211201130505.257379-1-stephan@gerhold.net>
References: <20211201130505.257379-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 1 Dec 2021 14:05:01 +0100, Stephan Gerhold wrote:
> The "firmware: qcom: scm: Add support for MC boot address API" commit
> was reverted again in 5.16 [1]. This is a new attempt to add it back
> with much less potential build problems.
> 
> For that I first simplify the existing qcom_scm_set_cold/warm_boot_addr()
> implementations. The idea is that cpu_logical_map(), MPIDR_AFFINITY_LEVEL()
> etc are not needed if we just set the entry address for all CPUs.
> Nothing in the mainline tree actually requires setting a different entry
> address for one particular CPU and I cannot really think of a use case for this.
> 
> [...]

Applied, thanks!

[1/4] cpuidle: qcom-spm: Check if any CPU is managed by SPM
      commit: 0ee30ace67e425ab83a1673bf51f50b577328cf9
[2/4] firmware: qcom: scm: Simplify set_cold/warm_boot_addr()
      commit: 7734c4b507cefbcf2f7a2a806e79c43e52528c5f
[3/4] firmware: qcom: scm: Drop cpumask parameter from set_boot_addr()
      commit: 52beb1fc237d67cdc64277dc90047767a6fc52d7
[4/4] firmware: qcom: scm: Add support for MC boot address API
      commit: f60a317bcbea5c5b8923d6de6c7288850fdd83fb

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
