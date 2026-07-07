Return-Path: <linux-arm-msm+bounces-117401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +mtBOBdjTWrJzAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 22:35:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F371F907
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 22:35:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ILFGH1CX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SHNSRO5I;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117401-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117401-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC09C308AC52
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 20:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915A93EB0E9;
	Tue,  7 Jul 2026 20:33:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5288405F7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 20:33:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456398; cv=none; b=VWaAmoCUbaLvZLeCZIcfOhCx3D4anLczUbkMMtmO6ggYSKlEmKJriIOvLena0vYsJiOrXKfCSqIgYzlZsTd0LB10wm8udw//dhREqn2iKUkusJBMst8o8DFf4zxncJUKkh4ZSwex6fw4q9uv2E4QSHqPldm8QLh44n6Zbvs00tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456398; c=relaxed/simple;
	bh=gVizImy89dLlQHCSXj3sY3Aa7FEYtyCZy0xM9oJaFxY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eotPfBmxWip+3GR6aI6HdMYWQCw+Mp/cBJeunP5Q94VpbgXD6svmHOj7uNdE0h/BIAdsziG75Z0jIUr5nDtPFcrzT4GOjDb1irGvnlRfgg9+lYH3FzFPvmNnMN+G9nEpMyfPYULVHCxAVtTvcRy7yCu/0uD1ECMqhYD81PWD1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILFGH1CX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SHNSRO5I; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5G7F542074
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 20:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9W8kXXmEwm1yikiuYV/Gds
	qOtO+zyMBhGu2oOaEsvuI=; b=ILFGH1CXb+c3n7EqREyxaG7ngb1be1xqSIQnYm
	ff0iL2qymkn2KNUG+q860YOIdOxaYGF3kQ5tKqBNajjy93ue/Bb1pG8pPEruLK0y
	aNeKosipVKMwwCuMVvGhpXzbXPR7yJWbp2uesSrEu+HixRcpl+CijDNZOv6KtDdB
	7WhgDYhFHpxTprQ8MRgStm8kobCHcnFbuv2oGLg0uPqyIOkqju8bQHpeD2fB6wzp
	QHvMvrTc7BNwD7zdz8JtKi4wwq1IvUO7ynk0y+lRo7uNAg7fUPyxnIng57ppV+mK
	Vg2VvOLne+Ira+MdyrVE9z4EzipFdxbVqgqtr6LEqDUc0rRQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11u9dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 20:33:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso4832876a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 13:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783456394; x=1784061194; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9W8kXXmEwm1yikiuYV/GdsqOtO+zyMBhGu2oOaEsvuI=;
        b=SHNSRO5IvpLOlGnQQFWhGNWlFgpHYccd4uwsrulEaqwXjMP1or8bnSo97Y5Y/6eEvl
         sBKUYBlZgMHX77MTttWgpZDsad0U81UYD8GQ9PvWPXomPiU2gHx5QT46cUJFS3Khsvs8
         0bsT+OwKkA4WGEdQ7ErgIjI3+J353ebXCNjdTm1xHbXb1hgyiTKWqgy1oD2kC89MrPeE
         4f2k7j6S4NaywxrWLGhaRGAZFUMOHcGRjZsGKfFDjDn1Oiq4WgFF7NMOB5PRyv31Mc4d
         Z6vn4NSXV0vzcXDGaakyfTmTqvBmCv4P5Z/xH7TuOUNEON2Y/DOProLBKbU55cIFI3oD
         nMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456394; x=1784061194;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9W8kXXmEwm1yikiuYV/GdsqOtO+zyMBhGu2oOaEsvuI=;
        b=B4gDLMqxtbcaEuAqaBdGWO+SoIDGmOfySgt7MB8rzCC8+q/cGcCCu9M70lY7Y7xBoh
         yjpUsykCXi96EXGmPGhOAtpEmJkmXxakgbrQh64yuuBCT9dXzkv7oqcxL+q64FFE+QSE
         e0lUw74Gnk8gstzt1wsGhB4ipm8BPmJkTRG7iH915O2U9y7X/qa6kW7QVawylb8SLLOZ
         +J+R9kWSMO+QDB2HB21h8pR0lXpDX6g/aJ8ma9obVTBWVRS5/bMh4omgAfXgEIhJ+2kV
         BcwnXHlkcCam8sGMdIU5ufACnA77fvBBORBgGh7xPZNFxJM568D4wsMPtLVLoP/Y2lsE
         1zpQ==
