Return-Path: <linux-arm-msm+bounces-111937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iCncEx8EJ2rhpwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:04:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBB665985A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:04:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y9DjpZgf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XnTCjZJg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111937-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111937-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1457634875C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 17:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CFD63DB655;
	Mon,  8 Jun 2026 17:20:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263EB3DB63A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 17:20:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780939259; cv=none; b=CcDqJw0ih51hn2Z358BnPpaeSYbT6V2sya6yyE2uqI1uiJnpEs9bOZEad3m2Up6wVwPbishFFE1NZn4VTMDK2U2hnqkiadYJVN6KtCDAvoIyV+g7EPacnNWZnATIMhk3UIZMSOTEd3l1D6uYHSzJihNJ1SLIeGMy7vsCzL4aepw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780939259; c=relaxed/simple;
	bh=0jd7mihh8ACWVh4EcTW6xSrf8XmCjGByX2d8FT3LxWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D72/3zMYlZzhMKHj6etrSokO+f4cWSKmSsLE9sddzCn2BDZydPbtJAuZfleHbZmQvolTozBDnaATM5dVQk9LhySmvwzrMcSY7EntJ03x4mNN8z310h6XaIHCSRBTU/Umr5J75Ppuvd++HubmN8ol2Kyuz2/HlXSGNz2FzwJqT/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9DjpZgf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XnTCjZJg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFauf3596279
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 17:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbxt1HAh8ZL
	N92HDEFPV+qV+PKjudLTq4Va2vv6Rdg0=; b=Y9DjpZgf4Dc960FTPhvH+A7uB0F
	14Rxv/MCkwLly0CRGU7KPTWlI5kF6Dvaovna7kNi0vRwSJNGRlJr6Wcjgvg7A4xT
	EyvLdxG4UX0FrAyh59WoRuvxvt3vGU1SmSnJq/3gSRg3wq1AkG0DJlhz/diabl0r
	EENyJ367HE8NsfwcaXQEa8x6Yu3qHdzGCgpDzlrWhZdj1uHPd70elEDnkJiq1vk5
	K39MGqBamazt+AkSDexBjxsh9SXxwizkLcnTvM24y5csDrKApv+j47AUykyuNSR9
	prY5DM7r1iftllLuI5m34rSkFVgV37fA9ghGdzywLOrAtl2blYtgiNPA66Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj9tmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 17:20:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422ca754d8so3028089b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780939257; x=1781544057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbxt1HAh8ZLN92HDEFPV+qV+PKjudLTq4Va2vv6Rdg0=;
        b=XnTCjZJgH6qWgcXCv9y0SITTaz55BpdfMT2nUt+1uNONKgAjGRDT1piUxD1PKmS++8
         aYDHbsO+KgdydNHocnlBheCELnTpGL5XgEzZTe/QuLqh94y6+iN2vIL5qS/EvE2gH4xg
         qzYP2XoNtPpMAE66XKMKy3/JVy4t6G87R2CvM4iVS/3HgV+midBx2VlBAoMM0+XH9G8r
         QtjkCA6A6MVGVttggwRBQGLx1nP2IsfGEsAMN3bM0RCQeyt/SPTPdUjjSeP+HIk28ydW
         C9e9FlaQDitUG5PooKVzbKzRABNAsWcVdc9zHJbywaeBJXw5AAJ/E+DsfPxjRI+tHGaV
         yJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780939257; x=1781544057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gbxt1HAh8ZLN92HDEFPV+qV+PKjudLTq4Va2vv6Rdg0=;
        b=WeTcDxGuSwbXKj2LJfWK+aokQUX8Aeb/vUB8ADK1tJ7zc2mhs5nhYRPGuoPJeW/3fQ
         VfSqgYi4LFoZJXYyfbcQT0GnY28wvV63gAub+i7Yx1TiCYyLMP775NOr3ZqI7Lr+6YEC
         dglw+gRFnwn83YZrLZ4DwrArLxhdJ/r2liydUMSGSM731yKc+Svv9xYoXaQSJL4E7a3f
         aBrOZFFzgeX8wUvtCbytN6TT1Iul0RXNcgUGD3ejPC47C0EuMSRq9/TAZ3NEqeTgxy+q
         BSi1i70HLxR2HfbwdJ6QBroe55aVLhVAv4kUNjM4aceauPrlQTS9zWecYO6z3ITwg+Wy
         GbsA==
