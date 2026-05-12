Return-Path: <linux-arm-msm+bounces-107151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GCVIoFhA2oq5gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:21:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 038D3525B97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 19:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E4793047769
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2082A32BF52;
	Tue, 12 May 2026 17:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SoxZUgwW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XExmD+Vk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2983D9691
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606067; cv=none; b=DGqaTTcxlXu/XRDJSjPfxeBrKN/GWqJ4h0UkE3Kr7r0w4kg5V0PhAPIx5oVqBdnSllJfM0clekwA8vDd2S0eDhLS02HYoTPBPF219eFYnJNo7wmqZOHZT0hvvR5SsGQequ0NfrBurFt+pbTxY4t63tHC4CaFSo5DJp4a3hg4hhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606067; c=relaxed/simple;
	bh=cN4714YKFgE3Cy3MMrWdct7feqTVFb9iQz2fsCrzvwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUnKy3Bud7K2jrghVNjAmc2Fr3YiCcMoap2G5FLI2zA353HrpZMz2/Sn5gFmifvrStNVQk+ICiuZCibQCSM15hawnG7UNUvAeAyxa2B9XZuRJdY8ZPU3NkZ728TyZc2J+ZEiaIbuV8ZyHpXzohslRp8rP1l5KScjYlu34eMGRzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SoxZUgwW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XExmD+Vk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCA4EH144564
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VrjvN4YoXoq6Qx8iD0D8HvuSXAGY4OIP3vppn+Pqo/g=; b=SoxZUgwWU5PZ3/XJ
	dhdbg8AdK7tiX7oCDXkC6Q+CPCkh0+JlCjXzymUNd4n8enaDDHKRV3Izjd97nLHT
	6nNnhWr9otJg83vLoZxI/fpaU0YEY1VvwQ5xl6UGbcMpo1bx+4E4SmB9JW/kI6zg
	4WontDoO6MsFooza7RVVaZiwpvuZnN8pN8EHnYVoMrlUfdFtYOZAC/y76XTgrebn
	tWX46tAHsSwJp+zcfOgL8X1vqpqNUzonrwvySlsyl9pRsVEwWlwvjennP5G5UZU+
	muSp0N/4IxScFeOJca4JqUtFCq1f6d21UjpugpvlwJ+p7tZFy1VRKK8+49KMAPaE
	RsM75A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43yp99f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 17:14:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b7c904d476so63335595ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 10:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778606063; x=1779210863; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrjvN4YoXoq6Qx8iD0D8HvuSXAGY4OIP3vppn+Pqo/g=;
        b=XExmD+VkiPxm/1Yxie5gmHDfLqyzRxrI3z+pb/Bz1JMuEgaFPxK8PoBcfhpbgZ5vXq
         Un9omG32VEtNLbpnaqxEmfVTb1pO5gFvBX8MZceXFNMbMr1p1xt+1huQKJ38hwlJZk5u
         pBEdH5UJNRq5nhu93NNM3eB+fNYrLDXmtW3dJK2/OpGMbeVG7dInHvvLCTn/uOhfzBXZ
         1MqzQ5UrteIo0pciC3IdKsHOq5uru71nkeYF83psV7HrWe4Qge8UcS4v8ojK/Zq9vHDy
         kFBtJc0DDBBCS+is3DCAO7JlNvBGpwC1yJJcOGOU19fLjRzJt0V3SRCVg6n/4BCtGWWC
         bjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778606063; x=1779210863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VrjvN4YoXoq6Qx8iD0D8HvuSXAGY4OIP3vppn+Pqo/g=;
        b=oTUZe4ygJ/QVg2G8Lwn8LkLmja+7dY5IGT1Gj0i16UkRYzypIR7CejzdinnW/5kWaD
         tCqA0gFm2YA3VaWHwR5hkmZhiu1fBAVr1COG+AN9JVHJFWSdwor54MB/A2cdS9F7KKcm
         nGn4ofd6YFkf2yrMvJuOFVuUSI0j+/aYz7tyVGgSwiA9Ok6qchHVNjspolNjAXYObpTJ
         GFeMZ/KEwDweIAz/reg+Wwet3Nyijh4c/abHO3xu8YiYxecTvZoqY+2Mkq/v4vFBsaC0
         jpGVsP0G4vgQrXnq34nozs/ZzG4ls/aY6u7Y5Iy7QAQz1daF6fuNLncRJpO/R+3ZgA9u
         yFUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9X8QLZ6h9liHa3lXqiBPTsU3uZn4Gw12U28jV5MM9TiaOuGesnT0tuHE2I7KUgGyh+CDcR9DFLpE0Aopa8@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/J70YS+J7HPP5y5BwdUoxWGzaWYXY/mlcyZXHrqfVoxEvfZ+
	xZpL27ShjFcVlwD2ZejtrMkZV1V3rAcNycwuDbRKB/viBuhR5B7VyXO/C10poiiuoGKU3B/Wpfm
	kLyLtKEIh/2AaOAR+KM5akdxd4D0AGfMcvr5TEC5y1/nOk3ViWsPOJUVOtrbliaQDX2te
