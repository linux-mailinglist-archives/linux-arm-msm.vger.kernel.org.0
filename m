Return-Path: <linux-arm-msm+bounces-32937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B6098D3DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 14:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24377B21DC3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 12:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DD31D04AE;
	Wed,  2 Oct 2024 12:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="V26zbYtg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B781D0486
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Oct 2024 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727873912; cv=none; b=ulfY6NkRQOo29F46RnEGMoxeKaVRGJTbS5gCzYQuOYZ9U/0ndg1oyrvp/VoKcKVnvhvYSaGjXSWhiP0qCDN034mHB/W3nnfBeE3FGBvDR297yaZps7aloKX+tfunBxkN6LXW9oxX9ZPY7o5QD3iPU/GXOEemeEevKO6+LNsrdUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727873912; c=relaxed/simple;
	bh=xg7z/SeJzhmttlPdDZR21cOqf/AVpCo3yoWnuBllEzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=D7Go5eCJwfS1HIg9/xG7zl97MIDpiACheOYxlYXW2mQLy1aQUmqCDxTzSsW6fyQdXHyXuiQGT4jJ0H/2pFojmNKJIqReHmHmOv0wtgyD8mgLyqybsimiCLZ0JYe0ExK0xVEfk+zWq2ZkmflEp/uI3euCm4wG70WKq0asNED9kYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=V26zbYtg; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so147378466b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Oct 2024 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1727873907; x=1728478707; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vh4uUBQqwVxTdhNiYiNFdtajRwq696yeQxZ3bN9pruM=;
        b=V26zbYtgziN6t9yhcTlSI7LdGQ2h3YMnWx5MHS9lpqSJUN23oeTTChIfEdDkjXHwA6
         RpxKHZI6FBUVbl82wMVJ9j5Hv0J/oTbxF54zaF5IeFp2pU2BgS9FUDpH039LCHYTAkd4
         hD7GRgg0ECqoYYR0dk6Z0/gClY2Twd3PBffI3Dl0ALUHMYrQweUCFRx478V06P/yfgAp
         o3SOkY0HwdfO2gOQtFQJPvTFQwhfDHIUvfecG1JqLnGSJSMn9MFfbMh2O1eJaMWdo6RS
         6mMZcsVUfbUes8tsFKgGRXZ0y/PwSZwiyRSeJYT0kAo8zxwX/g3iu1ZorwC99KvhLAdk
         q8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727873907; x=1728478707;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh4uUBQqwVxTdhNiYiNFdtajRwq696yeQxZ3bN9pruM=;
        b=SuudcHIqfH8XlMmlvpSdpKiUDDcLaLzV5oPquJCA/7nfflqLy/Zcwerp4BpQYinlL0
         qJmgXB5qtjzIYt5AUJLHqZLdciNsVNREFMQiLfH7DvcflQ1nwgWqf6TuQIJyHhxsTOvh
         Ter2vzQwJo55HN0hCTEVRlVHjt6U3Wkw1Cevsw+Fw76tBTeeOuWaSDA2e1gCzEph9VbQ
         CmmJmZxd+3m5xe2QkCQBcmjwer52a+uoSvHCzJK2zf7OI5IxEs81YF8PgxR13tvKplg8
         VPSNpcl55F3RQhi29GXJaHG2MbzLPZjpbpwiNGQT+aG2yQTnYF+n6yuwNkzB8JW4zqtS
         bobg==
X-Forwarded-Encrypted: i=1; AJvYcCUhsu1HyY2P7lJCPDui8+Gk99Q+9+vxHUsEJLJ1j3jO1q2oGrgKBBrjQPI7jzzBHAz4vxcIEi4SQfLcR5Jg@vger.kernel.org
X-Gm-Message-State: AOJu0YxYQ4yhrIv/CBEaD2a3P+uZclxt9HWR+yhrKVtDFeftZtKPZ8U/
	mKLirUOVvGDBvoODkALP6wzEl0paB/6qDah4sXcp7a3p7g6J2yzGju2wLUWxOVg=
X-Google-Smtp-Source: AGHT+IEEsqp5UV464bTdTeAxjMKq8Z5FkvCHJUu8BYbLycd5NPxtGmNemMLEB6zomqETecK2RSD2/A==
X-Received: by 2002:a17:907:e2a4:b0:a86:91a5:4d09 with SMTP id a640c23a62f3a-a98f834cacfmr325571566b.26.1727873907262;
        Wed, 02 Oct 2024 05:58:27 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773cbsm857066166b.45.2024.10.02.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 05:58:26 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 02 Oct 2024 14:58:06 +0200
Subject: [PATCH] arm64: dts: qcom: sm6350: Fix GPU frequencies missing on
 some speedbins
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-sm6350-gpu-speedbin-fix-v1-1-8a5d90c5097d@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAF1D/WYC/x2MSwqFMAwAryJZG4jxs/Aq4sLaVLOwlgblgXj3V
 1zOwMwDJlnFYKweyHKr6RkLNHUF677ETVB9YWDiriFitGNoe8ItXWhJxDuNGPSHHNaWXecWCh5
 KnbIU/Z2n+X3/x5SwCWkAAAA=
X-Change-ID: 20241002-sm6350-gpu-speedbin-fix-2fc32b4ba0fd
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Make sure the GPU frequencies are marked as supported for the respective
speedbins according to downstream msm-4.19 kernel:

* 850 MHz: Speedbins 0 + 180
* 800 MHz: Speedbins 0 + 180 + 169
* 650 MHz: Speedbins 0 + 180 + 169 + 138
* 565 MHz: Speedbins 0 + 180 + 169 + 138 + 120
* 430 MHz: Speedbins 0 + 180 + 169 + 138 + 120
* 355 MHz: Speedbins 0 + 180 + 169 + 138 + 120
* 253 MHz: Speedbins 0 + 180 + 169 + 138 + 120

Fixes: bd9b76750280 ("arm64: dts: qcom: sm6350: Add GPU nodes")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 7986ddb30f6e8ce6ceeb0f90772b0243aed6bffe..4f8477de7e1b1e8ea5c4d193e16dcdadc20eb4ff 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1376,43 +1376,43 @@ gpu_opp_table: opp-table {
 				opp-850000000 {
 					opp-hz = /bits/ 64 <850000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
-					opp-supported-hw = <0x02>;
+					opp-supported-hw = <0x03>;
 				};
 
 				opp-800000000 {
 					opp-hz = /bits/ 64 <800000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
-					opp-supported-hw = <0x04>;
+					opp-supported-hw = <0x07>;
 				};
 
 				opp-650000000 {
 					opp-hz = /bits/ 64 <650000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
-					opp-supported-hw = <0x08>;
+					opp-supported-hw = <0x0f>;
 				};
 
 				opp-565000000 {
 					opp-hz = /bits/ 64 <565000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
-					opp-supported-hw = <0x10>;
+					opp-supported-hw = <0x1f>;
 				};
 
 				opp-430000000 {
 					opp-hz = /bits/ 64 <430000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
-					opp-supported-hw = <0xff>;
+					opp-supported-hw = <0x1f>;
 				};
 
 				opp-355000000 {
 					opp-hz = /bits/ 64 <355000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
-					opp-supported-hw = <0xff>;
+					opp-supported-hw = <0x1f>;
 				};
 
 				opp-253000000 {
 					opp-hz = /bits/ 64 <253000000>;
 					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
-					opp-supported-hw = <0xff>;
+					opp-supported-hw = <0x1f>;
 				};
 			};
 		};

---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241002-sm6350-gpu-speedbin-fix-2fc32b4ba0fd

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


