Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25E61675326
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 12:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjATLMe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 06:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjATLMb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 06:12:31 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 046D0B4E2B
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 03:12:29 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id hw16so12990459ejc.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 03:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jS58VgR/BD2MHUidZnJi3NBLKUmcSOk+9wrfP0BoXv0=;
        b=Ds9sj/oSODhyldz3Bbu1cRJp3obW3uCE/1PW1XL9nNcByb5TyPypUekvCgW/D43i4Y
         uCDNNT/U2leHRoByn1e1pkgHAeAw+lTZAkq2drSGn+xigDGbyPYsjxZJ6SIVxQK5ONyo
         0yYs/7rwOxBDlP7K20KTxKKQrhFnNwn8gZU8Jaz1gekqsSJdDbLWpWV9rjRWub9ASnsi
         FQx1uLZE0jl6q/nW26l1i2AIzeoONQlapo6INyXZUJIFZ5aiIxhIfb79DMTwcD1FvMYs
         rkH2zoKQgs/O0EJjKW8OcGww7mck0JjCS3VBrsT3OpfpS2Mevw+wUeO9ZWATUKtn2Yql
         0afQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jS58VgR/BD2MHUidZnJi3NBLKUmcSOk+9wrfP0BoXv0=;
        b=eTQPN6yL076ZrinU81CRC3SnnQ2ZgbJBbJT195kWf95FsqiktiPbEbEADCIX3dMTQJ
         tZDblcCGiuxd54fQtj40wvT7lVq6hyKeroCjf5YEHcs+1csORreE0dlxZ6MV0GZ4l0E2
         ZgM4aGm/JfmhxPWRBjwdRWzl2XQYXN9A4pjD4A1NPdk9kdKhj//TljUgQ1gvQd0BTkwU
         l2PcIP8deza+8bTDh+0883gS0vyMU0yCexuRbNQ9FVGYEcqIZ5C12HtvCQGZSdKoO+kI
         ADsuMfp8NJ+bVTlsRNnnI+phparZbEPjXvGOPlC/9e4L7fAm1U5ddMEc07fXVj7U6vsB
         lCeA==
X-Gm-Message-State: AFqh2krejF754R+Mq0LwiK+vpgNacfGjNTXpwWihgWr9eLmYczKvvgn5
        kbvSJl/TBRbhVIS3bMUwfPSmOALY7fzzf0W2AwG/6Q==
X-Google-Smtp-Source: AMrXdXsrEAUaAnn2gl4vGB1ik14ylUlQm36bs5ABCeIAQYc8Q9bBIRVzP/LRRuUJcN5fyu3mHtsYnQ==
X-Received: by 2002:a17:907:a2cb:b0:870:7b:94db with SMTP id re11-20020a170907a2cb00b00870007b94dbmr17476356ejc.28.1674213148645;
        Fri, 20 Jan 2023 03:12:28 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id du1-20020a17090772c100b0084bfd56fb3bsm17667492ejc.162.2023.01.20.03.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 03:12:28 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 20 Jan 2023 12:11:56 +0100
Subject: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI busses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221213-sm6350-cci-v1-4-e5d0c36e0c4f@fairphone.com>
References: <20221213-sm6350-cci-v1-0-e5d0c36e0c4f@fairphone.com>
In-Reply-To: <20221213-sm6350-cci-v1-0-e5d0c36e0c4f@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.11.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the CCI busses that have cameras connected to them.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index f0e7ae630e0c..ed0cb70849d3 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -363,6 +363,26 @@ vreg_bob: bob {
 	};
 };
 
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	/* IMX582 @ 0x1a */
+};
+
+&cci0_i2c1 {
+	/* IMX582 @ 0x1a */
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	/* IMX576 @ 0x10 */
+};
+
 &cdsp {
 	status = "okay";
 	firmware-name = "qcom/sm7225/fairphone4/cdsp.mdt";

-- 
2.39.1
