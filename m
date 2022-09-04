Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD0D95AC7DF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Sep 2022 23:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235534AbiIDVzS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Sep 2022 17:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235577AbiIDVyz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Sep 2022 17:54:55 -0400
Received: from sonic302-21.consmr.mail.ir2.yahoo.com (sonic302-21.consmr.mail.ir2.yahoo.com [87.248.110.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D113AE60
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Sep 2022 14:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048; t=1662328311; bh=4DbF5I4FMpsX6B0npnQt8sXd394gUJ0bbp+vnEYLjnY=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=Y05w6rmeElLAqwnScyLarYu9mFw1T6zokyB9pxLQZL0mhsBCH9HUTckqJXKASJUTDAPXJYiOMZ/hd1h1MqHb33ktdp6k7zLI8zSjyfbGQod6DZY2aoouOm/tfQQ2Q0t57bQzMU/dx9tz+1oAFOpkweCK1V6z/suRSf4hOVVggrmNIXyGFUVBZ83MnFVGrWn7Z/1lLWvCCf7APuGqk/8wCHQCfRb4DHKpSI/xcyUcn7L+lyy6Q3wUZcpoC1IP2VSm4le8m7QgTb/if+NMdof8WY+iUdI5+TNourg+6Y77Mumo3LyZgMujo89eVb01tDIGd+hTM388O2nsc/ijQOmyKw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1662328311; bh=GJwfKxP0om793cxVLs6tIH2jsB14VA8HTsL8S/6ey6B=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=BhCUOgpzNQVJFwJw/dJOh1iDCH+plPrrkZnANl2DlIHDlteoVNbSAXJvHiynI2pbTovQdiEPx3bDZuxL2oo61oXsJxfO2H9MPerRFfgTVVoDMNrTZ+yKvsYHCdHoBArleyBVVne34pj7kKfxoIKPaE61cxuAIU7ftPNgdfJBCWfkAA3fB/6nh757AcKsdjiso8DDT+1UxEO02uG+gzzyLXrzj7BjDOss42G/IhZnBOZBrZ8eTwttRUuSZRsVO5J81wtaib03w+hw/p7mXug2bDlZBefD+wvh9+BqbxPGb+kkGVapld3fgWprornja1hBSoYmLf2YoFjrLLv1i/TVdQ==
X-YMail-OSG: LrPAme0VM1kvTGXYpe3whBa5F7y2qnNgZ4OVPiCcl1LBcGa_TmByWJLGlrukApx
 OQuMdK1s4TKfpgsX_E__o8SvHNqDU1nTQCwZ5Cf9qdEATMetWtRe_.vriZ0TdOi1fhsfhOwpFFd7
 Kwe8tpXw6dxFF6BJnOF6TdU27bjLTLHf_3HGUQrP_A2pK1Jv4JCMjrpZ0ppRPPvdZduJhis_8Ews
 eh8nhUHf1Mx2Nf3KbzGWMd.22MlAo3lIa5Fv7TvQfAEaZPTgjVIwTOgjiGdRpmnetRL9xYCd_L0I
 wF9NtJhmeORljfM5rI3.C3w4l5v6HBA4b4v2vjNiRycRhiNF3SahHx70KxlroNJpxE2cAg5nKste
 hJkF4Yi3Ac8aDiAmuCC2Ql15eWK6iLSabeYaIatwZyHqK9u7AGePg_DLefskSCUttymUnb0NL4xy
 A7OGpThfx9kSzHy3sXa79UoQV7sntRFU0KDGW3jW8QxYH_qLYOE0YPS1QwfSljB21XqWTknIGzlw
 DIOdnpOKAfUMa36yv_lWeRF1pKkQnwvY5t7hiE89LEqmYaR7YsjWhXpZC9JLLuy_EM7Ob8RAw4uQ
 KTDD58i629S9zCGnrITxq2jDHiX4xoErMNjacJ7KL.L2Un3_XGytYp5fNxX6OQXW_mNWDXk2M7y_
 486MmeXH3Cb8jSIGJnAxpD63zNrsVLRf__binBgJgkA8OX.G4TPHD7axZmWytyVFTWsBdaIDVsVY
 87UWksrLxsvy8tvs8WdrCNK0IP3dsTGbRt_u5nJhWE2BOLrkeOwYELT2FogbkChj_LRVispjqhCf
 beIqV5C9grsKXQ067BpMbjwzczhMZK8ra1eH50xkp0cPaNyQDXGvjUIfDidm8P7uBDpIK3CjGWfO
 j_v4QEqUaYZJZ2l1GX2lvMCMbd4wqhEJL9uygMtmDpIKgEzpzNd9BdHSMKiEJ.R4wc5f4Zxx4c.A
 u_8a_pRLg45TC6oaYtrye_2CmVl69jMep3umiyBxYaWlV9MuUEvUcTeXd1cOC9KCpzNuIyUpmyd2
 IfbgxyJ7GGtY5ePDt4hswIoOJ.rKjd151prk2bK7G14A4wykwDwLxJrQZhun_a7c7YOeBalM7J6s
 AbSu7tg0YYOK03qrLJaBaLBvc6psOLXLMZuUZlDdw.hrG3Q4BwutZn1eg.90B5vXEfIHNO_I1jBP
 8Zg8YNeWAbE8vlvwoWYhd.r9wKGhIUrnZ9YrWQPufLeJyCr7XbrpzA3Fhd9hdl6j7kSPCfu79xzN
 1RFVtuLPlvhMtpNUM6fvND9av1P8qZRc5PHt4djtSzZv1OdbIc_CEy91Ybh3I7laKXS9SVhpnOQf
 vvJmH._CyiSvi1MwI_TaxrfX4FCppydlIOLkn8AGUOcCYpB4IxcbBsOqjMCU7qkvoOcbGvE7pZTs
 WTLGMzHVIih8Wuk621Xt1aXFS5xPE2RchBLjWu10._sDreE8ENthVI_60v1caud3sYkzPww0RBTj
 kk73wHK_K4LxDA14amiDYAAApo6cSS3kp61fFG8DcY6gOf5chj9t0Bhl1L3TtMW2lTQkWUfz3O7U
 aycjFk.5PVlY7orEDh66Z_tsGH8BpfxsSTnHhndWL8KOOJjziFr2uPuq6YUG1viHZRLi87rKAQbe
 jN2FzH59tOXjQz8cJcFStbxfv74fGyoX9fCpxWnO0oiR42dVrZvvUx9xc7AaqJvjAqR05CmOrlDQ
 046vFWd16OvnuLnmiEFPsxHPLhiVZJruQ6WDBNmslf1SSEfq5Y1nqvu1fPf_DCqM4fw7RFMZX6xy
 n5mWb.oVDR9xsc_EAgPw7PW.Pj8bZMkk_BdsSqwW.G642Wl78Ie8NB8zKY.NPFPGJg6Zm9BYhBEj
 6byKPdTpOu7cGsLyJK0C26vztu_L2EaEJUdJIlJvJoMjYcQMgrIa7SQVYN0LjE5T.nmKRV8oWKWz
 773hL8YCsCMT6xwy7MNhmHzjjB0wiDnnGjdsI0imDBU70LrUVgb1HP916cAo_THcKt2JWkc0KrPC
 Gzqzo2QKu4dZs8QYDxHW_LBVXZ5ZNYAi5u2bfU.Bpc.o7CdEeCcgqzlnV1qUVniUDWzzYPZxtaDp
 8K.fS9ZQTf94rDJKlkR6ttaAZPbIdL6EbdoHXoaOADpcdUg.W2sqg3bKD5g02kAY2oJOpwldMRU_
 ZCe4n2yb0.1yCbwFABxujEZD7q1uE742D4i8gCTuUdlVB._9X4wb2YNdQ_4bgje8uXpwYJlzOkBQ
 kM4VgXRYR32CHTNvsRX7xMEoNZ0zIqW.9dL9JMrllEntPZlgkkt2kwBjJmiQLh49U5bEyXdn_1t.
 TYXdKk9Zj7Ujs
X-Sonic-MF: <jahau@rocketmail.com>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Sun, 4 Sep 2022 21:51:51 +0000
Received: by hermes--canary-production-ir2-85867b7b87-hqzcl (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID a523ac8b71248b793952ea3fd193d9a7;
          Sun, 04 Sep 2022 21:51:50 +0000 (UTC)
From:   Jakob Hauser <jahau@rocketmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8916-samsung-serranove: Add magnetometer
Date:   Sun,  4 Sep 2022 23:49:35 +0200
Message-Id: <20220904214935.31032-1-jahau@rocketmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20220904214935.31032-1-jahau.ref@rocketmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add magnetometer Yamaha YAS537 to the DeviceTree of samsung-serranove.

The YAS537 variant was recently added to the Yamaha YAS magnetometers
driver [1].

In the DeviceTree of samsung-serranove for the Android kernel, there is
unfortunately no information on interrupts or pinctrl [2].

In the Android kernel driver for magnetometer Yamaha YAS537, there is a
device-specific matrix to correct an ellipsoid shape of the measure values
into a sphere shape [3]. This could be converted and applied to a mount-matrix.
However, the current state of the mainline Yamaha YAS537 driver needs
post-process calibration in userspace anyway, as it lacks a formula to center
the measure values around zero. The correction of the ellipsoid into a sphere
can be done in the post-process calibration as well.

A mount-matrix is needed nonetheless. When putting samsung-serranove flat on
a table in portrait orientation heading north, the Yamaha YAS537 magnetometer
axes natively point X+ to north, Y+ to east and Z+ into the ground, which
corresponds to a common way to define the Earth's magnetic field coordinate
system [4]. According to the IIO definition, it should be Y+ to north, X+ to
east and Z+ upwards [5], which corresponds to a common device coordinate system
and eases sensor fusing.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/iio/magnetometer/yamaha-yas530.c?id=65f79b501030678393eae0ae03d60a8151fbef55
[2] https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/GT-I9195I/arch/arm/boot/dts/samsung/msm8916/msm8916-sec-serranovelte-eur-r03.dtsi#L318-L321
[3] https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/GT-I9195I/drivers/iio/magnetometer/yas_mag_drv-yas537.c#L105-L106
[4] https://en.wikipedia.org/wiki/Earth%27s_magnetic_field#Characteristics
[5] https://github.com/torvalds/linux/blob/v5.19/Documentation/devicetree/bindings/iio/mount-matrix.txt#L93-L126

Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
---
 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
index 439e89cf7878..bbd6bb3f4fd7 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -210,6 +210,15 @@ imu@6b {
 		pinctrl-names = "default";
 		pinctrl-0 = <&imu_irq_default>;
 	};
+
+	magnetometer@2e {
+		compatible = "yamaha,yas537";
+		reg = <0x2e>;
+
+		mount-matrix =  "0",  "1",  "0",
+				"1",  "0",  "0",
+				"0",  "0", "-1";
+	};
 };
 
 &blsp_i2c4 {
-- 
2.35.1

