Return-Path: <linux-arm-msm+bounces-94037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED0CBi2jnmlPWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:22:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A500A1934D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08C2330A0094
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE3422F177;
	Wed, 25 Feb 2026 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMEkYUoW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fUp4nUQM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8812E0938
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004031; cv=none; b=G5Hyw5+G/0tNCxhDtX6PM/dE4mUQEPdx6P1dwqcn5n4hO0tbyl3gfoEImkNyDoJxSmXAFaO+JEOradOOl+03v2Sj67BOH0vZTSyVf/KO7TyBn8pHOXnoIfWcrVfrv5YC5FYoXKhxI26v0kTvb2jXxVAelc+GdRUy0IL8p7NZdzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004031; c=relaxed/simple;
	bh=QeXv5QhcjW9e3PGF26jUwAAbWZlI9ybpYMc7vtWT8Zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PHUPzPntC9DIaqlePp2NVt2nHmNY0jylGnx9P5REo7gV6qifShtCcIYsdSoK/Z0+6y3l95YL69KuwhDIZIClXadtRemF7ZyJ+OP4kttLUmCovYc9d4Y39EWP2b3vvGC9k4tpldSKUiKKyqjIbOM4ZCZAsisq/q/nFVYCcgJY/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMEkYUoW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUp4nUQM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P20RAY3660279
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+sm4Pd2kREBN9DxViiBfCb5Y7V/sx8AZjzpaQtUY+w=; b=cMEkYUoWCHf2Jhtg
	gSz6x6IgZuVQB1Tt8pF/EUBptP8lTBzFj3CAwrYrUO4PU5w5EaKrJHxsbOAhVtAj
	VJoKebFwHgi5qlPcrkluT+N1LR6KZscXrP4ZdvwsxMXHu1B4mo9tXz2E145cc8IV
	EVdZKXWZbJ/UpY8OdFCAZI74KOmJ/cbF5SW702ebVaFr2Cm8LZAWuzlx3Q0ygAsb
	c5WkKYurUs4R7tgZOfe4Hl0mmWpgbqBA8lGrKIOp5ZjOj+v7xOv4wxNap1s3/K6h
	a8GOJ9ED9jM9jJQWTutRwKVDCBKk1aWcMryQhXVhNq1D7Qmp1P6AHtuJQJi9Jozu
	X3MF5g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1saakd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:20:27 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d1902109a9so60736845a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772004027; x=1772608827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+sm4Pd2kREBN9DxViiBfCb5Y7V/sx8AZjzpaQtUY+w=;
        b=fUp4nUQMCaYYxMjMxer6YTgTBTmB6jkLmIEIf8LeITDUTbFzhNiirCGaqTKVCID0gV
         RhXneztpWSZLzKlscmsX2Cqoy1bvAOXb57TIBojYhhS82UWJ2kRy96CaR56GsDDNQJC8
         uRNw9rt/JiFXlqyyI5gkilYQ9Ut/lE8iFb2Tg7jR84/zSt4nGrFduSI7U+x7LZNXc6zJ
         uHXFRfbsVQpxfzXq8bJ6TvihLDlse7wZ/VHfmuVuSIc+lRiwKpOY1JpPA6QVFEVomURF
         NyYtjG8n1Wn76Yo4ziMZHtESv0VTKEX3lEL+HNFWn/RB5bQw8oLrSI/zu9BHk+WO9NWA
         /7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004027; x=1772608827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A+sm4Pd2kREBN9DxViiBfCb5Y7V/sx8AZjzpaQtUY+w=;
        b=DdZNHC9JTaBBpVded4L0VKplEE+gdX40I+96bXsf8JqBmabMtFLEXRt+v9NuPrrQwA
         hWRR//Ept3p7iDywC/Kaxra+xIZhysCsyB/n9uXLCTcg0OmVX5CoYAo+Wvt/htLt2tgy
         VzCgrglShVx+gvKTdbhT6Z0OA0CBpXpNyaLwKLUuh8nwSOGg35C+RGQZKUvzAr6jppk5
         4bORoAi6myjPGFfp7rS5Rb+BJHuWBJbhlgUTlIbdB70CXqi0BMLm1gAZyVHvD7Ztemsb
         wXdhnROQtTWDlSkGPacZGQYYtF/ElYVFXuZlG81BZQZBiIAwCFGNbHJNhR2u2EKOIgkn
         o5ww==
