Return-Path: <linux-arm-msm+bounces-98330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBwLG/tQumkAUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:15:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E24F52B6C37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50AE23032CCD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 07:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D47369967;
	Wed, 18 Mar 2026 07:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9EiNtSs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWvr9Heo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A579369984
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818080; cv=none; b=T3wxUfUXPnsDWgzC8CCfSSApJP/lfxnRENAo9BdsvdIqTo2tRuVhK8AmTFXMB+Oi6O/U2pZwNVAFOO/a6QU5wFl4zqaFLC3uCVkKokl0rCHLhilFY67bhPbTPlwquxNsYg+seyVCORiUZO/ymt4UQ3b0lh34211KuG7VnxIg4W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818080; c=relaxed/simple;
	bh=/sEl/7vWyc59W7NsH7dnJ+QHe0uCU49M0vqsEXr3P9g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W66hYBwi4TcJQsiLU/OSqqX1nDaAVL56Z7Oz8rD90V/dAQVnZYWbZu1Ke9W+fNT900fn/AvhpPgLQyimMNsLql+mqGqFiFGhuPJR3cBaH1NpSztymlizrxXmDX1hkjtl1nlUKNOJQmvAJFpbopzXTgorissk/9PDBCVV9cqI3Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9EiNtSs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWvr9Heo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3Om78402512
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T4xBNHP02lwoVag6zYe/Ke
	vtJOqcf8IpqE4F+k66rl0=; b=d9EiNtSsxZgmCN3KGqSSl19c6kzj85O04DTyf0
	KmpS7aZV2TwHtEB5YOGzuVVVbJuM1CYHy0TFlQLGviUzQwAxsCG5ZywD/1L9XfsW
	+pzJotOyK/1eRpH6YPq7M+4t7iGm3eubj39wYidTfSXGkB0hdEFL0E4e/7FZ8wSo
	Ttd38Yew+GGcIlcCdEmFQCIsFCvnigmjsKrHspiA0UQQFw3MDTm1JMi095pZNd9R
	XbNF4djXo0igiO9SG0bDndx+7wXgcWEYPEq62k8mVgRa8sjiGl/3tO6UcUr0fNLA
	n74+hsIvTtEq5GFvFCZ+zD4AcnfotqB8BzX2TY0JK/yPwgGw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4dtfg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 07:14:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630753cc38so36591908a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 00:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773818077; x=1774422877; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T4xBNHP02lwoVag6zYe/KevtJOqcf8IpqE4F+k66rl0=;
        b=JWvr9HeoEgPmQTbwqJZbAV2r7kBdqzrOiDIxF6XkQppLpJo0Sg4/leOfrefe7E1hcy
         vu4Mw04+6mFZxm+3TVAO/bFQZt8gIasm2vxukPB/P2/Vnta+76I9jhOqLgRxHMkeF/RF
         u7glb6EfwqiWJTvO1lAhI4vzfm8mIx9yPaDesw7WpnlFMk7uBqQ2EJYAYbfHQtiywKw5
         SRs4LZy5327pgH1vcLrOtRnfruSNWYHU2L/IMt+Nbtq5YDmi4AFXF1WlkFiM2wQY/tUz
         gaA31ejTbaYw82uV69e0fxYEzb6ezlBYVPpo0TJmA5myrlA677rn+CqQj3xtTJvsOya6
         duRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773818077; x=1774422877;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4xBNHP02lwoVag6zYe/KevtJOqcf8IpqE4F+k66rl0=;
        b=GianI0d3G0UJBaNAVG3cwwqU8OavkNIUYaErAu+dH1og7PBN3UmL9m1D0ptMc77qwk
         eYbb2EcOajMqBU35katRLCx8fNpYAdDg24MV/IkeTfZpbKrPfXkKB2EDosw2yQqmTrdE
         D8ZgfrTLZY9ev7503NpxnEmSX8NYGfPqxjM0DE1Gp4BtThU/OfiXHMAGan9p3qvg4p98
         NK7n/kiHziLi7MUG9kMavyrbRku7ctNk7ek5uTPYHu6QfoDVcfhu5d7DykJN7KuLT4Kr
         Ny2luUkzF3bCpOhRCOeqZf3A21WP/hg3lr0brDT/qIlmwNASUsqdHkz/YO9T2WM0jHGP
         Epiw==
X-Gm-Message-State: AOJu0YyfzyU3CfCQvJshvFVpUuqnXPUQLVz97mSJxaHAgRItZCABaC8R
	T9gVwd4nGtiaQN3zVINHMCgVRkCKUcmw/QIeSJRzbk7cFSFZynNklaL4sWgtcN1fj6FbIXA50W7
	ICIsQ97Z4dIqPuELV3fRlnTE1H+s3q3miNo5x17kGjkmORPRJgxcEEqOARpsQX6Q5UmPZ
