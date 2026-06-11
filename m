Return-Path: <linux-arm-msm+bounces-112577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1IB4BA1BKmoHlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:01:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C8B66E585
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:01:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RL67f1ih;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QeWRJwiu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112577-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112577-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D32733025A6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 04:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71E4360EFA;
	Thu, 11 Jun 2026 04:59:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E1360EE1
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:58:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153948; cv=none; b=VF9O7orKqRrRmZcLxECtM1A6dwivY84C5Jj/auGZRis8NUPkwy4F3CnMtZ1bbDYatYpjJIU2gvl4G7JgyViM+p0ZJ9SLjwK8zpI0+xHVpID+WT5TjwzNfdyf73Af6hUHjOy99N+2G06kJiYm3EcKDegPduCiSmfgrhbMU7o25KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153948; c=relaxed/simple;
	bh=V5FSOF6cpzKP44Z1Hql/zvd3IdKyXWuSsjIlMUIqCLU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lruQHb2UVJ7lFX/VEUW1D5zYs5a40pWH1IGBbS0lc2ZJV4I419ngz5SFo0onXuI/Wf7LWBDAgAmhnW3ffUFHVUc4WJa0GT5RfdGAC2eeimg83YU6Jlt6yYNsIWPK0F8p5rthBTRetq129wpHvmVa/HBZlzyGjr5hbvcf1bbim8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RL67f1ih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QeWRJwiu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0OGhh1615708
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CRtKP2wOyqxvdvrpnnvCok
	wExbLxadtCl0WmCnvqkpw=; b=RL67f1ihDKaGnMBQeUuNPSeoSi3yw8y22doVWx
	39FAnX+W7IDd9MDP/Zki27c3MzCRnToe3wKsfSfFlrDWv921gErItRKoA9Ugq4sD
	A2YPKyzFR80qNi1w9ownMkftMeFMyU8/F8KG6tlENXugCiech+zmM7gYd2nW7uMe
	bnsyRIZ7eNDTCncqJ7i5CU0pWpawlPKss3CTlXMUbkZ3KgZK7mJggiWJYgYbyrHZ
	5RY5NlpVt9mYsHORM8wZw+aPV/8BdSc+8cwpcfMW3zthbd9wwoQbeX02qX9MyzD8
	nGg/sm4WpLitpK+eTQpijsCjQrHsKjdjliQ4qtYtIvU4VZAw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79hn81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:58:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c36f1cc0so137221665ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153934; x=1781758734; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CRtKP2wOyqxvdvrpnnvCokwExbLxadtCl0WmCnvqkpw=;
        b=QeWRJwiubvQBcV7Z8koDLhrA6K3tC5MVB6XLhQQQQVlzk40eB646D4BWjBj6hdMgkF
         ihcIMlKkzflEkPW7S8651vAhRp02ejtaYBhoASSetq6k7N6iXL1nJH+Z3iqU0Vd9/ZAA
         pZtycNgKQw/h2xQhjygMNNdqOcyKuth9HeMygL+eXGpj7NuQZsNXqt4NtqSoeSMqqMPI
         cwfkpV1bCgy/GgAYgCyoD0/2oj4MmcVhLoVG//fVbxQIwa02ZYpnUOjnzY3Gp0vwkO1f
         yr8R6wQz6x4hgFa6Ugy0ybSyvfuqEISy+7nsfuSZjalXVfsYJ4PuZMZg0pwwWaIuBVUq
         aPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153934; x=1781758734;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRtKP2wOyqxvdvrpnnvCokwExbLxadtCl0WmCnvqkpw=;
        b=UZjeqMcaO9YyhTDk/5o5T7i9jBLjee98GqP24+gV7HxPPAs+UFDjcCMUJj6Ec2I9rL
         /g3kv+jxXlGDMHBItvRHsk9euoLJaH515YTzFBfF9wwSt4G81guz8s+BKgSkug9CiDRu
         7y+SRjZLexYB950wBtnhL+SjOvVvJdDuaYUPUi5O/czi2DznBeYkxwZYyqoTRcC0QjUA
         uyOQu66VFJXNt/NrN6BXeyMS5FvfsO22p+X2Eaie+vlJqZDkYEoX+v7R55GCaEPegMAZ
         3/AQjg0/P8Rd29cvXBuYxRNdH1pN9X1SNYlxOJMV9BSAcspx7nN7e8BEfcPvSWRdWQVV
         ZUrw==
