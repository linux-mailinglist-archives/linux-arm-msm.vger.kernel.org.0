Return-Path: <linux-arm-msm+bounces-104503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKs6DnNn7GkNYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 09:04:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3946555A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 09:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89C523049964
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 07:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CD431715F;
	Sat, 25 Apr 2026 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYpQeRo/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Db4ZPVd6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2312BE630
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777100423; cv=none; b=jCR0Avb7pWWHU6TVtm11BxZ2VgVDFnZtzjtYWOEVDDFtmKTbjVcNrUnYhN5mg886lfGBZDygx7eqkmb/3wDGguq4U30OaFjA+1rnj/sbbxgRLcLtlBeW7o2DonuE/8HdvioGhm7kYdgjRMYeO5lDo8ByEq9N/5TwAiYnuZDAUSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777100423; c=relaxed/simple;
	bh=wp91t95lhjh15mikAKqw1dtodhywMRTjcp8qVMa9ghU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UiTihCtVpmakJeq+8M9/brjDQ5TjjWgwbEFDqJQFgSD1b3NPCaYwy6FPAu4UYxaCLyRHB4Rei2/ptNYcDrG76ijHv382eIXuWZkBwFcLy9S26eVbCXtbxZisrQqFeY7yj+eBNU/Wgp9HLsGAgrwMpFeCQV82Sq9umeWk4kqs6uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYpQeRo/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Db4ZPVd6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3kA6j1017130
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u95S0dwADM496+fuZWR4w1DhE/LLWmP01tc
	nf4xUUdg=; b=lYpQeRo/gUlm/XZu5UEckjqsRJS3mZnBg+1THadc1l14reUD3yL
	kvo4aa1oLI2gKt2o4J2+i6J+vcZV3YHw9yI/AmYZl/4TS7kuINmKzSczsHujT9Lk
	6Z67i4LLnGIhQj9X8Fgci2/93oqqY3mZpbWDA3dTB0D2kp4jQ/VVKlt2IhEc4tiR
	5rTzahFD+3u/lPBqXHqcHEt1v3Wi2HO/Gq0CDTIcEiM0UN57+mRCzo5gb20apPjf
	hgYAvIPm+AAp8BPNjUAwSGLcWYv47P24ohgkeJ94nooge0qY5skngOqQjXxBRUd7
	keD+28d1IGYj8N7zdWLqVFRbdSIp7cc1AHQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drp07gaq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 07:00:13 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c8ccc7593so9868409c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 00:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777100412; x=1777705212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u95S0dwADM496+fuZWR4w1DhE/LLWmP01tcnf4xUUdg=;
        b=Db4ZPVd6YOA3SeUos4G27Mnl4mdLQKZ6JPG8KaaFfLtFkAZ61mN7/Sd98yd9dik7kU
         xgpO447pkmoj7ZhOSjz7VgRasgTdez6j70wOiYxCMwrkj7BRezLrn1R0j3e1syyW3Lfk
         RBCgadJSkCLCa6/ozQ3tl7d63LdI9x8DP6xKWIjCF1B3sF2qrHkVdddHy4lEwC1jxwck
         t/2d8CC42bY6am9Ikfn8H/Ksyal4SZmfXQ5KsArtnVOMOo/FVnWRjfJNzHfEJ0KzJACH
         RuykX1OmK/GD4LzDa/l3jmFHcR0m/zyIwMeBsAl8Odn9njG23JzUC6vniAnLl1orSTEX
         084g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777100412; x=1777705212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u95S0dwADM496+fuZWR4w1DhE/LLWmP01tcnf4xUUdg=;
        b=eYCvAF7o2JawpTGusqDcUBoYz4S/OjI9UOW/AES2B+gZ/OsH35gR70TZGZtRhOEjRj
         4vVcQdpNn99Wxx8qW4296m9FDD5I+Mdcj6dH7GcKUCQOVMDGLgymMzvbDqeTYMF8zTcn
         cJw0odMVlXPFnlrLKuKd/84azrW1DEaDOsFMS36OQJTIAfNf7V+F9qdbAa4ptnkOX4Gp
         dFdGhjgXbVdneA8grvMoI80KLp38VCV2hpc/+M98HE7MBnKRQEmmxnsESEtDrhhncJlD
         d1SCBxCkaFK8a3+Wex9A1TfSrhU1Z3VLxhmBvobRmpdwkZQaAaGC+23VTv9M419pvdl2
         YadA==
