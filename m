Return-Path: <linux-arm-msm+bounces-118448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qOs9Hwk+UmpMNgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 14:58:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4A474196C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 14:58:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AEyxIa04;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KbVV9tyn;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118448-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118448-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FFDB301EF6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 12:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906123C9456;
	Sat, 11 Jul 2026 12:58:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2583CAA31
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 12:58:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774692; cv=none; b=Cbpiaww8xbktBOyycZgoFUjyfA332UnUgR3o17vM0cG9/KFrHbFW95GPYtKCtv59tiA1ToahAnDoBz4hGx0BbwqHGqWcbQ0UX6pzrJgenUQrfBP1qyf4d7kN30U6ELlWHyT0KkcNQ6fEh0CXKWcud9Ga4AOF5edmz0cT3YdX1i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774692; c=relaxed/simple;
	bh=YbS6dQCFVX48uGxNA9CbmvMJDrMYJaCKhqPv794VWTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=siKqSPtUo8VHcAD4kDECrUdOxdz3H2175zDu1TwqyUIeGBtokOWPrxhvEL7PfTGCboeleHWZpwALol7DNfidvdZRM7ALzuMToNztV1NJevXnyMbGq5k4gvc7RuWbvVQFgZGyi/6ZeKv/j/8l8V9htJZei/8MY246C2Sx4NE9PCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEyxIa04; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KbVV9tyn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAnnvS3476301
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 12:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x+8QOwpxkYA
	qy6i5nf9O32yYwrANC/lDlcX9pi0hY3U=; b=AEyxIa042iNlZ3FjZ5+nxWkA8rP
	Q4mVyNCC7bzVz7hJlEtNaiIfk888mg1cXasscwtrJJ8t0xNZ5tTfkNsmCKMEIwv1
	40jLTXkO/yntkz1HgIAMqxa2omBPHCU7GQa8XiK+/Xy8cOgJHPhmH8g8V1kJ4Hek
	G+bJJzYAnk+HAk0h0FEB4nuoOiEVv+E+C38Mt0Zxx0PUOxjemge+tVHjEwD5TlVN
	gVqggaYCXhb2n+hXPL0Bv4MNt7AJF8KIoANmuB7ahV+N+kBXA9kKZkJGgTMdpVEl
	x8v71jJRLJfAbKggm9dGr/QXhT+neVnx/xPhjpcqwsrbz5cu0WXWnDMs35g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbee9gu43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 12:58:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381250979d5so2038039a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 05:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783774688; x=1784379488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+8QOwpxkYAqy6i5nf9O32yYwrANC/lDlcX9pi0hY3U=;
        b=KbVV9tyn5P6E4Xisu3E7PA7/GYFivY0duw/khGotf/QOz6qNyPUGvvRjl2WQYvHaGG
         RLi1wnH3iyBaPt6yssRpPrpfF+5pf01UnAMJTwWdNLi5OkPXGCC0fAaikkeKiA4OY8Qp
         +6NiFZkpqRx66gTXq7bhjLIcaCdqZnVRyUO3kY69kZB/Mua6W0kBLb0QISKNerL+88CI
         HLE6XwIdwGh42e3rIu+NTVZsYq0YgORqPIC+CcoHsB8WIdScfKNgNuwf5sYWRZ90sdyx
         M2Z+/JjHMgBGrI2HemuUq0sZJ1mYjmEYgejdv0F1UxgBuiH/YYKb3NsKAPgg+ev/5tyf
         KcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783774688; x=1784379488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x+8QOwpxkYAqy6i5nf9O32yYwrANC/lDlcX9pi0hY3U=;
        b=OOofojtAE2DkMNPOifJUCJUMzY/UffY5CMg0J0F6kZj/WxicvcLhwg3Pb2ncTegO9J
         mV79ovcdOSQ9Ty9NkhU28hsb2u7ku3h9ZgKK71ScLETifrEB/FUek71rPkSK3/tsTthA
         u5bbqrqfBIgUYYq5Gd+jK5mHyM8z7Hw4kEmEHoEfrgfQ09D4jQ6IQPJNoD17ZhqE5tvn
         UcJZX7w+H83QvZZhrWLvDY9pwgdssSuy2n2hHMRYER+xodfvesyHL8OS+axU+vgZ7iB9
         8HMr7k2cE4VlKnTclg4sd/w6/v4zOukOGSSqhQIwpdPgibuLjNcu36sJQJwZAjF3zT4q
         OEOA==
