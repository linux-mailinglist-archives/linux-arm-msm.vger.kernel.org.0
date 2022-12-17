Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABE7564F65A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiLQAd5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:33:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiLQAd4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:33:56 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956C11C128
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:33:55 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id m29so5698079lfo.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9QikgN2b/2kcMXulhTPwK2yShS1rPbgxSvk01w9ZqU=;
        b=TIoaoSjTrzFNTph4D9SSVqPR2xpPlRI22iQYVn/Dhz2wjIyYu8jtJNfxAu1k3uK9sF
         YMBtj6emW9KYKQklnnij+fmTvVXzpsxjiQOiy/29lJ1RJkEFub3kQi7crLZVvOeyMoj4
         RhS6BED1UcGEHWfX7zsqW3ygMDCGHUO3aEngqElO54vbYc1WZVMpNZqywB6dS06LLvWv
         sOV9WplFRo1vuFf7kEiNjdFtKeR6IZ8pKudcN0kOl9RQQiPP3f4Fhljt7aRAt89sUQar
         I6AjEuH1iqCzE5OM2Wp1aKRKQ2t0Tp1HBwFQyw/Gofe4ULHIQ01e5CtKzeeJTv1GfiWP
         3oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9QikgN2b/2kcMXulhTPwK2yShS1rPbgxSvk01w9ZqU=;
        b=UF1xeMtENW4ZrNNgOOKB9HXVG1GqZp65+vkVjZgs9tJeVxODfbsu6YQc891u+jrn3L
         LArmNlvP4ZmfvPfVJVIbrmjEnBa1t8JGIisfoaJrTH2ASV+sTccWCSUDzSxE73wrJIVN
         GR1S60ije4p+q8ip22gWCy61l45FbURg/+O7Bll9C6DGhU6iCjuJlC41hS4p2ET/fvQj
         2E5WxYXq9K8qOD3800zpHM0JqU5uYlTrN28OJqZb12DW3NGTAOoNMvfCAyjw/cQTIgDw
         fJc9T3V+I8MjX/hPSBeSIyML2FAfphK8zk+Eap+BbLcJXtNtgWVxmkE9+Fwg+/HSWNGb
         8AHg==
X-Gm-Message-State: ANoB5pkIhapT96j06gFXVkFHaormWt75Vhu0+IBeTt2OiguT1dmn53I8
        SqIfXMsVo3524auwxUuK34hz4g==
X-Google-Smtp-Source: AA0mqf4dEC4yD2OvoHiprB2q4busfuybi9XTbdRQTvilfFOTkwZYBorOABMQomfgH0ZXOPcw6885QA==
X-Received: by 2002:a05:6512:1108:b0:4b5:5ca8:93bc with SMTP id l8-20020a056512110800b004b55ca893bcmr11229908lfg.23.1671237233978;
        Fri, 16 Dec 2022 16:33:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u12-20020ac258cc000000b00497b198987bsm351458lfo.26.2022.12.16.16.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:33:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 4/5] arm64: dts: qcom: sm8450-hdk: add pmic files
Date:   Sat, 17 Dec 2022 02:33:48 +0200
Message-Id: <20221217003349.546852-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
References: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

SM8450 HDK features bunch of PMICs, add the PMICs which we have already
upstream files

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 4de3e1f1c39c..c951d7a6d6df 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -8,6 +8,9 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "sm8450.dtsi"
+#include "pm8350.dtsi"
+#include "pm8350b.dtsi"
+#include "pmr735b.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8450 HDK";
-- 
2.35.1

