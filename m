Return-Path: <linux-arm-msm+bounces-110866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kYDAE/VYH2pvkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:28:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 095BD6326BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:28:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Y/M4QeiD";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kPdXe1sv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110866-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110866-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 94A08307D755
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 22:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985493C3782;
	Tue,  2 Jun 2026 22:24:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F5F3C37AF
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 22:24:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780439092; cv=none; b=cecfHvMOgR7GfU7QIwXMAT/qiOLevhQfLFzCyIaPdKj35FTOjW43M66o6aiyg4r4Zuo8eqWLdYS+12U3DKMFy9JhhvNqMj8bhPCRUwRLYf4ohPMIwr9hNp8GANEZ1bKkeESbqf3T3vSRW1aHAa7QEqLgORurtNuem/uUc9sPjvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780439092; c=relaxed/simple;
	bh=X0xXkFgpEGLjkiFblpwO+BnhWlu/bE8cwlCDJSPOaDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eYIQz6PTmZBdZ74wgDZfPbKuhoGesw5p8ddoHdS2fQ19QRLBtHect6VUetbiKCJW0qILTPKKSJ7uZaOknNFgKErHPD9TZIJvBd8T/Fnbbo4Rx5JLkVo4Ir2JOsKFelj7wWtAd7Rw+lMFI9u7RRAfasBnQtPhWUYjgDQR+x6g+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/M4QeiD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kPdXe1sv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652JCcoM1316771
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 22:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETNz+wmmpsdRAuqSqBnBouCW4jgWHavGgQFIoIN6PGw=; b=Y/M4QeiD3c4bC0ff
	kVey7lRX3r7GUHXdS+2EGnLye6NdMt8vHy6O80X2h5zbdHYMzNXRYpnJy8iUogNp
	fmBGgVXO1ltEyk31mdGnVhKl4hbleKsHVySVsn58sKiGaUcnoUylhuOA3xNSs3ub
	UpiZX2VqTzOGW5fCjbMcIrNOZ4mqV1ThgBt7tJlUH/Oa78uRyMWcPsLcSmMXydSV
	xAz4Uo0ONVzDKfb50M/wrNBch0HgUDPGH9Ujao2Vb5/WwhgXPCd7aOiOUOLmJChH
	mTRGVbmrPi9O/WeWeNHPIcHtp/E9CbGsWYDFZLc+mnyMoFWHzfPioeeqvgvQX08A
	mhwOOg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehs9vv2g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 22:24:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c36f4b76so30576365ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 15:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780439090; x=1781043890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETNz+wmmpsdRAuqSqBnBouCW4jgWHavGgQFIoIN6PGw=;
        b=kPdXe1svqYYwc37MLnn08sgAb1uLOiOA9wPLJXkNDWmclUgW31629lVda+Vhfht0ud
         ulOIfeEEKTJTT7Zy+yJWkUxBeptbDoUhBxz+AjhlR6QSU3TWGD/2XidjvsLrk0/n1dxZ
         7EXjKDJ1/DLjBnJZPGR+3sGlMI6yZsYHmeFhucOqCUuKNcPZXA5G6eAb0X2muzcJP9WC
         xVxfOehf1xE2iVJHsCQg6YrQFQLpym0FoO+ivm6ZonfRLrVsJ5ygfuv19tyxcuPAwsaF
         nKqh+DEEONB0hB9/2zwqNjD4AO4AtiDjB6CHgKPtXGtBYfnyp8qVhQGN86wUmYXvYzCQ
         mrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780439090; x=1781043890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ETNz+wmmpsdRAuqSqBnBouCW4jgWHavGgQFIoIN6PGw=;
        b=JmRMi4ALD7zdKQ5Atb9pdoa09qJ7Sm3rnUsnX/bRw647HVjxAtmLR0hbFodG9IImV6
         96XYH0i2WSmy4kDrMVDlnj20KbYqInY8E1sU4T9gGWSG9+4k3Zye4fpJWjDDqsXanFLv
         Vs3E8ScTkwOGL+DwlDOR0hOx8O/7dLikfOrorPKGyVvoEGG7AbGSoY3mpov9jRkUGpQI
         I4Yt6mn/zdy1l8dktbs1v8Eayd+UISD+oj/vbXLGxrdRvfuUdYjZwkdGmyMHLCn8vwgw
         TjGH599BVz2etQI/bzPYtEtyNq2Gnt1XuoCugk3Bk7sqZTembzZNPw6mjTYsAg8ueEq8
         lkEA==
