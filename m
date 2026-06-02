Return-Path: <linux-arm-msm+bounces-110867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8r8uGm9aH2rYkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:34:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD45632787
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 00:34:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CgIvIyfS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G8UKOYi9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110867-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110867-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1429431133B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 22:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F8F3BB9F8;
	Tue,  2 Jun 2026 22:24:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34063BCD36
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 22:24:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780439098; cv=none; b=dCsfY2HP1zuuUAC95pIffwOXFWs5AsKks7c+LZ0Z/BvUo4PzUF9B8xe10mJeUZY8OE3qF9ohGH1Cp0vhAtQNIEuEp5AyY4VbhJjGgXh2kDrJIs9FGBdVMBOhAhfBeid8wVBTo4piemF07vSW+goExrY1O5RcGuTFd5jZ2WgfGFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780439098; c=relaxed/simple;
	bh=DXh2TI45vU1iLpWsE+RYENmxgSc16LkuYVsOKJ6zBAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ThIYa5Bv3rDqxXCRiSGiUvSpIsa5EE6CZDL5OCQ0SAfYzxHKWKNxA9bkfk5P24xfhYgb9KkQ2BJB1m6FsDBkLFzzgYOFaKKdzXXpC0I2LhRykh6ZJ/kFoQ1JqRfDVvT7FQMMBalx9b7Yu9AR5sPKQgVx2p0P5p0R/68272zU4y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgIvIyfS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8UKOYi9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652GTcgo2692168
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 22:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYYqWEc3U8tcC19eQELIhV1rxr7yBmE/dYW94QG/AcA=; b=CgIvIyfSHTb5+Lt4
	G/vpGmyy9FnnoEJ4K8wXe2sGjDvtPJ1oKo49PRf0evNOrHHOFMk0B27yuwAMon9G
	nnMiO7quixhHagozVYNCZ8/xApFry5bChPrHRXq3FsWVrOkPnL58GdMMmDBx3kX0
	7ciQpBxBUpCR6ZObbUj2cwo+ZVHfNBd9TfDP1M4is84uSoijx2mY9e6zIw7omzAG
	MN1D4beevj9til2vPwg0on8m7I4bRHbwOLuOJqxSGblOuJ6KegofKSNeFT0Bffgk
	qItdLRRJwL7vm7Xio1ThXO3X0huJhLXGpCqLr2VV+bzmnVjZ/eIxyXdCltV67MVs
	+SJKgA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqummeg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 22:24:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c20f7581so33590135ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 15:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780439096; x=1781043896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYYqWEc3U8tcC19eQELIhV1rxr7yBmE/dYW94QG/AcA=;
        b=G8UKOYi9twN+tOagaIqtrtYLq98h1wX8HM7FoC64BIKzl6AE1sS8aGjaBOaYnEyoHk
         yBoMt98sg4OXsiinFW7K6EKiCaMTPqwNxQRTAl7XcHCsGWdxN05dmnZ2rgjvlZb/gLSB
         yEQi353e2aIELthLvUP4Y0u4kPlZDfSMIPvHrOogEYdeccBd+qxyRBKzmc6GFG5XJ8gz
         ssOUz73eJxWPRUj3HH9Rki2Le0f6/G5Ddcw2j1jlEg0PFJ4DWiJ/pjhvLu1Z4918YZUj
         6KO5uIR4kuCvEOU5j0YBxVnEz2NGDUmbVpawrN82B7d7o7CdUjrBpF2Dj30QQzkLMlVT
         MW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780439096; x=1781043896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYYqWEc3U8tcC19eQELIhV1rxr7yBmE/dYW94QG/AcA=;
        b=RcyyC7ZXZ5dY9hsqszfE9jSnQacCmlll5am2zMH8v+1XAHM6U05uZycFQpC9kpXA0o
         JNk2tVj9GY6JkY/u2MRBj7uyPRlki9Q+dqkA8X0hMos+7zKRn+F/DWskafzxSblq2fAa
         tPsTn7vHk7kPPGwOd56Ld2D9fYC7LxnhfVX1Bu1rXJhb0nnr+4rDKnDfJmfma5p4y17a
         Ne2ADQdKLlFefRt10amshLarw8+QvxbKo398pr1dcPQkWXKsRD//PkW3SXa2d3f3PZ/s
         3HA2ovEkFe/CzprqN5AwEibYbn7YENtf26yrJdGb8rMlJmQntZy1Ybaso1CEYAHpYdtp
         F/yA==
