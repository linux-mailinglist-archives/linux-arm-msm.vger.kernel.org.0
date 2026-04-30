Return-Path: <linux-arm-msm+bounces-105357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLT0BbVC82nMywEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:53:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 830064A2639
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 329BA300C25F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAE9401A0E;
	Thu, 30 Apr 2026 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jp8h/2Dm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gg8D9+3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870DE401495
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549994; cv=none; b=s7df2cumsqZv6oI895H5PfOBLCG0K2t4rgSDs+QzQgbrVNpU3oopClJnrV6+sIB1LKRQYRTsayS5fPirX3LQMWbbfMqf15E5ZrUaS5X22ZF0fdssM6VUhiUM+tGtf+9OmbRNuxvcz3Nltszp9C6tu5bCAy08uFwjEnhK/7mAUio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549994; c=relaxed/simple;
	bh=Wy35dkk+x7J7hVzibp+tGhexsVcSnAJWVDQsf3OwioY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Somf1gr4LfOEa0SodSl0mdXViWvLz8jWsvvxtDBlnWsWXlt9Up8kR2TI5MB60CgsEipKeS9O+xrFcYO1NFKbOGNM0FveYdVfTWfIjGmlIn34W/UpFyDoa6MsokAOKmouwpgMR0UaExintNTq972FxB86lMryFC06fiRnKz5I9RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jp8h/2Dm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gg8D9+3Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UADvNV007933
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S4gD0cycTGKSJtK98/zmKq
	rbMyKEPcJ5+g2Xd9XvCl8=; b=Jp8h/2DmmjhkcdXnovykDDmIcVBQ2HL6cZ8DPq
	git6edin9YkdGhUvPEdJu18DIl2HLHLnCRBxDOqu6QuIJs5tjg/au5DP1M21PCsA
	VtciYYdVMsMv9OrR4PThipusOBq5LuAI+D43FIoZsrQd+DOMWFaKUtt26LBzsgmh
	avHDZ+kA4hAYEpIxVtBohN/ILemJGG8h7oKc4ETs49ylvM98orE/gnvYbNGLdjph
	6n4vfdZTnP6EwlrtwspHhLqkxfW1RLwOCV5iY2suQGjw79nGebtX9T9x/tGcCxNe
	c1cwK42khYDr+fZye8WgGoWQI3fGW5nXFCztOZAMY+UusVcQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv54w8ff5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9a6d84522so7250235ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 04:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777549988; x=1778154788; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4gD0cycTGKSJtK98/zmKqrbMyKEPcJ5+g2Xd9XvCl8=;
        b=gg8D9+3ZpNsJGcAKL11ElygMFOEepPRJy1EYtwR4gdSunq+lfoNAm8jufs9Rty+C4V
         puyaK2Pnb8xJGaGR0n5Y8S5X4Mnr7BPPqajsushvYV7FFbsNEoQxmEO2/CCEnSk5nqJe
         mKoY8gNECbegKIZQz4uA/SbzdcRwi/IaSJ7Q6fBr01FfBIbX6hvNcGqNZu3XG6tOJMfh
         YRpUuqc0Ti7lywuIlBsxG8SyMZeAF9Ll0W4TNzpiC9Pz1JHGVhIfFF8C2J3WTiFWirWt
         OWTtjKYVh8MakmP83NPgHXdKDgAc100LooG5EMBjpMeEf9dFXA4vXSisQyA8j7lFf5hO
         kO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549988; x=1778154788;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4gD0cycTGKSJtK98/zmKqrbMyKEPcJ5+g2Xd9XvCl8=;
        b=egyEpsgaX2lIBxkUCkCUFWyN/YqS0Jpd/a3oWbBTi0kPwPf55GiLiR+dPs69lKHFW4
         5gX0Rr/n39ZgbDJly/JqQEnZ3GCS3sVQVaQbd3juywN1WfWMTW2TesgsvgPzgSJIO0+b
         R+hgmKv4h6lIjJ2xlxpC+2qb7ZYCpwl5ahX90pqf+muKrMPwjm57Re+SDbEXYzq8aw4O
         IXB5oxkYC4ulurNiS9pAMTrVB0on/WZACujbQ9EwKjb675gTkK8rNLywpMp0kCwzmq54
         wAhY87Y7V96Y9rrqVbTwiWKFmNlnKua06fHsxHJzgfHDZZNoU0aGaP2+JZ+SyjYbyQl2
         YGJg==
X-Gm-Message-State: AOJu0YwjkwuEiuqiMzUBTvpR+AeNL2GxtdOl2LgINcwury+baP1ChkA/
	5/BAG6334H9+IeaJvvFvqEWgEMvR1G9ExVIYMoMlIkGADLMyIwY5SLx7OKynwlcc0ioej8P7qQ7
	lwJsynYpT+B9n/lssY4zUO5MBCrhmlFHbCilRiGifxTXlvylhZnOrxKiFTyLPSJdeQPBf
