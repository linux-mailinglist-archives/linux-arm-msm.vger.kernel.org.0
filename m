Return-Path: <linux-arm-msm+bounces-119142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id atM9AcQYV2qUFQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:21:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 470CE75AA43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:21:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pPHEw+fx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QJ9E21QZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119142-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119142-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 117493007F7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 05:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F2B3B47CA;
	Wed, 15 Jul 2026 05:21:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EC33AD52A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:21:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092865; cv=none; b=UMLgboEN4WKzdgtIqI6AX+nO2D1bmGkcCuMMjAqepY7LHUFl20d1X2mPJCdGvk6rRYS//mcHvjrH153XD5bba3JYMlRI5Sea9pXP4FdHThk27Z+X8Db2y7aBqhnCBQZ/njoNmNw3/8G7m9EauWhXowV5eh2uegjHGxwl3SNI6pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092865; c=relaxed/simple;
	bh=ORykrG6OPw9qdyGjq9FHHv+V4qNjByzTxutQlXJemn0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ezBWGE8ECdNNRVi0VADF/VAUgnKx9vNrpYAQY3uAIjg39cqsaAA3r5RN3hF1TLFBPfsMhXd7dBk8l4ybZNoQpRR1MxnRR3VF9Hs810w4bVKbuyXmB8PP0QlL+/DXXvNC5abhkUmn1azLR5mSVlQlM7Az8MQu+LvWLSE4rsnGkGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPHEw+fx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QJ9E21QZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lInb2405239
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aipnIg8ieikK/Qjeeax/5V
	B3+TOw4ZIiLbnWZtw/dmo=; b=pPHEw+fxzOLdWVDiymaXo4vbd8ZepmmN38C+YB
	BBcykCWXlOEILsDZXUu/OXxy1x+Fx8mDjIcXnlictLp1Xw4+pIMcMJj1F3PzVKA2
	z6Cs4taAzoRmtAbMdtHFY2gT6S9cEG8VkhS52LAnyVPmHr6AZo9lS5bXguM7WoRz
	KGLwyRMyjonvSa3OX89qrTOU4e6TuoXmquZ9nyPQ/AxbYGVgHvxFx55Cf2PBezYs
	9zLleLIGjLoUCx3tfKQyq5hC384oE3jtC7bccgZ+nViNOJVgWdtVz0+cwHLuyd/m
	VDld1YiyvFJcLRTXyXzivl5f8XHPN+HYxglBk0YT26Mq906Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnp0k49k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:21:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso3849425a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 22:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784092862; x=1784697662; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aipnIg8ieikK/Qjeeax/5VB3+TOw4ZIiLbnWZtw/dmo=;
        b=QJ9E21QZeMx3qVTdhY8XtXbN1+UOwbM0sZnTwRg9MlLSmGAt+CgWBavb7JLaxJ/qvS
         qh1WPFpF8YOEjLGGGNE92W48GeyIr80cNsblUKpLDYzfxPgGDZ0RYp7uIK3VD2qcaJGE
         zoHWg3HvfLAL5MvOLSJe7A5LPAlkF3g+Srkr5hGfPCy3FN5XZezAWR1SvFnWun2guwsw
         FL3a+Z7wQnkVeFWxqAq/LKlhPnpZyPZ5u3IiW1ZZ0JLGYPuvK1mnxPs9RO6eeEqCXY2T
         r2jDwyOliseLlu2WWISAV0LhqSZ3wUkUkj/jP/tvzsSjXjBeP96iAlu5u6Ve1p9ybReu
         /dRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092862; x=1784697662;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aipnIg8ieikK/Qjeeax/5VB3+TOw4ZIiLbnWZtw/dmo=;
        b=gyqYyxQK/gK8Ig/N+1mAtoeMMAxFqfvrHKLAX9h6J7yqnbUyGhqjynUYCXbQcolohm
         /lYMQV9oaOH7uw6x+i1jB2K9o0sNledsItvvcSFocUFWo3sqKY5zQzYQO7FhecPeM6iG
         MbCUiC9UISW8svVbdv3frIG/gyIGmV0sMi9g4y66mHNRpgXYE90Nu1Q3mRF7Q/B/vBWD
         ImNOWzlJ9vFxhJe1LjtTrjy4hGzGd1DwZBcJSTIJ5bC9Vszh/tPnQmVP1mm3E8Xj1Rye
         NvAUHGcjFVLzxz/1RjGjgPMbTWCaIqptBvG+MnIgejyu23m2y1S2fdngVyqrSSV7O6S9
         tSng==
X-Forwarded-Encrypted: i=1; AHgh+RqH/pYF4pbNtMLUFlZDhRaFV6LE62nm4/qkNgMT8/Vhhjws3K8Gf5asX6B3YE+uocgpUE4uWicZW+UnAHNh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5aUAVelQs6un+efdMTgIQe0Z1rskZiLjpcnD/kSl4MlhCa2/m
	1lAyCJUb9wnrmvJhVikmX2HatLies1WkwNKPCWYxyA7Wznlx+mFkpI+QnZAzwMaj3v9jpjl7vQh
	aH1QN2Je21vAagX8BWivkDWFIJH51wa0s9EuTu4bLxztrsuTLwB/h7nC40+9H27Of9B/V
