Return-Path: <linux-arm-msm+bounces-90829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJupAzHieGkztwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:05:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C386975D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 17:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 809AF301D31B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F0D35EDDD;
	Tue, 27 Jan 2026 15:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k9l0BtHs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tybqx73X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FFC35EDA6
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529494; cv=none; b=Wm3wXdJ6LFJrD4Vt6bNF5LB6ReR/z+bjDSWlLzOwbwCLrdd96kuVp3MKaAb1t7OQU+OArfylexAXuEb7OyeA9fn899XZAxvlVRZ0j2uTZmrlmi1jdPNWCsPdeoKm/m306iN2g5YBN1+MfZxoYH9uljoCH5542XQ31vGc1+cU2Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529494; c=relaxed/simple;
	bh=imtITUMdGl12JmD9BqLF6obXBs2hrUtdLo4cmRhOnEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vEl4lXztlDr3ncFi3jKAfSDBuVJA+7NM+mIMpUiC4Swxk8gAnrFHlxtcRvtPh2387wTfsn2qiyopXknezwVtDYpSLg6k622UlL7L0kRfA82npxnLC6lOwFksaKPxijwErqI65MncXXy0aPIQ2K/zCD2w/n9jivyRFhi4lMaA9Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k9l0BtHs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tybqx73X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RDg3xi658896
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jK9v27e9BZ+Wwf8D2qBSh4rJOfb5MBzZq76RGHeZTQ4=; b=k9l0BtHs9jmTcDc9
	RLFbrXAwEEHxBkgqN7JkKr057KYnbVGev1dqezGf09ldL140BX4Ajiga5aHObGA2
	2lQ5Y3tDSOigOOFxrqLwj1v2X7J5vazuA2eWvLjEJX69inV6CLKduy2fUl9nzuRt
	hFoF8N+R1qEiIr8pGVfdvrZYT/+1Z6J8C/Hopoxc56/r3FjV5ilckkiT+qES3lKl
	4hluLEbtNjTgsU3RbKxC7riUSF3AUgusba/cel56sGGF6QmSq1jrLgBzxsIKnRdF
	27mR/Dvg8OiHh1S4YzO182pypC/bb1mTqmqhlUykIEZLXCo5GzFwD9yRwEYXM/3B
	RHx1Nw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxryn9pw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:58:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25e494c2so64868485ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769529491; x=1770134291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jK9v27e9BZ+Wwf8D2qBSh4rJOfb5MBzZq76RGHeZTQ4=;
        b=Tybqx73X4TXD0DlHGhIM+XBzdxmDrH0BxfN/y6aWbAuRkY4T4nodEgG/ywCgL/rdWF
         bXwUEaQc+iahHaQZ0mDlzKKk1bZxHQGxXDcc+7O38DRVO/eG0ye1ub8L8qxNq2T7G+I9
         ioZ4gh8Cc8eM1zbuSOHpiaSApWP4cRszIcdxX2jRy/GcMTkPVI1iWdDAs3sQo6xcDxvD
         WhdmNAP81hxreGDjK8UxjrBVWtxuZRjEj2ovFRQv6ceuJCnZXBoaafJGTTcfFZS5bM6I
         WqgTcmO2is6f+V2H5aUVgPvD0mcHKUTV76eBghEtCbso1o87dcRjDV4kYhbWDh9YlF7l
         p8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769529491; x=1770134291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jK9v27e9BZ+Wwf8D2qBSh4rJOfb5MBzZq76RGHeZTQ4=;
        b=CXMDQPsPE6B5uItj8TSYZfb0d9WPtk0PqNpA9jrun9Cof7HyMi8PZgzETwrEd00IXO
         A30cycjAenhzPss1VEsDTNcfhqDB0TwdlCv2AkBsw2miOU/uhE9j3wUE+re9K6qzxbia
         MTfIiSZn51o2dGNpQiC/09nIKXhJIwn7PFbFPg0up8Rjknw9R9kfllkZGpMQTOgiYEch
         in7MYYn3KjOJH9VaGo47ygC7RPhx8299psP5QA/dL5ZC9guKSR2dtuzwQsm/lyhg7eNR
         1hu+Ax+c8i21wzJwAL78qt3MIIKotmoYj2PB6h6yt4/qJsGZ8EHp2JGo8xgKEh4CDe2E
         fwfA==
