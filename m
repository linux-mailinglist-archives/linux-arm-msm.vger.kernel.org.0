Return-Path: <linux-arm-msm+bounces-94426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIrvB9dwoWm6swQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:24:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B915D1B5F69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 169DE3012202
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 10:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C8A3ACA4A;
	Fri, 27 Feb 2026 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pUFKB7p8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDdA8QoL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E7830FF36
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772187858; cv=none; b=DV2V2d3JWeixrlX/jKcQFMuTdSz3MVujSbK5nkUhDs4xznQOCCGNJoSR+Bbv7L/SHyfXYEdE6ZuueP2ACOq3D3ltPYoq5VOaCbat2AIeRGNqF1ThBfLFQYHGMEJw8nRyNbnsVJHpRP2k4xwdHf4ughdDxWd32gB+DF0c9GsaHio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772187858; c=relaxed/simple;
	bh=UQk6T/e+M8fBl5GMK7VHLBD6ptf7rBCi43/Bq11Knjc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eY75anrUczY8AP69y6SyZWX/HcEzhFzDhMBXyrSj9/6eyJryS1OF9XXhjFsMMoctKXKddTTlxMmBk8GuH6x6xX5utJn5t/A1ObtXcuerSQLWC89z4CzmQDSBBgoQBLXpC/SUnNaPaMnmKCLNkKM7RKEgK2cSQ+DLVTvbaqYQ4gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pUFKB7p8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDdA8QoL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9kM8c3946021
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fa/mxCJ0sSQqgRriAvb2m9yZUEtnUivnYGU
	Unx2Zovg=; b=pUFKB7p89uBB31igIbD4+wm6loHS6xtb6/744L2TI4VrEeHWYHI
	YHNlcUVliZyJLxsJWWCg6jblNNh/4cbCcCPm1Gr7BYEdbe484sfxgwtqT3nqcUCt
	q4afxyZkKQ7kaU/QzuyMzpf6bSBgaJgzaQvgSAk2t2fGIpJ8XcmZWGActNsC0+Lm
	+cI8OrkwpeB0mcaFP5CbgW1oZfmsnwn3FIAAJVEQDv8OwZ3Nvv/Hz6Vq+V/osCcc
	RIOBAqv86o4QO0+yW1gCH0eyE4Phyu7i7hcSdGsIHtEDEEylX9vJB10bKd7dol3L
	kMyoc/xdOTTwgfOm4CBpcTc8+TSXCNG9KJg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck8x883r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 10:24:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82739e0f53fso6166622b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 02:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772187856; x=1772792656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fa/mxCJ0sSQqgRriAvb2m9yZUEtnUivnYGUUnx2Zovg=;
        b=hDdA8QoLfrolcSCJmzGluNPy+htqUNyLAYvRhw1nVklE9SgSfxHEO5Bi2ZAgaK+mB2
         GsKsQSTG17+2sNelghg8ZmPUI+PoeF3zIzikUoPwxEDQ6e0KGfvlaYp3CtgHfdJXvekQ
         pPD7QbgdpcyUAGrnm/Irp1ZKWdS8hNRqb+yr6tCoMGUr7vhngYuEwqpRUmCJec+LiBHJ
         jH/sDdWzLcT+gFFnApRetOj/qC4tlwJ3P2iRAZseNB1rP02vm7dhPcZLFGtcWejtpVAF
         A33m5URk6jrjTBNL2I34FNfKNBqDAF4G7fshhmFdh47iw5CY9BETv7YlftRI3bMU0+zg
         Zx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772187856; x=1772792656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fa/mxCJ0sSQqgRriAvb2m9yZUEtnUivnYGUUnx2Zovg=;
        b=wc18Ttgi/p1tpdM0zGA+IEIBXJtBwg2Ynn2RzTpXGSLTSnjfb3rUlew2qkOE2TqQJI
         K73gTfJWzGqKNrqqy8ZEz4OQGzL7Tf6tZ7OGScoH75mB/hO7ckhmAuf8F56KkRBX7kIM
         KvKu9v6JfBuGGr3WRIOmzOJNrVp6B9WbnRK0uLXYlualMhGE9NFzR04VPjoBwsyxECzi
         ANLpmNzHCG0E5iznkZvsj9YVE18MWpUKdpJMyg+UNLbzrBhLG09UcygCyBFFCymFsq4v
         f9JPSPt4hssAuC//vHYNRYbciGUzW+iidL4mnfMs9UM29kUyyFyG+y7N4w2/ic7Cw2Pb
         JwrQ==
X-Gm-Message-State: AOJu0YzDd7E54cCxEhUabN3OtnUl0O23JBa1qbpP1GXm7tFZVK7yg6ut
	lkTzFaNWe0wa7tLRkgIPHVEEKjuwul/e8TtV3v5gZFzrjODiQXuVwZfc8HCbHV+CLYcGUcDtVyp
	Vd1AwBSUgQVJ1C1U7fghcn0O++EBIySgFv4WQDy5EchnWnwz+1KBoSb5w3aSsEl91uF8A
