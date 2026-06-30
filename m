Return-Path: <linux-arm-msm+bounces-115261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yQ64DiFcQ2oAXQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:03:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6916E08F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:03:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m0I5zEQe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MoQMELeG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115261-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115261-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0667300E3AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA96291C10;
	Tue, 30 Jun 2026 06:03:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E667F273D9F
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:03:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782799388; cv=none; b=K20UMo4mpl3UQ4AS7VeGDYP72PbZ5l9hLOkUL5sfOKRlQlzQ4OdDLWpt/OUUc3XI8o+MTUiUI0yN48r2Vo2+Dm7ISCbrrZxMURYoxa9e0U9LAEK6xlunvPUva1Lj34a1QeDafx4/GogqlIrgB67JB3AWkERZBuf5b15qc3UyyRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782799388; c=relaxed/simple;
	bh=a8t2wkRvLa1JchCqybi32unoLJ9yXcc54hmZVUkgubQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GH9DAU/MZ6TgwTKRHqBdr9J1yfZFjc+UZ90C6enqbl6odN+pE5LK/K+N4Au6RaQ9vr132KmTRNjpDmhFuXZPg54PMVfevoCsr3mJi1fcZN9+ge6+G3moYt6KZk50ivmr4nw27cfP07WV/n2lEGITpwV0ePFNFfYRGWdctugs1Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0I5zEQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MoQMELeG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5cMu51014014
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=shfeln5igxAy7CPuXN0OtP
	vgBHP3xlnyt4F/aOr5BIM=; b=m0I5zEQeMHAIqK22vcOV35YhmoYgMJidyrCpd0
	wrMDmSlAxNYQPZgT+DwtkOl/GmpNoRvOKldyvZigzAdzN4YMOKRoJVP9nEmcbeLs
	ZfWG6KIX421fmm8eUJjSwake60/8ETJVzSHJDWK5JVkg0a9LZ7/oafcVuwFExShB
	5bbUFSSCw3qgwwE5PLboa7VB83O1HwoxVLvXd5z778CrbLGE5Bdf5wNM2sywsaWe
	6Hxhcj+fEBt8frHUdwO0x7O1XvuJWpHPupE+7PgELQsM1DrSktDTGPeX8VDumsBc
	yZXcz4S/jZiICX0gZcpmovURYbOOLa4FyO2P7aPUZu5d/LUA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5rjvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:03:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8478a1ec69fso1350861b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 23:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782799385; x=1783404185; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shfeln5igxAy7CPuXN0OtPvgBHP3xlnyt4F/aOr5BIM=;
        b=MoQMELeGUNPwcynq1XcW3e5QwShW2ZbO44tlvVBRNa5Ye2Vdys3H/LqJ+HR2xhPpVs
         lP8y0PcaQk+BWGGkGp/isC7hwcs9iS7WtclMMF2J8wx4wJsyX5QqkGXqIIi2+vjn2f6a
         lEZSHB+dEMuHPvp33AQrLJXyi7L+Cklt4k6gAhlRRsqD6SkE0Y5zdhtJBY7UO5jws1FY
         dKU2ybA5djt10eiM0SxuG5v0wliLA4sED3zSJUO9DMSWzWJdBc7IXIH6tftgiwLebws5
         s0fsranqDj6BebXmNHkoy8bBE0AG5qawtnSUAPBB3a4cgGAodXAKdij8Ax81uVMtbC61
         5QGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782799385; x=1783404185;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shfeln5igxAy7CPuXN0OtPvgBHP3xlnyt4F/aOr5BIM=;
        b=tEDvFBtO/5sVoUXG7/PtcfFdfW926yxL1z6d6QmAcZgHJhNrEiHsArqbGWMsZ050t8
         NFf/Fw/SpGLwYnjOmeQu4rSzlhScicf7v+2bXH4+oDtnMmwVN4pV+uptmwxO+mEvWJlM
         x/y6J45PxaOabZ+ktobty8F+rr/Ao8196uLE58gNuBZrPm41VDBw++8f7M2i1ef9zdkt
         i12pff+wMqu9uzSaAtHEU9oO92ByYFbNnYA5s6C3xrIq258WsErXEOdU+7ztNtEd45oM
         OdutEJ5NAAfGMrpGjKdE5ywOUDO6tNu20YI+5zrPUZMtCHMr9+mni/gsJHCKBNTh6d+m
         5N/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr9WGu1YcjnujNAtBx+2F1u03yMvdQ61712PmX7K77Rmcro9JnOyJCGKbmPEZzf0rsksKKSo6/1n93Jif+t@vger.kernel.org
X-Gm-Message-State: AOJu0YwqD+wAx9VuTvDict7+IQSDs3b80EKAPApmuZSCD/ANXeY3vyxj
	Rblv6XwplieIu3OXuqLmfQ1R9fLKwTn5JJlW1hn99cthazPmWzpPZl/VyER/2fBCd0yrOpzR/1Z
	9uJF+dleVix1S97jZ7t2agkuOmHCfLJs3lqDxVAZK2CAQdQetQ41kpvD3xMLz6sj3F2w5
X-Gm-Gg: AfdE7ckk4yC4JExWAaTDUFA1klDwayBDSt5Xi+6RU/pTujnGZOmZAD2gyYrwNwdig6Q
	989862hb9j3ytzkySpSMevsRc9HNksKcd3dlamhPm7eVXEPFY/qcBFOSt4pC4rjM9ZoQRSr/9Ld
	8QwZ69QatCDq3czTIgWY3a2usWSHQjhdlp34Q5CkmBp4xv+1qq8wMFyy0wBDcUXf11K/vHTgOsc
	3h2ck9Ztiu0oHkO5pRIt1Fqiw7LM6aYqZPuLeOpCAe07rE02NiNtWfrSYtQoJYdqB3vPIbwTKDG
	IxR+HVkiBT110v6Jb41jytR/Pl61f5CJuIQjZ10X9kOFu61Leb425M2uskndq9lFePcjWLGpey7
	BfppwP+0zfqaKl1fQfxjKMN0KtdThBMMgNqmvLRF++Wk9
