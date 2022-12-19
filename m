Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7786511EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 19:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbiLSSb2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 13:31:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbiLSSa7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 13:30:59 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E15113DF8
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:30:57 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id fy4so10011858pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 10:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVKI7LzAkCeTNtN2kaZFbBM4yejfzWbEhk9TFnMYwYw=;
        b=UxB7+9w6f7UJlhWOpDUyHTNq8ztOUfkD4+3HYjVO91urw/5K7AseDU7s5oKm5RR2lj
         ZqPrgyJ4RxNuChOHOO5X0e6x9IDhyKcbAXI0NOeWqjorGuGbD1MKFgSqQ19uuNh/z4jE
         hMGBPhSTZCPu19sx1PZ6mF9dN0JpFJiQVTOxbCnV/8aVi7+hHTbYC5o4zY9wHEbovuE6
         98mS6TR7ZUo0WuHmcaECXkctdt/pQKFEhe7rATXihPK3/nk/W1DRmhK2tlSP7AERhBCp
         0iqdvOEbTc7sY56kZqnIlHGKG7dFavwOJheArqnJAURhW3UcoDzjoDfSMnaZqoNWcrFW
         hwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVKI7LzAkCeTNtN2kaZFbBM4yejfzWbEhk9TFnMYwYw=;
        b=aIMCyfg+8bCgsH8uH2Lx/DBDClBV+o+Y6MAJItAEhk94blQWXYyb4JuZN+N1yv21E1
         AL8GP30yY7sF7G8507I5K/f/oLDsHBBbyitE4et8RJXeZdElZ411j34S6Sjr4x1dOmL8
         9R5jW6/zi2VRE3FdMUZnr+bcSZ3o7nTRPNNgjc5wfnpKczE3luUpMT7QuShqB2WZSxsI
         vTporgdP6AF9wddTC4kLQXS0M8TjedVNuMBeHNW9VzabccE1lyABClL4bN7r9A+NattR
         evF+qgW48b901fut27wVmNuQYQQu7IGYdgzstedb7cJ9NN09dsNYWWIQ2fC6x1GLMjg/
         cKhw==
X-Gm-Message-State: AFqh2koLbQi4h6YHdwrlTJjQvJH38PqhuQza7aIipeUbDvqjMcx9dnIL
        dnlZLcWzdIkQpBJOQEyrCOvj
X-Google-Smtp-Source: AMrXdXvnE4yBEgROtRiLQq8WY6t8lYQnV7qdY3YWNHLdDV/OujYXa4WK8JSfN8dh9VvjBESJzfUnvQ==
X-Received: by 2002:a17:903:2404:b0:18d:61f6:e254 with SMTP id e4-20020a170903240400b0018d61f6e254mr10518563plo.33.1671474657058;
        Mon, 19 Dec 2022 10:30:57 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.17])
        by smtp.gmail.com with ESMTPSA id d2-20020a170903230200b00186e34524e3sm7480979plh.136.2022.12.19.10.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 10:30:56 -0800 (PST)
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
Subject: [PATCH v3 06/15] arm64: dts: qcom: sc8280xp: Fix the base addresses of LLCC banks
Date:   Mon, 19 Dec 2022 23:59:49 +0530
Message-Id: <20221219182958.476231-7-manivannan.sadhasivam@linaro.org>
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
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 109c9d2b684d..0510a5d510e7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1856,8 +1856,14 @@ opp-6 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc8280xp-llcc";
-			reg = <0 0x09200000 0 0x58000>, <0 0x09600000 0 0x58000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
+			      <0 0x09300000 0 0x58000>, <0 0x09380000 0 0x58000>,
+			      <0 0x09400000 0 0x58000>, <0 0x09480000 0 0x58000>,
+			      <0 0x09500000 0 0x58000>, <0 0x09580000 0 0x58000>,
+			      <0 0x09600000 0 0x58000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc4_base", "llcc5_base",
+				    "llcc6_base", "llcc7_base",  "llcc_broadcast_base";
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
2.25.1

