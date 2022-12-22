Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5514E6541A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 14:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235212AbiLVNSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 08:18:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235494AbiLVNSi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 08:18:38 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AABCB2B24E
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:18:34 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so1870622pjd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 05:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMev9I+ZdryrTBjzJ8tiTgJp1UwzDLK7UbgCFoQvzyA=;
        b=VBdAGtoyo4j2LV+Tuat5GuV++N4ZltEQvbVJe/poeH/NKjLl8sIWRKaOEc0HxyfGjN
         UccwIuH5LaAQZeB/Hg1/z7ge75Rjtqf9bB9xPhz5X2Wvg3XpryO5sLq/SyYjDGGGI1v4
         xNnQrbrnvGj8aku4FvL2Rp+CTFHcygeeiEYNG+FdqxxEak8M5JLLQAHJYYwMi5OHqu1Y
         kXVHR5fqO4ID2ul360A76+i81odlQh/l5Wl7HSVBCW04bgaRRZhABkoQiLbnNIwAyGUT
         IMFojxCV4ih5FFAeWNZZ461ke5qd3NAp4l/qjaaJWJb5BXAHAx+5GYEM6wkHC6e8657J
         Pr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMev9I+ZdryrTBjzJ8tiTgJp1UwzDLK7UbgCFoQvzyA=;
        b=qc8C/5Ha9O4ieb/BEhCzlgSSpfG+NYmCj6r5GfQqLdYuDdEMH1E3BFisN4GX++LWjw
         rGLZiu2ZayPK9ujrMGTBN/lI+wX3Q6iHOMbapGvSZb+poiABsfCoi3pwWWYs8NkzX5eO
         RwnrBNmaHPh1U1rQdzvxJynv0nCFx7ShOkfmLKoQRhCuZvYQB8HRWkxbybAdQ5zLSsUa
         Of3n5I8o7/qbo0XLbjospRtkLq52djMuVvLP/og1lg6EgDhrnUXUuIsVIdIrXjiV0RiX
         W/zF3WIt8MsQXqV0XmqN0nx7iAntcOVhDBAcG/SLh7I3SsbF1XlaLABiSWkcFPR4IrBJ
         8pow==
X-Gm-Message-State: AFqh2kr6PUZfXrz+6iIxVEY5/9IrFVwH3juNKCaVc1SmHmZde94dL61q
        qEgRVvxQLRU1BYHBGu+Awgn9y6OgZ9EVs+E=
X-Google-Smtp-Source: AMrXdXu1dtDcszvkCZLB22zWl7tN5MHyoiGrt+aug72V2pxhYmajpVvfW98nW284frJHcPzzW0ASag==
X-Received: by 2002:a17:902:8c90:b0:189:9fb2:255a with SMTP id t16-20020a1709028c9000b001899fb2255amr21318128plo.19.1671715114125;
        Thu, 22 Dec 2022 05:18:34 -0800 (PST)
Received: from localhost.localdomain ([117.217.177.99])
        by smtp.gmail.com with ESMTPSA id g12-20020a170902fe0c00b001896040022asm491570plj.190.2022.12.22.05.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 05:18:33 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 09/16] arm64: dts: qcom: sm8350: Fix the base addresses of LLCC banks
Date:   Thu, 22 Dec 2022 18:46:49 +0530
Message-Id: <20221222131656.49584-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222131656.49584-1-manivannan.sadhasivam@linaro.org>
References: <20221222131656.49584-1-manivannan.sadhasivam@linaro.org>
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

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 245dce24ec59..836732d16635 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2513,8 +2513,11 @@ gem_noc: interconnect@9100000 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm8350-llcc";
-			reg = <0 0x09200000 0 0x1d0000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
+			      <0 0x09300000 0 0x58000>, <0 0x09380000 0 0x58000>,
+			      <0 0x09600000 0 0x58000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc_broadcast_base";
 		};
 
 		usb_1: usb@a6f8800 {
-- 
2.25.1

