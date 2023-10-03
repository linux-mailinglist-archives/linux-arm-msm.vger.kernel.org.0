Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7A4E7B5E8B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Oct 2023 03:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjJCBVp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 21:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjJCBVo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 21:21:44 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4104B8;
        Mon,  2 Oct 2023 18:21:41 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4180b417309so3042261cf.0;
        Mon, 02 Oct 2023 18:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696296101; x=1696900901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/FjPGL9FZLD3HPQhfLZqhNvGFa7zL77tDFLRHXNnA8=;
        b=bNelWJKRf2v8f11bL19fO+z+H6+2V7S7AFvgvTm/B4UJ5AKk5SfsEryrBI/0jOk14A
         avjC0zODogqUpYMcw+ngbnXlWol72UokQD5BiJfTrMJf7gALrJ8oR+Yw95PY+Kv0VGFV
         bvaIMXVr7IU67CSZsvFMQZd1Lz2N94+V772tj8yb0EJICl9WPQZsJ3VoEzNGlntTVAiu
         mj3nmqmIlDobhWgFv+7BQc1yTvQXGuQun7DWHGvrK/NJMcGnx3m4MbB0Etdg0TW1Of5X
         cpe5qmfpViooS/3dsHx/EMwjFHbsAY5mQOvotItlHd7E8ootgttFYEfO6Ov81PyuCJWL
         WuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696296101; x=1696900901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/FjPGL9FZLD3HPQhfLZqhNvGFa7zL77tDFLRHXNnA8=;
        b=hp5jUBMh0N6sMFFQ2VVg73qfSxiYdYyBsWqpmhGykkADxx53L3/PbbHtAII7UbjUXG
         oxtWJ6SMEqbfbJFiw4pPCzByI4C17TJwP4aj7lhNHdQTpwBEIZ1sjrcASnFFpr6k5Pwu
         8iJcpT5Zri3+HoylbWjU72jmpNdxlptwJyQcEqvNRTJgpaAF3Y5TOFk20RET/dd8cH8n
         JCv2XDzCxL5RUeX9NiQDAAl4ycxWplIeISfWWseFmAmaBvXpzf9yTng4CKyh0USUHNK8
         GsNL4AxlEdGO9xe+F+74ViiL2pPiO24X0mfM2GTC4ubtPI0AyA2sT1nvsK9YK57UW88K
         BPnw==
X-Gm-Message-State: AOJu0YzCIP/koVIsAfgqLZ4E9NzOTDLN6mDx03uMBqC4+88FXeP+9Nwi
        bXgGw5kDWhOc8Ox8FA5rIxc=
X-Google-Smtp-Source: AGHT+IGUk13Af36ePkPLK8OB/CE3KCsi4/aGMCMeOYFW3yq5+hgdDKY93tE+wZpuDlClyIr32vn6cg==
X-Received: by 2002:a05:622a:1653:b0:418:11c4:bd34 with SMTP id y19-20020a05622a165300b0041811c4bd34mr12285402qtj.35.1696296100693;
        Mon, 02 Oct 2023 18:21:40 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
        by smtp.gmail.com with ESMTPSA id f15-20020ac8470f000000b00418be3e365fsm71687qtp.1.2023.10.02.18.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 18:21:40 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Liu Shixin <liushixin2@huawei.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 1/6] dt-bindings: display/msm: dsi-controller-main: add SDM670 compatible
Date:   Mon,  2 Oct 2023 21:21:22 -0400
Message-ID: <20231003012119.857198-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003012119.857198-9-mailingradian@gmail.com>
References: <20231003012119.857198-9-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SDM670 has DSI ports. Add the compatible for the controller.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index c6dbab65d5f7..887c7dcaf438 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
+              - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl
-- 
2.42.0

