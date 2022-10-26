Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B675060DF28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Oct 2022 13:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233131AbiJZLCf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Oct 2022 07:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233487AbiJZLCa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Oct 2022 07:02:30 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A8BB5FE5
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 04:02:29 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id w14so1416122wru.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Oct 2022 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5yIrMJGpCUVHY5GfvEg2i8ek5laLkQGA9zDhfgH9W8=;
        b=O0WFoE7vynG5KsDSLBTFaIikesyRanRpjq1Fbxh8BuIkEZPvwoh44dIJul80ph+gwD
         rZwgeujH8Jrqy5sdsHIof+RuuAV1KqKL3KvfAiG9wLOC8xAfKuEGIHPtn06ySffpqZeN
         aumbCJgl4ls0yXf6bpilHRmPTXLhy5a6pUOkhhqlLa+tzfaJYuttbymXSDmZojdGgdlt
         oloWKlyka5phBa9RRrNKMY1mQ2Uf65iVjz7uBeQzrvMXrP+GScvYRgOY+e9rSC36yBBz
         ed77qagUS1Rob8EEX/CWe50WoKf67T7rcO0R7hgkdOJFEpDEWF0MT5e7ysaxAynioCu8
         9Sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5yIrMJGpCUVHY5GfvEg2i8ek5laLkQGA9zDhfgH9W8=;
        b=1E2dWbpi7l0EtUO5L0pNXziaHYrZaKX7WeIMrtR+GwOwkx5JiXYHuHrsFwvimYicA2
         wF3iUZGvK93A85yUqCdPbmHMvSSuGYk7oQyRKVwUmv/vu5FR9/7b7yEzn4r5XnSxzU+R
         Od/AMGu2FzSQ6rFDh0Iv0RMhGozuJ5Ob33j5gLO6xy1JguBqTiNtI/JtG65F1Iv3D+qi
         frtE7w3j5WhdLBCFlf3O8aM+Qo5UhK8yUGzxf7FHCi5F6iXldrJCsL1rqgNc+U593zou
         937IJzkv7QrWtyMesJgD277mmaRYbq/7JPpp0HkLfhvB0DZRI4fh/B7LHt8/Rpe5qShz
         eAlw==
X-Gm-Message-State: ACrzQf2lFZHugLNm6yJJN9kq83Ktm7AavUpnsawZorUV5JkQN3p+YZQL
        MLL+2vWn5/+7WtmHpWP2D3KjOA==
X-Google-Smtp-Source: AMsMyM5yubBRK+wTdLXV82WHsx/yLGwYXhc+1W6ivTLWBc2NSpO2f9tW06JksBg6fsNSAz3QPdSJTQ==
X-Received: by 2002:a05:6000:1f87:b0:236:7683:e5c0 with SMTP id bw7-20020a0560001f8700b002367683e5c0mr9178434wrb.193.1666782148331;
        Wed, 26 Oct 2022 04:02:28 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id z7-20020a5d44c7000000b0023672104c24sm5237415wrr.74.2022.10.26.04.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 04:02:27 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     vkoul@kernel.org, yung-chuan.liao@linux.intel.com
Cc:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        pierre-louis.bossart@linux.intel.com, sanyog.r.kale@intel.com,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: [PATCH 5/6] dt-bindings: soundwire: qcom: add v1.7.0 support
Date:   Wed, 26 Oct 2022 12:02:09 +0100
Message-Id: <20221026110210.6575-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
References: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
index c85c25779e3f..e0faed8dceac 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
+++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
@@ -13,6 +13,7 @@ board specific bus parameters.
 			"qcom,soundwire-v1.5.0"
 			"qcom,soundwire-v1.5.1"
 			"qcom,soundwire-v1.6.0"
+			"qcom,soundwire-v1.7.0"
 - reg:
 	Usage: required
 	Value type: <prop-encoded-array>
-- 
2.21.0

