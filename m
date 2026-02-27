Return-Path: <linux-arm-msm+bounces-94430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KPyOSh3oWnHtQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:51:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 438511B6328
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59A71304C48E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A54039A7EE;
	Fri, 27 Feb 2026 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nuPvpZCd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KqJDYs8a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90AF3A0B2C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189478; cv=none; b=Qh0s4vRVzznSAvv+9NZLFEPbYbxuDZD9fBSNr/MxxTTSV+zgQ95z38nIUxGAmVkh22EWM+VswvFffliQ/6WYDG2I3XWfjpvMUYDoij2VXNEBfzJfKGBGJ6cVvVTDfot06ZRNDj/2XVfO3OCpmroQfKc78oZIUSOzYOLCHt629r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189478; c=relaxed/simple;
	bh=pMXLiMjaRZQzk8Ca04Br1UnE5JLjSlTR25wAaJ7Y94U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gVPuKYY9sdzo1K7aFvZqnGlVHTfk6NeIRlA29YHlijR3FjpsgGn/4mFCy0Wo2gNJsNDJOKWFypUhk2F5Sg05s9zSDtov+kwoMOKVLIgmZBL6joarPfgVF8oLij4ZvcCS0s+lZOm+PklT1B/2b8ciTDZsNJBPKihmqDtxcE/Q8AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nuPvpZCd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqJDYs8a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R7fTeQ2308648
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=J2NSJArG1H517xsr/epSX0RJs2NHIsXWrzs
	I2P1l1cQ=; b=nuPvpZCdmok4dHiadAqqT+iUrFGA7aUKnKayTSNCwezQJEhcs4e
	qZdrGJxTmzmGJtLSMVF++4TJ6QKDn5wGsk6VoSUOpc0i7Yc9vHoGitWBBgm32xY6
	CVVIbJu4bFHMHrO7sj5vPS6aGCp7VREToRUvnL8RWtyOHQk52IgJC+ov0wwxD/be
	VZC9bWJHkIsgO+1BpLKV2l6AlS4LBdBDJzQlydjNfIgpJzEYNLbRc/bDrwPS7auV
	TCWTUY6bWy/ahFmP/roiRjvNdukioqw6Ht75vTIcJWlw0IXuIkm/F0LjZi3TsdW0
	k0YESA8NP6/eKVCAYI1LKUzcF82P+xptoEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck73q0k0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:51:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aaf2ce5d81so22527075ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 02:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772189475; x=1772794275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J2NSJArG1H517xsr/epSX0RJs2NHIsXWrzsI2P1l1cQ=;
        b=KqJDYs8ag5Z7WEw0cPDKnjjWnKZNwqa1RWVYT93Klgw0i0NQF+P70lKDLD/rfq/1F1
         4Dz18oVsBPoPkOwkX2TdJ3nY66LBW49uLUXtHxG+i5Ps95oww4AtRbFFoMBbFBreOotJ
         9sNWP05H57crtdOu+LoqV1zNHKrOK0brd4YLgfx4K7qNmSoK9uI417yYce7fJ5jy9xyf
         ANI92pvqPm27usCQbvWeFazjzRkhT9DHYb4pCw19ZWJDOe4Ch+zF7EwPP9+4OiFJkbF8
         J6fD6iDcuf5cLnpNjOfmcFSlo9Zo+RmXQ8n20JNVxKjWPjG13jBtpadjhJ2LgrAmRH83
         MVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772189475; x=1772794275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2NSJArG1H517xsr/epSX0RJs2NHIsXWrzsI2P1l1cQ=;
        b=MHxdyw+bSN3SzU2OMExPCEnyoapoh0424X1NKO9Ppu77I3vSZWsYdNKp3tu7Xghlr7
         KGUJWuBXiD7Z+Ct2wcQwO1iWOHyNX3Sq2phEoh2kXLMVd5w+m8+mQFtK6jjLnc/nMKjc
         jq37qELwul3HmaWb3OxliATLON1h/gmr7SfxklP2txlemrkWJmxLlInvkquuVsnkEZU6
         6qP9sacLBif5IHBRK+6mzJGFHjnJE+dczs1cNFj3POhuOUqS+GY1k5yqqPfnXo73Ec+n
         nBKJHMDsYHppGXMkgD0Dw0RKDrOV3Ir0v4XHLXkstb657nucWUae1YpuBfQAfk8hRmAJ
         UnTA==
X-Gm-Message-State: AOJu0YzrT+BG8JRindBMFa453KAjmVJXnqsmgyx66xR5duS4G4Feodgh
	En3ULhAqZL2Xyg+u5cGhmDFaVx7Uw00BQOvMdZJVtBle/fSPGlc9ShsORF6MHE50jYFHFrXFdAa
	dFzeiK2KwRxqVV3Pqej+oq4B6euxwboi776I7A9QMWG3XW0kz2/CwUjj/0UwMsJuXB9lv
