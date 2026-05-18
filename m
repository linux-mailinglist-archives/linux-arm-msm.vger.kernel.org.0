Return-Path: <linux-arm-msm+bounces-108248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNYZJPVFC2rgFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:01:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3150D5715DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95CC23000B0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B642C364935;
	Mon, 18 May 2026 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LuyMlTW+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bjnbn3qd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0D22773F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123691; cv=none; b=gxx8B5GhP8CsTgJAvIaT3zoJ1qWJsJg36YqUaVArG8UkkjW6gjem42DUBhwSYEeKsl8xPWf4l6liYdBD29p7e02vge8cUW21K3BUAA7ZBq2QDpznRvJUwkR8VrfoRr6ZAQDZptQGGIqP6eP2GQvky+laPWWnoXt1khNTWKylfhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123691; c=relaxed/simple;
	bh=6masZgFWLsY1wGZmtQvxBGszzHLlTwVJbZ6sdXDkOsM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IwHTo98xivp9JLiERtgPFBaiBRnpCL/Iyd+qCpxc0wwOxji2gv1sffBCESGgASCp8iKHCbH/OU014hWn4v2KiMWV7HI7Uyxqz6K7mA88an3zDydRSyzqGQ91vS4S6MowD472rZ//kSJxaiqrknxGbmJinu2QsioqybpH822FnYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LuyMlTW+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bjnbn3qd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEnKLI2975535
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GgyL6RTmFW5Y2UChe6AMki
	GlndhNLcMHYwQDILdaz5c=; b=LuyMlTW+lbGX/22M05x3nUf6g9ExcU4Hrgzpk+
	rPZYWxwgTJt7Bgn2qBhK/Vub5pIi8yTorAiTvoVCMyCaG2sgqFNpbW9xG7iESe7P
	eXIvlwLSp+O05pu21SsOKlxRjvVevzy7gdtAOAmgxzQvxFE+KmuT0Yv+WFXoHdK9
	e2ClmNEac9hWKDP5qOygGqF7rd+ddWBBgFfAtlhBojXXkY/FNkCHoxZurO5WOMct
	oRPDzFGGMpBlsM8v7IFar6rraKkBfrDGrekFrigOhQHPbntLirZRqG1oOZIROrtw
	EKkMkuQ8sWn4mqV/xMtDQDhNDjQ/b5BqoZTnXQRlShfFiGRw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v48gf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:01:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babc42244aso64962935ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779123689; x=1779728489; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GgyL6RTmFW5Y2UChe6AMkiGlndhNLcMHYwQDILdaz5c=;
        b=Bjnbn3qdGx3n4/DzWh4CynyKQzvf8WsaUfu9TmYfBjagOBsoRwCE1o7U9jlZc3ry9s
         YoUXMjEJjjq1h2teTXwjZa8lziN9Bh6rp/7T2Y8KrYOVE2jhbkaXqPD4Hfapa2jjc4GS
         gqebiS2FfSOmbc55muCyeYDkFLgP9BKh3WgL7gvhF5Mmr5/G01dhsONJpCWylsHtmHPY
         KlHMUbJ1c64+g2k/Ff+M4mf8L8xuZ3QAbjy09tWqFz0+yaAKCpp4L/J2HpFcOdn6sgvC
         3PxUhMBfaAZylmLr1PtB/BhKKNLwUotcZvapr0yajUT51Y8uZBswivzklO8S8v2gfj4K
         KMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123689; x=1779728489;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgyL6RTmFW5Y2UChe6AMkiGlndhNLcMHYwQDILdaz5c=;
        b=TvLglTp41Nlbxw+/hGIA29IOXSZfZwbYMYus7LvbZZYmtuI2jqDp4pWarJzXQeTGrQ
         9whXRANnAQjxxoKS4XXjwUI8s/GCRBXw6ehHj1AXsrwEJ0blW85x4n3nZ0PbHw7qpLLl
         DZbNkaiJt/l/7skotYgzQM8L/i0KNRCGf47khoTWzTsANf64QWuPVJIBDVxGpm1QIlAJ
         VFGMsRd6jb5WgiOeQ89CHbhA8nRQLxQlsw4mQWb3vP/LlgwibR0TqJJFvhESRo3IFpa1
         lgJoZmM3OtAoB28MY3yvWQ53SsOuB9BKQheyKSR1bIzOTsU5lBFhWnrtZwoIOC4HKM7u
         On/w==
X-Forwarded-Encrypted: i=1; AFNElJ9cV1VjYsxsjss5VoX2r6yfwHAGDU9QJr64b9+iflsybzLh0/AH93Ca6ernyAkS+XonZKSae1qxfZdCzgBj@vger.kernel.org
X-Gm-Message-State: AOJu0YzfTwbOntV5xlL3nJlrs4cyxlvCXcpN5iD6o6uai6KJnt2Z5dNm
	y22A399fWHB0cIwIyQZR9O9yMXmFMp76d9oEkBVNIQ4hM9VKSl13efHt+HzAPQdpSIh4Ulp00f7
	5/mfohoz2rlkrxrGcfy8nu4rddWVMacd4IbM/EGQm8erPwbyIwW2y4J3Gov2FBS3HpauL
