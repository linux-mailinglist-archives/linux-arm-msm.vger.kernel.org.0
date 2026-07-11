Return-Path: <linux-arm-msm+bounces-118445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tofcINg9UmozNgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 14:58:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2D974192A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 14:57:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="n/JwW7Wq";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UD+5xwnS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118445-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118445-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8F5A301468F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 12:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127743C5DCD;
	Sat, 11 Jul 2026 12:57:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A93C09F7
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 12:57:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774676; cv=none; b=NJycP9ZVgA8AYwCmxUVYUKKRZ9DQKYvJt1FgdvY2wYXuWZWvpZ5K8XLOQMl8Ze4RvMHJyNHJUkXp5f+6q1QGZiHla+uwi6a1JwaNVTHXSk/3ewWubZFfSgp6/pXPmx/osIMP5AM7jI5J3IZqziIEMN3J1rBDugkCHhbNwg2oeFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774676; c=relaxed/simple;
	bh=E08ZjSLYCMK9SJ4nIZGC9Z/KoKMraZ4vLGrrTMsAUo4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=HauGPBlQG42eOJmYy0D6wpSlvBKYwYlmjEb1dW2svK4Vd//dLeSXectnb2ghXmftCnOJ4KoOlK+j7bXZksHH/mQlVBSupJqBxHFOIY0cPOMVrgRpfzyKISkCeR1AHvXkdwRsLFvLuIS3aUtlewyq33+t9FuAXG8ZT+I4DrnTJ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/JwW7Wq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UD+5xwnS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAmb0H3609652
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 12:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MTb+0vYch66DSjN7lGTl7W
	9yD3pHWoZKtdOyO/YagqM=; b=n/JwW7Wq3RL7TEzym2VrIaCB7uUpC/C+YlNO+S
	OjBEULHjPbtObrWUaQ8BMWrIRN9xFkf3DBXyhMPMh+TiASoznY03KyGxt903QzYN
	u4TowW4FhI2mMnsPRPoy3fW+vqaWR75zdAcNPagvxZEF0yg7wA75MF8Urzz0hxF6
	OnqHKA+0rgAxsKcJ1zNB1jmOO/bZOY5Jdy4a35rjmrzq3/9HMQA1uwt018cgoxp2
	RTeGniZpfA5VdPHVOzwgmOF0y3+bM39k+/ehGWBWZEgxd+pe3k9coz465ce44KMs
	Bt4LLqB2IymHTMOn4160NMjKqFURYUEW6xtdwA/AJe6nxlvg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeamrtx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 12:57:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c860544c077so1673949a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783774672; x=1784379472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MTb+0vYch66DSjN7lGTl7W9yD3pHWoZKtdOyO/YagqM=;
        b=UD+5xwnS9dPdPesDXX1JIpqbO9b66mONL9UXXT3G3Pmdu+S0tZzK+/CSTjcioYT2vc
         cCmm7ur0b9dAnTe2jw203Ic+hGtPTvBerVk7KVK+o1lGuXI7pVDeOOaCNIVVeCdQRxz2
         OAK4zdEJBroTFUSCNZlK2jKjmFh3E6KGj05xyr0AjSIp4qI1ZSU47r88Gym43CWYHK7K
         2MH9638LzNanZ1Fn6EZJ+vCKMXhO/XDjAd8dO1vtjSGEo9uU9xuP+fFXGdaWa+dk8WvU
         fotg6rLFTyyfzeqLEdxvKM+piFOZIHQypmbY13At9lKJfe6FJNo4SDbEpG15u8uYEOp1
         8g3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783774672; x=1784379472;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MTb+0vYch66DSjN7lGTl7W9yD3pHWoZKtdOyO/YagqM=;
        b=HJrteH/F6OePBhEL+mhGlfLoVZkewLvNw05MhEJliJaEORJNPr6i0VmN+ILz2QlCNQ
         OXMxg/PIsvZrpi+vWs0kne5ro08GHkWH0gmnvZCeAg7D4nzRKFD+/vDDROil9bOxvxTB
         B8pTvV+purJ7tPcq1U+4O6TY2xC2Y7dEqdPZNAuemPlrkTET/q9wrQQ5w9YTMNQ4yx22
         zYYDgPLZaJK1dzvpHwv1CzxxTlYZM35mdlsBvCruP+jcynOxPehwnU53PW8ctudQn4su
         aQf58lt7rhQmU27/pf8rpi58OPFwZFTslWQflBqfo24aYsbgvnpk2U+TLtot5fb6YUko
         ho3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqxGuzNIC22dY+ibYm4JGKgizGWO4eYuzLbXSZbepmkyNJWGUdGtMBUNszNVA9Xko5CR3qKAzyI+wCrTx4J@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1R264QZizdYj9MDcSIB9BjHKNb93GJrVdo/uLDMgbHEhMLQwE
	bwpCxnzrVi5N8uY/TNONop0JFY3WnBKVmDru95x3444PjjpCVaCBDBf2yrIA7HSwNg8TlmkbY80
	t57k8C0W30IpKa8jUr9/QDKSaZX29ApCJnxmYm+BHRquLlVApt5+lX6/AkuvJvLE2RL8LswcZSK
	Wp
