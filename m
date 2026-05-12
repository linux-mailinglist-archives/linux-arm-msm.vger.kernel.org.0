Return-Path: <linux-arm-msm+bounces-107168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAhLAxN+A2q86QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:22:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 738C5528957
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 21:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FB15304860B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC62384CCA;
	Tue, 12 May 2026 19:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9qxqQ5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYPcWUhO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4735A3815F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613761; cv=none; b=sj5VKP8eoA58fQH3VDtZro++LRzSIOQFPuiYDKT5wJjZDOlQCU8O1Y3SDjQT3eZBB/6wqnikE2/2+KhFdVR7+9iOhhgw60O2OA+oJdhlqKy/KuLvijwpliV6Z5em6Zoczhs7aO4zpTngiRExRfH3o1VGs7+bkHFvu2+V5XUswEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613761; c=relaxed/simple;
	bh=2/wYzISHp6nF2rbU3isTdIQN5SfLqPLFS9JhWJyo+sQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lvFCigVw6mminTAdT/+q3EmocP9sHfr3ckCq7L3hQatiJfAfhBf2498jqx/wFfCUVc+hZBFvbFJOhamTWz8gQcKBdiJUry3lB0OIC9EmjIlGzi0NXMqYIe2zj9LgF1vmfgtKyMrwj8jWwwGbGUCC1IX9FPYGFFqUJgoO9ZjTnBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9qxqQ5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYPcWUhO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CC4POd3320941
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DoITA8fvLNtJOW1hfjo3Z8UjqO3tTvhZNsT60HL4KYU=; b=Y9qxqQ5ObT1QEvrX
	1ADyfkvit8bEghKMnqklrPREP+JwFcpIN5YchPuhAMfQKVzniI/UPCBD5hsmddjw
	OtbBY7u1SLhjtLMtVimRv68fvfkbtliW2/qbXumT8MUEDcZXJX7m30dbdjC9V0jc
	M6OtnaLDr9lodG6qQMOLfSo4UXiTAHRS3F/A/squjmVEevcc7R/6T7U1JmRM1Q5y
	/3M0PyrcROos2yQlaNQBV8FgsCGMiku72DVgl1KwyBVZa11xCBrtGUP4HjzWqA+M
	wQP8+/3Y0TnG/xVGDBLUpPB59yfUIImqUMn7e+bSNpZq4AA6uxec2+N7BLU3XbYu
	GKUG9Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43w1sp1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 19:22:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba86e35aa1so91574395ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778613759; x=1779218559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoITA8fvLNtJOW1hfjo3Z8UjqO3tTvhZNsT60HL4KYU=;
        b=ZYPcWUhO5F8jwy7oPC0EoMaKBfzs5Em2tGfcXqceQDMO4XeQet/z/4oY0LuhBgV62J
         5YRIJTIHH+KERRHruwA10QyAhE2jUCxcK8prcdEbgKBYH0Act0eAKmDHMQPg21vQSsRx
         AzZZQVCgAh65GyoyUDhOFpyVgBRr37oPL/pNGoglYlKRT7xhACKUB6o5AUyHfYfmCuwC
         ubO+MfsVyEv9N/wcmQUkQQKMoghVkwb0G4nMetBZpDERqtc6bNTh2MBk0fGl4eMNXgLg
         PErgpQLjIYxhTqJvXpxTGTR1KC8vd2tGs6Oott6GXumSI5OhsQvSoka+b1dkKIKJ+i+N
         fenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778613759; x=1779218559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DoITA8fvLNtJOW1hfjo3Z8UjqO3tTvhZNsT60HL4KYU=;
        b=UHrACb+AtmCRVl6aleLo/2YYlJTIovCWrKuAunEigGYvdlyOl/7mjSJn+iQjvnZQLh
         YXl9VQ8XDVnJ3JRH5RxMHAyVaAYVh9EGFqfNl2LQKAYluvaJJsrcKzsCoky6yH/HTVef
         P3MML9AfUavQaGrRDosVxhzjpwBrnCmRANCzZ5N6J2z2q9NSljdpmlDxwNu4a99U2o/p
         PoK86QkpV3dn02XG+vL/rQZ23jtXeny3/UAzsmCxoWJ7Ns1bqKADkHxfWckQJLGhTMCg
         7zfNcqz3lrdYs07JhTWWp0oXhoHFfdYdSLponEd+th49HVf0chPmz3HraduDt3IUaDRR
         Oc0g==
