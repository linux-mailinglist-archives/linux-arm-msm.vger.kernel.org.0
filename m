Return-Path: <linux-arm-msm+bounces-108041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPFqBqDXCWossQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:58:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9016561CB9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF8A43030B0A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 14:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B733BE15D;
	Sun, 17 May 2026 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKe5JwZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+lTDsPr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3783BB108
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029791; cv=none; b=SJvZ1btO+BT+7d+gC8hKb7L8o0OQgjvn5UM8bIq4Q55ej40c5CofS7Fi+zz/mkqSc0EeBL70JyFuuzVh/Ev4Un/kETG5VQxcNswtkCHN+RqYeFgsm2lLEMw0s27Qs/t0Z8PMKTbYR2DCPKw+aBEWtsskLzjRdld90yiZtfx4ZBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029791; c=relaxed/simple;
	bh=OkMJk2UZdqsfwML4gWT8b+0oonjMBR4XttEusVBSu8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dpIzJ7Rwn1LLScBi3rosinxLK7sR9q4UhBPSWVy/RwTLXA1gK60Wh2sbSM3gu0hHFwFqdV90WfBtAC6NpaSx3i87FrtWRyrRpMzPkIAbmJsV2rB98rR/dSOPWfH1rGfRqNOlF5o5McFbHOYoEh9cZ6y77+x0src4rv9yZ69ZVdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKe5JwZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+lTDsPr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HEUCfp172004
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0gcIgbF6WAqLUgtaoclc/9ivYUJnxqKKqAe/NNfONb4=; b=YKe5JwZQJewGmRqd
	RwQ2qTTvLm6X10Y6lRs/MKPEs2HbQUPglBYNZxzrdlrg/EYuF6Tqkkd2PyAScTvd
	Zo6EZq/zTba5w14RqYWrdTa8I6mL9WavBB2swygbE5loBT1iTw7PdNEXUeKbsSaW
	TMW6UOlyFPjgo+v0+ssN1krGzA1Q7p8ghVnYNWo5kuthVvx+YpXJaWia0HE+X2xg
	WilzMEj3g80LMUUbX7m8lhsXzI+JDKzlAcmVd7jHC8+Q6gIqNsY6MDkRAZFeh4UK
	HNsBqhSKeGknbcxmHoGTb2IOlpHRmaVEdsZU99K4MB/cHIQPmQ03qZy6Z1wlejog
	j77cjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g30f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fbc70cfbdso45233441cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 07:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029787; x=1779634587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gcIgbF6WAqLUgtaoclc/9ivYUJnxqKKqAe/NNfONb4=;
        b=L+lTDsPr30OSv1CZuDVhglJh+SBOyzkofPd8oZRhNhRGtb4AAjXDVSyGrtQXEMMVPS
         egHJJ8Bt1qvDSbbaTagtFKGwwUJm08g4o9A4lRF0iGZ6e7mXOESIFkcULLoC3Er1+Y3U
         R6NM8fA0I+DmfpbAn7CbMQmeoHz9FrGtlWCfJhCnJNvDpuqf4/k1NarYsR81w3ei8n2W
         OVkjDcEvVJ8dgVb3LwgcZ6vDM2OGz4lpQnryY25TlH/mJWCWJBrUtzYaTxAXrqjvt9dc
         zMMgd7Xtx8nW8B3GS4t5TS/ERRHRdKdfzyIiNB5AJ8Q1I9xlUvIMgImPx6r2BXnuCn9K
         Wtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029787; x=1779634587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0gcIgbF6WAqLUgtaoclc/9ivYUJnxqKKqAe/NNfONb4=;
        b=C7+smEu/pTuRZEud5pXbM9Z3fdQWpbIPUTi1WfhP/P8JhdOdw/FDEtGIZBtnuXJVoO
         k12qF7SoNoOo5MP9o5jJgIXqTjXj7O4dh1z2YF4rtY9lzJmxqomZPPZB88m0mbwNydrN
         0elUZFoV7AMFbIA+PKYwLZQ24cdGTwRgS2f5hfpKDlJAv7Z+KLc3Dw2n39xzFu3/wdyQ
         u/szxvajDY1LX5Yp8QCTrYf4oZm+//2OCQSb9S5t9Wl0k0p2v8q7PPYChISo4NIDvLOe
         K64PZXVTuZvEVeb+4ESd88+keNhvOo0z6aoeCtqeg6BSRC3ttCzkEVX4bfiMhw7t2wM+
         y7MA==
X-Gm-Message-State: AOJu0YxdsnpWrs1r8QZpcTvc/lfU8pbQ5bOfvTrGyni2mp82fSvBEWt+
	oiXiTrskLilohc1191QTqCu2bOx7Rf3gFbwQCxNygNMDmJ+Hph6wHHDNqLz3hq8kXj9enyggRuG
	xkQlbbeOV12ioOu5BxapUutsYlvtckY2Un+bYdsSbn7iTo7flhPg96NLWFGRpHWROnyKm
