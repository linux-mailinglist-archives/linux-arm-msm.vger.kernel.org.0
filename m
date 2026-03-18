Return-Path: <linux-arm-msm+bounces-98446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P14EXWQumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:45:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DDD2BB06F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8F4C3036053
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D2439A064;
	Wed, 18 Mar 2026 11:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vw5Sg0aT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H77LqYrq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE23C6A58
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834190; cv=none; b=NUvNMqiFxN0dIU+ZzKMTWw/nvNrbztYuTXpzEgQJ3Eu+PCebO6lySBtfTbpBEAJmobQpVtXj3VI7gsnLHR9Tm2MFV9fSTpb4xQd5XuFrmmEOzXoLbRZUTn+Nq+LqTZMwxzYTJlZW5njaeoV1rNFp7PFDF2ooL9K5G4PyDkVfuGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834190; c=relaxed/simple;
	bh=3YUuYj4dAOIgyOLWEot3X/aOs9IKs5bXUXw4YzIVB60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L3Rt1ljT9dWjqIKmQS6YUmiLVx0990B2xkG9Vpb0b1taBv2O3rO0VrVUNb5VIfbYSjCpKj0QNjtNQBMxmbY09A4YniucP00OiUos/bkNwRWpAfy6ydxHoeATBmwIXYj8q8GRE7yCYzCHg/P81MZyX1Bb8eA4mi/jg5TZTbXa+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vw5Sg0aT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H77LqYrq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I6ZHpB2878115
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tKCGJdr4fSiNuw2lDbs0Nl
	j4AASwdfxQ0WvbVF81+wk=; b=Vw5Sg0aTJm4CtIoOt90gnqzje60tVBDsSfP8I/
	Z4drbmGKdwQ4yyIWz7TUSLLjkCIWTNKPah3Qmpbk+Xt+NXzoebsTFVmHASNywlZt
	J+EqxBMg/PMgEqUorDPqzRATQbRTcVj4QPAfYMK1TIX0OOiIM1TvjFmihIcAirAY
	9cuXAqB3O7rU+oKfRmlfJa9qnYp5TotkNgtv2NG7BbDBRWvIuabPJv1dfgghjg1W
	GzisZAPgevWhW+t43x3BYEcSETSPo47BArOK2jpCOEWdkVCNfkaRqvF2tzi6zb5i
	d985NZnLMKOiFKVk1Kp2Nt9GEZfyy/wTzws/0YOgzqvHBsNw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr1a48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:43:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829b7ed8964so6952839b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773834187; x=1774438987; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tKCGJdr4fSiNuw2lDbs0Nlj4AASwdfxQ0WvbVF81+wk=;
        b=H77LqYrqUlcNIJwPzERuhN7Q0Jfvv8QJHzCKKjYHoQLt/ZDwVw0pe1HzS3eVa2kBgr
         grICNU1I8G7IsoG4Kiynzy8Cg+CMOKNFZobz1dyohVTPuL8LtRnNe2RxLTB+TKxVXpdd
         HdgoZkygME/BI3VV+3U0+NDKy/C837LckuWWieMC+KpwEcuwNhU7nqQ2YqDTb0l30YsH
         OIyru/QsqaCK+KmDKxiyv33bA5oNu8MDA6WWDD0aQoQU0K2E05dMA6iDy0e9orD/c+eN
         Ngt22IdXeFK+IHavQopOYOMPNj0JrlzJ+Fi3zA3rhJIFDd7Yfwd2abNu6ac6KaTnGQsc
         GojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773834187; x=1774438987;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKCGJdr4fSiNuw2lDbs0Nlj4AASwdfxQ0WvbVF81+wk=;
        b=KfQVm52YyG+8VmP3PVSNS2OGxBafdD/DDK4kzatNkU9sADl0QeSUb9lK3jj54XuzYK
         +CEgtAgVXUtZHuj69SxtcS//QKh7UMrl/Z13jbsUH+j/kNx2hPG5rXPJpwe+hE+rSo+6
         6ndKMuYve7DLpcdjQELoDz/Q2RzqiOU8CnyYkQgcVi8naYV/I45TYoO2mzfo4qUmJfH7
         cT36Aiklicyq3EXaI8ExI+pU5w/VXcswcUwKkdQjSTbTkLa2fUS5tPno/GK2+zoe5R/f
         Jy/LX3GQUhcZCYlrfFb+obhZx2DEr76scPGONO58S1AnHhLE6/gmvFktQsV6xptjbQzl
         UK0w==
