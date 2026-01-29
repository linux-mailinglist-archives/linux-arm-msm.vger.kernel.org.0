Return-Path: <linux-arm-msm+bounces-91115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLTbGRr+emmHAQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:28:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76776AC343
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 07:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7138D301DC16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 06:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4825A378D8C;
	Thu, 29 Jan 2026 06:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RG+KlSHj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vq5mirHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7EB352C21
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769668118; cv=none; b=Ypsq0X0zjgI/ANuUf1a8GTGHWbve0V7qJ6uLVpsPmuQl2iO2l/ADTtX2TTuRuOgfauW591hS6Yg0E5gR3RyAahRbqFbj9G9KzeF3ngnTbtiEX8/lcrXpacGwUmgBaTWyWHJsMmY8DRDdgUOoHC91z2RBAsBoIdl9jVjk4BfF9tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769668118; c=relaxed/simple;
	bh=f9U4VlTe5L25yE7vPuCyDOHpZK06GgUC3Q8j2FC2UWI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aobiOepf/0HWCBT7rBD6XUHqpXkZeCvuRLEhJgvkHEQxGdpqL25/zfnykEOrauAUF2k5iSRklOxx7qmtbHWPYEeMYbiQ/nuIQ13llWoYzxGxHx9w7RwYrKrfdIsMmBua6wr5jGK7SpaLzCk0lz103x6vJ6w5FU6ZfDBhhYQQDeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RG+KlSHj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vq5mirHQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T39w7B1429052
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+87SasYpmni7qmhSxtRVOLR5+RGbYmbh+Nz
	320JXzDk=; b=RG+KlSHj2bpSI1hriBQJ8SGvUg08xeSMzBCg9RO4ontzKEHkOYg
	U/n+QoQPN9cbnsrBoIzlVMVxiRzfe+SuX2oS5UQOhhIl919IR2aTyPzCzelPAFcG
	0Mvs5uEb0GcGR8afeXfU6ALUl2T8MGgmMtquQQILqdv6PgmHX6kLOi2o4/XF2BwD
	xM1TSoPXv0MpO6VVeGHFP5KGtV4lcNXHBh+ZNdtmJ5oCOoLA1GuuGzmuP5TOrLcA
	AcVlhnqWrGIFkEM7BJ89ZemjkTq5YkQgHtrWfXsjx1bi8LiYNw2QJS6tuTVAb0zP
	XVARjO5mBIQ5orztQLkSlZD43/EiZM5Gjeg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byydh0fv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 06:28:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34e70e2e363so647571a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 22:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769668113; x=1770272913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+87SasYpmni7qmhSxtRVOLR5+RGbYmbh+Nz320JXzDk=;
        b=Vq5mirHQosJMyjV+0vvvF5QY4zMKQsNTW9KlwUBUhmA5GjpJfGbjxhc+SSWVTF2qvw
         iiuUDUcANuXcAf/8ttxjZKaCbYusSE0e9wt36OgZm+gDFo91+GlW+vhNIMbVM8vLGv1u
         3/633746MvbQL8mbYFuCsCxG4NUs/XWfuzPxySPd0QQG1xo1xqQbjwAh1gsIXzL8flKY
         Mxa0m953R5HrxGXBvbz5jc04JaGfQ9DKIYMwTApQLZmK4w+lt2JdT05+oNSroB8xmNaM
         0j6/vMTRhLaL6D0JInS2VtvdIwntGzL20r6wQmqyMX8QkqMR53jHLbies7wKi/42UsY+
         phMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769668113; x=1770272913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+87SasYpmni7qmhSxtRVOLR5+RGbYmbh+Nz320JXzDk=;
        b=BAoNWj6kPtqkm+mgnd9RwINYqELazlTX5vJdbH9lLDUup0uypU9pBY6QO6wNXk9kKS
         F+I0m6YB/KZ1g7pLKbqX04qXgeJ6W7gsm10a8DFufWSKd/P1f7dyjfu5TIQrMbKGaCO5
         RoJTFSX7Rtw0w3JVzaDqXkyKVnUTy6vMVtQXFq9/BFZUr+RNEzC6Fk+NQJ1cdCApPcDf
         QaccuN7LyalJbBeqYUgve+VawPqTlcRL95npTCpZ/kd9u2dgk5kAkzlzb2vbI7uZr+MD
         0Q/3UVPt4N2WA9Pki5MRu3NAgFw7cos5HZebKmmjbxTJkC3Ho3o/0k2GS1gVRkuya/fh
         90Mg==
X-Forwarded-Encrypted: i=1; AJvYcCX08lFFM7VEW7kivqtUiHVeoVMt311N+3Ev4p2r5n6ri4w+Z3lzS15nHviQWEgZ+6VekE1taFJEU2GE1a+u@vger.kernel.org
X-Gm-Message-State: AOJu0YwH3XQQZDcoOE3pBMBqCqZ9h9H2pjiIe37R4z+9WT1f+ldFM51e
	AkMec64NlRmKij9f7ESJZsACS+MonnKUz/KbMcQBtxDu1PRLmE1WrmYLiE9khEuJO98BAO8UfA0
	j6I1n87hpFnN6tVg5eT2UmsH3Wm582WvEovmSaHHY71yCOFjx5ip8+RFUqk119Ezd24OZW+GqWy
	gI