X-Forwarded-Encrypted: i=1; AJvYcCUKN+ZcLtMfkCcXwo3FYSehJOBMxlqzTuD4aJQTV51oHJNUOhwsUo/5AmIYMLsAoXuszUei4SaoF5XfvIy8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3AZmbAisUMbNDeUjFQpPwJ/6yDRJwIx8BJTE2s6MURGO7/XW9
	logym7V0OsWpPQLR79jk537/DKRmCjeId5tq4fastNiOb3FRFtwGXubeuQqO2kiDBOD+MfTBhl8
	zugKESunoRUNgoqD0V8XzRrpbqdIlkIqKjRJOksz3fWCWxuV2Bl7Nmyal5ybhmVY1GElh
X-Gm-Gg: ATEYQzxz6jJxMrs1FiEJ4wjxvnUP8lZ12FjN3EGO3jE08mU7Aw54f3IkZOTLAO18RzX
	fA3TZq3QtxOnxNTp0PBO//ggWYn1AuFMXJNgvrL8+45Kd4LRCsDKMJAAEtt2f2VFKJE0qVHPgl0
	m3WUOrFvVHddkf4fEHQsnMRPsp9aqr6diEXlEBz0/ci9I+nfHwVLsBQQ+w9sE2erArWB3+y9bVI
	WK3kSI1lE6ZccUxVsCg3x3At1YeBuSIkbCRNplEG82Ty4U3F8qCxIagyo0oysQ8Exfr/zErSEZK
	6mwdnZpNNo4TccneEq8qMsr0ytTwfK1LBJxg8dSlyoMiUqt03mjY5Hdh+iLkiZkfHuwZ9DAZJze
	vVz137S+7+imipolF8m7/8iRgxDlfPjzlrL5ftFJtNdz0MTJ/tl5vIyr15EM+2oqjGkZqSd6r
X-Received: by 2002:a05:6830:2a04:b0:7c7:b4e:edb4 with SMTP id 46e09a7af769-7d52bedf29dmr8946490a34.8.1772004026635;
        Tue, 24 Feb 2026 23:20:26 -0800 (PST)
X-Received: by 2002:a05:6830:2a04:b0:7c7:b4e:edb4 with SMTP id 46e09a7af769-7d52bedf29dmr8946466a34.8.1772004026129;
        Tue, 24 Feb 2026 23:20:26 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52d038dcdsm11711730a34.16.2026.02.24.23.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:20:25 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 23:19:18 -0800
Subject: [PATCH v6 03/10] arm64: dts: qcom: kaanapali: Add TSENS and
 thermal zones
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260224-knp-dts-misc-v6-3-79d20dab8a60@oss.qualcomm.com>
References: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
In-Reply-To: <20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772004019; l=21820;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=57BK10vrSKxDmNIb15WOBEDGWrb50WLKstLYTMBM8Qg=;
 b=k2DR4fXM935d55nFj6EGV8vtleStbV5gADduNH9msw8f+ZG4Db+WTjcxLFVmKrFilBfuIv089
 nfZRt5JNMxkBqFPGAifjb8nXhlU6vxeNc8fKX2C0G3bvlbXxgonKglJ
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699ea2bb cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gpPq06xVYaF9EkK19g8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: qKMiPDHT2KZMdfB68TQL5Uft1NW3a0sM
X-Proofpoint-ORIG-GUID: qKMiPDHT2KZMdfB68TQL5Uft1NW3a0sM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3MCBTYWx0ZWRfX3yXNMPCJyDbl
 5YeHYxLutUjXyVWYU1ukxs5B/OWsddDv+BYkn6srqz67zQlbdovJ77vCodG+JJgyZEuwjcn5o56
 l0yFlybXoEe+68UXGbUXCa6pgnREOJ7S+47GvTUA4pQ1xadpaX5nHwl8/gRXCJLccENExFR8f6R
 y8IFRk3GsSeuB+E2aLUPC4/3/bWMrMAc5/ggrRdOzKUDX5cNzdgMmqgLV4XmOc1M6GmbPykbG50
 cZvGZZ3pI3r6M0VCIIAGyTAVaH/16gnKcEMoCztPOHrgbL7gucpSBYiivV8eBxjnLUtKhJNYpmp
 jLIWPoqz2WWSsWHI1DwCRcwfkL2gLh8bZSJxgPxqQjyODv/bQTN/tyLpNsw6PvkU0BuAMgTqkgN
 Aj9/Do/FnQE7NgfSzvlQIfzheTMxybAlBVrH0eAbCg0Td785pxuNLyQRbefsEeynrAQoCi7/xhb
 PpRLa1AjOOns3M3l2Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-94037-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A500A1934D5
X-Rspamd-Action: no action

From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

The Kaanapali includes seven TSENS instances, with a total of 55 thermal
sensors distributed across various locations on the SoC.

