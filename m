Return-Path: <linux-arm-msm+bounces-118333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tC+2JgMoUWquAAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:12:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3720B73CF40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:12:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UcPylpbm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GqRVxWNP;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118333-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118333-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8775E3003804
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 17:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED99943B486;
	Fri, 10 Jul 2026 17:12:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8784D43B498
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:12:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783703552; cv=none; b=e2DfZ3ar6jM6JCguHb1DiDofSaJTtaJ2sElrWCYtFd86wpzvDE59G4ukK128iGZJjzN71dFJwiNkiJCDKAu4KHdZ9C3J0BtcFSwqNnmPybSF/ofN+qio53OwyuAmY9bxGfLHHl/ifCDR0CdhHNE1BF9AK83YWYHcBSmukcrz2gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783703552; c=relaxed/simple;
	bh=w/htGaYN4MRQBkBxw9Vyzouak6ZhBaXPMXN6dHtpIC8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NoKDNPC0OFOzBfIjuH5d74hiAKLw37TvScZd3Kk74JcF/1xds58iBJNb8lnjgslCL+lQ26WpanJ+pg79MTvCVenK0rDvtSC7JdlXZtEytw6Sd0m9M5xpc80vegPqugWvagnFfS10aq7E3UmV1SsDvpsB9IQZJA9/eTqCGROWryg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcPylpbm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqRVxWNP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3WdS1501981
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=suX5GFzgtIvy+WnRpGcGhY
	1Adyg80YvOjSiOP0vhCIg=; b=UcPylpbmkwEjGg6VLB2secRcZuH651W3IBaogT
	RR8kWWYMrs40dUiEw/bDMToCyd6kIFiJJICCGjdo4rPN/qYtwqNiEMjIzZgGqPLb
	BiYnJbhD547EfXSNHsaixDbckFZj2MYNFQMSfWBHToMrP25kTXpMslZdWmwf/TKi
	3Zgj8Dewr9n9Nf6OePwXSdqtztN/dNDf7JTOz8vXHVSScGjwNo2o7A6AGR18Z9eg
	GZELNx522uiF3kBz/p/ZWomjcV1ckZGohn4qEpJTu4+p4T3Zn6zktVP2rGLKv9F9
	uB+7vZ/taBaQFxb1msEkJQtjq/2C4rXCbMQFIsLavHxT5l0w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb3xvr7s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:12:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso1780315a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 10:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783703550; x=1784308350; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=suX5GFzgtIvy+WnRpGcGhY1Adyg80YvOjSiOP0vhCIg=;
        b=GqRVxWNPNQbHYYM/JYwT70yc3AZImzGlDKhyoWgwZDpQc0eDrjZ+6ZyQqjbkis7dQT
         +TtXeGkdefMRmmSseHbjiF8B4DUwSrB1gwpGp/Q2AdY4Wzine3+1/6z487nkB7p27yxB
         pu2m9TV99lXRBDGE92OhhQto7xsAm+X7LwuGBBELJm/+N+XNvJ6bAtKgm2rtDvqCqXi8
         HPuwoCl23nsY4aF6SPoWpS3U5Qu6fxkx8bSzEi7tfqZ0Z1snqnxQ/TmoEIcCEfkFHEti
         sGc23/WFmTx69uqvpQj47+eYFg3EUPuOAzNjEo+4AzOlfCoD2hGu34Z/nfMNPFv/bTVw
         JNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783703550; x=1784308350;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=suX5GFzgtIvy+WnRpGcGhY1Adyg80YvOjSiOP0vhCIg=;
        b=S9iIJVPYjU1jrTpUE7JzcZejCuvXNuB62ro7tzaFYHCm/ekVANBJ+bh3tVmrWzwcxH
         Xd1ejmIsAONjTJmiO82qVSS+7Fw5gq/Tgi97DJkmjQeXMEIt6fctqHcePg4xs1I3YT9v
         B3FU7zSydHYtB0DZGIoHVitiFruuWdQdi/+8RkYvaa+KCMLxHhzAVkQbnXedMS1b8sPY
         LXKaFACy6U6yWJtW3Mfynjsk/IyJiGbBLImaAugixpx10SQrpSwJEraCLAM5X1FPoUda
         y7WSxict3qeP7enVpxUKi9HK6QMlcnxSLgegDFo+JmkV1n75S51lP76bMf7cGsxbGQX5
         IOVg==