X-Gm-Message-State: AOJu0YxBT00uLE4fxNk7QhtxHeSOhrphsAzMu/lBl6ls0vOTDz/mwh2a
	9P6gBZj4x0HeD1d/EyVcteTteE+0IkSKiMBbeuNWI1ZnMwnjNC2nFWDzpKrSLTyrQkP5ARTzBQb
	FvhnmSHW/3Mt7cD/UnECwBK8wG8ToOexW7lgsXYrQTQRXLvuA4MPRHSBvJcGnvzlIn0IA
X-Gm-Gg: Acq92OEh38Ic/aS9i/wRiOHJMwZ6qJXbAYbjTil+Bx6Tfd1KXGsu25m1l7QRmBrwtR2
	GITY3hIzjWABCTMR4Is0xoTucPnEN1irMQcrTX5/SRbNW3WRLSL1Uhxk8bQESE+HhJU7rvdqLZJ
	qrkTVLGZ0wO/u/ae7vuz/jftSL902km3P6E8XN6JdjI68FwLoJSsdDGKkX/6EfhBCwRJtmlmTXK
	mXD08YMalKW3lR3Wo6zyn8cYZi5Ej6Q4dXf3jdhYrgDeV4kB32kAkOpedr3xJOZhqdrCAX17feb
	u9rr4zBzTP9I2gFpPxYyzXPgnP1GiNxf0G1Co0DpDZ/k8tvcF7qbunayRY4dtoBTavlJsvYsPrG
	h6pjIsUZZTxl//RGDQCy8FDNbLsbL4pO4RxHlts8a7LYcH67qiMCD7HPOmjyyus5gdhTqlw==
X-Received: by 2002:a17:902:f547:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2c163a2ac1emr5553285ad.9.1780439089925;
        Tue, 02 Jun 2026 15:24:49 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2bd:2de3:5181 with SMTP id d9443c01a7336-2c163a2ac1emr5552975ad.9.1780439089464;
        Tue, 02 Jun 2026 15:24:49 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm2698035ad.45.2026.06.02.15.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:24:49 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 03:53:56 +0530
Subject: [PATCH v10 4/5] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-enable-ice-clock-scaling-v10-4-b0b728435356@oss.qualcomm.com>
References: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
In-Reply-To: <20260603-enable-ice-clock-scaling-v10-0-b0b728435356@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: M7cUXOjO0dswmZ_Q_H1zGjQ6jA0-0Zth
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIxNyBTYWx0ZWRfX4BLelSfyO5Pl
 SVN7L9G9uAvmN4izPXEXfQEaa/ly1Q9Bl5zvRtbsltS5cZrWn4ZK04YJxanh9HY+oGB6w6j3JTH
 FARDHOy8nOybL93JS4bJ6rDeW+mAU1dQRFvmuzYYqeMf2BvwGZTCgMPk9vxyFOm5EviMxUXoZCj
 HJsVA3OBs21JGVr3ZKzZPV1bt1YX5YjoEitsNaNGpTIt+3GR51vtVC5vPmX6kvKtNIUkq2yiToU
 rxQ779PBkPwqEhs5/81HN5KkAt+wMNhh5nJ9v+mluhqw2ak1zoqoCpb+gmVHGyGl2tcY+zq5Fx6
 Zj5MZpPyXt5TUPTx8rGdAZwDfSGLNcNNEqt5r7ejSYeKlzNCf0CqSoYzM/Vtv5N0Y2DCsBplscN
 /syvncp3VSLvgbW8zIn2VUHk+4eiulfv5/dnivTPcJBkahR6nBGstC79LIicXJHQoUPJplhy6Ra
 dJttA0ah6W7++pXYF+A==
X-Authority-Analysis: v=2.4 cv=NYfWEWD4 c=1 sm=1 tr=0 ts=6a1f5832 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: M7cUXOjO0dswmZ_Q_H1zGjQ6jA0-0Zth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110866-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:abhinaba.rakshit@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 095BD6326BD

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index ecf4790f3415c46781c8e790d7892a41300ee7a0..cd76da7e49d8c664df6a60b5c18418c4e97a3ba4 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd SC7280_CX>;
+
+			operating-points-v2 = <&ice_mmc_opp_table>;
+
+			ice_mmc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
 		};
 
 		gpi_dma0: dma-controller@900000 {
@@ -2597,6 +2618,27 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


