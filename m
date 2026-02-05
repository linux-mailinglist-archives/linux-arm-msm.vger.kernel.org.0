Return-Path: <linux-arm-msm+bounces-91870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBqrFWNehGnS2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:09:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C43DBF0595
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCCC730E269E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3908638F234;
	Thu,  5 Feb 2026 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjmAMmx1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ue5ZUrJ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05325372B2D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281988; cv=none; b=o7E7dG59ZnIL3V8r07W8x6awP57aFJ4slJZkgzjiy+ct6RIfPS8YtuneZv/DvOYcPtT+bMa1ML7M86maFJQFFyIIW4lJaoiCu/93nbDKO914BASrabNTNNWS3UCGl5weYyHiFmeuyS5d++IxVDVU6ZrR94PEC+JHBJOZ0A40PJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281988; c=relaxed/simple;
	bh=n+gSCan/TFR2RjnPRESAKpuT3k+mbftPmP+ZUMCgxAk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Si6pLhv6bVjG4QqoiTr4BzmHvxKf8RgyqKq60KF7GCjPsgGHz6bP/f6VE2CEX3R+3UBbTpS9ni74aOW3UJjMyl7UMqDeX9884LeqFzXZNXERUZ2UTfh2Rr5x5xs41gwYJO1FCePHUO0tgFbsLJ9Mz8g+HblLsddyr8FEY2RAQZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjmAMmx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ue5ZUrJ4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153du3D2639846
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 08:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XWsYQXbhd9tvDcAW9NkjQ2rjLg7lbLbumxv
	oSXURBOo=; b=bjmAMmx1ETQmfZI3Aoqcdaz1Q3m+ToTm7ZX6LTwcyq58PiVifXe
	MXUkMkh9F5jQb3cac9wvd4YD4qkHQ4YovWea6xCUDG/cRaPk95xNKQEL3aXluGD3
	U1GiGAN3ulgJ5ycb2Mr0ifvECUen2PgVjirlVcMERU8NsBct/OxD3UKQFErLJHqv
	QZ1Dig4i6Tu+bU9V90+QgohKsmV210ZReXXl/3CfiEKrP2Sdj6k+RDUNLzHPPDFf
	JE5knnKCi8lt/Nqm66xMFjjwdQKI4FEb0Xkx5w+ML/wRU14YPCsa4ikPXYtf/mE/
	uYyRAsnmjFlZuQIWMPHDGv95FLG0oD/a9XQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47qvb3pf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 08:59:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34abd303b4aso1593250a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 00:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770281987; x=1770886787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XWsYQXbhd9tvDcAW9NkjQ2rjLg7lbLbumxvoSXURBOo=;
        b=Ue5ZUrJ4+v7VWZktYXa+y8Psvsj7i83wkwrllPKCIoPl5IYUxLqNMYy991CjkzZuRj
         ChPJLCvZzxkxJGgXq3KtUIn9Q2coll1Kv9ewjH5tM07HjYfFXXSy1EXdujT+xyVjvFga
         kk3tWHdPlUx1jRFBpJPwf65z6sw+AOgYYYh8ySgt22PwwIyKqOkOzkKOz5qblehYzfuf
         tSD+ZgnzBzzlUkjMRV0ISkk5p30Oq1UNaJg+IovdP8LlMKDkTSqhodrzE47GW46Z1OtK
         IuvB/nZi6pWgSI3L2b0jLfYLXx4u4EfpnFvlNG6K9VGyaYxp4FZw9omT2GJXhjsF1GeR
         zTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770281987; x=1770886787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWsYQXbhd9tvDcAW9NkjQ2rjLg7lbLbumxvoSXURBOo=;
        b=HF0iu10MmiQCvHMr5doXZvmKl7eZCpbLD8h5+8KQQ7Ey1tpKE/b/X53a4qUjfpSp5N
         gFEoSk4/Y7Qpa1+I4yPrSBlMdafmX4Of4QQ+NeZU2PdX+kPhkwE3VcHDsWm2MPua1s8R
         mibDbYwShoDzNkOtV/qFz3x7SNWhqwRGtKwccrZpsfg3hoUMZ9VMN8xTBR+X7e89b93Q
         O+BZl2XIfxkwRZvyCRNEcdKhzcHmkBOmGL5/balx1Sc4nxz9yMujh8SYPlpRbp0b1UnA
         o9NqRGuEn7XQELfusHclNMPtcI4d0Q8I9uWKIHsgxsxrbOToxy2gC2HERndyfsrQfpwY
         jmvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ZTV69pcnpFcdHkP2w68bzu7YylF5AUXPXOWGClAJq7Q4wt7uhoYuXg6Uzl1sRRDhM1eBoiGFCviAM1wZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2iKKpxWUy1BZae5iKuQaQMtQ2tfKIUSXtJmzM5JB/bK/DLdOr
	myTTS83pqN1byUUNApgdp1fZpfZRJUWrMso9oewrt3smexixNE8qfGK+YEQXB9ZnV/dkXunGXEn
	aQ/TD4d74YJm71OhPWQiLg01Wox6E1Aeyqnk22lvIMijWPnFp3Sa/nXLSoA/OLCU1aUXszssZCs
	/m
