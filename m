Return-Path: <linux-arm-msm+bounces-103123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP/VMNYm3mk7oQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:36:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 300A63F96B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 500E5304A6DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2193D9DB2;
	Tue, 14 Apr 2026 11:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbILZW37";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQDQRNnT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC5E3DA7F3
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166593; cv=none; b=O7t4PMYD6OJHBcGkqKFfpYuyWB8go/Q2+YK+Tz0MUcVoaP1ejVZfFMnEG38nJenCPrkrA+j7SJuiovmEr3RYp7RhPVefiszIvTt1Mzh87TVoLd+QFyVw4KCFao9bHmwVQGMbiwTjQPoIGIls6QH50WbKaxxvguQxbdYGFIk+/BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166593; c=relaxed/simple;
	bh=xrn8iFf62z/oUuIXkUARUrwaU+PX7rU2uik/hdiVg5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dcoLA071cEil6q5aXtwKWBM//3vBl1/I47oFdnyBwVebcQ68JssdhD+d0WSM73ye6tNXqp42cBtbPbQAFMiLfiQdmRFLflV4HEp6xey3h4qo1fJqifrPITRjX3L3TdPCY0jtVX4p5EJbtxasv4MMA2diDF7QMiAccOxfkWLKnDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbILZW37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQDQRNnT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EB2cQ7395301
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K1cVEB56pTa6ARp1A0m9nmYfbAYbdBCuMA4dZd5OcoU=; b=KbILZW37hafZioDt
	FYIFbobsSZh7TNMKOSZSkufhhBd8NUKdKsJrfj2APR7KdCYiX4cvs/m7kAJVAv1K
	jd1L282aMmCrlekNm5HthHuTlB/K1vEc7EN1d77YY27QtJ8Mk4WUvDPmjbBfkYnv
	Q7sAJO8j+d8B9mBh2ZkZ4M5HQuetI+lDfYxMNYmOlk9p9ObpNDY5qJ69Qfxad3DZ
	VGVNG+nes7KUUI5pihlxNVLwNU7Q/N2V/j0gEBxp8RG6zAY/4i1JFgqdWmkSoNnB
	H66pkUjW5B4era+2IXaJ+Vv60N09YDege1pttVeGfhVg0dhc179omexg3Ez/8h6N
	Zkit4Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870tgw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:36:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70dd30025fso6773012a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776166589; x=1776771389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1cVEB56pTa6ARp1A0m9nmYfbAYbdBCuMA4dZd5OcoU=;
        b=gQDQRNnTz6k1t7mHjhwXBi39imXaN933NdWFhT9/QviIaFCr3+yDVQxMlbS56FkPFZ
         /6c/uRjJCOMfXU/lK0QgneSHke8H7gXMnDriJcqNhQTtzlQIG4ZbZquRPIDx3Ru2Ssej
         TLMOMYwE9P+7uufFB3wdT0YeLX/eD35dDRAwau7PmHVrEOkpctBDFU2ezz3di/OY5GSe
         AuS9ONSLHVr/NgDwy6I8kdRVfcfFgPSRF1KrdDJ/CrcoCOoXoU81d+KNoHVNzVKANxxm
         sBOF2/UCoPiDF/6jlJ0EYesI7rEcKC7w3D7o9yabENJ9l3u96KqHCPBummd9Q+GHzmfj
         9tZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776166589; x=1776771389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K1cVEB56pTa6ARp1A0m9nmYfbAYbdBCuMA4dZd5OcoU=;
        b=k52MFHfHu7dv3TdFwf4Pdz4+jQiG4Ci0TPgH8AyihTQwogv2O47aVyrJ+I6BvXTUm7
         ZEU9rqpOtPMRVS0T/DAA7zochE5Bt7lv9ugxdxv2wSQ+qX9l9yGmfffOtJJe75bi8p34
         WmzLSdXefvkpWMQYZNSUWHnQ0ckd/Mav5v5xjMGz9IEv06XNEw9shy/6cPdGZrgwCCmj
         gX0H3RO6fIQLEoik44TVa7w7SQ2Zf2TmEND2TrQbec1ttpOttM+TEWaJ9657Z4jQrAp8
         MiFMJiq830V+K+9B8xQErs7pIx0f7xnfKYYdTzHt/7FE3U6CqZJZ5YjmHROfIIzX1LwK
         2WXw==
X-Gm-Message-State: AOJu0Yym9vbRZBAARmi1PD9qa0rvIPZZrYIAGtJKkXJJcPgHfwsciGJp
	3BXUzTtb3Yut5uuKDXpzHfZvMT0+HHbHLgup19v5VrIwu3wQWYOhhJ5T9mr3nfYSn+Ly5mcP121
	TTl7YLWfYtDZIsrHfQYROa/f6aobaLDU5hqRWlFOZe/eH7TnQxHbzl2TTqrqQP/BeXAUKH6q7t7
	xF
