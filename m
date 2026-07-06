Return-Path: <linux-arm-msm+bounces-116759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kH+5KxihS2pRXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:35:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6CE710997
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 14:35:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MjKtfZpj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JXfSBsVF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116759-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116759-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A65D632C620E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5243F8892;
	Mon,  6 Jul 2026 11:08:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D463F44F7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:08:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336109; cv=none; b=CrxjIu+sD3R3Lfu9f/yq4QAhlGnjiqkjrXM+T2dUycPu4VZW2nFXq6em1nsjFm4ODq2y0KWHXhbb9+RaYNfgP5OXy1E8nOhmboShoacguySAWK9J/vk+ty/feumjRKx2oYrlD/wlmkoYmW7o5vOeNGrN6UaoAyMk2lKoVZCs20s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336109; c=relaxed/simple;
	bh=cPvVMpFS+a7vYWIpXWCc6esoPLFFshgEOVvwvfroPHo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pqjw7IjsNPetXUurMYD5CPcqtE+2pvk6j+OW3z5fxDa2EcIXhpch2ShT7o+9tY/LrAsdxb+HBWjftDbwW+NPnEOP3n0ofTz7HO7EJtXpfABKy7w8ZY62Uk8OxwvUJiFgkXNNa9n9AC8aYceOGAnrPaDzgMCF7aUvhuuf6gk4wzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjKtfZpj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JXfSBsVF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxFaO391218
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=u4egp0FPPKQnFNDrmVNrFV
	WXSWZYqpj9JbKyoENR63E=; b=MjKtfZpjcvsaHi8zi7TAj0NURUgxkIDXWLBOWG
	JcFZxxkpO6nHhhszZSfPWeL0l9tuDOBU/YqdXyHskRfiXnEVh2j6Fz944fTLDUBd
	OLxVi/AQMoFhM5XA5CNoYSSlsL3+OqIoVGVraHCxpWpfUX70tM+WHpurbYsqgpCy
	KUo4lpMWplOLNGck265YYsqnrxIZYDI6mbJpxaJoMTZQYZ4xDVhakhO3JdLa1gwM
	5QH4VuQVO5kSPRIL9daFo1RO5t2JgjQYDVvj6WdIMO4SrL2x8Q34McLPMbPhGee4
	BCxEquYvIvvm5GSFhqlgwlPCjxRZYFjw5dTvEVcLQ6D6QiYQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgrds0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:08:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9a700dc0eso23367985ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336107; x=1783940907; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u4egp0FPPKQnFNDrmVNrFVWXSWZYqpj9JbKyoENR63E=;
        b=JXfSBsVFI7NMQeDW4S3OMGsjHHnKJE2VROyfJQwaYtZ/h9luh95hQ1xeZ0ENmoUbXS
         qq8UCEt3DlsVovB55OPfz+5VrlBd/oNt4LkeAy4bOuZ29Cm7yayd9JH+Uf8kvdR17UxZ
         ZdQMPs4g6pHWbsjmWOeL6e0X2OBOAyaGU//4cMopEyRP2uSFUk76DkTzHL7jXdTn27CM
         syftwB6v4PMq9TMwXz8vF2XCJRXG1Qo+eof9lfx89PJHKgkjZemdXDhHeu0btgQ/JqiT
         3OSJ3txqkUZrPfWFiUm+mylgfwwjQW0seqBZ1QQXTunLMY8tZH2CRz8h1gJeiBQVordG
         Wwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336107; x=1783940907;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4egp0FPPKQnFNDrmVNrFVWXSWZYqpj9JbKyoENR63E=;
        b=WAlyzgQD9yVfcvWUoAqjWXKDXlEMjxWiMkoUWm2nRkZtPEK8mQxgOrShJHOKar5YKN
         umkBdCNzE0RQIwj19iOQn57rvI2gpkPr9u5yxF/TGneM8my2Z6isa+d9f6M8XHGBh7M9
         SoYajFM55zki082kjHPCQ4Nbqz2+6D7PKL2ituhHWeZRa1cKHPFE1LN5SoIb77g5b/NY
         skze9QWzh4hBA4C5wYDc0zwoYNu/8DrXSNnCq8VUI56oeg5wKFF6JReVfYYsdOa7H+7l
         6T90SUv8gfuMIcAUNq5GgomZKuCd/8Uv38IjL2nDCcZebc+Z7YA4Jb5c9sy2PElEWFXW
         Z2mw==
