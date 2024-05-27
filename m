Return-Path: <linux-arm-msm+bounces-20535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 081FC8CF9E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B185F280CEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 07:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D593D2836A;
	Mon, 27 May 2024 07:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHx5mZR+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244EB1BC3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716794452; cv=none; b=g2m5osMPeYUna3Rl4MwEkOFgZruJYpDmHcoNtgiSwZZqJFLWsi8d2jLfqnYx68srP2PgboYhVPFByf9Rp6FREP/CEt2t0UN5Pmbs9/unE7heTo8KRmpqJitaJbbnIiSti7RZKcJm6uhYXoWod4B+kXJHP/4WejKYmgH5FBc+wrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716794452; c=relaxed/simple;
	bh=kaV21qO6GYNjhKLxdxIBJT19wvTGFK2gerZ38MtKK1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mn7NojYJ5tLBih+H9gNbAwPbu3HK/nk2M0BWLG8gxJEeK5zUxLPjcWstIF1i5bj7AzzlMG6QUlgJf7fJrbdRXLtGwnxfjCFj+0aignOnwqACB0EAuUGZMPMa6ow84Qqm81rOpUZ4ZBlGZiJr19pI5+iu2/bJ8WBG7GnWUYx/coI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHx5mZR+; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5785fc9c543so2830505a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 00:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716794449; x=1717399249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TW/LSfGwT5gH7WAKYUuPqo8Jagb7fI9CA0RtQ3h/hLM=;
        b=lHx5mZR+yCp6rkXAN2+7CMFEFhscTGuknwJBnX5oVlRaThOKxSs/wDqraewoK5du1D
         eo4kkRe/gAKouHEBlxRksj7b+xGECcFdsz4B9hmm4Ei3pPQrjhIBVZ6o0OxGpzqP26IS
         LBGJJULV1WnIHblih1INTDatJPcrgbl6lNE5dZ0+JG32kvjbji7ntAHZekGSTHRbJSDJ
         Y5yG542P0TiEO6wcCAgkuUuG4sAz9/qUXHk3sb89FwSno+GtMKHKZOoLGr3l3VxiGpFx
         EkW3LFaW6Kwsp7AERv6/YEZsRraGHrKcZT3bM0xtxoN0ARmrytTdOBIF48t0CdnyJHK6
         oRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716794449; x=1717399249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TW/LSfGwT5gH7WAKYUuPqo8Jagb7fI9CA0RtQ3h/hLM=;
        b=JXRHA+jlULrRo/AQ8AbB/84uz8yRviaXhd/Pm5nbGIF/GMeam9et+DNUxwRpQkRyjj
         zPlAsmLQfy+hKa+4jRfaCIN9CarMqQ0RwGrg8GOykhc0NXk9ZQ89upuKD7tpPFgkOxEU
         L1j0J8oSjqzzpn4ctjOPqaxkAgMkDZyq4zSNSo4MVFR36oL8saHiOkG4LeSM0CU+jALI
         qJ9Da3YrEznJIVO05k+TouFI1y+Lf+aFl+mmT9MyRSAPyG6jbvn8flXh+WhmxPYty7we
         kPowCazpROZ3uJglwE7w7Ecu0swxii8vnyMMa8FAiLDuZAeq62D9Z5Z4GfCink9kKwCr
         3Nrw==
X-Gm-Message-State: AOJu0Yw4PvPRGaRT/IcJVbJCUwykVIADNOMhyH7US0H9N+qa4wMzt83+
	73AGAnHjMLNdB1KOvjvHKZDef5ZmoSXuLdByBcCcD6hi0F71UTOXuc9ZC2/zfp8=
X-Google-Smtp-Source: AGHT+IEb9O/hRjCH/tIkevCOFftVSv6LB7cbfSWDciPmsu1sKUNRJG4uWQdtZUSQVFBIbQhj77IErg==
X-Received: by 2002:a17:906:b792:b0:a53:ed1b:f3ba with SMTP id a640c23a62f3a-a62642e9202mr804025266b.28.1716794449328;
        Mon, 27 May 2024 00:20:49 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8e295sm457915666b.185.2024.05.27.00.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 00:20:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 May 2024 10:20:36 +0300
