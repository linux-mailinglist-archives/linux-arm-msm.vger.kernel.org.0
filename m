Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BED4D6D1BE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 11:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbjCaJVl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 05:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbjCaJVj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 05:21:39 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93FB24691
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 02:21:37 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g19so14950096lfr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 02:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680254496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW6ucyBlPaXPLxhxGyKJLKFBicJXxXMRT8wQieSVLcc=;
        b=D7QPZXFGxqqP0qqgvQWKXe1hG/jslLSp7yMCKzsxGg/Pa1fDmWCvYH/sNpfjCsmePg
         e7xTaUbAzJuh6d6XWGo3UvHbnome+wLjlZO45no76hU+4r7rFHhTmBCR5Z/A1L1xyS72
         c2/jDipvmx/ZAqnrOoC9bcCBcEQHV3KVE2d3IC571Jsal8E9SPWHp21l0ol5UJ+JvfDo
         jEhgsoFkKvchsbMkQlEeMmTU7QqfrRVZitC+UpgO/bPGBlycWuWcy/nOrSuEOPBlhZ21
         LUjIc/Eyvp2Yb0x74twbESA7f7yIOub7B6qyuOaZ2d6IRuGKCXVriLWVt0eH01ecWTgZ
         dqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680254496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW6ucyBlPaXPLxhxGyKJLKFBicJXxXMRT8wQieSVLcc=;
        b=Ccya23CiD00Lg0Ea9nWJ/iwYP1WXHhe2XvWGr020Jp2+qmiW6EUV55wm39kcibFyIm
         Wk+8+JPwjYhYZi/r41FpHa2YidvLQJb+tQh5zfygNftDGSnhY0mMNyLFX4fpHftifMqo
         Inh4GGfshFLYdf4ZZYXg45gJJzV+O5x3oTOF4cR1QJbdmfjL0DCeK8L025lAlB/3ef9L
         jaMuDftbOJ8rlRvGzHRYzLyGnaR6p43+BssWEEUyOCF2bG5VGmEisEmE3QJiNKvagO2k
         86iWm+cTKCLvmsZ3PPjNVvGDCTnYEFEHdxPPeSLO+e/vIv+AqSWu75sptN5JzUixTq0k
         /ECQ==
X-Gm-Message-State: AAQBX9fPbd7a3CjKm1I2Sp/0qWcy5uvaS5ytgsA6CCCtckDH/5uBqK0i
        kjcHXd2/V8G6Lz7ERmphAY5l+A==
X-Google-Smtp-Source: AKy350Zbx52kYMTbjjjzdzz6vFmRalC2xoYJFzqZul3n09VJmagQWDMlRbT8K9aD9e6XM+LoUktDzQ==
X-Received: by 2002:a19:505e:0:b0:4d8:86c1:477d with SMTP id z30-20020a19505e000000b004d886c1477dmr2830775lfj.18.1680254495878;
        Fri, 31 Mar 2023 02:21:35 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a13-20020a2e88cd000000b0029bd1e3f9easm282629ljk.32.2023.03.31.02.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 02:21:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH 3/3] dt-bindings: remoteproc: qcom,sm8550-pas: require memory-region
Date:   Fri, 31 Mar 2023 11:21:25 +0200
Message-Id: <20230331092125.44885-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331092125.44885-1-krzysztof.kozlowski@linaro.org>
References: <20230331092125.44885-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The memory-region is defined in device specific binding, not in
qcom,pas-common.yaml, thus also require it in the same place.

Fixes: 084258d60712 ("dt-bindings: remoteproc: qcom: adsp: document sm8550 adsp, cdsp & mpss compatible")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index fe216aa531ed..58120829fb06 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -53,6 +53,7 @@ properties:
 required:
   - compatible
   - reg
+  - memory-region
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-- 
2.34.1

