Return-Path: <linux-arm-msm+bounces-118353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QrD6LaY+UWrPBAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:49:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B201D73D6B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 20:49:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="po0iG/4M";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fr5Wgln5;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118353-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118353-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E906730095E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 18:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1A337702C;
	Fri, 10 Jul 2026 18:49:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B1C33B97A
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 18:49:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783709344; cv=none; b=KWgcltd/jtJdF8mah+oa7/ZvkkRC9UGfSprfqzbPXTyl2xEkNuKwlqTc8Iln50RgUU7Kbxi3CeU0EtYUuqGAs/CE5riyx16lsISkBnUl37Yv2sldawgN1U/GtpEJGu/4r1cUGFSJpbDfjqAjJQO0ncVUtrLjxyn5N6nfRLQN+dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783709344; c=relaxed/simple;
	bh=m5E2MRgN8nNnYUf3x7te9EYrFhkTEy8MdD7OkkWaHR4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ED8ThwjOcr6wsUROg8y9r9dcOj93wlmbJuFgz0+n5UlZBuFeq/KBp30jcF4yIomjIdaeQ7U1vEJdm55HBgViiwr/2reTV8CFazUgIotDMtI6b9mH4df+hF55JSQ+zTMKpHhjIfIqzmIwEZ7Fs/FnaaGgY9Xy+0F6exdO9ia55HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=po0iG/4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fr5Wgln5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AH3fhF1443737
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 18:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N+yIFRVTgA1/L6OJr2cIQR
	+chz4VSwEmOlvU3TeT+yU=; b=po0iG/4MSy9q2uMoA6Xl6xu6ByBZSV3OPTQXxL
	9M3IFIToqA+b+/onPgcp9UbLyHpp94swzdkaYV8etZg978K6uBCgu8fBqlmMMOtz
	bNWDIDuPYIaG4Jed7/tF0jsTopAt/jtuTo/oeMJCrEAy+9k8H5nkIbx57OG78xY4
	dHIlDG5AeVmJnDg4Lt0Mvsy0OyFNhIpPUplkO/dDvOEBjwI8NCywn99HxVUl+V2R
	9p1fNMyobvRxlptJUtp5TVvpqmio0n6BXTb9xN5H4DS+p/uO2KUitTrrKnOPmT34
	ig9pm2ZgkOtltJIJNHRHLYLS0RTPgnK4/pi0yaH0GSrgacag==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwebxc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 18:49:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so1664596a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783709341; x=1784314141; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N+yIFRVTgA1/L6OJr2cIQR+chz4VSwEmOlvU3TeT+yU=;
        b=fr5Wgln5w57FxUzbkhjwp0f1mBbXxDLBXEmAJDamZOkr43SunK4O1pnftf0Ep1DSzT
         2yJ1Ub1P+WCosai+ni0Tgocts/rqUwvKUbBPrSrnTDUcQ4ObauovqVMeJKGw4uz9/D/Y
         sM/0c3X+r9watW02TdEElxTJRJouqY+OK525i+Jh15zQjLdeD88LlVtzKGxCtKIR1UA4
         IrG3Cc7QV4JFS7l81JwS7VFi6mj2px9cdZP1DDpC7Au12m2OPWsPjdzLoX46VexcZUOY
         JJUgojhxYdzeXJZD7f86AiK/9eQT8SiwBBlqAPxcLLJNIqfBFyqvT4nU3A2a5sWAZ/bR
         tIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783709341; x=1784314141;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N+yIFRVTgA1/L6OJr2cIQR+chz4VSwEmOlvU3TeT+yU=;
        b=WzxNXgDTAB/H2EP9WmZDbN/WNGihonpbluYpowZhJd2PQ8W+MSXKgAWwVGVkECUo8L
         X9ACgsyEZXOvIlubCznX76HzZUhtJVljyrXqYXE/YRCgJnFeHc/mu2HJflZpEC0gmk9f
         Av3Q4Fn+3YyoJCGJ/L16vDyLx4kfTdg3QN62i9ebCZs2x/FrSuEDJmLLteY/RMyUBn5A
         Nki7Pc3FpRZ5/K9mpnuhjL2yNhcC3ODYdB3ix/6GJ+oA7K6m+I5rWNw1Uw4JEtcCKQGu
         VepufYlbRLx88K+1QrIhMfhRTcB+VStQ9YukfJ0ogJoj1BNpXouNgenVqEVRizqpE6GL
         V+0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpoLOwYROmuhyspbCSqBVc1hvNcCJZQiftXsUkScwqp7lu3+8B2BQYt64dwsb7tAI67riQRD+JfJ5RD84Qc@vger.kernel.org
X-Gm-Message-State: AOJu0YxEb8/TR7GeMcPmWAIjLeclNqwXMFQqHVB9HpD86fvsdWLxSkBK
	00HzmEusAqbva1ZB6Iq1WfnEJv1rg7s+kYC3jHRIm932E9YiUWCt+8cW3N6Av0A+wikB4nrKtDL
	6A+1kEGJUb3xcdsv5VKhM4HeRnLec/EuH7AZ+ICYyHLJHrc6Im7Hmf5nrt+0fBBoO5lyV
