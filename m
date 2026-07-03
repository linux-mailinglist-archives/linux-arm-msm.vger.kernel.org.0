Return-Path: <linux-arm-msm+bounces-116315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vK9XEQyyR2qhdgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:58:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E98A7029AE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:58:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HsKBkQH5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VRwOVRD6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116315-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116315-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21A1A30EDF1A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7EA3DDDB2;
	Fri,  3 Jul 2026 12:38:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1953DD871
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:38:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082335; cv=none; b=fRXRrnodtNbrBSsA68DyOANIFAd0sLN6YHbPhO6ZVVx0Y4Dzr5mWF2I492tZIf680cwT/2XDmAQpKo9ZEEZ3XNbo+y7ljNmWhe4K5t2EKRrmosAxvXjvlE0FjUB/GuEGIRabTXa9AiTuXp9kmZ+9rZRha/7bc/OQWvSMGErYF3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082335; c=relaxed/simple;
	bh=LfgTEYQGzxZq560mMTimn0qwbTsn9CmT+QlxLef1Kvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rnS4ooTbYcsGAO/azsqMyDcx7ggh+GSjGBmF7iKooCb/5iV9NZBflzoOiOuG3WR5UAEqPjbzuop2wCwJxT2bhSlW/zqZX3mn3ll3Qm9fr3eYTtN//vj46jzX3eqMaWQu8PQrsbE4jt881TGzgDayCQmefqHpbyidWCS+C7G29DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsKBkQH5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VRwOVRD6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663Bqh5C4091002
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 12:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hGQEyI4vrNbgOfPyY39YCrobQ0YERCOeu3mXSGdPmQ=; b=HsKBkQH5A0bwrfqa
	d3nPa+SoJEKkQVCgp6gZAxmMJ6wzJgSA+//6TjF/qFL8YDX/F3BZe3N3e0RLehsd
	w0vvzblCl6uA7pk9yBo2W3MxTuZn0/7FpT8qPECDgn1UrS9u35wosEUeFZKwt42G
	cM5dREUsYLTUVe2PuSp9gLNEK2NBDf2f4uyaPFpn7X1OL2QaUFlv4GImiNYT78so
	PP3QB+kqeughwjJnUpsCfLPaftR34uLYJXZt7suZKMeHXsHeW96oV3XSHptA1Ps+
	OMAMSANcjPQWCJoKyTX5fCXHDQq2f8djsI43r0wKizIkXW0jwqy6AvDF0q4ys5NN
	Tf/4HA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj0665-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 12:38:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8894570b58so450887a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783082332; x=1783687132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hGQEyI4vrNbgOfPyY39YCrobQ0YERCOeu3mXSGdPmQ=;
        b=VRwOVRD6H9vzu8roOtXDLT5K9ZwVucHTRPXYhU7N6La+d4eg9XS3QVN6+6V4MDzTPD
         AiYGQr8BkFHIQi2lC+9MzSdtSeAuDw1Ok7EtMRjjMSS7h9o82GZz0jiETwE2Vr16aZwD
         fCOZm5+Ix8EpixTmMpMplhDL2qBTzJuncns2gu3eca4xil5qRG8GuedwDrnrM8mfO5sU
         g5CnwrJhh+HWM7JAoUmspNkK9TijTEN/Hbdn508vKkHhsIU0lKa8m73TWCJZLI3sqlqJ
         mNnbrdSmfq1ExEzmpidINzRafsDgwhWp/eC2zypfaI5EXuteQ+5Z7aQ7YWBgFO6LkE/f
         UkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783082332; x=1783687132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hGQEyI4vrNbgOfPyY39YCrobQ0YERCOeu3mXSGdPmQ=;
        b=G/6z25tyyqJgJeCgQZcE86L8fsuyoBE2tcHeFltTnOZujefp7+iTI8JM3lU0xwWEgn
         q/HxWN2hlJzd5nFdXf8LxzBVZ2tUidKg5kZaDYeqTPUkBQtRagc/fAm6/3NhdYVpHTjK
         oLRkMRIbHSrfAWsOlz0KbBUlRymgAKG7FEORJFepErY82IH0Uxjdvk9eb+YInTQ6/+iZ
         drH53trCklz2kRrTSRorGT36vAemcf9frRKbBt3BKWujVc0qW983XsGgTp4AsL1Ifjom
         uTZy86AkcnOKvjHNhvXEI5ei0Iksgx8ph/CL2GLqeEyd8KozwBSOnptGmNT61sFT73yX
         dlWw==
X-Gm-Message-State: AOJu0YwVgkv+jo9+UoQ6kpvPnABm4uLJP39WnBp6qncmFbfbSB/bhOFW
	YTAwDCMSgvdzQnvORhHMPMTTm1foffJPj7CMsA4rWx+amhd5YvlErdoTx7qp7ZFnw0mFQJuXGoq
	uGXbetW/YKI/67+T9rPST5SYsf8ID4kdkE5/gulp+Vkls0GclL+BPKRsIeThaNdE+PwnF
