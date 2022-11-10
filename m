Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1F4624B0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 20:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231305AbiKJT42 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 14:56:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbiKJT40 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 14:56:26 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577812BF0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:56:26 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id x16so1557602ilm.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 11:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v945GSX1eV3UJd6GCr0VKFlHKoDz5Oj9+fbjy4q6OhU=;
        b=yFfCLKNrKYDXvW92bMbGEQ1ZBinb7uE7Py8eAE0uyj+kVmFXNDcLnWnP/y130vReoN
         o/wM9VROwxH34Dxm3sOaMBp2SObqOhOxQB/YuUedPaqLg7pql12PhxUyti3DF57Sv8xY
         JCLhjyUvG9I7zI3ysZVBGFcEacWQHXRi75flg2C1KQZJPzJer0ge+M7ylt2OAFgkJrqb
         jFUNwynaXQWHRN19w6f2aWrfB5dGsqJaEOVpVBBQV2c06isj23O53N15zElWiAgs1jbq
         C3psD3R9mdrsvYFncz4IFc9WaRgeCYVEJ5INry8TWak7FiaFVl4M306FY4WP2CWWXvU4
         BwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v945GSX1eV3UJd6GCr0VKFlHKoDz5Oj9+fbjy4q6OhU=;
        b=AINoUTjajNtihr7w5uWuEcjYyxf3bmFfyFWdV3T5hAvSOw91snbx52e3TGHzQoJPcw
         UBY/1WTyK3TYqmtOfWA+9I3O6Z2LdCcna7S4O3r42moHqWTj7JRE7OiYvjb9FcITCBcv
         Ev94+W9bN8cPgFJGHqURdHNukH3No9hcIsWyo+oDOKu/GNsKRcOdcPmzZv6eYyRMUYQM
         MEKQVZgnlYDmGmSaYXq/yAPb/ynRLMIFiNi86CWFY8d6oKxB1jD088qIwLZ5LonJ2Yvh
         C6iiDTLrpQqfCLwhCa6kWHn+AO8jzTxWOAPBMWDuD2bjxVBlIJpY8QgvhbyVOjN1CVbP
         rmAQ==
X-Gm-Message-State: ACrzQf1qvljIaLBHYTiKLzyIbmns1lv9AiYsYBQDKXdatCoQrzHa4Gzo
        P0I/SrJ1ABDx0i5amtIzG1tb3g==
X-Google-Smtp-Source: AMsMyM5L29aFqs7m8ZPN3GsYSvo0zVt9qdszersId9k19DlVRcwZzBWCRO94Df58Deu0la3PRUMDeg==
X-Received: by 2002:a92:d3c8:0:b0:2ec:364c:55c5 with SMTP id c8-20020a92d3c8000000b002ec364c55c5mr3284669ilh.61.1668110185610;
        Thu, 10 Nov 2022 11:56:25 -0800 (PST)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id l2-20020a6b3e02000000b006bbddd49984sm28602ioa.9.2022.11.10.11.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:56:24 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        elder@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] dt-bindings: net: qcom,ipa: remove an unnecessary restriction
Date:   Thu, 10 Nov 2022 13:56:17 -0600
Message-Id: <20221110195619.1276302-2-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110195619.1276302-1-elder@linaro.org>
References: <20221110195619.1276302-1-elder@linaro.org>
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

Commit d8604b209e9b3 ("dt-bindings: net: qcom,ipa: add firmware-name
property") added a requirement for a "firmware-name" property that
is more restrictive than necessary.

If the AP loads GSI firmware, the name of the firmware file to use
may optionally be provided via a "firmware-name" property.  If the
*modem* loads GSI firmware, "firmware-name" doesn't need to be
supplied--but it's harmless to do so (it will simply be ignored).

Remove the unnecessary restriction, and allow "firware-name" to be
supplied even if it's not needed.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index dd4bb2e748800..2d253ef488188 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -162,16 +162,6 @@ oneOf:
   - required:
       - memory-region
 
-# If memory-region is present, firmware-name may optionally be present.
-# But if modem-init is present, firmware-name must not be present.
-if:
-  required:
-    - modem-init
-then:
-  not:
-    required:
-      - firmware-name
-
 additionalProperties: false
 
 examples:
-- 
2.34.1

