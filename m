Return-Path: <linux-arm-msm+bounces-109849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPq3G6yyFWpxYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:48:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9225D7E27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EDC83052B7B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C08E400E0A;
	Tue, 26 May 2026 14:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOvtZH5x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jcuYWWw4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CF1400DE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806536; cv=none; b=eGSJfq1CEsliALziNvTVz13FAIgAj4fDjcKXNHbQ6KS3pGgc2qLG0owcMjVarzjeWSSZGt2iHPFCIUEvIb2YWA0qv1lj9EV8oXX+jmurSqIW1VXH6aC216fcJMJorzVERfWkW/scj/N1IxTWoDKAQ+g9Tcw27195omh+E5PneNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806536; c=relaxed/simple;
	bh=uLBVRdHt1DzWyNxdmo3c1un5xSXTEc6wp4DIMqPlal4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W73aB8Ay2DYin6Y+tljbNij6yKMurg/VcT3Wl82X9s/39CUIUc9P0VGTU8gQC7xDuxR0kailvG1UnXmtyM4vwfx/uZNN8hOyG+IYIYTjZoMkqlTiG6fWllUAmkT/zOfDTA3YkRaQC5mo1TcY+8NczL4H5JYAn8PPtFlYJ0WVUHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOvtZH5x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jcuYWWw4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsC422554544
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OJiQqr3Kx8IGfpljF3ubZK
	SLxL/TpGa8jIJrCHd9nnQ=; b=KOvtZH5xB6yp+4JZnbkSbPMS8qvSqY2FJ4t3Qo
	YU+jMF9039wl6J/Boy4V3bDCJFVrs7ErloNk90U2FJ/BB0N0g54JxmkC/0q0zhmE
	XleaxDlE3KdY+4GVOBG6P330O1V9T690DPp7NHCFkgJgbhFxjQKaZYVjp6tvEGnH
	lzUu9AOsgFnRdvPqzNavlHX0HCe0KvGniq03NABx0F3ZhZjiVqzMbWdgARmHKgS4
	eUDEu7Uktyv37nOuESVIFp6IKA0WfogS4v9FxvF6dducyyiB+n9e+HTbb17bCvyG
	Q39GeG6RYX8cb6Xjk/4AldH/o9sKEco52elqZetBJykL0FEQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3tbx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso6315260b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806532; x=1780411332; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OJiQqr3Kx8IGfpljF3ubZKSLxL/TpGa8jIJrCHd9nnQ=;
        b=jcuYWWw4TW4WzX5BZSndMsWxC9kjfKpU9y8fp0sX0duh4grFo/YdSRg7cInAyLaJYm
         YeCqduUQA0s4jzcClv/EYKzs7z3MJB5m/HTM3rHlf8p9XjNUgJWUQy3IuCyuRmqfG7S2
         16w+tJA0LegeESzfai6WMnz06yELe1abonbtmPKQn6O2JrpkuoV4pNa0jwNPSBBxvIRq
         tJRwEOylCBDmIVyAOXjG4qc/ti/oCY+OZEDBnZ+v49dkjr/+ZNB3h5VOIlyxmGccp2iY
         OFtDznp732LkAZGYrvuuRJVbpYNpbnvUc+oKq8o9VRqV2/fJqrgWx6t4KTsnt9HK/40b
         8UFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806532; x=1780411332;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJiQqr3Kx8IGfpljF3ubZKSLxL/TpGa8jIJrCHd9nnQ=;
        b=haBGw320mjcgXTa8GJ9LnaIjwbKqOATAGwgzXWrNqoV0XZf2XkG7z4KIgIg5W5WLEC
         Dllq7jlH4sYac3GUvaGkNXGxCPJbLTVZklNBXnmG015EPLqMxWWsFvljuzajZaTNbXQd
         +rQBwlfiPng+/xCsEme5ohuN5cZYzYGRr8EcrqST1IfcwUEDQk3P2Ye6E9G98su3EzXQ
         +C27WkT6m80Dg9nhrcY9qs/suGCq890nDqG3C9CxNBUyUM79CDRYHpwImdI7KDq+f9J3
         moxYnFIpfj7AUfs+U9KTp7EHiWJMlOqIL5Z7ZgkRROBZ21UjEvEWlLXEPwm7/iXviAfL
         vMXw==
X-Forwarded-Encrypted: i=1; AFNElJ9QYcLEIYkqOlA3epJJ8JcRuzPcWFFuAgMyBMglS5hPykCOkHM6CbB1IYxo8TjuXO7oSlt+QV6szkulVN1W@vger.kernel.org
X-Gm-Message-State: AOJu0YyBlK8DSkJLK4PHHvRf0aS/WgN5tVZVEFQDss6SojoZkuHfwsfK
	b+ejosS2zptUaVlBi9MXKxP1qy85anYICGzfZ59s+1baa51bxsh1hqERysX67XXxwAAKd+gjJ1Z
	JQ9VJSIEAGrApq56dlRufc1DKdNeQ+WWVHQJy2m/VlA9e5WqYXsqBkwulgMM4c7r8bhLn
X-Gm-Gg: Acq92OH2vE6Tjq9ysAuAgKIS/+EdQoLV3PTKeJ3fNFOxqIBeUsEWxAxHpIqm6rm0dHy
	tJzb43z5LlJYM9/IlqAQGKnllIQV6/6lDxJDEUOqk2f7jopMgPzhFeHtKvCLrAxlIOd2/u5x+cy
	udoYZyUys4nT8l3dntmJTvqQc56d0xs0j1Q5kztf2KFoLmn5P3RkAPYKdBjMlXgyvPsH8dr36CD
	pC8X1tD7eGyKhYYTahtFaC7lC33XevJTPHpZSLU27nmlPJ8pIVI9WvGvMfL/zxv0fMQz/IakGCa
	7kvidgIE+jQ+yirktGzTzsCuVZQs/qR2FrF4I39GF5fSIFcubhrm2urR4ntKoHZy6PUxvLHoDwn
	ppRgdHdBGg1oWOptcmc4DD9pwjuEiaBGjMkoRAeR3ixlCSS8YRgjb
