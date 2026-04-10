Return-Path: <linux-arm-msm+bounces-102572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EqhB2Jq2GkhdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:11:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 438AB3D1BE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57932302CFB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 03:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1214317150;
	Fri, 10 Apr 2026 03:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYbC9heT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEnBYLhW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74770192590
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775790581; cv=none; b=u8X8VjxfSUZpoOzl6KveF6uC6TPq8dMjsxMkMKbWMAuo6Sev8dv2yHIxEVN6OtYTu1Lv1mRxxsZU5tlwWmRKZMXv86rFi7SUBAT5tZDd17hvI08TtsuzTCoXzAxXRAFSjMUyhJTi3RHcv0DgJWOjkQKsXVCVajn8vkOOYBYYU/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775790581; c=relaxed/simple;
	bh=CycNrBzVt/HtdPw4ivxnMvUrekh45II2ymP8/7jlOWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TIX8CkR2zTj7thIYC08bdam/17w8HEyFG3nKZrFG1XhbNUiWuI/U4JhU5BJXMwmPY1o/6Xl7T3WoJOSRZ70h68sdbsYM1+/j23iFia817UuAGnou/T3aom13QZM2RF9pXcHLTW5roZDZ+IEqPg7xMKPBqrjEjrrAecT4xyfMOD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYbC9heT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEnBYLhW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639JFiFI2866425
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Za/KbFucsGHgwB4oXI1KvrF3e1afcXU+Zi5dyUwVeTU=; b=jYbC9heTCpZZ/xBH
	rkCZcpmRPiK8yNj85Ghpzhilkq2iXe+Qx4OJpzZSiEdbtTkh1/xkpqdBxoSlVYZ0
	wy5uGKJHkCj1h6QWxvBmfVkINwzq4Do3aTzPlKgsPbizH717VOALmDkKfPfT8qIT
	D2/qbLlgW2+j02ORG/MPh7KXBg1pTf/zi+tphgnX6nz5vXiEaUhF65fpjQDjeaEQ
	Sq/m8fZrLWkf8f9rd7FQj5xjz/E6JtTIAVO9KkwhrObHJRweMyixE2Rz7V4L+rZq
	Bb8ep7QbscZ8xztL3F7G7LZxC53La59yVLo5pB0xMMZFzGGKB+SCgUwgH1WCUeMi
	LV4o4A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decayjm0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:09:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76b6db8bb2so1263908a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775790579; x=1776395379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Za/KbFucsGHgwB4oXI1KvrF3e1afcXU+Zi5dyUwVeTU=;
        b=dEnBYLhW6LTa16vtOfRzooKPxR4+nkO6ZjTxQ/ikGtFYHFOATzceD3iTXhP0anJuil
         J5mkom7XInD+eCZYxmOYE2Jw/yOOUzgOSmVfxeZypwilNzKKiAomuOF0PDgyCG0VFCMj
         U1mGapt+V6PqdygwdTAKAZBk0YXS6OoG5T8a6QjQNMqytISjaJEZEg+YGZB9WRaX0PCh
         W3GagdUH7fgdneOKrZ+w1qDS+LNGk181l7lwVt6k31KCkw9GnLsvnKndVV7Ahu0ZYtiG
         fJiZWeAjiy8ZvebD0TXCdQ+FmQxwtoom1nB2a3RW4jaHy+TFUTanJhw9GvJAwMjZLNOU
         qgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775790579; x=1776395379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Za/KbFucsGHgwB4oXI1KvrF3e1afcXU+Zi5dyUwVeTU=;
        b=O9jMO89rPMO2Y6gwQTW6jxONtcKrdHiBwPEI2MEdUNCLKrAAHL/S9HFkaBA+z9ZGy2
         /HZsx2bB+Q43iiTph+mJyQluXTURsRTWHOjnZjdya3NiCOL9tR1sg1vfqT9DSGXTr04B
         6id7yGQS2EfwcYG9VAzdUQ4HPZS/zPdNN4KogJJBeDcsDTDLoj7/oVMcx+Bj1hazANdi
         8jLSsVwb8g+z1kUO/t/IQfTSCSpVTIx5WDzZgN3J1v9NtEqDXS1wUFml3u4uaZNcRdX4
         TCt7acXCRbNIYHaCNnGT7H0C+MkAnKUDSRBDqGHW9E8aRUZ8urj1+vppEkls5BGjQ/2v
         9pGQ==
