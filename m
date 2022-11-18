Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3803162F0A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 10:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241774AbiKRJMD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 04:12:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241775AbiKRJL6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 04:11:58 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED3487A72
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 01:11:56 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id ft34so11405460ejc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 01:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkFb1u/bvHgUN39MgLh4iioExuZRwxW/sCGAVXGpD1w=;
        b=IMnvVf87a7Lzj0PVzl0gYKSZgaRzxdyMizeIXc3qsaD96qJl5aUWbc95xrL1pG34aB
         Gouzh4wes8Wtn31PpcB8hJpHPGGHVPhGX4QVmk8v/SLa2vDTEFZUTBAT+DpuMLHN1ErS
         UbETbxJc69f0JSViyXF5GHa9MElblvPOok/mhI3iommcdV53vBDBHs3CUu7AS+FFd97v
         NVt3e8whlz++DfvmP+9Sg6jzEj9Og0ikVGxU86h+dFsrFl1pvunrdCAh+YbJi/71Ge6u
         SHz/HHaPH+XqxyhZuV46YtayBV9wMOJMZXMNU8hJ4a02CvWv0d+MX7N5UdVW5oooJQjv
         veLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkFb1u/bvHgUN39MgLh4iioExuZRwxW/sCGAVXGpD1w=;
        b=z62M6obt348XhJ27EOcAKXOZZ/XBbRcw8Qjo2Dvl6ktpsykv3qSFhKOVqQB9kQKYi8
         2Xe+tTLcc89Of9PmXkczEGa93zLUKhqFTNT0UfIWkC6iVMTSjPZc/2tZI6ggve5pH7Fx
         C546Z5MzfCEuCe3ShhUZN4cpw94MmN+yZhreFnAnOnjktjy4COdxBqPDoKfzD7tz4ITn
         i6t08AklOSigtCMYw9zYB6eQ+ScCfWlcSyf08AomFCCy1eEWJVROUERwKr159GivgkIQ
         wFB5dhwmH8f3EJ57G2XH9juuaGj0Qe4k2XgoOZaiOqWoj9B96/0iSPlXJgvU594jHhyI
         9EgQ==
X-Gm-Message-State: ANoB5pluvgDrspwhla4AErSBLpu8QWVb0ITZUsFBXJ2lenAUXTSjROQY
        mJ3ROC16R05g98ZjR7JkcPgqjxLgF+el7w==
X-Google-Smtp-Source: AA0mqf4aAjjbKrj3iuHMCimr/ApJDyn6Vg8BInvOBiqu2HMfXdy3GMLLe/pmt+iVHQKI85FNWKdRjg==
X-Received: by 2002:a17:906:1614:b0:78d:4e5b:ffaa with SMTP id m20-20020a170906161400b0078d4e5bffaamr5082112ejd.455.1668762714878;
        Fri, 18 Nov 2022 01:11:54 -0800 (PST)
Received: from otso.arnhem.chello.nl (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id v15-20020aa7dbcf000000b0046182b3ad46sm1535647edt.20.2022.11.18.01.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 01:11:54 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Mukesh Ojha <quic_mojha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] remoteproc: qcom_q6v5_pas: detach power domains on remove
Date:   Fri, 18 Nov 2022 10:08:16 +0100
Message-Id: <20221118090816.100012-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118090816.100012-1-luca.weiss@fairphone.com>
References: <20221118090816.100012-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We need to detach from the power domains also on remove, not just on
probe fail so a subsequent probe works as expected.

Otherwise the following error appears on re-probe:

[   29.452005] sysfs: cannot create duplicate filename '/devices/genpd:0:3000000.remoteproc'
[   29.477121] CPU: 1 PID: 483 Comm: sh Tainted: G        W          6.1.0-rc4-00075-g71a113770bda #78
[   29.510319] Hardware name: Fairphone 4 (DT)
[   29.538335] Call trace:
[   29.564470]  dump_backtrace.part.0+0xe0/0xf0
[   29.592602]  show_stack+0x18/0x30
[   29.619616]  dump_stack_lvl+0x64/0x80
[   29.646834]  dump_stack+0x18/0x34
[   29.673541]  sysfs_warn_dup+0x60/0x7c
[   29.700592]  sysfs_create_dir_ns+0xec/0x110
[   29.728057]  kobject_add_internal+0xb8/0x374
[   29.755530]  kobject_add+0x9c/0x104
[   29.782072]  device_add+0xbc/0x8a0
[   29.808445]  device_register+0x20/0x30
[   29.835175]  genpd_dev_pm_attach_by_id+0xa4/0x190
[   29.862851]  genpd_dev_pm_attach_by_name+0x3c/0xb0
[   29.890472]  dev_pm_domain_attach_by_name+0x20/0x30
[   29.918212]  adsp_probe+0x278/0x580
[   29.944384]  platform_probe+0x68/0xc0
[   29.970603]  really_probe+0xbc/0x2dc
[   29.996662]  __driver_probe_device+0x78/0xe0
[   30.023491]  device_driver_attach+0x48/0xac
[   30.050215]  bind_store+0xb8/0x114
[   30.075957]  drv_attr_store+0x24/0x3c
[   30.101874]  sysfs_kf_write+0x44/0x54
[   30.127751]  kernfs_fop_write_iter+0x120/0x1f0
[   30.154448]  vfs_write+0x1ac/0x380
[   30.179937]  ksys_write+0x70/0x104
[   30.205274]  __arm64_sys_write+0x1c/0x2c
[   30.231060]  invoke_syscall+0x48/0x114
[   30.256594]  el0_svc_common.constprop.0+0x44/0xec
[   30.283183]  do_el0_svc+0x2c/0xd0
[   30.308320]  el0_svc+0x2c/0x84
[   30.333059]  el0t_64_sync_handler+0xf4/0x120
[   30.359001]  el0t_64_sync+0x18c/0x190
[   30.384385] kobject_add_internal failed for genpd:0:3000000.remoteproc with -EEXIST, don't try to register things with the same name in the same directory.
[   30.406029] remoteproc remoteproc0: releasing 3000000.remoteproc
[   30.416064] qcom_q6v5_pas: probe of 3000000.remoteproc failed with error -17

Fixes: 17ee2fb4e856 ("remoteproc: qcom: pas: Vote for active/proxy power domains")
Reviewed-by: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
* pick up tags

 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 67f5152e2398..a14ff1142e76 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -573,6 +573,7 @@ static int adsp_remove(struct platform_device *pdev)
 	qcom_remove_sysmon_subdev(adsp->sysmon);
 	qcom_remove_smd_subdev(adsp->rproc, &adsp->smd_subdev);
 	qcom_remove_ssr_subdev(adsp->rproc, &adsp->ssr_subdev);
+	adsp_pds_detach(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 	device_init_wakeup(adsp->dev, false);
 	rproc_free(adsp->rproc);
 
-- 
2.38.1