X-Gm-Message-State: AOJu0Yzxryah22o5Xn/c+eJ7fbpnKcqihM7k3EhcfccSVYP7qmlhLAHf
	3DH5poPjUeQ1rf4c9cTxuSBSABdGZVEC1suqlfI8vjxmtV8eYc50qbjl34wQqCpWsA6sdvo2b6W
	5g2sR4vTKY7BE7RQLoYH8PTpWMRwdhS2xY9v2Ro5mcCP+fd9hLXzw2C+op5fJImm0QawF
X-Gm-Gg: Acq92OFYOcHxB6LV1mXsnB/bkTKxZC6VtabEDF8WIfoUbMNs0jUKN/E59cyV5/v/Kec
	Qr1JPP6u2pA8gDNOiEEReiLvBksBF7LphDeE/fYvzaM79GeDbOFpEvmxkMvqSsZOq3dPBqFUK/8
	Ss7yH6bC8wo5sOB/xXmUdtNsLPhI7Qvu6S8Hfvqn9tW/OA+3jDMVxC+AMvnWukG1FsPzz7f1fMG
	phy11ib44D/VOk5Z35YiQrJJlWINEoybCV/9v8WoBJDgAVW/84wLxpdz75Sif4Q7OlElG1yXavW
	dsVL8V1O58jkkw0VQ0caEIYrP0a1ejBuNJ0PTaZkXNuqdNs3zLT3TXL0rB/JLpKJmGmQMFHu9+O
	Ji/Zgy0x3hap7tkoyV+UJqzsW6A0kzfyjf843mSUIGtQ3cA==
X-Received: by 2002:a17:902:7204:b0:2bc:f2ae:e122 with SMTP id d9443c01a7336-2bd271436f6mr2874975ad.2.1778613758689;
        Tue, 12 May 2026 12:22:38 -0700 (PDT)
X-Received: by 2002:a17:902:7204:b0:2bc:f2ae:e122 with SMTP id d9443c01a7336-2bd271436f6mr2874745ad.2.1778613758019;
        Tue, 12 May 2026 12:22:38 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm141250585ad.72.2026.05.12.12.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:22:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 00:51:23 +0530
Subject: [PATCH v4 6/6] arm64: dts: qcom: glymur: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260513-glymur-gpu-dt-v4-6-f83832c3bc9a@oss.qualcomm.com>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
In-Reply-To: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778613699; l=9184;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xn0Sr46RzO9QMjWQmKHE7i+3Gf4gRPK3q5UWU+NK1fk=;
 b=Rcg6Sd7G8lX5oJFspeQSrddQLpE3V44pqgLvpli7sW9PfZg0qfLjTk+ORChULDQ/owekcZKq4
 lSv0DV3gYY4D9GVFYDYm7H1JumayCKwQ7uaOL3PWiZb6fdyaTDucYnQ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: a4YttlD8y_0FxdBLfCfVPKPx1CFr8H3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIwMCBTYWx0ZWRfX8KhVmkxFS4+s
 UZMcr8v+0wexbwb/Zg3BzNIgDCHCKmhwV2O3+2RYLHGYfaDXGY7K98/T709cs5yTvVuFUNYzSWE
 f1YnE2o9U2WcJgoU6tJFFD1vDdxSdMbgshA5J0e32dHKQZjpCs+eAsiDr6+eZKTxNC4meDPKcJ2
 6Abjs76JTUFmh/I5pvI+yGpz302yWiGoew9+4pPaW/v7GAXACcF0G/P8YHdsY4QHehqiic3g/bJ
 94i6Qg42eE0hNYhX83tFSOftJYqtzeI1ALOj5u6z36Vkml+NxCMXiTFFKp1vbmbm0XbTuiw4aen
 xjqvINYNp0SXrY+Cofqxr7/vOeHhBU4yXty3RFkiorCjztyjV8ikK+grfwG0WOBVRdXB5clXH+6
 00BcADTNIR2XWoDxkx6/taCR2B+i0QJYRb+p/xv5+GZ+jpGX/k1wGSgmEAiyvel/zpa6EZ+beL/
 85XLIPB+3AE/oJfKrUA==
