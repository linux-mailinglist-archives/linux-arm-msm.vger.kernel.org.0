Return-Path: <linux-arm-msm+bounces-107041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHU6LhvFAmp7wQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:13:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 480BC51AC4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96046301AA87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706734779B2;
	Tue, 12 May 2026 06:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjVt9612";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3fwOnIp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01A44DB551
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566419; cv=none; b=MJ3kNCLx/cGFIjAw9WvW3/fEi7h/UUKJGuimN6r3Qt+vpf9LF1Da/xDkxZBXvRAu8itXVHtWdfs1HAHdVAto8IASFEWnWW0WohhGiBxBRYBBETA90rvocpEvA3433+li/Hwaf4AwKe2+aOsFCfwECC0cX0j/5gSshh+wAdqq7Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566419; c=relaxed/simple;
	bh=TyvIvNFT+CvopkY3GIXo2HJiH8nquYeN4rxT+/Zw/aE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DB/zDXAylZDwEjUmD5/FUWbouWrF2vEVR2n5ccGgsLjNwNLHoZ9eQ6yQY6/hHsmYjLR0+MwXow1209CumMgyVAB9qftx4gMXsF9oILvT6N9oJxVk2oLo5dA62VmasuAetKBBGWo+K90NnpshKnNeoHcANAfgAoNMOtbZNxkT/4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjVt9612; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3fwOnIp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4pFLw2519168
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IpoQWTuq0pCUojlwtQJQ/ytOD4k0BhTtMwmEYgzCGto=; b=KjVt9612g66u07ty
	klEjeh04BO2/hkslJXOokYx9rPtT/Ax1L8xAYwedBTONUpdjhuVJi+k21+D/PBhd
	0wMPWRlEJBK2l7BeST7juGBVhrLCabGJVR02Ev8zoiCc+0KHEKdhMT2FYOQbpNja
	pYH0mtXgb9QgTDG5BOKMAjcuL37LKDkiAOntw6XV7ct0wQE6QvKq16oz/NjzUA4k
	A35bPyAkOnLb/Fhb0RY/uaC/0LvOTVTju8tGjMPfSBgfFaTYIqJrzjE6wvKwoKEj
	AOwHVE/ncFrQ9lY5Frd9bw/DZ874fnNJ76/LfNnkw9Ipk6F61eRCLmpS9xyzH1gU
	fQKeFA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1hset-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:13:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365bba50e82so4983021a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 23:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778566407; x=1779171207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpoQWTuq0pCUojlwtQJQ/ytOD4k0BhTtMwmEYgzCGto=;
        b=W3fwOnIpyhj2TbxeezS88ZBSSUkcAVY5SucDc3w1/f9kLiSztIoZCQ8yoAUme9JAX5
         0NZNk0jHEqvw/A9xlm54Eq97xAE7oBQPk73z6Tz5cBV2i86dEaYb5B/dl2QGAvvnd+c0
         kFQt1/t6A+MJGIpawkT+SVM9hiYoVnLqx1DuCCSRJHEju44UBGBc7lLg3j2eckqLBq01
         yKfOwVQRQToekAYHCmVIP2PH6CdGKeD+DWw1YQj74mnAO0F/PRprBZ31CtiHGD5bqTov
         KTPoJ5xUzWN0AhoiEZ3BorIVeLlPAasZ8szYMIBEiBAEoGyAX7bjM0Xf7wOdR75GPDMr
         KURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778566407; x=1779171207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IpoQWTuq0pCUojlwtQJQ/ytOD4k0BhTtMwmEYgzCGto=;
        b=FEbiWpj7PcRV4NWkDIlZkAlX3qe7CuDfN7YEDZXeDGWVqBNZkme1r7lrn26m8nG+FJ
         lOIVSOZnQCrm+7b4dvXAeWZVs+A3CwVZ2eGYd9CL5yyc2u7urvpV1VlYPLXeo52iUenk
         fTDOKIFhgyaQ/iRQCz7/OdNPDnb0ZEaJbD33apLt+rvHVfWgUW5WZwmOx6S1+jirZ/hE
         tmEMecgZD2+ZMeeMeTImMvOA1iDVZMpiKwbSNLc60OzDQf2/g3k8IWD1seT7BIp8ikYG
         xs443ISI0t68An1Mo1OFh//IcTQt8b/8hqkzNw1OZ0KQcypyO/zeKZ0ruwrwtT4dwnzR
         M8pg==