X-Gm-Message-State: AOJu0YxlIZcl71enrnMqsrJbyCEc8AiMaNQ00+2WfAFraOHnOmhMG5Hh
	jpAEMauSoC3pAkjPjG7OWPoB2fCFyAvlsyN0Wlo9PX+9kokWEt3jSghYHRsH1wE/edhyMALm3Uh
	4N5SD+pga1FaZZ1eZUAU45U8smmixnf7AxLJlHPkEypT5jL8fRpW188XLdskd/9lXANFg
X-Gm-Gg: AfdE7cl72Vflwe07v/W6JugJztQKSt0evnFM8FTw1LbcK8nRQ0i212bGcDtbqFT4LlP
	ZzSMfVOmUkof0JMCMzUF3JcigHqYAhIo2OyuoZQvdG9AkpU1NvTcNncDVHo+aIW3SWyMMHiJgTD
	mjDdkWULwKLe6De/QqQlBX/P4L+gvmIPK9R3zw9Emr3JUJWY9poJMFxaXz601Ndg0amRjP0w0pN
	dlMW8BYTApFGW9tkisUfwDsVHPpOH7oD/D28EnMfm6eLY3zllFP3Tk/ufdR3EaZhZ+3tTjNGD0G
	zxYlzGzA/N9DR3dTWL8ax37+Kt0nN1SpMuceZtItKo4/jSE1WapbFkvxt6VgRbFrb7peeo+DIkY
	X9khgVl5FtMvAmDsdNym4zG0UMb0PmtFiPF28doXFKdCxVw5d
X-Received: by 2002:a17:90b:562b:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-387e0fa6abfmr4419245a91.34.1783456394275;
        Tue, 07 Jul 2026 13:33:14 -0700 (PDT)
X-Received: by 2002:a17:90b:562b:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-387e0fa6abfmr4419214a91.34.1783456393688;
        Tue, 07 Jul 2026 13:33:13 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm11975804eec.10.2026.07.07.13.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 13:33:13 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Subject: [PATCH v4 0/4] phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
Date: Tue, 07 Jul 2026 20:32:45 +0000
Message-Id: <20260707-hawi-phy-pcie-v4-0-8d9cc6324947@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1iTWoC/3XOTQ7CIBAF4KsY1mKAobV15T2MC6BTi9FSS0WN6
 d0FjdH4s5nkJW++mSvx2Fv0ZDG5kh6D9da1McjphJhGtRuktoqZCCZylrGcNupkaddcaGcsUlF
 ACaAl54Ak7nQ91vZ891brR/ZHvUUzJCQ1GusH11/uBwNPvaddfNiBU0YFzHVRSsigNkvn/exwV
 Dvj9vtZHCSdCOKF5Ex+IiIiGktWVJDlrNJ/EHhD+NcnEBGolRRGyQyV/IGM43gDIKHOlE0BAAA
 =
