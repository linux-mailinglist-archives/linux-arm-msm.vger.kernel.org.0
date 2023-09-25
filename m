Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07B407ADA94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 16:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbjIYOv0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 10:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbjIYOvJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 10:51:09 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0BA011B
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 07:50:54 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso111522581fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 07:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695653453; x=1696258253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WML/yephaQhDmSkYaQilPoOdlfPN/mMwj3HRzRGa9sQ=;
        b=npwy3BhmytKUdO/vT/owSSEbnmMe65OuDYW4ZkXEGBXuJlZnDkRgE6nGY7KzI2jS8W
         xcK+GG4mPjRvR5gKx9t0//wy07zRRgg3dvn0T7MAjfsMMAfDidmWbzyEQeVttr0jAHOT
         MH8lxh6JBC5Ts/R1BLBvok9yxv/EhyCC43uJ7/c7A/1JPp3U1R6GXZjtRvL3ZzX3SjKR
         fCdaCFdp6N8P1aazEXSp/Td27+2ljaPYf6aLXcWAdRLpIgPK2HkILlMyXggwc8s3hdK4
         uyP3NbKr49lhx3kPzzEIIYM1WgS/qDWBTOwIHdMU/ibbqTFXkiY3jM0zh9oXKMIeKn4x
         4N+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695653453; x=1696258253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WML/yephaQhDmSkYaQilPoOdlfPN/mMwj3HRzRGa9sQ=;
        b=Niz//nuk4iTkPNdHIlZ1+xhxWeRlSexp4dcl0aNZIMaOa4qzqJ45JjBl8MTYD5aevZ
         jKFqdkb/TFNPTIxDDkasoDuXzaNFOEL4XUVK/hm9zkOpJlgGeEf2UCqHYcA+Bv4ZroOA
         1iOuPV7DC92zYZ+OVGTKURWKEXzyJV+2r7zYSEgEsakVT9WsJ3FAidio2PFk4offZgud
         k/JAeG1oQMVi7FLhtvZTn0J49D+AfP1tiPJxkwY86pUv9tFp5z5JQ/8yNLSAMnLfqyj4
         Uz/ywNZcVqF2eaTyS5Rr90UpkuirOUQDkjyyiv+Ww9vPTIDYn3Au5e24vHdxLja9wBPS
         owjw==
X-Gm-Message-State: AOJu0YyEOLJQ2gmWMsPXxf1EeNac1NFfAvznRl+WJgBBwPlKGXm456A0
        gmDkPU71JZnI7BWtUiR1k1jZiA==
X-Google-Smtp-Source: AGHT+IGngHh1lJzYut0axATUq1RD4igrxqprEB7ZDSJGxzmibNVKlh4pMxU3t9l8VHC4gxFNKD1PFA==
X-Received: by 2002:a2e:800c:0:b0:2bc:efa4:2c36 with SMTP id j12-20020a2e800c000000b002bcefa42c36mr5755576ljg.11.1695653452875;
        Mon, 25 Sep 2023 07:50:52 -0700 (PDT)
Received: from [10.167.154.1] (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
        by smtp.gmail.com with ESMTPSA id k8-20020a170906a38800b0099bc2d1429csm6426640ejz.72.2023.09.25.07.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:50:52 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 25 Sep 2023 16:50:39 +0200
Subject: [PATCH v5 10/10] drm/msm/a6xx: Poll for GBIF unhalt status in
 hw_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v5-10-3dc527b472d7@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695653434; l=1394;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=S69YtysEIHJMxY5KNnuCyMTYR/1rqHR9OdffW35mR5k=;
 b=deWqc3xOp1yizqjDENR+XaQW6wnaaeSKpTpreg+G3/p7xbkHMY61wviNuH6/V3VKcF9ePxP+W
 PDwN6oVPiqRCms8n3osJOWf/yJd48uaIscbJVT9/lMgwkRDys++aKk1
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some GPUs - particularly A7xx ones - are really really stubborn and
sometimes take a longer-than-expected time to finish unhalting GBIF.

Note that this is not caused by the request a few lines above.

Poll for the unhalt ack to make sure we're not trying to write bits to
an essentially dead GPU that can't receive data on its end of the bus.
Failing to do this will result in inexplicable GMU timeouts or worse.

This is a rather ugly hack which introduces a whole lot of latency.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2313620084b6..11cb410e0ac7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1629,6 +1629,10 @@ static int hw_init(struct msm_gpu *gpu)
 		mb();
 	}
 
+	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
+	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
+		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
+
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
 	if (adreno_is_a619_holi(adreno_gpu))

-- 
2.42.0