X-Proofpoint-ORIG-GUID: a4YttlD8y_0FxdBLfCfVPKPx1CFr8H3t
X-Authority-Analysis: v=2.4 cv=BoGtB4X5 c=1 sm=1 tr=0 ts=6a037dff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1xJfQSZ986TJDthxghQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120200
X-Rspamd-Queue-Id: 738C5528957
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107168-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

The GPU does not throttle its speed automatically when it
reaches high temperatures. Set up GPU cooling by throttling
the GPU speed when it reaches 95°C.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 240 +++++++++++++++++++++++++++--------
 1 file changed, 184 insertions(+), 56 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 01a2e32e503b..e109fb5b35a4 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "glymur-ipcc.h"
 
@@ -7149,13 +7150,22 @@ aoss-7-critical {
 		};
 
 		thermal_gpu_0_0: gpu-0-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 1>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu00_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu00_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-0-0-critical {
@@ -7164,16 +7174,26 @@ gpu-0-0-critical {
 					type = "critical";
 				};
 			};
+
 		};
 
 		thermal_gpu_0_1: gpu-0-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 2>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu01_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu01_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-0-1-critical {
@@ -7185,13 +7205,22 @@ gpu-0-1-critical {
 		};
 
 		thermal_gpu_0_2: gpu-0-2-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 3>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu02_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu02_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-0-2-critical {
@@ -7203,13 +7232,22 @@ gpu-0-2-critical {
 		};
 
 		thermal_gpu_1_0: gpu-1-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 4>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu10_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu10_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-1-0-critical {
@@ -7221,13 +7259,22 @@ gpu-1-0-critical {
 		};
 
 		thermal_gpu_1_1: gpu-1-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 5>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu11_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu11_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-1-1-critical {
@@ -7239,13 +7286,22 @@ gpu-1-1-critical {
 		};
 
 		thermal_gpu_1_2: gpu-1-2-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 6>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu12_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu12_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-1-2-critical {
@@ -7257,13 +7313,22 @@ gpu-1-2-critical {
 		};
 
 		thermal_gpu_2_0: gpu-2-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 7>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu20_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu20_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-2-0-critical {
@@ -7275,13 +7340,22 @@ gpu-2-0-critical {
 		};
 
 		thermal_gpu_2_1: gpu-2-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 8>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu21_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu21_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-2-1-critical {
@@ -7293,13 +7367,22 @@ gpu-2-1-critical {
 		};
 
 		thermal_gpu_2_2: gpu-2-2-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 9>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu22_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu22_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-2-2-critical {
@@ -7311,13 +7394,22 @@ gpu-2-2-critical {
 		};
 
 		thermal_gpu_3_0: gpu-3-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 10>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu30_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu30_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-3-0-critical {
@@ -7329,13 +7421,22 @@ gpu-3-0-critical {
 		};
 
 		thermal_gpu_3_1: gpu-3-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 11>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu31_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu31_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-3-1-critical {
@@ -7347,13 +7448,22 @@ gpu-3-1-critical {
 		};
 
 		thermal_gpu_3_2: gpu-3-2-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 12>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu32_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu32_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-3-2-critical {
@@ -7365,13 +7475,22 @@ gpu-3-2-critical {
 		};
 
 		thermal_gpuss_0: gpuss-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 13>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpuss0_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpuss-0-critical {
@@ -7383,13 +7502,22 @@ gpuss-0-critical {
 		};
 
 		thermal_gpuss_1: gpuss-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 14>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpuss1_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpuss-1-critical {

-- 
2.51.0


