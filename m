Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6282F2549AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 17:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgH0PlS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Aug 2020 11:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgH0PlS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Aug 2020 11:41:18 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DADCC061264
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 08:41:18 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id k18so3801809pfp.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 08:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KAAg1wT74J1TPJUNvinItqB9ZDfNPLN786c1MlpJyJo=;
        b=HcOa46BgqN+2jqdrRcLqoGUNKCWiiC56FiwTZkCLIJQpGgLTSezUDkrs6g3rH3dvkK
         baaNuoyYgOtHoDWGgn9cwl83bP/Y7T+B2ksAhCsEj7XV98ZLGFv7t6Vailve/m+yykIn
         y/hJA/+Drd7ckQF7iuIEATvkgCIyNClTwOeGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KAAg1wT74J1TPJUNvinItqB9ZDfNPLN786c1MlpJyJo=;
        b=t3dGUMqXyt92rd7pFXd66wkCZKOa/CAJlNjI5kLyJUkrjFoQQ0sbAKA6kP1pqEFr0w
         b9kUJ0KmzsZnslnJVn4FqOjgTvi00gGq443+cA8fo/FMQgxu1eLDGDzpVxyYZpg15Zii
         +3rKbhcTaZQ5XtVaTvyJfdnAz/izOi8UMMqtZ1FtvcLIpvt7a6EKl1EdeA+z5a7KyLEQ
         nPnZBznLql6pZbF3X5GnVqzSLcn6jyi7KF0WcuFQl3mFVg5rfZ3Q9FLgxXng1zGK9V/3
         aZR0JO53UHegEQJwjqNy8PXIbqOm2r3rEpO1w+d+6ucGrUPv3b7fVRURILaQFDXuGAIC
         AMhw==
X-Gm-Message-State: AOAM530LXx+fMWY+o5Aa0EXqwbFxLScefV++GupH421nrqAvoAq/+ycW
        dFaAzE/CVS31Qc8A6bD9MKeFcQ==
X-Google-Smtp-Source: ABdhPJxt8TMgiAOegn4WkDsoSiNkpDn4sIcrWZ/XR6jPZbmFJWUQipH2JkHFxL3Vln+YLYuqX3HtXw==
X-Received: by 2002:a63:7018:: with SMTP id l24mr14452680pgc.55.1598542877503;
        Thu, 27 Aug 2020 08:41:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id q34sm2642066pgl.28.2020.08.27.08.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 08:41:17 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     vbadigan@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: [PATCH] mmc: sdhci-msm: We need to restore_dll_config for sc7180
Date:   Thu, 27 Aug 2020 08:41:05 -0700
Message-Id: <20200827084102.1.I7a5f56b411071eeecae84b7e33981d39170ccf2a@changeid>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Although sc7180 is supposed to have a hardware fix that means that we
don't have to restore the DLL config like we did with sdm845,
apparently the hardware fix doesn't work in all cases.  Until it's
understood under exactly which cases we the hardware fix malfunctions,
let's go back to restoring the DLL config whenever we do runtime
resume.  This is safe and gets things working again.

NOTE: we don't need to introduce a whole new "struct
sdhci_msm_variant_info" for sc7180 since it would be exactly the same
as the sdm845 one.  We'll just refer to that one.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/mmc/host/sdhci-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index b7e47107a31a..a88db3f376bd 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2148,6 +2148,7 @@ static const struct sdhci_msm_variant_info sm8250_sdhci_var = {
 static const struct of_device_id sdhci_msm_dt_match[] = {
 	{.compatible = "qcom,sdhci-msm-v4", .data = &sdhci_msm_mci_var},
 	{.compatible = "qcom,sdhci-msm-v5", .data = &sdhci_msm_v5_var},
+	{.compatible = "qcom,sc7180-sdhci", .data = &sdm845_sdhci_var},
 	{.compatible = "qcom,sdm845-sdhci", .data = &sdm845_sdhci_var},
 	{.compatible = "qcom,sm8250-sdhci", .data = &sm8250_sdhci_var},
 	{},
-- 
2.28.0.297.g1956fa8f8d-goog

