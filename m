Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6E965C622
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 19:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238771AbjACSZf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 13:25:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238890AbjACSZC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 13:25:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 058EA13EBB
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 10:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1672770182;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DmfNQKi7WDA8MPZe5EsjwBN//ol6PieNKV7USkZFvAQ=;
        b=aVX/UpDdyK5lyb/8xWg1EH/a2q8XFIhbnTaJKXn+C2YAwk/L8kIcIWldkgh1MnWP0r8bFH
        aFtoyrlDck+eQSMHBGQcAde2czT1s6GSaAw/HF2Dfmo6lsRnqjgVJFo2PH5zQXj1Xsyk0s
        tSoOaKVucOlWBBy5UAD+gTb+b8f/IWY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-NnnpdoZuNTSH6iZ-fNPb1w-1; Tue, 03 Jan 2023 13:23:00 -0500
X-MC-Unique: NnnpdoZuNTSH6iZ-fNPb1w-1
Received: by mail-qv1-f70.google.com with SMTP id on32-20020a05621444a000b005319444bd2fso9458612qvb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 10:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmfNQKi7WDA8MPZe5EsjwBN//ol6PieNKV7USkZFvAQ=;
        b=HneMUIIJ/MdZ1UY3a0VW+2hGJYi1QEFL6sBCrNX5GDMbVEhc9ZokTDeS6dCwtV+kds
         tdNvbkhZ7+PL8zBqiCeVhAKlojkJDqouukLolwMWgAJh/p0y6mjOITROkkAHimqxb+/f
         zyEIcfo93pD1eIhLlKwO48HoGPZ2HLRgtoxIZGZnavE1ZvgbrvAYVrLDEkt/R/MPmFVu
         frVMvVt8t2cVEK+1BjWXtP8vZc0gUBHcDQISrrDNEOp0bK7tq9G2ZOwWdfvuHICjpGCl
         sifqhhQZGTTM+Xub7z9NAEvosQBk2v0OBnNnD/cHQPDo0XO+82N12EUejwycrO2DSXw+
         Jtwg==
X-Gm-Message-State: AFqh2krnqOa62NKRDOmrm/3BD8oALeVeMTK3Z5JiHlPMjKOuDhDnPNA/
        dJk/cBOlb9NuXeMGOgDFbFbXpiGyFOV7ScBDofFg3InSp8yQhjacXvIpNI+upbuSauW1kd8unku
        RaK3umNQ53iXlpvTxUMmI5Bes0A==
X-Received: by 2002:a0c:800d:0:b0:4c7:34b5:7993 with SMTP id 13-20020a0c800d000000b004c734b57993mr62648564qva.27.1672770180006;
        Tue, 03 Jan 2023 10:23:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs4J9OLsqajZLDV0Yx7yq5xoA/9vSMzt/g1J5ekoZ7w/MuRw3uNmk4jeuMPuMe7V84wbIMHkg==
X-Received: by 2002:a0c:800d:0:b0:4c7:34b5:7993 with SMTP id 13-20020a0c800d000000b004c734b57993mr62648543qva.27.1672770179793;
        Tue, 03 Jan 2023 10:22:59 -0800 (PST)
Received: from x1.. (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id t13-20020a05620a450d00b006fba0a389a4sm22819675qkp.88.2023.01.03.10.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 10:22:58 -0800 (PST)
From:   Brian Masney <bmasney@redhat.com>
To:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     quic_shazhuss@quicinc.com, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ahalaney@redhat.com,
        echanude@redhat.co
Subject: [PATCH v4 09/10] arm64: dts: qcom: sc8280xp: add aliases for i2c4 and i2c21
Date:   Tue,  3 Jan 2023 13:22:28 -0500
Message-Id: <20230103182229.37169-10-bmasney@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103182229.37169-1-bmasney@redhat.com>
References: <20230103182229.37169-1-bmasney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add aliases for i2c4 and i2c21 to the crd and x13s DTS files so that
what's exposed to userspace doesn't change in the future if additional
i2c buses are enabled on these platforms.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
New patch introduced in v4

 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts                  | 2 ++
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index dfd8c42d8ca0..92d410af6cf3 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -17,6 +17,8 @@ / {
 	compatible = "qcom,sc8280xp-crd", "qcom,sc8280xp";
 
 	aliases {
+		i2c4 = &i2c4;
+		i2c21 = &i2c21;
 		serial0 = &uart17;
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 2c360e52dae5..f9da3ee54545 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -21,6 +21,11 @@ / {
 	model = "Lenovo ThinkPad X13s";
 	compatible = "lenovo,thinkpad-x13s", "qcom,sc8280xp";
 
+	aliases {
+		i2c4 = &i2c4;
+		i2c21 = &i2c21;
+	};
+
 	backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pmc8280c_lpg 3 1000000>;
-- 
2.39.0

