Return-Path: <linux-arm-msm+bounces-104930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHzND82E8GlwUQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:58:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B97482069
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD27E34B8D01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 09:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868DC33343B;
	Tue, 28 Apr 2026 09:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XzVEvxl/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FnL9R5rD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DB32F1FEA
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367883; cv=none; b=Jc2ysa4FQ7p4iKcDx7yQV2GtA/07TR7m2CCeKtGvm4B8dKdmK9sbUwskHsqkbNWT2LagchzJ3QM9qGf1d2QMaRBGitM1BRpjak37w+OxEO/uaxbiuDYo5Rc6w9mPuxN8AeQNUv+g39HO2Jhb5n2sKgpANtukDtFFbtfFuksC+g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367883; c=relaxed/simple;
	bh=KhJP8J3d+cslr81V2e60vUEUuMY3jbRP1BeHMIkI/xg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y1fWPhC1mQXG57g5T08ol5SGQErO/ai1wOf88zvK3W36D5WbcydI62yeq3SJv8cmIxWbC1FpbLNY45Weu1519joh1mBgZdXOKBtjg7kgvcqSe2u0aAOS8nAr+ElokJZbZztSP/2YXX+FU53aHmk/8cxJwBrKgB2E44+xl++663c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XzVEvxl/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FnL9R5rD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S54CWQ429172
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:18:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lLkw1O5fNcl83EO+1TghwY
	Eyy1UKI9leinraRTuerVw=; b=XzVEvxl/CXMsD+Sx5WPvHVjET4sCY7JdnUHqEj
	XXHyBU3EwhD6b+Dq8+Z9fKy4Lg4Z0mBjPv38FhuHuTj2K4nbqpEnxdF9cqi2a4Ar
	Kre7x7hgAZJ5CBKD/ZPbomgWIxSH+quYzSC9AlnKjBdYCRT0eYUUHkerhxKoP7cW
	5IPbLyg+IZr66z47P0tGoyEEz7hr1UXx9XGA/LbPePXyD55u0Dn+luCba9t38Zu7
	SLz7hjrv8G6H5LlE5WrsCE/91ok4FuGxIuNsNLIheE6nwuEdEY0mmO0kHVjyTQhp
	SvhCYyktm4ByOIanXAcdDzJNno0Y4GNUui5n15RbMX53DTyw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x34awq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 09:18:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b242b9359aso112231835ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 02:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777367879; x=1777972679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lLkw1O5fNcl83EO+1TghwYEyy1UKI9leinraRTuerVw=;
        b=FnL9R5rD40z6RhHo13SwwYP4z9/8v1FtZDUTLIMCWmFK0nOFCOEqYtJhH1oRhEMd1W
         aXzOTG/IfR/dSCUMD3EuTvdj1oYZToixrAnTdSLlzg9r3nsy6N891z2526BeYZIW3gzz
         1QXw+eO/HTbnV8bL6OrIFW9EsFH8VDzPmwegutUF2yphMVXXJdV/JFypUg2Fp9rGb+vM
         EpAidF2cXpptMDyfuNn2lXONFLMGI1UkkR9Nyqiz7bblwrx4L5QNZ9mZah+Bmck4tRAW
         Tey4oriM8qBNpsgAgGS9fGsWH4ycJzN5tc7csWj06fWkwkUCDp27Xlx6orqALXO4KtTF
         0rOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367879; x=1777972679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLkw1O5fNcl83EO+1TghwYEyy1UKI9leinraRTuerVw=;
        b=RrHu9tRcxlzbJFXQv5291ZOHsaUnqFsIyRtCsspF9pEPh99E7/RHLeOkYsyZKEEpaP
         hirh+H+41tpmw32qcVANievXtknBa8T6mcWY128LabrpP3w/b4QmoEjmIfALnBc01Stn
         WO3P+NRo0F1jknpM5g67s/DNTmRHImwFlYExHRle2xTtSa5M4/59KDUUKLIZAH88HWXa
         b2gf/TWLP1ZlxRofek1Ekgug4L03bVa3aQ2vF0ke049nd9H96nm6mcywhY9mjnsp5W3g
         rRyKaixv6AYQwWVxBBakzVvhNCQw+86DLs9D//hpfF9OG4Hh9fOAW6Dp+GEXT0ZnFjmM
         0kuQ==
X-Gm-Message-State: AOJu0YxL0kjvWOSn/9IduugZ/Hi4D059P/vYD7BsGM2hrXH4wv98+HOV
	LVdgNobBhxwV4OjsT2BjO7GKVjC+BefDESvq2QXXc16sjnHukXTh+OnsTtCRBhq4A5+soIIIjJ3
	WsvazdiqeadIlV0j8sqF4cYUtAUY8EMAdxVUVswAKfADgL9N5DsHGrSN/ZG+GYbZagc5j
