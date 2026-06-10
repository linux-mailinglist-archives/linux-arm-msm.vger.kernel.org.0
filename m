Return-Path: <linux-arm-msm+bounces-112412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5G7OCMVIKWpjTgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:21:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5A9668B1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:21:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TY8SB+sy;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZgnRtUMe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112412-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112412-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D822031B0CDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D7C3B19B7;
	Wed, 10 Jun 2026 11:15:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E91D3F0A96
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090124; cv=none; b=VAEJJah9+QsJeBdaaOeuZJ/hVntsYGdiKOxIY2ke47/SsoJLHxBvDs3zuSnxgTxhzNEUwe4KOcl6LiIg6CGfjxPu9wB6ZRdijkbg6KV2mkSm5gLR88h52LXiARh+Co32jwXkWtCGG6x1172K8FY7NnF/SM0tTNy5nnZjvx3KNw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090124; c=relaxed/simple;
	bh=tlLysb09uvAoVCx+1kdze1jmf42cTpKi0299Fv9fCHI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fYyE6UjV8exod7t5qcTPhqL8uhIWDOvBv9jRe19gF76fHNhe9HO08pZAxFOVErAHjT8zHQu0SnqBSIPesqJiLjeauUjBY/LOZwQsqdDXQJ1bPn+mukktw8Ynp1b4IwuaJpvRI4vO+fWpqpjB+DZMaEZ4Qs6UDQM4nq+kOotOUX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TY8SB+sy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgnRtUMe; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hreG530925
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TtXn6rn/EA0ErHHIdUsuzWy/47T5NpEswd4
	MS/j3NW8=; b=TY8SB+syun3FXLlMOist2e4SGllIRfrprlPOZ7Z9x6KcXQ4BmZu
	LUQzdXYY/FWQdnirJEVVzQm9+lrWwcckavKAihj1Mpvi5RcsdxeZ1E97AlXvxUvq
	bj1OtseDYoKQed3BqOB5CL3oT9wPpS5vktlZ8q1vd1TEjW27zeMuNEU6Xh0IkQfs
	KIZdso/HHQ1CUw3S1uyYCWsiKyLVszFetYB89b42cZiEdODPyx9EfoYE7AeqSgRo
	3eqF3DzHip+DwWTCNlHCYUmEEQSQp+O8PfwuF7ZqeAVuYYFeKDmzNiOMfdxkTGyS
	D78lpqu+jEceL5NJOs38UjpCjd1SnOkW+qg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh27am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf08c2a24bso63709385ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090117; x=1781694917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TtXn6rn/EA0ErHHIdUsuzWy/47T5NpEswd4MS/j3NW8=;
        b=ZgnRtUMeVcUGgKLLiuhZqGOl68C9wvA09nIZ6bB/R4dmLvGUijW+Jg2Xc6rNCBmbs+
         /J3eAqaFZ4WU+0p2lAW3bNW6KmNaRU/Vzck9dhYEI68HmVfMEnDPHn46YzgyUQ9XQj85
         Khcrg+UYsoJmNYEiTq7ZqCa2mzbnQVl/6e/zTCv1ydR3JrDT3iPgl4woXfo4q5bNt7un
         cHB7jA9lFC9RQO2+UcBX0pUd8HV5O0TYwu1s1hvyelsRbsJ56YyJqJ2ApDpa6N/ZJ0yU
         Gn8z0KPj0Osh2AyDAc8b4B4chHGF4mpozcSghrhDygbINZbPGf0Jz3SQd/KOnS2e6bZO
         SqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090117; x=1781694917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtXn6rn/EA0ErHHIdUsuzWy/47T5NpEswd4MS/j3NW8=;
        b=ELPK1tbsEqvkAUrWRsoxw90atB+ctNFFr79AsM8hyUgZlkS5Pqh6TBXvyUnuFmPzTy
         BLCqEbuTI0Vuj1c+gz0c+hpklnnSaMmT6FHTGmzatjnT9acw72Pzhttr6dv2Zuu9p8ly
         KoZGVTDA5siDPiSs1zxkIDLC9iICK/jCZJi0wkAPBfQn4AGarDRmGVhkLlGkPE5QWeWd
         j6UWuh+HObg3IHKJnvdevsNQlPaAreRu05ymaSOWJMC9uG4iXi2eUnqVgYSvTNxkuMxw
         4J7vx89SIjnulbXzKSTbvWYLoFVjWh7s4au1dgzxeyGxl9W12xC3d8mUC0PE3w152EMd
         snFg==
X-Forwarded-Encrypted: i=1; AFNElJ+XD1bYj80j5IBlnfKDeyd3yQ2Jp4NYQz00gaEZaaW+sO2s7M5kNTouf3w0DNoGJLP+2YhH7t6hXtSlh/Ft@vger.kernel.org
X-Gm-Message-State: AOJu0YzBk2k7vbgQIPTZMu8Wg7WkEXGxZAyso5/cO467eiVePaF9Cqd6
	QT/qeY1ykWYup6iQK+UyiPWOCVEiYCqu2DXmFkNeSA1n6/7zonrGPgl6SIwTrZsscpA5DN4XYBQ
	zla7aq1iHl6Nu5AKMLzfneXwtNUGbkKVaKTcDOLGVqsM+2kZ4R2iuB/EPd86hNSlJNXt0
