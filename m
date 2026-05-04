Return-Path: <linux-arm-msm+bounces-105778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DKuH1rK+Gma0wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:33:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8244C1712
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 18:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55AA53023B9B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 16:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F8C3E4C7D;
	Mon,  4 May 2026 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVupDfyr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LS9wALHA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5201D3E3D92
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912286; cv=none; b=fmQ+OmsoWPTUKwY1bSc3jkiXYoNmmV5V7PVzq2jTtgsgA3kdJ6RIZBkTPUlcefm6FJnFyfAiW/B50eKrbRXzw1uGD+SGd7mYM2tejXuyS/er5ZsViSsg4QuWoK9V24l9pUKIdC7e83e1wingLZxggIMpMaAgM5xVbwzi8XKkJ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912286; c=relaxed/simple;
	bh=ClceAYiJ8whQgLN7bPe85GMULVLaGBTfiMaFdDN9qOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cyRJofSgSYHc8IhlaIVPp+GGpweK6kHtYfmYGFN0FI/TSPpwrooFaXI/v6/ath+H20TXXeblXGYjx7iMA/pxXcVqUljAQY/P9VddjqX6O69UsntGiM5B29xSqAYgERRfjY+KsFiLYt/QVnAv9PKIEVgthogWOvcXTtAAIJRfIoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVupDfyr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LS9wALHA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B48Pu1151496
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 16:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoxhWK6IHb1qi1sBgTOzXLNliyxQUEnjKfKgGROIUJ4=; b=PVupDfyrylZTr5qE
	RrrPZX+R0I544HHNpiqWvsdItdXW+ziG50pfqQE71NLhI+34uEeMgDvU3wkhjm5Z
	3dxnUPen+VZpRu7G7IcDiWREevScITD3VkhCqXnjBaxpACwJUG0yBmN1ACEkhaKq
	BJju97trksGQEP2ZMR4U1vmUTy9qUm50KRbNKIKe1/gcpWV4JcUxEwNsD+uhhnsg
	eyK4dyQ+nDfrqXyUQQqoL20uslMfru6Ol2soS0EYA/6yOoQ6AhoAWji+gPZEAozR
	gj6AA0Bs8FighAz2R/RDFMkrzKuaN2Xun7CZDTWHHwtWi0mysPCDnHeQo/DAdB1/
	Cq1QZg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscy98v1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 16:31:23 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-479d602f323so7638363b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 09:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777912283; x=1778517083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoxhWK6IHb1qi1sBgTOzXLNliyxQUEnjKfKgGROIUJ4=;
        b=LS9wALHALrjYRyTY7xGtwDcNkkralRdvGyTvE9BD6mJ1UyK9mYdRn3VviRmcn+V3bL
         jbRqiGQ6Syawt+mIklk4j7ZW6j57s8YpBlCchuO2gC1JeEh90YeB4rcA6+9xeMsGZVVj
         2PQ/i0oXZGfkV5WoND9DhM0ODHJWHwXWe7ciNjDQIr7mqDuqluO62l9k/aBc6QFAvev3
         aY9BT99fmi87DSOWqhmPAREYWeKy8aSZzkBhXg38tCb5hDkBJ76Uu6SvifhIUxEga+cq
         MV8/Ogri+nfHh6z46iqgLqLebXijE/fxj2euSVXWfzz9ELy7R7aY9Y7v7O/Dptp9OFUV
         ewIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777912283; x=1778517083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qoxhWK6IHb1qi1sBgTOzXLNliyxQUEnjKfKgGROIUJ4=;
        b=k1NLfdG3PuMBK/0rbIO3YX7CSrMe7pf++P+Z8DzlcezSyWTSrWJPU3ndvobg29ThW3
         f1DGcjt2XUJg1dyCo9PCsPlHAmKbjm2qBGmEa6oYYBp0bvaxNs7vNV17WdHGTe3GZbyd
         pYBG+TDCGe23IXx547lbic9Q87jDNh876V+g9n+LD55H1d2f4I/W/QI6h6Tq7E+5vbEG
         Rbp4uRTscG2l5ZgcLok/LzEXVivyCh3kp4O5u8bfwc9UmaiNp1IoNrKTzMQRSsAWGBQ+
         x3gDws6j0Kv3ZsxLNe8oYTmPVk/1oZXdTUhhysjorln8pXgq46Z2BOvUk0vlcA5cO4Hl
         wm/Q==
X-Gm-Message-State: AOJu0Yx7TuNqRVyU8Pc6W50IrQskYXu9bdqQEzegjBZ8DVaeqisIrnOC
	uMsRrQd3siLjL9j4yR5LGxl+Z/zg3yEhIaOikj4swpY4YIPucufNZlf2B8bFBQhldfdktQufZw0
	RoKrs5n3pPszaa7plK6m2aK3XIH4Ib0u78ECmGodS5V0Mu03Ta+zWZaPzT6blBHhsrxgs
X-Gm-Gg: AeBDiesqsAtGcYtwwyS15t+LNTAWv/w1udJtyxkGtUcTyy8PwngWGWR4sn2ty4MSG9U
	BR4OiYAxA0YGfaNHgHzFeXhCKmHTL9DJ5WfV7fFplj9wAXDU9ooUai7tR05k+37WTg2rkGBgcvs
	XgwCPh4oBbZK1rwbPlv24a5e1pGbW6SEAUy4A0jjjOUQ3aE/ytBbMJge1/MPw5Ut4y+vS1t9Zj3
	s3JaAVHulkb/26yyZ4LXdP1JKfMERmWc/dztWDWxynhfqIs0FsalV6nxWETGMFcdf2fI0MvrweQ
	hlGcyzroH2Dy4uePi01jL67GkhICQ2mpO5nzEUKLtTbU7ERKiXwFfXWMESoJaGqVk6zKN0hmzwG
	/VP+YxFRkPt/+Ph/kqeoYvybmFJ/OnINKboriGyl2
