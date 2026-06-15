Return-Path: <linux-arm-msm+bounces-113190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JbeJJWwJMGoIMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:17:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 31407687069
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:17:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Pl92d3GC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eIfnzb7L;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113190-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113190-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 695CC300E167
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC81F3F926D;
	Mon, 15 Jun 2026 14:17:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A61C3F5BD0
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:17:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533028; cv=none; b=KTjoBCjrzg0HN84RcLChh/2LD/lKeIe/mI8uEQ0XHmWzfnTgOOBXdiXuVRblcldGGw2bNxHY2RyWlOBht38sSgzlPx1rJk0tZx9LLbBW/tovud2MOOGITs1ZyCSeJyPvQkwG8w2Kj774Adt+2wKoeaQQVUhl7JkMLzw3s8MR04w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533028; c=relaxed/simple;
	bh=7ravXgTmMO+fNz84uqrTJ5yh8qkHxeBte3jycrujzy0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gje0Kw4fPUerk/gFZgteJF2t6VKXvGRq+H1s7w6qPVewpwebym1AHyncIjQjAhHnfscMOpuJ/tf6nBTgyQ0z/zWLN7TwVxXnijF2LL+KqIZ5WY1cmOZlVg9xQDux9X+xX8pxlvjFag2gkpxjRxpjWykDUwpB1tg5KYpaMH20XUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pl92d3GC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIfnzb7L; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCZJPu023518
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vd27UIermRndpbWE6uam5b
	8AYLKUJl9f4BWkWI0HBa4=; b=Pl92d3GCYk8Is3db513cjR1Hzz794L3jhQDp9i
	X5qrXqbd80W01fSw/sPCmDJmtYxRZ+fJH1qQRy5ssGmHHb8zVBxnF4ZzvRC/NOaH
	HFefxHXBGg/DZM1ykv8J+g6fQ16uPsvBVgeVa/o+8AO/7EljE2xh18fRu0cpQ3r1
	pggbVQcc6YijrCtaA9JTuPX0+5Wf2fYYJ4vf9svD2EgbKC0a8Htu7R6kpC69T/NZ
	NYJg7b8WI77K6gJFLB35FAzYFpnvXaKPwPMTG0IOBtxG6XEW7Vjktwa1Wn28A+YY
	CvSlwRsJetrH3eBhgM6NDociV/nuARd9KDYwBYf5kb3nD0ow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0h381-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:17:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36b808bedfaso4771395a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781533026; x=1782137826; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vd27UIermRndpbWE6uam5b8AYLKUJl9f4BWkWI0HBa4=;
        b=eIfnzb7LkprSFjFOfYZsA+xyRMr1gCrPOXg1PA4k9FKxg8Bwi63ykCEQl9c2D/ocZS
         NokVcPxhRaNoIfFgCIlp/jyplZnjl8eup3LSmCaGx86tTI3e6NilMxCTEXaq8vofMbi4
         eyyK8r0FkATK4N3sJo2X/7MldRc0dDP7op2xCBFG0n+o8ReIZI7R4UB0P4LoWJrpsRAP
         Jln9nFWhbzJaiRgnh6eBV7Im2w3g01kUENrwLVsrk6enu4/QmSfPxogwUl7I7WRg2Bs7
         lgvPI6k/mpVj30bive2dWx+jcOxAIuzl4/Wxzn3HD6FR6tfmeliJed7YD6MkjoDaHUZL
         5AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533026; x=1782137826;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vd27UIermRndpbWE6uam5b8AYLKUJl9f4BWkWI0HBa4=;
        b=cUs+gZRxr8Z9lQdVfag/nppaTW0w49kTrLDaRIz+zhlkdn4ty8BokjgmxY38Vy4Glt
         ynRIkdXmRuywcFNBBIcP1VMTpMsVuc8vGtPZglC/+psPcBXoDNYSXy7y6sn5n3SHJc6d
         uTMqM+CfvfhvNUIfS2QkQgZP85UDV5z5CMxF0iaWSm9uSVp+6yF3UmVAMKUdckfomV+b
         wlQcWk+AawRE8Q5r2MBKAG7/+W8547xZRwIV5nDjEVGMBeUmWjiTtur7NYw+y0vlpl61
         iBb89/ZT2Yz1CVmK+zOkM0aSjWXfHCNGqfF4e0yIpGewYsW3irBY0Cnp5z6cPy33vvRj
         10qA==
X-Forwarded-Encrypted: i=1; AFNElJ+S2FpZ5JrBaQ5TMY4ei86f57uCHtclXoqnN6bjTIaHkfUUJCyo/7izPirEe8Tzt/5RPydWiVP/qm36/eEY@vger.kernel.org
X-Gm-Message-State: AOJu0YzNYhxhKrd3n1O2b49kTGPyLhuBnwd8UXCegh3eqKWL4k/DMjsg
	QidQdPn6SIn0C+KnBu6nP7iU1EAqjBbXw+TZ5jZctGPfYvaVSTNRh3G7n9iZgPL/vErgVGdboxW
	CDrcIXW8YcDpEzpkQ10/8L9+ENa8BztphlutUAAm9gpBbZjDIWrlpE4JqSfXi4+0Irg25
