Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3312379AFEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 01:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235507AbjIKVKQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Sep 2023 17:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237833AbjIKNOi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Sep 2023 09:14:38 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87902CD7
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 06:14:33 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-977e0fbd742so554443966b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Sep 2023 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694438072; x=1695042872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfLToWi3s74VODYQYeWzaHVcZfMPmR2S8GE/8a2Ka6s=;
        b=E7nUKy0AiHgN6Fc8wC6A1vHTYuWffz2BCoTvao40CCgCqo9URGTDd3xz9YTeI/y0L4
         3c/fNzpeieyODxNiTSQWjhGaCGDfjHJyKWLUzbox76OvsqP5os9xWEeqjQDwxMhEJfsn
         DHdB3rs+mG10VgAVQyvd1jLngmMNgVuFXCdjPSb5jWUbTfzEb1tOBKPykfwbjSgIHCbl
         FTROLeT4bpEyrQ42E3NJoeTv3afbkK/scRlcuf75NBAC9nDS4T0ROPDHDkZA6iRfcqVW
         P1I0ZDZg6znTXfhKi0Rz7vqtPUnouZoBiAnvoHPWTkVPT85LULm8sTvKOeAYMBLmtB6S
         kWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694438072; x=1695042872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfLToWi3s74VODYQYeWzaHVcZfMPmR2S8GE/8a2Ka6s=;
        b=NXNEsWDKE2IC4AGoCnj4qkB/f3bdxknL+K0QBQ2R8zRWPqqcutotbM+Y40e/k8aMnd
         Q4n/+MCv5JnNUeGKu9eQACj3Ul2Mi80yboeOT7hlEv7YGpXtenMKfJoQ9KMzo0OPmHwU
         VZVs6SYf2dd2DB0HoEa8GnMdkDYH7W0Mb5IRMloPdBX37P3QENYitSd1cMsXHYLtHcAE
         EtpeY9JywM/lsk0G/D23yK3DdSr7PUUtolA7B9/MMPCOej1MDj5dlxUQ9gH9gGgG/UaZ
         xBL+qqx/UfYBFZgGjFfjHTfmohZPxo4fYgZpTZz9ZVQWCuTwmfK8Wgs0QPaPeDXOrkpO
         ZLXQ==
X-Gm-Message-State: AOJu0YxwW/LjI401oLTTHbLjTNzLP2ISkk/aDM9VyiZ6K6O1hKlajx0q
        IN2VSE5Kl7JU1GbnrAL9T7d76g==
X-Google-Smtp-Source: AGHT+IEEXheHwzN33v3HwqxOhbU/PlFfynn+5Wt6jZP5dXrzEYUXQud1rZBRHKBTagAFH+9tmkAJEg==
X-Received: by 2002:a17:907:1dcb:b0:99d:dd43:d427 with SMTP id og11-20020a1709071dcb00b0099ddd43d427mr7988343ejc.10.1694438071424;
        Mon, 11 Sep 2023 06:14:31 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id kt8-20020a170906aac800b00988e953a586sm5313648ejb.61.2023.09.11.06.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 06:14:31 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 16/17] media: qcom: camss: Propagate vfe_reset error up the callstack
Date:   Mon, 11 Sep 2023 14:14:10 +0100
Message-ID: <20230911131411.196033-17-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230911131411.196033-1-bryan.odonoghue@linaro.org>
References: <20230911131411.196033-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A previous patch I had removed the returns from vfe_disable() since we
didn't trap any meaningful errors. Konrad pointed out vfe_reset() could
return an error, which is true.

Trap the vfe_reset() error code and throw it up the callstack.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 3d542ac93b1c2..8d23ca99eed35 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -435,8 +435,11 @@ static int vfe_disable_output(struct vfe_line *line)
 int vfe_disable(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
+	int ret;
 
-	vfe_disable_output(line);
+	ret = vfe_disable_output(line);
+	if (ret)
+		goto error;
 
 	vfe_put_output(line);
 
@@ -446,7 +449,8 @@ int vfe_disable(struct vfe_line *line)
 
 	mutex_unlock(&vfe->stream_lock);
 
-	return 0;
+error:
+	return ret;
 }
 
 /**
-- 
2.42.0

