Return-Path: <linux-arm-msm+bounces-106285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CSnHI5J/GmBNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:13:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB1A4E4940
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE58A3038C6F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227F6331A63;
	Thu,  7 May 2026 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFKHcWcH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTmZbURx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2D331E841
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778141258; cv=none; b=c+FayB0m55IPhetL9t+0dgH5yy1PId8TuN9Qoh2RfbArtvlKzVikOOTMbVgGXFPRk1jrMvwY6MRWwgP5+xpzvo8qEKOWqCCHtawnnU9vjWEUWZTmx5fT0qmA1a8HfD8bmUDjsrixkZ+pV36rLQrjV5/XVCX3zrsV3LN+s4dQQQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778141258; c=relaxed/simple;
	bh=J1mk/MVYikqL1goeDLu3PDJE4r9vtU0OZH36MxqS8Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qvecToh4SL5KJ4R3q5Sdg21BVNjl3qlYFWiVXq4ojXEhl8NkbE6v7znUzY1IG+7LCPTlG4pc4EtXGRYa0rVwFy+RKOgl0G/jeHNP+anqd+2NlUEJNoSQ0A38F2xBZYYJ0sdSoSa0xngBa471SKAXS3QTuSdy+qtqbnR0AR98dy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFKHcWcH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTmZbURx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6472LEoN3463995
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 08:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bnjc0dzixx246uAsmR6BX8KvTfzjFEN0yFm
	FFgSNkKM=; b=MFKHcWcHNhq9GBSdJvuif++FWiNKUjWqEeh9DKByPsIC+tB5WYk
	ptH+LrZpq1lggXJXi9nZmlwR3m8bTuYW3eUXbc/aoVuJ09mC23+2n7Ko5ddXx4Yk
	XzQo9dyZoyvy764iLpbw61FD00AmUmGpaPrYFyNap5orR1RUwf2dBjroOdWaAmc3
	a+fB1I7QjaOgM8Qej0DPENwuF7P4Dp1Iilw6ic+E1vgJxaNz8e8foINhx+aEeM5F
	QNRAG+8I4xhZ3dKb90/J5eBXJk7FCB4CiaXOuVl38ZdTxmvqGDZ+WmyPLRVgyWys
	REAjn4/bT/LKy6CThXfxu1JVzWIi8bG+Mmw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0hvn13uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:07:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36629e48023so53627a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778141255; x=1778746055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bnjc0dzixx246uAsmR6BX8KvTfzjFEN0yFmFFgSNkKM=;
        b=OTmZbURxYZM9/0pVsfhRhHgAdesF0lRcZAjTF55FqfpDddDAlH66kqLM1gLdvDD4Ki
         e1jgpdKfxyxfnvOTMN8TXgYOUFChmvlTRHAu4+gCnfSU2UrwhKbJjjGKxtUQh8O/nW36
         SzhTjeKb+xIFNR1b1g2r9SxB3StMNHFKfvVQxHQtBzkkf4o0jSXVI6IfYQ68vVAE8TWt
         DLcdGjqhrhn/hQ7/LnSpi7jPdDbh1SYc2uUqIB5L4cFFwvtBngfLu9e5NRz6dmcT8g1H
         Krvi07k8hj0FHi/OHlkrBWMp115m7OuZ8PZLLJEzFhUGLihUOUmVK8rFECHPyYTFoOoZ
         16+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778141255; x=1778746055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnjc0dzixx246uAsmR6BX8KvTfzjFEN0yFmFFgSNkKM=;
        b=CBAIzYl7UgUEwmAosub3++R88GWgbq0W3sRG0Pco0x32JVODZ325+SpnHmK648Nx7c
         FEmTKj+cK5SUGc/K2hNtHM2gc4T6CqPBpAQQacL3Q9orlBmG9awBJHm/yP17QR8Hgnoc
         JKurtQ7Tef8NpdGCrnT7eBACcl4ywCcW0RcOESS4wxinTTyWpFcO+uymV7C6hvMjcvOY
         2LXdyyW5e/Oy/tmeu7lwD0zI8Iokwl2dUiSnrpqIXhJ0NMG7XU0XiASece8Z0fEpx1ME
         kEQu3cEWcJwQW4QwfWHpTjEpEo4FSX21LhmFUibovHDBrRPlwW6GkqYlpIsCi+HYGlu0
         LYKA==
X-Gm-Message-State: AOJu0YxqywGM8ZzQAlrPT8C4NMSqp/g08hamNA+4ytYIRB4ZvMRpaHyZ
	r4GZDt7r4xgQbQZ9ZKWFhlfkE4FYrfzDdnrrQnkwGSpSAwtwAENPMr6YXA80coynXTKQgoUdliv
	RPxOt8foExEy1F4rX1HV4VHbTteGMHcxMfugtQREwsJ329I5YRvA5qUGG3n3/o/1V/gJ3
