Return-Path: <linux-arm-msm+bounces-116304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LqCJJiuoR2pGdAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:16:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDC170245A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:16:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lqrSXaoX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZTbqd9Em;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116304-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116304-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3891302CF0C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9969E3CEBBB;
	Fri,  3 Jul 2026 12:08:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360383CD8B0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:08:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080532; cv=none; b=RimQAF7JWMLgZ25vma8lLc4vCwXGk0Nsiu6RYglR41Hz4Shgrwmbokb5BPvYx9JqcWajX+K5eImuAApIgA5xJC8djB2GC6OtJJgcYBIsqR3U9VlefHbdrrvhJHUFH7eweCLCgmfz7Uy6KDaA+qs3sLLrWayVKXKCfDDmlcMOtXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080532; c=relaxed/simple;
	bh=BUnkY/0PhRAAb4fytqk7lD65By8W889aQEAnDJ7aUVE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UjeddBT0ljl0IRQ1aIMpPF9+yiS/jZ1lwn3ZmbLk1DhNPEvyiSjFXVNMjiLc5eT73utUrPLlhIOG9wwwEoAqZF2SvLwFMOrlsePCbADDF6uVEk9bAXzj0MHkOs0awWC5oRZwRdeeF2AgSXQBk6riOYFEC/JC3p+xKX4eShD3Idk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqrSXaoX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZTbqd9Em; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BboRX3136859
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 12:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bgimtSI4aro2GhawYEE98j
	B/geFpQ8EBMgBfF8FzehE=; b=lqrSXaoX1UEei3eG8FEcJ7G2MaTbKPG6Wikb9T
	WuyIhFEerATSshhir549oADX71e1RXjE7X/HYb9Fz3flTfb5dSriEze7rYj2DXxT
	CBnGKYArmTIrNyMR9AEhLKhRpjZXf+tiDqpSbZpjEWxGAuEhh3ie/zUqxwSfbwoo
	iLZKE/chhvMwvbagxYtnpHJPPSofEVXbmCbK2lF3geEkhnp18O/kWGTCpbGViajW
	LPquW0SF+8rskfeXySfvQFNvpoICOjw9gD87noBDKZSA4moazue6StXXxpXnN/6k
	qoMimt/m7/YaV4j7P3dbKJw/8Y7qbyRGpBzkX5vJd4ctLYZw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcj0d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 12:08:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c892143db7fso527926a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783080529; x=1783685329; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bgimtSI4aro2GhawYEE98jB/geFpQ8EBMgBfF8FzehE=;
        b=ZTbqd9EmJJlkvZzTFmycIq4ppqPRiOKrRoSwqzP4KvnPV8V3rE2fy4gRrtuaOPIBMc
         Ud9i/5uenBXKhSAJsBRCbHpUGTeHJo9iKA3mNCobvaX4+gRpbR+JnxKmUvAA7D4+cPAD
         YGy3O5FcG/aPNGz+kDIePfafny03COnK8EVtcnrphOHcOXGDNyg/aXGmQnw4lS47Qu+2
         35skNgPgWW5VF8WAHFeRcDZrn67PyL9B5yl8aaS+BiRSfYvPUfqpiUGjYW5sep0JZRle
         w1uIwykRoMYQ/GvfSzWAtlfb8FsxuM+X/sWmS8a1XyeJQXp20euGwjEjh196+DoOwcYW
         F7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783080529; x=1783685329;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgimtSI4aro2GhawYEE98jB/geFpQ8EBMgBfF8FzehE=;
        b=Sq9IM6/TL4PlwimVKWMe/0C+A3a+J4gZKH4tYjU5cTBWHMYj/2nJaq2nipzSMUsMSk
         JnnTPQ31wbN0NU4Ca3IhP39rTAp0r0dEGq/Rh7TD9J6d+vdQPs4NHLokmICtmYXhh766
         zlsIc8W3t2zYzLRn+8EbjYTArMwqYfLtf2kwbh+hcsMd5GYFBifVy3qPzGTXph5qmGye
         Ato6gGOW9Gk0HkUMogq4ZkK95p+kcesFv1zOQX8sa9fISkqWrlAWFXfiMyiWM4g8XgYd
         xk0oo5ORclo3ONSmLPnGfg9k6oc3DQkIgClIkGT0JYm6r5tMOP3AMEKhGfpO3MgBMrpq
         8s1A==
X-Gm-Message-State: AOJu0YyY+aQ6ZD/15Jnj9n0VIST8k8ZfqMQGNWZcoZSQ92mma2IhjzYW
	R5yIpnXSi2qxwkGzvfSGyfkvg2+YVRj38e0q8aZHYusAzXNimPjk5+yvXS/szZ0Wl7orJiIFYPY
	EfKxC7GIcUh53X+z5OBsnE08b6NfzLclPdJNFNbpKcQ/oZCqm1QXlhE5IavamKh4zF/lC
X-Gm-Gg: AfdE7cnF8uCxVc3FH51PWUMUbg9+o2pPbA2GNVVDq2H370u2LvqTMw7jZzbfr2oSPM9
	LiZC77BotSMsgapUot7sOtE/USsN1z4UKJdyja56deJQJ2Uj3jgmT4S9nAom+TCLCTju6xka+Yj
	Aj+UM+jROgxDWz5Rq0NtO4M6cTw6GR+iOMKbIOcHXouUvoZCjqc5RRrVkNmOO2QOAzrMEzB4VDk
	ZkTS0Lmne44fYtckerTStU+X7wXq19BDyf+xDS0gQm29hFRHSloRU5dszdSil31a4F5gNUNu3XF
	lF2RBf7z/Cl5AQ6G7ozQkBCfDxc4wkHEpTdAtdY8taCyv+AuyaftFmZUHxHPMnu0/6HHLKxjmfC
	LMTcmdKRS4KYpPg3uTMtPFJV+t3HZef/3S14PHQ4jihxDoZh/
