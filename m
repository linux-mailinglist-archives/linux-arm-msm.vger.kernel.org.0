Return-Path: <linux-arm-msm+bounces-109080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKQwHaIPD2rOEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:58:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E71FB5A69BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D10D3252973
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568FC3FB07A;
	Thu, 21 May 2026 13:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoacX8I3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZ77hrEU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57E73FB05C
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368860; cv=none; b=o8cz9/YKxN1X68Vi04CVIo9tcD4pT4ky+vGUH+diUQebAGsFby4rsjp1rEKltd6jS5FmhY1TJdYGolHvow4AYlLVl/tsKU58A2fwzjiPqFqdv7qMrl0YYJ9DMU5IJGK17e5Wg5ZCcqo+pVa7P3NKD77Pyt7TsW+IbU7x/hr4vDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368860; c=relaxed/simple;
	bh=grym2NR/kAV0aYecoJf+FpWLScxnZ+YDsJl1+8FBBOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y48oJsi+Zug3esU8KhBmnZWZ2yuVxUsMMAgoo/J/gyopacMq4a1EiHzn4u9sfCaUYA3slccrtiMZzApozH24es6IdFtg2ybo0eoeMD+erFppJCz0+cBoi6D/yZgy3xGoGdQDOQA7Pd0OiecteNsscLQm9yEBliNo4Vy1aKvkrrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoacX8I3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZ77hrEU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LAXqBq818809
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7n/2rnujuyivCuY5X/zQ1UdWqSiPXQtl8dZdQZ/7k4=; b=KoacX8I3ycpV2vAN
	5B4X7WVSZwntymC4nt93mz7NAoDbKlrMU00uAZUDmIikXnHpc585f/hBDNqnkfn+
	0RAkkM10jDGnRdYJF7bK885Yv0bVbJiov9nugU54seZHBjbJImoETWuljNNNInOs
	vaeqr3elZZUvIkytjwMPIpsdP7ctK4OyxXR3TE39KJYQn7gVv6A55E3ZMgb6gF+L
	1Ryq9unRkUiLyN0K0dLTB3UxKGk0euhbYmzCgom/Cm701grfMW770Z65Aa+gTXgd
	Yij1u1pBOeeOuCS+scePILYacbHRTXsLiODnDaZuDOl1/CuGMNRMz/CIlMU66Bbt
	0mMFzQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkghdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3684cb22502so5825830a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368857; x=1779973657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7n/2rnujuyivCuY5X/zQ1UdWqSiPXQtl8dZdQZ/7k4=;
        b=HZ77hrEUaacZr7GIB632HsDar99lFgjZShicdgn6jorPqeCeG3V0VElI/WlsQh+uCS
         7MG4beQ9KnO2JCapmWDaIXR8GCpq+jnqql7+hGISeDQvfgANNsdtWY0/2+297absHiJN
         Mqz50khXVEVho3QnPUP6mDMc+SxP2Ne66jawHk4NmN4NFF1LZA/6IcNbmog5JG/y/tSv
         2MGVqzJQBfQ4YjL5LYlQ212yd6GtGGiq94gxE85fbZFygcsHSeq3JzNHN1VtKaFcEHkc
         NoSAJ2HToLwvWX9Gf99UJF7ewMwLhqMhkXDQK04EJhCxjaWEI5VSztnc8jJQfGnniNUx
         OueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368857; x=1779973657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7n/2rnujuyivCuY5X/zQ1UdWqSiPXQtl8dZdQZ/7k4=;
        b=g07n5WwOJPfRIuiqPRDtUUXvKjM+Bz2/RR9TULzE8s4hAwTfF4cJ27s9KXVW/kEjVq
         bHqIetGHFUgmhEFLNUerRBkmqZcFG89RmSAjWcxc5tkKy5jxC3ixAjKM+g9swq+f3OAY
         WnhmydPpAwfcOV0+OUb/FGbylN2t76srmyfkHEQ9s5TbHb/av2X4mi6s9TCyFrquExU5
         iXFoJhyIIwKCdn7wg4atWzyEFRvFuosE1PTSptva4xXHmLI7ShfkqjZ5zZVqw11gPZNh
         6jdvt1UWNFcuhKUQOQd+UeoEsSwq47RsEzn3leQcUCylJ/ZYMShdknxOtCnlt39HDBiP
         aZqA==