X-Gm-Gg: AfdE7cl3opTdEluHOpkEFIdSey6jaDKZftkvy7sip7+SVcJ45YqJV57rvckDKVVcyC/
	s0emE2fWLVqFqskmbRwhO2rNhG48z68N0sRqjsYo4iqHKi1Q9PlRVfcTw5avGEwcWpIfN/M2y6Y
	3TcGEV/s+U4XFr6cA1gGVesVw685fV1/R/l2EEvX0bZUC+GpIS0L3BmuGwZk+Biyvqsj9bLv5UH
	08mgpLtSCbh8v1JFenYpT1SX4Z1kChR/YcjN/Y/Tuq5hInWzlRsY1eUTyM4k3j2cjTsALV3lIpC
	WaNbXjQvGuqYzxe/ENq7x67zFTLFN7bNfFX3mWa1aUErCTyUZpL8Sc1xxUx/tqolItKLGZs4mE3
	LDNyKMlJ4/fd4XSbOe+gXJieautLW7+bAITd2RhQIPU3cDA==
X-Received: by 2002:a05:6a20:c98b:b0:3bf:d1f9:b1dd with SMTP id adf61e73a8af0-3bff42a2d00mr10861092637.44.1783082332019;
        Fri, 03 Jul 2026 05:38:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:c98b:b0:3bf:d1f9:b1dd with SMTP id adf61e73a8af0-3bff42a2d00mr10861060637.44.1783082331504;
        Fri, 03 Jul 2026 05:38:51 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm24356993c88.12.2026.07.03.05.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:38:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 18:08:31 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-eliza_evk-v1-2-7624440bd76d@oss.qualcomm.com>
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
In-Reply-To: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783082317; l=4277;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=LfgTEYQGzxZq560mMTimn0qwbTsn9CmT+QlxLef1Kvc=;
 b=ZghlYOOdL8qLNSY/3dzJK/9ZXM3EwXZhYeRvoh/RDd7kbo8Vh8yNcLgNo69uegtMI6U7VmxxW
 WjRfGEPvDxrDRinFnWixKBnC8xqNsmNst+AIdCd9Oep/3XwTwRIO29V
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyNCBTYWx0ZWRfX1bp5IzKtnAAq
 Xyh2GjeMDI9E3hpkdhtEeFJLyTs4BbfyaUYIoENbjVFUpGholnCVER8xLCT3gfkkhMXv+LkGiRB
 1QCNqtvVROmXni+u6cbrcIgI0wmaABc=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a47ad5d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=xTuWgevKKEmUOcCBws0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 8tJxPvKTjULEAAkf5keMAy7aa6P-FWIz
X-Proofpoint-GUID: 8tJxPvKTjULEAAkf5keMAy7aa6P-FWIz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyNCBTYWx0ZWRfX3/OFQcrqtpbY
 Zg6oK9Q0j5RNYGrdT9NF6Jh511OdL5kcTUiyaRSC5jjGThQJTk74YEEYJKTku8qy/D+TxS+jaU2
 IiGE34wmvgmUJTBaU1ta56fhNgF8/sYuZbihuR5R+AcAnRgT8wG0YOgXD2QpRlucu1Rq62merqe
 GH4eZIu6QEbxBMSqLU0o9S+Zmhvb5sHMnhL1MiblZyUBlx/KmyYNjhcukHgslQ6NE0jRk7bMKm/
 l+ZKJYM/25VoBNP0xdD8IYHNpsmQEmOMaGcQMXtTVTLRz1ILSJC03vI1SSHmSiO2nXWuXPEGpV/
 FRODSlCNwpUzfxGPtLy6KQoFYUg2fV7HYTWp8B34O9XM6PDLTRdxo+3C+Dww4fXu/lS1SLZL9YM
 R2NrZEyDt4+4yN4AbSYFT2Y3kHldc4I4qbR+nR3u9SdnRW4zEwF6BNfFTsfQ2rRSk8TcMjNHhlT
 01d3tJf/DH8NvOKH/tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116315-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E98A7029AE

The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
PCIe switch. Enable PCIe1 and its QMP PHY nodes.

TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.

Override the base iommu-map with the expanded set covering all the
switch's downstream ports (0x1400-0x1408 SID range).

The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
from the PCIe controller.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 141 ++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index ba41dbc34b81..c2afb8372ab7 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -12,6 +12,26 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	vreg_0p9: regulator-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_pcie_m_3p3: regulator-3p3 {
 		compatible = "regulator-fixed";
 
@@ -102,6 +122,104 @@ pcieport0_ep: endpoint {
 	};
 };
 
+&pcie1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_default_state>;
+
+	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
+		    <0x100 &apps_smmu 0x1401 0x1>,
+		    <0x208 &apps_smmu 0x1402 0x1>,
+		    <0x210 &apps_smmu 0x1403 0x1>,
+		    <0x218 &apps_smmu 0x1404 0x1>,
+		    <0x300 &apps_smmu 0x1405 0x1>,
+		    <0x400 &apps_smmu 0x1406 0x1>,
+		    <0x500 &apps_smmu 0x1407 0x1>,
+		    <0x501 &apps_smmu 0x1408 0x1>;
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l1k>;
+	vdda-pll-supply = <&vreg_l3k>;
+
+	status = "okay";
+};
+
+&pcie1port0 {
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+
+	tc9563: pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+
+		i2c-parent = <&i2c4 0x77>;
+
+		resx-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&tc9563_resx_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pci@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pci@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
 &uart13 {
 	compatible = "qcom,geni-debug-uart";
 
@@ -159,4 +277,27 @@ wake-pins {
 			bias-pull-up;
 		};
 	};
+
+	pcie1_default_state: pcie1-default-state {
+		clkreq-pins {
+			pins = "gpio52";
+			function = "pcie1_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio53";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	tc9563_resx_n: tc9563-resx-state {
+		pins = "gpio54";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };

-- 
2.34.1


