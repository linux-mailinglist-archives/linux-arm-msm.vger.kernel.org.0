Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97F205B9EC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 17:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbiIOP0l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 11:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbiIOP0i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 11:26:38 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4601476DD
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 08:26:37 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a8so30875186lff.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=NGazZew8Y/T93RBEu0rYu+/kI7DSokoP451E6Z1yuOs=;
        b=lOBzlr+RwiNVd00cmYqUTdvRuhX+AKrMsHzbiHOo2bxswHOV2JuFqMEdCzS0RXt6zG
         o077pIe/KYko7PZAQmOLUvS4bgxEL9BguHl/LHIgQTnACRIYYPcRc+K9vLLoEJ1QTzSL
         KIiFVnmJCBYLGL6leZmHA77dfmNvtWGLL83c7hacH5D4a+q76SlMv7s7CpS1DP242klN
         yGA5wyROzDiI362WAx+E9H6XjJQRK7P/TeMdpcjfMzSgLXVLiHR7DAoEqi6PpEV5JTJp
         55jz8zySBqJPQaqRMB8DRq+rACJF5yhn02d75drCRUxUPtyFjci/Abz2/UeV7fLz9LsL
         L7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=NGazZew8Y/T93RBEu0rYu+/kI7DSokoP451E6Z1yuOs=;
        b=K/0vT6Sry/MwyrsTvZpZSNTIlwklojDH2lsf94QQDo2tnDVpvvO/pZk6aeIeYMn4dt
         EvdHy+99kLW4pnrNEbdz7e6GuqF57DJbjhtaN8SFTiinc6weA8EMMgCVCSuBD+PWbtFT
         SMVY30b48M0d54Y8cBvYuCw63tvfu9wSIhMnW7fqKiD3tsh6/zUYKYdGc+/qgnhKxJhG
         bv4MEX8H/ltgrqT9XFut+AUzzsmGIhUMWtlyPfDCvCY2PLwe/S7k+nA5qIoJ2VUKLjy1
         nKgBhDDmL6M3omdVYJmkGJu4aSzU0/cD0QrdzC4QiPHm7By/QcjuYAexrVkVXlFW5/oI
         JxWw==
X-Gm-Message-State: ACrzQf1WRhIm6ncEhtoHi3xIDVQWKNG0WMuHRQoCxoH2feJ0fIivAGxC
        8LPNMNcMgBKJrjLRxKFQQ41FDA==
X-Google-Smtp-Source: AMsMyM5jItUWEij2YWgUvDvnmq+N3TKx5OZ8y6WEEGX3GvS/98us9DDqj3iJtLi0vM1TdhePZbUG1Q==
X-Received: by 2002:a19:e308:0:b0:494:6cb5:8e3a with SMTP id a8-20020a19e308000000b004946cb58e3amr135598lfh.680.1663255596238;
        Thu, 15 Sep 2022 08:26:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a18-20020a056512201200b00494813c689dsm3012653lfb.219.2022.09.15.08.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 08:26:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 7/7] arm64: qcom: dts: nile: correct firmware paths
Date:   Thu, 15 Sep 2022 18:26:30 +0300
Message-Id: <20220915152630.133528-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
References: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
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

Correct firmware paths for the Sony Xperia Nile devices to include the
SoC name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 09c07800793a..71b9e3170d63 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -155,7 +155,7 @@ extcon_usb: extcon-usb {
 };
 
 &adsp_pil {
-	firmware-name = "adsp.mdt";
+	firmware-name = "qcom/sdm630/nile/adsp.mdt";
 };
 
 &blsp_i2c1 {
-- 
2.35.1