X-Gm-Gg: Acq92OGLzjj1uyOp2Mh6xokCFoUiArYSuv5Afz3xXcuv2QFW7NVpGPHiaiY5u19L+Yu
	PnBDQPo7yp4hHV4Q8eRPeUnxz/pJG8ppvLv5F4DeamKBVX2ByuFJcxNAx8NMaBT2TGXaCvidKJx
	uJp+MtIL5FGL7+RBJgCcCmPKDHzw1vxGJkkepqNNNZ08OSZ2THPj/kf5MocUwRxeXK9EOCaGk6u
	/ZVdvUkrZYceFKnF+UX8rYGNwARmTw/C0zakvbISg5KswnLENcAmpNO/BweR9HHcOnj4oY9q0S1
	NiqdP3nZZbFDeeXq5qsufnx6xIGilpIVhODwhZVKGrCd5rIEZUFSvmBYR/0f/HzEVpd1u3cN7oM
	nRzDtHeliO3tln8vcYNihEJp+zm3yDxJj0bg3mzAF0Kn4kW+J/zQZC+0=
X-Received: by 2002:a17:90b:380f:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-37c2bc6ed5amr11682497a91.3.1781533025729;
        Mon, 15 Jun 2026 07:17:05 -0700 (PDT)
X-Received: by 2002:a17:90b:380f:b0:36a:5d1f:7ac with SMTP id 98e67ed59e1d1-37c2bc6ed5amr11682419a91.3.1781533024975;
        Mon, 15 Jun 2026 07:17:04 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-379e8cc467csm7172476a91.2.2026.06.15.07.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:17:04 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v5 0/2] Add tracepoints support for Qualcomm GENI Serial
 drivers
Date: Mon, 15 Jun 2026 19:46:51 +0530
Message-Id: <20260615-add-tracepoints-for-qcom-geni-serial-v5-0-2efa4c97e0e2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFMJMGoC/42NQQ6CMBBFr0K6dkg7FoquvIdx0UKBJtBCi0RDu
 LsFNy5csJnkTX7eW0jQ3uhArslCvJ5NMM5GyE4JKVtpGw2mikyQYk45CpBVBZOXpR6csVOA2nk
 YS9dDo62BzSY7uPBCCIGsUEKRqBq8rs1rz9wfkVsTJuffe3Vm2/cbyGh+LDAzoJBxrhBzhpoWN
 xdCOj5lF5d9Gg/ZOjP+uBkedGN0y0xgzpGps6z/uNd1/QAqN33DOwEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781533020; l=3953;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=7ravXgTmMO+fNz84uqrTJ5yh8qkHxeBte3jycrujzy0=;
 b=qUpAxjwRvgrjKaoC+UG+nOXyp6Agx4jXC1KvUxF4qgf5EYa6wq+WBDmeM+tBjSAgrPq7ZgND7
 NLAIzdLvCXJB9QeNqoRn2PoEpBIcjhk2Fslfe4j3zJ92Z+ausjrijYu
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1MCBTYWx0ZWRfX1vXU1TdcdVKY
 P1xQeaONmcvzgLTqZ9dMt8cNEwXhqSuxZ8wNeWiR5UKbsPsXp6vxeK58FfjV35HSMVISZMre41/
 CkYuVeTeeLHLu63kLYde2TvESa/9RfA=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a300962 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=meVymXHHAAAA:8 a=7d_E57ReAAAA:8
 a=ag1SF4gXAAAA:8 a=kp9qP9swKWubhZvKkLUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=2JgSa4NbpEOStq-L5dxp:22 a=jhqOcbufqs7Y1TYCrUUU:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1MCBTYWx0ZWRfX2JUMb2wvteGQ
 MgX9STGrRjbxfRZ/hKTd8K3+ZzOQqnyvS/r08H4p7GTvLntmonqLYnL0LmXC9GiTpKDaamq06KI
 kAt5e1bCryTy3O4xkNB4dsO+G/0aC4VFvxIGjN3aPvTboALnhlCyL1uwRCnbl5TiowjB9aVioRA
 rSNq3+E2TmTnwZohTv3CJcEph1OKvHpEXQva0x/kwYYF+jIcsxpEJc1yk6QSBhjk/tw7WlXDn+C
 JIpXbCpANKxVCvZ+qpJiGMoYvfhnGBtak6Y8psOgTDxvGnX4McsD9sDPv6n10EA9RPtRAs7lxhA
 va2OFA/eW5U1xgcm3hIjxV5xDQlu4EJrNVjdsCCbnpf4dDARFOeWYi6DA6+UjXiNSFE71qzgiQL
 XNvfnQ78t6P2QByny0vaBEaqKXi8CPt1Rdx8iocCWG5kddfF1N5Vr0bl30ioXz7qIDZVoT4Qg3E
 qT4+RuujwTEJPOgtybw==
X-Proofpoint-GUID: 8yvQxWpwHUPuIRZKY2t2XYiE38F-yJOy
X-Proofpoint-ORIG-GUID: 8yvQxWpwHUPuIRZKY2t2XYiE38F-yJOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113190-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,efficios.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31407687069

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
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260427-add-tracepoints-for-qcom-geni-serial-948777218b7b

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


