Return-Path: <linux-arm-msm+bounces-106171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM4PAXN5+2nCbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:25:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EEB4DEC92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE85C3008617
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566324A3419;
	Wed,  6 May 2026 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZMrbSaI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQi1lh5q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAA233A9E2
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778088300; cv=none; b=TSdhaH7LXyCAKWNLp+ckkalj8+mtnQw2KDvOLS/XnXG4yXV0M6x3rXoX7XpKk4FiJeT21wN0x2lLc7y8olvY7KjiYlZ3L3r+unHj6F0s+w5yY8yY6gI8a3M5TL0UtZuSPvGUiz2JhcKNBp+PotwOfp/bqhrgJdcbQdIJ5MJwCbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778088300; c=relaxed/simple;
	bh=+AZ7HP8vxs7weUtdsrjpH50Vk0P8ZMYChRlMTdxE1CE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dgNRG8yXfQwvXzBwU47R4FdxJPErU7f51O1YCUFERlSjQRX1xlXYKublJYuQbP+j7Uu/AL3MoluRJ0HKDxNucdWARsBInADvDLbJRVe4dsnTKqPeWY5rfp8tykakbkRPeextl9OFcHRQIrNj9B++h0Yp5lfAba5ptBkkZs3fl8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZMrbSaI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQi1lh5q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646GiCeM1985559
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O7Ga15NSFXzMxuZpJT7ZHF
	6f1emO6pmsZRbxPGcXR5w=; b=dZMrbSaIUEhMGECURKe5lEl+n82UJYfJMhRRmk
	WikP3LerVq/yRCRUVYYSzHZoyhvYKGcF4qsqdTpoVnpOnBQjqTyxsKevDwl5SvuL
	pXgXSxJ0yVo1ACZx7tIT/IH22inGWQ1OU/sfINVTOSbGmxjg5HpToFd4mOyEI0Tg
	CfKkVk8s+pTv1kB3IJOzwqyjzF4MArmr7KIafxeRNcmy2MbduBUuMnESwuDiysDW
	x7TmZeudTJEi/vYz45TkIbuPIl7K6xTzYbgwWWWY8psSXnDeqqBpHAaGcyVYzWBC
	R5cvUypX95rOcGmyab+fd5vgi5Nnn7wW8vGzZBbU2YNVOBng==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03gp1n2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:24:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-362d9dd9a49so6885304a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778088296; x=1778693096; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7Ga15NSFXzMxuZpJT7ZHF6f1emO6pmsZRbxPGcXR5w=;
        b=OQi1lh5qQjaGnKLrGXCwXROGNkjjra57NK85JT6rzd6RG8pUMVdx3526jMfxunLyrV
         JfXmclflb9DR2CpQkuHas1NDTQMtq/Qq+pvAemxhj8fgISqgQQ4oqBTjN07i6/X6A12k
         RzbcmF2tNSpA4uSNM0qKO5G+AsutY0tAp903lDEj2i9gYDTIdQ0pwH7z93PLmluwA8ZR
         M2DDYuvBdM2i6/r+YSZimDktR/PSU9odsd1InH9uKp3yuo33hIgq2oc+dcW+6lr/zGD2
         p3AI3Sg1hPMdV2vR/c80Yg0cvE1uY5PPQfa+nRwWNn4u7XMK1J08Rrz7Skx086XraHOD
         Uv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778088296; x=1778693096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7Ga15NSFXzMxuZpJT7ZHF6f1emO6pmsZRbxPGcXR5w=;
        b=mH0En1bAuOkEinNrqrt6JJdWO1A/LlU7rl1r/p/so0J8gwVY5SuqAQbeSyTBZPMDRL
         8UBDeThdM0JewBIvVNRX9qOy6LrGSfajRS16YdeKMU+KjCrWhvZ3RU7xnDvLvDt9te42
         x28YuVph4QtSsrd+WYS5FumxpeRFSXkhg+jR3EeFvKllB4EYc9p2YPV61CSWbQf5pYiW
         cN4YcgboK8VGE4R6J6BNRpMEfc4ArUdo7Urh1x7p0Gk+1u7eBt79bzrEgjdUSmqb+daB
         lShSDZyqgwkYsKkPsYNBqOo1iqJmTONpScIU70mpVJ8iBRUwLVQKVWCu3Ij2DvjKZfrG
         I6gw==
X-Forwarded-Encrypted: i=1; AFNElJ/XmRDajFUt08jNVZ4QVdEotxrUa5OQ+BM7MoSL/Phajiwq80LA79iq7ooskCpohOcvqchMvqu2qEMt7r03@vger.kernel.org
X-Gm-Message-State: AOJu0YzXEo2B+F7ap5qZxnYXuLZvo8Wks+7FAjcKNoa/m2hZ1daUF2sM
	uSpxdcFirp1LFMrh19H68pl3Fonvdx8/Uw0JPKzP7riYt/vjNBOgeYMoe30EzzjRZRs7EfmD0AQ
	6TKX93RR6a19gLIvkyfqRJyQT4KgNbR0s9g9o+LIsPVXBuZ7uC0IYY6Le9d6R0OOFKtyY