X-Forwarded-Encrypted: i=1; AHgh+RouliEzdeCqIlZ8KTJOQMgaklb4PBFD6wEEplhaujFNz3nf+UtxPBo+bTUsyqw5cFT2HPjSYTcCNh8AVjjM@vger.kernel.org
X-Gm-Message-State: AOJu0YzHAvDTVliIvhNT+VJ0oGEI7X/U/JDWgYLfiK+00eqgNIJxJOay
	etikluG6fs2v4MU/1fWIWeH0BjP0xp97ljJbhfo3SmJHLOng+K48V2IjBXf0z79Q4cIXYW7DpJs
	IoV1xf5IaDgckxju4ln8UI3DagoSz4UDEM9ptAtzYyFWu5VtYeruX7/IK4OzPDaRyibh4
X-Gm-Gg: AfdE7ckENhCQisCHTvN9JZrH8mtYJqeHerHfwA3xX4ZX0Ho3ANJRsFlaxJXZwBCu+71
	6QvNxKH9T7fdUcDwumahy+PZT2Y2TxFSo+h/Tk0zDaWCdHP/C2fN/rpvg9jbX75TKOBhlECSEXB
	agJ5s5ghlyBacid3rm7ELyiSR6oPH98XM9rJ6N3Ai91gGJEHwzHTSshe74jQP7/GnrzKA5HdA0v
	0PEMsbpYugMxcQlHgnoM3/e2xehGTK9uiL5vqpyAvwvodwQ4Hd/h5cqeF7QyCyTFCwvOu2bO1Ek
	oAxWyu2f3ZGy3+W7FS31fcAK8CsbrWDlPZfp10qwcYKvTi3HsCT+qsHE4gfygMeXS0fwRx88LUZ
	YQlnSzXt0rb73+B4eSKGkxwQWFCYfUaWYSwFUn90tzjKv
X-Received: by 2002:a05:6a20:a107:b0:3bf:e291:496c with SMTP id adf61e73a8af0-3c0bc9161c4mr14798869637.17.1783703549945;
        Fri, 10 Jul 2026 10:12:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:a107:b0:3bf:e291:496c with SMTP id adf61e73a8af0-3c0bc9161c4mr14798831637.17.1783703549397;
        Fri, 10 Jul 2026 10:12:29 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d7c8bsm46636277c88.12.2026.07.10.10.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:12:29 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v6 0/2] Add tracepoints support for Qualcomm GENI Serial
 drivers
Date: Fri, 10 Jul 2026 22:42:11 +0530
Message-Id: <20260710-add-tracepoints-for-qcom-geni-serial-v6-0-2bb6b6836dfd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOsnUWoC/42NQQ6CMBBFr0K6dkg7lhZdeQ/jokCBJkChxUZDu
 LsFNy5csJnkTX7eW4jXzmhPrslCnA7GGztEEKeElK0aGg2mikyQoqAcJaiqgtmpUo/WDLOH2jq
 YSttDowcDm011cOG5lBJZXsiCRNXodG1ee+b+iNwaP1v33quBbd9vIKPiWCAwoJBxXiAKhprmN
 +t9Oj1VF5d9Gg/ZOgF/3AwPujG6VSZRcGTFWdV/3Ou6fgC7Ew7EOwEAAA==
