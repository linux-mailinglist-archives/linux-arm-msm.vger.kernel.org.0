Return-Path: <linux-arm-msm+bounces-91640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPhUJ4rBgWlnJgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:36:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF923D6D8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C620630BD49A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1A4225788;
	Tue,  3 Feb 2026 09:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkXVjU7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etZGM3mS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AA1260569
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111204; cv=none; b=B09qySZZJvImwy4793d4QGEyHRWZU8byrIg5mw9OOwbwTshRobUMSnVwgc1k4CqvGvclIm4ZfbdlMLv/vphOnKVpH1Bm7WGKaOkyZ7WLCrMqIvyyc7x0Jap21DGxUYDuRZrfUMuId6Dg1nfkKZOH78AcuN66FTBZrsFsl5a9zro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111204; c=relaxed/simple;
	bh=MmRh2JiBpDaFVC7myctfzKWNEp/EVU+H7DSEDhr01cc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lmg3tdCGNwF/3Sh7lm3hhqnC7qISX2J1icYxMsB3FyYU0PqFxJ6VUdVKtifqdAOechFE6tc4MFh/UYft8QyMe69uYIACjtaOEyZFb+Cu4A2s2rvM/Z4lPcxtx5vcETe7kxg4mNIpbl7fAZfxCJvU6FYJp3toqknIjqhK4M4W4Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkXVjU7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etZGM3mS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61379JHN255939
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qltUqOfSxitFH26aqGz70TycTTJ/d1VqzyG6H1vAznQ=; b=JkXVjU7YdSchS3bF
	uy7H1Ika6jUZWx68R9TC3hvSWBxT8cIT1iAS7ZCvS2Fydo125ca+s91VKrGpqyDD
	/1D5peGbIKpHD1Sm66/cGYUV6zubab1FL/SbPKY3C5thqIlU4BdNh5sSv0ihu8rZ
	xLQOcc0y9xDHdHrJw3BZVpMTdanlAqlGfQJ3+rnKywTpY6tbDS8u/zNGiTFRbJvK
	7KMnitTrGTgJqyBOZCWZX29hBUJ8uf/FapBm+4w3rd57bYil3mHDSxvXyYYnvoUR
	IgLka9pRLdSEmCgzIsCLuWaLIwqGyQkkAGHa/ax+Fnn0VSv6LZlW4g0gnJ5AIyke
	SXQOmw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0kkhfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:33:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a76f2d7744so53447555ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111202; x=1770716002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qltUqOfSxitFH26aqGz70TycTTJ/d1VqzyG6H1vAznQ=;
        b=etZGM3mSIFeEEbV9L3J+MXs+/8HCbF6AzgirepOgwUCntRjyLCfqfC+/1R6NwHzOCE
         IP4oL1OfSJVYTh0RoAGXyjiL87j0ENb6f8TU1bV2UzM1dIpK0SnagjdSsjr4ZPJAjyQ0
         kzFuea+LQaKrPJYCnx7Ji7I1a7mebf9UlhoUHBPbMl5lWl0yJaHuSr7ugt0v5VwmDdWw
         n9GN9GK1SyKNTLOf2xP8OmhyGrEUZHaYNgZ/To+elPGMUKQ1qk8PAupaTu/EvHP3ZPSJ
         cjGixiGl/71dR7jYib/IVWfbeAb6p4NJg53Rjs9kJdtLbfq282BoJgz7ORPGl0qQ8n37
         2iwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111202; x=1770716002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qltUqOfSxitFH26aqGz70TycTTJ/d1VqzyG6H1vAznQ=;
        b=DHgdPG+bCakKdpUzgDwxX1gSHqSYQhgF1qG1cQUgJ0b7IKqzOIAjOzPNQcYcDbl6Yp
         8Rw7CxdY1qvji1J1mVWAnFin+GAH6JM0/GTeyqcFksfguTsi6uCralCqXyT0Xn30n1hw
         yThBMQPwdwbK29vKpmF7puADXVZQ+WviIsAAaz7rcHo+y+Lm09r5zRCCERjtv5Gi6UnD
         53MjKbmap9U5lWs4aoQW6Rq0YfZL6fJgJpeubiAUjSj4GhEetmGfgKy8gQch6f8XkL70
         rpBCArHeYRGOBtzNLzdeHVgUYIewUJkvWaK1tRDI8svRPjJhrV7gAep97S1j+qB7WMMq
         swwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK5bDEF+0h28oPUcsO/O7VnXNgiTvDLezC+4GmbLm1CqtS0TnsjUTlVLIPzjFoSqAivEOlKaGiC6UyFrEy@vger.kernel.org
X-Gm-Message-State: AOJu0YxqRtb2v3AvQJHw6ShvwRC4RgeyxHbBkuevXVC67+/GWyiqbj6L
	bVd6w9h3q6Gc55FK/YIKUeAuTVmQpuzD+8MML585uPeh8QEpWRt/V5hpE3SpRec939iZfPZYQSv
	rzlInU+p8W0i5xAS0Xvp86YDeoBPiQXi7CFv+ayGPi0gASxMw4yT+oNPfiPab5JVxRarh
