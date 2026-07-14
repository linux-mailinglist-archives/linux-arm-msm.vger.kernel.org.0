Return-Path: <linux-arm-msm+bounces-119056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r5HDKlhNVmpa3AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:53:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 40193756180
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:53:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=boIwjftE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Lm32J3HY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119056-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119056-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0015300E2A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A8C480DD5;
	Tue, 14 Jul 2026 14:53:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C783E47ECE7
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 14:53:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040790; cv=none; b=J9mCDR5Dqz1Z2uX3MvODlpLBgmQMcqSPBifn7lXF1PW3TkdOWVVhdfRBkB2mh0aCkMfxkRUIB1zmnJZQTYbg1iS5cPy+Pa+PfVg8IHtr1VCWw1t5QyuS7YCFtdAJ6Pb0NkYsb/fL0FpJWc7iRAb3nLSDWzfBlHujeQm1rcsyOf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040790; c=relaxed/simple;
	bh=fA4lu/F75lzuQu9paxnWqSj3utpl4LgQhR7/CC9eq08=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=T0Z9PBrXPp9VKFnjm+dVudforxb4gSrjAhrajm3L6JDEPxQh3FsJb5XvRipX950brm3H/U8wF5hy/7RY78ktHg0buJ5nHignbSooRs47jXDu1M26N4V8Yyr+/athzmMrYVPk0OsmsgILhH2RxH595gxtUQT9du3/L8ALQotPdRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=boIwjftE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lm32J3HY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EEcV1G772158
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 14:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QjHQFO9WLKRWMxFM5jj455
	KOXXdgE1y6q9KtfZTSlpg=; b=boIwjftExZkE99nOitwIr9twh8WlcW3ePy7Ghx
	C5ClQg3yWkshhmORYmY24L9I2xR1jOorEWEInGONY+Snze+VZzwGRfaXKt6J8dN6
	dPPBuRfvj2meq/J03q/ZZ3o8xHgbQlBE1Hzd5OKZSXvBhxEjB9Rg9C75fY8oP5ud
	X3ptk2gIucQm684kVUixOZCOQeW+xLe4+ZPcr/MfyWxZlizzlNIIcNDSUCKj02nt
	TqWnyVCA8uGxMastGk1U8SC0CDI6QnmByHOne6iY8QwRdPkNy7fosBS5Wjsrfp1V
	Fubj7efnqRfCwaIjuUVj+nCMLa0b3Dq3MVLH/AEh0QH1RRhw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq1rn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 14:53:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88fc985a65so6325197a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784040783; x=1784645583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QjHQFO9WLKRWMxFM5jj455KOXXdgE1y6q9KtfZTSlpg=;
        b=Lm32J3HYtxwgDlm8Jom1MJ40eBDcS4lk8KZZ5czyVYnPacCBaC3Z4EpEp9dNt/YfY6
         ItPgTpqVVaLfGSQ+KgqCrVX/Ugp71HWX4XmBibtiLQn0Y0XnNEFFw1iZpyxkmFNclQiH
         h+1txnTRRdp7E29sfphr2AXzQylUYAg4ArAvMzhUJBnz/WNQJemA/HDBEuOJ4m+yUjiz
         fiDNxra0mqdEsFebEPGwyBA9Ou/NrY9b54P3EcT13rvB/gIZ4k3oTT8UybRXkB7enBkw
         pGNZdUXp6Vk5WLoVBWAHv1gcDnMxfKaFMI3kKts6H1N43MJosJHHoGA2emJRPA0wbcMC
         RurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040783; x=1784645583;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QjHQFO9WLKRWMxFM5jj455KOXXdgE1y6q9KtfZTSlpg=;
        b=T6UGwuKteUTE4m31rWaoTKcdrpXD7mo63KQPfwWcH4wbktJN8l0D/p9vQU2ulbWEDb
         DM/kuIRXm2xonE2dLTOS9oPm1B1q2Q6cKwJikyeyfUKkErpRRFdynS5tPzgitZb5oibc
         KlcGJWnLf51mb81DmrloI6lci9INqvIMXwPQuZjgi4C4hH9Wtf2ZyR71KFK8qeVGiCGu
         z0yhGUnI+E2d2DJV8pZKRjzC0y5PCkCxlelErmmYhqINDodpwiOgWsXrwC4QWNAau6a4
         aiKidnlIyfw+vj5qQsTlRVi2BcUq45tW+aS/WWDIwDKy7PCBurxBU/e7HTgVRMK+//or
         Qr3w==