X-Gm-Gg: AfdE7cnuO/oy/TveakO+Jk/UpK0caPZNJu3ZN1KKRjLYNVMi2Ocev3vEOblKR1ZZwoM
	n3PPsTa/F3M/Gy3yJ/tX/CrRiAE4tNcLI7aF+iXv0QK4HD0D246/Oe90UcYThuEmnb5VqyozEYv
	7dc09uNBTluuH8PIU2LM+fquKVLv6ESBGAdWDAJn70NmDJpwkmQEXj9A/kgP8iBIBtnm4DmI0bP
	Z2tBs1LWzChC/Vf33NAk3q3SECNQNILVxpO3+EMb1js06/VwhsvbS31HkHxnApIjAU50ama7Zni
	s1jfxrqNnG0QwRLg246UypyO/hb5PqnzVfuPYgkrixvBieI3QKGuxpDAuiKwcSgnhG9rWJSTfTk
	IRCfduxIvhxMF/5Dlkq7k1/IJtkIVcodhAAmrUkYgDOecPrA=
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c110a50703mr3506845637.74.1783774672337;
        Sat, 11 Jul 2026 05:57:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c110a50703mr3506814637.74.1783774671893;
        Sat, 11 Jul 2026 05:57:51 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm11185634eec.23.2026.07.11.05.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:57:51 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Sat, 11 Jul 2026 18:27:37 +0530
Message-Id: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEyNyBTYWx0ZWRfXy2AFAMBPFLA8
 yyIHNt7/LFclBcPvyCrJw88VBnGviHXC55jWptJfYx69yf2Ui9agxjgUQBTYhpDV5o+f+wtnFAK
 u/zLnvf6exgITxOf506j4A6vu1Xmyas=
X-Proofpoint-GUID: F4u1n75ghSQGyj5ZjJV77S3BUsKRos0H
X-Proofpoint-ORIG-GUID: F4u1n75ghSQGyj5ZjJV77S3BUsKRos0H
X-Authority-Analysis: v=2.4 cv=dJSWXuZb c=1 sm=1 tr=0 ts=6a523dd1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BifR_v5mCn8YSut0XsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEyNyBTYWx0ZWRfX8C2w/TZBSYYf
 Fb+syxJfyTLaUJFEqNCUOirCHAh5D782DpiqudwLd5GFHrTUJpse6cqfwW7cvyVT18b0XOKdaVl
 As4j557zzfu6WpiQmFOJtKS+0QhCgHeCIajy66UgjpAvGN6cXlpiQgRxOqrS26VUWspQzRzN8ks
 +6FH0SLHW0HQ+TWhfkkBToRUfrbGtJhlssTuZBbYWlHBspay0BFAMpfBWpL36xwho7Xlqbf2ZEA
 2eu5gO5MRuW66LJeMLnzWWi29CpoOkwtnoy27VuGsW40UOu68LVbJrRUdP/wJWYpb9g2l66gH+z
 IHlaRZC4nNsR4oxgd62xPJUORbVKDx+NJ61UnQpz4T4ouXiERGGCV1zT8na68MVatNU9GQfFFN+
 A8bBFYa7OonnfCOe2UM+rVzmA2apH77xJkuszmEbSanRhnQ390qD5g1Cpwu6TuVH/usi5DxHHj9
 wKhRs5oF8LhW1mp+7lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118445-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE2D974192A

Add support for MI2S clock control within q6apm-lpass DAIs, including
handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
Each MI2S port now retrieves its clock handles from the device tree,
allowing per-port clock configuration and proper enable/disable during
startup and shutdown.

On platforms such as Monaco and Lemans, third-party codecs are
hardware-wired to the SoC and do not always have an in-tree codec
driver to manage their clocks. For these designs, clock line
enablement must be driven from the platform side, and this
series provides the necessary support for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility
for voting I2S MCLK and bit-clock has moved from the DSP to the
kernel. This series introduces the required device tree binding
support to represent and vote for these clocks from the kernel.

Enhances the sc8280xp machine driver to set the boards spacific
configurations.

---
Changes in v4:
- Addressed review comments from Mark Brown.
- Resolved all sashiko comments.
- Link to v3: https://lore.kernel.org/all/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v3:
- Addressed all review comments from Mark Brown.
- Fixed OF node reference handling, clock configuration, and sample-rate
  handling issues as suggested by Mark Brown.
- Added proper error checking for DAI configuration APIs as suggested by Mark Brown.
- Added SENARY DAI support alongside MI2S DAIs as suggested by Val Packett.
- Link to v2: https://lore.kernel.org/all/20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com/

Changes in v2:
- Added a detailed commit description to clearly explain the need for this change.
- Improved the machine driver based on Neil’s feedback.
- Link to v1: https://lore.kernel.org/all/20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com/
---
Mohammad Rafi Shaik (3):
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
  ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
  ASoC: qcom: sc8280xp: enhance machine driver for board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  58 ++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 193 +++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   4 +
 sound/soc/qcom/sc8280xp.c                     | 252 ++++++++++++++++--
 4 files changed, 484 insertions(+), 23 deletions(-)


base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
-- 
2.34.1


