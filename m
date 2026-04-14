Return-Path: <linux-arm-msm+bounces-103124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLWpDvMm3mk7oQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:37:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B373F96F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 606853030B0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C369A2BEC2B;
	Tue, 14 Apr 2026 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNX+UYt+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOP8gVjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375C539A040
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166597; cv=none; b=nHAZ5xOBnNEN1vsQEXuqys4c3bd1AMrW7+9k0J549fyVxGuA/GWpDZcy9Q4ZiJw92lTXVP8033y5jh0LGYn787J5KffC3gMXm3vT4sJe73+HjbzKSvyhPsXssgEXLeHlFUMTFV6sNdPOtUhFyCXClKjkh7XHewt1cCw7tCoUMa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166597; c=relaxed/simple;
	bh=xXmcrvotnDZzXlLQilFaoy2YVYYbw+p4ILtbH2GCOY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K6BiTe6/ZlWkBdz9PlxV2t2AJ8UQHBiA5CWIF+43k+/3o/zjeB9Ao01iucdUff42YXb69SuhaIkRKri8QO1O74IyLmh34lODjuWGrv+bfzTNQpcyMUHqU6B2KwQbXwKG0vDFqJpTeYnts5WWUjmrusN/u8EyjFfpm8pcGN4xPlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNX+UYt+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOP8gVjP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6rNAZ3157263
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zpHTOGz9cxLg+mIfEhFiJuDitQxUHJ94gQ8N9KoQsm8=; b=BNX+UYt+BnXC7/sb
	GHZFafLr9Guls2CCfd1lUGRu4sPsbdQA133ETROG84sGuhSV0hCu2DBDjJUAaCmh
	sBY+TWqhtdRKg5bNutXjSDcsjyihAzpieYUE/O4wh9LauHkDbvf5bsEpW8gujuLZ
	6u2cw/KEJf7y7qAxpLGOphLPYWw1PHRcZCCeIUtUFBQYeknnby9Qy/1HRyQUGC2G
	jr+TLEHTRvHmhVe/hJOT402O4ugbWVy5v+KLUmT3JKxJvYuL7R4Jd8JjwNvrqjWs
	n49UuCW2MgGi5JFZzzaFxmqODIsEK6Kh0GwCPXbksxfGxwBEroN3iclnsbGlcMMX
	EpZC5A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86bafs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:34 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f2478c37bso3674793b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166593; x=1776771393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpHTOGz9cxLg+mIfEhFiJuDitQxUHJ94gQ8N9KoQsm8=;
        b=eOP8gVjP3xqUIn0ws8qGiCnM8kZh0+02oYsk4xP34doCHbphz5R284TSgM26X0CVM9
         CMQ9wFQQNoQpLPjjwTdBkofv766HeSGEzTTyaVoYXtZICuUUiKEr3uuBUfG29dutTCWO
         m+EjoncHsfuZ0hF41UohsdG6QR+SbAUQjDhFJ9QI3zYaeWsYoNNNwRAiBx9mFon/QEsk
         UWlGDZDK8DoPBYeoqwbLoaQDaCX/jO4G+StMm6u5Bb/+2IFeMgeK+DAMuBS3dwQ7nV/p
         ennaH9QQCwNRPhXaUn8pjUPtSk68/ccTAxGQR0o1SjVNyKsB023Rxdrxde85wHavin1y
         eSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166593; x=1776771393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zpHTOGz9cxLg+mIfEhFiJuDitQxUHJ94gQ8N9KoQsm8=;
        b=WbUrBcii4XN8VJBIs1RO95BuMT4gI2N10KhDEYyuvZfzAXnMI5CSwxqDgun/VsCK6V
         OKwEmqQO0Moc2Olt7upR78Mb76dkCUFbI4h3I1bDTgNQ0YVVr/ZcOvByTqAag/r6QQw+
         N0QU3jkV5tKqYmzO6snVueg1CKoNvU2xHSNLo/6OzAEOI66ntdluZket3DFfRzUeo3wQ
         oB3m7WvG/nM5g0ZQC9VKbXck+P7mMco8PBcUvMtPGOFVOpxluNGJBreGttpROaw9MZrq
         gZoDaGRRsj9bcg7mJn/mpg3C+JQB0SGUWu3DLVY0HajwKCDt6+SwZYc+6LxnGrwTIusV
         uS/Q==
X-Gm-Message-State: AOJu0YzW1GPLhOvgXctxL+pgpgAnItDF3T7fB6qmBY4lmUh/lxNaMp/9
	jUU0brREJQ35/D2TpkRMfLuJ9Ff17ltddFrxQeNsL320kP5BoY76tjxiXmY1Hv8gxnLgkrupbHO
	f/NTTvfowMa7bCRz5BpSjkKXLGtESmQ9NSVVS22R5BvBpF4Ho3BvA+mix+86NjyFnhgJw
