Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60E0D6511F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 19:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbiLSSbn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 13:31:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbiLSSbM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 13:31:12 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC2B13F01
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:31:04 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id o12so9952925pjo.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WUljA05hxjrMgWInu+aANTEuP2TXhzChwqlFzG2wks=;
        b=F82pN6mgDTCdxMwJoTeS4XcJ04BEgKG1pr4R0yhvIl6Vk5epgcY/fWyp9h7TAQTS8M
         R4vbqnLI4VSXfYpzjMLvm5Rv5ijmloVyOUhS41gw2KoPvcxcUtxSV8atXzOOn6aBK+bP
         6fM9f4dBMCa9Z3+/MpqxPg65yqXJ9SoqHSCV80/uUbhYxy+9E2myRaY6DJEyx5BsMOz2
         Yau1CWC7WcIngvYw2lMbWbwYadRhqXXsd6OGDiY84P6OAxJ4sULU8wB/FJW7VT/MZNsG
         WfLdoKNJuEGXwHwc4MUi0Hui7IrFbzOylNY9zDA751x8+x8OnNwsw3zxHJIVRTvNNpad
         vHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7WUljA05hxjrMgWInu+aANTEuP2TXhzChwqlFzG2wks=;
        b=5RLH7CyRbuE6BRkg4CwtlC1PQx2PnNs+Ke+Owb7C0Fu9LTUwhcUK0X7ynqoYNg+FFP
         qfWPz+Frs9Fo6LcexfqHvlmLnK7iojzI+Pvc2n6TMVdQIM7OBSQsyMdsvZ65l8DRYOb4
         8G/1tGkT0IyPGbIic0ZZioFB9xbhWBKxF/ETpkV7fakRYzD8xyjrEDQll2bzWXkZwrfI
         PY5vzXkI/tGv9PR5wJErvWvWvWqH1uX01ZopWYj3bXjZG4bU3WCgleJ0KM/o8NbXas2k
         Ag5o1xfgjDCE1eY+dMMMIUaEj/EMz+xdyiKcJSCo3zBKwQ7M1bE/VabOPg9nBSXlpykk
         itMQ==
X-Gm-Message-State: AFqh2kovY8OY5cA25gWtqL1H+yD5btETBQGRJtzKNqPnqGi4KnZX2Ms1
        ULi+adZBchahUQWGsLUymiV0
X-Google-Smtp-Source: AMrXdXthRC3piogUeBmZSHZFmCG+E+nhCrjYHodw1PX6uS5c6NN6i7Z1RDz5S6Ua+TGxjHFLeKVtjA==
X-Received: by 2002:a17:902:a38d:b0:185:441e:6ef3 with SMTP id x13-20020a170902a38d00b00185441e6ef3mr11628908pla.61.1671474663607;
        Mon, 19 Dec 2022 10:31:03 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.17])
        by smtp.gmail.com with ESMTPSA id d2-20020a170903230200b00186e34524e3sm7480979plh.136.2022.12.19.10.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 10:31:02 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 07/15] arm64: dts: qcom: sm8150: Fix the base addresses of LLCC banks
Date:   Mon, 19 Dec 2022 23:59:50 +0530
Message-Id: <20221219182958.476231-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219182958.476231-1-manivannan.sadhasivam@linaro.org>
References: <20221219182958.476231-1-manivannan.sadhasivam@linaro.org>
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

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index a0c57fb798d3..7fd2291b2638 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1762,8 +1762,11 @@ mmss_noc: interconnect@1740000 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm8150-llcc";
-			reg = <0 0x09200000 0 0x200000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x50000>, <0 0x09280000 0 0x50000>,
+			      <0 0x09300000 0 0x50000>, <0 0x09380000 0 0x50000>,
+			      <0 0x09600000 0 0x50000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