X-Gm-Gg: Acq92OF9e3Wqqw5q98yOmBQb5hj68M/o7kag7mBORH8DNSEetzC7AMQDo271zHT6vNZ
	u6lM+nPqJm5ZnChC9putYRpgxtziWjoMmTYOeS/C+upNN1f9BwO6eIGviH7ruMx6zRPQm0wBeBH
	gd0obhkf7nEq4TooBw2isDLRniNPDGzofqQqDOjFEogFR4iw6Tyn3nH3P5mtKhcjfql+QtT8Qk8
	GfF/OsHJPt4cz1Co1ak8bMCw7YKhW6RmjfxEsJFsCDZbc5jre8TrLR1ZIKxS4R2N9WHaHwTrdxF
	+QUGvulJqVvR7MKhY2NaCS+9BqWS2rbUXpQnUpTCXj6lEL27xyBiDs1HJ1uVEZAQLlkOLb+V3Us
	s382MN2GX2my/mM9x9XHfQy/PrKGeiHrRQOtkYIBgvdytN3vqKT7JftNV+SsnKATiVrx1YD1qBK
	WQ6Q6vQ9rTumvK8AMhq+R56EuZVeZE/uLJAfk=
X-Received: by 2002:a05:622a:728d:b0:50d:7fe9:aa8a with SMTP id d75a77b69052e-5165a1e6539mr113479431cf.31.1779029787127;
        Sun, 17 May 2026 07:56:27 -0700 (PDT)
X-Received: by 2002:a05:622a:728d:b0:50d:7fe9:aa8a with SMTP id d75a77b69052e-5165a1e6539mr113479241cf.31.1779029786670;
        Sun, 17 May 2026 07:56:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:56:11 +0300
Subject: [PATCH 5/7] arm64: dts: qcom: sm8650: consolidate IPA properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ipa-loader-v1-5-3c3764c1b4a3@oss.qualcomm.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OkMJk2UZdqsfwML4gWT8b+0oonjMBR4XttEusVBSu8w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCdcNsxjpeKtTyB3Q4IQT3ykKYkOCwEvXkdAJD
 u2o61TLwKSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagnXDQAKCRCLPIo+Aiko
 1T+BB/9S042rxC1RxG1Tv8WYXsTgfHbBT31o2AGaLo1EvSCgGLLF165KTNAPWkVeHYt2EHZPkOR
 egCWw949XpT5qAG6Nv52dXX8gFUsTl1AacVGT3w1IM0KE27HyPKpOD8ZvSUZBlD6umzFJm9cwSt
 ejJKWs2te6IGouRiOuyCFpkbJi3Dl0jjA1gtVKH63zimbB5BrfSNY1OuaJTLEzg2yNk2xFvK6Rw
 zvIJ4572sgOa6ly3CMHt/K/Mz5960yoVukwBHcefZ1KlnfCykPg3gr7Chuf3qU3QbCx8rsOT3+M
 U3gohWCjrbT5uAkazbwDYB7SNUSDVhVlXSX+UkyJlMCfPZIR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MSBTYWx0ZWRfX290CzOfsbND1
 Sj0uaYoYil6tlDjT0eeY56MRdN/V0t7YrbWB+kM7wLgFzOQuyc+uuhCYz1vNAoZ2/PpvNSydTvY
 tGe3bJ7SS1HsUgb2zsDbeoDdEmQwgxiqFVgeZY4lv3Ddsr4v2XOSbXrGLtyrX8k/1FAPQNnBV+0
 Mbi98jJUVve5OOAk7hUEXmXRqBSvhoZcL4jacnfncIwVrEASCUI0l6prws0S+aEdc8WQ2c94EHw
 IBS+fqaD0anDbhZyCFd66ALLWPwOQcESAEfKMLz4pdK66VuvolgqcSuwSRadXzZDIpRsRKDSUmp
 gmAOZqyZ8j4fL2O/CMAInLlU2MBtOP4xVg/qCsYrn2Cqv4LXcxExKXfoj8cg2qGEmIPMw8/HpO2
 98RJgfgqRPkrNTZMIzkr9OXmobEpw4/zTADJGh9SyipqFHqmDu7trnNSKDN7l3GsoITk4xLbQv+
 BbH5jM98AYW/bVatXEg==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a09d71c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=oHYOqaEBOIRX3F0Q_xUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: IZ5FsFjLkEtQCbJ52pxfppJEnAAOnNHz
X-Proofpoint-ORIG-GUID: IZ5FsFjLkEtQCbJ52pxfppJEnAAOnNHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170161
X-Rspamd-Queue-Id: A9016561CB9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108041-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Move generic IPA-related properties to the base DTSI file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 3 +--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 3 +--
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 3 +++
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eabc828c05b4..80bd2437f154 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -888,9 +888,8 @@ lt9611_out: endpoint {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm8650/ipa_fws.mbn";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index a3982ae22929..a28d70c85fa3 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -861,9 +861,8 @@ redriver_ss_in: endpoint {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm8650/ipa_fws.mbn";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..530fd1e6cd85 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4393,6 +4393,9 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&ipa_fw_mem>;
+
 			sram = <&ipa_modem_tables>;
 
 			status = "disabled";

-- 
2.47.3


