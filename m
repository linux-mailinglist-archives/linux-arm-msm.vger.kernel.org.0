Return-Path: <linux-arm-msm+bounces-116843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wXqxLj2tS2p8YQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:27:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F024711403
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:27:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ILNpFzGx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RCmVLdEm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116843-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116843-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA867303B185
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3583241610B;
	Mon,  6 Jul 2026 13:20:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90343FB7F4
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:20:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344036; cv=none; b=rkC5ejs/a1iM2FT9xgAd5BJ8T3VD1I3xp56srZmG9o5RXXCMbPZwKw5OuchYrAdNx/OxW5L0V8BTUBZPlaV3ngDWirZ5ZQBKFIt4rppCN43Bkqe3IYXY2cPBrmJn8UJg7uRxQKpzu+LZXcpmxm0KHgvXs4ewuJrakUyRPerdxkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344036; c=relaxed/simple;
	bh=S8aOiD6kPweC/tJWFI42QZAWP6Ddl8c12bttFcXLfvY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Zm/FAvFXv1Z1AcnsZqwogcP/R3OjdF8yQIM29OnHQ37map5SHQSiyf+SOlnS2qeUvWZdBsVUcD1dumrXC005ThzPpX3bp7gVZcjKafcJO/Be7AyCrqhSTiFAsH1RYmm8BHg5TshFu2AtNbC+pqn0guIoCMhiS9D+IU6rObpmMZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ILNpFzGx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCmVLdEm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOM9218528
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eS3eqDZj9HB7tnhetIVQAe
	69CtHFPPVH/7Y5nUjkDas=; b=ILNpFzGxkiVrWLpPzBbI1WBWeyABZaA1jgrCvC
	M0EFdIckx53IDkq9KqnJndg5i15kzNDISXv6uh+qnS80PENta+QUknDBMl36PlZ0
	eX+nK6UvXQ1SZHRsYWd3vGJhpSk8vx7/7CsDpJ2Z/4EbngL4iYirHD1GkrmeymR9
	U02eFhqEeNGHRzxnP9nEGvMnXfT0lnvDUFUl7KvgpeATIa2omqfsMKgnS9Tow8Xq
	84WSP/aGzJJLjfKC+1VMJEIRWhmA8BBe04mW/wDFebZ6ilVF+Zu5tFnQLFzuy75h
	lnH9ZA9fGKNHSqnqsY8eMCKuH0Zg/KPFXFWqqwEpEREj8s2Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs983v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:20:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc6dd43737so39934415ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344031; x=1783948831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eS3eqDZj9HB7tnhetIVQAe69CtHFPPVH/7Y5nUjkDas=;
        b=RCmVLdEmDf4+rlPl6OMroEsyIrN4prZ39S8/pfTk8mPeCQGijldLdjBXi4phPbf3kv
         0VHuISEt2HA0BSjFVf7COeHTHWsajwcznTapnP9VgR8JcDaJbj6RWjabDHV1C6zQt1hd
         4iUvDSDmI/P4cvyuJ4R32JZY/546ZOUsYmVqwntAP/7pkhFikMfpsh/8boinbzNX+78x
         QI7M0SLUn0YkxrKcO3uXISqY9KbN4M1Qp+z3Dg/q+ucpWECR0Xv0ouddCuaUnczGf5TY
         X/VlSVrfbphxhqnDr+skTZGwk9sjejuC85j6u9QMTKpsvdw9FF8PgwxSMJEOMamu5pmj
         a2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344031; x=1783948831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS3eqDZj9HB7tnhetIVQAe69CtHFPPVH/7Y5nUjkDas=;
        b=DPeE7L4Vvd2G2MRdC2fxhhqPlp4BnZM8IR6ZOJcVSncM/vM/OX5GcFGvy6CzTwOOPn
         B3zvWi1rSsX1YpFW4Nq7rgUUKvTNKqXFFkTlGea0M1b0afSgr05bLoqhE30aCGYWBEQs
         YxNs1F1KJowMyVDQsGPaH5sQCsd7cAGdnAau5rFKP7uSsUcaIxk1Br2vucCxv6RjGz40
         5uFEvhN8g9Q7P2trq4yD0d27WYq1bDdhVptnY1vMVHsu7zH0cWztNTqMPqtsgs1ZQSkG
         JrMOoxU+sOHhb+bs/qFggjPYQwywNpjaiBFw60iLMo5ABjAjzDvM6uFNaV+YIPWd2sZT
         YYxw==