X-Forwarded-Encrypted: i=1; AHgh+RoyACShwpjz3NIWbFfbZytLAatKSJfRNnUwebw9Ejihl9bviF7cebo2jA0wHKK86VymLaJnhZOTK8fwg+2C@vger.kernel.org
X-Gm-Message-State: AOJu0YyIySGgYJMFPn/RWmWJ2i6Sr4zJ8yEpRSUWP6zXI4+YvBoRRbGu
	3oTb05yzDDJzPGFwZCwE4vLfuBx9EpclnhzZF1ie+G20CDEGXm73yMHPne7lh0DDptR8lWws6wO
	v7kIkn160XGPSvzAcLuZIOGTGUA/QZ/bmQjC98SEWODdwyoqLIRn5XG2TIPvPvLN/bmiF
X-Gm-Gg: AfdE7ck3wqE/9kenYJoLHT7+gWFIm39yZK9M/TXzImw/H3MfHcmJxGZEeim1fdjaMjH
	pTT7iWMKLHMNclToVbxAB5WgEXJk0sITTMKWv6iZWV5JnESKK1Zn5gdbz72//IKlG7pFbvm5uDa
	Ej64/UMBg3eKuHV/wXCHn9az4lD2oqxBcdOyD7sp9IQpZFD41t4XUXI3uBeaHxgrAco8SAX5edg
	sOL/nkNtlzOFz5ue1fgxPth8avmIKeUNMtYdXUvwXtoPCZ7Ntw1Magr+MCSzpng0PbsalYP5HKB
	0nHbERSzCcEGLrL4/JCZNEOfkKRYgM/DNdJr5AAOrwK3hpE60eFgPSjpP7JwBiTPWf5ktJP68fr
	voUMwTnU+D7ajqhf39M8BeuqDh5W6DysjZSGPsR4Dy6fLC2Y=
X-Received: by 2002:a17:90b:4fc9:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-38dc782c715mr2811789a91.4.1783774688363;
        Sat, 11 Jul 2026 05:58:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc9:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-38dc782c715mr2811756a91.4.1783774687853;
        Sat, 11 Jul 2026 05:58:07 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm11185634eec.23.2026.07.11.05.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:58:07 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 3/3] ASoC: qcom: sc8280xp: enhance machine driver for board-specific config
Date: Sat, 11 Jul 2026 18:27:40 +0530
Message-Id: <20260711125740.3083236-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEyOCBTYWx0ZWRfX5rTMjRSOU9km
 8doN9pCRuA/R3yn/05TQ1h17voyW1ANDaoSqVpqaqlmdN5mR/wdEjhmYYYHa+Evumh6fQvtXpU2
 P/uP+u4RzgpLS8wnEi/9au8sTyYLycg=
X-Proofpoint-GUID: MDGhPVYcJj4ySoMfwqoRLcWZUvKOnaIr
X-Authority-Analysis: v=2.4 cv=a7UAM0SF c=1 sm=1 tr=0 ts=6a523de1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=T-rPskIIbrx-efRHNJwA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEyOCBTYWx0ZWRfX3Mz3yonpUlMt
 xPCtKjlPp/JBuvGRlZf17iyU8V+fmVjEp/lzhdzMQDdvNfN7ZS1dZ8B+zynWmD0sNwhftMl7lvF
 EVKWT8HaXfJDAzlDT5OZn1r41tz332OuflkMAUOqn74hqDFusQ9boU9BH98uDfgVFPLi62ZjmdU
 f6ORYmpNEYpn1WlDlaOua+jE0ig1gWS8fTXSNptLVA53duUiN97zKEVhdig07co8mVTa0db+qTD
 JXXA/DgcTk0YBVI2sqxd0jmPcAesGz1kDs0VAPuJslk43kB09ZI65HXACxWlUa6JNO7uBK9wVh1
 9gfvbgLSTh3A+8C1GfiqaCXq9uRHFO6QiT7qn/7qsUFDMeObBEzLSmwgBETdZPK9z8hbxS3FE7+
 NnLeDhLP8ZvdEp5xp39noD9XBt1nEIKfNFl5FcAZiFluesWYX3Uw5VwpBMHQ6bhiULS3pK+COlp
 7hWXm3I+71BtPvIGswg==