X-Gm-Message-State: AOJu0Yzx5EtNjfvi5oBRhTb6eCME3szYro5HAci5MLW0N7lG8GNdVEqd
	PXuTMHLuTLdEzjd1JKF9J1wf7WuAgP8OOLCnjcHsTy1+Ht9tNMbksdalo9qPOXAT6ufNjZgc3z6
	r4z99Uarxo7xTpexQxQ1bp9asoBnATH8C8aDUWukMjB93JSLtbP8Jj9hV4R/4RWM1esW3
X-Gm-Gg: ATEYQzxxkDfroog7c36ECNuLeVUAGrlQ6+M2A/BfnHsax/fDJGUGTIXxXwPi3oK2D46
	pHOZ9DnGgdqJZSx4bVG9HIz1NVxSJPFNoXHfzCm3gysahdVjQ2lQgmZcoRKJi1Eqo5NFsdvRBDO
	zp+ZUmFLWZw4P683cMbJ6cOSUK16KIov+OP013daL2rCcOcpqLyoQ0Sc1q5YgdipJuSa7/QQL0T
	JvB+65Epi8Zc4HY1JosHrpIsnEesBDMWG82M4Iiz2XXVQGotVFOzqGLBsV6u9DCxhMxPso4utUs
	kLd82xOjK6IWBMlIeAwqpThFwSxcjkbY5aNCZtcLy09xR5WUCdkBUAyKq9ZF7f17Gr6dhw3L3lY
	M5UU+dxnD1JR6fFs8CaMSINnk2oEs5zMROSCrq6tc/0izpwnCpdl57UWd8mzOpH8nYtVt7ux/ql
	ie+Eq7auQx
X-Received: by 2002:a05:6a00:1ad2:b0:829:7057:b99e with SMTP id d2e1a72fcca58-82a6aed6121mr2546293b3a.54.1773834187083;
        Wed, 18 Mar 2026 04:43:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ad2:b0:829:7057:b99e with SMTP id d2e1a72fcca58-82a6aed6121mr2546264b3a.54.1773834186449;
        Wed, 18 Mar 2026 04:43:06 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbe801csm2460748b3a.46.2026.03.18.04.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:43:06 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 19:42:47 +0800
Subject: [PATCH v2] arm64: dts: qcom: glymur: add coresight nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALePumkC/x3NQQ6CQAxA0auQrm0CAxjxKoYF0HZoojOmRaMh3
 N2Jy7f5fwdnU3a4VjsYv9U1p4JwqmBZpxQZlYoh1OFct02PExEu2dg1rhvShikTO0o2jPfv42U
 oMrT9LJeOmwFK52ks+vk/buNx/ABd1XQEcwAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773834183; l=22705;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=3YUuYj4dAOIgyOLWEot3X/aOs9IKs5bXUXw4YzIVB60=;
 b=ceIYAz8XOTeWLUwBMhnbOK76rKey5HMUSqttQG/p26v1N5jneb7Za1//zj4i1yZFaXWBxWdEa
 YUO5kyP6i/aB3X0/Wi3asN8giMDeSaRFJ9/ufpPntPXXPWy7eYhd0k8
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69ba8fcc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OajLUiVZWS0RYYoQYL8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 3a3Z-7MQqTla9jkeE2VhZAa6UQUb6xT8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5OSBTYWx0ZWRfX3V5zHugfseLx
 Tsj/7k1T43vnkPeQ+MS5wFHi5gCOTLjWDw3I6SUNjYL6HgyD+xGMTPmElLEd7svffsURgw18d7c
 QQPqZxiiLFGPGJpDSgd5fV7vp4dbPjaf5gk2CUN5/5IQoiT9PHm/Jm/O+QbEhwBSFCmlGoHxFwL
 thi+SKgJjAqs+DaNi0YMtNrZrckwSuE6JMY+6X/VYZ4zdbKQuQietby5HwoYys8+VVgv3QWc4kk
 O56+FciadPwztj4c5Jd3MawusGNwbMh5+eT2d93oarX6lvowjmarsBoXEoNt085jyUZnHEFJtFD
 LM4EXMvL4G8628TuHqqrv/jPJtvAcRDUPdCSJzy7Ud9xBgHrRIbDMMr+ibSElbxo28ewk2XvyCm
 YKleKpxerqYEcfdE47M22MV4NoueUWLScHAdS+f3Uzrp9b51mHcbm+9SfkE7dAD8hnbgQuWgDmq
 qJsP1qmstolkGgc8UyQ==