X-Forwarded-Encrypted: i=1; AHgh+Rqtonv+jXo4eRibrph+qXPSPZha9H6ipwp1wF/1ocdsGXljJIMXZCcCqM/rvqlIOHpjE87kotwfusVRDbzM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/g+zUIu5F2rstEur8dIVAmCQx+dOGPO7tcM/ju1bKbgITWGMD
	VebaYsuow3gs1CO7rZPIHdyCjEjHNO/KphDRAAUo7CMo87NhnOxu7V7IQHvMUYTnk64S2LVXSn/
	5Yy82Q9tmaMb2ToMUocH1eJhT/5qOVnYdS1tK+7WABV0meolWC666Lx4PYts5FwTq8ZFX
X-Gm-Gg: AfdE7cmMU1Lb5w9jfopFptjKhEJ+L+rqIoteM1dqk5qiRoOm9wYAxVrtkhAjvg10HDz
	1afjTDuMInbxKHBveBYkPy/qHQ7YOJl6eM66imghxNQZuWnfc885yaPk6YCvkEPTx1zmhvoug/m
	HUl7zrj5hXUspLufZOm35LCz89bsj8d//g6CA/BRK3/yntN1j6LgdALrddszsVfSmCVomM5zDKh
	R4B02fHhxwP2wK6+oXLW5d8EINghvylUZbMNYD+Ad6n4BYe2EyOxjz3opygyYwpXxSiGRuN7N++
	dMXM7LZuW9Ork3qcSG4zD0XUbln3ejnuTZXBlIJSTctwFe5qrNsrFSBpwIskuuZ82z7sP70eJhs
	WYIsiUhcQ9un/TvcYHFkFBTD8Y3cpvbgY1uXWcNTEGPXhdS0=
X-Received: by 2002:a17:903:2c03:b0:2ca:caa5:9c04 with SMTP id d9443c01a7336-2ccbf07a0d6mr4453695ad.23.1783344030596;
        Mon, 06 Jul 2026 06:20:30 -0700 (PDT)
X-Received: by 2002:a17:903:2c03:b0:2ca:caa5:9c04 with SMTP id d9443c01a7336-2ccbf07a0d6mr4453145ad.23.1783344030031;
        Mon, 06 Jul 2026 06:20:30 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260d2sm51173095ad.10.2026.07.06.06.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:29 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Mon,  6 Jul 2026 18:50:06 +0530
Message-Id: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 93jCF3Zs9Q3anyJHIMJXMmj6Bh3gg4lS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX+B2czZdjKH8S
 ENIT1VW78DsS/mm/YLBzeS0qq+mt7fC+zHLn0HS2NzglCGj8jkkMHmQstWoGUp+7rvthA3Nv1ki
 Vro1JCtUC0ZpI3PVYODT/5W6G9U0SPWr9cPmfO91lxRQ0nkFjp2V6tzQJ1P4Ytf9OZ5j1QZMNDV
 WukYJaOHzStlE4fOy5dGEQBIJJAKdav/c1fd2uWB2tf6jHn30kWoNQfPDOK1efnj6BDyr7GfNLQ
 DhSWEQbm2K9eln4Zsy4kerX8Ww3RW/bErvmPSomP+AgBqDnuNvFuTkFktmMJSMxG9kBiCKblcfz
 v8mgi1cD82zZziMuVOfcLGkLonRxz+Jbw6aJDk9e+8MV9x/vODCZDQ20BH6aFyh6dUq+n080eZ3
 sCbRXcGExvkcBULs+O75qcSiRtQUZsDV7MXwdF2BMcaELs68h+dXXZmmtZNEpS2h/w/B8tPK7eL
 6nnmpHP/kCAi8Y2kQ+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX5/qVPEbbpOfg
 L3XY5FZpgjdt9mJLgvjQdB67VQcjTeYW1py/QH3tGrFr/YPsdheAAp0H4NnUw/RlCpRtICIlNYg
 i21Sb9FNiOJDLLO2z+YnVOY+E6yVf+M=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4bab9f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BifR_v5mCn8YSut0XsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 93jCF3Zs9Q3anyJHIMJXMmj6Bh3gg4lS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136
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
	TAGGED_FROM(0.00)[bounces-116843-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 1F024711403

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
  ASoC: qcom: sc8280xp: ASoC: qcom: sc8280xp: enhance machine driver for
    board-specific config

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  56 ++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 154 ++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   4 +
 sound/soc/qcom/sc8280xp.c                     | 245 ++++++++++++++++--
 4 files changed, 437 insertions(+), 22 deletions(-)


base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
-- 
2.34.1