The TSENS max/reset threshold is configured to 130°C in the hardware.
Enable all TSENS instances, and define the thermal zones with a hot trip
at 120°C and critical trip at 125°C.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1075 +++++++++++++++++++++++++++++++
 1 file changed, 1075 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index df05d204ed41..251e36cf7477 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2583,6 +2583,90 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		tsens0: thermal-sensor@c229000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c229000 0x0 0x1000>,
+			      <0x0 0x0c222000 0x0 0x1000>;
+			interrupts = <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 484 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <5>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c22a000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22a000 0x0 0x1000>,
+			      <0x0 0x0c223000 0x0 0x1000>;
+			interrupts = <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <12>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens2: thermal-sensor@c22b000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22b000 0x0 0x1000>,
+			      <0x0 0x0c224000 0x0 0x1000>;
+			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <7>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens3: thermal-sensor@c22c000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22c000 0x0 0x1000>,
+			      <0x0 0x0c225000 0x0 0x1000>;
+			interrupts = <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <4>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens4: thermal-sensor@c22d000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22d000 0x0 0x1000>,
+			      <0x0 0x0c226000 0x0 0x1000>;
+			interrupts = <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <8>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens5: thermal-sensor@c22e000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22e000 0x0 0x1000>,
+			      <0x0 0x0c227000 0x0 0x1000>;
+			interrupts = <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <12>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens6: thermal-sensor@c22f000 {
+			compatible = "qcom,kaanapali-tsens", "qcom,tsens-v2";
+			reg = <0x0 0x0c22f000 0x0 0x1000>,
+			      <0x0 0x0c228000 0x0 0x1000>;
+			interrupts = <GIC_SPI 545 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow",
+					  "critical";
+			#qcom,sensors = <7>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		aoss_qmp: power-management@c300000 {
 			compatible = "qcom,kaanapali-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0x0 0x0c300000 0x0 0x400>;
@@ -4795,6 +4879,997 @@ pdp_tx: scp-sram-section@100 {
 		};
 	};
 