X-Gm-Gg: Acq92OEiNjEUGUqtUfQH2FkpcXdtxSn4S+YT1/8z19fIGfHYecM3hwSoKFUGN4SLOTu
	JDEl/Ylo5SGRKicZMvXAiu4RQ46YVqLKpc4iP0HRvuauHIQBYkLO7zVeYlFahNIHDIV1vTkzhkz
	OwEtuqGC2dkET11sb1fHkl7K1kg5L+IYqlFc/PAxxq+wvpyxIj6vXVgvZV5J7dBHJNU4ZmuG2fy
	e6uAuyFdL7IqVyx36caUrd/rvGG90N593e7oLX8M/yj7aL2+9yJlLVlvgrAbif5S+wrOt0NNtAL
	Ysh6k7QJlZjmmLQc3go+KYNOR+ZXRDvzBEB+9EDWkGAno/W6YbaUU91Sys/pTy4Y3YC3oLi7a38
	1Ye7y9/bl9NnQTEu3ttLbVLwPPWPY0xy3okP0kcTaETsXFYa3am72zFw=
X-Received: by 2002:a17:903:3bc7:b0:2b2:d09c:c07c with SMTP id d9443c01a7336-2bc7ac7305emr157039075ad.36.1778606063386;
        Tue, 12 May 2026 10:14:23 -0700 (PDT)
X-Received: by 2002:a17:903:3bc7:b0:2b2:d09c:c07c with SMTP id d9443c01a7336-2bc7ac7305emr157038725ad.36.1778606062723;
        Tue, 12 May 2026 10:14:22 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm149996685ad.24.2026.05.12.10.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:14:22 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Tue, 12 May 2026 22:44:04 +0530
Subject: [PATCH v2 2/2] serial: qcom-geni: Add tracepoints for Qualcomm
 GENI serial driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-add-tracepoints-for-qcom-geni-serial-v2-2-a5726421b3af@oss.qualcomm.com>
References: <20260512-add-tracepoints-for-qcom-geni-serial-v2-0-a5726421b3af@oss.qualcomm.com>
In-Reply-To: <20260512-add-tracepoints-for-qcom-geni-serial-v2-0-a5726421b3af@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778606047; l=5509;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=cN4714YKFgE3Cy3MMrWdct7feqTVFb9iQz2fsCrzvwo=;
 b=edNqEIQASRPfmCjJJ76xPFTodkyNIPwMyvZj8qPhFLmYKe3Df+d09/fEWq5af5duIUgvcmKmj
 DTwBZbqVdLTB36fsAa5Bz122lyRjz3k8e06oqcO/sMRYsj0vcLrG4iC
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: OrpzIjSESJi9Cp7lDMhFSBDHmLBb8R_d
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a035ff0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9bDMwBodl1-tA_8t4OkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE3OSBTYWx0ZWRfXynELtgZBWN9a
 Wgn4qsoz/wOfgK4L9XCieQLPkHsTShIuXAEPNhAVv5oQiQ6kLmY3cpImGcbReEjt3wGBNRsXsu+
 hloj0RLjLNPh84oadz03Gv+q6woQBA6CsF8f42Edf7gaBfYR8ayLEy2FbNATKC6qOs9h472hRT8
 ngWR8uba+ORYNG0ULBnLihmld1lqGsuReCWA2kCI7OHRhhb6sj+tvlIB1QvBk6OCgWG3W59puZw
 eBy4JtpCAb6T2BsvNo+tJRYEFURfaO7L7+ZiBB7GYhoARVWIiTuVo+TZ7kIYvAkHHekVPek+hlH
 GPw6qBTLZuJGyowH0V2zoo/Htc5REyUNcJkmx6szF//mu2cUKziWh4P4EpGqOnESyea9rZG2DRp
 vqt874uPmGTNlyBGwEVm+RDVjiYUBjVSirtfZAGo1/6wAYC/dMJcyw0u1DshOSC9x11+6dd3my2
 1eWArwSs1rWOi5rqjVg==
X-Proofpoint-GUID: OrpzIjSESJi9Cp7lDMhFSBDHmLBb8R_d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120179
X-Rspamd-Queue-Id: 038D3525B97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-107151-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add tracing to the Qualcomm GENI serial driver to improve runtime
observability.

Trace hooks are added at key points including termios and clock
configuration, manual control get/set, interrupt handling, and data
TX/RX paths.

Usage examples:

Enable all serial traces:
  echo 1 > /sys/kernel/debug/tracing/events/qcom_geni_serial/enable
  cat /sys/kernel/debug/tracing/trace_pipe

Example trace output:

2517.938432: geni_serial_clk_cfg: a94000.serial: desired_rate=1843200
     clk_rate=7372800 clk_div=4 clk_idx=0
2517.938753: geni_serial_irq: a94000.serial: m_irq=0x88800000
     s_irq=0x08000111 dma_tx=0x00000000 dma_rx=0x00000000
2517.938803: geni_serial_set_termios: a94000.serial: baud=115200 bpc=8
     tx_trans=0x00000002 tx_par=0x00000000 rx_trans=0x00000000