X-Gm-Message-State: AOJu0Yx3QSSb/2iWW43f/3lH/nPu0XCD8kPfjBmvduAbSjyzYqXeDvB/
	BQ7GoVOUaor6KBAx2mNnxYOMdv82H73/douXsVNKQGelIYBtI42euP1MJ1V9eQw9fEZGNMjjTdy
	tBdg4kJBpfgwL7pypxvbo7NjZZYusNkxrzEZfXjMwqTbZjHZic9Ir+JaYNqJqGJ4g9qO0
X-Gm-Gg: Acq92OFMT1jjMBUuvC5c7aYONsh+wurt04wtEb4wYu5Fz1TdccoWfXPa0KGVfSSnBM4
	SEWV2ZHuP8GGyY4zQlrFWIfl2ukzsMgjf2yUdsNmrFtmrAjFoQUZ3TyxCWq2f/9HmijgzeB9Bsc
	eGjK+sLkRcix2bz/sM7A9gKC6BPmQu4eOYXgOVH7ILIzj0w60fwz/TtH18NQAaoiWyRI9L2tLdZ
	FWE5NJcpnQ+WuXa3ReTxxWS3o0WpECHaRrWDXbHZUfk2cSDSmlXj8tJjHWy8QPoOjnM6bzOJAb9
	fXQa8t7k8y5/BBEyRiPaova5thOHSanI/AIH+LdjG+wKScq16jgDVb/7WZZre3Jm0psxz0G4U1n
	IFbZqtEAVojdLhyxMp4AzLswbuUkIcyq5tJWg8kPTO1JFdNG8yAuTwAF0+bKYq/f1AJwN
X-Received: by 2002:a05:6a00:2993:b0:836:3f6a:3e7a with SMTP id d2e1a72fcca58-842b1007c0amr16327390b3a.26.1780939256792;
        Mon, 08 Jun 2026 10:20:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2993:b0:836:3f6a:3e7a with SMTP id d2e1a72fcca58-842b1007c0amr16327366b3a.26.1780939256294;
        Mon, 08 Jun 2026 10:20:56 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm17590409b3a.7.2026.06.08.10.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:20:55 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] ASoC: qcom: lpass-rx-macro: Add shikra compatible
Date: Mon,  8 Jun 2026 22:50:22 +0530
Message-Id: <20260608172023.2965292-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OOpR42rzCwVhXPCFQ53rIjFNDYYfV7Wi
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26f9f9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8B9EPOnZN0DhMybeGFQA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: OOpR42rzCwVhXPCFQ53rIjFNDYYfV7Wi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2NCBTYWx0ZWRfX8S1awDcUSSLX
 JnG9qsj27JahC7HexcB9WwAUSv1bN5mR+0VQjDV5l0/pGcVirxrv174Hd81+y+Zc6NoYZXFwUSJ
 FkzHcBVJaRk1IKoUjkukd/22aa3skE9cvyR/jyXQ96zHngxRzURcwjt0Mg3RZlHkdnNm3PU0ZRO
 DjMhvFnh9nUP6Yg2JfNCapbLI01ysDXVFKB0jpERHlZR8guopDRxRc66PF/kAKpiR5BBLvShskN
 oLTPbcxKvMl5nGXiZ8VqLhWunU85apEioCACdaUrWBN5ciUIA5T3hp/C9RERSicR5Buw2XunA/K
 4lAsxO94g6ie+0VsFkbzkeaJrPJy1vje1BUoNf3Q3YrRH90OuovfSnNdzM3vbuo6KrjcIcnKdOa
 bOYsnNDACqCIoXi4oSBnE/myHyR1QVx14ejZ3M1/LI1MdtGYfMkoBacZMaWf4t9716mvZi+YvHh
 c5R44lwCU9aj2+xPj/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080164
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111937-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9DBB665985A

