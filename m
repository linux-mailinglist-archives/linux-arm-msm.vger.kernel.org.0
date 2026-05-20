Return-Path: <linux-arm-msm+bounces-108616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHu4G7ERDWoOtAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 03:43:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7E95869CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 03:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C1C93010EE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 01:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE4F21FF30;
	Wed, 20 May 2026 01:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIbLw5ZZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KcfMqCoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2452EBBA4
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779241383; cv=none; b=OCfwKHNRe09PC2GoD7x8kE6rhha3MW2u9V1vkJKJxqRYtndqd99utd0yXIPZOwoaOUyqqgWJER/GHmLDW02STydTmkEMWCUBMF8OgEusU3oCe+U8433UbSvaeTevpIzsenHy+Ncmg/Zfw+NjDMHpWXSzhetiDDBOHoEbu2otli8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779241383; c=relaxed/simple;
	bh=sdnLNo/rLypE3j83Otwc2Cwy5AEiYu/GDdkQwJroKKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AN14aTVarb6XUXFp8B61WUneGKnnxPXMiORi6gMiXGUmhop8HwBYDQawZZTDIkxCMN7EOeSiXyl8RXo5VRjlsCfzQseIrEHoRpnehmwOYQVtQqnViyO4K8ygw2mqUsBhsxCu2NI7j2JSVTBAxILBLJKTXph9NTqAuCK9u2ad5nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIbLw5ZZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KcfMqCoZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JM9t4E1238004
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MVia6/vkfhIKVUoyawmEs1
	XKyNCRLo5iZj2W7TfUL28=; b=BIbLw5ZZ1HeUV394XJxQYh4H0arq+tnPspz1dX
	21WF/O869n/ndhiRqaBSv0sg/VzOtyYtWQqhbixSkyoxcyagc5DvTASB+U7Lbdg/
	p7NON8VZWMk5yEOzn34z7jFU03Z6ApH/8z0NJCyE6RreH+RW52JZAZEy54z/06XE
	q6jxL5S5WY1gAwN7n926FOiw+GbgGtavZWtO8ZN2IuvsLaYKHjgpc/Tiy7YrPqIU
	J/u7deULyACvlE54kyzlewDgIhlyhNJiNlcp/KADBtQNbncDTv1VhcuopstNgKID
	KbScB+8in9aeMKaq6zVeIOoVO1tkUY50VeOaTnmra9myAeiA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3std5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:43:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36642d2f4deso9428507a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 18:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779241379; x=1779846179; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVia6/vkfhIKVUoyawmEs1XKyNCRLo5iZj2W7TfUL28=;
        b=KcfMqCoZ925EtLnhhBujerrPiKs1fljzzsgidFpJQSWWdXRXEGK1DrkysotOZNai8v
         1F4G8KjtoFRpwoX2L/KBjMjh0fDh47XoVDzl/dwRaGOEmeJvIn0MY+6xxumHPnVNiGmg
         /gfUyikl5NlTTTOTciWnmdUFLjXZfmetznQmKFR/p2HT8uiMeyXpa+0rdSSy35poeQQG
         1FRRcTruL9dWub9+qIedCFZceXkZXlRH5+b0oWRJxIPtCf5oJ6SNhaG0UbVK2X+Kpxnw
         tD2FHq/RSnvm9gvuA4Zy6OyrYoRJmdt19B3IgKQ01WlKNBkUutexwlVIBdKPPea0PULW
         ZRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779241379; x=1779846179;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVia6/vkfhIKVUoyawmEs1XKyNCRLo5iZj2W7TfUL28=;
        b=mTkX3WdO7SNjNPRdOELFOWv/IqBy9DJx5yR+g8a1eJAW5R/T1epQ9V+VtLYs4C4/TT
         N4rUdGyzknrqpyoZNItW0mF+2MA/9vb3gpwvsMrR7/NjmpvI1Fh7ySlRHl27Kyv93BtA
         MpMMb1zN880qWC32OwuSR/mvmC7qozYOgUfr1sk0XICiKMVVpZx9Gv1PnaiFV6ZrI2ch
         9Bqr9DuBxmbJobIoP5COTaML017Kg+1q0gs7n0e2tl9IHS57ib0i+JqVPX0A2FVOoyNT
         OtKYOk4c7nTsfwxLOxhYE/OpfsF+V533bTLNAo5NastG6JIgESLO0GT1hSoZs9WJO4/W
         qjVA==