X-Proofpoint-ORIG-GUID: MDGhPVYcJj4ySoMfwqoRLcWZUvKOnaIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118448-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D4A474196C

The sc8280xp machine driver is currently written with a largely
SoC-centric view and assumes a uniform audio topology across all boards.
In practice, multiple products based on the same SoC use different board
designs and external audio components, which require board-specific
configuration to function correctly.

Several Qualcomm platforms like talos integrate third-party audio codecs
or use different external audio paths. These designs often require
additional configuration such as explicit MI2S MCLK settings for audio
to work.

This change enhances the sc8280xp machine driver to support board-specific
configuration such as allowing each board variant to provide its own DAPM
widgets and routes, reflecting the actual audio components and connectors
present and enabling MI2S MCLK programming for boards that use external
codecs requiring a stable master clock.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 252 +++++++++++++++++++++++++++++++++++---
 1 file changed, 232 insertions(+), 20 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 98b15a527e37..eea571de9d12 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -12,17 +12,78 @@
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
 #include "qdsp6/q6afe.h"
+#include "qdsp6/q6apm.h"
+#include "qdsp6/q6prm.h"
 #include "common.h"
 #include "sdw.h"
 
+#define I2S_MCLKFS 256
+
+#define I2S_MCLK_RATE(rate) \
+	((rate) * (I2S_MCLKFS))
+#define I2S_BIT_RATE(rate, channels, format) \
+	((rate) * (channels) * (format))
+
+static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_SPK("DP0 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP1 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP2 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP3 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP4 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP5 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP6 Jack", NULL),
+	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
+};
+
+struct snd_soc_common {
+	const char *driver_name;
+	const struct snd_soc_dapm_widget *dapm_widgets;
+	int num_dapm_widgets;
+	const struct snd_soc_dapm_route *dapm_routes;
+	int num_dapm_routes;
+	const struct snd_kcontrol_new *controls;
+	int num_controls;
+	unsigned int codec_dai_fmt;
+	bool codec_sysclk_set;
+	bool mi2s_mclk_enable;
+	bool mi2s_bclk_enable;
+	bool wcd_jack;
+};
+
 struct sc8280xp_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
+	const struct snd_soc_common *snd_soc_common_priv;
 	bool jack_setup;
 };
 
+static inline int sc8280xp_get_mclk_freq(struct snd_pcm_hw_params *params)
+{
+	int rate = params_rate(params);
+
+	switch (rate) {
+	case 11025:
+	case 44100:
+	case 88200:
+		return I2S_MCLK_RATE(44100);
+	default:
+		break;
+	}
+
+	return I2S_MCLK_RATE(rate);
+}
+
+static inline int sc8280xp_get_bclk_freq(struct snd_pcm_hw_params *params)
+{
+	return I2S_BIT_RATE(params_rate(params),
+			    params_channels(params),
+			    snd_pcm_format_width(params_format(params)));
+}
+
 static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
