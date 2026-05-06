Return-Path: <linux-arm-msm+bounces-106174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BWVOl97+2n0bgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:33:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 533D84DEE2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FF5C302A6E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245DE4ADDB2;
	Wed,  6 May 2026 17:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="joNp2DaD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYqsXWHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7819492502
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778088594; cv=none; b=Ak08Mz1nYteHzxXzlffgpwyRhcekY60hHo8pzzy2STIERvt/HpAKsikKBBwEYsnhenO8xhWusqx1//6ZSaEkuhlCV0AA5yKuqOK3uQtu6r8almAYHTWhlodY0WMwXIf8Cjl4VV1cnE+pgVABR4uYY+rtGAJhOeUFaWvO8McIIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778088594; c=relaxed/simple;
	bh=3JgXi1HK1tKOS2FgWwES+VKeMEfmbOZHDIeuXblGSrY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RVFr5Kc1jJGttiJmHpKm7G7BaJ7691WsHmoOahpuyTTEHeU3noZSnetnFNVNxI0Uie7FpSjDvTyfBC0lnPp3iP6n68TvghCdLPMoZTNIt9I0H0NKePEH1hePg7fuLevMjIxNA+twtePCFFB9KVeYRcu4/GQ88YJvUcRxaraY8tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=joNp2DaD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYqsXWHO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646C5K6h3036458
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xo2tEHOhCkdfyg66wDwPL/
	kmn6HqLssXnGU+DeV/8ww=; b=joNp2DaDI/zmuTFjLDXNeT8js2pv4Eb6GGoz+B
	51Ff5aGXYszrhG5vmS2EF+QMGx4FT/ByK2fjYyBsgeZSfCq2kzpsJ6XeiYeuMp5r
	TMRQRtuRy+8Yv/OhhSp09IJdFnBIp4jMqM4M83rr2JhzUWPPFCfSYjfZNnV79lzg
	0PaaO/TTOi4NQ2nVqByFEhyC0ScHhXY9w9XmZYEwYYOmgrgRH37jq2+01hGO7YLr
	GewDhjdkcB9Yev3KqFOdPKQlcIHd0BKuSEv9wuAAPvtmyyeCD+mBxH1pDgtP8pB2
	3Shu6BTh5ejjDS85Bwj+wIx0S7WNb3egHuXxXo1E7BJnRA8Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf1900-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:29:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3650a4eb60dso5075561a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778088591; x=1778693391; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xo2tEHOhCkdfyg66wDwPL/kmn6HqLssXnGU+DeV/8ww=;
        b=NYqsXWHOSv7RfRnQy8REKNpelsH5K27OpeCXl4V49EnvX2ioD5W+aOa3oU6oqmjSqM
         voWFglcZRqk1BBcd+o5F6EslndtNXsOZqwjH6ISdFVeZZ41Q7ofiWZi4k3fcBF+Jr/Jm
         bbDDC+Tx1IS5gIlbYLeBYkZoEX797DCzcRuV0VPiKmKElw+dZo0lb5GH0rt5CUMHlHlx
         gGFc237SczLdcGXMVZELSV9smRA/1PTSp44YxGBiC2yct8UUDcq6ITi+LVJAZh9YdVqo
         ynHdNVkxxqC72xeyvXmyXkdNRbTk/DTmLUy/AK5XEOp7Y0rl5mIqPgKJS2ljchywsDE7
         8deA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778088591; x=1778693391;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xo2tEHOhCkdfyg66wDwPL/kmn6HqLssXnGU+DeV/8ww=;
        b=Ono53vEQLUGdH1mhJtvXOL+3kwSHu0ctm2+UpfMGYKG/HMoIvsJL5eYrJsKBSHtB2I
         kjfy9vKAlsGe/QEwRQJ/EKUDLGqPE0cJOf4ovY5c4HVP86C1japs1AoaU9qEIpiZlb6Q
         2jBZFTAbkiMg5wlu2qwfrlOdCc+Frur2zh3+FbbHK+MxYxg4VkkjvZfBfYiizdwIocBl
         8gnTTzzxS/zE1Bhm62lcrio3ERTev2SxZVd3KaaMFPQRRYZyu5SY7uLWGpzPUIaU2V9K
         lTcnOvMFiABapoB/Tpz4sU3RuTVnRHYYu4onS7hjhpAokDpugtXaqGG9px+FS4EZCfQO
         kA/w==