X-Gm-Gg: AZuq6aLCNHyXT8MFGzOzWPU9gTJIbZj19KgRHGg8XZoFhGpbeVxR1eCgqioqBPXOnk1
	KIazUy0O0zlO9ArT6P6PgTVGZALEI63wpSMQKjeYdfwM+iz6u5loQQWvkrHVZNfA6v12vizNZvA
	pOS2gdtvwl3kpfwAILt4dGpubeumFJdKf9ijEj1tywW7P92k9ez5SyHIWsgZsmiOFzCFuUUgwAN
	cntevajwwaxKOTxem5x4az6kEm3hRzNmxPz8MCwAeCqkYSmWcn/PskBkAfsDmzo4vuRVkv/F558
	66mfsmpQxvsjnV5kJFAAe5CXEgeme8xZMPqPGODKizQpiAQl0t5/l7YlBC/FHiBiTmFhD4jYKQp
	uXFbkF17QInZMr8BgSUpZbuE0Jzh7wOmUhVcLYPEtSuCHwqrQTTYOyeo/XRkC5Pkd2C6keftAVv
	e4d4sLDYoJA7hkUykS3uiKxP+MarRWMHq0fbi8s8k=
X-Received: by 2002:a17:90b:3904:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-354871937bfmr5613404a91.20.1770281986712;
        Thu, 05 Feb 2026 00:59:46 -0800 (PST)
X-Received: by 2002:a17:90b:3904:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-354871937bfmr5613378a91.20.1770281986283;
        Thu, 05 Feb 2026 00:59:46 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c8572b4e7sm4361984a12.33.2026.02.05.00.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 00:59:45 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sumit.garg@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Enable IPQ9574 RDP433 eMMC variant
Date: Thu,  5 Feb 2026 14:29:32 +0530
Message-Id: <20260205085936.3220108-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GaEaXAXL c=1 sm=1 tr=0 ts=69845c03 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cbyDfle_NFQeql7pV_EA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: W4nnuejyJ5Mc3bl5sTb8NoN5zA9OGFBf
X-Proofpoint-ORIG-GUID: W4nnuejyJ5Mc3bl5sTb8NoN5zA9OGFBf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NCBTYWx0ZWRfX9Gm/2jF7Rrz0
 /QvtC3kmjidZ2uIFx7rzuzj1vQzhk44fnyqt5pJ8U58aIGj+Nx5YRpXXAGCRbxK6Fw8cYVdizaT
 mzaJTtuChEFnj/UGpTu9cXswQ8Y5x5TrVLiZBmOJorgVObSMGJjStJW3Wy1R+F5fkeeObWuD4mH
 usizAz1rUXeBcZ20PwSV+muC1bq1x5IrXzdHVlkE5ZvffMLu26BMHCxIVumL0PDYDBn3uL7DBI1
 6dJSyEm+sR/P7oax+1yFvZ0bp3uR0J1GdLwKbUOz3UH3TvlCYGJH9gUv7oO+ABzKfOT2EfTHqPj
 M9dt8MJs3H3pYIQBXq+d6xnb+HKHDiwL9x8x8B2sMizY+axXZQO5W8NmhevwH/iVPsfx3bJ4IKE
 /pPH6r4vq3G+gwi24+e9Hh6JijgaKAEgds8+dC5e6eFlw1uG+PG3MIQwQCxeQEKQpFdJ546yMhE
 WvH/HmQaoEubxthlB4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91870-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C43DBF0595
X-Rspamd-Action: no action

RDP433 can have NAND or eMMC based on a board level rework. Since the
same GPIOS are used for both the interfaces, only one of them can be
used. Add a new DTS file to disable NAND and enable eMMC.

v5: Cleanup the enable/disable of NAND/eMMC between the common and
    board specific DT files.
    Add regulator info

v4: Move sdhc properties to SoC dtsi.
    Disable nand in ipq9574-rdp433-emmc.dts
    https://lore.kernel.org/linux-arm-msm/20260202073322.259534-1-varadarajan.narayanan@oss.qualcomm.com/

v3: Disable nand in ipq9574-rdp-common.dtsi and enable it where
    required.
    Add r-b tags
    https://lore.kernel.org/r/20260129062825.666457-1-varadarajan.narayanan@oss.qualcomm.com

v2: Create two separate DTS files for the NAND and eMMC variants as
    suggested in the review.
    https://lore.kernel.org/linux-arm-msm/20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com/

v1: https://lore.kernel.org/linux-arm-msm/20260102104638.3802715-1-varadarajan.narayanan@oss.qualcomm.com/

Varadarajan Narayanan (4):
  arm64: dts: qcom: ipq9574: Add details for eMMC
  arm64: dts: qcom: ipq9574-rdp433: Reorganize DTS to introduce eMMC
    support
  dt-bindings: arm: qcom: Add IPQ9574 AL02-c7 eMMC variant
  arm64: dts: qcom: ipq9574: Enable eMMC variant

 .../devicetree/bindings/arm/qcom.yaml         |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   4 +-
 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     |  48 ++++++-
 .../boot/dts/qcom/ipq9574-rdp418-emmc.dts     |  20 +++
 arch/arm64/boot/dts/qcom/ipq9574-rdp418.dts   |  44 +------
 .../boot/dts/qcom/ipq9574-rdp433-common.dtsi  | 121 ++++++++++++++++++
 .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     |  20 +++
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   | 114 +----------------
 arch/arm64/boot/dts/qcom/ipq9574-rdp449.dts   |   4 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp453.dts   |   4 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts   |   4 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   9 ++
 12 files changed, 235 insertions(+), 159 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp418-emmc.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts


base-commit: 5fd0a1df5d05ad066e5618ccdd3d0fa6cb686c27
-- 
2.34.1


