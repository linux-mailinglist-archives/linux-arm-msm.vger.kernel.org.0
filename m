Return-Path: <linux-arm-msm+bounces-90283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AcoFRAfc2ngsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:11:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB6F71740
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 566B03007F43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0593D352C5C;
	Fri, 23 Jan 2026 07:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SXFidl5T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kuqu6ITx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02BA318EDE
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152264; cv=none; b=PeklnUYiv+ii6nDYa/LXMz2zgs3i20DnPBBS1F9+WbchN2sQBPZ0GWV6DkKPDqdUIL2iQKv4itLDXuzkuq+m1hJdXeCNOBGK3jD/tIGdNHc0nLRIV2yZbYOWM6uXkkjJWXWxUEkU5Rzhmg9z15vSVeFeb/eRpACUlV46KhoZESk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152264; c=relaxed/simple;
	bh=TylLAhNCMKqVBj5uxnqA+4lw1pa3tSVa/3CyKMBGtrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u54vCqVoF6Xg0/qu8XvtrTIeBXs9mcqTS33AdGLEc744iSVPz8IIeaaL54U42pxvVnqYV9KkDUr+Lu0FXKrtJ4jIF8+rQrwjz7a4xnEiM8kceC+riVzhvEbI1i3lshyGQ45/3R4JSpXD0nly2gXf5X4/OmqEsP/ZmoS8SXE63q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SXFidl5T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kuqu6ITx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N6AaAs3126228
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p8hHPfRk20SmhnrK+fPq3K
	Tueqe9Ig0bSHfFCJNpDLk=; b=SXFidl5ToW/Qk/AuI1qDIkuUk+R5ru71gLfc/9
	4HO6PCLvirPMK62qFC75MhcrbFAIcB5vU3LQxTPFjopG1eXrzQDhJ9y0Rb6jNEnV
	6X03QYRHkBJeER2E4ZTVQDUaWV5x6iG6p+F39O016CTKsNVIu/Jp91imcd13XSvE
	9F69VUpnuljAWYpGjz/qflZZeMBJlOH55htIz6E9xr+EYrnmok+cx292gO9g//rM
	a3YwMuIOWbWb6Q4zLrqsr7gJQTO2PnuETiKtohJ/kUnHXcc5lTd5jtVRTcfDPpwB
	igKSbxUDKj9quY35O5jZpHgJ69JuLamTtXugdrSkQAMeFgcw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buthdsvxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:11:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso3707618a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769152262; x=1769757062; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8hHPfRk20SmhnrK+fPq3KTueqe9Ig0bSHfFCJNpDLk=;
        b=kuqu6ITxYyOHzSJKKqIg1cI8is/PLkAwyiRs1PE6JHILGrS2AjhMnO11XFPhHW3D28
         YPz+kmq10gXCGQ7NxE3tGssOiju8Ox4y1ZROSGUziwjk7dpKwnsHV0rrvvU4an7tH0xU
         U73VmbV9RbNZQop9Hlzsm2tgs5vg+1NBuVBxiBx9UiRjPonMyypmxMhgxaUFgLkbUiIm
         O3n0VpjmCB4Rme7zLMFwp8+UNdGmJ2gT7LCBUFeN962Y7SWYUdgiP5U3fxnICNDSKvo0
         aLcVyrTRdbUIaKeKcnxURL67SKw3D6MWJaOEw+Mtlddj/5c+7QfkGdbYfAz4pDwFwXOS
         xqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152262; x=1769757062;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8hHPfRk20SmhnrK+fPq3KTueqe9Ig0bSHfFCJNpDLk=;
        b=Asvq0u/WvMm5CYVyzCiwlyrNmQdq1ohRLclD13tEPe8+Lf+59OYX5UiKfG9Bu74D6C
         4NUeLPKmkqi7riaZMrLaP3QGAZyU7G9vlCw0aGBFyugyZd9djtyXjsx1x4pBT7IZjvdc
         NrRtTATeeJxjx16pdXm3sWLVUdaxUhyOTGVeuF6/vpX85cWZImkK70MzcyfDydXHx1XO
         HUs6zpwyc0ov9I2hps0bshFVeXzAzJKkKBFFOAWs1JpM9ENnT4og3nRFnkSb5qVEdv5M
         XNEJlNsIefMKVLn8ceVR4Riuy/Dxq+11pG1o/b90x2gPieDtcFOvaT7/fWLXMpD8T+EC
         6ZUA==
X-Gm-Message-State: AOJu0YxxqPw2ZQSudrTP3HGzoDETd4mlfEryLr+m13jhTjC+SMCHbK0K
	Gc3RSyR16pb1vMwNewnKN3einEJCC1vxmkZ/8V676XOhWG29u/+JOXksnn6hawJH25ZoDO2YZmG
	hLwzUW50sU2eb5b/W0pLWc8engMKLr0/OKJpfYh8W/+RHy/WIdiRgDtYifndyZRL4jB4NsarO/2
	+U
