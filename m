Return-Path: <linux-arm-msm+bounces-112579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D07UOV1BKmoRlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:02:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC2A66E5A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:02:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Piei8wFX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Tb41cWhf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112579-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112579-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30AB330309DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD85368277;
	Thu, 11 Jun 2026 04:59:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6866D35F5E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153956; cv=none; b=LXCZda8N/AqbymbyZYU75GVCBhLMc4xj+5gpuJLrQ+8pFhAsS14piXTdUZmYp0V6LodDz0//cIqPRxLdUtlmQoE82M57iNPt2vfzTIdpIiWJTU1dA8vIcPJyuhhsKTBWezmjZtP+xjRZ9ZaqjHHYa7xtg0WGWIIRow0T2knGHpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153956; c=relaxed/simple;
	bh=+8pvm0uFERW5lUAcvZeBTj7KKJ4hI33filK3T4PAcEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uA1cXJKAe3M3uw5qcziGoMAJaLRt6wGzNU/+6u5mn31Y+3tdE90DGgJKcjvY5jPXJxhcaFZ83mU6mXp0sJ8Q/2bIsUyHJWVU6QjXdVvXSuezscOXe2zHtqJxRhG+qTzplnQxjZAFHW7ZyNXq4znJSkkL9/xUef+umiNI4/nV5GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Piei8wFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tb41cWhf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NX863202805
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4xEgo8KFQzUOZK/g2YyAF9vBNnCJ8+gelSNfCLkmzQ=; b=Piei8wFX6wStO0Ig
	dqP9UIK8eTy94NoK3V98DpLsnJ8d5M4p2+1Tl25kT/UvB7oq+15Y9lYdTyTSQNUF
	FhXXCKk/bvmJwxuvxPtcGo3K0HzkcTrhBsaSSUQNdFddeT8u6/iO4WMFoFGdHsMc
	z1/YWs/ttDghbyc6EqsvSCCi8LrZsseYnCrCb3bY45xMWfVp97imJ7u+l4SxznxS
	HDDn2WVYi4lp4p8WSEas1PUQEN6Lir2UtHu1w727H3Jc9pqoB7xXKmfmdNWr5tRu
	Dq+A25N9JQn4xqcyxcSc5ybuzlp7iT/gH9jk8frCA+nrMdC6xrXPhsldXyInWvXW
	Sgye4A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6thp7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0a81c1738so43717105ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153942; x=1781758742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4xEgo8KFQzUOZK/g2YyAF9vBNnCJ8+gelSNfCLkmzQ=;
        b=Tb41cWhfbVgovccrZfpWGY1AMC13Ifi56SOt2wCiNFR29yKXi9Tx1eQOtNehj09Wk8
         +rMkKvo8bBA+0Y54BRNBSjM61PzawLhRAr+cXaguN/kcEluYaQP77SsTTMLtAXYanNRU
         XRE2i8aEk1ElBjfo4MwFLJqfyQV1EFuec/FLrAIqDAIX+XGcdOtdOi5xAL/LoYfx/x9n
         waeQfyvrZoyoTkCczwF87cCFN9RZxkaYfF2ER4+XvR9vQwNH4PBdgZx062Zc+b5D0HXl
         gtw9MwI0l6vfOQZ6kLEg37AHPLrnK5ZMPLb0cUebNXX7DPuU8EQ7BQseebpY9U75CTrr
         uObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153942; x=1781758742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m4xEgo8KFQzUOZK/g2YyAF9vBNnCJ8+gelSNfCLkmzQ=;
        b=NfLkDM23taIG/32ulGWnzXBGSRv4WnyRJkXOR2+c+/8M8rBIfzxsFEtb/MdetbUjcP
         anAXXbbrzPJxYJFoTVFzGEpQo2fiZeBr30dSpF6ZRAtTVA6LHbBRCsz/IItPGRLYDYrU
         KjcAm3/QIszNFkYIaWL66rWtgNCsU5L9QAEwqBuYuY2mTqVLg2ei3ui7arEwyjKs66t9
         LjZh2iA1yaUwB2lyPdIJ+C2P0J7Xjm43BptiLN3VazShf3SPXPaIso1tqEyDo4BDcBjv
         w6Yxn6OO7X4hYc0FBgH+NNW3ERf1ksCxLC/dPGkVH7tvXA9qwYVpdjvDP53M7ckWOHcD
         S8Dw==