X-Gm-Message-State: AOJu0YxQY1dh9xMYcCV+Q3nqsBr0ZqFSwIV65mOiN4CV78i+LR5xoq5D
	8tk2l4BsbplgLgkOjI5MKL549PS5hzX4L5zAFeRMldtwUhCrBV4WumBhaEOm5w9bhzaBzzZixJo
	5HGLA0hsQhMEt7U7Xx4ko71ZDguLiE6iBUFvuNAWS3BuF3v16I6f1uDMwNzUjEsTSsyBw
X-Gm-Gg: Acq92OEzk4ZrnbBSUhgP5WTo4TJmu9e5ETHX0EQDa+xd+dfKkuxgkw5OaSVBBLmD5qq
	iMlU7N+My7kQf9GHahS9o8ccRoHMKuBtrKpq2gOrnT4OBBFssVA5QmELwUgT3hVujlYC/auTShr
	p9cydjQaYKDryaRfWfkxpLh45iB53dbejWPJfLCABIkT6qaL+Kd12EKAfrZtCsEdilXkRXMEy+s
	GJDuahtvtXFsjqlCRWUcqUAztW9WE7H7NWEFSy9m+ztYuV6HStkE0KGY+cVXMsMgT+YGb1j0M56
	FjKklL6L07loQwamIeTNlHMgApx/9NFLzpQb+pySKoi0HuUbLrp5mulvNuWgZQuAaiFTeJSPeJD
	0jFMG4MPnee0bJJB8BPFQlHzWUwEXJ5d3CpkTguo1W/usXuXDOSUeHpOa
X-Received: by 2002:a17:90b:38cd:b0:369:7421:75cf with SMTP id 98e67ed59e1d1-36a455fe2b8mr2555039a91.16.1779368857353;
        Thu, 21 May 2026 06:07:37 -0700 (PDT)
X-Received: by 2002:a17:90b:38cd:b0:369:7421:75cf with SMTP id 98e67ed59e1d1-36a455fe2b8mr2554989a91.16.1779368856828;
        Thu, 21 May 2026 06:07:36 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:36 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:43 +0530
Subject: [PATCH 10/18] arm64: dts: qcom: sm8650: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-10-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=3273;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=grym2NR/kAV0aYecoJf+FpWLScxnZ+YDsJl1+8FBBOI=;
 b=u5XcZVHlZ1xcXCThyXtpxaWgl/fOH5InohJG3qlgQ0yQjLU/6NRHvqkt59DGRcAI4jhVgJEOC
 RcJQ9pQF5HTD1G4aX9F4yQGc0oGAnJk9bI0FapwuwXD5RpfTGFaVFle
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfXymGm6yrFAf/D
 Dm+Edo+C54qKSLbIh0dfS3+WteJK9Rhg25RBVo2eUbiir9OyfWJzGxtYU46yTCl2ji0tzneXO8z
 xFH00DGtFMqq95wiwvUef8JobT4Fq8s9lIreTn5XBdmlE4nrQqxdoMfNVPI/UR58SyvzRnDpImb
 ydTj/Vpn1hojZM6k79EuaDuZxMV8d3GUnb2NEQ1TEO22LPahXaB9ujCZrsC1MVHvy5aKGtkA1l5
 M+pj1A8EkyvsO44bvR1NEvDs56QcdYE76DN4XyJz5rmn/k8KOHy070I6LdDJlEz5HRPozpE3pwB
 nLsmf3DvZy4+0wS4bXQoEi+myjfd+ep3YQNmXrahjiyk1NU6sWWhjsMAvWF/YqNKJ4TBd54hs8H
 L3TXIDf+7f4oK9Ivy/lL7GMQtQaR2VxWDG5TCyh6AivgG+OCQP3dWXBMqQIu+him/0u3JblN9CS
 4bSaPz1wZiKyC56fmVg==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a0f039a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vzsU3dzRAwCoIzd_qrsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: kVvlB4_MDQQhgO-PLqPeQOdWIacmKPtP
X-Proofpoint-ORIG-GUID: kVvlB4_MDQQhgO-PLqPeQOdWIacmKPtP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210131
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109080-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E71FB5A69BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..2123312d88f6 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,7 +1074,7 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1108,7 +1108,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eabc828c05b4..775ce9f2dba0 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -942,7 +942,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -976,7 +976,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index dd6e33d2dc5d..8cc0d2cb3515 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,7 +642,7 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -659,7 +659,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index a3982ae22929..c302996a7857 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -936,7 +936,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1


