Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C77274EEA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 14:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbjGKMWX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 08:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbjGKMVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 08:21:43 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CABD272A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:20:24 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b703caf344so85773591fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 05:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689077967; x=1691669967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4NULi+Pg3BzaFa9S+uijdnxcMxII5T4dtt9x/IhMZ8=;
        b=W51lFjiu6a9R1/lJNF1ZBGOFoMD7fqaxsfek7DTQrhsBd504k/wpfWeVhedCDuV2aI
         qIxxz5nCWhOd8mTqmZrpv/Yd7mbKAqG+f8kVW+3TkWle7RF+57hvdoVVE5tId+4wstBT
         KKnQEOgkzR61RmsOJuGAkWRBj1zdJqK9sISHGMpRm0IeQNADDnNxEVdl9Z6XNvfyXGP5
         u9jzlOWga5t1c+XMXnT8J2s0ZAR/yMWWmyWIw12hqDou+Prc4Z/7UIW8osFTMJkpP0YI
         +749AH9e7aGwn2DRqPmbsJ9c4x9ofeqpzMfyhiO7eAxgMJPRUFttJS6QiSXl6sgtAb7H
         WdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689077967; x=1691669967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4NULi+Pg3BzaFa9S+uijdnxcMxII5T4dtt9x/IhMZ8=;
        b=DaymWp5kZviNlGpStNgSO4voAIv5UKILVpBKZKwps7NDDN6k7wOi25M5XalJWXJNmv
         +MVWJ+8eEzH1BSdzcAlh/2bByDKldNKFy2MK+McvSjfzfICh+/nqGEdG/rhxA/dLoa7+
         hlGdHp1D85/FiLURJ4fsP58OST1F8LKr1QQzGpFhon7sIn7mhoJytDFFHHMsZ2r/gcGd
         MRNbY903vKGVUHd3bhSU0NdXLaoi8TQvKMkaZpknW2qsfBpDvRgapvV4ux1oZmblZbr5
         moUZi7f8qHfJ5xQVo9SHpWKAdzviu+f0Az5ot6BHRKBJXAStHeopbkFVobtO/7+a8SY2
         GieA==
X-Gm-Message-State: ABy/qLbIZ8atAMKQ5uHHS4o7G2+IaZkEKeGMRF5yROCUgi4gE3g80y1C
        Aj+fMl85LyQ0WTXQZ6Yt49/T9Q==
X-Google-Smtp-Source: APBJJlG9xsUvTuE03igdC3Ho1c17TBaguMFId7SIKc7FOSZ2/1jZ/jWeJIIt+HonBcxtInnXGwgTqQ==
X-Received: by 2002:a2e:7215:0:b0:2b6:efc7:2aee with SMTP id n21-20020a2e7215000000b002b6efc72aeemr12050313ljc.51.1689077967029;
        Tue, 11 Jul 2023 05:19:27 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id d18-20020a2e96d2000000b002b708450951sm435563ljj.88.2023.07.11.05.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 05:19:26 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Jul 2023 14:18:45 +0200
Subject: [PATCH 46/53] arm64: dts: qcom: sm8450: add qcom,bcm-voter-idx
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230708-topic-rpmh_icc_rsc-v1-46-b223bd2ac8dd@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689077904; l=1005;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SQpHj4TfmA+4UsCzDDjRNhiu3Ox+vTnH5LdKeWnrUM4=;
 b=5TQbA1R0ncEPLIqSN9iQ3lNCQ1W1zper+KD3P7WyAqNmnUuh156FuhAQ4i0R2vj4WhJnt0hdW
 1FI94sDsjs4CxRHVepToXuIcyfT1PtDipM1ijKn6MOvhS5so+AWerUl
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To improve the representation and ease handling, identify each BCM voter

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 1668d97ce459..9c9645809af7 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8450.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
@@ -4008,6 +4009,7 @@ apps_rsc: rsc@17a00000 {
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";
+				qcom,bcm-voter-idx = <ICC_BCM_VOTER_APPS>;
 			};
 
 			rpmhcc: clock-controller {

-- 
2.41.0