X-Gm-Gg: ATEYQzygVL0LsWoJ/X/Zdxbizxmau/xvRZChcT749ds7/S1bNNPAZbWSF4bRYTiIDw6
	GyE13r9ND05MRliCvD3EbLaheL048P2fBWwLfuTg0fjkB41+oPCFOd74EfGOywu8IpHuRfrg7AR
	Qp0KjWmt1EwF6LHOxG75KIvZ1PwR8E2AJy+T+kAygWWBXswz64docgKjRO6E0389CV/1lR9Djre
	4E0cfOFD1IZjQFi0aIBcoZK+JZE30nmoM04rUEV9LKqdmYR8CSDppz4Ol3/C+GkaOjPDIb1bVy7
	gVi+FLIRaJKSPC6YNCyyXnDVsRGiEOmHAH8rYavV/tI6THZ26t6cajMCDLijcqmbZCvT9phfe9S
	XK0ul6Qk9DkxbUZX5WMsy1jpFOHHg4IQVEKth4BO0YgfoahzAchQheC1BWF16+5qeZztORgVS1T
	jxrtjj/nhAb3qFljCmsp1NOIvr2KHbEWvBKMQpNWRh6JfzzqlbgaB0ekcP
X-Received: by 2002:a05:6a00:9a8:b0:82a:8aa:cbb0 with SMTP id d2e1a72fcca58-82a6ae5306emr2273750b3a.29.1773818077216;
        Wed, 18 Mar 2026 00:14:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:9a8:b0:82a:8aa:cbb0 with SMTP id d2e1a72fcca58-82a6ae5306emr2273729b3a.29.1773818076769;
        Wed, 18 Mar 2026 00:14:36 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbe801csm1575768b3a.46.2026.03.18.00.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 00:14:36 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
Date: Wed, 18 Mar 2026 12:44:29 +0530
Message-Id: <20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVQumkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Nz3cyCQlMjQ4P4kpzcXN2UNCMjw6RUQwPTJFMloJaCotS0zAqwcdG
 xtbUAWjRSzV4AAAA=
X-Change-ID: 20260317-ipq5210_tlmm-df221be105b5
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773818072; l=1127;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=/sEl/7vWyc59W7NsH7dnJ+QHe0uCU49M0vqsEXr3P9g=;
 b=bHUpDZlxHJ1OKeVV+GiSbVvJ2TxfBzFC3McaETWFdOvD91SCMqE6hPvugprAW8xDKM1i8ZVk1
 zx9ioRmiVAnCeCZ/jTiWPFbCo+ZqlTBWolJUtWK91rpQIiTxEu/x6LB
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA1OSBTYWx0ZWRfX793RuRpg0akk
 cPh9asHlWMeVhkoaRu3inZ4xeRxbx5bvgG6muOWGxzbwj165S+rVWfAZ8EfnuPAlZgnx5cjhwU9
 dac9OSDstAx/QuIiQpGgr8xu2xFDEU7rFZ849cf43IaeMYFv5LWtgsBNU2BToP2N/WHjxmWulAw
 c64pBMl7cG0Zlld+E8jhwam3dvZDwk4oNQJT+201Ep8i/BHZhdVONzXTwRfiWv0in6FlCWOjY/y
 K1g49rqq1yHUgvH/2718bKDBsKRAZgrakdW1a6w3m2oVoIIwOLZqQeuO67+a97FnsfbjM9YYKsc
 J6FRZ2wFwDLEaCmV8OGzvrp/IIsnpxE5xHXAxZ+ehZFbtR6vp4mI46Dvp+HWiw8Y9QrCKtf9Idu
 Zmyb0MGPm7h5bHvy4bc6aLV/mOOAfVpM87jZrJaRoXIwA3lgjd/+948CHM/7pZjqu4qh69Yb+b8
 0E7MnrEy7x+/kLAkezw==
X-Proofpoint-GUID: QZGYdfUAOJoPlaosPqawRl9itSEXASdV
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba50de cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v7fG6qyLzT-gi-QuDAwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: QZGYdfUAOJoPlaosPqawRl9itSEXASdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180059
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-98330-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E24F52B6C37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
Add the pinctrl support for the same.

Changes in V2:
- Split the TLMM changes into separate series
- Picked up the R-b tags
- Grouped the led and pwm pins for better readability and usability
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
      pinctrl: qcom: Introduce IPQ5210 TLMM driver

 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        |  137 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             | 1049 ++++++++++++++++++++
 4 files changed, 1195 insertions(+)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260317-ipq5210_tlmm-df221be105b5

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


