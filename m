Return-Path: <linux-arm-msm+bounces-90830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPtBLaDqeGmHtwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:41:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA41E97DEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B35A30A1568
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FBA3612EC;
	Tue, 27 Jan 2026 15:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MckToMAX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyBE5OAN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA0E35F8BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529498; cv=none; b=tjhkQalphp2RsDuvMlVnZ00roKAfMuYPvRVzWWpddJXfDjSLbRq3f1Rja3UxK778hSBouImyT8R+BfvA88A4mYwMIo+KtIkZEHNsQ0mIPJtZ0jOXL9L1G6VuzxKCYS5guufGJekFZ1vIfkE7ScRSjZrkmX8lD3eVRq5+EnULwlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529498; c=relaxed/simple;
	bh=rT9aOvKoSdoVMoHRIYOqTjccVfZ8vSzhwbpRtBd8d4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ahOxL3kg25Kr5CtZT9r6IT8P/tx6+8CA1C8Hbsd67/SOjymhS4/zklOhDmKzK4QGXlgtBSXnlycnlOfi+rHMAOBTLAW4wPrPT6H0De02Jdt4sTPhDUfzo7rAJ0ugYyOY3hU+wrUIbubDn3urWVXqjqEcxU6cIuBQ4l4PRmC2hKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MckToMAX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyBE5OAN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60REZd3H1065833
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+ZHp27u6SO09MSQuvFyIVk4/ZmKs1kInQ5godvccYU=; b=MckToMAXYIa8T6OI
	vGtZEhd1polk+Ow4u8Tp/ZNtsbWZNEwPLWVomCBClbTeOvc/Xv7rMaESHIve8Qzh
	6aF43VuejqjB7vU9gitmIFS1AgawiE9qtnDrtYdQrshlF2HDle19+OvV3O/2hLjC
	ekGIA6QMxPg78U2IX1xvqQTfB84AIQK4LUydKnSX0r+pRMAsmIyEyrgwK/x2Py8E
	7Rn4LJSofT9SHv2zt1r9osDXOij3YBHGZl6UKB3mjom7wRkMPtel9TyhwWJ/05Wb
	TJ0Oj/sjZ6wEUt9aGrOoZRs0D91m05rsFKArpvfQnkeQTt3mzMIFcJWXcvMmwRiP
	mkXg+w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxy8x09ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:58:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0d058fc56so42408665ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769529496; x=1770134296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+ZHp27u6SO09MSQuvFyIVk4/ZmKs1kInQ5godvccYU=;
        b=GyBE5OANqbz3VLkJYtdL37ozw8xF508XEVtkcO2HQTH4+YyRYrwSM+eB5pdN5+Npmx
         zJQ0iA89z9AKL0BIVxE9SZPDWndP2ZtAfKcKw6+5Ix2b9eZc/vS4yAjJjDOI2PBozXa0
         Pz/fZZn/Wt5JgVQCe1AmrqkvFzenO35E/1Er4Yb3bIE2HwHIg9W+LRoUlF7U3PsFNzGF
         M5W5dUbnmcMU9gNlVX8ckpCt3c3a+L2htPD5JDBi3fLV9b7PqW46n3J4OGQzIuo+WKVK
         SgyIlOD7nO1ZqwPOpNyi7RDfdLMdZWdhOyPPYSrl7PF8r764zDy2PNrOOk4jgJ+Cmjgf
         wKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769529496; x=1770134296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F+ZHp27u6SO09MSQuvFyIVk4/ZmKs1kInQ5godvccYU=;
        b=SlCvwEfSYiUK+NzJpg/hWHzXjuL/XDluxSzQEzErLyy8Qw5w19xWSiIFK0EkIqxNSr
         hjbKzJbeYyeBTD99ab59fN34lNOyZjrlEt8SivX7x9xkKpIqKWv803A4MSr/sAfWRpwh
         09J0fJ8MEo1wwHLtgmI2NO0t+LsLgn+mqx4s7uCtJHQti4+CXVxE+RuelCH7uUDZpe+i
         jBLo0T5Jrw970CBfre/I8AJVnWgdIB9qmd6L5fH7hUke4tN/gzdh5HsNsrCCFoNqyrf5
         UtaNrcme5uFetZPGxrscoJEBsDzJtbZI5fyFVrKyA/CLs+OyAGR+nEmKQzdrgq9PDnFy
         p2hg==
X-Gm-Message-State: AOJu0YylCL3d5TJ62VOGABt9/3XAx3PeQ0/VcXyhYPGsdRUMeRp1w9ui
	RZ7JrVFzmGR6OwKEMo9tkVt3bbYe4MqqScgY8NXtRo139DwypPvEu+U00r+gwQe6wYWwwJ70+nh
	mPLzQNHShTmHiuvAEwYB9yeJ28vdFcYB5ncVs8KN/iIxeAzHC469Zf8vjmgqPL0JPBxHW