+	thermal-zones {
+		cpullc-0-0-thermal {
+			thermal-sensors = <&tsens0 0>;
+
+			trips {
+				cpullc-0-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-0-1-thermal {
+			thermal-sensors = <&tsens0 1>;
+
+			trips {
+				cpullc-0-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-0-thermal {
+			thermal-sensors = <&tsens0 2>;
+
+			trips {
+				qmx-0-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-1-thermal {
+			thermal-sensors = <&tsens0 3>;
+
+			trips {
+				qmx-0-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-0-2-thermal {
+			thermal-sensors = <&tsens0 4>;
+
+			trips {
+				qmx-0-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-0-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-0-thermal {
+			thermal-sensors = <&tsens1 0>;
+
+			trips {
+				cpu-0-0-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-0-1-thermal {
+			thermal-sensors = <&tsens1 1>;
+
+			trips {
+				cpu-0-0-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-0-thermal {
+			thermal-sensors = <&tsens1 2>;
+
+			trips {
+				cpu-0-1-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-1-1-thermal {
+			thermal-sensors = <&tsens1 3>;
+
+			trips {
+				cpu-0-1-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-0-thermal {
+			thermal-sensors = <&tsens1 4>;
+
+			trips {
+				cpu-0-2-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-2-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-2-1-thermal {
+			thermal-sensors = <&tsens1 5>;
+
+			trips {
+				cpu-0-2-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-2-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-0-thermal {
+			thermal-sensors = <&tsens1 6>;
+
+			trips {
+				cpu-0-3-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-3-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-3-1-thermal {
+			thermal-sensors = <&tsens1 7>;
+
+			trips {
+				cpu-0-3-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-3-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-0-thermal {
+			thermal-sensors = <&tsens1 8>;
+
+			trips {
+				cpu-0-4-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-4-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-4-1-thermal {
+			thermal-sensors = <&tsens1 9>;
+
+			trips {
+				cpu-0-4-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-4-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-0-thermal {
+			thermal-sensors = <&tsens1 10>;
+
+			trips {
+				cpu-0-5-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-5-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-0-5-1-thermal {
+			thermal-sensors = <&tsens1 11>;
+
+			trips {
+				cpu-0-5-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-0-5-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-1-0-thermal {
+			thermal-sensors = <&tsens2 0>;
+
+			trips {
+				cpullc-1-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpullc-1-1-thermal {
+			thermal-sensors = <&tsens2 1>;
+
+			trips {
+				cpullc-1-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpullc-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-0-thermal {
+			thermal-sensors = <&tsens2 2>;
+
+			trips {
+				qmx-1-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-1-thermal {
+			thermal-sensors = <&tsens2 3>;
+
+			trips {
+				qmx-1-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-2-thermal {
+			thermal-sensors = <&tsens2 4>;
+
+			trips {
+				qmx-1-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-3-thermal {
+			thermal-sensors = <&tsens2 5>;
+
+			trips {
+				qmx-1-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		qmx-1-4-thermal {
+			thermal-sensors = <&tsens2 6>;
+
+			trips {
+				qmx-1-4-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				qmx-1-4-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-0-thermal {
+			thermal-sensors = <&tsens3 0>;
+
+			trips {
+				cpu-1-0-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-0-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-0-1-thermal {
+			thermal-sensors = <&tsens3 1>;
+
+			trips {
+				cpu-1-0-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-0-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-0-thermal {
+			thermal-sensors = <&tsens3 2>;
+
+			trips {
+				cpu-1-1-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-1-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cpu-1-1-1-thermal {
+			thermal-sensors = <&tsens3 3>;
+
+			trips {
+				cpu-1-1-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				cpu-1-1-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-0-thermal {
+			thermal-sensors = <&tsens4 0>;
+
+			trips {
+				nsphvx-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-1-thermal {
+			thermal-sensors = <&tsens4 1>;
+
+			trips {
+				nsphvx-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-2-thermal {
+			thermal-sensors = <&tsens4 2>;
+
+			trips {
+				nsphvx-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphvx-3-thermal {
+			thermal-sensors = <&tsens4 3>;
+
+			trips {
+				nsphvx-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphvx-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-0-thermal {
+			thermal-sensors = <&tsens4 4>;
+
+			trips {
+				nsphmx-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-1-thermal {
+			thermal-sensors = <&tsens4 5>;
+
+			trips {
+				nsphmx-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-2-thermal {
+			thermal-sensors = <&tsens4 6>;
+
+			trips {
+				nsphmx-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		nsphmx-3-thermal {
+			thermal-sensors = <&tsens4 7>;
+
+			trips {
+				nsphmx-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				nsphmx-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-0-thermal {
+			thermal-sensors = <&tsens5 0>;
+
+			trips {
+				gpuss-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-1-thermal {
+			thermal-sensors = <&tsens5 1>;
+
+			trips {
+				gpuss-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-2-thermal {
+			thermal-sensors = <&tsens5 2>;
+
+			trips {
+				gpuss-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-3-thermal {
+			thermal-sensors = <&tsens5 3>;
+
+			trips {
+				gpuss-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-4-thermal {
+			thermal-sensors = <&tsens5 4>;
+
+			trips {
+				gpuss-4-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-4-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-5-thermal {
+			thermal-sensors = <&tsens5 5>;
+
+			trips {
+				gpuss-5-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-5-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-6-thermal {
+			thermal-sensors = <&tsens5 6>;
+
+			trips {
+				gpuss-6-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-6-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-7-thermal {
+			thermal-sensors = <&tsens5 7>;
+
+			trips {
+				gpuss-7-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-7-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-8-thermal {
+			thermal-sensors = <&tsens5 8>;
+
+			trips {
+				gpuss-8-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-8-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-9-thermal {
+			thermal-sensors = <&tsens5 9>;
+
+			trips {
+				gpuss-9-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-9-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpuss-10-thermal {
+			thermal-sensors = <&tsens5 10>;
+
+			trips {
+				gpuss-10-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				gpuss-10-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		ddr-thermal {
+			thermal-sensors = <&tsens5 11>;
+
+			trips {
+				ddr-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				ddr-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-0-thermal {
+			thermal-sensors = <&tsens6 0>;
+
+			trips {
+				mdmss-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-1-thermal {
+			thermal-sensors = <&tsens6 1>;
+			trips {
+				mdmss-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-2-thermal {
+			thermal-sensors = <&tsens6 2>;
+
+			trips {
+				mdmss-2-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss-2-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		mdmss-3-thermal {
+			thermal-sensors = <&tsens6 3>;
+
+			trips {
+				mdmss-3-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				mdmss-3-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-0-thermal {
+			thermal-sensors = <&tsens6 4>;
+
+			trips {
+				camera-0-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera-0-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		camera-1-thermal {
+			thermal-sensors = <&tsens6 5>;
+
+			trips {
+				camera-1-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				camera-1-critical {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		video-thermal {
+			thermal-sensors = <&tsens6 6>;
+
+			trips {
+				video-hot {
+					temperature = <120000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+
+				video-critical {
+					temperature = <125000>;
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
2.25.1