X-Forwarded-Encrypted: i=1; AFNElJ+uyrP9Holn7LxuNpdHaW4wNMO3GxxxKaMbwTY7hGBqAJR9AMSB2WK4IMFX6Xi7UPur7dxFaksyLa4R8q+6@vger.kernel.org
X-Gm-Message-State: AOJu0YxgtM88ZpjR5cyXHbjjLlyUQ5CVqmS7XmAWVWIx7WvNsEYHuIri
	nNVcMzInccxmygtyAojPq1pw0JXjC9TcbsR5C8COkUwrW24vtqRZyuhMr6oPPogYKOhCSlthOEM
	fb6dNXWLClTvqZRS6tN1QxkPExAbJsH0heFA+vH9JIF1uWmwZRNN+GQnpuGNgANrC/2tt
X-Gm-Gg: AeBDies6CKmIYSYDGXyWNez7hAJIYFFyBiknkOI3C4etCRc/Uv+xP1EqifgyBLHMvRc
	2Fm4qy66cnqJbK+9leDxMuOkzPwMdvW2jO7o0uKjJvfkKDwKHnXxTmAGacLrscHuWqoZ3StYRRF
	LYk2wI68/Hb3eHahXt8PHoRhDqacZaICjdhpClMbOGUM6UhEak03+tfvKBMpZgWqRigymni2HGB
	W8+nYcsQrAsg2V8Qj1pQ6AHKAd3gRJ+h8530Yj5qGpztQJ0VNLzq5bE94PQw38amZw54kSnogaB
	Dfyi1QlfH8mds5bbuhUT5l/hMBQJCU/YKjXXcMtLNL7PwfNwNfRgOnpIVxw+WYWGZbaFXuac31o
	ew3L6XV9qZdTwGEpflJAHVFNOs+gkx3JJu58/JlKnMIjJfAVfBAttfy+Yyl4x8SEt9lXPqRbdPH
	WIK82DKDHsWw==
X-Received: by 2002:a05:7022:90a:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12c73fa71demr16584847c88.28.1777100412461;
        Sat, 25 Apr 2026 00:00:12 -0700 (PDT)
X-Received: by 2002:a05:7022:90a:b0:128:ceac:6db1 with SMTP id a92af1059eb24-12c73fa71demr16584822c88.28.1777100411921;
        Sat, 25 Apr 2026 00:00:11 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc2dfad8csm9430630c88.3.2026.04.25.00.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 00:00:11 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org
Cc: dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] phy: qcom: Introduce USB support for Hawi
Date: Fri, 24 Apr 2026 23:59:58 -0700
Message-Id: <20260425070002.348733-1-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=69ec667d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=MeUEimlcFosfp0q7v7UA:9
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 9_rYSmsUDynUwf99dQ4azp_DXA3S1Vzo
X-Proofpoint-GUID: 9_rYSmsUDynUwf99dQ4azp_DXA3S1Vzo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA2NSBTYWx0ZWRfXwQjRFDUhBnaw
 Bktw+LzO0t3Tr/dNfYNM++7eA0ml7575z6VexowEWNtc9siLxBWFTjxoP1vLc91HaqXEYG/BOEH
 NxmfSemnZCYbWQq1aYG0U7CzuZhGeyeppGD1CLhgZApWtz8epHFiznidI5dVBi0jGMyXdoG6Cxu
 pEw8ngt4qRyGw5KMNWaMphJmeKsABTwM7/Vjhiurr095KXmwZMtuC6wpWlGseglgpsmFSvQJrUV
 cs8ZCm3Z2baP3OYPWSB3C0MPD23CiakE4/LJrtJZKc8T7VDA38McXz/DRCfuuh0I9L5WXdfvQIL
 Pu1YYHuBD/BH3a65CwCGY/afXcOkNDySeGRfhQn6pnsnCrCsIdp1X2LQvNXwC5cyBRODWWqNLZB
 ss7lfHJkOpASjL3Nr2uKr976OcURP6BLIXdOrS5X9hHelr86WD4S55EsoDgJ+OlWdaSNZhbxzCG
 LiAISLkcsLMo2iBwFlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250065
X-Rspamd-Queue-Id: EFC3946555A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104503-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds USB PHY support for the Hawi SoC. It documents the
QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
compatible to the DWC3 USB binding, and adds the PHY initialization
sequences to the qmp-combo driver.

Ronak Raheja (4):
  dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Hawi QMP PHY
  dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
  dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
  phy: qualcomm: qmp-combo: Add support for Hawi SoC

 .../bindings/phy/qcom,m31-eusb2-phy.yaml      |   1 +
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |   2 +
 .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
 .../phy/qualcomm/phy-qcom-qmp-com-aon-v10.h   |  15 ++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 232 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h    |  15 ++
 .../phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h   |  13 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h   |  19 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h   |  34 +++
 .../qualcomm/phy-qcom-qmp-qserdes-com-v10.h   |  89 +++++++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h  |  89 +++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   5 +
 12 files changed, 513 insertions(+), 4 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-com-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v10.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v10.h

-- 
2.34.1


