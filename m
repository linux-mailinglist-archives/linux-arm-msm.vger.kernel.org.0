Return-Path: <linux-arm-msm+bounces-105438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HXsFOU39GlE/gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 07:19:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CFF4AA761
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 07:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C633630136A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 05:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64229343D66;
	Fri,  1 May 2026 05:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMVIn5Io";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILn1RlRv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730F1341AB8
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 05:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777612769; cv=none; b=hJ5hE8+iaXVXBlWAqWRx8LqbH9IEX29WsIAsowAOnrTlQY6dNsWImoorZ/V1dpioNPetT4Xpu7Fb3cldx0IHVUT+R9uwqY4NzPiuuOwq/rl82G7V55vuNLwKmZwjHdWLe9XQq2FLgJxj0iJ8c3WjdtwfhLeMVz8XhLJeeXV/XR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777612769; c=relaxed/simple;
	bh=ucgqozYA14z/8c6S0n3Q2xP56B0jUOkKavb4a9MGLaE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pXNF/Xl9c8v4qLnz3DLOiThm5Fqzf4b+XmeRr54YVH8t37ac43SJgjiCy3bjdNHZapGiLW543UZkqrVA8EK9bi0z/rxCzsi6/CL/zZUwFgB5twaNWPDDfxXgGIEBM1Xmd2DUqu50mYBgs7KdDQjDBqmtk1JxSUYUKLoq9A2zlTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMVIn5Io; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILn1RlRv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UKcrId028163
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 05:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H5RMe1ATvaJRcbdAD3bFr+y824kSK74UIkS
	TNJzuUTY=; b=PMVIn5IoKB0QC85MNgKvvxTrACcjjWDeI4FQVimyC3rv7OyBgJW
	7QqxDdht8OPWDAMzjtlCVwJSNYNt7vJ2pL6rKBpHwe/RfFBqyWiH5TwDSUnH+yxh
	8+BYivv0uxDln0hc8CWITnNPuCmE++Hr0EdU83lSyMWOptQ0lTORTv7vTSM68HOL
	qkT+4JDbedFXVJPq1GLA2uOn2lbA+TlwdP7MekKJ3HZnMD64BEneMggf9sUTFHaH
	QlxuWxsgXm1uz8Bq8kvA+MMgoNCKN3VgEeAYGiGLW9F9CVhBfvYwh3vnyhQWOKKu
	qPqK+NBUFey5IfOVpT22Kn1/dZGdYdNa38w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv54wc2wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 05:19:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e91add2aso15271885ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 22:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777612765; x=1778217565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H5RMe1ATvaJRcbdAD3bFr+y824kSK74UIkSTNJzuUTY=;
        b=ILn1RlRvh+iEoV23KnpwM0IIrhoca1rpQ822r6FE9FysdqnxYZrTdN3Ueqs+FyN/jx
         X2rBq7dcti9Ztf+XtTsQaAZmGnX/gOw+mpr0zPYJXNDIkrIWrWQxcuG/E+PKIc9eR3e6
         MiQr2HbD2zzEx2WbU6mKbUaTgCSUZb0slzM+IJfxL/nTW4fQfEkBl93wyEjqv/2R0aI3
         jQiyQ8aTsTfFtkBcU4Cj8J/Acon4u0rtru0VJPFHngwm7kXCkr7wBiYcHl+xHJymTs43
         8Kj3DwTgayu+s31JAQhK02dHflwe9dQd9b7xlPoqBG08CY8tuGvzEWNqmnUNdPQd5eOu
         mr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777612765; x=1778217565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5RMe1ATvaJRcbdAD3bFr+y824kSK74UIkSTNJzuUTY=;
        b=NKfMAlUjfu0F28T8dGdW26LgSo9EZ26Ldhr+UAPVx/kIqpoVmllZ3GIei4/JTjfyZz
         IIdYRGV8BzQywsgJ45WNlV0cqxqWnc5SLXEKRy3lqcQQ4NH/eZtBEQlI2cWWSSFavEPK
         aQEA1ZkEv+kv/eTqpyWBQP1ZOa1HvnJozHquzWhnAhSqw42ZTChVz1CmPF3JFU0Vaf8S
         hWi5yJ2KZaLNPoIeUzvqbGHRmPvKNIFwJ9UMoTicD1vIfCt7LHLjoM9J0SckgLA7mFEp
         tPlP0xGX957ivpNJXh94lFSJhKhqQjhAxTIIi65ck+BqOgnfsIR35Q0x5jq5QYo2e1DJ
         xHSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YqFbsXcPyaJBZLm/RoSqJxF3v+yS/p1+dlLLVxWdvKYYRsg+1NxHGOpAmmveT2a+CmpNUEMY/+ZyBqGgB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvqj97YEu6O1LHiwwM1Efeor3X734TblxuMFFBS3yseNPZjORO
	U+t3ji7qp6ZfWRoW+Qho4eXslZfyGqABxdmPwdhj7Vn5MdRNOhlGfwn4qfPL4blGfvl9BNi7gKB
	gNJ5RgnqiRAq1eCTNVkZyuiBDutlYz1buTwNMZH2XCyG1SHvEx6gCdQ9wMpfJVNJISBZv
