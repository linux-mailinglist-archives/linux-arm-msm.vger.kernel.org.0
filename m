Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED9E46B8AA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 06:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbjCNFjE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 01:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbjCNFi5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 01:38:57 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9292695BED
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 22:38:32 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id d13so4256849pjh.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 22:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678772310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sggevdgcbKkipnWP4TBoy7JyP1Clj0YxXKdQjrw2BUc=;
        b=yt8ROJAiLtl01UPND6vY+ee9uaQi/8WI/fmaFZjd+WARpr5QhAwJlxkaCLRVUsV45J
         a/Im2ar7+D6BWDGaYyDPOQYIuvjqwu/lMDtXS6HYLpkOTK9SlaJorjDwY4AiBfuixPgK
         n+Rrc7U4EyZhLQD5bK8QzEIXujYC7WctbXNgznPZM0GnLDjV+bJeU9+GZTysKDloY9ot
         84UquxeZdLt/QYItlA4PEQBvSstAkEaizAiEXJys9iqwHBkANYNFC5UzdTGNtdiun+kN
         SvOY+stsGovsfH2kC7y74gY7l6XnlJeRuepqSZ8nvcWiIu8+IRjJtfqTfjErVoFSveiE
         8c0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678772310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sggevdgcbKkipnWP4TBoy7JyP1Clj0YxXKdQjrw2BUc=;
        b=fjRwacNCaichkB+BQZHfbDrisMkRC6aHRkbFj9I/vvyOA8yZLYSa1+cKEOFDPntgfx
         5dQIogydJIpb5r6gk3lx/IuHNYJB2SYXamOcipLfKSYVhgsrK3fdTgVOb0BdXnLYm7yV
         u2iyMzliPOedpF4GPUGOE/lH6KRttZujTiuw89UcK0KDEtH+2TJA8BHKf1b3PR1mULsh
         tBhgpApjSvP3/hjVtmrFZIN0A8Al9N93RopH5pApf9ZR+0TT8OgsbUdkX/eGnnyjvstu
         KPQqIB7Gy+uiW7JYxXeJ153ES6ksj0jkNy+OS8HRvhcga+/9ONkhPQoT4YPpQupbY9yb
         XMvA==
X-Gm-Message-State: AO0yUKX604lrG0xxiphh9zmp00QYW313AdbzRCjLvfkuoVa7g9kb39vU
        1kDmilUasV52w57o/4c8Vjhq
X-Google-Smtp-Source: AK7set8J2YOqM/obKfneF5oJ4/irJ0MnLg0HnPZ1wHK5/1ZdM7yRo+pq4RNQgDr5hGXicXYW19sPIA==
X-Received: by 2002:a05:6a20:4c2a:b0:d4:b5dc:2909 with SMTP id fm42-20020a056a204c2a00b000d4b5dc2909mr3342007pzb.28.1678772310119;
        Mon, 13 Mar 2023 22:38:30 -0700 (PDT)
Received: from localhost.localdomain ([117.217.177.49])
        by smtp.gmail.com with ESMTPSA id n126-20020a634084000000b005034a46fbf7sm675093pga.28.2023.03.13.22.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 22:38:29 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, james.morse@arm.com,
        mchehab@kernel.org, rric@kernel.org, linux-edac@vger.kernel.org,
        quic_ppareek@quicinc.com, luca.weiss@fairphone.com,
        ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 11/13] arm64: dts: qcom: sm6350: Fix the base addresses of LLCC banks
Date:   Tue, 14 Mar 2023 11:07:23 +0530
Message-Id: <20230314053725.13623-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314053725.13623-1-manivannan.sadhasivam@linaro.org>
References: <20230314053725.13623-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

On SM6350, there is only one LLCC bank available. So let's just pass that
as "llcc0_base".

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Tested-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 1e1d366c92c1..63e55579e9c4 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1348,7 +1348,7 @@ dc_noc: interconnect@9160000 {
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm6350-llcc";
 			reg = <0 0x09200000 0 0x50000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg-names = "llcc0_base", "llcc_broadcast_base";
 		};
 
 		gem_noc: interconnect@9680000 {
-- 
2.25.1

