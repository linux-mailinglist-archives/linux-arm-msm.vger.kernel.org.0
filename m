Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FE325EA44
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 22:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgIEUFe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 16:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728878AbgIEUFS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 16:05:18 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DAD4C061245;
        Sat,  5 Sep 2020 13:05:15 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id m8so784042pgi.3;
        Sat, 05 Sep 2020 13:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lMN6Aad98rZkq5O2asxI/gYil5amAFJMEDxEz6HXvq8=;
        b=Pns3oHCbWFzzejByOVGuRtp6qKL3sl4mj7AykBUBeMIX6DG8SR1IsoN6Ja6JU7Mmo7
         89KRmzbpwRMJZgVFooJIgnPncIpgSt+0EQvYxbEtZvr/exYq5DPPfS7S+ncnjbEhencR
         RH5YuTk5AGbsVWb0tGdT7dOwa0QwL6iFKmCTJEejA59iNmhNep/3QwIBxY7vvSa5bfZl
         928en8I2HTpfpoKWubThI/PwTsU8ldfmeANtINBPqLG2F2UTWsghPvDW3iuMWy0jWS7r
         KftJtF16JX0Ubuj9I3CFNVPkiwX+Irnt9JioDg924zLZRFRuzWi8RIzaliNNfS10b6oh
         2IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lMN6Aad98rZkq5O2asxI/gYil5amAFJMEDxEz6HXvq8=;
        b=gsswa0AuTNL3NBr2ilwjPw6uyrmZEYEpm/VxQ0lT+RPVV3lfux3ksRNnOWxZBhSOri
         9cFnuUITkNI5VDteOrxkOtjBAPZLFehlX6uSplNjb7re0GqxzlBOqVHmmo4ssX7uq3Kg
         SPNhisQmmyBISc4x048VAlUduiPXhcaVYNzDlvQNmjSNVgQTXRlr3XHCG0DBT2kxdSM7
         43e2RJFfl3JlEzoecH3o9SNJsy1GUxZ2DkW2ZmDzzO+lkbDNFvIc3VY1CbebFzn7crfY
         pe/X4DyhFVQqHQV6wGfZ9HK+uvyWZhi3IPRgCVwKsMH0R3O/w2OdiNqjyuMet1vZZWFI
         Azww==
X-Gm-Message-State: AOAM530ttS2knHCh9VCaqcDMXGbXf5owIXUwQNccrVhlmb0wDyNruIAk
        Xb+AQajty+9JuzNj9PNyGL0=
X-Google-Smtp-Source: ABdhPJxtD01crAlFjZ6W6bU8A0+Jv4zKtX9LztW24Q4Cb6srFiKHgkdX/x8tPcvikAdykSvAmRGnSg==
X-Received: by 2002:a63:fa10:: with SMTP id y16mr5293364pgh.304.1599336314974;
        Sat, 05 Sep 2020 13:05:14 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id e18sm8722752pgr.53.2020.09.05.13.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:05:13 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v17 20/20] arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU
Date:   Sat,  5 Sep 2020 13:04:26 -0700
Message-Id: <20200905200454.240929-21-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
split pagetables and per-instance pagetables for drm/msm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d46b3833e52f..f3bef1cad889 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1937,7 +1937,7 @@ opp-180000000 {
 		};
 
 		adreno_smmu: iommu@5040000 {
-			compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,sc7180-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0 0x05040000 0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
-- 
2.26.2

