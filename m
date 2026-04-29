Return-Path: <linux-arm-msm+bounces-105102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHI3HaaH8WmchgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:23:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FD948F1DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB8DA300CA08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 04:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0155B2DF13A;
	Wed, 29 Apr 2026 04:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwZAMnSf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hrppug2F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7233890F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436577; cv=none; b=fDeh+ng6J5Tjs7iI4JAy4cEAgvqb+vRQP+0DCg9eFEHzg2/+W3jKts7sZxxjrqOP0Wq7C3Lw2cy3a2OyHMFBQURRVqViYbnL8KfULFvooHsRCXg5kyFRQ/Dk+ZxaeH8iRdZ5NKiq+nmhkbh4G0umbEqx6isixkLv4o07yOChiT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436577; c=relaxed/simple;
	bh=bGx22Kz0pmg3WWMp05JzY1h9KOF59s6YMghleFOgd10=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YJtn9nvjZeL/OROw/I0Yg/nLGAL74IShrF9bVbCWf6m5vuVmpbzkRLOkjx6zXB6FspmNomvqrzFed4RKxehLNoOlInXRjdW9FKM/YKoZZmW1VaLWfpmL8cmks+cOIVsZ6T1RKGp4nZbG/AO5BrcMTcW152J46ckXT4a85aHW3UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwZAMnSf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hrppug2F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3909j2984311
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GPeKcVlNgiAhf/GKZ9rf2r
	J6AvxknNeON9pdTo43Opg=; b=bwZAMnSfapgFO3uQc4EHnUR6Cwd7baY8jgC2HG
	TyVZcYQfj0nEXsiUt8iKU6NMUC6e+s/gPL7nxesml8q5TibZVq/88FMPKbu24TSj
	Qhoh/1Hzu1JD5xrr/sVAc5DhlgqDSHUG37trmMNhDpIKuu9NzOT6xi73I+B+gvmO
	2mW1t2JB4wBm6trAKI3RA4hZ+yXmMbkIau+qyBpPoja2xv7EO4CVcyQ3cxB28EIM
	TrF7A3AE77VIgh8rW5GDeKERaeST4+GnRz8285sBLK5xkGGVZvG+1qKXuHQgM9Tz
	exJ7s10dE9DuisqGNVfWsljNUUDbT2LRb2DNVm+0YFtNIlIQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du0u1t1c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:22:55 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f780a13c9so306486b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777436575; x=1778041375; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPeKcVlNgiAhf/GKZ9rf2rJ6AvxknNeON9pdTo43Opg=;
        b=Hrppug2FijAf9SjZhUEqRBGxRERJ2TcjfBVOmQydSo5O/Vjf08JjdyfdBgh1dB6j7Y
         PVA+MI/7bQogUfbQOOc7dzeZ4hePUYa/kR58NPxB/9WoN8LIIdQmmzERK6OO7Od9YNRQ
         kGXk6gHLwuVeoZpp+ICJJf3/1M/MU6pWG6dFIpieSY5WgKl/Fj7Tk7O5lMxPP0EyMYAW
         RmTnB3ab9MyqCexDWbI1MBCDcBdNngYbMtNQomR6X96BCF0oCkIPxx9AMHyShvcXRvUL
         pBnH/qz+s5b0fBAteiK1zfbuJCnCo7KuOaMLEttxwXN5/9Wtpqp6ZnXhx5LXvuXaOx3y
         uCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436575; x=1778041375;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPeKcVlNgiAhf/GKZ9rf2rJ6AvxknNeON9pdTo43Opg=;
        b=ZbT4YcdocrGPbcvA/DuU7YSiui2rKrqa1Z/sXCBFcZwEtLgNWsYFucYr5tl27NGz1n
         atCxSSveV96x6AMC8eOfJvH4x3s2O3hnAETExkjdTpFYNS7Wi5Arkw5ITlcd9SCwdfXR
         VrvwxmSfdnEGGtoKI2FvmDco8obCGtxQNDNYpPbYuBPGJxkrNvp/57jQGxNsF17aU0mI
         7eN1H461lYOjmrCOkJVWAyqIBvWYqGBBBx//MUSlSLMFKL/korj5b0LVkgI2oIvkXBx8
         yUSE0dL0J+TOBiNL0XzFRCdr3nbzJ4Uc1ih/hFWHvazLibDJ4HjK2mIVFy2G/x7wUd+s
         YvyA==