X-Received: by 2002:a05:6a20:2445:b0:3bf:a489:1483 with SMTP id adf61e73a8af0-3bff4255df7mr11649229637.33.1783080529181;
        Fri, 03 Jul 2026 05:08:49 -0700 (PDT)
X-Received: by 2002:a05:6a20:2445:b0:3bf:a489:1483 with SMTP id adf61e73a8af0-3bff4255df7mr11649190637.33.1783080528550;
        Fri, 03 Jul 2026 05:08:48 -0700 (PDT)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb10638sm2530779a12.2.2026.07.03.05.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:08:48 -0700 (PDT)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe
 compatibles
Date: Fri, 03 Jul 2026 17:38:39 +0530
Message-Id: <20260703-vdev_maili_dt_bindings-v1-0-c9df0916cd5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEemR2oC/4WOywqDMBBFf0WybmSMWh+r/kcRSXSsAz5qommL+
 O+NdVG66mbg3Msc7soMakLDcm9lGi0ZGgcHwcljVSuHG3KqHTMB4gwJCG5rtGUvqaOynktFQ03
 DzfAUEJIQmjTMgLnnu8aGnh/xtThY47Q4/3yEX33u/cpb+aDyaA0XSVzFWZOAalRuA7a7WjLzq
 F+fzS7aZf/m2YADB4hSmUYKVSwuozH+tMiuGvved4cV27a9ARxJl7sPAQAA
X-Change-ID: 20260702-vdev_maili_dt_bindings-80e0730f8390
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783080523; l=1468;
 i=vivek.pernamitta@oss.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=BUnkY/0PhRAAb4fytqk7lD65By8W889aQEAnDJ7aUVE=;
 b=IIvPLEPo3ILp9Ml/IKyB60FD/DR1nBHlasElwM1yCiueOsNQb+FaXoYLj0BA8j5VrgH1TnA1P
 nRIggsUh3VGAp7smc+TYGlcTGklmUuwDq1XxSbXaEbmsXjLqaV0aShA
X-Developer-Key: i=vivek.pernamitta@oss.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-GUID: CiDw0KAoyDcSx-E8yB6GpE5JAmniUMq7
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a47a652 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=suQaG4udzKv4wnHqcH8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: CiDw0KAoyDcSx-E8yB6GpE5JAmniUMq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDExOCBTYWx0ZWRfXzw7Xs/zB3dWs
 sqdvge8f2HeLlu4foZ8g/hoeqVCZ7FKm89qXissVKmG4LC8QGd+TuiByYyOrKYzCt8NJ3G8zbDA
 L4E4Grw+/WNKzpRod6UhFPCvmKruFW1tL7qSis5JTorO96sJSIj2L08Qi2pQwCFEv8/nSP92JpE
 hcQeHhAhp0IrMglQi/75i8Q6pyheXHgK8gAV28jyDMJNQPD21YDx3veEIhwfExPwbxeic4u3Lr9
 qStj1+rLsVAbjjFwZ1ShgqkyC0EUM579CZi4/xRo+NTZg8DwhJ8PV9Jl+KDtkOPVRC5qH7TomTb
 TonPyICY2vwexnwyBKnmYVOhkGBOSiYdpPBmsm5GxQxJLz3uQofhbeQkcuVFDQq0VYt3ykJ/waB
 p2e74Mwp7//za6jgckKedR1CTTikpqBxxDndP2l8bLT+io9isWDCR+XKBiZI7VO3UcVBSyIyWDR
 AgGreZcJjeR+HSJITJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDExOCBTYWx0ZWRfX1x8sQMSnLCy7
 uD+6sObny/Z+38bQT6t73hT+dlAb2jIzvNCE0LlqPW5muPxlocSkvkbct6f5LPpja38EcGt+j+u
 bOUT/fs26k+Qj5eG2g25q0IALLL0Ny0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116304-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[vivek.pernamitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:vivek.pernamitta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.pernamitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEDC170245A

Add the qcom,maili-pcie compatible string and make it fall back to
qcom,hawi-pcie, as the Maili SoC reuses the Hawi PCIe controller IP.

Also add the qcom,maili-qmp-gen3x2-pcie-phy and
qcom,maili-qmp-gen4x1-pcie-phy compatible strings for the PCIe QMP PHYs
used on the Maili SoC.

The Maili SoC is a derivative of Hawi and shares the same PCIe
controller and PHY architecture, allowing reuse of the existing Hawi
PCIe DT bindings.

Dependencies:
- PCI: qcom: Add PCIe support for upcoming Hawi SoC
  https://lore.kernel.org/all/20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com/

- phy: qcom: qmp-pcie: Add PCIe PHY support for Hawi
  https://lore.kernel.org/all/20260618-hawi-phy-pcie-v3-0-3fa42ca45ea4@oss.qualcomm.com/

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
Vivek Pernamitta (2):
      dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe compatible
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Maili PCIe PHY compatibles

 Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml          | 7 ++++++-
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml        | 6 ++++++
 2 files changed, 12 insertions(+), 1 deletion(-)
---
base-commit: ac5f929f2f373245abe6fac242c8d3fec4ca38af
change-id: 20260702-vdev_maili_dt_bindings-80e0730f8390
prerequisite-change-id: 20260702-vdev_hawi_changes-275c59f70bfb:v1

Best regards,
-- 
Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>


