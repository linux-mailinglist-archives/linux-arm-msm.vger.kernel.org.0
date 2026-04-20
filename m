Return-Path: <linux-arm-msm+bounces-103830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA5zGkZq5mmBwAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:02:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5B14326A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 20:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5DD6B3003625
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEF13A962C;
	Mon, 20 Apr 2026 18:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+n1IduE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLcE+BH9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6FF3A9D80
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 18:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776708163; cv=none; b=n062ELMycfFkLPW7kO37hfQ1JcY64kgC+46ozNLBTY6TLoXTb2A+1FIkNDIoq5zvfcRtea8Hcgs/xQwyRffc71wyZ47qV35uTyX9jKywVNFdjVTe3akqLTjdKfQjrgQSdG75pFoUqVn+jh5srbwbfgsCuHVG2k8k7JlxvkHIeAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776708163; c=relaxed/simple;
	bh=A+aPeIRe0lqmFacrQvtrEiA6ZTPnvGUnK7nLxima2so=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HinhzCjZi1o/Nrt4ZgvPsUvtLddGdI2JPMtESdPTERCgtKdu2Iui3szdgNntb+TBt/pRq6bSRBA9jiDnGfqhwD+GfSUBFqxxd4mSa4iLGHQurClhJWWpn0w3Ff2RGQuZYK6h8tsaYQbgCETGf3IIoq2WOIFRq0aG0A+ELEu60c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+n1IduE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLcE+BH9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFY3dj1599858
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 18:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NgFEHxXc/nf48ZtQeN2Z1XAjufMKoc5zQYi
	TnlazxfY=; b=G+n1IduENK5+xSbVvxhdMmcMC3D6fwe5CZUGIqwJvrjM7l8QOHu
	M5E5iUXdH+NjstJk3HKcsSRmg6RTeBbyCx0UE/PD8MCcguYmg5zkwh1htdURP7N/
	VHmCoM8MpuHX5tYv7OeMH3eUUAItBrek2fmrAKjdyr5nzAY9tekUtpMv6zTvNywj
	zAuvHMFxWILA39nuAQoPt3pLPbqMx3/OkqFOlNlKMAVS7SE8q+7ZMJC3O5fcO97Q
	BiJa2P1PizX4vXr5zHZgQujYo5917K1jRXWrK99E6T0CqM2zrG8JGFMOMWept1Di
	3qNbxHI7gKZRIX+FTWZXMQjKNA2hu+k0IHg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh899yr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 18:02:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3595485abbbso4034420a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 11:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776708159; x=1777312959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgFEHxXc/nf48ZtQeN2Z1XAjufMKoc5zQYiTnlazxfY=;
        b=VLcE+BH9DAC4i2MePJLtbZnmzr/AL8nnFAENnn384EvyDKdURzPxVmpGmKF3zdOHsm
         7QLqy2BJpyrPxpCvyiQChiE/vcqLLoOm1jU4rgb7YZdZZuzIgdOZ8618kpeBjxn6sOx+
         Cabk9n+GGKyixG7MVrYvVElEV4Alwnz1vvCp1vWKZ226/66C/VOU02JA2d+47jJSb0NJ
         fWF5eVXzfbFsRw3w9pAmbgp/uYsPrQGHD3W7kJcoD21HRNByqaYkLMuKLf3/Gots4z6e
         lcOm8Cy51dofNbLlR9aAKTan8gQCiMWIpcyUIpBK4wuRpnlUbJ5xY/c4Fmg0+KNCJf21
         7ZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776708159; x=1777312959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgFEHxXc/nf48ZtQeN2Z1XAjufMKoc5zQYiTnlazxfY=;
        b=nwbmxlWvuf3P9wZFKbd4/ZHnkiGQ3CHzD0WByT1A/PnLhXKUQp3RufOWvczZUavB0j
         DsTbFltwu2U53G6ATwTT9HQ36+aJ7NioJKYLf264rFtxRs99Dkkl6m1hWNsTGsGnpWR2
         1i5TBEPq1IDd5ZFi60Pa2NZgYUCvqgQCqtr/pBX41tThuSWRe2KkzKEErEr9H2h8faUv
         6RLn/BBwI9rJj3xWznybjQWiI210DXzI8AJfo83WiSsQ3JNYikx+LnqpVIA8XyoYNY/0
         23ZS0r0lAYdmQx0sQbn7XWuxPYeZM+zLH2ekXJ6JVEHqMTMjb1vQ8QXrgt46sy2TRXWC
         Ia6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+1DaxuhD+S9z8cluP8LVWl3Q02IOhD9BrZzkmGsTevqUST9fzrOy0h3ixmfEGLDKyK9rW6qhS9wLBkGe7+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmo7Sn/P1juNsMpwKlH0ZBfpg7kHihsgZjvEpNx95P649AQ3hG
	o/lvaBVd6N89FW1fKoi/P/56Z/oss3PEKHVOeafSbt/e6j33AH2YeR2N1Y1ra0I5QwSyvYYd1y5
	TzocZ59MEwEEPZphSqZnspLqlmWx1fFSsygRB72hgy2znLHQRWaW1l71P9bXei20TLts+
X-Gm-Gg: AeBDieuBjMOus8qqTJixTTukfYvYhdl282YXwUBwDr9CC1yT0uYTpUNE3h+Rezv3NxD
	Zbntc3TUChvuS7+FrwKoKO6ObFtrLGwPKC2h4asQDyaL3R/AuB5UGS/LDd8Jt2NoqnbsRIpfpIk
	fDeQvbTzGUXFz6RqhRFRsmo58k9twmP7vjcePIbkdVPUN1wTykzEZBuw0XK37rHS1EZwYigEKlC
	TvdtxRk0r913QpwGTtxkpN1us+s1eRvdk74wHoKa0z22S/GYCcNxW7CmpsgYMO9SCHWD2qDJYEc
	6MbQzr8smBv6Z1KbZoFPtuPI4Kn2VuiAW9vHZ/tPJMTX2Khi1FZX8P3zOXovlkZpcohM50Q3r6M
	mk259VVzp10b0vxqAClX8Cycc9lg8geK1nQt12YRPHivi84Q2IgY/Xp2xPsjb