X-Gm-Message-State: AOJu0Yy6DM0d4STn3faSckCG1/ZGROAQ1H/1eR2FXjL4Abf9iKKw0bte
	hwduG+CfUyK/P2UM6x0pK55tsVhoWKFb9UwwwnvvZdr3jkFn9p+nRdpHwsfJ2/DS14h3TGuxmr7
	sXelEcY+JKT5hcSUpJG5PvpWoYsM1E40twUoICQ+MBqcLhQEEYelXrNVhDmWG4UAMfrYA
X-Gm-Gg: AZuq6aJcL6cfzaFNl0ZtlD6ODAXy1LRgc2Vlc2fZEyAf9AmFeYaHspQProYjxDiXk0t
	37QRL1Co0gk5ZaftL8j4GpZNPqHw0XLQLOvisYjGNo2CoYrxXoZZNMxnXUH8Wa/Kib19aUhHXfX
	kem0OtSAfut14hIPqlY0xOTp/Owllw45/+N/jRxCca87k9HM4VfSq3keydeNUvApsiaSBc5of7u
	U1WD6eswWRmsCVx94YB/eyxQdS7AuVwUl84LGbMHiD8hvMCh1ieCIOIFjEPuj/5Q3R1eLBLggID
	RTOJqC6x76AttaiH0B9bJO59IOHM+CSiuVnja7Gi8sxe+w1e4eQNwMYzfUDTuIkXBMGBmeBR4oa
	/1aaQ4y4a1WpvXl6gRAJFjcn7EC0rtoa72nsy7fo=
X-Received: by 2002:a17:902:d490:b0:2a0:d0ae:454d with SMTP id d9443c01a7336-2a87133729cmr17254785ad.22.1769529490806;
        Tue, 27 Jan 2026 07:58:10 -0800 (PST)
X-Received: by 2002:a17:902:d490:b0:2a0:d0ae:454d with SMTP id d9443c01a7336-2a87133729cmr17254425ad.22.1769529490171;
        Tue, 27 Jan 2026 07:58:10 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802ede745sm120577465ad.44.2026.01.27.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:58:09 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org, amit.kucheria@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com, manaf.pallikunhi@oss.qualcomm.com
Subject: [PATCH v2 6/8] arm64: dts: qcom: talos: Enable CDSP cooling
Date: Tue, 27 Jan 2026 21:27:20 +0530
Message-Id: <20260127155722.2797783-7-gaurav.kohli@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 8l9U9hkkTg-mRXupFOiQAwMXlTuHALFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzMCBTYWx0ZWRfX/Q5TJJlMFkzh
 TKZcsPSz8YjK2Hn/DwYBemuIX/ohswXCk+3muAne67qqXVQqnO+xgqJhNqBBBay1gIpnx9huO+u
 6DvK6GI85vHtI5SDG1MENwPvSUf1qF6gN6mfk+IQt1S4eCMnOV/P954xBp7BN1AeTXzLY+Xe64M
 M0eyPX7ymz9NA/24A26Bk9HQe16AS0CobXtOERWv184ad6Z2xU/w5HOj284pByX39JFkjguXmQt
 Vlfbx6+59lOTJDyVjoYwO3CwMLYMYB+miKRjsjYM3GCy30cqnoPj6O4RRlSd6awxMsWkVidWeRt
 8Ht8MMl4uAwzatNumGKRhazB4gTbw825ZAJbI6ZoDmA0GmXyMGHOXbFkv26mIFptKuVwjhfPyDw
 ComHKbM71ud0BvsWQtO3FJifxrvMGAEAdWicJBEXYg0BmYUPAycGY/EFJLwjG22ZQZdLWyovZfg
 3im6NcNR41n+VSrBEIQ==
X-Proofpoint-GUID: 8l9U9hkkTg-mRXupFOiQAwMXlTuHALFD
X-Authority-Analysis: v=2.4 cv=FsEIPmrq c=1 sm=1 tr=0 ts=6978e093 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9S75qEfK-iFrpP9ttAoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90829-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.6:email];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C386975D1
X-Rspamd-Action: no action

Unlike the CPU, the CDSP does not throttle its speed automatically when it
reaches high temperatures in Talos.

Set up CDSP cooling by throttling the CDSP when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..4091afd0b6e3 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -3554,6 +3555,15 @@ compute-cb@6 {
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
 
 		pmu@90b6300 {
@@ -4845,12 +4855,26 @@ q6-hvx-thermal {
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
+				q6_hvx_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				q6-hvx-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&q6_hvx_alert0>;
+					cooling-device = <&cdsp_tmd0
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdm-core-thermal {
-- 
2.34.1


