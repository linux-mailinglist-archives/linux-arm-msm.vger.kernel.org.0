Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A89874EE6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbjGKMVU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbjGKMU6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:20:58 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6854A1717
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:19:52 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b71ae5fa2fso37948321fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689077950; x=1691669950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tU3e6Q8fHsQTfO69SdNHbG++dzZ+jG5OmNM+0S083w=;
        b=DoWbr4YU6pMH14a9FkRzoByzrTAq+140o+l+qkz4liSx7mwZzjl8+pLphhk0Zh41M1
         sM+e9DeJzDYyJb5+vI/9I1dAyYQtbztuaJjYvcc8c/9N+n3tJek9dzDDKXYrYSwgU/oL
         n6W9F2MhdyBxBN44hap0xDRY4cNv5oY8ZnGEr712NmFS24IUKv45uyXrn1Oqlh53c+xb
         o2arczafEaGMKXsf6gsxnGxbxB7A85nzx/UN+7L3ndxUKIZz5x9x/JL7g47CfGmxZOPX
         VmXgeYM2d/pi6xlxpf0d0iFCyljTjKBIR46L1VxWGnNl9Y9XWFB4sUh1E+mbSmlVTxZ9
         IbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689077950; x=1691669950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tU3e6Q8fHsQTfO69SdNHbG++dzZ+jG5OmNM+0S083w=;
        b=FbmVGvHEdhMNwXMD85c8jsb91n3rUarEGvffzyV8m3ILh7CfRCuliXCCFzl7sGwTmd
         doKMVH86VYSrmlPGH91gyu60sCZQGz2xm9hmPaGGkITxAa1H8iMwfaUQA/tASeEQr5g8
         LCBXY86VhBP0feMMhclPo6BNA8AwpD0dgi4imamMiMXExoU7J08cAuXOxaA/gi+IZFM6
         8f6FisQrFezkmddln/WO40jgx/ozr82StQ1nuSM3W4T5f0vvhENy9AyCVjKnAk8/Du6K
         I3a+NmuWsUaTUgW8elvJHs9Om1Q3IMViZi/+UwyDXsKe2l+D3JriV4JFMvRizaAn3VHy
         XtuA==
X-Gm-Message-State: ABy/qLbm+YLhDqPCMjIxSWPzMujZAn/tHXUo51JdZ9egfZyZo431PcZA
        laB2IIe8d54/fPkOXYIz7RPe5g==
X-Google-Smtp-Source: APBJJlFLjOjdrYDmG3wyH+TiQsZOzZMrawbwpKMHKLOgP7R/BZosciwccjpWuptuMDBrL6TWW8eLrw==
X-Received: by 2002:a2e:b681:0:b0:2b6:fa8d:ff91 with SMTP id l1-20020a2eb681000000b002b6fa8dff91mr12983788ljo.3.1689077950618;
        Tue, 11 Jul 2023 05:19:10 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id d18-20020a2e96d2000000b002b708450951sm435563ljj.88.2023.07.11.05.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:19:10 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Jul 2023 14:18:32 +0200
Subject: [PATCH 33/53] arm64: dts: qcom: qdu1000: add qcom,bcm-voter-idx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230708-topic-rpmh_icc_rsc-v1-33-b223bd2ac8dd@linaro.org>
References: <20230708-topic-rpmh_icc_rsc-v1-0-b223bd2ac8dd@linaro.org>
In-Reply-To: <20230708-topic-rpmh_icc_rsc-v1-0-b223bd2ac8dd@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689077904; l=1029;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FFJMPSVIi/rnzhslrYEk6oNnRd5UMA/I/qlOvdMR/JA=;
 b=1yoDTc6kd8ZvHVFgmFdyi2Or4zbatDVvuAKn9V2a+ZPcKRh3aahwUN+dQ9O/e0E7q3U+zQUKY
 A6JH7xgCmDPA/3U9dZqnoHUGhGOMqWgfPbfvh9DBdnTZkFkZgICqPHi
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To improve the representation and ease handling, identify each BCM voter

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 1c0e5d271e91..6e4e049b1c29 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,qdu1000-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -1366,6 +1367,7 @@ apps_rsc: rsc@17a00000 {
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";
+				qcom,bcm-voter-idx = <ICC_BCM_VOTER_APPS>;
 			};
 
 			rpmhcc: clock-controller {

-- 
2.41.0

