Return-Path: <linux-arm-msm+bounces-91638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJdGO1fBgWlnJgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:35:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AAED6D6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 10:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1356E3096748
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 09:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B2530F934;
	Tue,  3 Feb 2026 09:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sc4SyQPD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOw5U7T+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53601261B96
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111196; cv=none; b=Yp83t0komMJLugyxG4VzbbV76SBKGEiguI5ICoiJfjjpWUUXaFxZqQo4yFYhxw9TLhsE/6yRC8cFNP6LV63wJEBpreD5tKOafuZF88k92BYfpHGkI6KSLsNRP0pUruPVNnuwHoPBFLSUVcsVupo75p475BwUQlfGdVVDMHqJfjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111196; c=relaxed/simple;
	bh=XccZ96lDk92iWJrEvzXKPxaQ7i+4YFT1eB80lzaLe3A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AkT/TgxX7CSUv11Eg+tmGoq2vuvM9i5cUjSYxMQyikecf2LBemMpPgT1JLsyNbOZXMtYhFCh4JZfGFgBjv+uljJzz7bPZ1VKXHUXg8KS808Y+GcfepLWYyUkbNQyst5DFNyVAY+1/boIpH53phUhce5kfhHmyXIkFYO35WyCEiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sc4SyQPD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOw5U7T+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613622mY2848656
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 09:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u0laHcyRQqMcqzyGUiX+7U
	/mo2y9fWruTI7bRibaktY=; b=Sc4SyQPDkesghXqJhHjryJTjMZEeoEEmV5rXBp
	HU1pxylIkGITFG5gaS9rm30gkw7RA6oodAtSh4NBcFtna1x3jk9ewA3n6kdZReAg
	RU55ntpIAhH33LIxerU/YfvDqb+/q+qxK3rUoI7NvhiigpyjcZA45+0/3ZUGsEMh
	wR7XxrZsvXxtza3f817WGN0BnL87GmW/9w6ObTsLVuO7eEM/E2heoEmc+1/FUtKU
	dCI0jMJ6qF893+LBkb++DI/hcXcd9dyhiveAvGzCUEtBlkBwcWtUjv1lRQnN6jQ0
	tmYN+4E5FdxUKj3ySdALcs66jhjFYAkK5Kxy6ZdJMyVWYjhg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tqtku0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 09:33:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0bae9acd4so39787835ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 01:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770111193; x=1770715993; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u0laHcyRQqMcqzyGUiX+7U/mo2y9fWruTI7bRibaktY=;
        b=QOw5U7T+MDqqInzoKuQQ4WhmfXss5etKSvxBkDZNhYQ+gfdbzbpbro65yZzAlgxuyF
         xzXACWNmiG57VInm3vk9e4Z1oUi7x/AweT3SKpjNr/nSLFbGn96iLhzCYP+i0ydNomGO
         tA8GeXqaYMwNFHZgn0SYiIVmAnAJuxODtmEVAfMOq5KcqDc2xsUOSO4w2VRdn5dMFDTJ
         MBQzuLUOxs2ULO5erJ4CSPT3qLiYetOt0DiNw0Tz7Rc680RM+ildVP/HTtxJiUnNs+cD
         rUXX4J/bJdjQVllzhyaC0RhWPw3UrrWKVPd6pSIDgR7UtARBtJySui3zF6/4T6mJgmg6
         B2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111193; x=1770715993;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0laHcyRQqMcqzyGUiX+7U/mo2y9fWruTI7bRibaktY=;
        b=wIkpY4P7C1WI08xva5afqrtQkbPypBSp8OyA6iiOvGAghdJBDnHxZAOPkk+FQl8jW6
         j9/c7laSgkDd/I0x6RYD86ARTCItGZM8bIgU9QZXsOOLGT0wT+FwGapumNlGLfIme1Xx
         wEwAFXkOzkYMwvPn1f/9YTGFCyTR/IvLOtrH65jCoxzeWUTBa4G35dRVVvx4A8O+vxgP
         5u9U80b9i1dSb+PmileEvUzgpVVqlRmeYONfsD5M5QHhesZ66zbYbuvtk/x6tc3B6Shh
         /S0ZEXeUja7RRnFtSLM5/g1j7PLFCWO0mRG1n91jHIr4ro5GAHNX0EEjW/Xs3BQorJR9
         R4Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWAsiTu11+GLvdsXDX5Iwt5mJSwc6BRaCmUYfyAoXVtO9CLHhj5bxoDMsVjWYU7BPiM5BaEE93A1X0XOMO2@vger.kernel.org
X-Gm-Message-State: AOJu0YxBvcZimhhRCGrUZyh7B7a/0g4t49tmYcUYB2FNrDqn+56cx80P
	x6/KuPvEhe41dw5lrYt9jL5GABaM70zervyIjAHxxKXmJ2u/yzflzmAtXNJTPAiG22e4L9j/8Rq
	9b740QS86oIHRxjkApnHaIXqt/eW3ivlMxElSiCzgpg4mYJAz7bAd8d2+ktFYuWvAwBf3
