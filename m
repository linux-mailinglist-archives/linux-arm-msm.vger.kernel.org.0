Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4438D5B1855
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 11:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiIHJUG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 05:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiIHJT5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 05:19:57 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B42A31357
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 02:19:56 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z25so26729058lfr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 02:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=751surAPxPI7nKu0MMgW0W0B94zgA9MhkjYrnO7nGnI=;
        b=PuPGkNjtT6B9Vr0jSKszhti/biwZaWxyshVjYixpUSMn0KigF0laZ852HWOGXU5baK
         ZFYtiF0QhfkMzZxLuOUTv8Qsvk0CD+l6wLpxEs66DQjTCpXO5i4pM4B5/xuqu5bsClJr
         pOD9us8IrovpKwwyeH756ct4zYNOmwO4fu92yiE+f4INKh6M5pMkBpRUuCsLkwGvC2hg
         YLH9HPx2sbjxPDbSWeGueK23xmd6tkjVi7L3wSk5lfxREpmY7R1rr3KlQXJqorvWxqCC
         SHWb7mHR8IYHBG1G+8k06rq4uzh2ck1LWsi9sOXqXEFnKSzvIlNO0Gro35Q2OV5RqaHc
         21Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=751surAPxPI7nKu0MMgW0W0B94zgA9MhkjYrnO7nGnI=;
        b=WsHDgkthKqNrqkCFf66wGyGbApeSRzJ/UfxL3A8VET4bsMkP8SfLO7/0eP0wScpZAV
         W8ervNEHgMmTZcyzdN3WFVU3RTZ9Mz9eY8ixNeCg1S3ow9cs7dPLwA96cv/V6/hK8xkF
         0wQ1tLgOivgBqlvC6rsprcAphQNqBJJmPSkv3u0i7hd1oVEhc8VmWzD76I6aEF3vB+9f
         Zh38FKNqioq3EhciieNp6JXo6RMd0cIrmyfwLsREMSDD+5X5tmoyooIqxmmS37zdG/3+
         4LwLUOdkTuPtu5JguJtPAjvoXoazoXoz86E5K4UBuXfZq2m/iQe82tmKI8kWdzcinrM9
         bCAQ==
X-Gm-Message-State: ACgBeo0KeC5jXaHQDilor2eMze3dfICd3Hg672x8EVJs2Rl6w9NSPcIx
        ZxiCRuAvOI3KnguIUzHXoI5Evw==
X-Google-Smtp-Source: AA6agR4smf+/sFmgq5vvP1pJNHHG8LvAudVpkl2pkMm1d88+KlKqaxkaalEXMokbdD3cwJdCkN3iLQ==
X-Received: by 2002:a05:6512:b08:b0:492:87ad:5f5c with SMTP id w8-20020a0565120b0800b0049287ad5f5cmr2688256lfu.293.1662628794396;
        Thu, 08 Sep 2022 02:19:54 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 02:19:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/14] arm64: dts: qcom: sm8250: align APR services node names with dtschema
Date:   Thu,  8 Sep 2022 11:19:35 +0200
Message-Id: <20220908091946.44800-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DT schema expects APR services node names to be "service":

  qcom/sm8250-sony-xperia-edo-pdx203.dtb: remoteproc@17300000: glink-edge:apr:service@7: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index cf5d65940174..84b4b8e40e7f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4782,13 +4782,13 @@ apr {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-					apr-service@3 {
+					service@3 {
 						reg = <APR_SVC_ADSP_CORE>;
 						compatible = "qcom,q6core";
 						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 					};
 
-					q6afe: apr-service@4 {
+					q6afe: service@4 {
 						compatible = "qcom,q6afe";
 						reg = <APR_SVC_AFE>;
 						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -4805,7 +4805,7 @@ q6afecc: cc {
 						};
 					};
 
-					q6asm: apr-service@7 {
+					q6asm: service@7 {
 						compatible = "qcom,q6asm";
 						reg = <APR_SVC_ASM>;
 						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
@@ -4818,7 +4818,7 @@ q6asmdai: dais {
 						};
 					};
 
-					q6adm: apr-service@8 {
+					q6adm: service@8 {
 						compatible = "qcom,q6adm";
 						reg = <APR_SVC_ADM>;
 						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-- 
2.34.1