X-Gm-Gg: AeBDiet62vX3oqniw4nlhpkyjq9XE6DuOZILW01qVSBEfMnM7UKKY2DUP8HchB+zE8A
	HeNPVJ5RlovyzKOlcFN42PcOV+39gFlPv17XBFGiibboF4UK/htsk5wIrqHEvPpbHiW/e7sMA3I
	hHBQYQ9MHSB7bpQp/9HLzVnlO8sYuR5/L5x/DmFNMabVyJ3ZpmJVxsyVYRL3VUw23qTDtYDxAwi
	GThuhZ8o2TdqnoCqQ9IBhksr4JWXU+PfY/RAbcHLN2VuWoSZBzyCsslyiStqe09SOZCX88pNIEK
	AInGyZ/vPNUbmyv7RiZP66UlN1jpUxFYeyCzqny+kzoiQlZ4yW+JTr10/E0JeLgaUvBUqfvG/GP
	GJMZRGH/9eat1cNecuBkVMlU2pA66JJEjcQujCaRMhb3LGORaDmPWuJGMnVT8eM6l3w==
X-Received: by 2002:a17:90b:3911:b0:364:aa5d:7d64 with SMTP id 98e67ed59e1d1-365ac270394mr4325139a91.14.1778088296276;
        Wed, 06 May 2026 10:24:56 -0700 (PDT)
X-Received: by 2002:a17:90b:3911:b0:364:aa5d:7d64 with SMTP id 98e67ed59e1d1-365ac270394mr4325089a91.14.1778088295496;
        Wed, 06 May 2026 10:24:55 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b4c9ad13sm3051948a91.15.2026.05.06.10.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:24:55 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/2] Add tracepoints support for Qualcomm GENI Serial
 drivers
Date: Wed, 06 May 2026 22:54:43 +0530
Message-Id: <20260506-add-tracepoints-for-qcom-geni-serial-v1-0-544b22612e08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFt5+2kC/x3NQQqDMBBA0avIrDtggjjWq0gXMRntQE10IlIQ7
 97Y5d+8f0JmFc7QVycoH5IlxRLmUYF/uzgzSigNtrZt3VhCFwLu6jyvSeKecUqKm08LzhwFb81
 98Nl0RGRNN9IIhVqVJ/n+NwMcBl7X9QONXh1kegAAAA==
X-Change-ID: 20260427-add-tracepoints-for-qcom-geni-serial-948777218b7b
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778088290; l=2401;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=+AZ7HP8vxs7weUtdsrjpH50Vk0P8ZMYChRlMTdxE1CE=;
 b=vFHs2/S/IHwSMm2C0TzZmarhzpoiTlQdxnVh8yDl5yb/fW4SITagb7J8JD2fJZZFAgzjnw4j/
 MMI56+HksXZD3pwQ/sYVWZkoGLBn6d6+B8Aj9GhK3YYE98ZBg5++GYO
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OSBTYWx0ZWRfXwetnPYOYxSGr
 hpKC6NMx0bUizDGN61s5Ns+vCEXNZYI98FNDmszsRtSd8lYPOYs3X6hkKsi+2erLJCCht1gm84k
 1AxgaXNlW3Sx2sBeFHz+p/k9rkmfkd/yPG8ytksn1zwrzmijhj6CyNoEGL58XTwA1rEz+z12yFN
 CEGwhOKwnOmXIUIXJFN5t/e/Sz1iNNdaEjCJW4F4Rn9hlglqhDOw9EnDtiMN8YvSZlZRa7qfJYb
 21Vf7TZe42xS18SmQzxHohhtS3UZCeE2iHRkafCA2nRnfdtlnL173dafP4dVDOE7gPaP/VuHKma
 gioa0IzFIpEw9v9Euj59KQqNlog6jPSWB0eioT13e/n2ALlTAQjULHxEB03SQGpvqX0LaJ3oc5c
 3hn0oKip6gkcqBrLg0slmXYk/+gMxdDayt+J7Kjxjy/0ZeF7LqFAIG08CVGudgDZ+SekoGqOEhb
 oSfAxr76LWoDmkUOBHA==
X-Proofpoint-ORIG-GUID: 4x-aGJwwsLoJV3-10jVrrBjDnlfcEbej
X-Proofpoint-GUID: 4x-aGJwwsLoJV3-10jVrrBjDnlfcEbej
X-Authority-Analysis: v=2.4 cv=W8wIkxWk c=1 sm=1 tr=0 ts=69fb7969 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RLcLI9r_3EWR4hCO9JsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060169
X-Rspamd-Queue-Id: 02EEB4DEC92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-106171-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add tracepoints to the Qualcomm GENI (Generic Interface) serial driver.
These trace events enable runtime debugging and performance analysis of
UART operations.

The trace events cover UART termios configuration, clock setup, manual
control state, interrupt status, and actual transmitted/received data in
hexadecimal format.

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
Praveen Talari (2):
      serial: qcom-geni: trace: Add tracepoint support for Qualcomm GENI serial
      serial: qcom-geni: Add tracepoints for Qualcomm GENI serial driver

 drivers/tty/serial/qcom_geni_serial.c   |  27 ++++-
 include/trace/events/qcom_geni_serial.h | 173 ++++++++++++++++++++++++++++++++
 2 files changed, 196 insertions(+), 4 deletions(-)
---
base-commit: 1f5ffc672165ff851063a5fd044b727ab2517ae3
change-id: 20260427-add-tracepoints-for-qcom-geni-serial-948777218b7b

Best regards,
-- 
Praveen Talari <praveen.talari@oss.qualcomm.com>