X-Forwarded-Encrypted: i=1; AHgh+RpXdsRhTQitsWKa2H0dY98mj52HoH8vj/Et1jJpLUzfODlzcjBI4yQjJR7/57Ul5FhMeodElJNAWfvBXkFN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1vLuMHJ3IjiixEiwzdpmTkdIAwf18xwFbMG4Olx8uKouTj1AA
	Svm0X3i8GRIr/ApR2wpQU3VJA16Q0R/NR8d7YnYPD/ZRQ0OyeshjjCvnqz9FIFldAiSQxG2oGMK
	LP7hVBqTaCMkzrbQMHbbuL5uCSuer2dMBIEt5COXwto2Dk1+rufwCK99iVKougnXLQf/Z
X-Gm-Gg: AfdE7cmrWyxNOKVnCGhN1pFvFXWIg6nd8m7OpzganqY6OQ+MkQ72/77bc3I9EQiGtwM
	yCaNZwkfxOCZ0kOL06i7mf13TpHbDGVeIB4S6/esXLH9GsX1Qxb765QTHV60FOGitRc5SlkJS0n
	OB8dCWpWQraP9veh2LKk4bTXdrPgM0VqqqFsomjF4htjY3Jk8bOsJ4NiI48Ll45tNyLaMlFLRnZ
	qy8deGrZyPWW6UgESlrOfGsbjHU9ImI32e/S/ycnu5LcvLGHCKryEtNsKpMid5dCP5VhXByfx1g
	J1S3hC5VY8ZNbzuTJ8XD01FiyW2Cd6e5RUcIu60qOtIUW7GvMctkVCh3bAjTwwwzIzGePr/8k17
	kVcNYs1ozdf3KBzEH/Ou7A+sEAoLaRHE8l06vTkt0Z7cx
X-Received: by 2002:a17:903:19ee:b0:2c9:d539:61e7 with SMTP id d9443c01a7336-2cbb9e30966mr98705295ad.19.1783336106625;
        Mon, 06 Jul 2026 04:08:26 -0700 (PDT)
X-Received: by 2002:a17:903:19ee:b0:2c9:d539:61e7 with SMTP id d9443c01a7336-2cbb9e30966mr98704705ad.19.1783336106028;
        Mon, 06 Jul 2026 04:08:26 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7871285sm47730685ad.64.2026.07.06.04.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:08:25 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/2] Add trace event support for GENI SE registers dump
Date: Mon, 06 Jul 2026 16:38:11 +0530
Message-Id: <20260706-add-tracepoints-for-se-reg-dump-v1-0-48bd08e28cf2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJyMS2oC/4WOQQqDMBREryJZ90tiNUpXvUdxEZOvplRj86O0i
 Hdv1AN0M/BgmDcrI/QWid2SlXlcLFk3RhCXhOlejR2CNZFZxjPJ5ZWDMgaCVxonZ8dA0DoPhOC
 xAzMPE+hMV42uykIWFYsrk8fWfg7Doz6Z5uaJOuyze6O3FJz/HhcWsfdOW8nlX9sigIPhuWmFb
 iol8rsjSt+zemk3DGkMVm/b9gOudSwy5wAAAA==
X-Change-ID: 20260630-add-tracepoints-for-se-reg-dump-c2c8bc875658
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783336101; l=2795;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=cPvVMpFS+a7vYWIpXWCc6esoPLFFshgEOVvwvfroPHo=;
 b=4urCsi2Dzrla0uUv277UYeiWoYnJdDhamQMVKgtiN7YfVCXje2GrFWNbiz8X5+jDHgwESJHPA
 tn4uuXLU6+7AhA5aNEbQmJZFZinZkXzgwQbd7vYuyF570glAh5BEm0b
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: 92lBiCHRktwGT7tIc78G-gaD2YXQ2dE0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX1JtWoihKJwlc
 qxLghX0TCYy75+Teh5PzVfRFz0dgooOPXZb/2Bc2ojS0YAPHy/Gs+QeXb/mzya81VvY/ka4+nvS
 ngoE5ioOWNXh5nTZHpMOPwJABHSBSgyncUIzxWKJqzIr7lHtxV8rB+9itJE93msiJGbU4iyOhd8
 R3xtTrn1O6FRRmnvOwEAV8Eg0GdTivHLHImfUy8W3fLHfn9ji9uXJymFhTvwdCuFpKDHDE9zCpD
 wzNwQlSQkSnASdJH2SuGr8K0dwCZoSWl4cuDMBz+6LQ+8wziLzv0c7M4W/kVQwfLXwa5ues+vwB
 DfAW10HnEv5CiNSEoS9OvsMf2HfC4TI5gi7xn/kt6YtWUvCdGTYkic2u5kRZiqC8KjCuVrNo6ga
 I+WzerxaW7JAeHtpGPyh+HYF9JEwGmdKeBi3poH0IDvdW3Vfk6GZ+4+apU6Z0ujpCut6G5hGeqa
 xqi9GezEwL7HBydVdDw==