X-Gm-Message-State: AOJu0YwK8IgIaYEvSoOoNVjiOWQWBuy3u8eab+JNPkWVfCSwjASKnycU
	v1a8sOku9mwUwWNI83xhVTwWcxZANuHrYQvXGRtLe/Lh/QSxAU9kGIlgo+yJaYBmkozUUYkDOgc
	s1oK+SySnw4LMeol3ixUuJl8SjPsjepBVkxEsJVrPNQAKy4D4poA1eKlsgNezZSAIpweU
X-Gm-Gg: Acq92OHhnATJ+oBNNYCppS3dz4aevALhI1kdQO4fDEqjN0xF2x7s8wn9bN9KsV3RQWP
	o5yYaL75XLxj8+2wXu0rrlpyMtlwOsrStb4LNfZ9tXJTLwjkuDVVHan2zyUTGjui+nSUgNONyvv
	t2VbyUthxyWhmgBCTYeFxlEUgWK04GhcEQGgW34me5Jx1PUnW/oIM/+NZsbfQMCCNeia7hKL338
	iN65pxeptmV8tNkSy7AGDCTXgwf2t3mcM3I+MlZkzX5rY1ZvtniO52sZDC7UXdg29AFW9NVR083
	max1eYsT593QQ3RRaDDCN0noCZ0HwUthAAUNb1bRHScdad0K6Zw8OwnXqQCJbaVlis1PU1zUSCx
	oR9L43+804mTxVD9bUMrmSG3jttOveo1q0HRHAfJS46wD+a+/Kk92O1GIYUthKFVhtkoHTA==
X-Received: by 2002:a17:903:2a8d:b0:2c1:660a:2941 with SMTP id d9443c01a7336-2c1660a2bb7mr5879755ad.19.1780439095637;
        Tue, 02 Jun 2026 15:24:55 -0700 (PDT)
X-Received: by 2002:a17:903:2a8d:b0:2c1:660a:2941 with SMTP id d9443c01a7336-2c1660a2bb7mr5879365ad.19.1780439095116;
        Tue, 02 Jun 2026 15:24:55 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0ecsm2698035ad.45.2026.06.02.15.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 15:24:54 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 03:53:57 +0530
Subject: [PATCH v10 5/5] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-enable-ice-clock-scaling-v10-5-b0b728435356@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIxNyBTYWx0ZWRfX1D+4Ki9jh/xs
 j7W9FC4yKQrJFrszSfx+DoMnkTsAQvWuT/C5A3OGpDDxC95DCusrgO3JgFDZaiGsaBdMZsA/E+Q
 zGoxqa1sDLL8AmuHjHSqNrFbgn0vSC632IFm/JALACi4sKg0EHcZ0WZ3YARppKvXkjNeEYywJjL
 v8JXfvFPeCJ4PyYb94BHSuMD3iThEgnxNBPGt4e8UWr+KjzYGtQ71jouFr7LdPfaLwmmiE5LB32
 jrWculREVkDTc3un9qzl9TKfzFrQ9/6s0OB9b0r3RTA+GkPr4SrT9RUwZ1oi68C93TSeOQ6DFAA
 XDCi/h3Eh1vm0wiWyuzDyHnesB+Bfc/T2NckD5YFzjV0TJsgfuP0hcfaugsggdqrMGBsFj6a/qW
 ez61Vky801xnbkURrgG37iQpu+Fu0l37hCMlqqlu3FSw0Dcen90SDyLidE/zDz3LmcNm01ZzXGI
 gOR0DpVD+WQ4V/1+C4A==
X-Proofpoint-ORIG-GUID: W2k69pWj-OVIV6Hnll6QPaXcCwsqeBXg
X-Proofpoint-GUID: W2k69pWj-OVIV6Hnll6QPaXcCwsqeBXg
X-Authority-Analysis: v=2.4 cv=Rrv16imK c=1 sm=1 tr=0 ts=6a1f5838 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110867-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:abhinaba.rakshit@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: BFD45632787

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index a1b6e6211b84d0d5008231c55613a0ccd61b9450..d9298d8b7874b8669b2cded2a28a99dce6eadbda 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
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
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-201600000 {
+					opp-hz = /bits/ 64 <201600000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-403200000 {
+					opp-hz = /bits/ 64 <403200000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		crypto: crypto@1dfa000 {
@@ -4878,6 +4899,22 @@ sdhc_ice: crypto@87c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			operating-points-v2 = <&ice_mmc_opp_table>;
+
+			ice_mmc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		usb_1_hsphy: phy@8904000 {

-- 
2.34.1