X-Forwarded-Encrypted: i=1; AFNElJ/WUST/vMJoRRqbmEx0bKGUExNx1Huvzw1HPeg/e3tbG6KmNl/F5F+LOqi6V69ABWB3uQdf/yynzvzt+Ljj@vger.kernel.org
X-Gm-Message-State: AOJu0YzFMFjB6MabEknQMIu8i0kICi47z81nbZAQlfzCZYOFHurUU+bG
	PodhMgLtYk19cNZUdZdUYvrMt8Ga+NBGtUWr6KqsWSfOWoCfvocOcX8n79K7Npx+wGjax4++/DX
	af1tDyYP3FJ0zCXuCii1lhBylhtwmp0R+Gd2G9LVJF/dAgGWmiZljnr1i0ILD+60cE6fF
X-Gm-Gg: Acq92OFz5wis0RiItFkFZJNzDBi8exXuCAB/ypIYZiHBaHm9LplXtI2evgqkaknhx0M
	F+v5ARz2JoyN6K2nP638hfOKazkqpAWUBvA52QeZdHobkjmRTxrSGYMGO2WwccqBaLNv8awTjZp
	9bQYqubO7thKmdqHxGFWrvv1yBapOJaduTZVUfFkWFXWsc7dqm0cvEmF8aOk+MqIpRoXWb06jxi
	9SFBideyR5bRWkwcqOSc2JQfEKMbiiRq5gqHzdYzzbdPY9obir6/PYUnOmNw6Mwt7PNcLV39oLO
	z+mf4YLUKjrl87ZL1Fep7XMQSx5127nxp5+i8shZlGEE1jv5ny2SXkId7/49jNfX5pvdF62QWnh
	JbChBAoVgSvp2mTtfss5N6C35NKn2cdhVcqcSDTa8auRbcmDzbRAVXMI=
X-Received: by 2002:a17:90b:1cc4:b0:368:b4a5:c4dd with SMTP id 98e67ed59e1d1-368b4a5c615mr1966396a91.2.1778566406669;
        Mon, 11 May 2026 23:13:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc4:b0:368:b4a5:c4dd with SMTP id 98e67ed59e1d1-368b4a5c615mr1966342a91.2.1778566406104;
        Mon, 11 May 2026 23:13:26 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368b00d2131sm842518a91.1.2026.05.11.23.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:13:25 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:42:53 +0530
Subject: [PATCH v2 2/2] spi: qcom-geni: Add trace events for Qualcomm GENI
 SPI driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-add-tracepoints-for-qcom-geni-spi-v2-2-3b184068ecf9@oss.qualcomm.com>
References: <20260512-add-tracepoints-for-qcom-geni-spi-v2-0-3b184068ecf9@oss.qualcomm.com>
In-Reply-To: <20260512-add-tracepoints-for-qcom-geni-spi-v2-0-3b184068ecf9@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778566392; l=3916;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=TyvIvNFT+CvopkY3GIXo2HJiH8nquYeN4rxT+/Zw/aE=;
 b=iV92GtYb71Z6+FDs2w5XX5o/tN0LMR/wMDMF7MRIpaGSUeKEeiSc+rZj6FLZUmpktYCaobjDu
 bTpvDoheAcxAk/KHaMsFpghjdxKap4H+4CvwDlojaCzNE1QzOFrZHq4
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: 6A5gMXosvf5lN0eZmR8xL_OJIgNAoYou
X-Proofpoint-ORIG-GUID: 6A5gMXosvf5lN0eZmR8xL_OJIgNAoYou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA1OCBTYWx0ZWRfX2R8RVe9GeGgK
 7cZtqU1UKwCib5pFK9Mo5nAKAAZyhr5e5STG6EiXi9IFSI7GF5oxxHGdTNVKTxbfTS745ibyq4Z
 IV3Joux/FBMHmKZ37g+z1fh4uCCbyOxQpjs+RX37CYWdcngh9Z55SjI62FulNqWEjnLL9UYG0zA
 TpUEUJdyQQNsThSgJHN72N4oEUDDQ62JhM/nKkOLW4S33qYeCVitLB/9xzXW7EmpcrTeHnPqTw4
 8zIv0lXnaCB+OHfDKllHr5Vgw2CfWmhpAu03Ib2wSWObzLmP4JhuWxy2tGQstg6jW1/kVX3MPk5
 c3NnMAhrLCT+jgPQkCMOqw8syvLtyVPsEyUZ72qGpSK2CxbB08cSpDVbeWVBbAnX1xKW7ubEZPu
 AKgiXhKT5am0waulnkgsIBCPjbAuPcG0Svj44rdBGITbHjuc3J7s4i7ieDgp/vjUeh1Wm5ovNlr
 sg4m1UQYvPA6c2dYbtw==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a02c507 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NVsub6H0E-3clS5m2s8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120058