X-Gm-Gg: ATEYQzzMW/txWeQQUvjb03UZseufKaDRToOGCsno+BJ4O5MIqMsuGOlXLUKz26kP771
	bHn+RWAwn2GvNJ1S19isOj6BI9NnXFBUa5IrcJEKb1h/UDVFF8+IeMLLR1SRP3V11i9ivGuBRN7
	RQJQXGkJaUrWHOGqHZs8HzkfIGBhdTR6RWbaOWObZj+/QiLRxBfZveBrkIjzK7koDk0uhf4gwRR
	nFseoTmY60B5nIsIvIzozTs3slb9q+L5qPYxuF2+1F1TIS22ta1rzOfo2QZpQqhNEGGKzhJvsAS
	9LSpzs8yGreNVYWX7PQ5uFOslXBdPP/cJ7bXiM88Ayx7iox6SJOSgClLOGMxre+o7hcTCGYRIAi
	FR9k4LQ3eI2EavJwxodbthCv53fl695FKCRugiytBLzCZMgWwnEP6GTfy
X-Received: by 2002:a17:902:e54c:b0:2aa:d2a7:ad2e with SMTP id d9443c01a7336-2ae2e49840emr22843655ad.36.1772189474879;
        Fri, 27 Feb 2026 02:51:14 -0800 (PST)
X-Received: by 2002:a17:902:e54c:b0:2aa:d2a7:ad2e with SMTP id d9443c01a7336-2ae2e49840emr22843365ad.36.1772189474374;
        Fri, 27 Feb 2026 02:51:14 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb757a8dsm73721885ad.40.2026.02.27.02.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 02:51:13 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: monaco: Enable SDHCI storage support
Date: Fri, 27 Feb 2026 16:20:52 +0530
Message-Id: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5NCBTYWx0ZWRfX0nclaMfp3mTZ
 3NVEqlJKiHJJbZmIHyDvWilTpqWIDT2Fp8Tex0XNu+tEI0J6oA2Uqqg/lPmXitWYy89SoDrGMdx
 398jjhLKHiivt31t1HjY3aTN5kfTuTIsXbFCx1iMQ34py3ru1NiBem660lfUKwBIyNQmq7pok2Y
 T9ygD8bBSiUC+4qdJ7m2rJByTjuo85Se99xf6AauMF+xzrFIfrk4vGBnGtvmMb3RelODYa46K9F
 UWEL+wacUja+Z8mI5ZuXPbW9EkiJpE7/sLB0ldFO9zcY1ZMOfItDOexN0deP09UqjYiZRXEGjSJ
 bkGfmRQvRqhL4UvGCtYuBj2jEvJPlctJ02JTcJkBkRqvnyBRMyd2e/QWTo6dEjwvW9jQrQ3a99W
 /r3XOZgJoWP1VcL5llVr91KwyzKvkLFZ9K+CXSjV5jO+CAkI0ke+sLLxZzduui31444CJJyHf46
 9L50V4gBp48NFyS+/LQ==
X-Authority-Analysis: v=2.4 cv=KL9XzVFo c=1 sm=1 tr=0 ts=69a17723 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=p0eJXinjNNGP-7GWHw8A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: jHoP5J9Bp9S1P5RIKxFdKz869IxpWVap
X-Proofpoint-GUID: jHoP5J9Bp9S1P5RIKxFdKz869IxpWVap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94430-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 438511B6328
X-Rspamd-Action: no action

This series enables SDHCI storage support for both SD Card and eMMC on the
Qualcomm Monaco EVK platform.

The Monaco SoC shares the SDHCI controller between SD Card and eMMC use
cases. Previously, the common SoC dtsi unconditionally enabled the
'supports-cqe' property. This causes regression for SD cards, resulting
in timeouts and initialization failures during the probe sequence, as
the driver attempts to enable Command Queueing (CQE) logic incompatible
with the SD protocol.

To resolve this and enable full storage support, this series:

1. Moves the 'supports-cqe' property out of the common SoC dtsi. It is
   now only enabled in the specific eMMC configuration where it is
   supported.
2. Adds a device tree overlay to enable SD Card support (SDR/DDR modes).
3. Adds a device tree overlay to enable eMMC support. This configuration
   also explicitly disables the UFS controller to prevent power leakage,
   as the VCC regulator is shared between the UFS and eMMC rails on this
   platform.

Validated on Qualcomm Monaco EVK with both SD Card and eMMC modules.

Monish Chunara (3):
  arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
  arm64: dts: qcom: monaco-evk: Enable SDHCI for SD Card via overlay
  arm64: dts: qcom: monaco-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  7 ++
 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso | 46 ++++++++++++
 .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  1 -
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     |  1 +
 5 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso

-- 
2.34.1