X-Gm-Gg: AeBDietvCGrObvASSREFc2GK1FPcdfDOG5+VCeCArsjQc081wNyu/Q2DOYACvZnCz/U
	ebhn7Fpc6zc3ERBdHbBPEpIeVZqdXo6W/wTWzGu6R1qZF+VtHQaEt8p4VjMAyuvtOiuk2rD/oNT
	1V4UUMwAdhl/Om3/OScKeUEbdFQRu5JJ/hf8u3HaBSXwdc4kt8Loc6cNTaUIr4B1e6K0B0OeVj0
	fIPASr+Oqrjb/kR8BIaXlyIlsV16g3SfYNy9m0wQLHBELrdEqQBBr04t/qVkQK8dH3mMxmFJQE1
	zEeore26SvI/D+BZIy4o4dCWOf2vBlspB53/0FTzmM85JcrNsyD4zKFNmMn3kF+h3nnpX6KNOuL
	2nwcvtRtmjfP1ZLbVGQlZaPwPNnKsFFNEwoDvfoQuH+Px3dyYEz2Dzp67A6I=
X-Received: by 2002:a17:90b:3a0f:b0:361:472e:3be6 with SMTP id 98e67ed59e1d1-365ac79e167mr6668977a91.26.1778141255321;
        Thu, 07 May 2026 01:07:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3a0f:b0:361:472e:3be6 with SMTP id 98e67ed59e1d1-365ac79e167mr6668916a91.26.1778141254604;
        Thu, 07 May 2026 01:07:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b0560fa8sm1986094a91.1.2026.05.07.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:07:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH 0/4] firmware: qcom: scm: Add minidump SRAM destination support
Date: Thu,  7 May 2026 13:37:16 +0530
Message-ID: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA3OSBTYWx0ZWRfXwSlg5Ui90pMG
 PZTBnHGvL5RikrI/Rkw35tPaeltmwdygh0OqdumNBbyV4LyS7XAL4Ak5zKUoEF5j9buEOGgbOSp
 x8pBqicsDSRt3CYVum8k4P2tzfZbQeopTiAND03S7JILYrcfhNZSxwmYTGOVpLSpq7B8p6pwQd0
 lIJGRWJDRmsb/oELSnkoOpVXKm1vySuPbHecXH24jANQr7LPZkXAy7O4o6ma0DcDs7QyyJgJU0x
 jmbWx+AFp4muagHLnaeSykUmCD0+p2mi8ymccx+3EU8PyD90W90WIHJ6N61CYvv++OGOuN/r94c
 HfzgVFNgUBV041V5KlTiOSrd+XtTWLIlv5mjaloynMAyBjcn0Xtq3oxqDCZuPEP63lPEIruInhw
 m8fKlCEXCEEpM1Abe6PtEbyXK92NeE7UBBovzjafizFMG6qDejsvpUkMZs/9mNyLbDSLTUmFKWy
 6m6gGnMXoyw5UXZioDA==
X-Proofpoint-ORIG-GUID: n1bGn3XtHuvpkXB3MGjN8uigtS2ogHV9
X-Proofpoint-GUID: n1bGn3XtHuvpkXB3MGjN8uigtS2ogHV9
X-Authority-Analysis: v=2.4 cv=ZZ4t8MVA c=1 sm=1 tr=0 ts=69fc4848 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Uf9RHLb8GrDHKnSoJrcA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070079
X-Rspamd-Queue-Id: CDB1A4E4940
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-106285-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
to deliver it (USB upload to a host, or save to local storage).

This series wires that mechanism into the SCM driver:

  - The SRAM word location is described via a 'sram'/'sram-names'
    phandle pair on the SCM DT node, keeping it decoupled from the
    driver and extensible to future SoCs.

  - A 'minidump_dest' module parameter (default: usb) selects the
    destination.  Custom kernel_param_ops expose it as the human-
    readable strings "usb" or "storage".

  - Add the support for Kaanapali.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/lkml/b33938e9-bb5c-4743-866d-4cdccf808a02@oss.qualcomm.com/
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>



Mukesh Ojha (4):
  dt-bindings: firmware: qcom,scm: Add minidump SRAM property
  firmware: qcom: scm: use dev_err_probe() for dload address failure
  firmware: qcom: scm: Add minidump SRAM support
  arm64: dts: qcom: kaanapali: Add minidump SRAM config to SCM node

 .../bindings/firmware/qcom,scm.yaml           | 57 +++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi       |  6 ++
 drivers/firmware/qcom/qcom_scm.c              | 98 ++++++++++++++++++-
 3 files changed, 160 insertions(+), 1 deletion(-)

-- 
2.53.0