Add shikra RX macro compatible data and hook it into the existing
LPASS codec v4.0 flow.

Map codec v4.0 to the 2.5+ RX register handling paths, and enable the
FS counter bypass bit during MCLK enable when the platform requests
LPASS_MACRO_FLAG_BYPASS_FS_CONTROL.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-macro-common.h |  5 +++++
 sound/soc/codecs/lpass-rx-macro.c     | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 10ad682019fa..86adad190a10 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -10,6 +10,8 @@
 #define LPASS_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
 /* The soundwire block should be internally reset at probe */
 #define LPASS_MACRO_FLAG_RESET_SWR		BIT(1)
+/* FS counter control bit[7] must be toggled (v4.0) */
+#define LPASS_MACRO_FLAG_BYPASS_FS_CONTROL	BIT(2)
 
 enum lpass_version {
 	LPASS_VER_9_0_0,
@@ -30,6 +32,7 @@ enum lpass_codec_version {
 	LPASS_CODEC_VERSION_2_7,
 	LPASS_CODEC_VERSION_2_8,
 	LPASS_CODEC_VERSION_2_9,
+	LPASS_CODEC_VERSION_4_0,
 };
 
 struct lpass_macro {
@@ -68,6 +71,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
 		return "v2.7";
 	case LPASS_CODEC_VERSION_2_8:
 		return "v2.8";
+	case LPASS_CODEC_VERSION_4_0:
+		return "v4.0";
 	default:
 		break;
 	}
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 6233aa9f5bc6..3a3dec6b14cd 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -646,6 +646,7 @@ struct rx_macro {
 	int clsh_users;
 	int rx_mclk_cnt;
 	enum lpass_codec_version codec_version;
+	bool bypass_fs_control;
 	int rxn_reg_stride;
 	int rxn_reg_stride2;
 	bool is_ear_mode_on;
@@ -1612,6 +1613,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 		return rx_2_5_is_rw_register(dev, reg);
 	default:
 		break;
@@ -2043,6 +2045,11 @@ static void rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
 					   CDC_RX_CLK_MCLK2_ENABLE);
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
+
+			if (rx->bypass_fs_control)
+				regmap_update_bits(regmap,
+						   CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
+						   0x80, 0x80);
 			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
 					   CDC_RX_FS_MCLK_CNT_EN_MASK,
 					   CDC_RX_FS_MCLK_CNT_ENABLE);
@@ -3648,6 +3655,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 		controls = rx_macro_2_5_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
 		widgets = rx_macro_2_5_dapm_widgets;
@@ -3809,6 +3817,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	rx->codec_version = lpass_macro_get_codec_version();
+	rx->bypass_fs_control = !!(flags & LPASS_MACRO_FLAG_BYPASS_FS_CONTROL);
 	struct reg_default *reg_defaults __free(kfree) = NULL;
 
 	switch (rx->codec_version) {
@@ -3831,6 +3840,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_2_6:
 	case LPASS_CODEC_VERSION_2_7:
 	case LPASS_CODEC_VERSION_2_8:
+	case LPASS_CODEC_VERSION_4_0:
 		rx->rxn_reg_stride = 0xc0;
 		rx->rxn_reg_stride2 = 0x0;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
@@ -3961,6 +3971,10 @@ static const struct of_device_id rx_macro_dt_match[] = {
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,shikra-lpass-rx-macro",
+		.data = (void *)(LPASS_MACRO_FLAG_HAS_NPL_CLOCK |
+				LPASS_MACRO_FLAG_BYPASS_FS_CONTROL),
 	},
 	{ }
 };
-- 
2.34.1


