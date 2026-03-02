Return-Path: <linux-arm-msm+bounces-94895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLFsFvJ1pWkNBgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:35:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B43771D7900
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C9A4305F7E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581AE3612FA;
	Mon,  2 Mar 2026 11:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmjJhxuP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLl7KBk1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C76175A95
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772451048; cv=none; b=c/6vJQni7MmkbnKQtuyjWYt95ELRF/DXfvGfNeXGDYiUqUYEV3b5K58uqM4thFBCmyCTOLvCw7DdJihkm6U3IHTGCY+wpsdLd7uSV48xAoToaIEBVxr3c3jSP9SXRm7aeSGPPtUk92eQ9Tuu008WK8rDicCNppcCQpTFS4telkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772451048; c=relaxed/simple;
	bh=QMAEueWMdFzxE15Aa/UY66NWhDZDqXExlzMWZO78AzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JuaE3aXrsE+TWonXPYT8oJGUMprsoj1cRoSORFTdas8zhob53rewmJU1efUzapUAuh5pYjZNaU5in6Oj5UDFQOyuQh00dw911w7jIeqyAqM4iTGe9O3S7RW4lxoxYdVl3Uhr3RZctRJ4Xq3QXg0KZMRWsgVg8glJdV0okxPKydE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmjJhxuP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TLl7KBk1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226h9Wn2504592
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 11:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/zkjpPA7+oKtBeK2o+oUF/
	g1/OLxdlCElFoMepCL7fI=; b=ZmjJhxuP8WN/bWrpVGU3qLrl2lp92mAvjl1+qg
	xmrwEAa2Kgj5NC5whifOa8XZxAlAWUxp7TqqMUhmejAvXB3afNtlEAfIFGuJtLVC
	D0S+fINeEDdQTm4omzZ95Qh3/yrHMzH2q6f259HcHTrMrtnw+4ogVfn0+oQ5KsjW
	BGPIwFSUt2Nn93qV+OtIRxqjHA0+5iEbdmScZ9MnG1Fq3Y6UTr9nPik5sg19uK6s
	GsFDubT8fYwjK2Y643fthQfAWHjIRBxK34W/Vcx2+iC/OnFJQUGA7hmOaC9spd7I
	hUBLRbJtgldave5h46yLyWnl9tQ3ZcGVj2wVh7+qsH/sf3Ew==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hes1hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 11:30:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70b6a624bfso2691578a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772451044; x=1773055844; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/zkjpPA7+oKtBeK2o+oUF/g1/OLxdlCElFoMepCL7fI=;
        b=TLl7KBk1qQOse50lEfWabRdkM4eX2D/7LfvCMJU1utGYAkVn8lcELsCLegp8SyyYjU
         bqMUIyS43PM9ve2OyikgNBwcfoHXUgBuJXhfW45BqAaMZDYFbwgIf0RlSnmlC/WUKVlW
         w8yjlvwLxyUMg8W39KpEFDenBNNC+BjrcqTiGclZxXFIZvmgYf1NTzWM+/E8f38Qv9pt
         MOLczIfcketvq/IJNkgmPSZFiQ2QDX4mu7vSSDvWvjk4XJMr4phsTrfsvyivwn/EjvVr
         fMbwZUmvs+JtKgsJWPIm3V+sieNgeYxJiAMj6oTn6t5W7/eDi+tgCoMF8M4itNd76gjW
         zy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772451044; x=1773055844;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zkjpPA7+oKtBeK2o+oUF/g1/OLxdlCElFoMepCL7fI=;
        b=ZoJImrTwlEzHkxDj8kXo+nt12Ggeu0rQr+5wQXOKZZ77R2mttgebeTl6LNAB3AY1Vx
         43JfEyTSFCpQ8DF6Uf2shn6jRMNfYS4RkCFvKvCF2XYh23LA1Q+IdthUdCZNIrCmo9l+
         NIrwvNt0fbYvgFGqtUluw+OaTdLn+4NZ1scv5IqZDe9ADrPNQXUg8qJz4H2tQt8vpO/0
         LNmxdbsudvNbPT5CsrFxQXEHMVvUW1EKE0rphbPL2wrF+LqUi4h5IOHWtuHXFBGP0zV6
         k+XCm/R0He2bwbxCzfkMG/5H6xnCGcPaGg29bLVe2t98CgkYW9rqJzjunBAE2iomZkk4
         8bNQ==
X-Gm-Message-State: AOJu0YwMHrkbrFdOn19DsjUGmIgMjQMksWwoXpdXEygYnL/9ZJFz4dmr
	UPrZ4sS0ox8Zl6WurlrTR27tDjYuVegd/Y8uo+MYOcVCXs+TbXpT9KzKc7pHE6kWUnbyXIUiKLW
	uaKBtJcIDLK5sYXybVS79YGlPAg2RheugiTvOG1ymunKTd74ZYl17FuYV36OHvRpZTjv6