X-Received: by 2002:a17:90a:f94f:b0:35e:576e:5bc with SMTP id 98e67ed59e1d1-361404990eamr13498749a91.25.1776708158731;
        Mon, 20 Apr 2026 11:02:38 -0700 (PDT)
X-Received: by 2002:a17:90a:f94f:b0:35e:576e:5bc with SMTP id 98e67ed59e1d1-361404990eamr13498695a91.25.1776708158089;
        Mon, 20 Apr 2026 11:02:38 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36146ae9cd8sm9170775a91.11.2026.04.20.11.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 11:02:37 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH] ASoC: codecs: wcd937x: fix AUX PA sequencing and mixer controls
Date: Mon, 20 Apr 2026 23:32:21 +0530
Message-Id: <20260420180221.785113-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE3NSBTYWx0ZWRfX1P6WtSIkk0cx
 b79aNyjtHosM8vkdmJu5sgkvnRdKU9jM0jc9UU/aAlY+4GEFDcrqkWKuV1P5CjSMI2Tn6t5czHP
 0bQcnkbwlXNU5R+CccdmWXNV3Tbot2Ui4x+Y7SXr0TS0zCFsSkeD6cmRiuGN9fNmq2FILVUgRb/
 M7LAGahyvo+ph15d+nHFIE6zW4Y4kQBqxvWlqlwVt5tbWMTYuv+33Q/kdtJRzY4V3BPbsEzmGuV
 6ixd/kDUmyYD6Hz/jYTnYDzYRJmm/aDwJw0/KNZQE6btGEPClzWbJJNbUkI2IsHHW4rnut6kly/
 S+qK53kmQFcAdQsOWIdPhbvlka7eO1rph173sqSgrEungTIBwcqgx9l6wSuMXawBHWH8KbW5oax
 83hH4vWcpcEQdTGJb0+vEeSvuKkyFD/+bJRkUIJ20eI1YOKig1I0TBGRD+r4Dwxicm816oq/jtO
 VlxqMl5ekRrpmmd258Q==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e66a40 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MDa5g-1UvR_uta72_iUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: qWYh56OXA7HNY9W1tRvhQSmaWru0wHxS
X-Proofpoint-GUID: qWYh56OXA7HNY9W1tRvhQSmaWru0wHxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200175
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103830-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A5B14326A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable AUX PA sequencing during AUX DAC DAPM events and keep the
AUX-specific RX supplies enabled while the path is active.

Add the missing AUX-related mixer controls, including CLSH PA and
DSD left/right switches, so AUX playback can be routed from userspace.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 10a2d598caa7..72a53f95d688 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -546,6 +546,9 @@ static int wcd937x_codec_aux_dac_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component,
 					      WCD937X_DIGITAL_CDC_ANA_CLK_CTL,
 					      BIT(2), BIT(2));
+		snd_soc_component_update_bits(component,
+					      WCD937X_AUX_AUXPA,
+					      BIT(4), BIT(4));
 		snd_soc_component_update_bits(component,
 					      WCD937X_DIGITAL_CDC_DIG_CLK_CTL,
 					      BIT(2), BIT(2));
@@ -562,6 +565,9 @@ static int wcd937x_codec_aux_dac_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component,
 					      WCD937X_DIGITAL_CDC_ANA_CLK_CTL,
 					      BIT(2), 0x00);
+		snd_soc_component_update_bits(component,
+					      WCD937X_AUX_AUXPA,
+					      BIT(4), 0x00);
 		break;
 	}
 
@@ -730,10 +736,23 @@ static int wcd937x_codec_enable_aux_pa(struct snd_soc_dapm_widget *w,
 			snd_soc_component_update_bits(component,
 						      WCD937X_ANA_RX_SUPPLIES,
 						      BIT(1), BIT(1));
+		/* Enable AUX PA related RX supplies */
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_RX_SUPPLIES,
+					      BIT(6), BIT(6));
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_RX_SUPPLIES,
+					      BIT(7), BIT(7));
 		enable_irq(wcd937x->aux_pdm_wd_int);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		disable_irq_nosync(wcd937x->aux_pdm_wd_int);
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_RX_SUPPLIES,
+					      BIT(6), 0x00);
+		snd_soc_component_update_bits(component,
+					      WCD937X_ANA_RX_SUPPLIES,
+					      BIT(7), 0x00);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		usleep_range(2000, 2010);
@@ -2051,7 +2070,12 @@ static const struct snd_kcontrol_new wcd937x_snd_controls[] = {
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
 	SOC_SINGLE_EXT("LO Switch", WCD937X_LO, 0, 1, 0,
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
-
+	SOC_SINGLE_EXT("CLSH PA Switch", WCD937X_CLSH, 0, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("DSD_L Switch", WCD937X_DSD_L, 0, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
+	SOC_SINGLE_EXT("DSD_R Switch", WCD937X_DSD_R, 0, 1, 0,
+		       wcd937x_get_swr_port, wcd937x_set_swr_port),
 	SOC_SINGLE_EXT("ADC1 Switch", WCD937X_ADC1, 1, 1, 0,
 		       wcd937x_get_swr_port, wcd937x_set_swr_port),
 	SOC_SINGLE_EXT("ADC2 Switch", WCD937X_ADC2, 1, 1, 0,
-- 
2.34.1