X-Gm-Gg: AZuq6aIE+NtsEhBcAqMLIfPMpHYkN7GnWo5eW/fNjqEzWeelQ/0s386nFqeknQdqGU+
	at6hx3mI9w6sQeU7nfOueWgFktwGXdWjY8KEsxRWUtnpgslpqNpK9O0YHvoYQ8HJDxT00LMcYXR
	gZ/B8hilCu89eD4YDOfa0l8kL2zg8cu7Qig7BmBkbUM7P+GxTWzkF9TOl8L6PKcPNMdkTZIFVk/
	o2ZUn3/srvRJvWURf5EhVS9ykduiKzyOX4J83cVcx/pn7Ceuo/A+PmeLXemj5g8Q2ltL+YDbWvC
	SnhUByd9vHoJA7490WWvLtLIuITBQ/lAKzz61bb0w3O8GzTVCDkd+vgPAav3Y01kkNh81Tga+8+
	z/wHF2czQ3BvJH3cBIZmfWXqGz8Q7+YzS98ou1YQahN2nbQ/V+Rv/MPEQ9bV5/FuxVo/9d20O
X-Received: by 2002:a17:903:38cf:b0:298:4ef0:5e98 with SMTP id d9443c01a7336-2a8d81b5e92mr165912875ad.56.1770111201984;
        Tue, 03 Feb 2026 01:33:21 -0800 (PST)
X-Received: by 2002:a17:903:38cf:b0:298:4ef0:5e98 with SMTP id d9443c01a7336-2a8d81b5e92mr165912675ad.56.1770111201517;
        Tue, 03 Feb 2026 01:33:21 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eedd0sm162489155ad.3.2026.02.03.01.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:33:21 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 17:32:50 +0800
Subject: [PATCH v2 2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU
 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-ctcu-and-etr-v2-2-aacc7bd7eccb@oss.qualcomm.com>
References: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
In-Reply-To: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770111187; l=4204;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=MmRh2JiBpDaFVC7myctfzKWNEp/EVU+H7DSEDhr01cc=;
 b=nKhz/tZ73YjN+u7I6TzVKYsxiiUB7OTGb1oZiZI1TdDqN6lZnR+Hy2NaZ8iuf9mgnithxKk6y
 VdJ0eikjG9dBxKsiBdhOhKqmftgHNpi519RY1sAEGbRi6jqyuhYDRdc
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=Reqdyltv c=1 sm=1 tr=0 ts=6981c0e2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kFQAvpsttJVeTngcj60A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NCBTYWx0ZWRfX3UeBMmFH9UK7
 3QwYQsTXmGGG3CZqWtFs6QzRAs3S6jdq5+jT4PZuDJVL4lVMpH1kGavFHGwJmRaz75e4CnLRs1k
 o0jHtyJpiyaVDycbkkb4O8VWKy2YgAnwxjjz5mu7OE4hK7fd9uw0/558JI0K/3CpukdlMpjFEkr
 OxMCAJbfpb4g2okzGLPxOIPIr6xCWpfqEZy+bHNfBworjfpZPifSRJAoq++UJn5AUTJJNovHsqv
 Pgs/hIZPRbAn8ARVjVyfavjU7O0BHtC2ec7nf3h5PxTn7UFeTuz5aRfCG3P7eE9kpY72ALwKS1i
 5atz5iSdLdCgDZ43bMhK8wWrjVfBZh4pFVeMkv0pDAl3MIFp+D4QHqASEYzpLLiDkEPa3p1y01e
 GbyseMv8gf3iBcdbEdYcYBuAyWhGjd2KdcLU31CjGWX6pJtAgL1OPdsgDe4SxwXGTgO5TzPoPwL
 /CrlupEMv1bTgOGcflw==
X-Proofpoint-GUID: w2UYUn267daGTwf5xxv6JRjeUpgd3Bdc
X-Proofpoint-ORIG-GUID: w2UYUn267daGTwf5xxv6JRjeUpgd3Bdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91640-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.152.154.104:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,0.152.158.80:email,0.164.203.128:email,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.153.74.48:email,0.153.82.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EF923D6D8C
X-Rspamd-Action: no action

Embedded Trace Router(ETR) is working as a DDR memory sink to collect
tracing data from source device.

The CTCU serves as the control unit for the ETR device, managing its
behavior to determine how trace data is collected.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index db65c392e618..88ec29446ba1 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -6771,6 +6771,35 @@ data-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,hamoa-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x10001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ctcu_in0: endpoint {
+						remote-endpoint = <&etr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&etr1_out>;
+					};
+				};
+			};
+		};
+
 		stm@10002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x10002000 0x0 0x1000>,
@@ -6985,6 +7014,122 @@ qdss_funnel_out: endpoint {
 			};
 		};
 
+		replicator@10046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					qdss_rep_in: endpoint {
+						remote-endpoint = <&swao_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_rep_out0: endpoint {
+						remote-endpoint = <&etr_rep_in>;
+					};
+				};
+			};
+		};
+
+		tmc_etr: tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04e0 0x0>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr0_in: endpoint {
+						remote-endpoint = <&etr_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr0_out: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1004e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1004e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					etr_rep_in: endpoint {
+						remote-endpoint = <&qdss_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					etr_rep_out0: endpoint {
+						remote-endpoint = <&etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					etr_rep_out1: endpoint {
+						remote-endpoint = <&etr1_in>;
+					};
+				};
+			};
+		};
+
+		tmc_etr1: tmc@1004f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x1004f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x0500 0x0>;
+
+			arm,scatter-gather;
+			arm,buffer-size = <0x400000>;
+
+			in-ports {
+				port {
+					etr1_in: endpoint {
+						remote-endpoint = <&etr_rep_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
 		tpdm@10800000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x10800000 0x0 0x1000>;
@@ -7298,7 +7443,20 @@ swao_rep_in: endpoint {
 			};
 
 			out-ports {
-				port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
 					swao_rep_out1: endpoint {
 						remote-endpoint = <&eud_in>;
 					};

-- 
2.34.1


