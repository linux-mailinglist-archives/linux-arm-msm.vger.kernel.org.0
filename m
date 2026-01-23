Return-Path: <linux-arm-msm+bounces-90338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EACkBeNic2luvQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:00:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B52B7579B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 13:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA5DA3004436
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF0E318BA9;
	Fri, 23 Jan 2026 12:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7Z2mqN7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtIOnMBR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DC73594A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769169628; cv=none; b=YSOa6d9A1p17QGbpF+GmqA6CZQouRcb7jGPrlkaZASN3x0OhS0F/vmV/xi7WzsZRI61d8UX7q3QyCB5GkzKp6UMbRlbJ6BNhra6fNUjC6kY6TxFLV5EcXFNCaX96XZ5LcFQprvU09ShXY29hW8Y6faA2NEGC6UAtbNRMgbSqAjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769169628; c=relaxed/simple;
	bh=Cyxv9JDzJw/kX1hwe67Ou6eUSK6z7WRdJoOXgot6LzU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CVY58Z9tFvOkU3PDYIdL1g6byGWUNhgHlA0OBND8mZbga0IvVgBlizq9+e2NiokuKj2LlaoqnvnQOqe6BDZeRw5XXuzIlwUxNvjWlP1bcCp3x2Uk5Ezfp0wr9pFkSXcOpBNjlcJIZ9AX4OfhMT04t+kbWyQfH8xy3bmK39u1PlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7Z2mqN7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtIOnMBR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NBdhEi3677889
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GfmjtM+jZLD6fy6BMd4n1QM7WjWxRu+ljhb
	BzwoUgMs=; b=R7Z2mqN7nUZB/58JIDS6r7u+7hYXMWC8VxoTL0qOac87lF7w2Au
	nbigDLK+8fOWBETzHuySDRGKk40JcN5uXxXjKmuhsQS96GUd0BCgUY2bhp9SmmPM
	ctnyO0U27bb767DeaqIhbVxXih7q4uKlPmaDTogHGSZKUvXJrtCiGTAYz4PxTSl7
	YNjQlyByRX9f2+IT4G6GFkxVxQqYkx5JMcBEYpfDnQj1KA1n5APbp9FEsQesL2i/
	ybm0q8S4HCtE528rcp0Q+weMJtefVtmWv7NbSfnZJVGhrrfB9mm+f2ZFPGwHMmUn
	f49gLGN6E7VSMPeZBm6iQBN+On5RmO7qwtA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp3get-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 12:00:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34ac819b2f2so1908480a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 04:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769169625; x=1769774425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GfmjtM+jZLD6fy6BMd4n1QM7WjWxRu+ljhbBzwoUgMs=;
        b=AtIOnMBRg8QoSqbG54xg03HhTNKqrq9e1wRucFWFljgyAK7/vuvfb9Vk60G7YM4pzM
         7uGOpxwDCnbwlNY4nexNmnZu34KFxmBXQHbKbCBQGzEJ5k8LeGVsK6+03jws2y9hNsnO
         s9fa6H2ETPoc3UypfSk3mHNrH8RwX+YmgJm9WQbt4asqIzE2PCuNzodRTcUBGjMgOXx/
         Vh/3Q2EZtPc99mI+AtUu3LpxiDOFVD64njqE6SRqzart+IROQqnoADg3jOqixJ8yvLh/
         dRV1AE1xqQZIHnezy88qFGdjtJO5Xoxq3m+o0+xFfeGfW5iokb0j4DMSpsEy3KOXwr/f
         02cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769169625; x=1769774425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfmjtM+jZLD6fy6BMd4n1QM7WjWxRu+ljhbBzwoUgMs=;
        b=tXWfMO2So/JgMwDGQMqY4QUQuXYHyLk5f3bf29WZLyxMktNLzaeb0p/R+gQXtauts+
         XdiYLzqAYKnB/RJK0RlyRzYplD0csy9SnQC8u1hJxmlowr9OWD49bRk2x0JDqSqtHXqt
         PT3Zdtc7B97sw/Xyw/7troPPFSB03S5FACzYzqYSgmqGEXkadiMdlFcbX/esiafLi9vb
         IW7BUUHxY+qsV+22B072zAl9V5QUeBj2P7SzroZSEfiFXdYs96dSaHbN8Awbvdwl9wnY
         hHpIyZh6nOV3OZojMQx/QaxJTHYhWOlGpAPC9lfCJ/2ED8QqduCnaxnoedTa13K5PGiB
         PViQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXNcJm0CRiO4bL5giUo6FnYobRXfGpykPJR2KE3dyv/dHfZf7bal8ytFDK1culVW7UbbJxZhmyAqndRoFl@vger.kernel.org
