Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34BEF4A9F26
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377614AbiBDSfl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:35:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377585AbiBDSfg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:35:36 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C96C06173E
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 10:35:35 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id t199so9455001oie.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 10:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9RV37teyztSu6iIHbwHBJLzJhhsOEFaCSjrsYDnwiV0=;
        b=J2lKugsqqsOelxx23fM/UKwBhSyuYWR2M1TQizrHYD2ikrC+O3uKbZMn8oigUgzwlJ
         Mbj7KdLrI5pqax39QYMhRpDQPQ+CYCy1il3jODGgn9oYpR+NKNGNflAEJQEmtGuopejG
         2lsiPPfBE1Gu3d4YalRYes8TLex51pm9+/1FAgBypG44ZkbHc7dmMmAKu4lf79nbcqMs
         c/K+lj3rbNV397QFvr22kiKg7JNVQAxycXH4ZJaP8RWpniTiXirfCAXyi0BFY708xAE3
         lhFUxan5TeZpvr5Tywr6n0tUdDnu1lUsuuzEj+8xha+KNL5okhtcBdyZ0kjcdsrogOcs
         9VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RV37teyztSu6iIHbwHBJLzJhhsOEFaCSjrsYDnwiV0=;
        b=rJIdjbR6v0VB7+hmIeS3vS4iNZa75jvyHO97ruxyy/j56tfM3n/OzDcR3bcovL1VIE
         1EmhhQnrvdD5PQ5mo8/s/4qxWet54nSTX1yBefhsKv0L+OS8Y2GQ4mwURsU66XYN5Z/5
         2g1YAuq1EidBATG1EDjzB+3hTadBt0usoqSEkxLMpyYdmK8Os8DI/SGdS4DRjLc/3cvy
         Mri/+DSYP0XAUbM7zlHlkApvLyt6QLbrXltDIeJKmOmH0rFLb8ij6Dt/BdpjtKhoDy3M
         n2C8VEySIWAdkBHS9qpx/W4XI/BnAON4cw8DkbpSVKGyO+/vaLNRA0ktg8RseCjLYnO/
         8EBA==
X-Gm-Message-State: AOAM530MoYP8NQ5gemlkruHXISq6ViZZq5aqfMcXHEqs3gtp5wmD5mDX
        m8qOS25Ywc/6ddHXxucPE7P4+TF5ivBDVg==
X-Google-Smtp-Source: ABdhPJwLrqtdlHCDJLUaL8azu5O2edCBdodh/n7Kbm/AUBkzmQIRKBxs+HfB24R8haOl4qjl3/skrg==
X-Received: by 2002:a05:6808:1391:: with SMTP id c17mr132433oiw.333.1643999735231;
        Fri, 04 Feb 2022 10:35:35 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id 100sm1044182oth.75.2022.02.04.10.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:35:34 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Elliot Berman <eberman@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Alex Elder <elder@linaro.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/3] firmware: qcom: scm: Add IOMMU pool size and
Date:   Fri,  4 Feb 2022 12:35:23 -0600
Message-Id: <164399969244.3386915.6006488564118544541.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211208083423.22037-1-marijn.suijten@somainline.org>
References: <20211208083423.22037-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 8 Dec 2021 09:34:20 +0100, Marijn Suijten wrote:
> These patches clean up a leftover duplicate assignment following the
> initializer that already set the same values; followed by introducing
> two extra SCM calls that allow setting the maximum IOMMU pool size and
> changing the pagetable addressing mode to AArch32 LPAE or AArch64
> (per-context).
> 
> AngeloGioacchino Del Regno (2):
>   firmware: qcom: scm: Add function to set the maximum IOMMU pool size
>   firmware: qcom: scm: Add function to set IOMMU pagetable addressing
> 
> [...]

Applied, thanks!

[1/3] firmware: qcom: scm: Remove reassignment to desc following initializer
      commit: 7823e5aa5d1dd9ed5849923c165eb8f29ad23c54
[2/3] firmware: qcom: scm: Add function to set the maximum IOMMU pool size
      commit: 943515090ec67f81f6f93febfddb8c9118357e97
[3/3] firmware: qcom: scm: Add function to set IOMMU pagetable addressing
      commit: 071a13332de894cb3c38b17c82350f1e4167c023

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