rx_par=0x00000000 stop=0
2517.938807: geni_serial_set_mctrl: a94000.serial: mctrl=0x8006
     uart_manual_rfr=0x00000000
2517.938818: geni_serial_get_mctrl: a94000.serial: mctrl=0x0160
     geni_ios=0x00000001
2517.939165: geni_serial_irq: a94000.serial: m_irq=0x00400000
     s_irq=0x00000000 dma_tx=0x00000000 dma_rx=0x00000000
2517.939592: geni_serial_tx_data: a94000.serial: tx_len=8 data=61 62 63
     64 65 66 67 68
2517.940610: geni_serial_irq: a94000.serial: m_irq=0x00000001
     s_irq=0x00000000 dma_tx=0x00000003 dma_rx=0x00000000
2517.942174: geni_serial_irq: a94000.serial: m_irq=0x08000000
     s_irq=0x08000100 dma_tx=0x00000000 dma_rx=0x00000003
2517.942323: geni_serial_rx_data: a94000.serial: rx_len=8 data=61 62 63
     64 65 66 67 68
2517.942680: geni_serial_set_mctrl: a94000.serial: mctrl=0x8000
     uart_manual_rfr=0x80000002

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index e6b0a55f0cfb..9e2de074d799 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -7,6 +7,9 @@
 /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
 #define __DISABLE_TRACE_MMIO__
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/qcom_geni_serial.h>
+
 #include <linux/clk.h>
 #include <linux/console.h>
 #include <linux/io.h>
@@ -225,7 +228,7 @@ static void qcom_geni_serial_config_port(struct uart_port *uport, int cfg_flags)
 static unsigned int qcom_geni_serial_get_mctrl(struct uart_port *uport)
 {
 	unsigned int mctrl = TIOCM_DSR | TIOCM_CAR;
-	u32 geni_ios;
+	u32 geni_ios = 0;
 
 	if (uart_console(uport)) {
 		mctrl |= TIOCM_CTS;
@@ -235,6 +238,8 @@ static unsigned int qcom_geni_serial_get_mctrl(struct uart_port *uport)
 			mctrl |= TIOCM_CTS;
 	}
 
+	trace_geni_serial_get_mctrl(uport->dev, mctrl, geni_ios);
+
 	return mctrl;
 }
 
@@ -253,6 +258,8 @@ static void qcom_geni_serial_set_mctrl(struct uart_port *uport,
 	if (!(mctrl & TIOCM_RTS) && !uport->suspended)
 		uart_manual_rfr = UART_MANUAL_RFR_EN | UART_RFR_NOT_READY;
 	writel(uart_manual_rfr, uport->membase + SE_UART_MANUAL_RFR);
+
+	trace_geni_serial_set_mctrl(uport->dev, mctrl, uart_manual_rfr);
 }
 
 static const char *qcom_geni_serial_get_type(struct uart_port *uport)
@@ -683,6 +690,8 @@ static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
 	xmit_size = kfifo_out_linear_ptr(&tport->xmit_fifo, &tail,
 			UART_XMIT_SIZE);
 
+	trace_geni_serial_tx_data(uport->dev, tail, xmit_size);
+
 	qcom_geni_set_rs485_mode(uport, SER_RS485_RTS_ON_SEND);
 
 	qcom_geni_serial_setup_tx(uport, xmit_size);
@@ -909,8 +918,10 @@ static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
 		return;
 	}
 
-	if (!drop)
+	if (!drop) {
+		trace_geni_serial_rx_data(uport->dev, port->rx_buf, rx_in);
 		handle_rx_uart(uport, rx_in);
+	}
 
 	ret = geni_se_rx_dma_prep(&port->se, port->rx_buf,
 				  DMA_RX_BUF_SIZE,
@@ -1069,6 +1080,10 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	geni_status = readl(uport->membase + SE_GENI_STATUS);
 	dma = readl(uport->membase + SE_GENI_DMA_MODE_EN);
 	m_irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
+
+	trace_geni_serial_irq(uport->dev, m_irq_status, s_irq_status,
+			      dma_tx_status, dma_rx_status);
+
 	writel(m_irq_status, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	writel(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
 	writel(dma_tx_status, uport->membase + SE_DMA_TX_IRQ_CLR);
@@ -1281,8 +1296,8 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 		return -EINVAL;
 	}
 
-	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n, clk_idx = %u\n",
-		baud * sampling_rate, clk_rate, clk_div, clk_idx);
+	trace_geni_serial_clk_cfg(uport->dev, baud * sampling_rate, clk_rate,
+				  clk_div, clk_idx);
 
 	uport->uartclk = clk_rate;
 	port->clk_rate = clk_rate;
@@ -1432,6 +1447,10 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	writel(bits_per_char, uport->membase + SE_UART_TX_WORD_LEN);
 	writel(bits_per_char, uport->membase + SE_UART_RX_WORD_LEN);
 	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
+
+	trace_geni_serial_set_termios(uport->dev, baud, bits_per_char,
+				      tx_trans_cfg, tx_parity_cfg, rx_trans_cfg,
+				      rx_parity_cfg, stop_bit_len);
 }
 
 #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE

-- 
2.34.1