X-Proofpoint-GUID: 3a3Z-7MQqTla9jkeE2VhZAa6UQUb6xT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180099
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98446-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3DDD2BB06F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
some small subsystems, such as GCC, IPCC, PMU and so on.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in V2:
1. removed two cti devices due to GFX block is down
   - cti@11c42000
   - cti@11c4b000
2. changes two TPDM devices to static:
   - tpdm-cdsp-cmsr
   - tpdm-cdsp-cmsr2
Link to v1 - https://lore.kernel.org/all/20251230-add-coresight-nodes-for-glymur-v1-1-103b6d24f1ca@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 1097 ++++++++++++++++++++++++++++++++++
 1 file changed, 1097 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269cec7942c..4d58d056c70d 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -341,6 +341,18 @@ domain_ss3: domain-sleep-0 {
 		};
 	};
 
+	dummy-sink {
+		compatible = "arm,coresight-dummy-sink";
+
+		in-ports {
+			port {
+				eud_in: endpoint {
+					remote-endpoint = <&swao_rep_out1>;
+				};
+			};
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-glymur", "qcom,scm";
@@ -4279,6 +4291,1035 @@ rx-pins {
 			};
 		};
 
+		stm: stm@10002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x10002000 0x0 0x1000>,
+			      <0x0 0x16280000 0x0 0x180000>;
+			reg-names = "stm-base",
+				    "stm-stimulus-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out: endpoint {
+						remote-endpoint = <&funnel0_in7>;
+					};
+				};
+			};
+		};
+
+		tpda@10004000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x10004000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					qdss_tpda_in1: endpoint {
+						remote-endpoint = <&spdm_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_tpda_out: endpoint {
+						remote-endpoint = <&funnel0_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1000f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1000f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					spdm_tpdm_out: endpoint {
+						remote-endpoint = <&qdss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		funnel@10041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10041000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					funnel0_in0: endpoint {
+						remote-endpoint = <&tn_ag_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					funnel0_in6: endpoint {
+						remote-endpoint = <&qdss_tpda_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+
+					funnel0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel0_out: endpoint {
+						remote-endpoint = <&aoss_funnel_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1102c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1102c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					gcc_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in36>;
+					};
+				};
+			};
+		};
+
+		tpdm@11180000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11180000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					cdsp_tpdm_out: endpoint {
+						remote-endpoint = <&cdsp_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11185000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11185000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					cdsp_dpm1_tpdm_out: endpoint {
+						remote-endpoint = <&cdsp_tpda_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@11186000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11186000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					cdsp_dpm2_tpdm_out: endpoint {
+						remote-endpoint = <&cdsp_tpda_in6>;
+					};
+				};
+			};
+		};
+
+		tpda@11188000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11188000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					cdsp_tpda_in0: endpoint {
+						remote-endpoint = <&cdsp_tpdm_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					cdsp_tpda_in1: endpoint {
+						remote-endpoint = <&cdsp_llm_tpdm_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					cdsp_tpda_in2: endpoint {
+						remote-endpoint = <&cdsp_llm2_tpdm_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					cdsp_tpda_in3: endpoint {
+						remote-endpoint = <&cdsp_cmsr_tpdm_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					cdsp_tpda_in4: endpoint {
+						remote-endpoint = <&cdsp_cmsr2_tpdm_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					cdsp_tpda_in5: endpoint {
+						remote-endpoint = <&cdsp_dpm1_tpdm_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					cdsp_tpda_in6: endpoint {
+						remote-endpoint = <&cdsp_dpm2_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					cdsp_tpda_out: endpoint {
+						remote-endpoint = <&cdsp_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		funnel@11189000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11189000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					cdsp_funnel_in0: endpoint {
+						remote-endpoint = <&cdsp_tpda_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					cdsp_funnel_out: endpoint {
+						remote-endpoint = <&tn_ag_in53>;
+					};
+				};
+			};
+		};
+
+		cti@11193000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x11193000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		cti@111ab000 {
+			compatible = "arm,coresight-cti", "arm,primecell";
+			reg = <0x0 0x111ab000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+		};
+
+		tpdm@111d0000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x111d0000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					qm_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in35>;
+					};
+				};
+			};
+		};
+
+		tn@11200000  {
+			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			reg = <0x0 0x11200000 0x0 0x4200>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@6 {
+					reg = <6>;
+
+					tn_ag_in6: endpoint {
+						remote-endpoint = <&mm_dsb_tpdm_out>;
+					};
+				};
+
+				port@10 {
+					reg = <0x10>;
+
+					tn_ag_in16: endpoint {
+						remote-endpoint = <&east_dsb_tpdm_out>;
+					};
+				};
+
+				port@21 {
+					reg = <0x21>;
+
+					tn_ag_in33: endpoint {
+						remote-endpoint = <&west_dsb_tpdm_out>;
+					};
+				};
+
+				port@23 {
+					reg = <0x23>;
+
+					tn_ag_in35: endpoint {
+						remote-endpoint = <&qm_tpdm_out>;
+					};
+				};
+
+				port@24 {
+					reg = <0x24>;
+
+					tn_ag_in36: endpoint {
+						remote-endpoint = <&gcc_tpdm_out>;
+					};
+				};
+
+				port@32 {
+					reg = <0x32>;
+
+					tn_ag_in50: endpoint {
+						remote-endpoint = <&pcie_rscc_tpda_out>;
+					};
+				};
+
+				port@35 {
+					reg = <0x35>;
+
+					tn_ag_in53: endpoint {
+						remote-endpoint = <&cdsp_funnel_out>;
+					};
+				};
+
+				port@3f {
+					reg = <0x3f>;
+
+					tn_ag_in63: endpoint {
+						remote-endpoint = <&center_dsb_tpdm_out>;
+					};
+				};
+
+				port@40 {
+					reg = <0x40>;
+
+					tn_ag_in64: endpoint {
+						remote-endpoint = <&ipcc_cmb_tpdm_out>;
+					};
+				};
+
+				port@41 {
+					reg = <0x41>;
+
+					tn_ag_in65: endpoint {
+						remote-endpoint = <&qrng_tpdm_out>;
+					};
+				};
+
+				port@42 {
+					reg = <0x42>;
+
+					tn_ag_in66: endpoint {
+						remote-endpoint = <&pmu_tpdm_out>;
+					};
+				};
+
+				port@43 {
+					reg = <0x43>;
+
+					tn_ag_in67: endpoint {
+						remote-endpoint = <&rdpm_west_cmb0_tpdm_out>;
+					};
+				};
+
+				port@44 {
+					reg = <0x44>;
+
+					tn_ag_in68: endpoint {
+						remote-endpoint = <&rdpm_west_cmb1_tpdm_out>;
+					};
+				};
+
+				port@45 {
+					reg = <0x45>;
+
+					tn_ag_in69: endpoint {
+						remote-endpoint = <&rdpm_west_cmb2_tpdm_out>;
+					};
+				};
+
+				port@4b {
+					reg = <0x4b>;
+
+					tn_ag_in75: endpoint {
+						remote-endpoint = <&south_dsb2_tpdm_out>;
+					};
+				};
+
+				port@52 {
+					reg = <0x52>;
+
+					tn_ag_in82: endpoint {
+						remote-endpoint = <&south_dsb_tpdm_out>;
+					};
+				};
+
+				port@53 {
+					reg = <0x53>;
+
+					tn_ag_in83: endpoint {
+						remote-endpoint = <&center_dsb1_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					tn_ag_out: endpoint {
+						remote-endpoint = <&funnel0_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11207000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11207000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					mm_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in6>;
+					};
+				};
+			};
+		};
+
+		tpdm@1120b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1120b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					east_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in16>;
+					};
+				};
+			};
+		};
+
+		tpdm@11213000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11213000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					west_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in33>;
+					};
+				};
+			};
+		};
+
+		tpdm@11219000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11219000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					center_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in63>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					ipcc_cmb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in64>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					qrng_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in65>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					pmu_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in66>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					rdpm_west_cmb0_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in67>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121e000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					rdpm_west_cmb1_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in68>;
+					};
+				};
+			};
+		};
+
+		tpdm@1121f000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x1121f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					rdpm_west_cmb2_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in69>;
+					};
+				};
+			};
+		};
+
+		tpdm@11220000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11220000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					center_dsb1_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in83>;
+					};
+				};
+			};
+		};
+
+		tpdm@11224000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11224000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					south_dsb2_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in75>;
+					};
+				};
+			};
+		};
+
+		tpdm@11228000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11228000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					south_dsb_tpdm_out: endpoint {
+						remote-endpoint = <&tn_ag_in82>;
+					};
+				};
+			};
+		};
+
+		tpdm@11470000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11470000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <32>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					pcie_rscc_tpdm_out: endpoint {
+						remote-endpoint = <&pcie_rscc_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpda@11471000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11471000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					pcie_rscc_tpda_in0: endpoint {
+						remote-endpoint = <&pcie_rscc_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					pcie_rscc_tpda_out: endpoint {
+						remote-endpoint = <&tn_ag_in50>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c03000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c03000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio4_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in4>;
+					};
+				};
+			};
+		};
+
+		funnel@11c04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x11c04000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@5 {
+					reg = <5>;
+
+					aoss_funnel_in5: endpoint {
+						remote-endpoint = <&aoss_tpda_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+
+					aoss_funnel_in6: endpoint {
+						remote-endpoint = <&funnel0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_funnel_out: endpoint {
+						remote-endpoint = <&etf0_in>;
+					};
+				};
+			};
+		};
+
+		tmc_etf: tmc@11c05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x11c05000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					etf0_in: endpoint {
+						remote-endpoint = <&aoss_funnel_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etf0_out: endpoint {
+						remote-endpoint = <&swao_rep_in>;
+					};
+				};
+			};
+		};
+
+		replicator@11c06000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x11c06000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					swao_rep_in: endpoint {
+						remote-endpoint = <&etf0_out>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					swao_rep_out1: endpoint {
+						remote-endpoint = <&eud_in>;
+					};
+				};
+			};
+		};
+
+		tpda@11c08000 {
+			compatible = "qcom,coresight-tpda", "arm,primecell";
+			reg = <0x0 0x11c08000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					aoss_tpda_in0: endpoint {
+						remote-endpoint = <&swao_prio0_tpdm_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					aoss_tpda_in1: endpoint {
+						remote-endpoint = <&swao_prio1_tpdm_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					aoss_tpda_in2: endpoint {
+						remote-endpoint = <&swao_prio2_tpdm_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+
+					aoss_tpda_in3: endpoint {
+						remote-endpoint = <&swao_prio3_tpdm_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+
+					aoss_tpda_in4: endpoint {
+						remote-endpoint = <&swao_prio4_tpdm_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+
+					aoss_tpda_in5: endpoint {
+						remote-endpoint = <&swao_tpdm_out>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					aoss_tpda_out: endpoint {
+						remote-endpoint = <&aoss_funnel_in5>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c09000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c09000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio0_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in0>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c0a000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c0a000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio1_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in1>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c0b000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c0b000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio2_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in2>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c0c000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c0c000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,cmb-element-bits = <64>;
+			qcom,cmb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_prio3_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in3>;
+					};
+				};
+			};
+		};
+
+		tpdm@11c0d000 {
+			compatible = "qcom,coresight-tpdm", "arm,primecell";
+			reg = <0x0 0x11c0d000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			qcom,dsb-element-bits = <32>;
+			qcom,dsb-msrs-num = <32>;
+
+			out-ports {
+				port {
+					swao_tpdm_out: endpoint {
+						remote-endpoint = <&aoss_tpda_in5>;
+					};
+				};
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,glymur-smmu-500",
 				     "qcom,smmu-500",
@@ -5910,4 +6951,60 @@ gpuss-1-critical {
 			};
 		};
 	};
+
+	tpdm-cdsp-llm {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				cdsp_llm_tpdm_out: endpoint {
+					remote-endpoint = <&cdsp_tpda_in1>;
+				};
+			};
+		};
+	};
+
+	tpdm-cdsp-llm2 {
+		compatible = "qcom,coresight-static-tpdm";
+		qcom,cmb-element-bits = <32>;
+
+		out-ports {
+			port {
+				cdsp_llm2_tpdm_out: endpoint {
+					remote-endpoint = <&cdsp_tpda_in2>;
+				};
+			};
+		};
+	};
+
+	tpdm-cdsp-cmsr {
+		compatible = "qcom,coresight-static-tpdm";
+
+		qcom,cmb-element-bits = <32>;
+		qcom,dsb-element-bits = <32>;
+
+		out-ports {
+			port {
+				cdsp_cmsr_tpdm_out: endpoint {
+					remote-endpoint = <&cdsp_tpda_in3>;
+				};
+			};
+		};
+	};
+
+	tpdm-cdsp-cmsr2 {
+		compatible = "qcom,coresight-static-tpdm";
+
+		qcom,cmb-element-bits = <32>;
+		qcom,dsb-element-bits = <32>;
+
+		out-ports {
+			port {
+				cdsp_cmsr2_tpdm_out: endpoint {
+					remote-endpoint = <&cdsp_tpda_in4>;
+				};
+			};
+		};
+	};
 };

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260315-add-coresight-dt-nodes-for-glymur-ff935bf84e19

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


