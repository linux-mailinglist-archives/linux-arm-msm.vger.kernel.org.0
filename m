Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 477146DD423
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 09:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjDKH3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 03:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjDKH3L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 03:29:11 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0473A9C
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 00:29:07 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id pc4-20020a17090b3b8400b0024676052044so7145156pjb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 00:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681198146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttg1M/y6XRWds7TOi5LMKQJ7a3u0jw8Op4Jljrrs1LY=;
        b=lOdOF5GgGZiRgPcjxd57Qc4KWyITnjrrk5izHeqcMbkAAuRb9Vmk2trJ+oKUoeM6AV
         1nAnEW+9e0PVqCLYLPPl6UsJ9DORPetiZvH+oaEUgBnNpvimNEZD+eh68YGf43M3LkVY
         PAB7/M/rCVuv9GbT1v+Zv/brlLAiFGFgdNKPKXpTBQjV1FugZnViJ9dSuhZEXuhopc0p
         6QpQk9ShDvcvM4FOvHrAM50qJJyVKY/iYkxTDUUi5friOJ+F5lYniwvFeURalXbxT0Jk
         NKXfFaNTTtfFr395due6i/LLZjghiMAj6Uz3c+oCruCUaXl/Si6TiEv/NcaKss3MzGGS
         pc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681198146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttg1M/y6XRWds7TOi5LMKQJ7a3u0jw8Op4Jljrrs1LY=;
        b=ViNhFK3ezkgQ0P81orPCNhy9yayrAqCNHHx2KQ385H67iuZeuVVlv9oZwgp9JByqZM
         lVaz3z/K7upMLdy1IsOcq55uhraaVGnpeePgMIcJVTNRzaPBVWQoMtim8Uu5HO4NkPym
         bzsdIwTHrUiWvgKwpLQVGqIYWem9vatGIEUNtFo+tosb+CyF4/5rjZVCs7MD331Mpp87
         uagDd6oODtm3StU4jlk4GFz6q92dOH3DnUhkM2fh6i2/Sc/cX4djKDjaFNNeVPWBMplP
         Div47u8oIc356UsloPElDttQMbLRXXaP/nTLLbSQ6/Jcvwxb4LrJsDJzZxj1TeXJkpGb
         gpQQ==
X-Gm-Message-State: AAQBX9dx1udrbj46J5TrhvMuH84Rg41nfGuTJ55D+uqPXFsNZmFdI1pg
        OQeui+iMF7wRn9BQt8RH6XzA68eSPKUwcL99HcM=
X-Google-Smtp-Source: AKy350a8gDRhfza1WigxIfqVURRUajmbjL8ibhT1MGiO4W1sH/ZgsiZmvD5VJVAtczmLfWk/7EmCdg==
X-Received: by 2002:a17:902:ce85:b0:1a2:2091:ee8b with SMTP id f5-20020a170902ce8500b001a22091ee8bmr18057238plg.10.1681198145903;
        Tue, 11 Apr 2023 00:29:05 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:6a11:8ba1:beba:def7:a4ae])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902988700b001a043e84bf0sm8946612plp.209.2023.04.11.00.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 00:29:05 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: qrb4210-rb2: Increase load on l22 and l24 for uSD and eMMC
Date:   Tue, 11 Apr 2023 12:58:40 +0530
Message-Id: <20230411072840.2751813-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230411072840.2751813-1-bhupesh.sharma@linaro.org>
References: <20230411072840.2751813-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Increase the l22 and l24 load used for uSD and eMMC VMMC.
These need to be increased in order to prevent any voltage drop
issues due to limited current happening during specific operations
(e.g. write).

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index c9c6e3787462..dc80f0bca767 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -171,6 +171,8 @@ vreg_l21a_2p704: l21 {
 		vreg_l22a_2p96: l22 {
 			regulator-min-microvolt = <2952000>;
 			regulator-max-microvolt = <3304000>;
+			regulator-system-load = <100000>;
+			regulator-allow-set-load;
 		};
 
 		vreg_l23a_3p3: l23 {
@@ -181,6 +183,8 @@ vreg_l23a_3p3: l23 {
 		vreg_l24a_2p96: l24 {
 			regulator-min-microvolt = <2704000>;
 			regulator-max-microvolt = <3600000>;
+			regulator-system-load = <100000>;
+			regulator-allow-set-load;
 		};
 	};
 };
-- 
2.38.1