X-Gm-Gg: AZuq6aKDQ7DdCFpv4qKiP7IfI1twRy1+D+3BWGGdmidusCPFC+9/juYPuOr7nq7Nxay
	iA1hFov0M14XKXM/GGcvHCRIyNU+kIZ9O6qU4NY8pRilCPHYr7xDihqRb2qoFRrHa7vGPQPchFs
	DfVBjPCjge7RigwShbfSrVLV9N+FtQYqKcZZU/AhTR1QXZ87oTx11gv4UHFzkOa3NEBRclJVSeX
	1CWIV8g2s2V7bjFp6Pdjb3BppQ8zrr0zaAU891FkDU9S2fEUAGyzpIiPg3Wxwk+OnOvIyxyJtj7
	zFkEI0YPo6GYB5nb2mI7mmMItCctf1CTodaP64gkz99F9n27KxmypPVVuWz/5ZnARHXljqogBjR
	Dm5YUvVZ/G6pWnacmxFG3MMRcjEFQ5UvRpGy89ek=
X-Received: by 2002:a17:903:1206:b0:2a7:a98b:9fa7 with SMTP id d9443c01a7336-2a870d96a7dmr18054825ad.25.1769529495511;
        Tue, 27 Jan 2026 07:58:15 -0800 (PST)
X-Received: by 2002:a17:903:1206:b0:2a7:a98b:9fa7 with SMTP id d9443c01a7336-2a870d96a7dmr18054575ad.25.1769529494982;
        Tue, 27 Jan 2026 07:58:14 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802ede745sm120577465ad.44.2026.01.27.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:58:14 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com, manaf.pallikunhi@oss.qualcomm.com
Subject: [PATCH v2 7/8] arm64: dts: qcom: kodiak: Enable CDSP cooling
Date: Tue, 27 Jan 2026 21:27:21 +0530
Message-Id: <20260127155722.2797783-8-gaurav.kohli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
References: <20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6D7OwVn5uNK9Ai8rUiiScqtsBJAU5BWE
X-Authority-Analysis: v=2.4 cv=OcWVzxTY c=1 sm=1 tr=0 ts=6978e098 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9N0ZlmuXsyx8K3-BwEIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 6D7OwVn5uNK9Ai8rUiiScqtsBJAU5BWE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzMCBTYWx0ZWRfX1c5dFYtH0VgL
 Qa1+7jfUq228SVSm8ISAPX6RNOZkylizm1GuTsuxTkhwJXnNM5akIyA7y5q3sOLaC/TmOIfZf2m
 mFY567WNNoYPhUys8Eho8tg7wdNGGzSiVE/BjOE37SLsjkHVRyMvJdNVMKDZxsiesLu+CSiV6+3
 PjHuSxzOdcOOxHPuxYAngV+Mg++Kj7FNKGaaTZbjV6TtwkRRwmErcxprWdeud0fji7rUm+TglrN
 kCvVVIuxQkdVO8PXbtAeuoSnk8ZC7IgA/ITH8cAbD+BqVwDMDopRzqcRTUYZBexMFME0A+0jhte
 S8wsm2JZbuAL562l0P5n5WT5jgfZ2gpSdUPscsXQJ2a6qfh/4OfCfpFM1s0Xn89Z8TcMTmubIsD
 /RIAuKcOG167c2r2nBMr+ng1LyZqcOIu5ihZq66fQUEtPCWgTo/7+QWjkwud/4MLa27RSHN5CU6
 XKrvD31rCZ6sTy4EflQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90830-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,a600000:email,0.0.0.14:email];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA41E97DEF
X-Rspamd-Action: no action

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in kodiak.

Set up CDSP cooling by throttling the cdsp when it reaches 100°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..3c79572bf55f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4793,6 +4793,15 @@ compute-cb@14 {
 					};
 				};
 			};
+
+			cooling {
+				compatible = "qcom,qmi-cooling-cdsp";
+
+				cdsp_tmd0: cdsp-tmd0 {
+					label = "cdsp_sw";
+					#cooling-cells = <2>;
+				};
+			};
 		};
 
 		usb_1: usb@a600000 {
@@ -7600,12 +7609,26 @@ nspss0_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				nspss0_alert1: trip-point1 {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nspss0_crit: nspss0-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nspss0_alert1>;
+					cooling-device = <&cdsp_tmd0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nspss1-thermal {
@@ -7618,12 +7641,26 @@ nspss1_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				nspss1_alert1: trip-point1 {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nspss1_crit: nspss1-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nspss1_alert1>;
+					cooling-device = <&cdsp_tmd0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		video-thermal {
-- 
2.34.1


