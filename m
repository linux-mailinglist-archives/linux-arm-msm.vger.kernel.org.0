Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0015496CE8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jan 2022 17:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234451AbiAVQcv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Jan 2022 11:32:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234480AbiAVQcr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Jan 2022 11:32:47 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B73C061744
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jan 2022 08:32:46 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id 15so14427552qvp.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jan 2022 08:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xi6Epe+O63qC2bPYwLhP+7XAxexroUTZOcN3RjcdwYc=;
        b=zZiWJkEJj7gkgpFfiL8+Qcq3iYCvUKc4tQa1qAYdIa4FzHEprH5jH3QbvhRB9OV0H3
         NYvDLa3z02FmjRs/pdWWyPtMolo32YfSQztd1ETs7yydgO+HAKRdvPlUM58iRk1VQGjQ
         9H0iiIoGR1EQm2nuOIhswXYyj8FFD90Slnvk5nRbXkOiRlm5gVlzD1phJXKRf0der5WK
         w7TgmoYFlG2etXShrW3MnokTMiCOmIXWUHOmGZmUN1/9KQBzCM6vAJah7MMVTcnLtUDi
         r6IHTISIhhAX8iYe44o8VklWfb3Y0/ILg4mLgu3xo4gSip4E96tPgGgoDuqMHHWITKxr
         tdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xi6Epe+O63qC2bPYwLhP+7XAxexroUTZOcN3RjcdwYc=;
        b=YJKv1H8JdwN+y90RCywzNekTV2xK6u6X+ZbrcE+K/4L1CgYfE9w/nT1B3JZ/eJ6u9e
         ba8R6WXr7TyHTNRRiRFteLkLnfHn19xUtiUllU8qpr2cVHrqcvmWHBdOV04O4fD2S0+l
         fAOqaw2E7FXKsr6nEg0FAIkhmeuoAX4EPv6edE+OfZf8jpMvNb8WNihwYdIY4lNd7LAc
         DXCG4xEHJ+iYLm9O62evOIdDZ5o7lNGCc0gd1F+4ZIoQ01eiYjr/HdYfgKz/XByMFZB3
         AoqlOqBR37c+o5qQ7KqEXHL5of3S3mOZeyT5LC/fTaj3vaqcLY7i0JjkfCOY14s01+sh
         PUDw==
X-Gm-Message-State: AOAM531uuQEVcXCAdQ7k/6U7sex8X/pb9g3JkU9OJQ0B7YJZzd83dVts
        GcKLvdmo7mhbgOKfZoXt0EqsPC1AAhGJULuS
X-Google-Smtp-Source: ABdhPJwb/Jm99YoLQ3/xxKudwqDLeXqNgcKFveEo5sXqa3tcV0J1phIo5ww72GLZhP9AFEiuthcbKA==
X-Received: by 2002:a05:6214:4008:: with SMTP id kd8mr8123868qvb.5.1642869165665;
        Sat, 22 Jan 2022 08:32:45 -0800 (PST)
Received: from localhost.localdomain (modemcable134.222-177-173.mc.videotron.ca. [173.177.222.134])
        by smtp.gmail.com with ESMTPSA id b140sm4806440qkg.108.2022.01.22.08.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 08:32:45 -0800 (PST)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] arm64: dts: qcom: sm8450: fix apps_smmu interrupts
Date:   Sat, 22 Jan 2022 11:29:32 -0500
Message-Id: <20220122162932.7686-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20220122162932.7686-1-jonathan@marek.ca>
References: <20220122162932.7686-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update interrupts in apps_smmu to match downstream. This is fixes apps_smmu
failing to probe when running at EL2 (expects 96 context interrupts)

Fixes: 892d5395396d ("arm64: dts: qcom: sm8450: add smmu nodes")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 5a98f2aad7099..aef8b6814cda0 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1076,7 +1076,7 @@ apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8450-smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;
 			#iommu-cells = <2>;
-			#global-interrupts = <2>;
+			#global-interrupts = <1>;
 			interrupts =    <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
@@ -1163,6 +1163,7 @@ apps_smmu: iommu@15000000 {
 					<GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.26.1