X-Gm-Message-State: AOJu0YydEuFrrZyx5OeLKCGSZux3r3AZMP8iCh+l4U7WxhbXa0CrkRbn
	LgSAwUNXa6W8ZH12yTUqVJFf0qhoVL7WGTkWqyjnMaLXONuZhYTNQMTyJYisA/D+PgCytSkWcjK
	ewak7qqHbRYfORcpWAzEQm/GiG0U71z19NmfzLY/4r8HFHsTZmOykR3OiPttYPBOF6BC/I67QrI
	QI
X-Gm-Gg: Acq92OEwP8dZfBypoWXg3eaE1Z0DwQBNVB8rOJXh2D7AWnLsORQzgrLRyc/AEltPzsP
	SfjgO3dyEjaugMoG0/n9+jrULHTnnh+iMpLXjtW/YWFg1LD0Dgj9L2HMQ4RIFmZChh2GGnbvWZ5
	SM/F9vydHR3juxmNaCvZ1lHTV04nGib4jurhykdGkU1B4GIjppdndL12EjgPUEFibJD0jT0TvDL
	L2ZW3bRyOTy3pLQ/qDetwmsXqIHsn+iu+XvCm+yieg4FCpTyL6nKHjhK1G08KQ3Wib1UBgHSW5D
	v7Z8CLSiqLfd76JprL9b4qsbIH6W/korYMCgEtbi6olfTdTwG5puaexsHLWy9cNyoKNfSt6veDT
	iDZqjbFdfJywEzQTm7VK4f9ZbfjHfCcpfQ83gQAZPSewi73w9C7Lc4Io6TY4YsmLtpVM=
X-Received: by 2002:a17:902:f64c:b0:2bd:8dbb:293e with SMTP id d9443c01a7336-2c2f0b23512mr14084775ad.14.1781153933612;
        Wed, 10 Jun 2026 21:58:53 -0700 (PDT)
X-Received: by 2002:a17:902:f64c:b0:2bd:8dbb:293e with SMTP id d9443c01a7336-2c2f0b23512mr14084515ad.14.1781153933177;
        Wed, 10 Jun 2026 21:58:53 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:58:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v2 00/37] arm64: dts: qcom: Fix PCIe wake GPIO polarity
Date: Thu, 11 Jun 2026 10:28:36 +0530
Message-Id: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH1AKmoC/y2NzQ6CMBAGX4Xs2RK6yk888R6GA7SLVIVqF1BD+
 u4W8LLJJPPNLsDkDDGcowUczYaNHQLgIQLV1cOVhNGBARPMklSexLu+k5C6bTRppWV+hKA+HbX
 ms2Uu1c48NTdS47pdjc7waN13+zPL1fsnUe7JWYpE6AIxzfKGMC1Kyxy/pvqhbN/H4UDlvf8B7
 7qUvrEAAAA=
X-Change-ID: 20260514-wake-1dfbdedcd173
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=8454;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=V5FSOF6cpzKP44Z1Hql/zvd3IdKyXWuSsjIlMUIqCLU=;
 b=Bwont5YxFCWw+GdXsswVS3uYZNQc/ys7qUpXL8NFlHOePwk3CJvF96rHjBwxnVa5aDgLcl8c7
 RT3YxsVCzy+Aoh4w+F2UZmUY5LtJCZvDzgGW3gPIeNNnhce6zFEdlN5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: HpNpABc5xwYCAoGhhWzfmCps7mcwHFbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXx+Xoq15TjeSO
 63ajrHMfaV+80ZvHK4BKfGoHXcQ3iiZRif5g94ezghtTa8p6wZ2KgGaWMg07UYjTyKPMV+atKmP
 GZKtVRrQm179s8JUOPUzSfjTdqHF5blWOMbyUeYSqNclNy5hza7j8GtsaHqcLcZ6HrVzogeheUx
 pNG6EyXeeqonBdt9xuWzsqgynCbnHFGYbB7F2AFVUtI+bsm7B9l1n/z0ePjVaDJLYNsmtuGlEqd
 3gt4c4wOKrZvslrjG4pu+4jxvwQYIccIXhWMNFMnE/m7LkLIw1waiRwxEKZ4BY9+uC/UJNzuapA
 yGw+0XDkrfZdbTeiSi0iZ0GwGL7XpmEr7cSHC2FkthviSqaiTxkjUzmivsjOiMZq1Q4Zbm265Wj
 eGJWfIN5SoMSLEjzKD5a2+MzQGvNwEHo73lomr2ggIxZMesSGplh3iJdC8xP8dxoKeoWOvduSV5
 agdGiOFKJ1I5C0Py6dg==