X-Forwarded-Encrypted: i=1; AHgh+RoWSpJSdTQgBOk/Wl8wG0XQhTbYwmvmRYmA1u2iPoZ4F8ooqaYqsPmzYZaW1NxB7DuuhLkd7ZMjvEEJfxsy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0+2ofAoKB19/n+IEbJZXbwDEyjuGpCcQsyoVj95rWxB1dC9Wj
	objsfqgs1C/YggCv5A4KiGiRAyvH6h3rKms7lKGK73z59Ej0J5OGZ3hWSNIwBEl5Imw5LHJiqwv
	FDKThXaAe4bFNRne62JcNpdBqw1OwzuksbjSAVOFVrBv6FaojDpExdzxHndZQ79gl2/V7
X-Gm-Gg: AfdE7cmBFvnBUCVL0MQk6xZwAux+bvHjud9o91nPrgzvsWUxfRwS1QcXe99wvMsAUMz
	y0vusEF0OyKajuz8PCtQcKfCJntMZWGJdAXqyMmSzbZMmDXjsWvkm9wcf84ReBZFiQdLO1PnZjC
	I6593qDqejr+x2386mVczH1u6Yy5rcK8j+Eom/LhB2VxctLNUWC7WtwhPlKt3sBwojs60hgn22T
	pbOaYVm/r7dsPyYoECcZFVhqFXL/GsASRmxPau/hrgywOB886yf0xVAJ0d5iawWWIJtgtPRC6gP
	apRCGBo4KC3hf7OffB6CTaGrxrXwHd4w4nG17p0vQiUmiWfmKZIfcNOUl4UhkcsXC8u9mAaU5bm
	LCC1bTvkzpxxj0onFBqCqYbUDGjPENJfHahh0ulOwfy7dhKQ=
X-Received: by 2002:a05:6a21:7a43:b0:3c0:9c19:65b4 with SMTP id adf61e73a8af0-3c110a7b347mr15865048637.76.1784040783224;
        Tue, 14 Jul 2026 07:53:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a43:b0:3c0:9c19:65b4 with SMTP id adf61e73a8af0-3c110a7b347mr15865006637.76.1784040782708;
        Tue, 14 Jul 2026 07:53:02 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313cb804197sm31941773eec.13.2026.07.14.07.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:53:02 -0700 (PDT)
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
Subject: [PATCH v5 0/3] ASoC: qcom: qdsp6: Add MI2S clock control
Date: Tue, 14 Jul 2026 20:22:47 +0530
Message-Id: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfX3YtYo4/BNUoi
 CAbxO49X2J0EX+GxKlw0MGLOHCdh0xF9crBdwFxdPes07fUWFwbkYUICKaz7A+8AMb3gBQYrJmJ
 4yVjDu80F725AfjPFKknHPWVdK0yPrE4QovOaJh6fvYcrt7bRA7DPpKwvf5WHRr7IpmKC1OZ5gP
 S10DSwtDVm1GGPIh9sRHC4CuLEM2IqcH1MOHvh3fw0g76Ti5mOn9Rj/bRwT6z1E9sV/ZsTd6Fua
 micUtBTVoCrPoSyTk/vxwLa+lqh/Wtm8Tz27TA/lLz+kRUbXrUp8wB4YdPlgoo4R4S01WldJLEx
 Xykrk1rNod9zV4EBnEKcnk8cG5IJE43jKH07cmNdRgqd2AV3lZWFi5DZr3Iv58GpNcx9KCI/uPt
 BVAiZAtADKRYHG4xB04ILQt9TyEelbVcag79KC6jOdVBMeKSqKDk4nvLpJf98leFF//EFpWpjXf
 KQ1CQ4j6U7gdqFjOp+A==
X-Proofpoint-GUID: 99nyACjbKfBgp7bWRMQZ1LbVF385YDUm
X-Proofpoint-ORIG-GUID: 99nyACjbKfBgp7bWRMQZ1LbVF385YDUm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfX/AoUkJ6KBskm
 3Kev3nNJQUk51st5uZKwuL6O0BZlsMP/jR6rZjAS4Y8BOiZBx5M4w2N+kQcdiBZNnaso6yb0C8U
 4B8H5QrhJ3OMlj/gjVdlmN5oNUzD5LQ=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a564d50 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BifR_v5mCn8YSut0XsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119056-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40193756180

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
Changes in v5:
- Addressed review comments, reported by Krzysztof.
- Resolved all sashiko comments.
- Link to v4: https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/

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

 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  89 +++++++
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c       | 194 +++++++++++++-
 sound/soc/qcom/qdsp6/q6prm.h                  |   4 +
 sound/soc/qcom/sc8280xp.c                     | 251 ++++++++++++++++--
 4 files changed, 516 insertions(+), 22 deletions(-)


base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
-- 
2.34.1


