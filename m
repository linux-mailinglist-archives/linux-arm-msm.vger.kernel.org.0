Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5BD64ACAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 01:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbiLMA55 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 19:57:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiLMA54 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 19:57:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB5D1571A
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 16:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670893018;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=0G5DlIm/58n/d7ddm5UPOg5NB4JeT07TXknicvMHP1k=;
        b=h3GffPa6LmsxWVurgFMT3r0cTNjmgBfw84LliU+B5NfEnqHUWluBqlm0e7TICgR1xu7zdk
        7WMJ/zTrj6rW0wURCJtK75U9FpH2zulPLUdknSOZuEjOx1XIRP6g+RukW7N5ob7im+35I2
        r9PabI4W4iNay+DJAqOFJai8i37g138=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-346-YOFBv5_TN76oqjAiznzYPA-1; Mon, 12 Dec 2022 19:56:57 -0500
X-MC-Unique: YOFBv5_TN76oqjAiznzYPA-1
Received: by mail-qv1-f69.google.com with SMTP id nt2-20020a0562143c0200b004c74f7ec3afso13113661qvb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 16:56:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0G5DlIm/58n/d7ddm5UPOg5NB4JeT07TXknicvMHP1k=;
        b=I9JaOd75x0DMPVzUCq6Lvdx6M+p7aZeN90gN17r28ImMQm2LcVJRebG3PbFzvt1mkk
         bef2VNhpc7ffFknn70idI/W915rnKx6DNGfcum93PexQTt4vru13oL44cTLxuQAwfaM3
         R/H9KLt5ow+X1ShRs6fs8SmwucpGm8EXiRGXh+oW8EZlADFNiIDbbQUKtZl2o//EH8PV
         OWeKWouFDIPpCCwgTZ5yBACtMhNK2KmJenTuwtu+LzRfY1J/rVYI8+nfaj63fGf3WJyg
         84dr8NhyV4GhQEURe8TGqN0czjciaa/VuGoR9KYHKdrKbkSYKEnjzc0FmQTKk/Xu4w7s
         5tug==
X-Gm-Message-State: ANoB5pmdZDmiLGfPlFjdK+OytsqHkwOXRPdG9Ru896n8OEkPSJUYCJun
        kkXeNRz8E1QOlaOjbS8cbxwoDKb+4SMffuySlYL8sQSDW1hE5hLQUQiOihehUTXALDSicaVWwBA
        wVBuB5RM3Ntes/aednfPcLXhtqQ==
X-Received: by 2002:a05:622a:90f:b0:3a6:2170:b0a1 with SMTP id bx15-20020a05622a090f00b003a62170b0a1mr28843449qtb.6.1670893016781;
        Mon, 12 Dec 2022 16:56:56 -0800 (PST)
X-Google-Smtp-Source: AA0mqf57KF3YeBbTEy7Dkoa9TaltSLBPrfm7oE/QdldhQVauvPAWddMoAiL9puqBl9a4SBUg1okGew==
X-Received: by 2002:a05:622a:90f:b0:3a6:2170:b0a1 with SMTP id bx15-20020a05622a090f00b003a62170b0a1mr28843427qtb.6.1670893016567;
        Mon, 12 Dec 2022 16:56:56 -0800 (PST)
Received: from localhost (pool-96-230-116-121.bstnma.fios.verizon.net. [96.230.116.121])
        by smtp.gmail.com with ESMTPSA id 195-20020a370ccc000000b006fb11eee465sm6747657qkm.64.2022.12.12.16.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 16:56:55 -0800 (PST)
From:   Eric Chanudet <echanude@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
        Brian Masney <bmasney@redhat.com>,
        Eric Chanudet <echanude@redhat.com>
Subject: [PATCH 1/2] arm64: dts: qcom: pm8450a: add rtc node
Date:   Mon, 12 Dec 2022 19:55:38 -0500
Message-Id: <20221213005539.1133443-1-echanude@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the rtc block on pm8450a first pmic to enable the rtc for
sa8540p-ride.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 arch/arm64/boot/dts/qcom/pm8450a.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8450a.dtsi b/arch/arm64/boot/dts/qcom/pm8450a.dtsi
index 34fc72896761..af761dbfbc66 100644
--- a/arch/arm64/boot/dts/qcom/pm8450a.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8450a.dtsi
@@ -13,6 +13,14 @@ pm8450a: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		rtc@6000 {
+			compatible = "qcom,pm8941-rtc";
+			reg = <0x6000>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
+			wakeup-source;
+		};
+
 		pm8450a_gpios: gpio@c000 {
 			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
-- 
2.38.1