X-Received: by 2002:a05:6808:80a7:b0:47b:ccf2:91f1 with SMTP id 5614622812f47-47c88e80d3emr5374455b6e.8.1777912282449;
        Mon, 04 May 2026 09:31:22 -0700 (PDT)
X-Received: by 2002:a05:6808:80a7:b0:47b:ccf2:91f1 with SMTP id 5614622812f47-47c88e80d3emr5374422b6e.8.1777912281771;
        Mon, 04 May 2026 09:31:21 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb75fc1sm294986075e9.7.2026.05.04.09.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 09:31:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 19:31:06 +0300
Subject: [PATCH v2 2/3] arm64: dts: qcom: Add Eliza-specific PM7750BA dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-adsp-usb-v2-2-18e0b0b0407f@oss.qualcomm.com>
References: <20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com>
In-Reply-To: <20260504-eliza-adsp-usb-v2-0-18e0b0b0407f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2358;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ClceAYiJ8whQgLN7bPe85GMULVLaGBTfiMaFdDN9qOs=;
 b=kA0DAAoBG19EyQCVFVYByyZiAGn4ydGiKEFTDw1x+kKynHZMnZhJ1FVOteuJQgouvYNwFwJ9/
 okCMwQAAQoAHRYhBE7z7hFOeo8qyqfRuBtfRMkAlRVWBQJp+MnRAAoJEBtfRMkAlRVWX14QAJ8G
 +bX0Onm6fCm9m9l6jNE+TYa4Fh58NkfJC3AYSyiFMFh7bHn7H1y6wiFPtwk2auzKldEGDXVuaP3
 jaz/QNG1yptjMD3It89eAc2zzDNZcY6ymzNrbrGyBIh/rfnDPxm8sq2JvU9WTuw8Tvo64+lVP58
 Mb0OsuUK6SnVtFI82bVDKTbRJyRZ8X6AkZ1RTfpb18K69/EDZvkfEM05rXQwWsvnaJQDeYOZFPu
 TfkFrks8kMgnCCc1vfFEeo2HJiBzuP4FD9M9WbDw4secHc74JsNHYbEOBnOc0jMV0/NvzD+a670
 yIaLm3WB0h3GxyzDLQCt0b2+eE/Df0TSZv+EbdqXTtcJ5o9v8yJWat+eHVJ4o2UZvDj+X7u/fg5
 DJQ4akughDF73BCYdtPCaBVO5xne5nGtqzDyfF8/TUieumMGaGbBA0f42W97bP4UmcypLm3CF3X
 7JIDqmL2QqZbXeBFv1NjzSi54Vfy4oXiLRqTaeC/jUK63o75L6i9nv395qmQtgXoFZv0LhcDefY
 UxhwIf43F+qanhKI9CXS0y7Ppl7Yk5vvDxWL9L0EpQZL12BTorIXVwRKHinh+2qrNAqIgeij6Wr
 hxKi37x5i8QFUh1zu8uylpHcDDZzQXit6rRCC1BwlrXPcdg8pYZEt1PnvBeYW5+X9tP2g/QQUjb
 O0G7r
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX907H+utrnise
 6nzYx1SJr/0awzw0pgHy80YO38T+YMeeIgu/bypD3C5Sgon67eQZpkpG9LlHNdmRa+MHzlJ//px
 ncPzn+HUui8lN8CbRU3CikMhrlRcQFFp+Mf2H7H2Liy4Ot4Y+Og3UQ0wCd/wpKSX0kLcMIAmlcO
 Cy20+iM1TVSnz54zJ/WmwDkOS72ZBp6qj9Lxz4ypBsawb+aU2z6d+Ae040/0ZXv2C9iAy3V2XwJ
 oOh2dHsaa5n0oqbynzHFVuAHnHIqvSe1wJd5ac+sEUN8iIo2uL9NAc032nBmJHoEh9pSPaCB/+R
 UznPgtUK+DRV2ZXD/cHK4V9XytDglsBNCmqC/adNswaF43ROq63rS2vJ0p725WBmdqmgL1ot9NK
 lV3zfjVVjCld9mgQwDK2T/4hpmzIh3L7Zg/iblJfsEHx5Mv00HUmoKtPzeZYFcxkxqLGxwxjUOk
 t/8+otUcLvweoBbvP7A==
X-Proofpoint-ORIG-GUID: mAFOiTioJB_zALiaLnjwGCRNpXNEYPps
X-Proofpoint-GUID: mAFOiTioJB_zALiaLnjwGCRNpXNEYPps
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f8c9db cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4U6AihNozsKCruDMU2kA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040151
X-Rspamd-Queue-Id: 2F8244C1712
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-105778-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[a00:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.7:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.34.96:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

On Eliza, the SPMI arbiter supports multiple bus masters, requiring
explicit selection of the master for each PMIC.

The existing PM7750BA dtsi does not provide a way to describe this,
so introduce an Eliza-specific variant with the appropriate bus
configuration.

This duplication is required due to hardware differences in how the
SPMI bus is exposed on this platform.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
new file mode 100644
index 000000000000..2c386f16eca4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm7550ba-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pm7550ba_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus0 {
+	pm7550ba: pmic@7 {
+		compatible = "qcom,pm7550ba", "qcom,spmi-pmic";
+		reg = <7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm7550ba_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm7550ba_gpios: gpio@8800 {
+			compatible = "qcom,pm7550ba-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm7550ba_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pm7550ba_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pm7550ba-eusb2-repeater", "qcom,pm8550b-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.54.0


