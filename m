Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2426CF365
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 21:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjC2Tm5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 15:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbjC2Tm3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 15:42:29 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23815BAE
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 12:42:00 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j11so21620003lfg.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 12:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680118896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XoOd+U1Vnod8w61xeHS5daG+82mqAqim0JIX10yOYbE=;
        b=qrxTbeXaNejCw05f80MhPPTqgP9xg3w/ngbanNIGEExxljc9G81Ss24aMelZSyRiK7
         En0pi02ofPIsOJA6Nj7oykClDfXg5VvWyh3znXbTEwPNivuHlF5CCkJ689ByQefg1By6
         BhmkHNxqVqs90UaZ68RrTmeQW8VdjqBgkn1XOVkpqSpP4sxRt+j4IxfssT3KDj/Shzmn
         m8bBT1zGhXVFFHAtvQbZdRcnoqV45FVHjfW5dK+7YeWCVzMnRA7n3PPZ1ZOi5yS4uycn
         fzSZr+h1oCXFSvOi/MmFXXQManP9QtqnK1jMOnVORruXjtsLKtuBo2KmmpE9KwGFzkUq
         v2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680118896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoOd+U1Vnod8w61xeHS5daG+82mqAqim0JIX10yOYbE=;
        b=ColLsfafwtQszchCqcxOqXAD0cbgXjgG9RkmcJSrU8Fwkss26ZKPiyiueo0Ahz3nh6
         fl5ASoOciRVVflkIY1e0pyHuADmOWoRysY1tEPFoC9dwRhfAiTPN3nmILlXgp86EJgpT
         ztDiJ+JXdS+gnzKA37URy6Vzpc5FYqoHKRKl7e2mrPldbWz6ECo6XzuJzQa8Ur2xKzbt
         jDGV6eRXPt65mRLti3Ne3lGiGEEsPsosVuEAGZjibFUHKHzcSk9aWrZoftaulFWJ8qR6
         Fnsejr8OnDlYSvEeuVWU7kw/oLF7coIC6btTfSBhI0WqaAXGMi9E4OP7Z6u1et3q0U0+
         4hQg==
X-Gm-Message-State: AAQBX9cwC8vV5aLDgohzprmsQGirMSjasaAAdMpc0dXdfkNCoLMILU5+
        LGJWm94CrwLMQ1FA4xPpyls69w==
X-Google-Smtp-Source: AKy350ZOIqhChJeHbre7LCxZ4XhUlzWlnGO7rGw684OFWj0jIvaiWTtt6lY+YO+Ju5W8rrEetvRt1w==
X-Received: by 2002:ac2:4884:0:b0:4ea:e628:356f with SMTP id x4-20020ac24884000000b004eae628356fmr6313819lfc.48.1680118896446;
        Wed, 29 Mar 2023 12:41:36 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id q22-20020ac25296000000b004eae672e96bsm3955048lfm.255.2023.03.29.12.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 12:41:36 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 29 Mar 2023 21:41:23 +0200
Subject: [PATCH v3 6/6] arm64: dts: qcom: sdm845-tama: Enable GPI_DMA0/1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230313-topic-tama_disp-v3-6-2b1567c039d7@linaro.org>
References: <20230313-topic-tama_disp-v3-0-2b1567c039d7@linaro.org>
In-Reply-To: <20230313-topic-tama_disp-v3-0-2b1567c039d7@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680118888; l=728;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=58eaqsVsaQNX+LDPe2xQAD3dX825ROO6GCnfX9zNSQw=;
 b=ZnyuLFOGLb23C+WDrAPS7HPoY+m2HlNaJlhdQgZNPAxji2Psk3F8DUJNHOb47oAqJ74yCVGjI+oc
 ROrTbHQCBML0EFG5Fs7fMtXX5FYmPET2iD47WcK217wqsckoyaNd
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Enable both GPI DMAs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index df8dd6e45a38..420ffede3e80 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -417,6 +417,14 @@ &gmu {
 	status = "okay";
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 

-- 
2.40.0