X-Gm-Message-State: AOJu0YyerLl4HPzfeYRofd478IsjiEd72I/M1uSTLAzByC8vV70yRRN8
	UVMwzB4tFt6gd91UXBuI8IRKbJEcQm3kNVqDz5i9PdTBcB5tUWkRSJ08yYL/OZIIOApHFA/GQo1
	k8Vgl58oTNz66X+ivz5AdHy4dvMLAksa9/z79yQXsVtqO24HO1dUh/tCTTSJHIfwauzS/
X-Gm-Gg: AZuq6aL6aO9PCRuH8IV5zC/KIxs+i6z6lg54+/lNTgX9pWF8xvHvntuW4oV2OFm8Fmy
	i8d5Q3bkIb2PMRFS7bg1ASySxGzq14ZKutwVGcw+PA7H/sk0aEltAtmKghc3cN3NVOwYWPnXDXH
	9XitxCv7LqdnMuBhV2uv6e9E6aFo/W9NGE1OW58rpA80t08ZfELtEzPMyoKbu6eCaT+hn8F+XIU
	KVwPVLutIG5bS7LXieGkORtAYPJ835wawT90YdljdWZelIWwD+nLxaBXdzDeJhI8uaObsOjJ2k8
	b4dIht8+mUB2TesZd/RSgBgtvziAvVzJcNwIvNl721gNhq7R1/pvxb3ABq0JiTSLXP6GP7Lf68a
	VSljBSfYOrUurl6EBJSFiO0UylRwNJ/aADinXfi36bs8/EQ0A/DLzesZehgavIU9qav1yXG7rAt
	ZpGNfjaRO9m5SS2+0JVpdhea+y5ro3tUUf7dkpsGc=
X-Received: by 2002:a17:90b:3505:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-353673232e2mr2335545a91.14.1769169624640;
        Fri, 23 Jan 2026 04:00:24 -0800 (PST)
X-Received: by 2002:a17:90b:3505:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-353673232e2mr2335490a91.14.1769169624012;
        Fri, 23 Jan 2026 04:00:24 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dce0ccsm19047295ad.32.2026.01.23.04.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:00:23 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Enable IPQ9574 RDP433 eMMC variant
Date: Fri, 23 Jan 2026 17:30:12 +0530
Message-Id: <20260123120016.3671812-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=697362d9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zHM_zA06m7IaqDc3cacA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: rRF9DBfIleznShpuAcCqbsitCQnpDyVS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA5OCBTYWx0ZWRfX2BTnKlpjn2Bu
 sNVFmlwAX0dzdgy7W+kekPzULVhnqs6EZVhdmaSyQBhSdYm2UB+6IBT0Nn61892oU4N6Ju70mM/
 sa20qpawoUWB1PoWLSKPjgdkFlmryjNEqguB73jt8a1Y3frlcspqHv1RxDOIMo4xdlsqVC2BGko
 OtpsmfxGtYEgxN2X4EEwcVFXp4eak/7feKiGcH3YMAbq3s50rssZjvg8w1SlyvOHkzmq4KtNHKN
 cvR5AWdSz4Tl+11Udi8ejkzTZDITcvZhQgzCC9iMN4iJAcOTWIXsk0y1//1f8M11KtgIBXz2oYc
 mXrGwkyiIz9tDTlQpTiTi/yTiIM9lq10eH7ytLz8ncMoPbbEdeQWgccBfPbYqewJpND5kAzLD3j
 FIoLzcc2b4hD3gXEpMvVRis3R67nx/CcFAFWGI/WqXYp4fKf6keQULPS03qx61nMeq1KZhqCJFJ
 W4mOtUPPvCWGTC0NClg==
X-Proofpoint-GUID: rRF9DBfIleznShpuAcCqbsitCQnpDyVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90338-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B52B7579B
X-Rspamd-Action: no action

RDP433 can have NAND or eMMC based on a board level rework. Since the
same GPIOS are used for both the interfaces, only one of them can be
used. Add a new DTS file to disable NAND and enable eMMC.

v2: Create two separate DTS files for the NAND and eMMC variants as
    suggested in the review.

v1: https://lore.kernel.org/linux-arm-msm/20260102104638.3802715-1-varadarajan.narayanan@oss.qualcomm.com/

Varadarajan Narayanan (4):
  arm64: dts: qcom: ipq9574: Add gpio details for eMMC
  arm64: dts: qcom: ipq9574-rdp433: Reorganize DTS to introduce eMMC
    support
  dt-bindings: arm: qcom: Add IPQ9574 AL02-c7 eMMC variant
  arm64: dts: qcom: ipq9574: Enable eMMC variant

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   2 +-
 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     |  32 +++++
 .../boot/dts/qcom/ipq9574-rdp433-common.dtsi  | 121 ++++++++++++++++++
 .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     |  32 +++++
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts   | 116 +----------------
 6 files changed, 188 insertions(+), 116 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts


base-commit: c072629f05d7bca1148ab17690d7922a31423984
-- 
2.34.1


