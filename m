Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C344A27B69B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 22:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgI1Ur1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 16:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbgI1UrU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 16:47:20 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64627C061755;
        Mon, 28 Sep 2020 13:47:19 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id v12so2488277wmh.3;
        Mon, 28 Sep 2020 13:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QaDlg5umR5Bq6B37KlnZ9oyPSfCM/hAhsQpiLPmGTZU=;
        b=ig1SWwAtJ0I1VGjmzmZ1x8L6Qx9iHAd7GvhIsifd7PPNmAekFI8V8btr15kSOpr66P
         6Ya9AB9WPJmG1GpJWFbvoPchv8iQ9lcyzOwufKaZkl9xs0Hyf4EExaVoH1aIksMS4NJh
         sdVTglFNEDgZV12DqoOb+ld+mu6IrEzbks2MxWMDHu1asaCnC4JFE++xaNmRtdohvXTV
         vQjviJwJYV/i5gIUhkY7y0NtDUcJMgLRGcOmf3cd2M8sGR/pdYp3vToGtTrVLDtsR+6L
         3jfOqTzrEHWVD7xajuiqTqXnvi62XFKA4Nd9fOCg+GFr3vxl+ut2CfQAWOlCmKgRO/D+
         QhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QaDlg5umR5Bq6B37KlnZ9oyPSfCM/hAhsQpiLPmGTZU=;
        b=idj5wXTr+9BU2KToNMG2tbusILe7zTs4W0CsauqUUqEMwi+0OBBhUAm6f+E3r52AW8
         BsAQ4rHogqq86JNFTiClOPWCgwMfaUNYREiOwCh15WU5HrEU+nnVdDKFrkXsFSa3fvB3
         ISChshfr6mRZcsfOZqJYRICk6X8R49HHB04PCwvlJIS/U+69uPVwfuxLQfkDYtXtEYmx
         ePc2lANghSeBaQNXlgYmo/v+mPuHg87ThZiJ3ulqQpwhNiji+LY5ypKgsySpIhHbk29d
         v8ooWhLHidJACu3nv0rtCPJL4Gq5McgGqqlFw+rfY/vNIzwO658DiGAgWQ6YELJNx+Qc
         iUmg==
X-Gm-Message-State: AOAM533jYRso7zbEqbafFNDAzeVW6b2nN6EEGZgxxuYXi9ejZPDh0PWc
        0PeD6qOtc/gikvxdCJsJLh8=
X-Google-Smtp-Source: ABdhPJxLxyRLBTsYddKkS0vagFHtgTYoh1tugkQ8sTKZR6M0eDFqGkM+4DqKN/aTT3u3yZMtxk1dWg==
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr924797wmj.166.1601326038050;
        Mon, 28 Sep 2020 13:47:18 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 13:47:17 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] drm/msm/a5xx: Disable flat shading optimization
Date:   Mon, 28 Sep 2020 22:47:08 +0200
Message-Id: <20200928204709.45746-7-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928204709.45746-1-kholk11@gmail.com>
References: <20200928204709.45746-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

Port over the command from downstream to prevent undefined
behaviour.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 448fded571d3..6dac060902a3 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -759,6 +759,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	    adreno_is_a540(adreno_gpu))
 		gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, bit);
 
+	/* Disable All flat shading optimization (ALLFLATOPTDIS) */
+	gpu_rmw(gpu, REG_A5XX_VPC_DBG_ECO_CNTL, 0, (1 << 10));
+
 	/* Protect registers from the CP */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT_CNTL, 0x00000007);
 
-- 
2.28.0

