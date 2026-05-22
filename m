Return-Path: <linux-arm-msm+bounces-109369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKbtECGUEGpSZwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:36:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6645B8568
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 739B130685F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE6F367B66;
	Fri, 22 May 2026 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWPMRzJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3lOLQKv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F0B140E5F
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470855; cv=none; b=Tu/XUYWvXA8lIfmcVtsSUqvATYBJcNrwRkzE5pTKBS2XFz3blaQebplCETwp57FEtQN40XQPgEQayXpWJ+Z/4MJWZh/JFwZ4nNLWrvlqfuf4wQw186Oqv6z1C4xBwWKsc8d5DJO+Apr+hScCH5mWbgcV03LcDG0mRVgtmEnA+b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470855; c=relaxed/simple;
	bh=5J92VyDWgLlUhHhTHy8tKjEQsCOLkA23R9MCmKQ/Gik=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qd/P2cseVlH0neiAQvBwodlnqtMARpgkFIQATVEJ3Wwn8GRliFm0KuYgaukmMoaN8ecTIn3XDI4OQ5ZWY/x2EwHDPeV3nfZsPxS4qaNIZKanmYrUCwuoMzdQIp6LmEIe6vI9T7+l0n1Wa24z8680U7talso2HCyIYZ+LEIzVYU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWPMRzJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3lOLQKv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MFr93O1816103
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IwddrSzKn3iMA8482Qg57Y1aDHZnVmjtI5X
	veAcu0xk=; b=lWPMRzJKN7HeQN4GQ9Yz/4pz4w969E38tEFl1zP14zflezs9Msm
	4edV9ueXMugDSUCINXZR8HUG6W+E2its8baroXIznW1fJUwoyOvfnC9+/3btywx5
	MvUvzGBoXtkK39klviLdHLYC/DotuLcwXIzFcXLTIrDkKzbuLX8iBAZKCz5dJOg7
	K8EqTw3rf6QSltXkbh4GHu9dKtvb/szRpirAr+y7EAhoDztkf+0XQn/TG6xUalpi
	U6NZA0kWBRvFnLVJET4fpggXX5PjmiuUe59IteBcAQqsiEcuZOM4CuABRzekGhTU
	sfKLGC5fVvQirTMx6fh3Wy7gq6h6hWup1Ww==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm34p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:27:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-83536dc3be5so8646160b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779470850; x=1780075650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IwddrSzKn3iMA8482Qg57Y1aDHZnVmjtI5XveAcu0xk=;
        b=i3lOLQKvJ+18q8afQH1lHLkECobsMdOujRXEH0lfvm/i3ger7r/H0S7FFvMGFU3YhM
         VwrGGhsiquAjy/ko24QdJv2OJDoH+Nh/lS04KkoVI679tAihJOlp2hLKhReJ8m1dkpls
         uY7QRHvwsoPm/D20Q9KeYuHSgsx4xF9rOr90IX89D+Xq5VXvBqT4BG8CvU8Dgk9xsolP
         xA4sEeqzkCTlmHp5XOfFRrwe8AQzFTcNi7IUAgn8NyyI06Y5Bf2MTqu56H/zag0IdUra
         BrraxgtIbZYHdiFkIKAShs+v2zVLDwhQFHz1RL0YX15DKbK6Z+D22m0cdkdyFBplpEjm
         iGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779470850; x=1780075650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwddrSzKn3iMA8482Qg57Y1aDHZnVmjtI5XveAcu0xk=;
        b=H76DGE0WqAxgLJ99BsjgYhSn6P7YGjVPq4eDUSf34391R0DlwzJHUhYT6UYvTpQMi6
         wHaAS0HhfN+WKIrt0ZmX+IE0MbMWOrJV1yQEvjm0AASjDwEr0cjnV2ikBW55XlMth6sj
         M5X304Eczpvvg5mkqMzeKQ8WL+idXVfCi8rv11eGdcAQ2TJoep4FXHbEhi7H4zf+5ee8
         1mW/GhQjTOHKq03AhjjQhAj+N8N+VeTzZEdLuS3m7Qfjm4ts1bqIGTIQcN04binT5jHq
         ulPSrWXS4wURhFl1lr8e7pHikBF17XS2mw8aBTZ3qzJh8AdhEf4jxq6diYA4DqmHXpcG
         kKrQ==