X-Forwarded-Encrypted: i=1; AFNElJ90MlFeXVzjXqJiwI85/eBk8lTVdUphGYCNO/OV5p3WhIkB2fGOhzTYUzBoaeQ012tSCMls3E6h1CZk4LZ9@vger.kernel.org
X-Gm-Message-State: AOJu0YxHFXPPmTTvNvIjDgrJYir7GLRig28sI14MQ+JAqXO3XvD+CMzD
	U78i1ZyyVSKhHjSDgTPgafGaIowRL5y7PqJtwqmWLPv+iBX1MAqEzOzC6XD/cLVnCGbowifZcos
	7C0FHpj4lFYlL1YdYQCxyCjv23RvyUhUHmPygZkv5Sr/pNBmsMnqSGyD15XQqkXw0VYLC
X-Gm-Gg: AeBDiesC1MXT0a3scZr3we7/CGKdrDFbWCM1823DsFTShdHg4lZQbGpYJyZWzwwIhuq
	ubKyKJLbXoqN7duqKgPEiz9fp7KaHvBhBvq0onSPYDaBUH02aUEub3CKRFM2LgNwA3jFxecxJNT
	hCt7P6CTRNZKqh74JXutpAvqHcPhRhpsnWNf7M40CYTv3hsLBFa27518V5J2fBCXlfGnX04Ud/7
	sLJzZ8wfckYqTQ9f2WxJTHpYQFJXajCsBszfi6gYdyHdbK87qDsQO6gMysWrTRGU1kUB7AAB31v
	25L1A6aOt9AA1LQrOihis9RbbZIXYlnGERGZSpiv+Juaqs7rGG5mRluxel74K4S5xT1gIbvbgzJ
	+m9x9T0cPuDr2+YEwvRoyZFE2on9pNQHYl0fpWJTHilhhA6W2Gp2822ghN3HzuSeVxA==
X-Received: by 2002:a17:90b:3d0b:b0:35f:b4c1:91f6 with SMTP id 98e67ed59e1d1-365abce2cd4mr4707613a91.10.1778088590514;
        Wed, 06 May 2026 10:29:50 -0700 (PDT)
X-Received: by 2002:a17:90b:3d0b:b0:35f:b4c1:91f6 with SMTP id 98e67ed59e1d1-365abce2cd4mr4707579a91.10.1778088589953;
        Wed, 06 May 2026 10:29:49 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365c25f8cf9sm3370143a91.4.2026.05.06.10.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:29:49 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/2] Add trace events for Qualcomm GENI SPI drivers
Date: Wed, 06 May 2026 22:59:41 +0530
Message-Id: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIV6+2kC/x3NMQrDMAxA0asEzRXYbuNAr1I6GFlJNdR2pRAKI
 XePyfiW/3cwVmGD57CD8iYmtXT42wD0SWVhlNwNwYXoRhcx5YyrJuJWpayGc1X8Uf3iwkXQmiD
 f/WOcKIQ4EfROU57lfz1esHl4H8cJhAqrvncAAAA=