X-Gm-Gg: AZuq6aK3sSgVNXyXQnDkdN1uiQ2T2buriesf8MrZtEKomx2FcBgF0OgQW8F61cno8rk
	Nn5rNVmBoaSJLEXUmObVBKkwjDxeM3OLpzX6w3RATIuR7eLwPPRCY+/4SXIqPJtliAl5BmZVzkq
	mxU5wHdQUDwsJ45OcNENB69vjEs4DPIMCbeaEqLgMRCvNnEL/2GlqSXhNbLZ/Mk87ZGW/EkbSWQ
	OeI5NekKB4NuW8bbE80YBlx5xRLRdU2FALre8yVJMhYUsEUQvwYBOLMwABeMw5xFsUkZAvVLW2h
	ElZwLZX7SurFxTMxqN6v90IdXbwbBAMkDtN8x9UOt7xokw8H23cklcDm2AjiTqZxAOnH4Bj0jXi
	NCed/JjzF3f5Y9KuhO9DQ9u3/wM+keorZz4YnbTZcouyXqIOtR9EJVxYqGFdnQ9dg9wXpm49D
X-Received: by 2002:a17:903:124c:b0:2a7:3db0:6efe with SMTP id d9443c01a7336-2a8d959344fmr141413355ad.12.1770111192865;
        Tue, 03 Feb 2026 01:33:12 -0800 (PST)
X-Received: by 2002:a17:903:124c:b0:2a7:3db0:6efe with SMTP id d9443c01a7336-2a8d959344fmr141413085ad.12.1770111192392;
        Tue, 03 Feb 2026 01:33:12 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eedd0sm162489155ad.3.2026.02.03.01.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:33:12 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Enable CTCU and ETR devices for multiple QCOM
 platforms
Date: Tue, 03 Feb 2026 17:32:48 +0800
Message-Id: <20260203-enable-ctcu-and-etr-v2-0-aacc7bd7eccb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMHAgWkC/32NTQ6CMBSEr0Le2kf6ExVceQ/DorQPaQIttoVoS
 O9u5QBuJvkmmW92iBQsRbhVOwTabLTeFRCnCvSo3JPQmsIgmLgwwSSSU/1EqJNeUTmDlAJKPrT
 UGs6axkBZLoEG+z6sj67waGPy4XOcbPzX/vdtHBmqs7xyJUiLvrn7GOvXqibt57kuAV3O+Qu5Z
 2gNvQAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770111187; l=1615;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=XccZ96lDk92iWJrEvzXKPxaQ7i+4YFT1eB80lzaLe3A=;
 b=HYNegZBQeqLhA/pAeMb8NnSR07v4leZeJ4ohDhazXGy7TLosKqvwaOAOfu02zm8lM00YeLG9O
 GhSWE786Ue3BcNcWh3W+xkbMSZlu96fWyWN9nR9RvgYdFw6F+6YY01Q
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=XP89iAhE c=1 sm=1 tr=0 ts=6981c0d9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pO0fZtIvyn0UN2_VQdIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Lf86arymYawcKj1nLhtHq7NfLS-CCwWm
X-Proofpoint-ORIG-GUID: Lf86arymYawcKj1nLhtHq7NfLS-CCwWm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA3NCBTYWx0ZWRfX84mfTO1B6B3K
 9hWpJ9NegRLwhgz7ZtEcfx/HJxHNTnz9zuoZOb4wZL4JSLn8ufolefHGYTLQ28NEmCSv8u+m7qg
 U34BQWhBCh5akvM2+f1UvecR5uxfc0uxek+Yfxx+4tsgTvs7xNbtIIrOKwQ2jEJS+FH1DCRKUD+
 1x+JsrV/oHWAkhiJe4VkzkBpIpmfXORdxj4ckqpgzxBY3I2qFLneF63YieEREzXW2+KRFlgAvvw
 ZAQshLr9OqYIzQmJXc+bNTL7JleVDFAWKad2lLiFFxBc0B/1GEQC9sTQjDFld7U97M39YxByH3B
 J/bovctv5o0bW+SazmmohTuZBZx2Djnb8tYrQYGWCG8ehN8BVj62brGlXVI5FzrebJoa1KxP9H2
 P7nCi/mjtBBXydmi6p9+mz0znDcB8h6MP+QesZ4CWhy3ReugGdPirCkPYKJapYCglssFajxPBOf
 nsADRLjCMZzkqz4SP4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_03,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030074
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91638-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59AAED6D6F
X-Rspamd-Action: no action

The DT‑binding patch adds platform‑specific compatibles for the
CTCU device, and the following Qualcomm platforms are included:
Kaanapali
Pakala(sm8750)
Hamoa
Glymur

Since the base Coresight DT patches for the Kaanapali and Glymur
platforms have not yet been applied, I created DT patches only
for the Pakala and Hamoa platforms. I will submit the Kaanapali
and Glymur patches once their corresponding base Coresight DT patches
are merged.

The Hamoa‑related patches were posted in a separate email, and I
have included them in the current patch series.

Link to the previous Hamoa patch series:
https://lore.kernel.org/all/20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- change back to the numeric compatible from pakala to sm8750.
- Link to v1: https://lore.kernel.org/r/20260203-enable-ctcu-and-etr-v1-0-a5371a2ec2b8@oss.qualcomm.com

---
Jie Gan (3):
      dt-binding: document QCOM platforms for CTCU device
      arm64: dts: qcom: hamoa: enable ETR and CTCU devices
      arm64: dts: qcom: sm8750: enable ETR and CTCU devices

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   4 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 177 +++++++++++++++++++++
 3 files changed, 340 insertions(+), 1 deletion(-)
---
base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
change-id: 20260203-enable-ctcu-and-etr-31f9e9d1088d

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