X-Gm-Gg: AZuq6aLCXPD/HR8YB8aruZhq/pb4yaA9UwgoovBvzASq3uYBSNejRWWeJ0z/2rULVbf
	JtA6qzcyQRxK5wT86yYDARTm3YOmZPvEEhgNTzNTV7LKhKM3S2tCNrFzYc/JUCOCp8r8lJVcFMK
	pNf0T0Sg4Yz5di+rCID3SjkXjlumU2gxMTRDnrus6DmwRQ3iX64KGA+oxFiGTyxhjwrhMIGOlTK
	Cab2AmKNgea9ecX7TnkRKseilPydl3Iei+7nzOlh170rFV98yJ9L/aslef8b9pwx3KrByl1quIn
	LXf6qvtaThebVGpB4hjenT3jvruwIdCfU0sYGt2a23g8NDw1leu7lfF9Rq9sBWPdIrwsplZvXCN
	p5RgCm4lxSzNdxLdiPneoWELdY6KArQ4SdJZS3Ya+ljp52yswnDnTlSb7veuL92j2Vzp65XZ5
X-Received: by 2002:a17:90b:2d08:b0:340:ad5e:ca with SMTP id 98e67ed59e1d1-353670247b8mr1984482a91.12.1769152262173;
        Thu, 22 Jan 2026 23:11:02 -0800 (PST)
X-Received: by 2002:a17:90b:2d08:b0:340:ad5e:ca with SMTP id 98e67ed59e1d1-353670247b8mr1984455a91.12.1769152261708;
        Thu, 22 Jan 2026 23:11:01 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353354cdcc7sm4186703a91.16.2026.01.22.23.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:11:01 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 15:10:46 +0800
Subject: [PATCH] arm64: dts: qcom: talos: add ETR device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-enable-etr-and-ctcu-devices-v1-1-5fbb3423a2d7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPYec2kC/x3MQQqFIBRG4a3EHXdBDaTaSjQw/asL4XtoRRDtP
 Wn4Dc65KSMJMvXVTQmnZPnFAl1X5FcXF7CEYjLKWKVNw4hu2sDYE7sY2O/+4FBCj8xq0k1r264
 zVlM5/BNmub77MD7PC51dWxptAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769152258; l=1494;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=TylLAhNCMKqVBj5uxnqA+4lw1pa3tSVa/3CyKMBGtrI=;
 b=E/DttrUEv/8zvBF1jdeWvGb5BPHXBK+AAX9eCZSHF06CNSsHoI98qvpxlpoURwTm9HRU64XCG
 VygRyRUk/cMDj+nE8njHEsEp0qTPdtDvpiYg3yPThjmYaa4H/t+K0mf
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NCBTYWx0ZWRfX+QuPsQ8N7Bgc
 dNCKwhwSqOOjZdn6TJo2C+0p166xjtsiLBKhylbOxL6cbR3MN4qB5j1EnQSxiDTVNgKpRdDT/tt
 2HpgvmFZtyYBPu3yQqArST6ojk3RxdxXh9Xb+vUelXakccC0GpwOb0QuvqNfZlNuifrodxxVbBK
 2h7A5O0NaxAZNC9GgEARU/341pNSmsH6+L3ltudLjPcDGijsx/qmN/ztak9JDM7NifMfrQsAao5
 tAAVsZSccHWBK/LCO1qK8JzNxYM6IvB9nXrQhoSvjFi1+9kbYZwtO0Ssp2raYNHqvO3n85YGOe1
 YzL9ia16ODosoJyc5qDb9wuwgug6LTuSoK0vQczjwwXL1gQCIUZsVFJyLESUpirVTG0qEr7uhkI
 9tLn+vDVgQVSGNMq5K38BTFSl4pB3hM4IKSUjtUrV9RgzGZE4xHBBrHmLszci712EZloo1VGsge
 lh9Bu8l89epaA8UmxgA==
X-Proofpoint-ORIG-GUID: rZHs0Or8Q1XGdmAC8TwUy8jScOFCQDgG
X-Authority-Analysis: v=2.4 cv=XauEDY55 c=1 sm=1 tr=0 ts=69731f06 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rJ1OjL6diA_ycIJh-hIA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: rZHs0Or8Q1XGdmAC8TwUy8jScOFCQDgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90283-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,604a000:email,0.92.73.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7CB6F71740
X-Rspamd-Action: no action

Add the TMC ETR device to store collected trace data in DDR memory.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..3b081ce9d202 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2253,6 +2253,14 @@ out-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+
+					replicator0_out0: endpoint {
+						remote-endpoint = <&tmc_etr_in>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 
@@ -2287,6 +2295,25 @@ tmc_etf_out: endpoint {
 			};
 		};
 
+		tmc_etr: tmc@6048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x06048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			iommus = <&apps_smmu 0x01e0 0x0>;
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					tmc_etr_in: endpoint {
+						remote-endpoint = <&replicator0_out0>;
+					};
+				};
+			};
+		};
+
 		replicator@604a000 {
 			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
 			reg = <0x0 0x0604a000 0x0 0x1000>;

---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260123-enable-etr-and-ctcu-devices-0b1386899261

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