X-Gm-Gg: AeBDiet6C6AHmKcXIIDXF6cNvLH3ZPD0GKa6luRr9WBomCni/9LDAI+LtNrNWwq5Zlp
	A2ZbpEAzQ8KG+CPytkloLfUVeKbPBXnK5cktToOxqioFqDQ9AiU7NBxsSrbq9ZfVwSD9RqP0HKX
	Ce3BzaQBcwSbEmE3sSO8YCoKHFECFSy7cdO7HiohUirrYP0yIOjaFrn8v9ZUnDIEePZHiHzTa9+
	Ce//UaZxXqwlVkhm547qWPtdusb8of54qCjcow7lpzUC97UR1VhWuOhcws1pJm7XGyqAqfqnyUp
	PF5ozOUVhKjQsUeo1364CSEoZ2AvTachlBs9T1WIbmETMbqFXCzp3GA3SM186t4MQ6YDHwVCzzQ
	By0YEiA/DVkGgSTUlpkDNf/5f8xCSfejo4PIYkqhMXIyVUNg=
X-Received: by 2002:a17:902:f20d:b0:2b2:81aa:f6c3 with SMTP id d9443c01a7336-2b9a24e293dmr22500075ad.29.1777549988501;
        Thu, 30 Apr 2026 04:53:08 -0700 (PDT)
X-Received: by 2002:a17:902:f20d:b0:2b2:81aa:f6c3 with SMTP id d9443c01a7336-2b9a24e293dmr22499885ad.29.1777549987989;
        Thu, 30 Apr 2026 04:53:07 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:07 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: [PATCH 0/5] Add USB driver and binding changes for Qualcomm Shikra
 SoC
Date: Thu, 30 Apr 2026 17:20:25 +0530
Message-Id: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAFC82kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE2MD3eKMzOyiRN3S4iRdw7RkgxTjNMtkQ0NzJaCGgqLUtMwKsGHRsbW
 1AJa0b9NcAAAA
X-Change-ID: 20260430-shikra-usb-1fc0d3f9c117
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=1179;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Wy35dkk+x7J7hVzibp+tGhexsVcSnAJWVDQsf3OwioY=;
 b=EzKgLLmHkhOhpXWlxFsqT4An/gtiBGVcCoWJug4OSDZdbwaJtBRecdGA7cSDgH8odE6pmNwWV
 SOihEZOIutnDBqlGrB93QQ/0mg0nNUd08Ih2mip/nRe9m3yrjPYSe9f
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: adQO_zqthY-ykLwnb0yFQj5ofa_UEd3Y
X-Authority-Analysis: v=2.4 cv=Rrf16imK c=1 sm=1 tr=0 ts=69f342a5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UoB5GuWjjGMfoql652sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: adQO_zqthY-ykLwnb0yFQj5ofa_UEd3Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfXxuOYJu7RofU1
 EviIc8bVnW6a/qKnzsg+eRI/c7eaFwbRibfF+SJEb9uj/cifzDeJ4XxPpeoe1vVABLvWOooBV9E
 TQPUuOMhmsfKVJbnFrlD7PXTEnh64+AFnF1a7o3StXhkEszhY6FtgVRJ67iS3cZ7llk5nWmk8ke
 L1tcZ7KLn/cU1g1PyRgvcso7tVc090ur8f/m4sCLE1bEqQGEwe1KzU1DMXwiztKJjtPKk4mvApR
 DXmh/w1XwWXSdUvMviWJ/TmkvqqUIZZtDpAOsA4ADkmtCWagPZxCTi9ip3z1qle3BY7GJdxk05N
 A9pO3TT08DV3yB2Wv6L5DgcEJovqq/O3R7ISbMhIZu6lPcC66l4p4om3iFQt6ElbZ0rUhzx8I9s
 zYS+dxH6AWXhnQtm+AD8UwmFAMCKW/Ai1yzwD4yOP9lhASA97YXTUhRseOHE7uxhIVge6u81mcO
 +guXaSGH1CKWScAJLaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300120
X-Rspamd-Queue-Id: 830064A2639
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105357-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds Driver and binding changes for USB controllers on
Shikra. There are two USB controllers - One of them is SS capable
and other is HS only capable. The ss Phy init sequence is same as
that of Talos.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
Krishna Kurapati (5):
      dt-bindings: usb: qcom,snps-dwc3: Add Shikra compatible
      dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for Shikra
      phy: qcom-qusb2: Add support for Shikra
      phy: qcom: qmp-usbc: Add qmp configuration for Shikra

 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml          |  2 ++
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml          |  1 +
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml          |  3 +++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c                 |  3 +++
 drivers/phy/qualcomm/phy-qcom-qusb2.c                    | 16 ++++++++++++++++
 5 files changed, 25 insertions(+)
---
base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
change-id: 20260430-shikra-usb-1fc0d3f9c117

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>


