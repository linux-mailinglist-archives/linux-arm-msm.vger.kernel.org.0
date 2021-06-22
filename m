Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB553B0EE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbhFVUkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbhFVUkZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:40:25 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B49C061574;
        Tue, 22 Jun 2021 13:38:08 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id hc16so362105ejc.12;
        Tue, 22 Jun 2021 13:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3eHW4g0M+AtLmkacetNHIg50NRsqFDHflmrAnbT9il8=;
        b=flVMOnNjJRyPppFooo5QIN/uNAstzkdl9q4zMNTVmwoYaX1twIO7XvbX5KQChzW7GS
         KH+EZVhgYgfVbPalrDjvH7hkYg8Ig0LSCZAGl8TFcefcSv0oHWxz9M24C/MvEcZrWIqk
         i94vIVpoqGSANjgbm193RtuZ4kBI10TvMkE9uiYATQKinlb7wJ4WmDBNHSlSUXXJnCv4
         ZzVkb60tB+O0qH7SJhPjP9UAbmzlfGXxGajYupO7vs6mnDdu+1bE/1hm51WppeQQKaGo
         DDmibUEIKdewZ5kiYqJjn8khQOpa1fZ/+oMlRiNq+Hng0XFWby7GOiR7NldbK9BFHt4p
         NskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3eHW4g0M+AtLmkacetNHIg50NRsqFDHflmrAnbT9il8=;
        b=gkpk3xqOiG/mjBCkVPUwT9LpaY6THB944NgEIju0pNhwW0mveCI4JJ5BE1Yh3+0eo6
         jQ88xo3LSTvoKLSSe3Jb0VPK6MGYeq+cS0Cg+PuyeVEfg+Z71CfCrcUxqDDWqptCEtxd
         wGGUQBD7LQ8HDFSNfC9QVvD7IJCh9cNE/C2PMMD5/PkRm6J1qZv3c7JpGT9Agl/iAa0a
         jX9QZCiV1kiraItZK+nIoHT2wYQ2A4k9bqCYEWmhZyIvUVynpnBmdG6lKVwqMuOKUiH+
         3DFMCTyeyJEjtHPZw+9EzOhPBjkuvdZx3gw7V2YIyB4qMRL3+LMXbTzlXRjEVZRPnnMk
         hxPQ==
X-Gm-Message-State: AOAM531+eK+TcRs+vGqM8U0BNMHSUecc1avfXuk8qQP9lykXlWZg52h8
        1sqRF6OwpquM0rMFXMs1PyQ=
X-Google-Smtp-Source: ABdhPJynHOmJhiqJUTvOS6tHqbMRixF8LIO7dqBT3McCL9Z5zU385sROGZchDxO6GRFyLpZCYV7atQ==
X-Received: by 2002:a17:906:a3d7:: with SMTP id ca23mr6057062ejb.176.1624394287273;
        Tue, 22 Jun 2021 13:38:07 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id ck2sm3939813edb.72.2021.06.22.13.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:38:06 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 2/2] mailbox: qcom: Add support for sm4125 sm6115 APCS IPC
Date:   Tue, 22 Jun 2021 23:37:59 +0300
Message-Id: <20210622203759.566716-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622203759.566716-1-iskren.chernev@gmail.com>
References: <20210622203759.566716-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM4125 and SM6115, codename bengal, have APCS mailbox setup similar to
msm8998 and msm8916.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index f25324d03842..1a4d8cca5881 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -166,6 +166,8 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
 	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
 	{ .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
+	{ .compatible = "qcom,sm4250-apcs-hmss-global", .data = &sdm660_apcs_data },
+	{ .compatible = "qcom,sm6115-apcs-hmss-global", .data = &sdm660_apcs_data },
 	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
 	{ .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
 	{}
-- 
2.31.1

