Return-Path: <linux-arm-msm+bounces-113930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MYAaMhbROGo8igcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:07:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC7F6ACE2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:07:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LwgxFQRd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SQ+om3pJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113930-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113930-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE13E30262C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 06:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD04935E1A1;
	Mon, 22 Jun 2026 06:07:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D709B23EA94
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:06:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782108421; cv=none; b=tIX5DOC14Uq3Nt5kVLaYGc+Yeca5pF6vagX/KYbvsgl/FpXyKl9O2OMgyMWMmb/uN+hW3Bl28s7sVvNbrdAWCYSRjIj2IJnJeCqPZ0m2z0kt1n0rSkEAIOFA4/1v6GKOAZgcab9WxiGFG3UtUWI3zapnIA2nJJHd2ucQ+UhWeOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782108421; c=relaxed/simple;
	bh=ubLzHNuLOlqyHCkLGy0Ft+KI4+N2WXl04jTpiJEwBvw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k0oQ8YFzPn/Pr1aBoCb/JgZnMz6HHRppZraf/HdKXT7hrdHeDAYHVUutjWEeoCTjVKSiVYOraeoeSd08h6oDJ42p2URTzXTCVC3jgkm0C1H/6FdDzvn3M8n+ctiwuzRY6pLJOy7eTqaenhPxk4luY0kP/g2O1N880c7n9Ml4j9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LwgxFQRd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQ+om3pJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59Hjh3800701
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kg/rF3NAlx/Bq1/cawAmea
	0GVMVsUfiloyx/XCuDl50=; b=LwgxFQRdPTw70usH0IUq/QoUIrmb3uwdBGn5gG
	cxJSja5ZCsxbKki4076MjwxAxrbroMkXrAJMlJfffp+VjMMBKsHGhxMnnoyCj1Mp
	0DfestD+u5lN47vWFB0mYQHiKUJC+Iq+VdLNWZnncgBzPBiv1PM/ZXrUCMiSvPAj
	EQA8O0vZUF+KSMnjWtT0P32qOGgTR7ftddpXC8ZB6kAUg/UsvIBJ6IH725SIub+0
	+gD/ZqSO+LHtlQeIv1iT82C54/jBe6Sq29eAy8+Me1W9rJ8s9SEnVxE9V50Zww9I
	Cu44PTcf15WbpXNv/I4N8l8YQqZEnXXf9EAHPLZ4rdq62vYA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k4u7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:06:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8453cbd38c6so3360895b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 23:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782108418; x=1782713218; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kg/rF3NAlx/Bq1/cawAmea0GVMVsUfiloyx/XCuDl50=;
        b=SQ+om3pJ/gmHS5wlIMkQRP5AD0Dkf9bXlTnqjnZoQhjyE6Dz7hmoW5Awa79mYLez4J
         f4phV8+0+k7WyovZnM4Q0XtSLtkKkzyIZcNsSFIYg3rJ/0/QoFF5DxCjl3IhjKjb+BrM
         uEqmzCOAy8ivG19wzLhEPimOH5NL/Ohh6CRWmI4yLMHwo4mO2KxsguOlbXQ3T2MGNk3/
         +wnqGBl633hCgqyETdKJr2uMz6z1GObrQxK3+Eu9M9BfMXHW6CNjJD+GQuvcA6l2bIXG
         H5ClgledkI2jzcwzN5fDN36annBZ17wfVV1khK2P6BU58wI+NHxSA8jJqXr0NRoK29dH
         ZvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782108418; x=1782713218;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kg/rF3NAlx/Bq1/cawAmea0GVMVsUfiloyx/XCuDl50=;
        b=iWiwN4hokWPaKdJCtPwyQHtwFg2pKCZWPqDulpN784337Pue/LhKhd/VRO+RKZGcnu
         3k5yo+gtIRPU86QFzN3Uq5SgkUV4ikfWowBmW96PMUAj5kvYL/uCoBSuEmeA7GKbTOgj
         D/saKnEn15pztGpJsO0C7RQ9W63BokEK/xmY93RI9QANANHC6ReO/6fRb2bLryqmeZmt
         8CMrNo41HKauVmc3mUkwxE5FuV+AlgRFVUMpSzEtM/+8ruAg+t1L1MydFbpU3NFI5vxA
         BrxA/CLz3DMQcvp9Q8DttvBOX06BZq6lbtL/PyLZC/9+fQ1Bs2jo4MrQlK1bXyMqPusD
         xwdw==
X-Gm-Message-State: AOJu0YxCqqtlOThFcqZGrroN3L1UuTZn1JYjgl+LvPgDhQvURDoPEcSe
	pceTVBHypx5v30YynVW7keB1io1RU9DeuPMB1lJcpbbNSVheMjYSOxwgEyOy40/NXm9dpHQrek4
	/fqRjljQYi5IJ5ZrPWTC9ARIoSgTEmO+CZ7ItwP/GKuHCwa3DYf44us0P51aiCDMyEu7u