X-Gm-Gg: ATEYQzwtmphFMP1zhSJrGl2HBP5GteX5M9HK9dYQAEYl/Mf7D4EKlUJpoCsJ/vNM6fJ
	4uyKlDQJ6RLC1q/SYFDosnIYsa0GEqwHpTHnyBEilfGhLWI1MLHu25uKQy1f1/AA7KEcNDwIx3p
	IKscnBvqOtyd1biLDiEe/O0OPiu7oZvd3uIVt4HT7pn3jDU8FJ3dy5sbfXCGIsRR3/aevxYWKs3
	NTKI4xC/ybIbX7MjiTmnsBUPI6ceJFczBts6Nt0bDr3Z8Bm37Yunjq8c2BDefZbYXmAwk4xkiJh
	KOpeuMptJc/cgLR6nDRsNzDi4I4OJQYncv5puj2Yt1poNWIG++FUaC1eWnzyzmGHDE46NZoKqwM
	11ef9jIsBbAybfsy5OnLN0WOGRyrT6vDOMUHxEepzade22KjepoM=
X-Received: by 2002:a05:6a21:7d0c:b0:394:4d99:ff56 with SMTP id adf61e73a8af0-395c460060cmr10796919637.11.1772451044323;
        Mon, 02 Mar 2026 03:30:44 -0800 (PST)
X-Received: by 2002:a05:6a21:7d0c:b0:394:4d99:ff56 with SMTP id adf61e73a8af0-395c460060cmr10796889637.11.1772451043746;
        Mon, 02 Mar 2026 03:30:43 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4d31138fsm38593965ad.83.2026.03.02.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:30:43 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 17:00:28 +0530
Subject: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Update TSENS thermal zone
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-higher_tj-v1-1-4c0d288f8e7f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANN0pWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNz3YzM9IzUoviSLF2D1ESzVANDI/OkRAMloPqCotS0zAqwWdGxtbU
 ADGqy21sAAAA=
X-Change-ID: 20260227-higher_tj-0ea6e0127ba0
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772451039; l=1823;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=QMAEueWMdFzxE15Aa/UY66NWhDZDqXExlzMWZO78AzE=;
 b=cRIFVn9lsJOWvgefCNT0ECdt4DUOUjMiJQScY6z3Q8DWKpfHFqwl3t8sTey4TtQhODZCwm6zP
 yNOvC7uo6+dDyIwJ64m00XowYwxZzcbb+31JyUPx0Iblk8wWDB2ZtVX
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a574e5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ksVRSQBO7p1Vqs0csCYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: A2HMU0H1Dhbq1AqokHYR_wnifAIlAw7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5NSBTYWx0ZWRfX3ta446QNz+FH
 G4693S0tkSIF9CveMfc2zvtI+0e/UmYiUJf5bE9essj6YrBPapekjRbhwfcWKeASYpMFY5nqLhA
 EBW+Q+6m/mDpEHESSwRL9gUd1Slou5EpdWHTaccWu8chDNrIUF/Qizjaw4G55VCLuyGZ7j54TQE
 /46fxdDCXGuvDFSQ6HR14qp+Stev+nceiVou5NvMutR3ey6fSGLUEiDZpBHD44uA3o4zxONL4PN
 VgeFmgRhl9msLz1gWvhwUSV2hVnszZe9PEl0YEg1si2YSTwPPKRWvu9SU/RldNIu4mbjnlhhq05
 V/cZ/LyvYA3EPKTAoaMhv2P9/GfjtROviYRy/2k/4s8HYZNZ8xOJ6CZTf8zkHKNl00I1yYOpQHI
 GAxPiJX3opkPGFTIcpARf8bt4b9hI07dtWhG9GXv6V/EBs2UZN6b1aKIrPFavt7iAMtuUSU2aXT
 aTpyUpisHTHEJ7hcosw==
X-Proofpoint-ORIG-GUID: A2HMU0H1Dhbq1AqokHYR_wnifAIlAw7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94895-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B43771D7900
X-Rspamd-Action: no action

Hamoa IOT boards support a different thermal junction temperature
specification compared to the base Hamoa platform due to package
level differences.

Update the passive trip thresholds to 105°C to align with the higher
temperature specification.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 66 ++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index fccf1d1bdc60..f04f7f0470e6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1529,3 +1529,69 @@ &usb_mp_hsphy0 {
 &usb_mp_hsphy1 {
 	phys = <&eusb6_repeater>;
 };
+
+&thermal_zones {
+	gpuss-0-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-1-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-2-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-3-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-4-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-5-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-6-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-7-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+};

---
base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
change-id: 20260227-higher_tj-0ea6e0127ba0

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>