X-Gm-Gg: Acq92OHWxdoAUV4SuQGWTPUr9ngo19Bf61Az58yCcJWOQ07n+5dFKBlC5MmDVy6Y+KW
	g6JyfXSK5mkSz6yb4ZZfluUuPLgI1w0BJyHFZtp856tPyncFCPjsTbvkAaGAHukPoGU6zxlqgj8
	HIisx8MnlANYaLST63pxK3aliWZooA+uExyLWf64eUOdAViS9R1OZIqke02768LZEI9U02wvN3J
	SgkJ6+fEDV+4ErhsJbEPCYuJ7yOyPhrS9qgz8i6rtVGO/3i1RaVHEyG2/hFmT09O5UgsmVtl94w
	8g+yfhdiHSIdNagocVWbSdanJgar6S1ScRNTIHHkH1NnT0/8TahA24lnvCm7SY4F4ab0MX7C64d
	cM5UvUlcXJIsTcN/bfp3OJ0L2dc5cMoWR5Gn/cLyRftNHKj+CzvCgEXRwJVQ=
X-Received: by 2002:a17:903:15c7:b0:2bf:1e37:a2ff with SMTP id d9443c01a7336-2c2a19b70c4mr91203755ad.0.1781090116758;
        Wed, 10 Jun 2026 04:15:16 -0700 (PDT)
X-Received: by 2002:a17:903:15c7:b0:2bf:1e37:a2ff with SMTP id d9443c01a7336-2c2a19b70c4mr91203235ad.0.1781090116067;
        Wed, 10 Jun 2026 04:15:16 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa213asm256052545ad.35.2026.06.10.04.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:15:15 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: qcom: Add SD card support for Glymur
Date: Wed, 10 Jun 2026 16:45:04 +0530
Message-Id: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfX20fgSBmFkM+1
 dgdRk9T4rYECOQbWsxIWvymXtIeGyN2DwGOgLwkg+WXjIT3JfhulomhUAk2eMAdN3TZbiJiROTS
 vtRj27FuHtw7rFv0uM/UQVxTkNS1oxsbGJ+TjSYHGfKrH0rjr847ImcxEi+ovMtGQDJWaD8BLXj
 8Zc/trOmPJgcEDvhcJ3JEMnfpYOPmukqNHxdulsuT2HiQJpl5AxaD2SojJnXpG2CKC5qnVxxMxJ
 DAvXvkNf/PCshjv3J+ojd1yu4akme3V2ommVq6W9LLMHm2sXB4EHiEof5DO5W1QSDfs5a19Lvoo
 wKQZu5zzyYDYd76Wp1pa7T9qRsHVcyEGwpUUKC+rCE3/pvxVHa9MUsoG4gJ772nStG/P1GIQzyf
 s+d0StE8QBSvgV/rHUI/rMmsbynCA7xsAyPHDDIbYR7NEi+gmW0mEvGfSZJY6Fj5ZckLTrsM3Zw
 NWPGFCgKlVxuvL/tCoA==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a294745 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=wwrRmPaMfoP2Nk6XddEA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: svTjXBqzOd4Wded0owp1C6icBtVNu_RJ
X-Proofpoint-GUID: svTjXBqzOd4Wded0owp1C6icBtVNu_RJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-112412-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:ssachin@qti.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C5A9668B1F

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

This series adds SD card support for the Qualcomm Glymur SoC and the
Glymur CRD (Customer Reference Design) platform. The changes include
updating voltage regulators to meet SD card requirements, documenting
the new compatible string in device tree bindings, and enabling the SDHC
controller at both the SoC and board levels.

Summary of changes:

Patch 1: Updates the voltage ranges for vreg_l2b_e0 and vreg_l9b_e0 on
the Glymur CRD. Specifically, it reduces the minimum voltage for the
VDDIO supply (l2b) to 1.8V to support high-speed SD card modes and
increases the VDD supply (l9b) for stability.

Patch 2: Documents the Glymur-specific SDHCI compatible string
(qcom,glymur-sdhci) in the sdhci-msm bindings, using qcom,sdhci-msm-v5
as the fallback.

Patch 3: Adds the SDHCI (sdhc_2) node and required pinctrl
configurations to the base Glymur SoC device tree.

Patch 4: Enables the SD card slot on the Glymur CRD by configuring the
regulators and GPIO-based card detection.

Testing: Verified on Glymur CRD hardware.

Kamal Wadhwa (1):
  arm64: dts: qcom: glymur-crd: Update VREG l2b_e0 and l9b_e0 voltage
    for SD-card

Monish Chunara (3):
  dt-bindings: mmc: sdhci-msm: Document the Glymur compatible
  arm64: dts: qcom: Add SD Card support for Glymur SoC
  arm64: dts: qcom: Enable SD card for Glymur CRD

 .../bindings/mmc/qcom,sdhci-msm.yaml          |  1 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts       | 25 +++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 10 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 91 +++++++++++++++++++
 4 files changed, 122 insertions(+), 5 deletions(-)

-- 
2.34.1