X-Gm-Gg: AfdE7clFPpcbi2WNYKjmowaazhiXLz6nZuKg9olJdoUiQcUB9WmzTXWQRf4YO6TXNsD
	LPNknF66bgQ1aJj3TOOMNKxfhh8fOrcsOaWZyWutuQqR2FAv3twJPUf4wplrXne2Hq6D5AcEoRc
	rwhf+uxhVK/LHL4wcwAyi/oxBStVDYYfBGuKS6PgfbFac3YBB66+xod3gp8LVUnmqtF1cX+5cmB
	bKzBWfRK21AWa+AA9SCxeAkXIZhsdf/8EDI4SSSUXlYYLEVjbiRnwoELpKTEENhsFc57hLI228z
	M3Hi1l5/Jg+3qlmD6XR3irCoHXYCzevQRvLiN6+rZCRvQKzymJVgSI62eAGVr2mo4dg3mNwWRFs
	+m/HSJxTr6VDseM4MMYPTqOLk308Zdrhxew==
X-Received: by 2002:a05:6a00:2883:b0:83e:f208:b113 with SMTP id d2e1a72fcca58-8455078c6e7mr14329407b3a.7.1782108418227;
        Sun, 21 Jun 2026 23:06:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:2883:b0:83e:f208:b113 with SMTP id d2e1a72fcca58-8455078c6e7mr14329374b3a.7.1782108417790;
        Sun, 21 Jun 2026 23:06:57 -0700 (PDT)
Received: from [169.254.0.3] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e7696dsm8040520b3a.37.2026.06.21.23.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:06:57 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH 0/2] interconnect: qcom: Add support for upcoming Maili SoC
Date: Mon, 22 Jun 2026 06:06:51 +0000
Message-Id: <20260622-maili_icc-v1-0-0aa8286e6748@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvQOGoC/yXM7QpAMBSA4VvR+W01hxS3Imm2gyNfbUgt9274+
 dTb68GRZXJQRh4snex4XQKSOAI9qKUnwSYYUGIuc0QxK564Ya1FkUmZmA5VZlII/Wap4+t7VfV
 vd7Qj6f0dwH0/0Ge0HW0AAAA=
X-Change-ID: 20260622-maili_icc-94001df2a4d3
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: jdVPtdgArvkTW32xZFTBqH_9QjS1S5t2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA1NyBTYWx0ZWRfXzkX4NeeLViaJ
 s/mc0TJZCvkw/R4ktv/uRg7TjRGBonx9fQPSjcg+9vhJ6M1Oi6rwWzMsNFkDj/CVuOlHLB1tLAm
 wae1U+wJa/iJdX35owlEMDVqX2YvEJ0=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a38d102 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fnjDL_6DDnU8g6YDtasA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA1NyBTYWx0ZWRfX1kv7xU8+nAaE
 Iduw8nJVskBd5fOIgIy2Y+qQ6p2A3Cgwm5rpg/eIs0uITlxB7Ct4Ba8w9hYinwjEcUMrwS3yTef
 Hp1KN42e1hjD5sFMcJxqmMI0v5Xa9H5ccK15ThTxX6OKikkwLHaEet0hGZAWqw+3zJoh2giRWB8
 asrUr0GafckOvixrdv4Bpjwxyt3b9yrUtJyhRqE6NkWaxDcAkIzbOQaoWQb0fSYjN8jcbcWwQie
 rjUXsntY4IijPzQ/AQ7fFu/LfRdx3hAvsJ1Spf+nn7rDH7QIAoDUfD3ia/bgWJNP7AW+rdoGRDL
 Xkmw0vGCLoOqGVCTg2l4jH2ZiSr4u13HUEMKRcp0hZHoLy1d+36/mtgpJKmx7XntZZI2uLF+gwe
 I4XLnE3ROa8yUVh434a8Fil5vdoUSdxVLZ5IT5jltu4/cLeea/Us+hslkAzE22ahPyPLqjoB31n
 4WFBki++79L7hGRr9/g==
X-Proofpoint-ORIG-GUID: jdVPtdgArvkTW32xZFTBqH_9QjS1S5t2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113930-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jingyi.wang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:raviteja.laggyshetty@oss.qualcomm.com,m:odelu.kukatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raviteja.laggyshetty@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2FC7F6ACE2E

Add interconnect bindings and RPMh-based interconnect driver support for
the upcoming Qualcomm Maili SoC.

Device tree changes are not part of this series, they will be posted
separately.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: qcom: document the RPMh Network-On-Chip interconnect in Maili SoC
      interconnect: qcom: add Maili interconnect provider driver

 .../bindings/interconnect/qcom,maili-rpmh.yaml     |  127 ++
 drivers/interconnect/qcom/Kconfig                  |   10 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/maili.c                  | 2091 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,maili-rpmh.h |  172 ++
 5 files changed, 2402 insertions(+)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260622-maili_icc-94001df2a4d3

Best regards,
--  
Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