X-Change-ID: 20260506-add-tracepoints-for-qcom-geni-spi-e31457c2267c
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        "Mukesh Kumar Savaliya mukesh.savaliya"@oss.qualcomm.com,
        "Aniket Randive aniket.randive"@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778088585; l=1724;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=3JgXi1HK1tKOS2FgWwES+VKeMEfmbOZHDIeuXblGSrY=;
 b=Bih431PHlo4jh7dQFyazOoJmUt3v017ouzPOOKfTB0Tk5csJwh3RBkfw1tz9QHHC8c/DcFRsY
 G9vi+UpKevLDt9x6OUsdEF9pgpXQDgi1knsuMrtvLqqQZzAQ/gi3PGk
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE3MCBTYWx0ZWRfX7JHL9eAgU907
 OIb/7Hv0ueOUg1GdCfC7AVWJBceK16oUDTH3fCPlMIiTJaiEeTtRQuCrvRvFoOrMayUizjY7CvP
 Y2uWLN6ZdljL4OkV6hxOkm8ZD+h36dULNfAcoTGwb66hX224LhXGxm/1gXA5TQ/AG65HMM9dMPq
 8slRUuN/o6CI7ErZ0ZiIj6c7vTJhMaUgh3mxWkfDXk2qxAKf7nMHx0gU8sLxkXbWtXXlTwNM81P
 NDj7RdvIvmKIdh1hLZlCbnFCFvC1tJkKUR3YEhOm2RGlotNpb6wiLrMBE8c6/ENY8MzueNZ+I0j
 IhJs2wZhg/R9fSkIFpCF+4Z0eIKtIsaYpWj/okoxhb6qNFB4s+Ba1fy58NLl46o9Yhn4PYcD1Gn
 w8x4QCs37d2WMtKB7orStcWQ2GJ+BJtvYbKh7Ut4n2QhztTaX9c7i4LqAG1SQ7ngmJofuUj59pG
 8w2G3YKGc/FkBl5Q5QA==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fb7a8f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7orm17Ck4mEi1eViMI4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 4GEn9YOhNYKnDr_zE2WHhpm8kB0LSlbP
X-Proofpoint-ORIG-GUID: 4GEn9YOhNYKnDr_zE2WHhpm8kB0LSlbP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060170
X-Rspamd-Queue-Id: 533D84DEE2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-106174-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add tracepoints to the Qualcomm GENI (Generic Interface) SPI driver.
These trace events enable runtime debugging and performance analysis
of SPI operations.

The trace events capture SPI clock configuration, FIFO parameters,
transfer details, interrupt status, and actual transmitted/received
data in hexadecimal format.

Usage examples:

Enable all SPI traces:
  echo 1 > /sys/kernel/debug/tracing/events/qcom_geni_spi/enable
  cat /sys/kernel/debug/tracing/trace_pipe

Example trace output:

71.364028: geni_spi_fifo_params: 888000.spi: cs=0 mode=0x00000020
   mode_changed=0x00000020 cs_changed=0
71.364054: geni_spi_clk_cfg: 888000.spi: req_hz=10000000
   sclk_hz=100000000 clk_idx=5 clk_div=10 bpw=8
71.364095: geni_spi_transfer: 888000.spi: len=16 m_cmd=0x00000003
71.364096: geni_spi_tx_data: 888000.spi: tx_len=16 tx_rem=0 data=56 f1
   0d 95 c1 09 33 d2 27 e7 ec 9d 9c e2 11 ff
71.364121: geni_spi_irq: 888000.spi: m_irq=0x08000081 dma_tx=0x00000000
   dma_rx=0x00000000
71.364126: geni_spi_rx_data: 888000.spi: rx_len=16 rx_rem=0 data=56 f1
   0d 95 c1 09 33 d2 27 e7 ec 9d 9c e2 11 ff

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Praveen Talari (2):
      spi: qcom-geni: trace: Add trace events for Qualcomm GENI SPI
      spi: qcom-geni: Add trace events for Qualcomm GENI SPI driver

 drivers/spi/spi-geni-qcom.c          |  17 ++++
 include/trace/events/qcom_geni_spi.h | 147 +++++++++++++++++++++++++++++++++++
 2 files changed, 164 insertions(+)
---
base-commit: 1f5ffc672165ff851063a5fd044b727ab2517ae3
change-id: 20260506-add-tracepoints-for-qcom-geni-spi-e31457c2267c

Best regards,
-- 
Praveen Talari <praveen.talari@oss.qualcomm.com>