X-Received: by 2002:a05:6a00:2da4:b0:837:e9cc:d465 with SMTP id d2e1a72fcca58-8415f19e22fmr17299171b3a.20.1779806531949;
        Tue, 26 May 2026 07:42:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da4:b0:837:e9cc:d465 with SMTP id d2e1a72fcca58-8415f19e22fmr17299129b3a.20.1779806531391;
        Tue, 26 May 2026 07:42:11 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:11 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH v2 0/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Date: Tue, 26 May 2026 20:12:01 +0530
Message-Id: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADqxFWoC/x3MQQqAIBBA0avErBPK0KirRIQ4U82iKdQiiO6et
 HyL/x+IFJgi9MUDgS6OvEuGLgvwq5OFFGM26ErbytRWxW07J5ZEwe8i5NPkEDnlTGFnbGsaQx2
 2kAdHoJnvfz6M7/sBQV7ISmwAAAA=
X-Change-ID: 20260516-smmu_interconnect_addition-d9567535e9d7
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806526; l=3074;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=uLBVRdHt1DzWyNxdmo3c1un5xSXTEc6wp4DIMqPlal4=;
 b=/Ne81frZrkFm12O3bT5MXS9r78AlTz/iZ3rH89KQuoikLX44xrKyZYzPj9hBcNKbp/325tjH8
 0XBzvdHMDjgBCjsAjZPjbGiePAPo5dN+smBTmF6hDnj3cr3fkfQFBAa
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX4UNoVV22aQbU
 Ls8jKWoWuc6kx0ql5Z4LZmqvMQTeW9xb2UoYnuLBkzeZKbAcHRUCVuUfYjMNIBWpq8tSoucZh6I
 il4IlIJ4Q8++NuiVMeJP6XVn7n2zliSHWBwdW/gTEg27sA34y6XnobcRBk2wII929TPk1je/Own
 75WnsV48Ugvw7nFbwDxQMl07boLPYwhso9VCB8wpfdsz7HIHyCTXQqElyQZGm4d/dBAm6pKwNBG
 fZQBAi+IoEis5zFXft1/msezJrTGYwyJ44JnXWRf18pSNorxf4POYqV1U2kDhBbSxt4WRmFCHrq
 wuW9gsUY/GCPwPBC2B6KD6GRbqs9r2vy/z8LGY75YKJfWgTqe9gGsQwjL9Q7azpX8iuh0gHI1a5
 HjjYbhIfy66JCooyqR1D+79Tdfs5Isqm9KL10G8uLGqi4ePKyd+ReILg9Sf1OpX9BXzRKkqQ8ou
 ckTyXPqEqsv5VSN9K9g==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15b145 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TPSRUwCClOzv9anTvj0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: QePudhbfvFlDtlhPSI9Os_3h5YyCIkKt
X-Proofpoint-GUID: QePudhbfvFlDtlhPSI9Os_3h5YyCIkKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260126
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
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109849-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8D9225D7E27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On some Qualcomm SoCs the SMMU register space is gated behind an
interconnect fabric that requires an active bandwidth vote before
registers can be accessed. In the common case this vote is held
implicitly by other clients (e.g. the GMU device holds a GEM_NOC
vote whenever the GPU is active), so the SMMU works without any
explicit vote from the driver.

However, during certain power transitions — specifically sleep/wakeup
sequences — the interconnect vote can be dropped before the SMMU is
powered down. If the SMMU is then accessed (e.g. during runtime
resume) while the vote is absent, register reads fail intermittently.
The precise ordering makes this difficult to reproduce consistently.

This series adds support for an optional interconnect path in the
arm-smmu driver. When an 'interconnects' property is present in the
SMMU device node, the driver acquires the path and votes for bandwidth
before any register access, releasing the vote on runtime suspend and
on error paths. Platforms that do not describe an interconnect path
are unaffected.

Changes in v2:
- dt-bindings: Cleaned up 'interconnects' property description —
  removed "Optional" prefix and driver implementation details as
  flagged by Krzysztof Kozlowski.
- dt-bindings: Added allOf conditional using 'items' to restrict the
  'interconnects' property to Adreno SMMU nodes only (qcom,adreno-smmu
  with qcom,qcs615-smmu-500, qcom,qcs8300-smmu-500,
  qcom,sa8775p-smmu-500 or qcom,sc7280-smmu-500 compatible), so
  non-Adreno SMMU nodes on the same SoC cannot use this property.
- Added DTS patches for kodiak, lemans, monaco and talos to add
  the GEM_NOC interconnect path for the adreno_smmu node on each
  platform.
Link to v1:
https://lore.kernel.org/all/20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com/

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
Bibek Kumar Patro (6):
      dt-bindings: iommu: arm,smmu: Document interconnects property
      iommu/arm-smmu: Add interconnect bandwidth voting support
      arm64: dts: qcom: kodiak: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: lemans: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: monaco: Add GEM_NOC interconnect for adreno SMMU
      arm64: dts: qcom: talos: Add GEM_NOC interconnect for adreno SMMU

 .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  2 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  2 +
 drivers/iommu/arm/arm-smmu/arm-smmu.c              | 57 +++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |  2 +
 7 files changed, 92 insertions(+), 2 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260516-smmu_interconnect_addition-d9567535e9d7

Best regards,
-- 
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>