X-Gm-Gg: AfdE7cnfE/u0r3ZWuIu5Gmi7szNhih3SCyG6fJpyaMJFTjHlVxtJZIq9mxbhfjTPoCS
	MN8/pieoFoELXRTb7PtMTdxc+oZdhu60jet3EVIfFpwqkNrnz6tJ+j4NiL1V7wTDuU5wOSog/9q
	RBUixG4B8jfIzKuNN7oaig270/aETj3d5OpkZBhY2NkJbq0buwmNE/GrzCfmaekJbOHjG3ir0KQ
	ix0/xpFzt1wkE30YNTzxvTNazm89aeImlqo5Hj+BYfTbDqYNm/PcLS0+rbVyhnL1GJ4AQMk1qeF
	Z8l9qDefj44cZMY3Dlso9+Qk3RuuZ20x4kZjHRMiFVGWjJeOkX6OpYlQwi0N75eoB5oC4wstMk7
	BjPEiwLKn6pzg0bmBqLzsg99bJl6uubhfDWC5/lTKmykL
X-Received: by 2002:a17:90b:3b50:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-38df096a242mr9882333a91.11.1784092862496;
        Tue, 14 Jul 2026 22:21:02 -0700 (PDT)
X-Received: by 2002:a17:90b:3b50:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-38df096a242mr9882313a91.11.1784092861837;
        Tue, 14 Jul 2026 22:21:01 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172e46basm2526092a91.9.2026.07.14.22.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:21:01 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add trace event support for GENI SE registers dump
Date: Wed, 15 Jul 2026 10:50:46 +0530
Message-Id: <20260715-add-tracepoints-for-se-reg-dump-v3-0-0f787f93badd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK4YV2oC/4WOTQqDMBSEr1Ky7pP4F0NXvUdxEZOnplRj86K0i
 Hdv1AN0M/DBMN+sjNBbJHa7rMzjYsm6MUJ+vTDdq7FDsCYyy3gmuMg5KGMgeKVxcnYMBK3zQAg
 eOzDzMIHOtGy0rEpRShZXJo+t/RyGR30yzc0Tddhn90ZvKTj/PS4s6d47bRUXf21LChwML0yb6
 kaqtLg7ouQ9q5d2w5DEYPW2bT9LHIAF5wAAAA==
X-Change-ID: 20260630-add-tracepoints-for-se-reg-dump-c2c8bc875658
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784092857; l=3734;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=ORykrG6OPw9qdyGjq9FHHv+V4qNjByzTxutQlXJemn0=;
 b=GXEw0cMs9m/8QTWvJNFTZ8ujDmhGHrmHAdRszpl1IygZONWs6kTH4iW0bXWMXWqZtrzhVQnb6
 RJs/MHp3UJ0D2wMA6+tCYKiQZ6xTNYc7A6c3XkcY+VEVNkHEzWOPoqC
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA0NyBTYWx0ZWRfXy6qf8MwxQUPX
 zfT9bE7uSGVgGx6ajQrdToBvA+MZn9J05OSFiDhdPaFWWlF8nQTGRchVR3SRTIqsoJ4gB8jfyzj
 Pn1BNM8Ixg/2FSMbXnX3g3Nlda4Q46k=
X-Proofpoint-GUID: 8yoHBgLW4IoaQnOruq3rFf2Hh14kfsNK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA0NyBTYWx0ZWRfX5advLfDKjLNE
 MBspva6EraNZDOXVrnqB5Fzl873YnkjaJVtQ4BOCkUmC5YguuMhA8eKEBIGYMWz42hOdWXGOzi1
 f3SpCMrteldHpWGOvnxxs+3TLPPzlfhFxiu0LRdTzq+P4KMV0/IsegLr7dMnfoy9o3Z9rYEMaZm
 FX9Q76kGoxtwIZVlUhb/ZASTqTbtcdaRqvgibFh2Yu4vUlRoU6bEyOmcfwKuok1/zD9Znw1RCnr
 1sMXBMnXh7v15xr5LhtWEeJS+ArnTTya+Dhzrb14uLNyYcIQCN/+VWZNlEVEaDd7CCye0wDcV31
 6ajYuk7A16PWLpM1eeajfxxmb178NHVGzOEQppbVevfiKOSMcpUwaFTQ7O24dHh2ROuMbr2xfl0
 eRAH1tH55EN9vgtUkqijOTKSxK1a6Ty/FryJEae6IyWo2BUP3p+/LjJJK69Tek7/CwDi3zVVw10
 sDtIzDkbOry3vqW4qPA==
X-Authority-Analysis: v=2.4 cv=FtM1OWrq c=1 sm=1 tr=0 ts=6a5718bf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=meVymXHHAAAA:8 a=7d_E57ReAAAA:8
 a=7uk2dohp-bzDzRdlumcA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=2JgSa4NbpEOStq-L5dxp:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-ORIG-GUID: 8yoHBgLW4IoaQnOruq3rFf2Hh14kfsNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119142-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:broonie@kernel.org,m:praveen.talari@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,efficios.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 470CE75AA43

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
Changes in v3:
- Trace se registers before clearing tx watermark reg.
- Updated commit text.
- Link to v2: https://lore.kernel.org/all/20260711-add-tracepoints-for-se-reg-dump-v2-0-ca1e9ba62359@oss.qualcomm.com

Changes in v2:
- Updated SE_DMA_IF_EN to correct value.
- Sorted hearders.
- Link to v1: https://lore.kernel.org/all/20260706-add-tracepoints-for-se-reg-dump-v1-0-48bd08e28cf2@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-trace-kernel@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

---
Praveen Talari (2):
      soc: qcom: geni-se: trace: Add trace event support for GENI SE registers dump
      spi: qcom-geni: add GENI SE registers trace event on error paths

 drivers/soc/qcom/qcom-geni-se.c     |   3 +
 drivers/spi/spi-geni-qcom.c         |  23 +++++-
 include/linux/soc/qcom/geni-se.h    |  38 +++++++++
 include/trace/events/qcom_geni_se.h | 157 ++++++++++++++++++++++++++++++++++++
 4 files changed, 217 insertions(+), 4 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260630-add-tracepoints-for-se-reg-dump-c2c8bc875658

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