@@ -32,10 +93,6 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
-	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
-	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
-		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
-		break;
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
 		/*
@@ -64,7 +121,10 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	if (dp_jack)
 		return qcom_snd_dp_jack_setup(rtd, dp_jack, dp_pcm_id);
 
-	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+	if (data->snd_soc_common_priv->wcd_jack)
+		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+
+	return 0;
 }
 
 static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -96,6 +156,63 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	int mclk_freq = sc8280xp_get_mclk_freq(params);
+	int bclk_freq = sc8280xp_get_bclk_freq(params);
+	int ret;
+
+	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
+	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
+		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+		if (ret && ret != -EOPNOTSUPP)
+			return ret;
+
+		if (data->snd_soc_common_priv->codec_dai_fmt) {
+			ret = snd_soc_dai_set_fmt(codec_dai,
+						  data->snd_soc_common_priv->codec_dai_fmt);
+			if (ret && ret != -EOPNOTSUPP)
+				return ret;
+		}
+
+		if (data->snd_soc_common_priv->mi2s_mclk_enable) {
+			ret = snd_soc_dai_set_sysclk(cpu_dai,
+						     LPAIF_MI2S_MCLK, mclk_freq,
+						     SND_SOC_CLOCK_OUT);
+			if (ret)
+				return ret;
+		}
+
+		if (data->snd_soc_common_priv->mi2s_bclk_enable) {
+			ret = snd_soc_dai_set_sysclk(cpu_dai,
+						     LPAIF_MI2S_BCLK, bclk_freq,
+						     SND_SOC_CLOCK_OUT);
+			if (ret)
+				return ret;
+		}
+
+		if (data->snd_soc_common_priv->codec_sysclk_set) {
+			ret = snd_soc_dai_set_sysclk(codec_dai,
+						     0, mclk_freq,
+						     SND_SOC_CLOCK_IN);
+			if (ret)
+				return ret;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int sc8280xp_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -117,6 +234,7 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 static const struct snd_soc_ops sc8280xp_be_ops = {
 	.startup = qcom_snd_sdw_startup,
 	.shutdown = qcom_snd_sdw_shutdown,
+	.hw_params = sc8280xp_snd_hw_params,
 	.hw_free = sc8280xp_snd_hw_free,
 	.prepare = sc8280xp_snd_prepare,
 };
@@ -145,38 +263,132 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
 	if (!card)
 		return -ENOMEM;
-	card->owner = THIS_MODULE;
+
 	/* Allocate the private data */
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
+	data->snd_soc_common_priv = of_device_get_match_data(dev);
+	if (!data->snd_soc_common_priv)
+		return -ENODEV;
+
+	card->owner = THIS_MODULE;
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
 	snd_soc_card_set_drvdata(card, data);
+	card->dapm_widgets = data->snd_soc_common_priv->dapm_widgets;
+	card->num_dapm_widgets = data->snd_soc_common_priv->num_dapm_widgets;
+	card->dapm_routes = data->snd_soc_common_priv->dapm_routes;
+	card->num_dapm_routes = data->snd_soc_common_priv->num_dapm_routes;
+	card->controls = data->snd_soc_common_priv->controls;
+	card->num_controls = data->snd_soc_common_priv->num_controls;
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
 
-	card->driver_name = of_device_get_match_data(dev);
+	card->driver_name = data->snd_soc_common_priv->driver_name;
 	sc8280xp_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
+static const struct snd_soc_common eliza_priv_data = {
+	.driver_name = "eliza",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common kaanapali_priv_data = {
+	.driver_name = "kaanapali",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common qcs9100_priv_data = {
+	.driver_name = "sa8775p",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static const struct snd_soc_common qcs615_priv_data = {
+	.driver_name = "qcs615",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.mi2s_mclk_enable = true,
+};
+
+static const struct snd_soc_common qcm6490_priv_data = {
+	.driver_name = "qcm6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common qcs6490_priv_data = {
+	.driver_name = "qcs6490",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common qcs8275_priv_data = {
+	.driver_name = "qcs8300",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+};
+
+static const struct snd_soc_common sc8280xp_priv_data = {
+	.driver_name = "sc8280xp",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common sm8450_priv_data = {
+	.driver_name = "sm8450",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common sm8550_priv_data = {
+	.driver_name = "sm8550",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common sm8650_priv_data = {
+	.driver_name = "sm8650",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
+static const struct snd_soc_common sm8750_priv_data = {
+	.driver_name = "sm8750",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
 static const struct of_device_id snd_sc8280xp_dt_match[] = {
-	{.compatible = "qcom,eliza-sndcard", "eliza"},
-	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
-	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
-	{.compatible = "qcom,qcs615-sndcard", "qcs615"},
-	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},
-	{.compatible = "qcom,qcs8275-sndcard", "qcs8300"},
-	{.compatible = "qcom,qcs9075-sndcard", "sa8775p"},
-	{.compatible = "qcom,qcs9100-sndcard", "sa8775p"},
-	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
-	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
-	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
-	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
-	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
+	{ .compatible = "qcom,eliza-sndcard", .data = &eliza_priv_data },
+	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
+	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
+	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
+	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
+	{ .compatible = "qcom,qcs8275-sndcard", .data = &qcs8275_priv_data },
+	{ .compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data },
+	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
+	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
+	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
+	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
+	{ .compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data },
+	{ .compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data },
 	{}
 };
 
-- 
2.34.1