X-Gm-Message-State: AOJu0YyxrJDvKj3xfDd2cfO/AgLm71Q9DGUATGfWW0GLdwxxVLH6Dp+0
	O25g262TUrSUZ8S8yemaSVpbvhSpy4wZ1kJeLNaXJ4sz7wgc9FFcCcPG7qDmsr05V5G/XTyDPXb
	W8kS8WdPo055bFD1I0WofUidt3oscstQQ3JiGZCk9bhBXhiH7eEwdaqm98/nmwKbBsXmc
X-Gm-Gg: AeBDiesSPEMzsc9T9JZxr6+12G/ffBNlx6/d0XMUtxw9Nh3KKmYPxPJi7h6lvvktJ1m
	EdFUH/dOpdGlr7hbqWfs/Qvs6ajuaclQe3dXV2qwT11tEKbz99dRD/oseAdHKv5SNU00NVuscIG
	kUJIMUAl2oQN4claoVt/yuTDBb54US7g0cPmlw05sKfVStPNgbbGdwJ6SvirOg2yNoCuuxqBEPZ
	L/kpTyjF/Xyp4z0eO4871s8B4sKDQq/cUGJn3tejs7YyoBAU3y1J4UEGhO5B5EduAwIBTGA50TJ
	5mePIC4f4dp86uKP4G6xmFTpnUxXFCt7DhzM9h6onhJNOwHBkonMoxBGqARh5cTSQEK8mZWvP1h
	p0fttiBIZ12sqhQculu47KM0z7xcO++lGM816gKRnATAvlgTLB0sU+xpJzspV19KeOe2HRMllfL
	IYG34oLa0h
X-Received: by 2002:a05:6a00:1c97:b0:823:9b7:9c0e with SMTP id d2e1a72fcca58-82f0c24cc51mr1728203b3a.34.1775790578890;
        Thu, 09 Apr 2026 20:09:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c97:b0:823:9b7:9c0e with SMTP id d2e1a72fcca58-82f0c24cc51mr1728177b3a.34.1775790578410;
        Thu, 09 Apr 2026 20:09:38 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm987452b3a.54.2026.04.09.20.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:09:37 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:08:49 +0800
Subject: [PATCH 6/7] arm64: dts: qcom: sm8750: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-add-label-to-coresight-device-v1-6-d71a6759dbc2@oss.qualcomm.com>
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775790553; l=5596;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=CycNrBzVt/HtdPw4ivxnMvUrekh45II2ymP8/7jlOWQ=;
 b=qtbTdhMOJQWYiqotaXE8bXC38kUlRE8IFO7wHyyBbYaXYMki8n4BmsWoXBnnhVIUXH2p5Cf8o
 P5nEMHZ/5cjBPZ+FhbCDywPo0czAgUobVUe1JFey/sibjh8gZaJGuNi
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d869f3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=M9WVcT1Q7LBHNZIDZtsA:9 a=_B6xl75RZ7udhtdn:21
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAyNiBTYWx0ZWRfX0Io5m7J98fGn
 eVeJopMPwSAA2bftPEae0TpTV/U4v0CbsI4PE5UoVYxEmry1IcUFfAbGUpNxFAraxgnLEHvNxXv
 7XJkqTnylQ0c4k278GWKFDGKPcV9NCnf7WMKGAQLCLManVSDpKicCy4uicbqJQ42Eh3NR96PffP
 ZsMtk9r6oQnIHruyrHUSgMESOA3z8KY1DhpvKAwzIK4v/fFEFmAsedqjN+NYwWbXodDZ4sUWgS7
 bvXcJn2fpCXgpLIAn9zgxUQhlt/w1N1uyMuYcV/YyOW4pIt6KKoNRjwBNCgi8W4ciOOoU8C4CTw
 30e3DCoATDSqFpFYqsNCxjtjPz6V6TftrBZkwosu0oDDeee4XdlxIU8Mp0TKTY/b+YvVC38Uio5
 FsGef2EsfQwNSL/+5D8t43x/2IrGH068wFFvJZyw9qleT9NtIHFQDkWxHeki8vOqpz9qXUTCRMB
 K4TSdh3x2KVHoKhrdrQ==