X-Gm-Gg: Acq92OFcbmMgssO4Vi7MZrhlMLuCT8zkTzi+bQrf+Q3B4M2FI8sYkArzIewSbDSG78Y
	GfcHaVhm2m3aLfRZBS0+W6x8RoDRP4usYqYxx3WWsi5I8TEODLcX68n8KMGUAxXmDp1OYRyvYFc
	lSdNMoZ6I/7CcrozC7vyPYU3I1l3A4QsvszYtfRntBNVT7h1T6qhZqVLLqRgx5iOIwL7ICBFQJv
	Nv2Xzb+w9mJbRkuKyU8210gvVLI6syOpRs7y6jkNSq2x1EZKN4q84l3ScovuZE7RY/RjLw4IBX7
	EWA2YsbNz13ytrs3bnLxg7DiFc8veDSKa+9C6EUAJdDGhYBWPjFU0mJT19X4rGya25kJWxgn4w6
	EnPoYcGgI0j9HTl8x0dsJqfwNXcZWv9sq6UgM0X0bX4RCy1Xy5R4MjlU=
X-Received: by 2002:a17:90b:2248:b0:368:341a:a925 with SMTP id 98e67ed59e1d1-36951c97685mr16140108a91.23.1779123681431;
        Mon, 18 May 2026 10:01:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2248:b0:368:341a:a925 with SMTP id 98e67ed59e1d1-36951c97685mr16137814a91.23.1779123662967;
        Mon, 18 May 2026 10:01:02 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695652466dsm5783808a91.0.2026.05.18.10.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:01:02 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add trace events for Qualcomm GENI SPI drivers
Date: Mon, 18 May 2026 22:30:50 +0530
Message-Id: <20260518-add-tracepoints-for-qcom-geni-spi-v3-0-7928f6810a79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMJFC2oC/5WNQQ6CMBBFr2K6dkhboIAr72Fc1DLAJEKhxUZDu
 LuFlQsXupnkTX7eW5hHR+jZ6bAwh4E82SFCejww0+mhRaA6MpNcKp5zBbquYXba4GhpmD001sF
 kbA8tDgR+JMBUZHlhpFSFYdEzOmzouTcu18gd+dm6154MYvv+Yw8COJgqBhoshKzF2XqfTA99j
 7M+iYdtkSA/xEL+IpZRnN5EmXFVommqL+J1Xd/iYFGIMgEAAA==
X-Change-ID: 20260506-add-tracepoints-for-qcom-geni-spi-e31457c2267c
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779123658; l=2659;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=6masZgFWLsY1wGZmtQvxBGszzHLlTwVJbZ6sdXDkOsM=;
 b=ofnL7qBGmEtascjrH5VLMbmyqsyIludaIGF85epr6GyAE/f1f2Se5CUX+xK14cKZQBkSMbwx7
 aUKHwQO3ROQDj/7/WO3TYUkklPydqQxVytX4ETTjDYaKHYTEH0AXlyk
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0b45e9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vdy0y8WXZQco5u0MrGUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: OzLDPNsf7-njn7tTncujmT2M8RAjt8HY
X-Proofpoint-GUID: OzLDPNsf7-njn7tTncujmT2M8RAjt8HY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2OCBTYWx0ZWRfXzJG+TdjpVvoy
 uP/ERFOZReghvxPjg8d5nu7l2XD7t+zRa1ARJE7dg6lSb4metNA3fDTHZ9pVY73YKQymgms1qd5
 3BdjW6WCIpIrqa4uQKWWdmepm8NBv+hfkjNEFDN+6f6riXOhpv3dfY2VrsmPnAuYkpQSdJrNWF7
 n7qDfYpu2ElSrRzMYSHukSjEuin1yKbZmKiA378vXVM4zASQlcx+/F43Q0/1X368bp3hU7sBywM
 igigpA6dPnP2YRsvYtlnDpFK2SAfLzYYpIGALgfFXpaj0EHhbZrwCvIr62tyzsXll8oeVar70CS
 rDUf3XYqYQJabHPZQP+m/QfM3kc4Yi2/l1JVtcSGEL7Hh4drQM/hR/4FXGH0uepFfPbUOx3pMaS
 pfvBXoyZstwZgJHcqLy4fFz6OwGMBUR8RBf1UShKySCfQ1U5hohvdnjrU98n6ZdFIUwAPxPyvES
 WBWixIBR+0b3mOUsAVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180168
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108248-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3150D5715DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add tracepoints to the Qualcomm GENI (Generic Interface) SPI driver.
These trace events enable runtime debugging and performance analysis
of SPI operations.

The trace events capture SPI clock configuration, setup parameters,
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
1003.956646: geni_spi_setup_params: 888000.spi: cs=0 mode=0x00000020
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
Changes in v3:
- Replaced geni_spi_fifo_params with geni_spi_setup_params trace event.
- Updated commit text.
- Link to v2: https://lore.kernel.org/r/20260512-add-tracepoints-for-qcom-geni-spi-v2-0-3b184068ecf9@oss.qualcomm.com

Changes in v2:
- Removed tx/rx data capture since spi core had already support.
- Updated commit text in patches and cover letter.
- Link to v1: https://lore.kernel.org/r/20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com

---
Praveen Talari (2):
      spi: qcom-geni: trace: Add trace events for Qualcomm GENI SPI
      spi: qcom-geni: Add trace events for Qualcomm GENI SPI driver

 drivers/spi/spi-geni-qcom.c          |  13 +++++
 include/trace/events/qcom_geni_spi.h | 103 +++++++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)
---
base-commit: 1f5ffc672165ff851063a5fd044b727ab2517ae3
change-id: 20260506-add-tracepoints-for-qcom-geni-spi-e31457c2267c

Best regards,
-- 
Praveen Talari <praveen.talari@oss.qualcomm.com>