X-Gm-Gg: ATEYQzzH55H911BW/135mosWwQD0F9SP+1pgY2dmVRkUkc+0ue2ld407aXhq8oWhWL7
	L+y3ehxRA0gTJl8Bgi55kqy0aYJPijo+vA6O0KCaFKELT3houBYk8CRB/F4CVvYNZIDGvA0oLA9
	wu4n33dA6uI2j7bTjkSRUFSz8kjBsX35Kd4tN5VrhXoNN+yJebQPeMpIjMR3U4a4U0PuRWVSiW+
	3j6BStGpc4QltbASxmJwVioqy4GIZcVWJhk/5gWzBTSgT1NTnRk6tvLdQ70nhtFiI6oX0m20tbw
	0SGxcrwGt7A2eFo9pdxUubAF1SjaaekXAEktr0APE1/veMefE4Cv1awZFDzo6Q+0K9m75mnAPUo
	c91sAfip5OXxkgKsvvnBvofeeRQe5UbFJQNrjzo9NEF4xB6s9b9G1HIP4
X-Received: by 2002:a05:6a00:4c84:b0:81f:4963:4967 with SMTP id d2e1a72fcca58-8274da13386mr2428517b3a.57.1772187855539;
        Fri, 27 Feb 2026 02:24:15 -0800 (PST)
X-Received: by 2002:a05:6a00:4c84:b0:81f:4963:4967 with SMTP id d2e1a72fcca58-8274da13386mr2428488b3a.57.1772187854951;
        Fri, 27 Feb 2026 02:24:14 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a0299d9sm5350234b3a.51.2026.02.27.02.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 02:24:14 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
Subject: [PATCH V1 0/2] arm64: dts: qcom: lemans-evk: Update SDHC storage support via overlays
Date: Fri, 27 Feb 2026 15:54:03 +0530
Message-Id: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WZwBqkhX c=1 sm=1 tr=0 ts=69a170d0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=A2BV8qJQPfFdF5fhguwA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5MCBTYWx0ZWRfX75a2gYEk4xps
 km+3Fc3Wr3hNnPWNYXJyaFf8DPkTyA3IxGFiFDQXzjzq79N1ZucrYtyF1N2d3bND1r3riKmaiEG
 lneP3F4d4T6uA+EZkuwVGQ3Apt8MD9D2WL/2HdcqCxHzJiXJLL0lIFzJjP6NnJBwP4SVkkYzZXb
 m79W3oVMGM0LaRj5W9/NibiceSS13FuxGwhE2xmnGHmxNFYX7egO4Rv/SmrMyFwhZR9eGb+hgT5
 SjDlcku9vDNBPP9KGL4sTQWYvUhyRiapj5Fqf5QvYL7jsd9g+hE9fGwgk/+r26pVdmHtU0/x/q8
 wpAGPHfjf9n71Ci4tdn/NzKDSFYPEMKxM/p98I0YOlSTYI8iiqFxKzJ+XcsQX4+LZk/srYmNZS/
 ljeJjs3WSk8G1RqrvaPRc+c+2QRgiAUxPc3OvmK20cCmFy24IqKmzFddP2gzT/lrQCHpNQza+Fj
 fJ1SkkTqMPw/PDzVWnA==
X-Proofpoint-ORIG-GUID: Jepa4zgOFt9FaqyVxNlzpFwyoHkT0MvX
X-Proofpoint-GUID: Jepa4zgOFt9FaqyVxNlzpFwyoHkT0MvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94426-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B915D1B5F69
X-Rspamd-Action: no action

This series updates the device tree configuration for the LeMans EVK
board to support dynamic selection between SD card and eMMC storage.

The LeMans EVK hardware supports either an SD card or eMMC, but the
interfaces are mutually exclusive as they share the same controller and
resources. Previously, SD card support was hardcoded in the main device
tree, preventing easy switching to eMMC.

This series refactors the SDHC configuration by:

1. Moving the existing SD card configuration into a dedicated overlay.
2. Adding a new overlay to support eMMC.
3. Updating the common SDHC node in the SoC dtsi to include necessary
resources (clocks, register ranges) required by the eMMC configuration.

This allows the bootloader to apply the appropriate overlay based on the
desired storage medium.

Monish Chunara (2):
  arm64: dts: qcom: lemans-evk: Move SD card support to overlay
  arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay

 arch/arm64/boot/dts/qcom/Makefile             |  6 ++
 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
 .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 ++++++++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 -----
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 10 ++-
 5 files changed, 102 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso

-- 
2.34.1