X-Gm-Message-State: AOJu0YxSoblUmMFozoXh9voh3BnK3j4wkAxX21kmoFditBOYFoSQtkQZ
	77YSKjBRtkarBZ1mnDvG54mXLK3woO7guQAKrqbzsueMR/O1YK3L9KzVTCS7mPOxdG4XCYTPw8U
	/1a9X5OzUyVEXaXWpDHmu8AeNzBTFHE3wLmSRUoZXCsTXWfUt8ymMazzJZhuHqv5IHeT7TUoC2c
	nU
X-Gm-Gg: Acq92OEtehN6KMV8AmAV4YJuztiQ9uf9dtYSte8im9/oy1yUrJ8wxYE8mayncsT6R46
	F84zTEgVIojTxlNWx4ud6FcHEcMcvBLGetNlQ/Y32jG6zKiNWF9Zpy8pY4uyfvEKWyfGPMH2EN9
	QykXv5YLb4SKFb8lADE5l5n3MD8y0pgMvoMe3Pm/AnY50JzOTQZ72xAl3YUcHT4BwtPh4Tu0hUM
	A93kOGedMAcaBHB7tAxgAUvXNkCK9tWDD990hq3i3XZ7KPVKF6w4pAka7vDAj+QfhikPT11PRgc
	6A/FIrOivsESMEFi6EnYK1uiMiw8q5VpxZXb8QM0i3x9k2ESxVpO94bbgDAfjUB8V3FmueIkvpN
	4r1Le5gliTXX+rfu6YWrq5+1vC9K9TXaEmopATw+EzIDVKf8Z2w/t8xsmRbDe2Igp/pE=
X-Received: by 2002:a17:903:2449:b0:2c2:50c7:58a4 with SMTP id d9443c01a7336-2c2f21a17e8mr13890485ad.22.1781153941817;
        Wed, 10 Jun 2026 21:59:01 -0700 (PDT)
X-Received: by 2002:a17:903:2449:b0:2c2:50c7:58a4 with SMTP id d9443c01a7336-2c2f21a17e8mr13890185ad.22.1781153941369;
        Wed, 10 Jun 2026 21:59:01 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:01 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:38 +0530
Subject: [PATCH v2 02/37] arm64: dts: qcom: msm8996: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-2-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=1618;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=+8pvm0uFERW5lUAcvZeBTj7KKJ4hI33filK3T4PAcEk=;
 b=iI5CG7yXlGNMkrNHsE/Pix4KSaZG12sL2brN7x7z3n6VUgTrdpQL6BDticA3xYv35QxHRnqkO
 cJwe5i2BQfcDgBgVmx3NdQNagMpahZny/VdJpbpDTHMaeelTT7PE1GC
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX72oXLgC++27a
 xvjFqpwq+IIn+SBjnnfJKs2LbV4HEse3530T3EkTyTJWspFfFoPN5FrWwjvz0dJoU7Ggjn6iHoR
 4PxH5goXzXPZmSxbhHzfuqyW76BeSXMoCznTlymo858dpTAWCqn6LYJ8w3GfBUqkfX/udAt6Clx
 hzMh6MAaukLHTTYz1HMTMFbAF5ypBvZ5feugZjoYfJhXmjDhZCcf7nPAnEVQ8/C4ZWy5UranKku
 6q9zj1R3f8YpxGyNT+ZQAgH9svuE15BpuOwRK7gOUk1AmslagCrd2AHHPEmroT3bQgY9kK/O9uT
 s3YnM1IjijLD6oZYSNO92GV7HOFmlWj9JFTQdzM5avGjCQalW3Igmxf77dKM4gIhacefu7Bhahl
 SDW2Oc/sJF9DkyfQvIoMpYoH66aB0DY1SejoX7u49CUfrmRxMjVLe3MD/8EyKvPf7Rm9GDnS6Or
 uwi4j4hgM/268i+f+KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX511lYrIe/I1/
 DaBph5cjLtffKDN4B/mDhpGmMnVIEjHd1H8+k9cxhfN1Q6VZziRAP56vt+hK4UX9d4RNqvlzMeQ
 pjR3zpTrQnubvFditLgY7AbwMwq+P5E=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a4096 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: F855A1ftvbpVLJxc0DCPIqxNQRVTIEw4
X-Proofpoint-GUID: F855A1ftvbpVLJxc0DCPIqxNQRVTIEw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112579-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CC2A66E5A4

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index d55e4075040f..5b42c266557a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -192,7 +192,7 @@ &mmcc {
 
 &pcie0 {
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&pm8994_l28>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 77ad613590a3..2abcc733dad8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -280,7 +280,7 @@ &pcie0 {
 	vdda-supply = <&vreg_l28a_0p925>;
 
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_phy {

-- 
2.34.1