Subject: [PATCH 2/3] phy: qcom-qmp: pcs: Add missing v6 N4 register offsets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-2-be8a0b882117@linaro.org>
References: <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-0-be8a0b882117@linaro.org>
In-Reply-To: <20240527-x1e80100-phy-qualcomm-combo-fix-dp-v1-0-be8a0b882117@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2174; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=kaV21qO6GYNjhKLxdxIBJT19wvTGFK2gerZ38MtKK1I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmVDRLIpngrysYu+odCHNQ1ihTi2HjKGK3kajka
 o5g5+S1rQWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZlQ0SwAKCRAbX0TJAJUV
 Vp6CEAC1RTXQdEOn4Z0PpOv/6boLkn/EYuDV3dW54c7Kug8NlbEKXizESrytBv/tSGyy8givfDi
 ld2Mm0eU73K8dGdgVUNdtblJz390BZqdtJtCcB5snvZoDl0Q71Wp99h7TuQ8O46AmxW19nPQPmC
 ZWzSTe6SRs9Ad7zND6/zVVk/uoQYh4IZPfhmgpwsgMovALxyW1wrf2lYUnTZywp4HxOI8lpIvPU
 BBD4s0hC979Nwg+3MbtN/86G/sy9ZulQsOcDwn1EeXf7+nmP3/Lid8qXdSR1EsjIlgbq0wNrq8a
 QgDAN0C9NizmL2Um3IJoljnhoG8uH4cNg616fI34pFhv8uH/Z/Tvq0eq3RGW+94xvJzplCFMAmo
 lBu+BKwE8/iPHvIzlTRxyItFuYS4/qr6e0gfQ/cwATENJQZRstrznAqtg5lBYEqPzqFEOt2KETG
 EXlsympwax++Kpet6lC5LXhleDBBiVW2gc2m6vnv3IcpBg0E1AE14gtK8BIswKMNk1Sc9AlKs8T
 NS6Qn/ccgmuMyd3O53/s8h8CI58AslGa4FJ/XqhEgHfG8vnfZy4WXMmZfGWfftI8W9I0lEUVUZh
 HIlABdwZk/j9bPDCxOuB4NJM7rLyYOMjuS0E7SqZU4ALJ6Aw+oqEx1fQf58NfUhG8je3NBTNAFE
 o8vZ2Lhyhn0w6RQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The new X1E80100 SoC bumps up the HW version of QMP phy to v6 N4 for
combo USB and DP PHY.  Currently, the X1E80100 uses the pure V6 PCS
register offsets, which are different. Add the offsets so the
mentioned platform can be fixed later on. Add the new PCS offsets
in a dedicated header file.

Fixes: d7b3579f84f7 ("phy: qcom-qmp-combo: Add x1e80100 USB/DP combo phys")
Co-developed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6-n4.h | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6-n4.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6-n4.h
new file mode 100644
index 000000000000..b3024714dab4
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6-n4.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef QCOM_PHY_QMP_PCS_V6_N4_H_
+#define QCOM_PHY_QMP_PCS_V6_N4_H_
+
+/* Only for QMP V6 N4 PHY - USB/PCIe PCS registers */
+#define QPHY_V6_N4_PCS_SW_RESET			0x000
+#define QPHY_V6_N4_PCS_PCS_STATUS1		0x014
+#define QPHY_V6_N4_PCS_POWER_DOWN_CONTROL	0x040
+#define QPHY_V6_N4_PCS_START_CONTROL		0x044
+#define QPHY_V6_N4_PCS_POWER_STATE_CONFIG1	0x090
+#define QPHY_V6_N4_PCS_LOCK_DETECT_CONFIG1	0x0c4
+#define QPHY_V6_N4_PCS_LOCK_DETECT_CONFIG2	0x0c8
+#define QPHY_V6_N4_PCS_LOCK_DETECT_CONFIG3	0x0cc
+#define QPHY_V6_N4_PCS_LOCK_DETECT_CONFIG6	0x0d8
+#define QPHY_V6_N4_PCS_REFGEN_REQ_CONFIG1	0x0dc
+#define QPHY_V6_N4_PCS_RX_SIGDET_LVL		0x188
+#define QPHY_V6_N4_PCS_RCVR_DTCT_DLY_P1U2_L	0x190
+#define QPHY_V6_N4_PCS_RCVR_DTCT_DLY_P1U2_H	0x194
+#define QPHY_V6_N4_PCS_RATE_SLEW_CNTRL1		0x198
+#define QPHY_V6_N4_PCS_RX_CONFIG		0x1b0
+#define QPHY_V6_N4_PCS_ALIGN_DETECT_CONFIG1	0x1c0
+#define QPHY_V6_N4_PCS_ALIGN_DETECT_CONFIG2	0x1c4
+#define QPHY_V6_N4_PCS_PCS_TX_RX_CONFIG		0x1d0
+#define QPHY_V6_N4_PCS_EQ_CONFIG1		0x1dc
+#define QPHY_V6_N4_PCS_EQ_CONFIG2		0x1e0
+#define QPHY_V6_N4_PCS_EQ_CONFIG5		0x1ec
+
+#endif

-- 
2.34.1


