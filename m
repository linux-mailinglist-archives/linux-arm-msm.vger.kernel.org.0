Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D69DF56BEBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 20:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239283AbiGHQZO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 12:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239285AbiGHQYc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 12:24:32 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E734280489
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 09:24:04 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id t26-20020a9d775a000000b006168f7563daso16561747otl.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 09:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eS1DoT862v/g6EpjvGHfLBntfCPBUFxV6o7NJazJK14=;
        b=hSRsjqZkDb6SyYnQtxvHdml60HsCjB3dzHLzVc+Sn2nCDLpjUIt0dvvYQEP4Utv8dp
         HJ4UVRDAwVrjvDJlMu1KWwignFae8tPFXKxvx7w67BsfotkF0yCeNJpCq93RE79nvUPR
         a9/RELWNRH58jLvHLFSo559skengu9ebIkY9qFdA3GmDMtcX249eLdFy15rFNHv4HhIG
         0OPUsVbAD5efrQapJLvTX2j7ZYGpV3Yo5UuU445XhnUTajLmuVDfgNnmSZgTWUCvD4cO
         sshWnVjlDI2wpye7wqBbHjpGgI57nlHFi82d3ln8eARWnN2zIdGS4XSIQQa10QOFAmFK
         hgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eS1DoT862v/g6EpjvGHfLBntfCPBUFxV6o7NJazJK14=;
        b=4ZfMX2kamjrHVMY0CXBoxNAPlZLzjuoLQN2YXYA2O67C15KeZntzn0NiaI24xgS5/0
         Hj0L7c4cBelnAcX+WSsbiuLw79CmYAhaFTiEEgqDwBW3IBBf9+anzEkQGtGt6x5fWUDV
         iBnz8HcNEUd90zS9k4Qz1+XA/IFCHr04gCJ8s5N9RT+EVawc8km2MZrjJCmp3gFL3ok+
         2F/cipifWGHEs53w+MTevgnaUYvQObhkjrywwynIG5Jgv2XfmQXOHoWgI1gNiEyK+KeL
         EeWJiZjMtaboHlW+u1xxclOcPV9Q8Z5hx2vOuJJVcDnNV0JdIs/QmMJBsyopqGPXjaLc
         PFCw==
X-Gm-Message-State: AJIora+tPUaAOu6MoMqEEMLdpbRc54/EIsIg/qj2NT1MUXmyY2rU5D51
        bEzjcM8NC8HHNAZr6b8pakKVVg==
X-Google-Smtp-Source: AGRyM1sHmxfIFe72kNMrpQnCwtapr6QU9N20Rtq+AQ0mLbpRLwO90rb6TwTmApYnhVPsNOLGXUit5Q==
X-Received: by 2002:a05:6830:cf:b0:61c:265b:1d1e with SMTP id x15-20020a05683000cf00b0061c265b1d1emr1862647oto.290.1657297439983;
        Fri, 08 Jul 2022 09:23:59 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f8-20020a056871070800b00101bd4914f9sm6678663oap.43.2022.07.08.09.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 09:23:59 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/gpu: Drop qos request if devm_devfreq_add_device() fails
Date:   Fri,  8 Jul 2022 09:26:32 -0700
Message-Id: <20220708162632.3529864-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the event that devm_devfreq_add_device() fails the device's qos freq
list is left referencing df->idle_freq and df->boost_freq. Attempting to
initialize devfreq again after a probe deferral will then cause invalid
memory accesses in dev_pm_qos_add_request().

Fix this by dropping the requests in the error path.

Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index c2ea978c8921..21e271a318ee 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -198,6 +198,8 @@ void msm_devfreq_init(struct msm_gpu *gpu)
 
 	if (IS_ERR(df->devfreq)) {
 		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
+		dev_pm_qos_remove_request(&df->idle_freq);
+		dev_pm_qos_remove_request(&df->boost_freq);
 		df->devfreq = NULL;
 		return;
 	}
-- 
2.35.1