X-Rspamd-Queue-Id: 480BC51AC4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107041-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add tracepoints to the Qualcomm GENI (Generic Interface) SPI driver.
These trace events enable runtime debugging and performance analysis
of SPI operations.

The trace events capture SPI clock configuration, FIFO parameters,
transfer details, interrupt status.

Usage examples:

Enable all SPI traces:
  echo 1 > /sys/kernel/tracing/events/spi/enable
  echo 1 > /sys/kernel/debug/tracing/events/qcom_geni_spi/enable
  cat /sys/kernel/debug/tracing/trace_pipe

Example trace output:

1003.956560: spi_message_submit: spi16.0 000000001b20b93c
1003.956642: spi_controller_busy: spi16
1003.956643: spi_message_start: spi16.0 000000001b20b93c
1003.956646: geni_spi_fifo_params: 888000.spi: cs=0 mode=0x00000020
     mode_changed=0x00000007 cs_changed=0
1003.956647: spi_set_cs: spi16.0 activate
1003.956648: spi_transfer_start: spi16.0 00000000ea1cf8b6 len=16
     tx=[4c-80-e4-ca-68-4d-95-aa-ee-99-ae-d7-69-e9-5f-39]
rx=[00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00]
1003.956653: geni_spi_clk_cfg: 888000.spi: req_hz=20000000
     sclk_hz=100000000 clk_idx=5 clk_div=5 bpw=8
1003.956691: geni_spi_transfer: 888000.spi: len=16 m_cmd=0x00000003
1003.956708: geni_spi_irq: 888000.spi: m_irq=0x08000081
     dma_tx=0x00000000 dma_rx=0x00000000
1003.956717: spi_transfer_stop: spi16.0 00000000ea1cf8b6 len=16
     tx=[4c-80-e4-ca-68-4d-95-aa-ee-99-ae-d7-69-e9-5f-39]
rx=[4c-80-e4-ca-68-4d-95-aa-ee-99-ae-d7-69-e9-5f-39]
1003.956717: spi_set_cs: spi16.0 deactivate
1003.956718: spi_message_done: spi16.0 000000001b20b93c len=16/16

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
- Removed tx/rx data capture since spi core had already support.
- Updated commit text.
---
 drivers/spi/spi-geni-qcom.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index d5fb0edc8e0c..164c6c0b9544 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/qcom_geni_spi.h>
+
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
@@ -332,6 +335,9 @@ static int geni_spi_set_clock_and_bw(struct spi_geni_master *mas,
 	writel(clk_sel, se->base + SE_GENI_CLK_SEL);
 	writel(m_clk_cfg, se->base + GENI_SER_M_CLK_CFG);
 
+	trace_geni_spi_clk_cfg(mas->dev, clk_hz, mas->cur_sclk_hz, idx, div,
+			       mas->cur_bits_per_word);
+
 	/* Set BW quota for CPU as driver supports FIFO mode only. */
 	se->icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(mas->cur_speed_hz);
 	ret = geni_icc_set_bw(se);
@@ -366,6 +372,9 @@ static int setup_fifo_params(struct spi_device *spi_slv,
 	if ((mode_changed & SPI_CS_HIGH) || (cs_changed && (spi_slv->mode & SPI_CS_HIGH)))
 		writel((spi_slv->mode & SPI_CS_HIGH) ? BIT(chipselect) : 0, se->base + SE_SPI_DEMUX_OUTPUT_INV);
 
+	trace_geni_spi_fifo_params(mas->dev, chipselect, spi_slv->mode,
+				   mode_changed, cs_changed);
+
 	return 0;
 }
 
@@ -861,6 +870,8 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 	spin_lock_irq(&mas->lock);
 	geni_se_setup_m_cmd(se, m_cmd, m_params);
 
+	trace_geni_spi_transfer(mas->dev, len, m_cmd);
+
 	if (mas->cur_xfer_mode == GENI_SE_DMA) {
 		if (m_cmd & SPI_RX_ONLY)
 			geni_se_rx_init_dma(se, sg_dma_address(xfer->rx_sg.sgl),
@@ -915,6 +926,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 	if (!m_irq && !dma_tx_status && !dma_rx_status)
 		return IRQ_NONE;
 
+	trace_geni_spi_irq(mas->dev, m_irq, dma_tx_status, dma_rx_status);
+
 	if (m_irq & (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |
 		     M_RX_FIFO_RD_ERR_EN | M_RX_FIFO_WR_ERR_EN |
 		     M_TX_FIFO_RD_ERR_EN | M_TX_FIFO_WR_ERR_EN))

-- 
2.34.1


