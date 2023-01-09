Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2D146627D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 14:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237066AbjAIN5a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 08:57:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237144AbjAIN5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 08:57:00 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C6421BD
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 05:56:57 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bp15so13048360lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 05:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/etb6Li+SD1qbbc9rQxZclFqISGWC/9BhlatPB62o4=;
        b=vCtezC3cFYTmqwEK9IuuO5ETNM7p4cil2D5Jjn/TK/UBDfPHkHG50nj6u7OZlW4WM5
         O0V+M3m2vQg1QMNYcm4Pz/tYh6SktKQDys2lMEa/gLu+si5SU5OFkT+baA68uA9HwvHr
         2CKndpT/k+gZGtMgRSIPJniu6L6skl8cOC16jSA70mOlLYIOX8+Oz7cDLOugfzeXgXOH
         aYk9kwll1E6Qhzdftqcw2wVyOirQ2qeZcoQ1A4QSet5bTta/bPUj1z22TPbDVID1h9o/
         MTwYJ6FUKytHuXZQh0Wz50wi9HKupKDZhGZlNUzEe33LdFQ+PSzg/gzjvFQ87bkxyd3i
         jKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/etb6Li+SD1qbbc9rQxZclFqISGWC/9BhlatPB62o4=;
        b=1tMzszpMKe4Zv6js65VDBu8KBO4UOw3D2FVVwFtOreMRzHYD97BVN6uMRvTmTWwaEX
         OJ8Fxe7CulATlhCqV4t8I3Q0FKHCF301zoY6T7eKonfSPcqMhjTa5Sle5zVnBkTihDBT
         uI2mT5Tjqwyi7lXJp7t6o8JT+dRs6cmphCs5pvenMSiSPPIqUchoSPxALFKHzicPpp9v
         wXepj57HxaeiRYxBxo7RuKG0rSGWE/gp72E2zbtAF44C+dLM6RTFpF7UkxSINg02LQdD
         h5q9wMT2m7ZdONt5F4ZeHH8y02zHjXBkzRmGW6iFZKrA8mrKgQU3I+WjQ2hn+Ry21aX9
         297w==
X-Gm-Message-State: AFqh2kpBInTQZP8jpyGxI0TVFy9UwKkko1Di5VoVn2R9BvP8QF23gZrm
        pLf0u+j1aQcb5ZTwqoEY/5Q2RUnUCNlFD/9C
X-Google-Smtp-Source: AMrXdXsxRujt/w9vMYb/h5KmybJyJUpBxB/ztrdQ4vSNn3xnQU7xA3eWTJ0KMpbpfj95ij4iJMgGCA==
X-Received: by 2002:a05:6512:22d3:b0:4b4:fbdc:a359 with SMTP id g19-20020a05651222d300b004b4fbdca359mr19491673lfu.54.1673272615522;
        Mon, 09 Jan 2023 05:56:55 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id x16-20020a056512079000b004c89b9fb1fdsm1638226lfr.68.2023.01.09.05.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 05:56:55 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: qcom: sm6375: Add missing power-domain-named to CDSP
Date:   Mon,  9 Jan 2023 14:56:47 +0100
Message-Id: <20230109135647.339224-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109135647.339224-1-konrad.dybcio@linaro.org>
References: <20230109135647.339224-1-konrad.dybcio@linaro.org>
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

This was omitted when first introducing the node. Fix it.

Fixes: fe6fd26aeddf ("arm64: dts: qcom: sm6375: Add ADSP&CDSP")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v2 -> v3:
New patch

 arch/arm64/boot/dts/qcom/sm6375.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6375.dtsi b/arch/arm64/boot/dts/qcom/sm6375.dtsi
index 4f00307b30e8..bf5114468ba5 100644
--- a/arch/arm64/boot/dts/qcom/sm6375.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6375.dtsi
@@ -1873,6 +1873,7 @@ remoteproc_cdsp: remoteproc@b000000 {
 			clock-names = "xo";
 
 			power-domains = <&rpmpd SM6375_VDDCX>;
+			power-domain-names = "cx";
 
 			memory-region = <&pil_cdsp_mem>;
 
-- 
2.39.0

