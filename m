Return-Path: <linux-arm-msm+bounces-3445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B626480536B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 12:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 694A028157D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 11:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC9B59B43;
	Tue,  5 Dec 2023 11:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="hva7JQy0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCF8124;
	Tue,  5 Dec 2023 03:49:09 -0800 (PST)
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id BC35542C11;
	Tue,  5 Dec 2023 16:49:01 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1701776942; bh=klIZaoAZP1LXpjvWGp96cEtTX+I+CVrhwj9/P+dUqeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hva7JQy02IWM6x1OlNryEV6veaXoMT8XgOLWffAy9+PQLNuojkPKeiRwYpDyV+0bi
	 kbEtIM1m4L+NaA+HJ8wd460dgl49I7s3L+fTAzSuIiBz39IPbnGuxqpqEwGvfqx9z6
	 uXup3xAJ8qFxAYtC6RVA+kUPjoQxB8K6++eErPat5oXgxdJ1ngtwkEJ0ug69Yu/7lO
	 l6uxKxfMB9JHGzXndZab795LIqZss3tqOp5bu2cD0Zd9Jsc4urMMvm6+5zyXM0p8LC
	 zjEmxD/SB6/gASR8U2zwAS3v6iERvlM9PjjMT1FekS1/dFjhoJZbPysM4fygjUSz9m
	 h5WX8rV8uvG8A==
From: Nikita Travkin <nikita@trvn.ru>
Date: Tue, 05 Dec 2023 16:48:11 +0500
Subject: [PATCH v2 2/3] arm64: dts: qcom: acer-aspire1: Correct audio codec
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231205-aspire1-sound-v2-2-443b7ac0a06f@trvn.ru>
References: <20231205-aspire1-sound-v2-0-443b7ac0a06f@trvn.ru>
In-Reply-To: <20231205-aspire1-sound-v2-0-443b7ac0a06f@trvn.ru>
To: cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1892; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=klIZaoAZP1LXpjvWGp96cEtTX+I+CVrhwj9/P+dUqeA=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBlbw4sQls74ZADWbGnuP5X240mfL7fqEM5jdghH
 D6lZXn8RmeJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZW8OLAAKCRBDHOzuKBm/
 dTo5D/4wg325rlcmHi77aGiTItdoBWq3rGWMJHxqeCHgVffwfyFYoasSlattyZO/sxnZFi2a00O
 xZXNECENS7FZHSUnk/oqiPlhpoothzE/KnRegBOF1DLoJXHBfJdz46g13GrAxMDEt8q5249eanX
 cEwFxuTvGv1fknH7yR4N9lZ4HnnJV5AViQtLBMeEFPsgDgFGs67nHabNNvqO3lUCk40gmNjXO5g
 kmXYZjVuyIW37O5U8YrB8LCEyy54xOxoPcfsWkxQGttWSNhqdc5eyPv6YEiScqL7G4r2/Q6fwS0
 D2XwdnVaJExpS5wftsVQVU3Ocv6us9kXNcTnnObdjIEVxkSj5+refPw5TCq+RSGwPpj84/hZ6CI
 /jDMKdtza0pkcQqT9o8/pOmn8pgUtUmcY8DZkQE/xupRERY7lO02cdse4SZ8MWnhDJtPmxlpCUw
 Z05Fab+8LK+nwrTU2wV/zm3tP/r/FD1w8RIPZN2YjkA+XljMCiGGPqY04ZQypJePhdoHJrWv6uu
 zD2FDod6mIogbjYeDuDfaD978eeJ2EQOL5bxOZTROTjbOTnRKpdUNUmFWPSx2rX8bqQJ98D9QnE
 OQZe97ekpClJ1I55ah490SI8t5rYwbi7bX5tWmislsKc1Zs1uFTmU/XMBYhVwDdsCDNGGa53Qmn
 55pBHAMPf3dVI4A==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

When initially added, a mistake was made in the definition of the codec.

Despite the fact that the DMIC line is connected on the side of the
codec chip, and relevant passive components, including 0-ohm resistors
connecting the dmics, are present, the dmic line is still cut in
another place on the board, which was overlooked.

Correct this by replacing the dmic configuration with a comment
describing this hardware detail.

While at it, also add missing regulators definitions. This is not a
functional change as all the relevant regulators were already added via
the other rail supplies.

Fixes: 4a9f8f8f2ada ("arm64: dts: qcom: Add Acer Aspire 1")
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
index cfde8cd47107..00b442696618 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
@@ -209,9 +209,22 @@ alc5682: codec@1a {
 		AVDD-supply = <&vreg_l15a_1p8>;
 		MICVDD-supply = <&reg_codec_3p3>;
 		VBAT-supply = <&reg_codec_3p3>;
+		DBVDD-supply = <&vreg_l15a_1p8>;
+		LDO1-IN-supply = <&vreg_l15a_1p8>;
+
+		/*
+		 * NOTE: The board has a path from this codec to the
+		 * DMIC microphones in the lid, however some of the option
+		 * resistors are absent and the microphones are connected
+		 * to the SoC instead.
+		 *
+		 * If the resistors were to be changed by the user to
+		 * connect the codec, the following could be used:
+		 *
+		 * realtek,dmic1-data-pin = <1>;
+		 * realtek,dmic1-clk-pin = <1>;
+		 */
 
-		realtek,dmic1-data-pin = <1>;
-		realtek,dmic1-clk-pin = <1>;
 		realtek,jd-src = <1>;
 	};
 };

-- 
2.43.0