X-Gm-Gg: AeBDies9CMEaog/liiMPwEV8xLtBd1bPGltkdb/UpaEtlShlSTNy+ObXs2cz7jeqH0Z
	MbYGyqdytAxM73SCqx4hvwzzZHBBAloC4bJ/bwgKMCgtZ43LE3XucQ4WpwVhBt8IeJG5pwWkb6c
	Rg8f26/1B+yndXsTUXCA/Vg9wUlaB6j+GdzlP1Fstjkrdyu9Hy49z18/TlXdkJgWD1guR1Q6FQe
	zaH04VDVXhdZq3ZJcp0UWL+lzls+GQvlEANWi0k71tFMEGH9woHQh46FTGp/zdCaGPu0ApVB7eT
	40qVZrzS3Ij8nbnZ+MNj1U41FdAURPL8VjvzCkSw/wS/noKXlJ+ouaWQRJgdBmZVA6b/o19cEqM
	mWRePxFELcajTAuQkZqwPjtMFWsy3+2xfaE3MNqvjc35O81n9dpzS4OojACq96aAdBwi3hqiCZW
	XCP3BU9RBr
X-Received: by 2002:a05:6a00:3499:b0:82f:425b:4c27 with SMTP id d2e1a72fcca58-82f425b6ac4mr6501437b3a.14.1776166593320;
        Tue, 14 Apr 2026 04:36:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:3499:b0:82f:425b:4c27 with SMTP id d2e1a72fcca58-82f425b6ac4mr6501405b3a.14.1776166592807;
        Tue, 14 Apr 2026 04:36:32 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:32 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 19:36:00 +0800
Subject: [PATCH v2 2/7] arm64: dts: qcom: talos: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-label-to-coresight-device-v2-2-5017d07358f2@oss.qualcomm.com>
References: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
In-Reply-To: <20260414-add-label-to-coresight-device-v2-0-5017d07358f2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166580; l=10599;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xXmcrvotnDZzXlLQilFaoy2YVYYbw+p4ILtbH2GCOY0=;
 b=YWG7Er3sa/uy/3K9dGdJtmIZTxQ15YI2lJkf1FcSWyUybXF7mbKCXQKa6RgoZb2TjbtijpBLy
 VFEUICAtrtwC1SalBQZnkioM7qAMlMZH2a+HJBf7pATvUGMSc1rfJw3
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwNiBTYWx0ZWRfX+ezWnqt3zqb5
 BmZRZjv1BLpuecJDGjvu5t4btl6cce/SxeJ0EjWcAfv8ekHFYXp6bS5HPe/LgGITS9BeZ34+WF3
 e9/NjqgsCg5VSrzAzIbp60mwxBKd892IH6Jo+P1yRwtUwz0rGuXU/NqTlBk5bvhbiAQThF02JEU
 bUdRf7KZtLBjqV+CsG5gS+fDKoj98zzWHrI9eJslS6Aos0fT1gWZ/5GJhjeH2hou85DdcAvYRQ4
 Skfus20wdY4TZTXT6nrbvkEhQCjgIxS/DoeGncehEGJJZBhinPyt6nNF7L7R7rocDBZ0AvJoB7l
 8MQUZ1V6ae7BA17iV8tTUEAs9J3X+EjlxEgDtS+R7+xtoeuRBOINxBF3HhKriLemhARDJI9kWVh
 FDoivqSA1niw0S+CrHDtly47yLUAdjULV8TNJcSWdzGO5ptbRdq/db9rFfKZK/1LsfDZuGHV8Dq
 cug8cs3olwJz3SX2E0A==