X-Received: by 2002:a05:6a00:1745:b0:847:8499:bd with SMTP id d2e1a72fcca58-8479eef1340mr1903065b3a.24.1782799384831;
        Mon, 29 Jun 2026 23:03:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:1745:b0:847:8499:bd with SMTP id d2e1a72fcca58-8479eef1340mr1903053b3a.24.1782799384278;
        Mon, 29 Jun 2026 23:03:04 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a00029d3sm1112600b3a.20.2026.06.29.23.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:03:03 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/2] Add trace events for Qualcomm GENI I2C drivers
Date: Tue, 30 Jun 2026 11:32:44 +0530
Message-Id: <20260630-add-tracepoints-for-qcom-geni-i2c-v1-0-474cd6cdbe27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAARcQ2oC/yXNwQ6CMAyA4VchPdsEChL0VQyH0RWsiRt205gQ3
 t2px+/y/xskMZUE52oDk5cmjaGgOVTAVxcWQfXFQDX1dU8ndN5jNseyRg054RwNHxzvuEhQVGJ
 sW990x6EjGiYondVk1vfvcRn/Ts/pJpy/Ydj3D1zQnkGFAAAA
X-Change-ID: 20260629-add-tracepoints-for-qcom-geni-i2c-33d14584228b
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782799380; l=1510;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=a8t2wkRvLa1JchCqybi32unoLJ9yXcc54hmZVUkgubQ=;
 b=i8JM67rWtGlc2IhNVMUH3n/LFK4bOHB1dwBqzGMdDBS8wyLV3jiFFlUL8p4voEzKXFjmkg3Cb
 GhkFt0qrdL0AfYr5wPZn5JGzB/joe1LFWrbIIKLagtOa7N7Fk+DZcCQ
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a435c19 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pfqdL_FptRF-L44MAtYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: glymAlhUtjTYpxFW2vNB5iV0N9FvfeFS
X-Proofpoint-ORIG-GUID: glymAlhUtjTYpxFW2vNB5iV0N9FvfeFS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA0OSBTYWx0ZWRfX5HogoKpLkZkm
 vhcr+LZrGnvSKjASMK9dabOxid/mVlqSuwJ/OstbsN0ZM1dCYK55gaCOoZSxMxsnPoNij97rrC0
 FjDhtGG4uQ+W2uN8tdgwc3w56LQB9tBXdKh71kaqx3v2M2qW+xV1eVv9fVwHNQdUsTvKwkZD1O/
 EHxTwAAkNv1zW2mh2+PBo2b/44rASJ66js4apOTH89HaXjHe+KsBEQcizSYZ2v/ZfV9tOD2lyV2
 wNtXm4v/+eU4WiSvhDuzVb3YS/RilkcSw74Jbp74wHEK+kWrPTDoYiQ5b5YARMvw8dMTbxyzyqW
 4YhxiZZ1qVs1hwVgSUGeNSv7Tui20YJtD5O+opU/F0nBju2CcKucfEGq1E1WDuSZz41TNfkun0c
 3WTj6odd5xWFVG60d/RpHyTpNr4SIvkYS5lBaLh8nSCcmtcr1DgFT2DpqYiXlw+PhqpZ5wvMHvM
 MhdzLzmTAxPz0doZAkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA0OSBTYWx0ZWRfXwaAHe26ogoSR
 s9TDzrmcJJK6OZLUxBp1qQUnk8mdCj2qX+AasNaygzEIUqRupwT3FRhLPUOlUBjKt9zrt+UQGQz
 +KpdYVQ47zrrDZy4+ymo1/qTRlYmUAY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115261-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: CC6916E08F3

Add a new trace event header providing tracepoints for the Qualcomm
GENI I2C controller.

The trace events cover controller bus setup, interrupt status and 
error reporting. These events enable structured debugging and performance
analysis using ftrace.

Usage examples:

Enable all I2C traces:
echo 1 > /sys/kernel/tracing/events/i2c/enable
echo 1 > /sys/kernel/tracing/events/qcom_geni_i2c/enable

cat /sys/kernel/debug/tracing/trace_pipe

Example trace output:
79.737075: i2c_write: i2c-11 #0 a=057 f=0200 l=3 [00-00-3f]
79.737075: geni_i2c_bus_setup: a90000.i2c: clk_freq=400000 clk_div=2
   t_high=5 t_low=11 t_cycle=22
79.737084: geni_i2c_irq: a90000.i2c: m_stat=0x40000000 rx_st=0x00000000
   dm_tx=0x00000000 dm_rx=0x00000000
79.737201: geni_i2c_irq: a90000.i2c: m_stat=0x00000001 rx_st=0x00000000
   dm_tx=0x00000000 dm_rx=0x00000000
79.737211: i2c_result: i2c-11 n=1 ret=1

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Praveen Talari (2):
      i2c: qcom-geni: trace: Add trace events for Qualcomm GENI I2C
      i2c: qcom-geni: Add trace events for Qualcomm GENI I2C driver

 drivers/i2c/busses/i2c-qcom-geni.c   | 15 +++++++
 include/trace/events/qcom_geni_i2c.h | 82 ++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
---
base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43
change-id: 20260629-add-tracepoints-for-qcom-geni-i2c-33d14584228b

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


