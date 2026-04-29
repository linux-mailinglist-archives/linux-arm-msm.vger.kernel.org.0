Return-Path: <linux-arm-msm+bounces-105118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDqcBy2o8WmYjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:41:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1296248FDC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B54C3011513
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BFA38F63D;
	Wed, 29 Apr 2026 06:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VPma7fcl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="azGHl0Ne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B059390221
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777444870; cv=none; b=uJvnPV7eutJH/pN8reXNHGDmQo7STUJtAYnpKPMPGGwfRv8gGWD50JiHN0WpFUMGIoMyVVUaP3dSAM4MBcQl643mLLLsRoFP3NsoT7B/wyHUQzhAzMYIXJ3I45ho7ePcn9DUajoj/NUvxcT5+FfXoQfB5P7scf0o1G8/7iHf7LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777444870; c=relaxed/simple;
	bh=XWKwrksNErJLEvwlHgDL4lyNnKhMF0gQvHqdx2vruVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZIuvHTeMjww/m+BNDybMa4PDo2O/QpEROFV15Yglq29+d4L/o+MN0CE3BMrZohX0IzAnY4LN5c+S+rqHfF+3rQ3iImcYcA6/8ThwbrkE9xhhV7ZOQUoL6sFrXzTAuFm1aLtEiEPdzQP5xn+iQe2t7UZksRklNibVsRk3NwazLZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VPma7fcl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=azGHl0Ne; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T2vUPq2983640
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjIrDLDdSegD+bCBBQs8uU5+yNsd+UNaophUERxk/l0=; b=VPma7fclFiLJ1u07
	51kJA6yMlIsjvYxSzOCgFgrOoTiLJwNyAfeFGdVfDwtlZL1A4tAsBtw1hySUcHt3
	LKGDtLXCGT1Ncl7ByWyjCnp6oQBJusIEcwKVnWFvfk4uYZs5/pkbLV4h3EJiTKXq
	Bl0bTv7sTsgj7em28kukHhru6ZoiiebHLF8RJmdjOio51GVELdAnRV3j+eF09kz0
	eJ9xnx26EmakKwa8pXzBXSF4zDas50KQcGWj9tOms7JvoSXv8uRhFVSIAIkwMmyP
	LtOhmbcLhbTi/c9yVl52FpY+HypzFIHAW195dEAOKxiFR1rrjaN5BVeRxg2GiZjK
	0y2gag==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1tf92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:41:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6b984b3aso6879590b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 23:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777444868; x=1778049668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjIrDLDdSegD+bCBBQs8uU5+yNsd+UNaophUERxk/l0=;
        b=azGHl0Newt3BzDz5FE1t1j78cgZPCracAQHstXs8e0gGm4Db8Dt3emi6sIl1BN6Oyl
         u8Ua3HP/HaBYarPkYKJsMKRJ4p1TQsx706otZ+ZtxiO0Fg2pGEZTNdjU6w8SdmVlmYve
         TwEWlAWiTA150qitFda48a5bYQ1BaFfkFVfytxsv9ZL+iDXY7pgN+nr/FYEUA4oj9cdN
         /zFi9C2j6MECPGQWLO7FsEEP6985SsIUER5xtTFHRmQTbUBaP1Nuq+tk72aaIm+fOX1v
         WFIr26XzJnq4Aqrc7GFRtczCLmKolIxMh/57fqw8wKPXzdhQd5tjkJZEMq1YWMMKZZJa
         LDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777444868; x=1778049668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CjIrDLDdSegD+bCBBQs8uU5+yNsd+UNaophUERxk/l0=;
        b=A3mowIPJFc769pTZUZfCpeXTTodvOxgpZHaWF6D95/lvMKrpD0UIb0ExALdCM9YOLq
         a718ySg9dVEeaSqZG3iI8QI1sA+3lXFZ87ux2TFyXQzCT9SbU0Zotdw3PXvaR52aLOPf
         YOM93/xtdNVgXuheFiYXbEkWfXEFg91qJHYkAMs1PyKSfp3qWAH65LJ9W3b8NHiDjqq9
         A6OEiGZFqYC02rxNrJda8CeltTYDI1Glv0e9H4r+DxPjn3SZt12NlNkIRIRf9h6YWMHl
         YXdrt0W4ekgmyvQFyBxkPxdhP+mAblzZquk31f1bA0J2DskDS5uD6w8D3GdjamNv1qpx
         HMCA==
X-Gm-Message-State: AOJu0YzVe/rGUZzGj7C6RnxvHnCnGBBEwRejqRV1RmyrV4CTuoqeMPqP
	vA2KFd4iHy1eAyrASVJbCg5KWEO/6esivl55eIy9Ym4yh2M90b1UfGRSuqy43AHusmuItUK4P/r
	ZT9y1d8llJ3azGdNMbyk5NsMLksXRoh3eBftmXtgK+mhetKKZt2mR6frb3ffq+eRH0bCe
X-Gm-Gg: AeBDiesF0fgcFHD2yGPs1vHVnWIjcbFm3C7PFx0h/DaI26sHdz9ohLhhuj8SCIl5zt1
	RRWudAalvmv+ywTFV3l+Oc5CspS+4D9Wu8QGxybTd5ny3N+Oe2jp7pDOBBl7kujp4/uTIF6Jdn0
	lQt0ZIZRz2o44+q1iIsmoAqp5+g+sCtmvFfueh9xWB1atlwfDbC3kZPoU7FrQhWsoWw6vP8mnnw
	XeTFww+86p+RYPKwicydXos/VdHHhzMikbYNhFXKVidFK4SJD9Z7Oa529yxvdzUtOIf0ywM/pdR
	i47LUZZUiaCkQnRii78qfxXmdf1Z+AHW9QCrG/S6LheLQPA6BZVMxpzq3Qd0VqBnaYuTt8jQ1Qq
	6b88ElYFIpVAtLRTNaFaiv/ZS52lUSeGRDo0v3rKkZyH5WFNlHrO5ie/fFlY=