X-Authority-Analysis: v=2.4 cv=MahcfZ/f c=1 sm=1 tr=0 ts=69de26c2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OwfIJ90L-SrImz3bAfAA:9 a=ds9HYswI8H9LxFeb:21
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: kdVUG7W8nOL9UZFH8Sh3T-dT5hRqtEWr
X-Proofpoint-GUID: kdVUG7W8nOL9UZFH8Sh3T-dT5hRqtEWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140106
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
	TAGGED_FROM(0.00)[bounces-103124-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0B373F96F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to CTI and TPDM nodes in the talos device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index ff5afbfce2a4..019911f3f923 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2180,6 +2180,7 @@ cti@6010000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss";
 		};
 
 		cti@6011000 {
@@ -2188,6 +2189,7 @@ cti@6011000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_1";
 		};
 
 		cti@6012000 {
@@ -2196,6 +2198,7 @@ cti@6012000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_2";
 		};
 
 		cti@6013000 {
@@ -2204,6 +2207,7 @@ cti@6013000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_3";
 		};
 
 		cti@6014000 {
@@ -2212,6 +2216,7 @@ cti@6014000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_4";
 		};
 
 		cti@6015000 {
@@ -2220,6 +2225,7 @@ cti@6015000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_5";
 		};
 
 		cti@6016000 {
@@ -2228,6 +2234,7 @@ cti@6016000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_6";
 		};
 
 		cti@6017000 {
@@ -2236,6 +2243,7 @@ cti@6017000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_7";
 		};
 
 		cti@6018000 {
@@ -2244,6 +2252,7 @@ cti@6018000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_8";
 		};
 
 		cti@6019000 {
@@ -2252,6 +2261,7 @@ cti@6019000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_9";
 		};
 
 		cti@601a000 {
@@ -2260,6 +2270,7 @@ cti@601a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_10";
 		};
 
 		cti@601b000 {
@@ -2268,6 +2279,7 @@ cti@601b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_11";
 		};
 
 		cti@601c000 {
@@ -2276,6 +2288,7 @@ cti@601c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_12";
 		};
 
 		cti@601d000 {
@@ -2284,6 +2297,7 @@ cti@601d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_13";
 		};
 
 		cti@601e000 {
@@ -2292,6 +2306,7 @@ cti@601e000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_14";
 		};
 
 		cti@601f000 {
@@ -2300,6 +2315,7 @@ cti@601f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdss_15";
 		};
 
 		funnel@6041000 {
@@ -2532,6 +2548,7 @@ cti@683b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_qdsp6";
 		};
 
 		tpdm@6840000 {
@@ -2540,6 +2557,7 @@ tpdm@6840000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_vsense";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -2560,6 +2578,7 @@ tpdm@684c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_prng";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -2579,6 +2598,7 @@ tpdm@6850000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_pimem";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -2600,6 +2620,7 @@ tpdm@6860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_cdsp";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2643,6 +2664,7 @@ cti@6867000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_cdsp";
 		};
 
 		tpdm@6870000 {
@@ -2651,6 +2673,7 @@ tpdm@6870000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dcc";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -2671,6 +2694,7 @@ tpdm@699c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_wcss";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -2693,6 +2717,7 @@ tpdm@69c0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_monaq";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2736,6 +2761,7 @@ tpdm@69d0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_qm";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2756,6 +2782,7 @@ tpdm@6a00000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_ddr";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2776,6 +2803,7 @@ cti@6a02000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ddr_dl0";
 		};
 
 		cti@6a03000 {
@@ -2784,6 +2812,7 @@ cti@6a03000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ddr_dl0_1";
 		};
 
 		cti@6a10000 {
@@ -2792,6 +2821,7 @@ cti@6a10000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ddr_dl1";
 		};
 
 		cti@6a11000 {
@@ -2800,6 +2830,7 @@ cti@6a11000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_ddr_dl1_1";
 		};
 
 		funnel@6a05000 {
@@ -2870,6 +2901,7 @@ tpdm@6b02000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -2890,6 +2922,7 @@ tpdm@6b03000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -2910,6 +2943,7 @@ cti@6b04000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao";
 		};
 
 		cti@6b05000 {
@@ -2918,6 +2952,7 @@ cti@6b05000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_1";
 		};
 
 		cti@6b06000 {
@@ -2926,6 +2961,7 @@ cti@6b06000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_2";
 		};
 
 		cti@6b07000 {
@@ -2934,6 +2970,7 @@ cti@6b07000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_swao_3";
 		};
 
 		funnel@6b08000 {
@@ -3040,6 +3077,7 @@ cti@6b21000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_aop_m3";
 		};
 
 		tpdm@6b48000 {
@@ -3048,6 +3086,7 @@ tpdm@6b48000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_west";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3067,6 +3106,7 @@ cti@6c13000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_titan";
 
 			/* Not all required clocks can be enabled from the OS */
 			status = "fail";
@@ -3078,6 +3118,7 @@ cti@6c20000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_venus";
 			status = "disabled";
 		};
 
@@ -3087,6 +3128,7 @@ tpdm@6c28000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_center";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3106,6 +3148,7 @@ cti@6c29000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_dlct";
 		};
 
 		cti@6c2a000 {
@@ -3114,6 +3157,7 @@ cti@6c2a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_dlct_1";
 		};
 
 		cti@7020000 {
@@ -3122,6 +3166,7 @@ cti@7020000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_2";
 		};
 
 		etm@7040000 {
@@ -3150,6 +3195,7 @@ cti@7120000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_3";
 		};
 
 		etm@7140000 {
@@ -3178,6 +3224,7 @@ cti@7220000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_4";
 		};
 
 		etm@7240000 {
@@ -3206,6 +3253,7 @@ cti@7320000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_5";
 		};
 
 		etm@7340000 {
@@ -3234,6 +3282,7 @@ cti@7420000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_6";
 		};
 
 		etm@7440000 {
@@ -3262,6 +3311,7 @@ cti@7520000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_7";
 		};
 
 		etm@7540000 {
@@ -3290,6 +3340,7 @@ cti@7620000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_8";
 		};
 
 		etm@7640000 {
@@ -3318,6 +3369,7 @@ cti@7720000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_apb_9";
 		};
 
 		etm@7740000 {
@@ -3492,6 +3544,7 @@ tpdm@7830000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_olc";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3535,6 +3588,7 @@ tpdm@7860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_apss";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3578,6 +3632,7 @@ tpdm@78a0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_silver";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3597,6 +3652,7 @@ tpdm@78b0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_gold";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3664,6 +3720,7 @@ cti@78e0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss";
 		};
 
 		cti@78f0000 {
@@ -3672,6 +3729,7 @@ cti@78f0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_1";
 		};
 
 		cti@7900000 {
@@ -3680,6 +3738,7 @@ cti@7900000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_apss_2";
 		};
 
 		remoteproc_cdsp: remoteproc@8300000 {

-- 
2.34.1