X-Proofpoint-GUID: 1E3lYjWr4Dj6w91T9E8pzdu2IOlNIF1w
X-Proofpoint-ORIG-GUID: 1E3lYjWr4Dj6w91T9E8pzdu2IOlNIF1w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100026
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102572-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 438AB3D1BE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to TPDM and CTI nodes in the sm8750 device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 18fb52c14acd..c13e9a6bc68e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4112,6 +4112,7 @@ tpdm@1000f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4176,6 +4177,7 @@ tpdm@10800000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_modem_0";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4256,6 +4258,7 @@ cti@1080b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_mss_qdsp6";
 		};
 
 		tpdm@1082c000 {
@@ -4264,6 +4267,7 @@ tpdm@1082c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_gcc";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4282,6 +4286,7 @@ tpdm@10841000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_prng";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4300,6 +4305,7 @@ tpdm@1084e000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mm_bcv";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -4319,6 +4325,7 @@ tpdm@1084f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mm_lmh";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -4338,6 +4345,7 @@ tpdm@10850000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_mm_dpm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4402,6 +4410,7 @@ tpdm@10980000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4490,6 +4499,7 @@ cti@1098b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_cdsp_qdsp";
 		};
 
 		tpdm@109a3000 {
@@ -4498,6 +4508,7 @@ tpdm@109a3000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pmu";
 
 			qcom,cmb-msrs-num = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -4517,6 +4528,7 @@ tpdm@109a4000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ipcc";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4535,6 +4547,7 @@ tpdm@109a5000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dlmm";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4553,6 +4566,7 @@ tpdm@109a6000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_north_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4571,6 +4585,7 @@ tpdm@109a7000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_south_dsb";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4589,6 +4604,7 @@ tpdm@109a8000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cmb0";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4607,6 +4623,7 @@ tpdm@109a9000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cmb1";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4625,6 +4642,7 @@ tpdm@109aa000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_rdpm_cmb2";
 
 			qcom,cmb-msrs-num = <32>;
 
@@ -4776,6 +4794,7 @@ tpdm@109d0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qm";
 
 			qcom,dsb-msrs-num = <32>;
 
@@ -4909,6 +4928,7 @@ tpdm@10b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4928,6 +4948,7 @@ tpdm@10b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4947,6 +4968,7 @@ tpdm@10b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4966,6 +4988,7 @@ tpdm@10b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -4985,6 +5008,7 @@ tpdm@10b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -6801,6 +6825,7 @@ timer {
 
 	tpdm-cdsp-llm {
 		compatible = "qcom,coresight-static-tpdm";
+			label = "tpdm_cdsp_llm";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6814,6 +6839,7 @@ tpdm_cdsp_llm_out: endpoint {
 
 	tpdm-cdsp-llm2 {
 		compatible = "qcom,coresight-static-tpdm";
+			label = "tpdm_cdsp_llm2";
 		qcom,cmb-element-bits = <32>;
 
 		out-ports {
@@ -6827,6 +6853,7 @@ tpdm_cdsp_llm2_out: endpoint {
 
 	tpdm-modem1 {
 		compatible = "qcom,coresight-static-tpdm";
+			label = "tpdm_modem_1";
 		qcom,dsb-element-bits = <32>;
 
 		out-ports {

-- 
2.34.1


