Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93FAC669279
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 10:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240754AbjAMJLB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 04:11:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241180AbjAMJKY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 04:10:24 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8806C73E2E
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 01:07:52 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id g13so32220268lfv.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 01:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eCp5P/TMVFbFTF7vzefqI/ZA2E3ZQFeIqWdTLT1Q4s=;
        b=HM8sx/v06ph5D8nBfI/gnRCdbBcGkRlz9G9eAMxhTOythqrp8URubU3w0Lgiz79WZw
         QNSsCo73Lii2SdrN5ybv5YUTWia9Ovm5suipcsjNOmN95vKh569rtoOW4wVE0LIBlUyd
         w9AalLd/3+ycJlKVD8/cgEDCSy+wrnEajMalxLhQM/QYQFVYFaNB9p8UHxbRmZ3S8UMX
         6ZuZSat050V3jpP8J4VnBTZMuFnj5F1d6kiO0c45xwOUgjYVRyzlOTFkI+zqZi8jpE4e
         tBW4fE5JPPMgVSedwCJxFuzLWkRzmGL7+LwX1o3+OY7lOWcBN5u/gEUE2xMq5WLseUj+
         zgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eCp5P/TMVFbFTF7vzefqI/ZA2E3ZQFeIqWdTLT1Q4s=;
        b=38f5erUvIVZslJF162xuU6Ore7z375RLAkzk9FBchOyloNOd+uVdTJcHmEdt66QJzg
         2tFJd11Pt9RUGaCEEqB6RX/861CM0YE8/g4sa69+WB4c+TtaP/EeIL0Ut1Wu1Z1Mln9p
         cBbPerv3tWWZGI/UgTk54y9IGJ1z/smh6jNtVffmffBqoECvADH1G7zdsbC2xsrFpBFa
         +oeDFdsd7aub6PiU7BR+jzAA2rK8Pl3WVIB5eEKt0IrFsX7ZyGTs0fu9c/IoQaYZAynX
         oGQBDVABs19AqPAXOwNgEmR6Ag70PJRM+CRBPP/j346Jd2gBuVWf4LYGnk6QBhEoMcVZ
         v6hA==
X-Gm-Message-State: AFqh2kr4ulO3vbRyYnfzEOp3F6oCnwHAkRGiqDC+k3Mi6uM7JAQo68DU
        bQkcEM1H2xdI7kzTwovuQTveuGdLc4mu1dmPfww=
X-Google-Smtp-Source: AMrXdXvxZZm6392EWT1MaPSsii9UKpBAx3zLyhu7p6kipsBV5ZZLuiGSTGaIIxTXTP2frdfKnSVPOQ==
X-Received: by 2002:a19:ac41:0:b0:4cb:3471:ab94 with SMTP id r1-20020a19ac41000000b004cb3471ab94mr9933151lfc.31.1673600870936;
        Fri, 13 Jan 2023 01:07:50 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id d4-20020a05651233c400b004947a12232bsm3735296lfg.275.2023.01.13.01.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 01:07:50 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/4] dt-bindings: mailbox: qcom: add #clock-cells to msm8996 example
Date:   Fri, 13 Jan 2023 11:07:37 +0200
Message-Id: <20230113090739.45805-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
References: <20230113090739.45805-1-dmitry.baryshkov@linaro.org>
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

Add the #clock-cells property to the MSM8996 example, as the APCS block
is going to provide the `sys_apcs_aux' clock to the consumers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index b8a44ef0540f..5e7c83345774 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -141,6 +141,7 @@ examples:
         reg = <0x9820000 0x1000>;
 
         #mbox-cells = <1>;
+        #clock-cells = <0>;
     };
 
     rpm-glink {
-- 
2.39.0