X-Gm-Gg: AZuq6aLYNk/pArtkcq5KcTDYVxLtoXBrN3OZnzJX4t+SagLio7UioagGWIJSzX04r24
	r8MJYbQHOxRWTfJPGwfYJL9i4qfI6uJ2ZXf1+fxm7gfzOn3BVgSNM0YPPPyiIND1+Pjacb74d3N
	HgLlAHPeJkPIP3XFrWugFQXBL+SrE4vMph5JorhiiuzqdNSlQRS6dp4Q7I3LewXPwGVRN+oBkVq
	LLGP2DiJq7c5YPkBVzQnZDD+AG+/p+3gqcelM3P4fd/+fSuLUvx/0d9dLJGvV3tnY9OUGrSi6um
	+eJuMcVqOcO2AFQmcjKuGbKyVq3bj++C4SWN3Jl/Ll3KBc8Zbop4Jf3tw/zHnbt/NvSVvx4hd7N
	NX5ghBNfrjpu77jvXjWiYjlLXTeo225vCUHklzPshCA/aK4RYP6W1Tic9XiPRyY/qbRT4WtHF5y
	sBImlIHIZYpJno2mhDYCa0ccDv3aV+Bn8b35yotak=
X-Received: by 2002:a17:90b:3901:b0:32d:f352:f764 with SMTP id 98e67ed59e1d1-353fecd08edmr6432739a91.2.1769668113439;
        Wed, 28 Jan 2026 22:28:33 -0800 (PST)
X-Received: by 2002:a17:90b:3901:b0:32d:f352:f764 with SMTP id 98e67ed59e1d1-353fecd08edmr6432718a91.2.1769668112972;
        Wed, 28 Jan 2026 22:28:32 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f612917csm7215943a91.8.2026.01.28.22.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:28:32 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Enable IPQ9574 RDP433 eMMC variant
Date: Thu, 29 Jan 2026 11:58:21 +0530
Message-Id: <20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z2Cr9taTv-VpSY_lwbcaSFAHvyhnPlic
X-Proofpoint-ORIG-GUID: Z2Cr9taTv-VpSY_lwbcaSFAHvyhnPlic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAzOCBTYWx0ZWRfX5oyBxNR1I/yG
 DG/76L9EeSZHbrHafifJxEM1c0PpGa61m8QYI7DwHEkkAb/WpVGb11gKn2zyk1Xac2s4RNLPp4f
 sb8cgB0q4DnkwH0gj0iTKOszFzlSMFqXZ9vBrXTfhtw3St7eo/5X+TMpKj4WBUzhuxzcjCrHP2v
 YdrKH8SXWmgRzgIFtaS6znGBPygc0ir4WousqjXf+WGe77U+JA15diCVRh+h889cwpLTfsntBhy
 c8sMqmejV6kbAPWHepELm47gfnw1qAzI1Hmk5MArz6cttke+OQeXGjXlXgFT8zcaw1OGaPQSgv3
 NTf+uFI2/kGRc6eRV+Yq6Ba8vzFO7waO69e07oLWfsf1WbDtFf2sQEuxa39p0WQ/JT8SGVtPobb
 cFghOBAxp5d/ToihCuNl23wAOu3opLjstibP9YoeRAq4bQHFLAjeTGV416hkOQldbjUH4q8prL5
 +WC1/OGoFr22+FC+D1Q==
X-Authority-Analysis: v=2.4 cv=Cs6ys34D c=1 sm=1 tr=0 ts=697afe12 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0U-vFLkCacPubaFtw1EA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290038
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91115-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76776AC343
X-Rspamd-Action: no action

RDP433 can have NAND or eMMC based on a board level rework. Since the
same GPIOS are used for both the interfaces, only one of them can be
used. Add a new DTS file to disable NAND and enable eMMC.

v3: Disable nand in ipq9574-rdp-common.dtsi and enable it where
    required.
    Add r-b tags

v2: Create two separate DTS files for the NAND and eMMC variants as
    suggested in the review.
    https://lore.kernel.org/linux-arm-msm/20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com/

v1: https://lore.kernel.org/linux-arm-msm/20260102104638.3802715-1-varadarajan.narayanan@oss.qualcomm.com/

Varadarajan Narayanan (4):
  arm64: dts: qcom: ipq9574: Add gpio details for eMMC
  arm64: dts: qcom: ipq9574-rdp433: Reorganize DTS to introduce eMMC
    support
  dt-bindings: arm: qcom: Add IPQ9574 AL02-c7 eMMC variant
  arm64: dts: qcom: ipq9574: Enable eMMC variant

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   2 +-
 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     |  34 ++++-
 .../boot/dts/qcom/ipq9574-rdp433-common.dtsi  | 121 ++++++++++++++++++
 .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     |  29 +++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   | 113 +---------------
 6 files changed, 187 insertions(+), 113 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts


base-commit: fcb70a56f4d81450114034b2c61f48ce7444a0e2
-- 
2.34.1