X-Gm-Gg: AeBDieudgnn+liClGzlxD40oSbW4oiw1JqDWRmsF5K0igsrziIoBZfyBd81sQCFPJcW
	GLSZ88hOgXzBPJs1/8HmRx59GN8XwQa19FSYWFkIpk118qfYjCknmE6KzsLYSgHECF48BP1fFfi
	C6R9Hfn16DIzt3Qvn/bSdIcDP4lZjvCyEy09MenN3hQFPtp+EUNAPSXYWnNe1MZgwLMA3Xivhxt
	UtHoyUzGoX9bXSSKU1/sLAZhmYBrOhkBzAEpDyuZ3Yp9lTvbRfLxSC4OZKeZj7vY13Yuc+79UxQ
	q1MZxUeMaWU0S5Y/1nfGqGzwfQEs8M72DhgBeSj4vY8+iumZNIsViaqAvpY7OaYTCtmdho1NkBm
	WCYYl7NwzP/1WXJMn98P8uNry3DXjU85u+qfUheAiGXkNkrhGqAJBCb/tWDzs8uayvKkJ7abWGa
	o+cS4QxQLp
X-Received: by 2002:a05:6a20:7485:b0:398:6b9a:6765 with SMTP id adf61e73a8af0-39fe40e053cmr19654915637.58.1776166589360;
        Tue, 14 Apr 2026 04:36:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:7485:b0:398:6b9a:6765 with SMTP id adf61e73a8af0-39fe40e053cmr19654875637.58.1776166588891;
        Tue, 14 Apr 2026 04:36:28 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79486dde3esm1920024a12.11.2026.04.14.04.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 04:36:28 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 19:35:59 +0800
Subject: [PATCH v2 1/7] arm64: dts: qcom: lemans: Add label properties to
 CoreSight devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-add-label-to-coresight-device-v2-1-5017d07358f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776166579; l=3427;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=xrn8iFf62z/oUuIXkUARUrwaU+PX7rU2uik/hdiVg5U=;
 b=LwsV5IeHdfpDVgdalvYRu2NbsogIWMimKWWyX25QQh1EhXBag/4Sk3t+lUo8eW8rTymlw8P7p
 S40AsExZOocCLQRUqnsWqMZiBgKG7owXDs4xDM3VNFkmynxBV4472YY
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: y4yBcNUXOYlhV3euv8stIR8sam4yPuVk
X-Proofpoint-GUID: y4yBcNUXOYlhV3euv8stIR8sam4yPuVk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEwNiBTYWx0ZWRfX//Ws1QXNiAOT
 lJ4T04Y1kibNlbhOcTb3IZPUys8gxmKcPwj+ncrudNrbwdfOYR5oOy9n8JE+4V1uqoCp/YLXNgU
 p15qsEhRRTPCnQq4mIZvkpm2h5PISpmz4+t8xpxeezcdhW2fRdQP9R93boXcTTrTCKgDSGcgfqE
 iv0SRQS5qSfeJhSfrQvR1qwPI4JhUWH5giFptqvPN9OvxBqifr6TZVuwSgsMnmflPuLTm9Of/9m
 fBp1vCQH0M6tRwjabjEiHldINj/Bdys6nAQHRdbt9Ma3/K+nci3GIG5H8pjyevC9GTLoX+97P/G
 aBjcHUNbfezcnbl1Qt1eSgeIpieqoEm/wv7jHRCa5sanE1wxYR5uuSRPEURPrv9RaJGuLKAl/ur
 BWlhJYwADFbNYiFM64uaiFy5blw8oKAPUqWMlT4vNKuI+3ri0P492sLmgMMfq0hyQS/KDqNju1h
 9EOTZ//9QOkvVeM4nlQ==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69de26be cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AGQJ8-okPX9lvk53HAUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103123-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 300A63F96B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add label properties to TPDM and CTI nodes in the lemans device tree to
provide human-readable identifiers for each CoreSight device. These
labels allow userspace tools and the CoreSight framework to identify
devices by name rather than by base address.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index fe6e76351823..7cdca20708cc 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2847,6 +2847,7 @@ tpdm@4003000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_dcc";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -2906,6 +2907,7 @@ tpdm@400f000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_spdm";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3374,6 +3376,7 @@ tpdm@4b09000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_0";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3394,6 +3397,7 @@ tpdm@4b0a000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_1";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3414,6 +3418,7 @@ tpdm@4b0b000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_2";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3434,6 +3439,7 @@ tpdm@4b0c000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_prio_3";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3454,6 +3460,7 @@ tpdm@4b0d000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_swao_1";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3474,6 +3481,7 @@ aoss_cti: cti@4b13000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "cti_aoss";
 		};
 
 		funnel@4b83000 {
@@ -3795,6 +3803,7 @@ tpdm@6860000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_actpm";
 
 			qcom,cmb-element-bits = <64>;
 			qcom,cmb-msrs-num = <32>;
@@ -3815,6 +3824,7 @@ tpdm@6861000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_apss";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -3897,6 +3907,7 @@ tpdm@68a0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_silver";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3917,6 +3928,7 @@ tpdm@68b0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_gold";
 
 			qcom,cmb-element-bits = <32>;
 			qcom,cmb-msrs-num = <32>;
@@ -3937,6 +3949,7 @@ tpdm@68c0000 {
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
+			label = "tpdm_llm_ext";
 
 			qcom,dsb-element-bits = <32>;
 			qcom,dsb-msrs-num = <32>;
@@ -8590,6 +8603,7 @@ arch_timer: timer {
 
 	turing-llm-tpdm {
 		compatible = "qcom,coresight-static-tpdm";
+		label = "tpdm_cdsp_llm_0";
 
 		qcom,cmb-element-bits = <32>;
 

-- 
2.34.1