X-Proofpoint-ORIG-GUID: 92lBiCHRktwGT7tIc78G-gaD2YXQ2dE0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfXw3G+P43bFZtg
 Y4JPNB+wrZG8zypSKGXyP8yFh2JoGcRDbZMBLWdDg+GxCoaxeLZs1MtvmG1unzbEgGUnSE6NyY3
 gNz2zi/3zSB0CIvoaluV8iZQzItWJBA=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b8cab cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=U0NaQwEGjt_KokrWucUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060113
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116759-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:broonie@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED6CE710997

The GENI framework is used by multiple drivers including UART, I2C, and
SPI. When hardware-related failures occur, each driver typically relies
on local logging, which often lacks sufficient information to determine
the exact controller state.

This series introduces a common tracing mechanism for GENI Serial Engine
debug registers and demonstrates its use in the SPI driver.

Patch 1 adds a new tracepoint that captures an extensive set of GENI SE
registers, including command state, interrupt status, FIFO state, DMA
configuration, and clock-related information.

Patch 2 hooks the tracepoint into SPI error paths so that register
snapshots are automatically generated when timeouts or transfer-related
failures occur.

Usage examples:

Enable all I2C traces:
echo 1 > /sys/kernel/tracing/events/qcom_geni_se/enable

cat /sys/kernel/debug/tracing/trace_pipe

Example trace output:
114.291299: geni_se_regs: 888000.spi: m_cmd0=0x18000000
    m_irq_status=0x00000080 s_cmd0=0x00000000 s_irq_status=0x08000000
geni_status=0x00000000 geni_ios=0x00000000 m_cmd_ctrl=0x00000000
m_cmd_err=0x00000000 m_fw_err=0x00000000 tx_fifo_sts=0x00000000
rx_fifo_sts=0x00000000 tx_watermark=0x00000000 rx_watermark=0x0000000d
rx_watermark_rfr=0x0000000e m_gp_length=0x00000004 s_gp_length=0x00000000
dma_tx_irq=0x00000000 dma_rx_irq=0x00000000 dma_tx_irq_en=0x0000000f
dma_rx_irq_en=0x0000001f dma_rx_len=0x00001400 dma_rx_len_in=0x00001400
dma_tx_len=0x00001400 dma_tx_len_in=0x00001400 dma_tx_ptr_l=0xffffc000
dma_tx_ptr_h=0x00000000 dma_rx_ptr_l=0xffffa000 dma_rx_ptr_h=0x00000000
dma_tx_attr=0x00000001 dma_tx_max_burst=0x00000002 dma_rx_attr=0x00000000
dma_rx_max_burst=0x00000002 dma_if_en=0x00000009 dma_if_en_ro=0x00000001
dma_general_cfg=0x0000000f dma_qsb_trans_cfg=0x00000000 dma_dbg=0x00000000
m_irq_en=0x7fc0007f s_irq_en=0x03003e3e gsi_event_en=0x00000000
se_irq_en=0x0000000f ser_m_clk_cfg=0x000000a1 ser_s_clk_cfg=0x00000000
general_cfg=0x00000048 output_ctrl=0x0000007f clk_ctrl_ro=0x00000001
fifo_if_dis=0x00000000 fw_multilock_msa=0x00000000 clk_sel=0x00000005

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Praveen Talari (2):
      soc: qcom: geni-se: trace: Add trace event support for GENI SE registers dump
      spi: qcom-geni: add GENI SE registers trace event on error paths

 drivers/spi/spi-geni-qcom.c         |  22 ++++-
 include/linux/soc/qcom/geni-se.h    |  38 +++++++++
 include/trace/events/qcom_geni_se.h | 157 ++++++++++++++++++++++++++++++++++++
 3 files changed, 213 insertions(+), 4 deletions(-)
---
base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
change-id: 20260630-add-tracepoints-for-se-reg-dump-c2c8bc875658

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