X-Gm-Message-State: AOJu0YwwGKmQDb/cASPkJRkF52wmV6R/EIc3J0FOm9YdUbYG/86M1iaM
	nll1ONvWM14B0zqcxR9OPGmXM1Svl9uBiowmPkuweMbY8sOX/itThcw1PQ7tY8b0XYfswZSDqWl
	jbtqR7jPWpk45OfOPlxFqdSCdp9eLt2gbxJh9kIrLAb6I++EdLO5PdguTAa7TayLPUDlJ
X-Gm-Gg: Acq92OE4JfcAD3Nc28HgOC1WpXQcW8MfuxQyjE1FDwGlYeq6b5VeW1TXyZGsOQfbNxF
	mAxylix58Qoq1FtoFNS0HxHGbDxiGDdLuoyIQ4OKXuUKtczAPA/DFf4jZFSuhrccslj5CeitEJY
	KPSRBSbkX5AjoYu5aR8x6o+ezIaPGHJauG8t0AP5lnA6jGFJx7Db3+ew0VT7PeVOCyd2Z+phBd3
	EMgCPLbUWeLXHsowswzC2wc43Ntv1VHFjeleMPdwpddWHLE+mUd+oVsOdF4UVs088uQK8PnwMXd
	2nIh52yH3PUuaTuWX6r/qVgNOqli+XFc0YEzcmwztL0JBclXWFFnbQoW88CAbdZF/h6PbCVS32/
	/hyyIX7Zu8hWryvsxGtCkTF+p6x22240Y5fJv53NCoCF4Vhsdio8Lrg==
X-Received: by 2002:a05:6a00:2a09:b0:83e:c8f8:cec7 with SMTP id d2e1a72fcca58-8415f352254mr4810265b3a.35.1779470850000;
        Fri, 22 May 2026 10:27:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2a09:b0:83e:c8f8:cec7 with SMTP id d2e1a72fcca58-8415f352254mr4810241b3a.35.1779470849562;
        Fri, 22 May 2026 10:27:29 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea09a9sm3045693b3a.31.2026.05.22.10.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:27:25 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V2 0/3] Add Hawi UFS PHY and Controller support
Date: Fri, 22 May 2026 22:57:13 +0530
Message-Id: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uXMubZKhDbH8oFBQOSmacaLOrLmBfSYx
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a109202 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wRtOOnJjwWicnHpPwtUA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NCBTYWx0ZWRfX8BagI+RMNwHO
 OObS8klLuPVxIjxgEg9VwM7kcfEfdCd3PhEfOfcuNtzSg2PLmLA480vwJE3paz4jk+Zg9rfi8Gd
 MGr8D5sK7VYn/CrdKkvm58GAt9DtUXBGMzaKdlQHUfFX+yr7Kdgs5dHCqoxpGGL5ObJcnpmttBw
 4h+KvSpWgeIhOFWzPOayznWHNyfVtWDdYTn7RVCZwbo27QiGW3apB1SEhpGLEjmVwZe5Izp2Dzl
 bSacrIMBnJpEixwurzaINPiB0hcWSa9ZIKTvTaTERpN4VfN+mvB7F/FSpZVrPGC8l35vPsSJtu8
 qajmQU733lYOKUWBCZ0rDWi3bZmp7LqrFVvw7XC7+1kNwaATfI1b8FfWsnBLhDfLcsnAAOIrKfS
 kNuPbQy1ZDGqMAs+SSR4uBE3S2Bb5NOLsx4OnrE7f2+BjnbVo+/p2oqg4q888IVffVmLKTtTYRj
 pksfC5KK2MK6YLQIM9A==
X-Proofpoint-GUID: uXMubZKhDbH8oFBQOSmacaLOrLmBfSYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109369-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1D6645B8568
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This series introduces devicetree binding documentation and PHY
initialization support required to enable UFS on this platform.

  1. Devicetree binding documentation for the QMP UFS PHY
     used on Qualcomm Hawi.
  2. Devicetree binding documentation for the UFS controller
     instance present on the Hawi platform.
  3. Initialization sequence tables and configuration required
     for the QMP UFS PHY on Hawi SoC.

---
changes from V1
1) Addressed Dmitry's comments to fix versioning for PCS and qserdes.
2) Addressed Mani's comments and fixed missed compatible string and
   binding name correction.

Palash Kambar (3):
  dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY
    compatible
  scsi: ufs: qcom :dt-bindings: Document the Hawi UFS controller
  phy: qcom-qmp-ufs: Add UFS PHY support on Hawi

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   2 +
 .../bindings/ufs/qcom,sm8650-ufshc.yaml       |   2 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
 .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 140 ++++++++++++++++++
 5 files changed, 205 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h

-- 
2.34.1