X-Gm-Gg: AfdE7cm0MoPWv1dE7PVU9ZocXTxf6LEPSTdObnnBOEHWFFivGbwgWKYsO03wTty3KCj
	pJxoUc48HyAK+KeUY3QwVab0c8IxMRN9ZPvs7qwO9ds+1JL0nDsD/9VOTipOObOenN3CVsYLKBY
	TZsxjUuDEX1QEsHancI150Q9pggfxRe7jz5dmu+ANVRyEYoFd7TliaDaZ6Gix6D6yZeS4NdZwyq
	zquOoZFxLnp6SnIWjJ7w4Zy3NoJBVpEoeAM9EgSqTh6OZQM42Syc3XjcNa4wVHSug80OUIPsO9j
	ZrZlXQoYVMwyV45QwerYYcCG/QFRs6/zsem1oQfi6xdr0T5cYc1Suar/QjK8f/MhRmg5zv/my3j
	Xfhx04Sua87fd7jTmgPgCOG0IP9ZK8JzFG/+YOXBD2thN
X-Received: by 2002:a05:6a21:6190:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c1104e1b6fmr250393637.31.1783709341359;
        Fri, 10 Jul 2026 11:49:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:6190:b0:3c0:b766:74f4 with SMTP id adf61e73a8af0-3c1104e1b6fmr250361637.31.1783709340788;
        Fri, 10 Jul 2026 11:49:00 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d7c8bsm47226919c88.12.2026.07.10.11.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:49:00 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add trace event support for GENI SE registers dump
Date: Sat, 11 Jul 2026 00:18:40 +0530
Message-Id: <20260711-add-tracepoints-for-se-reg-dump-v2-0-ca1e9ba62359@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIg+UWoC/4WOWwqDMBREtyL57pWY+qJf3UfxI95cNaUamxulR
 dx7fSygPwMHhjmzCCZvicUtWoSn2bJ1wwbqEgns9NASWLOxUFLlMr9K0MZA8BppdHYIDI3zwAS
 eWjBTPwIqLGssiyzPSrGtjJ4a+zkMj+pknuonYdhn90ZnOTj/PS7Myd47bYXM/9rmBCQYmZomw
 brUSXp3zPF70i90fR9vIap1XX+Zq+7z5wAAAA==
X-Change-ID: 20260630-add-tracepoints-for-se-reg-dump-c2c8bc875658
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783709336; l=2999;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=m5E2MRgN8nNnYUf3x7te9EYrFhkTEy8MdD7OkkWaHR4=;
 b=66s6gBwmbvNKkRPXr0SmxV8x6YcUYWwDZ7Q8g2Hwm7IP1oGuxqtqEXiE50xZXsJFtF4Q7ILLS
 h5zSes8ix2RCj91WOzUTspZi/u2lZsWU6sRAby6GwTwHkJ475xtqA8K
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a513e9e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U0NaQwEGjt_KokrWucUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE4OSBTYWx0ZWRfX0RM7/2WwEYFg
 V6meNStLAirNwXNLDc9M1x5ZnBqN2wO2YRIPcli/huz/Npj8zkqe07AC+QjaVMINNdIgdpSlXL3
 PGKJaqhFG2zmweFiv+UhaHc1IG1ehFP5Joy3F+Wb++/xKjoCjX+qTaps8ajYJsgzt4AB5oXr9mK
 sVTFTtDiLJbMwAIlYSusjoO9WudggUpHasMnBqfpoNWS++ZuxI4XF+H67DZu8yfLAnLAv4n6ll/
 Xskaycrqbh/trvdU8v5v7C+kSD9no8Uf2cXO3i+2IFw4zVUyAHJWl4yW3FexoUinmyn967SIc0b
 cbCrQoqeKbgIXu/NCZm+42wKheoinSuj41KT9kOH80sHp3PUTtNWmrbv3cO59qbERVTENhLkcAL
 wbFJei+cHsqi6wlSzMw1BPIXDfz/dVIoz/e0sP1wBE4N9mcbdfedxnL+TKSySf88yjjFbUnO/Kc
 +WyPKFQCr9HIIHG3b3w==
X-Proofpoint-ORIG-GUID: TGZqMpx0sO2PkWaLDmE4_FhllPAF7Uo8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE4OSBTYWx0ZWRfX7cmSBx1+p4Er
 tynxH+CTZtY66uk+TAIgE6cea983OoqSBgDMw6Vk3Ps12vLue2QPbTZfpMWaKRzSn9RzcQsqRE+
 KEPeQVA6ne/O7RO4d7ehblj729REMSM=
X-Proofpoint-GUID: TGZqMpx0sO2PkWaLDmE4_FhllPAF7Uo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118353-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:broonie@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:praveen.talari@oss.qualcomm.com,m:mukesh.savaliya@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B201D73D6B0

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
Changes in v2:
- Updated SE_DMA_IF_EN to correct value.
- Sorted hearders.
- Link to v1: https://lore.kernel.org/all/20260706-add-tracepoints-for-se-reg-dump-v1-0-48bd08e28cf2@oss.qualcomm.com

---
Praveen Talari (2):
      soc: qcom: geni-se: trace: Add trace event support for GENI SE registers dump
      spi: qcom-geni: add GENI SE registers trace event on error paths

 drivers/spi/spi-geni-qcom.c         |  22 ++++-
 include/linux/soc/qcom/geni-se.h    |  38 +++++++++
 include/trace/events/qcom_geni_se.h | 157 ++++++++++++++++++++++++++++++++++++
 3 files changed, 213 insertions(+), 4 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260630-add-tracepoints-for-se-reg-dump-c2c8bc875658

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


