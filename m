Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF20780004
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 23:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355363AbjHQVjh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 17:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355339AbjHQVjK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 17:39:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E49910C9
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 14:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692308314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t+Q9qx3hi2h+g9EvT9tp6a1ezCBYFQCJEttZz/Qfdlg=;
        b=Y4QLRDilqiuJSUAggZ5U/5t1QTJkd1KSre5+GsI9nx+ohdwoJVLN3TPdpF5P5hYu/9WSti
        PP5Q4x9h95qDBiket7hd/m58Xs0RAFuKrr8r/API4n563Onb11nWq9DrMtboF78hXf41NA
        hXP7bVgxXEg42y1w1QpGFsUhpe1mxDI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-Wg5uUTE7NzGM94NIQcrnMg-1; Thu, 17 Aug 2023 17:38:33 -0400
X-MC-Unique: Wg5uUTE7NzGM94NIQcrnMg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-76d7a2c8133so37003685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 14:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692308313; x=1692913113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+Q9qx3hi2h+g9EvT9tp6a1ezCBYFQCJEttZz/Qfdlg=;
        b=LzI3U9vu+JerUBa2OGhgUj/wlYHbTEJe8wM0ESFbKdhocfSSpn7UINtQorngMcnQhB
         3CeETIsnp80wbtHDoy41RUOIk6netyKmgKWi5Kwdet6Y6OXh90ai4U3I1D/7FtHC6/RA
         3sPQ+zCRrERWjEMvk26UrgIGlWXznwhCs9mGTmq86QYS2nQsidgaGallGqnlM+BTwFZn
         8TGCPGb6R3GkBpu70i2xZ1dfb8P89zG1CEgpIkCndb2fp6Gao2L/ZSTIQ9RbnUryAWzZ
         XXQbMgoT7Zn2jBSuZSbRoSzANSGdBwij2m9KAclxFGuh58+ccVjqu4rUtS+5lo3E25kF
         g3sA==
X-Gm-Message-State: AOJu0Yx6bOY0HgnVmSc765Rhi4NYYmA3V8HAj+lL2LgY/G/xnUEKxkry
        a+3B0IFz7xncZ5YVLVT3pkB/tRmYalEUQZtprY1YV5OWOcqTdkrIC1D+kt00mDgzmyYRZtalmuA
        16xEvxbq6gD7iQxzam4qKPyvFSA==
X-Received: by 2002:a37:ac1a:0:b0:76c:a908:a50a with SMTP id e26-20020a37ac1a000000b0076ca908a50amr864838qkm.64.1692308312820;
        Thu, 17 Aug 2023 14:38:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq1VG3xXKaLS9P5CbXK1T90KNGC83SeOzg9rVLkO2mrfMJbAHDwmt3qJWv5sUZsTvUTHMI+Q==
X-Received: by 2002:a37:ac1a:0:b0:76c:a908:a50a with SMTP id e26-20020a37ac1a000000b0076ca908a50amr864819qkm.64.1692308312563;
        Thu, 17 Aug 2023 14:38:32 -0700 (PDT)
Received: from fedora.redhat.com ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id s1-20020ae9f701000000b0076c71c1d2f5sm96547qkg.34.2023.08.17.14.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 14:38:32 -0700 (PDT)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     andersson@kernel.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@bgdev.pl,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH 1/2] arm64: dts: qcom: sa8775p-ride: Describe sgmii_phy0 irq
Date:   Thu, 17 Aug 2023 16:37:16 -0500
Message-ID: <20230817213815.638189-2-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817213815.638189-1-ahalaney@redhat.com>
References: <20230817213815.638189-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's an irq hooked up, so let's describe it.

Prior to commit 9757300d2750
("pinctrl: qcom: Add intr_target_width field to support increased number of interrupt targets")
one would not see the IRQ fire, despite some (invasive) debugging
showing that the GPIO was in fact asserted, resulting in the interface
staying down.

Now that the IRQ is properly routed we can describe it.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 81a7eeb9cfcd..8fde6935cd6e 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -285,6 +285,7 @@ sgmii_phy0: phy@8 {
 			compatible = "ethernet-phy-id0141.0dd4";
 			reg = <0x8>;
 			device_type = "ethernet-phy";
+			interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
 			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <11000>;
 			reset-deassert-us = <70000>;
-- 
2.41.0

