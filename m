Return-Path: <linux-arm-msm+bounces-118868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 57rcBps+VWrSlwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:38:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E74174EC14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 21:38:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=J9GhMNYY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C0XCWiHr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118868-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118868-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 10C70300D760
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 19:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6539935677E;
	Mon, 13 Jul 2026 19:37:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65F735203C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:37:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971479; cv=none; b=R6Daj4IDiJI9+wkC9gAy3SUJoow0qIwxpl733PYsyzrn1AKudAOfIn3i5yvq/7FMzzk5QYWfN+1lTG64P+j9mrct0TEwBDOZ+oMvhOGZRt0+NEyt/VWI8dgZEZilGzHmAWmcirBdtd2UIGijnLOE0BXjgj0CAY4pblT+due7/e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971479; c=relaxed/simple;
	bh=DTChb5IJt941YLuPwOvT9s6H6kmZ9UZ3rgh//PZhp6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ceEQn/pZ5zqY7JC1XR+QetHgc+lh6IIGj5cYfkAxs0zt4K+wLSROqzmWhvEFvz/1OBne+auOHCx53g6hl5JonPUPCd54xYS9i6dIPVRP2W2lNBGipznCCHmsSmPh9/9iI9UeiIoR7EYtvLhGlVd5C31CdBm3/cts4WKnw4QabPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9GhMNYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C0XCWiHr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9Ne22247754
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	njo8S7KOyTAFfsibteCMNYMS81jSHIvrnNzHSL/N6Yw=; b=J9GhMNYYrGE0YkNz
	BaN6bWrZXr5tXZk0PZCX7/L2tz9O4n80QVpLnlPd5RlvBQXxv/FQZNflp1YtlMqb
	4/TtrsIEGv2x90eLwZij2awutwO/TGnZQhci++VSxuLJK+CEeCn2v9XjXjeSNBGU
	QxKTTG8D584psFrpKmp8U9gl1lPqtUSlNUyhTrHn58eN4PQfBKSwJjxnR8y+g9Fi
	EbzZs9fdmxXQICsyqPFBsykRU0GC3TBznvKLI9ra3wiripM5TFbkZhUjibKTBuF4
	rkz+YerrmHU0EZc680rOZCNCaYOZ+JOWSBjt3IBg27sPIlg+ilE4r9aR74MKx596
	Kppc4Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3jc6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 19:37:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88ab059052so288964a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783971477; x=1784576277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njo8S7KOyTAFfsibteCMNYMS81jSHIvrnNzHSL/N6Yw=;
        b=C0XCWiHrKG3m7w1dX5d0mxwTgPYeo8XsTy5mdtgCJnipRD+9U8mSomvlT4/hsa5ctj
         3851KA5Dp79ZBhz1b+u3K4Gt2VPVuKV5hLunFKMi+jzS89u2FSrxxRDsG9XHI/o+/jv1
         Tp1LmTgqIx2iFUgTLcqhrpmYnQOh+8E5SomFvv7lF5drkFF7AE/hGY3yNa5FNx+1Bhtz
         8/DR2JYmPicAJUsBnBQSyd/Dy23zv8ZeE/VrDyECwP5Fde3BFSEZJIofVDWLXJF3Pdea
         jcBVA7GlckTj9tzEYhBQjNgmTESr692it1Nz//ywvtzd+ePY9Zc0ngU8j/Vji0vjMXxR
         I/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971477; x=1784576277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njo8S7KOyTAFfsibteCMNYMS81jSHIvrnNzHSL/N6Yw=;
        b=ijd1HvRFH8o1wVgzZHLSHmuHCTXbn4MCV6hdJo0zxxHrzWK5DadM4Sz4FKBPL8w2YG
         Gb//w+T3vycrTcwzjDLRFSwSZOLEVqnvJ0Wk42EoDoc6+CHDMGwPS5jJRE24u7khfYHQ
         t6NyKyYhFBoksB29CP6QSSCwToEa+KSE4HKlEG+vCP4tjXhstZZLspkv5duWCUsJgadZ
         fhKMlGh/pVmQZ851p8MmxPR31dc/h0849HDT9wHvY6ZKXTIn+0feX8GkBRo3U886283s
         RQc8u5JyNIQ9VSRjKbLDV9CQA2elKRXVy8luBF+JelRCsFfVNr5MEhmvr3Z0Pc/DpYK3
         cYEw==
X-Gm-Message-State: AOJu0YzeecTfuXzJQzLxZSjYinxiv1JZaDI2wxTorteKBuC0DO8FdfpV
	419r3B6XQc3kh7Mxu/Zi7mAUmZuLYYk/foirYRR//O+4ub+HnYVaTnKyLSQkPwpDsLvRLdhUQLT
	uiwZaX3M5zSEkLLK0LP1I9s6LROmyMigDnYJAuJFRJ/c1OV+2m0JtY+bkrmZOK36bqtv7