X-Proofpoint-GUID: HpNpABc5xwYCAoGhhWzfmCps7mcwHFbV
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a408e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=C3W45OmENjepx_A3sHgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXxPD7ebLRWa+2
 PQKnY2gQoV6HyPk6XVJ1R/xcVY0MSSaq/jqkMTQeKoRWGjv11mIZAy+xQ5odbWXkgmdkwr3vYq3
 npNJUea97lXKcMcHTKfoafFmJuMk9Y4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112577-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76C8B66E585

PCIe wake is active low signal as per the PCIe base spec, Several Qualcomm
platform devicetrees incorrectly describe wake-gpios as GPIO_ACTIVE_HIGH.

The PCIe PHY references and PERST/WAKE GPIO properties are defined on a
per-root-port basis and do not belong to the PCIe controller (RC)
node. Keeping these properties at the controller level makes the
description less accurate and prevents clean per-port customization.

This series moves the PHY references (phys, phy-names) from the PCIe
controller node to the corresponding root port nodes (pcie@0), namely
pcie0_port0, pcie1_port0, and pcie2_port0. Labels are added to these
port nodes to enable board-level overrides where required.

Additionally, the PERST and WAKE GPIO properties are relocated from
controller-level board overrides to their respective root port nodes
in the board DTS files. As part of this change, 'perst-gpios' is renamed
to 'reset-gpios' to align with the binding used in the PCIe root port
context.

This restructuring improves DT correctness by properly associating
resources with their respective hardware blocks and aligns with the
expectations defined in the PCIe binding.

Tested on Talos Ride & lemans evk platform.

No Fixes tag is added as no functional issue has been observed.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Move phy, perst & wake properties to the root port node.
- Rebased the code 
- Link to v1: https://patch.msgid.link/20260521-wake-v1-0-d822567be258@oss.qualcomm.com

---
Krishna Chaitanya Chundru (37):
      ARM: dts: qcom: sdx55: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: msm8996: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sdm845: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sc8180x: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8150: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8250: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8350: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8450: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8550: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8650: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sm8750: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: kaanapali: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sar2130p: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: monaco: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: lemans: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: sa8540p-ride: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: kodiak: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: talos: Fix PCIe wake GPIO polarity
      arm64: dts: qcom: lemans: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: msm8998: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: qcs404: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: qcs8550: Move PCIe GPIOs to root port node
      arm64: dts: qcom: sa8295p: Move PCIe GPIOs to root port node
      arm64: dts: qcom: sa8540p: Move PCIe GPIOs to root port node
      arm64: dts: qcom: sar2130p: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sc8280xp: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sdm845: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8150: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8250: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8350: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8450: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: talos: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: kodiak: Move PCIe phy and GPIOs to root port node
      arm64: dts: qcom: msm8996: Move PCIe phy and GPIOs to root port node

 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts          |  2 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       | 15 ++++++++--
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  2 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 10 +++----
 arch/arm64/boot/dts/qcom/lemans-evk.dts            | 16 ++++++----
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   | 16 ++++++----
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 12 ++++----
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |  4 +--
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |  5 +++-
 .../boot/dts/qcom/msm8996-sony-xperia-tone.dtsi    |  7 +++--
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |  6 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 21 ++++++-------
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  8 ++---
 .../boot/dts/qcom/qcm6490-particle-tachyon.dts     | 15 ++++++----
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |  6 ++--
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |  7 ++---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  8 +++--
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 16 ++++++----
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso |  4 +--
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  4 +--
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  | 14 +++++----
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 16 ++++++----
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  4 +--
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       | 16 ++++++----
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           | 32 ++++++++++++--------
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          | 16 ++++++----
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts     |  6 ++--
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 12 ++++----
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |  5 +++-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |  5 +++-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  7 +++--
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |  7 +++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 24 +++++++--------
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          | 24 +++++++++------
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      | 14 +++++----
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 22 ++++++++------
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 22 ++++++++------
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 14 +++++----
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 25 +++++++---------
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         | 13 ++++++---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            | 12 +++++---
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 14 ++++-----
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 21 ++++++-------
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 34 +++++++++-------------
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            | 16 ++++++----
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 14 ++++-----
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 22 ++++++--------
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 14 +++++----
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            | 16 ++++++----
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |  6 ++--
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |  7 +++--
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |  8 +++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 12 ++++----
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 14 +++++----
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            | 14 +++++----
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            | 16 ++++++----
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |  6 ++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 +++----
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  2 +-
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi        |  8 +++--
 arch/arm64/boot/dts/qcom/talos.dtsi                |  5 ++--
 61 files changed, 420 insertions(+), 333 deletions(-)
---
base-commit: 9716c086c8e8b141d35aa61f2e96a2e83de212a7
change-id: 20260514-wake-1dfbdedcd173

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