X-Gm-Message-State: AOJu0YwAbalFu0eG1O7kVSUsRAo97T01dGrWB1SW+8kG5i8k5k3UL6Y2
	TbezaQhY8+zHqFTbQw7YNH8NTpNVGF6OnZkcQlySM+6yQdr/EQ2XP4fFVIN54j3AHHCrdYCEtrl
	hULTlkyj7FuF8j6vrmKiZ6jXZHInT38DdjHNsg1Qh/78eQt4NB5KwvqRtCKFAiX3dlk33pvnAVF
	gw
X-Gm-Gg: AeBDievYyDAnbeK0v/A3lTgLkyHizDuqUewh7XLabZPtuzqpc2JP++8BSKapxPUSx4l
	dzrKSxHrm2kyfGbWJCWFuQTGz793yvM70GTl88ugz0iqod3CUFR+vs7yyMW+1FayC+tjMtELlw+
	Bgd4yWateEZts/xbdrzpzscxGSzXDem5j6lYE16YW/8y7/lg2oSeyZzRJEwXPo078kbZtYeM1tX
	/YunhSt0tKCa2w5dnj1nDMwm1jbfr3hOE2G9Tof24bbHXX4ZTuYk10L6G96tfw7FFMhai+imiZt
	HiCixJ5NIAm+tSzJg9B6iCTJ28jHbVGuYcP/k5yb0TKY9qvuLyU+KOdmPXEw5HpxFRiGKthCJGM
	XqvtrlLCJ9GeMgZP9uiq++tPn/+DoGWGUFJ8qJYYhPtg+QAQc1rQb2LOAcp5IcA2b1Z6t
X-Received: by 2002:a05:6a00:399f:b0:827:2792:e401 with SMTP id d2e1a72fcca58-834eb487cb2mr1620403b3a.15.1777436574997;
        Tue, 28 Apr 2026 21:22:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:399f:b0:827:2792:e401 with SMTP id d2e1a72fcca58-834eb487cb2mr1620369b3a.15.1777436574528;
        Tue, 28 Apr 2026 21:22:54 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5a074dsm602200b3a.10.2026.04.28.21.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:22:54 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v4 0/7] Add QSPI support for QCS615 and improve
 interconnect handling
Date: Wed, 29 Apr 2026 09:52:39 +0530
Message-Id: <20260429-spi-nor-v4-0-73fb1bab03ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI+H8WkC/3XOTQ6CMBAF4KuQri2Z/oCpK+9hXEAZpEYptkA0h
 Lvb4gISddPkJe9704l4dAY9OSQTcTgab2wbgtwlRDdFe0FqqpAJB56D4JL6ztDWOgpK55VCqBA
 yEtqdw9o8l6XT+ZP9UF5R95HHRmN8b91rOTWy2PteHRkFKrDGTGmmGVNH6336GIqbtvd7Gh4Sx
 0e+csk2nAdeal3I8C9ZZvUfLjacw8pF4PsKBc8KroDBDz7P8xvnckvlNQEAAA==
X-Change-ID: 20260324-spi-nor-09c6d9e0de05
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777436569; l=3968;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=bGx22Kz0pmg3WWMp05JzY1h9KOF59s6YMghleFOgd10=;
 b=j+zyqfIGiOJWg/LEmcDDpJlAKH/LPSqmOAUF1iysn6lov4WgBjJ3oQKmRZeueascrw+9hcWRd
 YrxkD6YEMT9AufVP8AnH9AAWkKkcxTpG78NsLnr+wQCpApm5hT6EuG0
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: cX7dPwsodGo9lxYHy5qlUK3aUZq38TxC
X-Proofpoint-ORIG-GUID: cX7dPwsodGo9lxYHy5qlUK3aUZq38TxC
X-Authority-Analysis: v=2.4 cv=aPPAb79m c=1 sm=1 tr=0 ts=69f1879f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=IkmApkmYawgI8k_-_nIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzOCBTYWx0ZWRfX1ar9MuatVjKC
 SLLt8cmCtFmGpUXO2R2zsMIlcS4PThdwE6tsPtHDzRBV6Qm3qTquX1ZLqwzBsnZ5DwrDL6KHo+6
 vfcq81blY8cmwa2J6TR6oB9SMLo3GvpqcpuhNSCG5Bl6rENfTJ/Ur3Ao+z6B/Hocd4J106Qhk6k
 hDzzoaAzzAJY7WLAnv2A2QQJl8S8FV/cYo3gDfmZDjnV+lOFC/5T4xG60We6ydWHH9zDK917Dsi
 H2g+giratyQ4cVw9Phd4e82Z1oJ+6iYPotPvovObZJaf19VRj7F6f7S5T+2rIJg3AvtLxfsSiVD
 ZVlcpzFrC6xdcShNpFdvzCzTuHb90FyqVvqum3RuNm+YTpAVqpjqWOsiEktM/W5ykrDe3kMDdi0
 nRqqywirmB92K9krolPSC6pYyd9x3vv+cLZr/1V5pjUj0V23AgcXPqX4jSNwmtFc89JSppy7nIv
 HtD/refMCcq+Mt1wFqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290038