X-Received: by 2002:a05:6a00:981:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-834ddb2dd9cmr6541158b3a.15.1777444867818;
        Tue, 28 Apr 2026 23:41:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:981:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-834ddb2dd9cmr6541134b3a.15.1777444867336;
        Tue, 28 Apr 2026 23:41:07 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb78esm1048478b3a.44.2026.04.28.23.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:41:06 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:10:41 +0530
Subject: [PATCH v2 2/3] arm64: dts: qcom: kodiak: move dp data-lanes to SoC
 dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-kodiak_v2-v2-2-c3a703cc30eb@oss.qualcomm.com>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
In-Reply-To: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mahadevan P <mahap@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777444855; l=4729;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=DE/XlRha6NrmDY0w7M0smlHNESbtabO/wII04/9+zW0=;
 b=Saa4GUUoi8fx9uSd6fFniqclko7Eb6VQLUTWvhTts/csXyQWZcNRmqtpQZyz/6e3Xkt5HAnXM
 rpJK6hctINBA/UuqrOhY0qpyEy3nG1ipnM+2ZDXeZhTdTgxT2Uf22dq
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-GUID: d09aEn1j3YX-AGM9MuCgaK6pA8VtXkLj
X-Proofpoint-ORIG-GUID: d09aEn1j3YX-AGM9MuCgaK6pA8VtXkLj
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1a804 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tuEcwOQH5NgxzPzdN7gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX41gRP6Bat4yD
 mTGkcBQNnY3ihss3+TWySM1vFoPXscEKyxZt/CLm6KwiK0F2UeLjy3TvwjxPm2c/+KhfhF2JkCc
 EzVAxKQlR9OESo1V9YBHd3XbnIAJQfrlGDdRpg6rpI49onIBl7Ar9WrFujEMxx03af5BHbtZ8ZA
 0ZQWaTcmpXyIxQSUn7BQOruxIUx/a9FDCuXhYnSFZ8wDzDonjC5u29CrGKEo1zmcuot1+5Ifrr7
 WRWX3z1NDrpojPPpBhJJzDyRv1VeA88T0cOnKxKxJl5nyXmK7oeyNT16QvHtZ7qfh0RhWcXO8BZ
 P/+zTjAfOHC3oqg2ElYwINTrIzitmQ+QmcLhJlJF76Ri9mSn59cSHBmnmRuD03yzDaerFx+VbW2
 bnA2QML942La7u+BgoWXyGbaBBAgwRciXv6JGE40wnvP0kyW62XvcoaC6srKIaLa959PuV8ieIe
 jb3PiJORtrCq4CF81lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290064
X-Rspamd-Queue-Id: 1296248FDC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105118-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahadevan.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Mahadevan P <mahap@qti.qualcomm.com>

The connection between the QMP Combo PHY and the DisplayPort controller
is fixed in SoC, so move the data-lanes property to kodiak.dtsi and
drop the per-board overrides.

Also remove the redundant remote-endpoint cross-links and
orientation-switch property from qcs6490-rb3gen2 and
qcs6490-thundercomm-rubikpi3, which are already defined in kodiak.dtsi.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi                          |  1 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            |  4 ----
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         |  4 ----
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts                  | 11 -----------
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts |  1 -
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     |  3 ---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi                |  1 -
 7 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 96ac3656ab5a..0acc6917d7aa 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5704,6 +5704,7 @@ dp_in: endpoint {
 					port@1 {
 						reg = <1>;
 						mdss_dp_out: endpoint {
+							data-lanes = <0 1>;
 							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 						};
 					};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29f..9fe09968768a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -932,10 +932,6 @@ &mdss_dp {
 	status = "okay";
 };
 
-&mdss_dp_out {
-	data-lanes = <0 1>;
-};
-
 &mdss_dsi {
 	vdda-supply = <&vreg_l6b>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index bf18c4852081..5a019501437a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -540,10 +540,6 @@ &mdss_dp {
 	status = "okay";
 };
 
-&mdss_dp_out {
-	data-lanes = <0 1>;
-};
-
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884a..9f76c95af4bc 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -788,11 +788,6 @@ &mdss_dp {
 	status = "okay";
 };
 
-&mdss_dp_out {
-	data-lanes = <0 1>;
-	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
-};
-
 &mdss_dsi {
 	vdda-supply = <&vreg_l6b_1p2>;
 	status = "okay";
@@ -1391,8 +1386,6 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l6b_1p2>;
 	vdda-pll-supply = <&vreg_l1b_0p912>;
 
-	orientation-switch;
-
 	status = "okay";
 };
 
@@ -1404,10 +1397,6 @@ &usb_dp_qmpphy_usb_ss_in {
 	remote-endpoint = <&usb_1_dwc3_ss>;
 };
 
-&usb_dp_qmpphy_dp_in {
-	remote-endpoint = <&mdss_dp_out>;
-};
-
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l7b_2p952>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index a5ad796cb65d..a120f7c5cfa5 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -662,7 +662,6 @@ &mdss_dp {
 };
 
 &mdss_dp_out {
-	data-lanes = <0 1>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..d33f8aa38b13 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -788,10 +788,7 @@ &mdss_dp {
 };
 
 &mdss_dp_out {
-	data-lanes = <0 1>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 };
 
 &mdss_dsi {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 5c5e4f1dd221..504c3615f7ac 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -463,7 +463,6 @@ &mdss_dp {
 };
 
 &mdss_dp_out {
-	data-lanes = <0 1>;
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
 };
 

-- 
2.34.1


