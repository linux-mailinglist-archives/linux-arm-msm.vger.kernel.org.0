Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2207756C09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 20:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjGQS2m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 14:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232122AbjGQS21 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 14:28:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E191BEB
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 11:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689618394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=wJTm2sIpTjE4h7sdhEBM/hLX+zYM5Fpg+HS8CBke5W8=;
        b=GBbk5N+KT7p8NLseJBhV+8k+5aKma0FKsHTI1JXdjXBM8DBHYRa0l9B1q4Jt4GX1VMPiRR
        FVgSsviFfeZsswImkH3NhUqe02zjWwClVCJoIaEcDfd2d10e++kitRbNQWoceQhUxfM3z7
        Nw/HWLeH2ri4pDk3/MxzXNd808LJsqQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-myqpgUruOlSik9EkMYI3LA-1; Mon, 17 Jul 2023 14:26:33 -0400
X-MC-Unique: myqpgUruOlSik9EkMYI3LA-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7675581a4afso628294085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 11:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689618392; x=1692210392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJTm2sIpTjE4h7sdhEBM/hLX+zYM5Fpg+HS8CBke5W8=;
        b=Y5PSskwkMD5Yww+w9TZx6pGBIw7IrADWAZ1OzvgvqgLCRbixics/M0t2uQx592QWhF
         IWIs+CeSiGBaduyWlKYtb18brcdANB3K+YcpCChS0G8d1R5qYPdCuJaMEY1JQNLANIU5
         9JjMmU2HbvWkaMt+ZeXrhF6Wa1TVpFdZmS2EpXFU++dS9bxVhrtNrdsIDibKLp4O9+Bj
         9JAw3BxfiZNCPah3KcyWr5HGnQG9WB5YsJ0CR3ZfPt0yXDzQ5FyUzjSCZAxZ6bwnde2v
         GHng80WhGED3a4LW3+nPakOOSkIyxcWjbsdBzOPiO3V0RkcX5/nil5bTezCIu+zl26iG
         bq9A==
X-Gm-Message-State: ABy/qLYaNHfeQLRAwqpTb0k0Wdhkx3cd/Qj4k3Zzt0fgdSb3/3qDYsj8
        bnHhTLc1RvjlAZdzG6VHxTcgX5FsHYs9NQKVUhYkSSrWy8DhUUh0UgtVFDmkpnLiB36jZ8YbVIa
        QSTq1WNNhGpGwAo76MQd3lLYSq6CIv6ikJQ==
X-Received: by 2002:a05:620a:1a10:b0:767:9f71:2607 with SMTP id bk16-20020a05620a1a1000b007679f712607mr15474040qkb.53.1689618392369;
        Mon, 17 Jul 2023 11:26:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHLX61YCcwRVo9F/rqwsjWtlY4Lqws0jIxYuv3fjs9eD43nx6QzyAURvELlCSHSlIrCa+6pCA==
X-Received: by 2002:a05:620a:1a10:b0:767:9f71:2607 with SMTP id bk16-20020a05620a1a1000b007679f712607mr15474022qkb.53.1689618392123;
        Mon, 17 Jul 2023 11:26:32 -0700 (PDT)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id a24-20020a05620a103800b007671678e325sm6230887qkk.88.2023.07.17.11.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 11:26:31 -0700 (PDT)
From:   Eric Chanudet <echanude@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Eric Chanudet <echanude@redhat.com>
Subject: [PATCH] arm64: dts: qcom: sa8540p-ride: enable rtc
Date:   Mon, 17 Jul 2023 14:23:51 -0400
Message-ID: <20230717182351.3389252-1-echanude@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SA8540P-ride is one of the Qualcomm platforms that does not have access
to UEFI runtime services and on which the RTC registers are read-only,
as described in:
https://lore.kernel.org/all/20230202155448.6715-1-johan+linaro@kernel.org/

Reserve four bytes in one of the PMIC registers to hold the RTC offset
the same way as it was done for sc8280xp-crd which has similar
limitations:
    commit e67b45582c5e ("arm64: dts: qcom: sc8280xp-crd: enable rtc")

One small difference on SA8540P-ride, the PMIC register bank SDAM6 is
not writable, so use SDAM7 instead.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi | 10 +++++++++-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts   | 15 +++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
index 1221be89b3de..9c5dcad35cce 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8540p-pmics.dtsi
@@ -14,7 +14,7 @@ pmm8540a: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		rtc@6000 {
+		pmm8540a_rtc: rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;
 			reg-names = "rtc", "alarm";
@@ -22,6 +22,14 @@ rtc@6000 {
 			wakeup-source;
 		};
 
+		pmm8540a_sdam_7: nvram@b610 {
+			compatible = "qcom,spmi-sdam";
+			reg = <0xb610>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0xb610 0xb0>;
+		};
+
 		pmm8540a_gpios: gpio@c000 {
 			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 5a26974dcf8f..608dd71a3f1c 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -407,6 +407,21 @@ &pcie3a_phy {
 	status = "okay";
 };
 
+&pmm8540a_rtc {
+	nvmem-cells = <&rtc_offset>;
+	nvmem-cell-names = "offset";
+
+	status = "okay";
+};
+
+&pmm8540a_sdam_7 {
+	status = "okay";
+
+	rtc_offset: rtc-offset@ac {
+		reg = <0xac 0x4>;
+	};
+};
+
 &qup0 {
 	status = "okay";
 };
-- 
2.41.0