X-Change-ID: 20260506-hawi-phy-pcie-283933b4113e
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783456392; l=3439;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=gVizImy89dLlQHCSXj3sY3Aa7FEYtyCZy0xM9oJaFxY=;
 b=CWzG8LfkPqz35P743PAxAul0qjSWPYaaSUO2nGonYTWvGqz2FvPIhY2fUtcdJWhhlW2eTAhZZ
 qgEuJ2MHPPeCbgD6LgJP/TWoHSFKkOjcWIUYQ0Zh3V6yEc5ZArerHuB
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4d628b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8
 a=JfrnYn6hAAAA:8 a=NdRViCHAqdO61CPby4IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: bdYudDJJuwCAb8nn3FxcXJJgBA1GLOW8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfX2v1WeJGYPZO6
 ewBjUvdoCq5Mjlr7IH9E7NqeWI0IDOV2IDfaaASuPK5Z5GTRILoWM6nZ+I/YUNx54ZugKMAJy0X
 AGmB1fHM4fQkNj+v9jeeMCeFWP/0TLQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfX8tZory2bzw8k
 yxsRiVlKLSv/0LETux8P3Xydw3RCcQ6rPhKEU5EIRQDSyQVQ38W7tD0/wBE8oaEOm3KiII9LfNX
 tJuVSoqbeiqlQJhDKzZnQqontoL9hmA0OESUVL9JSmCl0cUABWpTWqONd3zBIyhluq+LvaMPv64
 LBMP32gggrrilC6AHfknNO9gT3exibbeSpuXkWhhjIFVa3sw+srPzqWNNefdZ/+v7jfBHaxJlcQ
 /fcz7KnF325Frp+pVoq6oXVn+cwhMZjwGevccj/OK7FYK+ZugF3t/4wCpTnjkZ5Wrp87aq45LeJ
 3bvzM4IPKoKxj0oqVBElV/HH1D9Po3H3uagNPeLSjxkX2PnpmKdnC4F4Dv90mlcoR0//TfmL5tG
 XdgXAhtxVIC91WNjxtgduNH4m9iTNWmCKRydTZzwQ7MtGRPqVFtKvcprkg//6NrUjSNfmXkqMmu
 wKhaDx63wiT69XLPbQA==
X-Proofpoint-ORIG-GUID: bdYudDJJuwCAb8nn3FxcXJJgBA1GLOW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070201
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-117401-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:matthew.leung@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B2F371F907

This series adds QMP PCIe PHY support for the Qualcomm Hawi SoC. The Hawi
platform features two PCIe PHY configurations: Gen3 x2 and Gen4 x1.

The Gen3 x2 PHY uses v10 register definitions, while the Gen4 x1 PHY uses
v10.60 register definitions.

The series adds:
- device tree bindings
- v10 register offset headers
- v10.60 register offset headers
- driver support with PHY initialization tables for both configurations

Overlap:
The series has overlap with "phy: qcom: Introduce USB support for Hawi"
by Ronak Raheja (see link [1]). Both patch series introduce a subset of
v10 registers (this series for PCIe and Ronak's for USB). I have
coordinated with Ronak regarding the overlap, and we can update the
series to resolve any overlap based on the order of merging.

Link: https://lore.kernel.org/all/20260508213234.4643-1-ronak.raheja@oss.qualcomm.com/ [1]

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
Changes in v4:
- Rebased onto v7.2-rc2
- Link to v3: https://patch.msgid.link/20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com

Changes in v3:
- Squashed v10 register offsets into a single change
- Squashed v10.60 register offsets into a single change
- Removed USB mentions from header comments; offsets are PCIe-specific
- Reused the tx offset for the v10.60 combined txrx module instead of
  introducing a separate txrx offset
- Link to v2: https://patch.msgid.link/20260604-hawi-phy-pcie-v2-0-be908d3560db@oss.qualcomm.com

Changes in v2:
- Rebased onto v7.1-rc6
- Patch 1: no change (Reviewed-by carried forward)
- Patch 9: rename QPHY_PCIE_V10_60_PCS_PCS_TX_RX_CONFIG to
  QPHY_PCIE_V10_60_PCS_TX_RX_CONFIG to be consistent with the
  naming convention used in previous pcs-pcie headers
- Patch 10: update usage of renamed macro
- Link to v1: https://patch.msgid.link/20260508-hawi-phy-pcie-v1-0-237b894353fc@oss.qualcomm.com

To: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Matthew Leung (4):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Hawi compatibles
      phy: qcom-qmp: Add v10 register offsets
      phy: qcom-qmp: Add v10.60 register offsets
      phy: qcom: qmp-pcie: Add QMP PCIe PHY support for Hawi

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   6 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 375 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10.h   |  18 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v10_60.h    |  26 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h        |  22 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10_60.h     |  23 ++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h    |  49 +++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-com-v10_60.h |  55 +++
 .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h   |  47 +++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10_60.h    | 109 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  10 +
 11 files changed, 740 insertions(+)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260506-hawi-phy-pcie-283933b4113e

Best regards,
--  
Matthew Leung <matthew.leung@oss.qualcomm.com>