X-Gm-Message-State: AOJu0YyzhC2isJ2qmNjjtfmCXfhgyGRQ/22jhv0ffD9hvszMp2AqXC+J
	SSjICaisZiOpxktxzs6Jt1fqNDplQT8n1Xaxa/d0OEjTwRbpm4RvE4QPzzxkFfL5e8W+Gioj3OP
	WpTPCizeeUqmhbAF2fyDuabAlwmVewQEB+jeemYbf0xTP2cRUviuPBbDlQS4ydHisTJ0l
X-Gm-Gg: Acq92OFU+8zO42wwchrIraMSNMDbmHz8JQrM2YApo9Lpx3V17zN9ZBvm2q/T5Po02B2
	9Kyyo+qDDh/j7XNgV2800eHMjbAzEih8sDd9OZPseJifb2I0w7DBi2ZW3x9WHx+Lelj56R4/EU5
	aW0sWxi5EglIa1LIFr5E5LOBqpmrCy7Urpdvl/pOKQXzn9WElvw97BKHrK3yNW70S2ErY0UJYnZ
	4+CI67jAKkmpni4xt7MBLl4FpzKIfEBOeAw2E7hMGUgT/wUlAcR186HnMurdEVf5RmxrmfdXwbA
	t85I0Cdo2Na70HxCnpSdBCOemG4AtU7ceynEmcCRmSUReJIVUxP9whG9s1b5eUFAWjTK864V3Ye
	FEA7pA0xexNlfkPiw0obw3URJrx8RZUJVSP/72RHJxw4FfROMUfO7ajpfm59argBX6OloP4Ak2q
	W1FpFKBWDc
X-Received: by 2002:a17:90a:d446:b0:35b:8d89:719b with SMTP id 98e67ed59e1d1-369519af686mr18153729a91.1.1779241379258;
        Tue, 19 May 2026 18:42:59 -0700 (PDT)
X-Received: by 2002:a17:90a:d446:b0:35b:8d89:719b with SMTP id 98e67ed59e1d1-369519af686mr18153693a91.1.1779241378598;
        Tue, 19 May 2026 18:42:58 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695155b2c4sm15376651a91.3.2026.05.19.18.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 18:42:58 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 20 May 2026 09:42:45 +0800