X-Rspamd-Queue-Id: 08FD948F1DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-105102-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add QSPI controller support for the QCS615 (Talos) platform and improve
interconnect bandwidth management for QSPI controllers across multiple
Qualcomm SoCs.

The series consists of:

1. Add QCS615 compatible string to device tree bindings.
2. Add qspi-memory interconnect path support to the driver for proper DMA
   bandwidth allocation.
3. Add QSPI support to QCS615 platform including OPP table, pinmux, and
   controller node.
4. Enable QSPI controller and SPI-NOR flash on QCS615-RIDE board.
5. Add QSPI memory interconnect paths to existing SC7180 and Kodiak
   platforms.

The key improvement in this series is adding the qspi-memory interconnect
path. Previously, the QSPI driver only managed the CPU-to-QSPI
configuration path. Add support for the QSPI-to-memory path, which is
essential for proper bandwidth allocation during DMA operations when the
QSPI controller transfers data to/from system memory.

Set the memory path bandwidth equal to the transfer speed, matching the
existing pattern used for the CPU path. Enable and disable both paths
properly during runtime PM transitions to ensure efficient power
management.

Apply this change to existing platforms (SC7180/Kodiak) as well as the
newly added QCS615 platform to ensure consistent interconnect handling
across all QSPI-enabled SoCs.

Testing:
- Verified QSPI functionality on QCS615-RIDE with SPI-NOR flash
- Confirmed proper interconnect bandwidth voting during transfers
- Validated runtime PM transitions with both interconnect paths 

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v4:
- Made qspi-memory node handling optional to gracefully fall back to legacy
  single-region behavior when the node is absent in older Device trees.
- Checked return value of clk_bulk_prepare_enable() and logged error on
  failure in resume error path.
- Fixed subject line style to match subsystem conventions
- Link to v3: https://patch.msgid.link/20260420-spi-nor-v3-0-7de325a29010@oss.qualcomm.com

Changes in v3:
- Added missing interconnect-names constraint for qcom,qcs615-qspi.
- Changed interconnect tags for qspi-memory path to QCOM_ICC_TAG_ALWAYS
- Fixed suspend sequence: now disables clocks before dropping performance
  state to avoid brownout risk
- Link to v2: https://patch.msgid.link/20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com

Changes in v2:
- Moved allOf section to bottom of binding schema
- Added if:then constraint requiring minimum 2 interconnects for qcs615
- Fixed runtime PM error handling with complete goto-based cleanup
- Added proper error paths in suspend/resume functions
- Changed interconnect tags from raw 0 to QCOM_ICC_TAG_ACTIVE_ONLY
- Link to v1: https://patch.msgid.link/20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com

---
Viken Dadhaniya (7):
      spi: dt-bindings: qcom,spi-qcom-qspi: Add qcom,qcs615-qspi compatible
      spi: spi-qcom-qspi: Fix incomplete error handling in runtime PM
      spi: spi-qcom-qspi: Add interconnect support for memory path
      arm64: dts: qcom: talos: Add QSPI support
      arm64: dts: qcom: qcs615-ride: Enable QSPI and NOR flash
      arm64: dts: qcom: kodiak: Add QSPI memory interconnect path
      arm64: dts: qcom: sc7180: Add QSPI memory interconnect path

 .../bindings/spi/qcom,spi-qcom-qspi.yaml           | 21 +++++-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  9 ++-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 12 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  9 ++-
 arch/arm64/boot/dts/qcom/talos.dtsi                | 80 ++++++++++++++++++++++
 drivers/spi/spi-qcom-qspi.c                        | 80 +++++++++++++++++++---
 6 files changed, 192 insertions(+), 19 deletions(-)
---
base-commit: c369299895a591d96745d6492d4888259b004a9e
change-id: 20260324-spi-nor-09c6d9e0de05

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