X-Gm-Gg: AfdE7cn46xFHLQCp+VoI2unDMFLgez3L+hZatbH0jiZ49iA+LwmhKSi2F/fJz6MYBNt
	yOuJMKqxdxncecd4g11XkwHygOeyr9HUuQ3n4gtoUI1QoRA6rGbX0Fnxs/YYe7pSwrnuLnBfd83
	umpbm3PGrVTDYflpO5WZGrf5PkiAFzHrkwJB1yCST4cvnNkrwaqUg8pcRrbm3kHySdeTvTnKSE8
	T8ABZBrhaWHyrWITxNKcs/Nh/UUdQjgKjlGZaC2l67RD8/HwZsBpaltR/veQTe8ykSG/vxjPqTo
	4zdu6uBfRdsNW4eI9a1wkHvilFZh5BfALyWelLggW2DPfJWZBGwOT67PFgWjI910W1hMfvlFb61
	1FpIwSFSMfRQVbJB9K8HJwiu0WQ==
X-Received: by 2002:a05:6a21:a8e:b0:3bf:9e85:b423 with SMTP id adf61e73a8af0-3c0f0bf4341mr15371833637.34.1783971476525;
        Mon, 13 Jul 2026 12:37:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:a8e:b0:3bf:9e85:b423 with SMTP id adf61e73a8af0-3c0f0bf4341mr15371801637.34.1783971476032;
        Mon, 13 Jul 2026 12:37:56 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313f3ea883asm207540eec.29.2026.07.13.12.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:37:55 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:06:57 +0530
Subject: [PATCH v6 08/11] arm64: dts: qcom: shikra: Enable TSENS and
 thermal zones
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260714-shikra-dt-m1-v6-8-bee265d3499b@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783971418; l=6381;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=c7IkaekY6O5VmCRVXe8bHxUYf8Y4vnUM7egoEzFTAkY=;
 b=uaIPH469DMRU5z6DvbGQIs/Ubni5ag0PqHaIXSYESzFrV04R46zUEAkGhanwkCfcAhTx9uVS2
 ykoGyO1S0HaArL8+BJGrBAgK54yOhNxocUxKJWkzzeMTu0XD9J5Hmms
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: 1O1DGHWLj4Oh-AHT_lxad7nvi7KRjKbZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwMyBTYWx0ZWRfX40PBmbNKMZbe
 kx/RVAzQnejZwryiM3lOWk7cWLD+M4ldUoiaXMFXGW8OrGZJQavdDRvYTDd775vkwaeaRATecbq
 Yk9pPukEpVd5LliI/ox+cYdmivVWCcA=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a553e95 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dm7ITHKX8Gmtf3-juREA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwMyBTYWx0ZWRfXzgR7szsDBnAx
 VHa1BCjtUNCWlZrfcWW9WxwxWXUTxbgaGdCc927OZ82gTnhY5s3uOi9IsWFzrYJG18slu+Iy016
 TO8NZg9dSxx62Oea+Ty5RHA1h5brxvnTC9k8U1/eb2CBcRRdsjFimxDEsFLXL9a83BOsOoIy/uw
 ZUqa735FMwPVF2pLuqb3z4S+1PtNeg3khUZTRDAzm1mSSWvtwfNWq2tId4p1mfTDhP4mnOWFhra
 1YrijTumrwBWRcwl0ztIQiNarqpfxvkGMYDFsyv0e3RjtAXXT/7P0w3ZCp2PF5ZNB7dlzEe2r40
 HlfN7QS0V5W96E5wR0EgDxPEu7diGlcB65rYK86GdjNZ4Fp0yRXJbPZMwSA1B7i/VA+o90pn/Ss
 98O2V9cK7CMdvwmGxzjg4Ucd46WctyNt8dqVnzKJnu80HyyPUbJ8QZlr7f0JLrwtOEj7mMH13le
 KklXK6tjJBFih/VJqAg==
X-Proofpoint-GUID: 1O1DGHWLj4Oh-AHT_lxad7nvi7KRjKbZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118868-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:komal.bajaj@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E74174EC14

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

The shikra includes one TSENS instance, with a total of 14 thermal
sensors distributed across various locations on the SoC.

The TSENS max/reset threshold is configured to 120°C in the hardware.
Enable all TSENS instances, and define the thermal zones with a hot trip
at 110°C and critical trip at 115°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 267 +++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 12e4281f7b35..3abd0a686d0e 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -998,6 +999,18 @@ spmi_bus: spmi@1c40000 {
 			qcom,ee = <0>;
 		};
 
+		tsens0: thermal-sensor@4411000 {
+			compatible = "qcom,shikra-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x04411000 0x0 0x1000>,
+			      <0x0 0x04410000 0x0 0x1000>;
+			interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <14>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
@@ -2195,6 +2208,260 @@ cpufreq_hw: cpufreq@fd91000 {
 		};
 	};
 
+	thermal_zones: thermal-zones {
+		aoss0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				aoss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu00-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu01-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu10-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu11-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss0-thermal {
+			thermal-sensors = <&tsens0 5>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-thermal {
+			thermal-sensors = <&tsens0 6>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsp-thermal {
+			thermal-sensors = <&tsens0 7>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsp-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss0-thermal {
+			thermal-sensors = <&tsens0 8>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss0-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss1-thermal {
+			thermal-sensors = <&tsens0 9>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-thermal {
+			thermal-sensors = <&tsens0 10>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens0 11>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				video-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-thermal {
+			thermal-sensors = <&tsens0 12>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu02-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpuss1-thermal {
+			thermal-sensors = <&tsens0 13>;
+
+			trips {
+				trip-point0 {
+					temperature = <110000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpuss1-critical {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 

-- 
2.34.1


