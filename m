Return-Path: <linux-arm-msm+bounces-97955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCjtA78FuGlpYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:29:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 911B729A5E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9C4E3074BDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD49396B67;
	Mon, 16 Mar 2026 13:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dge2AQAK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCjKkmAT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDF539659F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667202; cv=none; b=a6ZUGgLrgn1tZFCwPvBdD8gY5YZKu/YfOQkvGaURK25dXjijzk6msmVytlX+9MRD8JILL8vVwRfsH2yDjrZ4VUFeq16yWi/5LIGtIpsh+uaG1b1aD+W3mdxbnSQMaMlJbZKc368ToGwdP9cZPxOIHLwUY0eL3/GaU8dWV9D/XQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667202; c=relaxed/simple;
	bh=QlyRtyj6riE8FuflIvfBiM4ASu5Sv7E5TNQKsnxXv80=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=tvIRILvTrxmFj/0ORfAGFq+cHfhmA/ENyGSNMMmMuReBkgUocqNY2pyePGQBUCPUEaPJjaO6fUGEFHqnfHJDDr7Ptgh7MssCMQ7/QpVrSZj19E6rCZRo6J10gwuGzvxxushoIF8Gl7knuabdc4k++/nuqUbv9cjMydiYAuZaYsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dge2AQAK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCjKkmAT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBiAEl2128555
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7SGS5jQKh5vFco8jAnNdL8
	iZz9tDRrOLuUjo/nn5l2Y=; b=dge2AQAKPfXtrrGa1DhDkKG1atwaUlv1wCxMnh
	pZfX4RIcW0Awv9rrObrEi/3sgtlVsus/TqvDGX0hzzykXJfG8vRso8Z1VBvAYKEt
	QABcYA3cMuESMVSGkU55YnF7Nombpr8xkjtPdXV5eQdwFo7nxO49UafRh0GLFbhG
	vC3Q9txyhbWWQBzg1QAcAERc8fmcnumy0vxOqCwTEBVeMj9Bvq1IHEkr+Wu08a2+
	mS+YHiLUkRIScdlvMoxeiZrMfxUP81Qj5lxXx1p4pr1ZZxOKy4XhIDXkdAV2gQsi
	nD1QJyVOIvsv8Rt4ticdCW5zaVCSedx8wJC0D7NTKZtEcZ/w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00ap176-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:20:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a032cdd78so22736517a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 06:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773667199; x=1774271999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SGS5jQKh5vFco8jAnNdL8iZz9tDRrOLuUjo/nn5l2Y=;
        b=UCjKkmATJtdUSnhddY6ROYWbHNiLGftPLCKRVz2510E8Y4QKY+zsN/CSKLspB07P+p
         Ikxi5ZIj4zA9mory1dod81Bz8KL0Eq6eC6CKPqjO2Kk1Yy4V8YBVerisgJGroMXh0Uc3
         YAjQbTfAk1JOfLXrBOOv8NJO+A+hnb4545eaam4ycXoBhjhA8ma3aa48+gY6mMYcqWVX
         4rS24r/GCJAvOnY5Dhe5khSkS0BhBf6J1KVzAKciTx4Bf4Ftug25q4XcEFpiu9wDe/22
         abXuXMUCUX9vdCgTPhSKIzPf/RU/3pNuNacJgOnlEMNmlx1w48KwHm3C+L4OVgf3wkMf
         Ae5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667199; x=1774271999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SGS5jQKh5vFco8jAnNdL8iZz9tDRrOLuUjo/nn5l2Y=;
        b=OeIHcUWTUrSw0RdXQXcIIwyEs9hishYIUZvSJthTUDdwApzFATRdSlLMnQ3Sy/OVnS
         EHE7G7w/E5ujOkCDa/Iky9bXrLvVJIRg4Ff2vzfitVwYjphaQFUXpxm683u5H/vn1RCc
         xGCITjYzgNStxs71UixI3bAUjVajoSNw3/zZP3xZruaQVI9eXv4nyDeBmm/8mUzvKuis
         4NdySzB+oKEdL7oF6CGjeno39YrY2RVjIQ/YTGgOJ5SgggV3YSmDJAfvm1NGlfBHgSfE
         Fh41HgTPmTTTcNc9lLRthPdSFCYdAiBXFY/GjrQYro8vvbRHydfUATIUkuVd4TgCPYOi
         7bTw==
X-Forwarded-Encrypted: i=1; AJvYcCXZF1SmiR+VnUPWMmhg90ru1zo034EkTT/+XBcXrCeQzgQEeiwWij1+0qpdtF3jQsMDv/quZhGkElKv4f/b@vger.kernel.org
X-Gm-Message-State: AOJu0YwOc/tXpwR3etLtKPmm257UaIZgneiYbK5bhIX1OTURm+D+JQhT
	+fktu+vyZrS5RiS8w/WPoaB/S1yiWbKr9YFSTLdMU4T7cRLUCvqAOi6S31LKInjz3FaivjmYZo2
	HziTchaTFTm2LeJcA3VQXU9zs6Vho/4iDvDwMwRrXAeLvnO2b9d09iBrXNGreMXuTvH85
