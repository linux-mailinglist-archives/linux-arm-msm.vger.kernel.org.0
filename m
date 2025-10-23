Return-Path: <linux-arm-msm+bounces-78575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E83C00CEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 933353588AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A0930E828;
	Thu, 23 Oct 2025 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Z81Rt1dr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAC030DECD
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219618; cv=none; b=uKecXEuIL4Ijr5g1NBcRCvDlbyFCkLtNr2kY7FeErEvxp0ilhlxIT2W5IWBKTxAMbg5rQ79d0ZFIb8AuN+7lxSQvAJZNHK7/eAqM9CQf/Sfnhi60KxxLiw4g8e0cQ/XLVNY8gdv/3TdY2nWukdzQ7si57o0v54JxlT8p2YIlQg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219618; c=relaxed/simple;
	bh=YFeGy6RIY6FQoh3n2HdlAiSUuoO3IjvdzWdiygan1s8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=chNs7xMKR9UeR9UwqJGYghbZ72eg2ACRSkBzXWmsNAHI7YS4ifqZQgb6Bj5+xs1no8Req8a0omMgWl3RoWGDB1fdN4MSZtUb9dJe7ZET5wAG0zkcVCjwbqUg15FQub3eDVmWePaZlJdb8KiI6fVjrl6sqX+b3B8ES7nFcSz/qig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Z81Rt1dr; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so89558066b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761219614; x=1761824414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Lcsqgxvnd/Qt11z9KJ6n+cswHFhauw2sZ/mVRLJ040=;
        b=Z81Rt1dr1PFKz3o5Yro3EKb8BsbL7GkRku5FJxRSUidctGag4ryGZjsNXkwHy92miV
         truPLmSmDbQFcRdFe/bG5F6AA6le/NvPkz24qvUNWIwhHSmKuWALO9SNykeY+9Djim4q
         yasTxI1tPVHsi+Mh/XxD6FrEwfsg7WjR1tc9GERNi/SrNsujYpCQCnCqmZKGP6fEJAhx
         51uJEX+knJ0rGlEmMhnpxxTMjtNu9Rh9mJi5aXikdV9xtGclyRtezCTTtniYYcmHnDW8
         hgOwhe0dSnvr9gJaMUmgWYn5AJPxV5xQHnaGqB8TUOT+qGjEFTFk1gBhHPgV+Vn8q+44
         DCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219614; x=1761824414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Lcsqgxvnd/Qt11z9KJ6n+cswHFhauw2sZ/mVRLJ040=;
        b=Sk2IURSyE7E5zTePyIq/kNXZmcPrDjqnKJrNcptCCuSrU3aRGQ99l8a9VQD/b/IxdK
         CrNMUit7XZqdYs2mvKJA7w4PzmLWjPn6lKk0kSZjjMKgSOihla93pnFuWmWTFqmLr7E3
         Tx+mQ9PcwPO8BisStFRTFQXupWf1fxgLBEqljZ9uFVw3aNo5jG9AgJRm2RP2DQIwJB4K
         w1sk7qxLz+JFQTr3j5fHeKrZ2E/UqRNRCHvoaIj3fUwSEVSrsGh9zXhQE2D13s7IC0Tp
         M3ocEdJ6OYGvaETcApodLZzz4Zi445lW10qoO0lBICkUxmo5Gg1ahhXCrEh+GGury2Ps
         XC6A==
X-Forwarded-Encrypted: i=1; AJvYcCV7eAXMQzDts79MLyAwgpUZnSx9N6Ak/bVGe1aE+9cJfQvVAL1V/idO02WvwtPuVWZWiPwd+K6miaIxWFbO@vger.kernel.org
X-Gm-Message-State: AOJu0YwakuVYn6J2BdnoxprJ/hmR6EXO90iGfb67h2uWbVZEqRrgNw01
	qNWfmqxcGG5h1XsxjaOOWODk1mi4qFm12AtMUT/u7/THWPSSoOsHp2QMTBHNEjYay80=
X-Gm-Gg: ASbGncsBIen+fOBVX7xUnsQoSRkF7//I+PIFiNYt5+Xoz6gHx7orTmSndKRRdJkU//3
	yBP6WhQ5U1LMCwPtgAVeKTmKpgdaQsRT/KkAwvMXUuU1L3WRqjFo/Ibq6ZL0NwQrqX5Ac9oz4vZ
	1ZhKjz5fm66jzjeDK+EKSgguRhRW9QGEXL3lZtQFCZ+h70tpO83ZrR+dw1dKxZcBqq69k5REkVx
	s8p39Ui6f3P2qqRnVGovZ2ovieTelACU8SPbAQ2XXQG8LRVs1QidANNOpGB6y5BlILBMKfPe57P
	ysQ0C8E3H9HpcYgwML4DviHJYscMfF6aXW7783jAbb2Suxcmg+1xZO4zLtcU0Ni1SbXc2edPkMD
	/mhSgaqyfAO/eJz0bs6XZnyA1sBgOnUzrFdusQPDXRpxGIha2M7MkdvqgbdjCH3gUg4Xqcs6sSr
	I5h4Et6YmwEfbNPmAkWKAk1WmfEg20UzB3OC4iwk6bYyv3+w==
X-Google-Smtp-Source: AGHT+IGQoN8cyAJufe4YugUyW8YjG9/T5wbn/mNlO6I4Qw2SpJzK9mmfw4ugdQ+HpO8/mriv57+TXA==
X-Received: by 2002:a17:907:7e8d:b0:b48:baf8:a737 with SMTP id a640c23a62f3a-b64768d5275mr2680084366b.58.1761219614199;
        Thu, 23 Oct 2025 04:40:14 -0700 (PDT)
Received: from [192.168.178.36] (046124199085.public.t-mobile.at. [46.124.199.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d5144cfbcsm192518066b.56.2025.10.23.04.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:40:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 23 Oct 2025 13:39:27 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm6350: Add OPP table support to
 UFSHC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-sm6350-ufs-things-v3-2-b68b74e29d35@fairphone.com>
References: <20251023-sm6350-ufs-things-v3-0-b68b74e29d35@fairphone.com>
In-Reply-To: <20251023-sm6350-ufs-things-v3-0-b68b74e29d35@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761219609; l=2058;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=YFeGy6RIY6FQoh3n2HdlAiSUuoO3IjvdzWdiygan1s8=;
 b=4D4XuH1ZeZaMnXUhH6PjI2pOUQDDb7t6oGYOHIdJ1y07+p+NTwDJUQHIQdxuI6BQMz6JYdttd
 52/kMVUVkj1BMcXJJ3zhTyzC61sTvi6s1M6xQRwR2gH04MyO0Nv0lt4
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

UFS host controller, when scaling gears, should choose appropriate
performance state of RPMh power domain controller along with clock
frequency. So let's add the OPP table support to specify both clock
frequency and RPMh performance states replacing the old "freq-table-hz"
property.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 42 +++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 19a7b9f9ea8b..30e77eca4c02 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1175,18 +1175,40 @@ ufs_mem_hc: ufshc@1d84000 {
 				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
 				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>,
 				 <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
-			freq-table-hz =
-				<50000000 200000000>,
-				<0 0>,
-				<0 0>,
-				<37500000 150000000>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<0 0>,
-				<75000000 300000000>;
+
+			operating-points-v2 = <&ufs_opp_table>;
 
 			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <37500000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <150000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		ufs_mem_phy: phy@1d87000 {

-- 
2.51.1