X-Gm-Gg: AeBDieuCjkTLuSc1QZZnthvOr2XQrJ8qgPEB7XzKH6cAhow+92crG0+11dyDXrJFk7+
	eSgbN2OhV/0Oh0E2aR8JMWeK4m75ty89xiCTOWkjRUT+s/SVCmgJIHj+VZQDFZT2oe/z3495MLH
	ZrmBhD8396aloW0xvIfACpEfU/9OdkkJp0idhuS4c1yao1MRKgst/SjoQwUtMUPxbOIphG4u5ZR
	jzU+w3av4OxwSGybn0MNJqjyTbLZatEkJfBOkiMY6c9o6qfJju/VVgHdt4HuBvq/pX4/lM6kP+u
	AHGha7mEOKE/fqq3KrjnAd0Ezl/JXbmSN+i5OX34JRwOS9QGNrNNT5UBseKb91vtWrhgHhHDF0d
	KhevgxsQ9Mts/P+SGA0jY8px9iAHnomIno9N3a8sQ/7VMHlA=
X-Received: by 2002:a17:902:820c:b0:2b2:454f:b951 with SMTP id d9443c01a7336-2b97c4c98aamr16821285ad.29.1777367879046;
        Tue, 28 Apr 2026 02:17:59 -0700 (PDT)
X-Received: by 2002:a17:902:820c:b0:2b2:454f:b951 with SMTP id d9443c01a7336-2b97c4c98aamr16821095ad.29.1777367878594;
        Tue, 28 Apr 2026 02:17:58 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97acaaa2asm23069505ad.84.2026.04.28.02.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:17:57 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: qcom: Add SoC ID for Shikra IoT variants
Date: Tue, 28 Apr 2026 14:47:45 +0530
Message-Id: <20260428-shikra-socid-v1-0-6ff16bad5ea2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADl78GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyML3eKMzOyiRN3i/OTMFN1EI/PEVGOL5CTzVGMloJaCotS0zAqwcdG
 xtbUA7uXH4l4AAAA=
X-Change-ID: 20260428-shikra-socid-a27ae38cb7e3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777367875; l=886;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=KhJP8J3d+cslr81V2e60vUEUuMY3jbRP1BeHMIkI/xg=;
 b=ld5x9rlrmNUN3g/dYWtM9x2czOT4GOihAFdlNYof4/7dBCmKpxtGak8+8SOB5UQupxAO8gZWs
 eQVkqu3EQ4DA7JKpIZfh1a8qNfPNLcQG0nP/G/vK6WhYww4IP+7iTjm
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX1NDqBdlc6W27
 kS4ztwaHpGJC/dY5oD6sz0tDHz2uAaxY2mjWI3fH1olnkk9jIaTjo1eJ26EZFUy1ArnfHLYqPCY
 Mh4Kyh4WRCyqPr+6HaPX8/KP8JMS/1ygKMjJM4Ijrha3XSAA/b0DE0KL5TA6dhhfdQZk0+hAYq1
 SgbxinNY1VH+nnaM7e+ocDSu4pktU66vJ/ypfM3IOrrmHhWFWzPPL4NMTdlzKGP554jczPxWy0q
 rKpA/axHjvqmPwo6pef2cnwjFAdIblZ66hulLUUM/PMkAvuUH9zYM2J0xTBfFAgDrinpxWyHaec
 omtggMOLZhRguWDAgaPhg4KBlo27ZAxtwglEW5EVaiYHmGW2Z6FUbQODsg3xHYAfhdHtK10p+j1
 kWSZh+Kn6uQRRh70N7gPSgqB4w1Mcz2gTsXZaydLjH+9TjmD3i4MO5CvRUwGUldE3O9DMeib2ie
 WRXtjmA4CrhjYsTxbSA==
X-Proofpoint-ORIG-GUID: x6YeiZsvr_0qGTDBcbpCsCTTZfJbe4tQ
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69f07b48 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LvLIYPk_e027418G8rwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: x6YeiZsvr_0qGTDBcbpCsCTTZfJbe4tQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280082
X-Rspamd-Queue-Id: D2B97482069
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104930-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

This is the initial posting for upstreaming Qualcomm Shikra SoC.
There are three variants, distinguished by their respective SoC IDs -
- CQ2390M: Shikra Retail with modem
- CQ2390S: Shikra Retail without modem
- IQ2390S: Shikra Industrial without modem

This serial adds the corresponding SoC IDs to enable proper
identification of these variants in the kernel.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Komal Bajaj (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for Shikra IoT variants
      soc: qcom: socinfo: Add SoC ID for Shikra IoT variants

 drivers/soc/qcom/socinfo.c         | 3 +++
 include/dt-bindings/arm/qcom,ids.h | 3 +++
 2 files changed, 6 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260428-shikra-socid-a27ae38cb7e3

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