X-Change-ID: 20260427-add-tracepoints-for-qcom-geni-serial-948777218b7b
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783703544; l=4142;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=w/htGaYN4MRQBkBxw9Vyzouak6ZhBaXPMXN6dHtpIC8=;
 b=K1GsQgIBTSZVK/rXxQ5gOYoYKuMaGiWWRUKkWfnth6N0YGb2DtUiR9fcobzRF1XnNYcFR24qt
 WgtmEaz8BfoB8DOkRJ+bE0dH6Msbrgh1SErGtsJanbbvcV2sZaBu4Zx
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: Roy3frfama-V9aPlNt9n99vXu5c1yHgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE3MSBTYWx0ZWRfX5671fhSrFpN2
 1uqLdd6vFckiAFeUxNXNWs7nYSjZD6bDBJtpht8yBS1YmouejL6CeIrFT1jSwDSAsH0Bfb1Kiay
 CVjBQS6nAXQumWV/36iAfEdlIT/dccykOyXPaB05gmdCZrlGpPkmTBraH8adBwR1uwSUJmE2vJv
 2VSlSMS0HhUdgDso+QTodAYTxE4TdNxy8q3n93JMZl8KNmrhWVG8AdwvwMQrL8ILx/hAtUHhTiR
 FlsAvqKEF15F9q0hILmR5iFi40qpEBKy3zqFw6kyAQWL1DUj01tUyQDhM9mE+tKPNuNGG3SaJQG
 iWrdynFJSOwyW22ZD2gYt++I20CJ9E/n95q0u8VOPcW36A5qS978P7dzuZ7DOxVsncz/97QbJrz
 9ZnP6TV6fqz8ofXGMOpPPvjXBm5kQ2Nt8jDiee/4+32m+CjACjYySSB48c+SG8j0WSqRjCHP9q1
 ZXJ/sS3qvdBoW9Kqqlw==
X-Proofpoint-GUID: Roy3frfama-V9aPlNt9n99vXu5c1yHgY
X-Authority-Analysis: v=2.4 cv=HInz0Itv c=1 sm=1 tr=0 ts=6a5127fe cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=meVymXHHAAAA:8 a=7d_E57ReAAAA:8
 a=ag1SF4gXAAAA:8 a=1hfpssHSpbbJHZzjzoIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=2JgSa4NbpEOStq-L5dxp:22 a=jhqOcbufqs7Y1TYCrUUU:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE3MSBTYWx0ZWRfX/hK1coY0EQHv
 89X3qihVH7WGdE9Vvoq7JK7KBPA0CbfQnL9Ivi2sPKHHIx4y0fBt71cfrUjTT0fTQ26A/Uv9PyU
 lXnwy1BGzT3SPKxXb/v9Geb0q0/SA5Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100171
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118333-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3720B73CF40

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
Changes in v6:
- Rebased patch(02/02) on latest linux-next.
- Link to v5: https://lore.kernel.org/all/20260615-add-tracepoints-for-qcom-geni-serial-v5-0-2efa4c97e0e2@oss.qualcomm.com/

Changes in v5:
- Remove serial trace header patch since it was accepted and merged.
- Added a new patch to fix for remove unwanted variable len.
- Link to v4: https://lore.kernel.org/all/20260526-add-tracepoints-for-qcom-geni-serial-v4-0-e94fbaec0232@oss.qualcomm.com

Changes in v4:
- Rebased patch(02/02) on latest linux-next.
- Link to v3: https://lore.kernel.org/all/20260518-add-tracepoints-for-qcom-geni-serial-v3-0-b4addb151376@oss.qualcomm.com

Changes in v3:
- Removed \n from geni_serial_tx_data and geni_serial_rx_data events.
- Resolved aligment issues in geni_serial_data, geni_serial_tx_data and
  geni_serial_rx_data events.
- Link to v2: https://lore.kernel.org/r/20260512-add-tracepoints-for-qcom-geni-serial-v2-0-a5726421b3af@oss.qualcomm.com

Changes in v2:
- removed multiple trace events for TX/RX events, instead used
  DECLARE_EVENT_CLASS and DEFINE_EVENT.
- Link to v1: https://lore.kernel.org/r/20260506-add-tracepoints-for-qcom-geni-serial-v1-0-544b22612e08@oss.qualcomm.com

To: Steven Rostedt <rostedt@goodmis.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: konrad.dybcio@oss.qualcomm.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-trace-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com
Cc: aniket.randive@oss.qualcomm.com
Cc: chandana.chiluveru@oss.qualcomm.com

---
Praveen Talari (2):
      serial: qcom-geni: trace: Drop redundant len field from geni_serial_data
      serial: qcom-geni: Add tracepoints for Qualcomm GENI serial driver

 drivers/tty/serial/qcom_geni_serial.c   | 27 +++++++++++++++++++++++----
 include/trace/events/qcom_geni_serial.h |  7 +++----
 2 files changed, 26 insertions(+), 8 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260427-add-tracepoints-for-qcom-geni-serial-948777218b7b

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


