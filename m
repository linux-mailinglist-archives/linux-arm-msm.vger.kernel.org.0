Return-Path: <linux-arm-msm+bounces-597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DCB7EA5DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 23:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25D141F22997
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 22:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A533D38F;
	Mon, 13 Nov 2023 22:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WVEI1Zl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4113B28E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 22:15:36 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31BE3172C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 14:15:34 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c595f5dc84so64857211fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 14:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699913732; x=1700518532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KajBuUuJpwuy15xSzO9YMy+TSc6B+gUFFD30MmfVQnM=;
        b=WVEI1Zl28JemvpDCFyVQCs7IgWzSn8bftEA8hSGlp3GkYM/5L7rwDGU/uTFG+S4aKG
         uYlTX3TbPmiszUFlD4PYb37ZJnvelFX89oqgqX9EFtK8UZ0QcknmeuZ7wMXAHSPYFaoh
         bEeqApwL0JW6Sdsyx8qtNEGw0mKKMRot795jKvMEGUQYBk8auhh6ulEYPnOLcQv3M96k
         nZPQBIyG+XivJLKFLBtb4UZFk+wB2Qis4ZMTr3nyUheh5X35x+LkAdra9AWjGWYM2m1V
         JN6DurXjHToCEb/VmWEO92Ka/vtnqgG0/niIr+31HsSTdq+jXHAParFrw/FwNm795V6P
         bVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699913732; x=1700518532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KajBuUuJpwuy15xSzO9YMy+TSc6B+gUFFD30MmfVQnM=;
        b=WJobB0ZS6bH1WbCJPK9EdgBJAQ44k087Pw2ozrChNN3skfQEyWwNf7cadqCnrbXgoS
         eB7UCFC779ycjVgNN3wy5dvfAfucY5PefhUaHV958oMSucKuVPi4wT1fd8VwUdu2zZTN
         CKH08BqylOd3SgS7nFT4elo7C798wt/o13wQ/smrdC5EFtT9jDhwDToTg3blshtOGXE3
         R7m3Vbwab4SgVo1nCbYR/7aS8IXZaABuiGJ4vheojme1KKJLEVdqA7ROpTO3szSG+3Dw
         SXdS0dithUacRUU8OQecjbFk9ZSRb4J1S1aSVo5YSAFKAH9KpZS9oW3PHaN+yHyfnzCg
         Kz9A==
X-Gm-Message-State: AOJu0YyMBBpFlQcn7E2NYcMiIvsPjRyL8WkJLigMdejhxMNyayNWpGNa
	Q4uQd7uXRFmDdkAgLL4sw+MNLg==
X-Google-Smtp-Source: AGHT+IH/jEmW6mRmKSmrElSDPBjzh15unoJsWN6Vt6NCJockDC6d+ppH/ijeD4ElxXqQBySLegWChg==
X-Received: by 2002:ac2:4a63:0:b0:504:33ff:156a with SMTP id q3-20020ac24a63000000b0050433ff156amr224964lfp.11.1699913732301;
        Mon, 13 Nov 2023 14:15:32 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w8-20020a0565120b0800b00507f18af7e0sm1097578lfu.4.2023.11.13.14.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 14:15:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid
Date: Tue, 14 Nov 2023 00:13:29 +0200
Message-ID: <20231113221528.749481-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113221528.749481-1-dmitry.baryshkov@linaro.org>
References: <20231113221528.749481-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the bindings and use 16-bit value for AltMode SVID instead of
using the full u32.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index c8cd40a462a3..88b37ceb13ed 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1425,7 +1425,7 @@ PDO_FIXED_USB_COMM |
 
 		altmodes {
 			displayport {
-				svid = <0xff01>;
+				svid = /bits/ 16 <0xff01>;
 				vdo = <0x00001c46>;
 			};
 		};
-- 
2.42.0