Subject: [PATCH v6] arm64: dts: qcom: glymur: add coresight nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-add-coresight-nodes-for-glymur-v6-1-0bfdcdfce3ec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJURDWoC/43NsQ7CIBDG8VcxzF5TCig4+R7GAXtHS2KLgjY2T
 d9d7OSg0eWS/w2/b2KJoqfEdquJRRp88qHPsVmvWN3aviHwmJtVZbUpFVdgEaEOkZJv2hv0ASm
 BCxGa89jdI0hTSmWtISTNMnKJ5PxjGTgcc7c+3UIcl71BvL5/04MADlrYkzB4qrYK9yGl4nq35
 zp0XZEPey0M8l3VP1WZVamckk5Kro35oqp31fxUVVYFWjTGkeBUflDneX4C/x6B038BAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779241375; l=24185;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=sdnLNo/rLypE3j83Otwc2Cwy5AEiYu/GDdkQwJroKKk=;
 b=c75hnJDxqD3ylV3rX/lMniPw+YR9ny9L/gmL6jQoalKHa2aNhlMQfscwhfNz1XAAww5D/T3gj
 9m6uq4keORLA5w5Wwa4ZulHXKtcomj70yJQoe/H/tWcxe6NDLxQbZFk
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: phOtAS9ejl_xM89gYBfTDliU3yK6k3wk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAxMyBTYWx0ZWRfX+4yPsTZc/VGs
 YIEcGjbDKrrUtaXIFks6I99tRTCKjXEalzJkMFu2+1LwEBDPpsmHUYTIhOzrACmoGKJ0DaVGwxV
 xoaAO+q5w4L3Qq+6EM0BQFKIMlsSfwb3YAr/IZXHapJlHxx5XP93okWHG6kU2j5MacrR247VhOI
 OFk84bIRc30oQ962VMQrTZpLtaUGQUC3E+hs2dnWorzWYhwEL2iWRjzo2S49TGluhgEX5yf16Bf
 c6aFN3Jm4yBxfm0i20LBYaKyDofDjdsLbIRfhvmjVhmAOJOFxBUfVBP2+F44mUrRoRujCGMInmz
 TUVO4mBnlOLOaBZWS5z2FgxyYi1CsM7U2OIhBCUG8qRrqykr6Ny8Z+Zlw6EKQ+z9/Jt088J6REQ
 2onCTd6I00hmVeacMDJFXg1i5yqkiQ3VW1NBFNpWAtmbQIBwS0TBDTgUDpDF5Uj8JnULSm7W82m
 L2W+7eA4Ng0xbPkQwAw==
X-Proofpoint-ORIG-GUID: phOtAS9ejl_xM89gYBfTDliU3yK6k3wk
X-Authority-Analysis: v=2.4 cv=SNhykuvH c=1 sm=1 tr=0 ts=6a0d11a4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vAs2e4rRLJ7r_XBowTEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200013
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108616-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC7E95869CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
some small subsystems, such as GCC, IPCC, PMU and so on.

Delete cti_wpss DT node on Mahua since this device will cause NoC issue
on Mahua device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v6:
- fix wrong node name for tn@11200000 device,
  correct name: itnoc@11200000.
- fix wrong clock name for itnoc device from apb_pclk to apb.
Link to v5: https://lore.kernel.org/r/20260519-add-coresight-nodes-for-glymur-v5-1-3dad99fe31e0@oss.qualcomm.com

Changes in v5:
1. change the compatible of the traceNoC device to platform driver
   compatible: qcom,coresight-itnoc
Link to v4: https://lore.kernel.org/r/20260518-add-coresight-nodes-for-glymur-v4-1-45f54f441899@oss.qualcomm.com

Changes in v4:
1. fix the wrong MMIO size for the traceNoC device: tn@11200000
Link to v3: https://lore.kernel.org/r/20260515-add-coresight-nodes-for-glymur-v3-1-83ab39db275d@oss.qualcomm.com

Changes in V3:
1. Delete cti_wpss node in Mahua to prevent crash issue
Link to V2 - https://lore.kernel.org/all/20260318-add-coresight-dt-nodes-for-glymur-v2-1-d76e08f21fa5@oss.qualcomm.com/

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
 arch/arm64/boot/dts/qcom/mahua.dtsi  |    1 +
 2 files changed, 1098 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 0c5cb8532b20..f108b0bb828c 100644
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
@@ -5501,6 +5513,1035 @@ rx-pins {
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
+		cti_wpss: cti@111ab000 {
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
+		itnoc@11200000  {
+			compatible = "qcom,coresight-itnoc";
+			reg = <0x0 0x11200000 0x0 0x3c00>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
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
@@ -7132,4 +8173,60 @@ gpuss-1-critical {
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
diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 990a02c6afc1..22822b6b2e8b 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -21,6 +21,7 @@
 /delete-node/ &cpu_pd15;
 /delete-node/ &cpu_pd16;
 /delete-node/ &cpu_pd17;
+/delete-node/ &cti_wpss;
 /delete-node/ &thermal_aoss_6;
 /delete-node/ &thermal_aoss_7;
 /delete-node/ &thermal_cpu_2_0_0;

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260515-add-coresight-nodes-for-glymur-49045aa9ede8

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