X-Gm-Gg: ATEYQzwqKY18oAGsEZ+GylsmtAv9L+TBHXzTHsX7mNxiK/TM4HxOLkvsABr8lBq+im+
	MHeAOhXkFEE80KwReKJqrSC/eQnEnSt6NqkJRZBS5PTD7BRWG1LK3/76t8VTMhF9XVqWs9VtJYm
	UGoQj9h8MlZUWJ1M0Z2dOqTed6kt+ury9DJWJmQyaRiHZyI+5RGGgNhayzj/KU5sZL8VcwS335/
	5lZY1J9H4qfLH3BVieF/3Od0G3HWXEObp52j8uQoJ+rBaFHLq8lMKSKcrm4BoHprRR5B4XjWn2s
	0eZCgGtxHPpRQgznzS2Lh9O8vqgOoTe4HHkb+7+ryNj+OPTkDJn8FoqBGDkQH+cB9hB18haX4I+
	W1IMvxaAKfivISDdlYI1tUSTvdIios1+3cyCSheWeDUPJkNJcLLQGQe215g==
X-Received: by 2002:a17:90b:5306:b0:359:ff8a:ee4f with SMTP id 98e67ed59e1d1-35a21e2fcedmr12435834a91.7.1773667199476;
        Mon, 16 Mar 2026 06:19:59 -0700 (PDT)
X-Received: by 2002:a17:90b:5306:b0:359:ff8a:ee4f with SMTP id 98e67ed59e1d1-35a21e2fcedmr12435811a91.7.1773667199067;
        Mon, 16 Mar 2026 06:19:59 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b9303eb9bsm5209648a91.8.2026.03.16.06.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:19:58 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v2 0/3] can: mcp251xfd: add XSTBYEN transceiver standby control
Date: Mon, 16 Mar 2026 18:49:47 +0530
Message-Id: <20260316131950.859748-1-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JYwB6JjrZ3UdkG1cTRckIpEMz26VJURA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwMSBTYWx0ZWRfX0HsVLiKZcJLB
 1cpz8ADwzcI/phz+E8aDPL2BC6lrNk2S8pgLk29QMXKyQz0bt/v1Y+Nx6CVL61EBcog+TRBFIyB
 0SOlfEMi2707hUV+bdkeUNic1cG78HYgGAGjdN3zKck400eNgWrfuJMYgq8kxge4EgcyQJ/ocv3
 7SkE0UCX5G+n+IC1tIt1XsyN1xEplYuTXTnpK+wzkPgdf3OYvS3nLPaiYeOg04yhzpLwNFJ+w60
 Yw84v6AyEH33X8IhsLPhr5UyxByUk5umi+HZxjcmdoi4J5dFT3xLUCLFoj3xTVqB9MyZbY2pEyO
 SleFPM5at90Q9Mk1rAIq7rcOY0kHeifEoaTlgDAAa8vowv9rQBgxE1ooQLCPJbRtaAO0oTaFUmz
 NIoAXBMqgnt6QQSh9LoPZw8RHnNvI/YOUtj5SGsx/yVo7L9DYPbfJuQmI5TdDWugQ/M3LR+znbf
 G1bX0AACM20l37z42lA==
X-Proofpoint-ORIG-GUID: JYwB6JjrZ3UdkG1cTRckIpEMz26VJURA
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b80380 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BLoY-fwtqX9uGLcRELsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160101
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97955-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 911B729A5E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for the MCP251xFD's dedicated transceiver standby
control function via the XSTBYEN bit, and enables it on the QCS6490 RB3
Gen2 board.

The MCP251xFD has a hardware-managed transceiver standby control on the
INT0/GPIO0/XSTBY pin. When XSTBYEN is enabled, the hardware automatically
drives the pin low when the controller is active and high when it enters
Sleep mode, providing automatic standby control of an external CAN
transceiver without software intervention.

Testing was performed on the QCS6490 RB3 Gen2 board with a PCAN-USB FD
adapter, confirming that:
- The transceiver is active (pin LOW) when the controller is in
  normal mode
- CAN communication works correctly
- The pin is automatically managed on sleep/wake transitions

---
v1 -> v2:

- Drop the gpio-hog approach as suggested by Dmitry.
- Enable hardware‑managed transceiver standby control via the appropriate
  Device Tree property.

v1 Link: https://lore.kernel.org/all/20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com/
---

Viken Dadhaniya (3):
  dt-bindings: can: mcp251xfd: add microchip,xstbyen property
  can: mcp251xfd: add support for XSTBYEN transceiver standby control
  arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus controller

 .../bindings/net/can/microchip,mcp251xfd.yaml |  8 +++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 22 ++++++++++++++
 .../net/can/spi/mcp251xfd/mcp251xfd-core.c    | 30 +++++++++++++++++++
 drivers/net/can/spi/mcp251xfd/mcp251xfd.h     |  1 +
 4 files changed, 61 insertions(+)

-- 
2.34.1