X-Gm-Gg: AeBDieukou5Ly6KvFv6begszv9wlKMzJHqHtStzGq0iFrmdmUclR4PRTbvGvnOpgoR9
	4Cz3VDpiZ1D/Y1w4vJPBmWkDUKfWgTLXphn2xjMi6yVMZTOHwK7gwxTCopn4jGDbfnniUptDoLo
	fohMS5kr4QokabDt9FocFyA6mFbpQfz1hkP+MfBnwBKYVwj+K6JC76NatIM2ulbalgrqj6nL9RQ
	XvCFIPkCr42ZmnLAqcq0M/fvjOPC+XC8toVQZpTiYr0UU3Tc6mSuaKGTbma9ovhKyxpEW0B27BT
	O6+pwZzgW52XCs8Vq8egCLEGI/7lYX8AKBXnrCcn5HHFpM3hRduNpjoza+L0N7YQQkFrQwYQTvo
	/aRLzQiFs0va6AzAFyp6XSFpci7+KFpnSO/s1uquHCplDAS8mel42
X-Received: by 2002:a17:902:d581:b0:2b0:6d56:8d29 with SMTP id d9443c01a7336-2b9a2513881mr59182875ad.32.1777612765335;
        Thu, 30 Apr 2026 22:19:25 -0700 (PDT)
X-Received: by 2002:a17:902:d581:b0:2b0:6d56:8d29 with SMTP id d9443c01a7336-2b9a2513881mr59182565ad.32.1777612764792;
        Thu, 30 Apr 2026 22:19:24 -0700 (PDT)
Received: from zhangq-gv.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae5cc52sm12353955ad.78.2026.04.30.22.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 22:19:24 -0700 (PDT)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: Add fixed regulators for WLAN supplies
Date: Fri,  1 May 2026 13:19:18 +0800
Message-Id: <20260501051918.1990713-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sPVbZpGMlRj6hhk0WHq7SVR35PFQSip4
X-Authority-Analysis: v=2.4 cv=Rrf16imK c=1 sm=1 tr=0 ts=69f437de cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=OYB4W3EJkAgPSM3XL0QA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: sPVbZpGMlRj6hhk0WHq7SVR35PFQSip4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDA0NyBTYWx0ZWRfXwmzlyJAEl4J7
 sbXkfr/6rQ40hA5uXiyo1ewnqrbZmoZudYyCM9X7DSrcIsAnuyiNXBwspipzVG2VUqPX+n/5rs0
 JwdM+XN7WGaSjl8bakxPcxi2eynYV3U7DG0xkftT0mE/LZXk32Ac00C8WjKZu3KSc/jFcvItNKf
 UtsiHjZFNJJbSzBN6yGcsYSAXI+0vAcUZJPvesqeJg+2Og0z/NV5m7im/kje46pFiK/8pP5z2bk
 ZQTTlzg6n+wcd/AvCmaBxoodta2WtVv1q8YuXNAWAr6EOD4RI7+sma/8MTx3ddXLeMl5jBJTKB1
 RMNLuk+Z1lq/d85pa18z+E4sVlX68C+U78O4+F6pg2dgyxFcVZUa9ip9a0bOIBKp8sBjUf1O6cv
 SagzKrLbmdWxkMHix3Llw6KiREVqtajfBCSpt9DmuYSlnQ5rPk4XkAzRnpwiZyOREJv1u7UoIfS
 RUBoZBfrOIy93Ktt6Ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010047
X-Rspamd-Queue-Id: 00CFF4AA761
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105438-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add GPIO-controlled fixed regulators for the WLAN power rails on the
Arduino VENTUNO Q board:

  - wlan_reg_3v3: 3.3V supply controlled by GPIO54 (wlan_rf_kill)
  - wlan_reg_1v8: 1.8V supply controlled by GPIO56 (wlan_en)

Both regulators are enabled at boot to support WLAN initialization.

Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
---
Changes in v1:
  - Clarified GPIO roles: GPIO54 for wlan_rf_kill, GPIO56 for wlan_en
  - Improved commit message readability with bullet list format

 .../boot/dts/qcom/monaco-arduino-monza.dts    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index ca14f0ea4dae..1a40ac5bb4bb 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -153,6 +153,27 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	wlan_reg_3v3: wlan-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	wlan_reg_1v8: wlan-1v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
 };
 
 &ethernet0 {
-- 
2.34.1


