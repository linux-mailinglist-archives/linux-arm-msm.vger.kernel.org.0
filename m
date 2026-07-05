Return-Path: <linux-arm-msm+bounces-116585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YMPdKG2zSmpnGQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:41:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C370B0B5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:41:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Ct1DBvNs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XLh2ed37;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116585-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116585-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9F0E6300BC64
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B143A641B;
	Sun,  5 Jul 2026 19:41:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AC92D3733
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:41:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280475; cv=none; b=EvzQhZZxW1vkZbcPWu6q1/Eho1lF8gys59HB/R5qZAuzarzaLg3GAKyN4j9sYf8H/Z2Px0craE5sJyNmAN9Dl3kAS2VF146wUq6dTMIICANpwhJ+zT1fqVjgIXw9rTNm/ujKHlNr8PgtJ7A63oUAfCKuGHeYmLwboyaSGZwnqSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280475; c=relaxed/simple;
	bh=c84j3cN4itWiI6muK0J93G40mdQrPz9ghprJZVQe+x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TwTC0xlhOgQQr7UyvxbfsXgr1/eJRV7xxSLq3a4wdcAIDtVix3kvMu+4rmrIP5CO2Z7I8vqjFpMKleD23ieX7CZI0jaIviWX4ojnQ2ICKHNd0ZHktce1CC70zjAegYLpyTPGwK/h8Fy8s82zWtq3Ql7T2MlA7ADWuHI5VQfa+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ct1DBvNs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLh2ed37; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhvUE2190406
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 19:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SRfBxbqW9Wo
	vwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=; b=Ct1DBvNsXtjXHhkOELxVhlpg6H2
	368Ld+75DkSj9KAbDdr+dccgJj5ELmVwXoWTwLRHuHRoMLG38NZA0i/dYf4N1Wwc
	GWDVGhaX3gkzJ/KUCjenkhf61SCvn7auxPGY1ifqGqoeJGMpHLM7TwdqAnd1zKxe
	XDmUTqO6867KN13WAC/hp1ycv49MufxZfENMTnh8m78LYIQT7d23L1S4XHIN449b
	smnhxYrxjaGQqsh6wd2AOVf/dnd9Fv/6+cSQqRdhbmEolxNJN1SJpi8Ey2Pa0lIw
	zunl7f6VOFaCAF/wwQuLKChNn1SjxkzDZMRnVULom/ITViFNtbylQf31vYA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf83595-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 19:41:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso3610602a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280472; x=1783885272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=XLh2ed37dvHc7XzXS/cWMoiVcQ+cm55j8XQ470JYNZzOISNpVRWL9CALQnAGKO5ega
         gUrzPWIjYRv89cCGRWiwTdCWASzw14J2zC+QX1HgosWctvLA8SrhdGxwSYgGYdwAOzZj
         GHVOYGSuZw7Cm1xLqvkO8w6RYBaWqZQDdI+3RFoc3lVImoPQHTlgtpwo5di9XfqdpkE/
         09by+fK13IyTAFyCGgm7n8mmWjQN5VNU4miovhKl1q2FIY7rYGJDFwAa5ryfGuDbSHWM
         02C89cD7F54ykTRiOAh0YbF4nMvYcFWYdikw/PYvfiD6O0jOvqq41wyX0T+KviTE2IGP
         RfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280472; x=1783885272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=CkC6JQ+2ZVhwsdZPdfKw2Axwqps9RVm+53tTTKJ41IcsNtUs8n5WpMs+dNXMdMz8Of
         WBspMXzTJ6+QqztJwEua4xNlAmlyP4ifJVqdEH0ZiuLFxF8+Mega1OWS4L+BnNFmsRAA
         ESuviPa0Q5y7LjcrC0KBM415yJ8alaQxZRlYR84YXzJIxuyLrXc68GFoCD5nQsSi2P6G
         NU37CCvaYCh1Et80WQnnnNb4P0ms+E13LlEFHnj5cxaBhQlw6b609eAUk/jx1i7PLzoj
         pIm+UCEpLjI1Lhnid1NCf14KNVQKopn0NOsctrTXiS0UXeVn1QOOM6DITzZNnKLgYlfc
         PVKw==
X-Forwarded-Encrypted: i=1; AHgh+RqrAMCNDccjMO8kIRVN4T2ajkD4D2zLVE6YEjnXzdsFyVL1ZTGbj0OXEPax58Drl+KXq0aljwcz20WW5iUN@vger.kernel.org
X-Gm-Message-State: AOJu0YxOo8L552caXo3yvO/qrgWsKSMBnJaXKULFLlZm714YV3w5p4zc
	IAqw7EihPkjOcmpdeWMChq7lEdI0WF2mHRy3WHK8k5EC8k3fr0dWhXpWe6fTSjOh3vDJrDALeBx
	GvBj7wIYEZr4jUjLCPFiTI2AzVFw6ZaPE8ky1fVJX3f+mYnmZYhlUwfm+Er9jcy2ju6bv
X-Gm-Gg: AfdE7clgHHRoY/Fyhg17au1jEkoBIA1+JujrakNecA6ZB3g2tom2LMHY0HlIhT7aeHx
	J5trEyE+MKQNzJdjYkbCTLfi8cpHdpn7yTR7AKaMvrqJE4gnlQKEbGuxoQpJwAZkHW2e3VEL++w
	gCx19uK5iMZjnMgEUSvg+BH7fg+1V7+XgpRk5AxUfs4H0YkZ1r44QbPldugai/yXHz2fk5pSdSE
	+7/Je2gM+mhcVT2aeMhTt3ySIZvq8xbphtUfFBR4RTM7tqrCAj6oXXgg3tnSiPEw/lkgp4b9B9P
	JRmnO1pII7MurqrZONx31hrILr2v7UAlWNw+YYMpatyMlE8Teb81N+4UR4wKYPoz7xOWetaN17u
	0+Z1if/yfhg3ZdASqRUWOalElafkDqCC9Yt5feA==
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605441637.10.1783280471647;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605425637.10.1783280471121;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:10 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 39/42] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:15 +0530
Message-ID: <20260705194019.2565498-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dARtbXcE43BibU4vyVO9hh8Mh2DbAZJo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX42osvjlVIii/
 lCBwO5Ft1eVxeasth8dDlyfp6yQYIq5pBNBsR43Jwk1dPE+/U56TpHK1cVIH/GPfSH4f+5hakWC
 jD3DpRCaiY/f/fDQ51U10HmsYcmjM5k=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4ab358 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: dARtbXcE43BibU4vyVO9hh8Mh2DbAZJo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX3u03G5OHL/40
 06Toe6V3lDjBMi521Di4NSt+XQ2VyYsxpnrdDvepdyG/18uQTUKBoId6Xo0UM4NTxhJU74Oknwz
 I4ONNbHxk2N+DDsZw8fshzWjXoM1p+8x4hyd2glm+wu9JZDpo6IR7LR+aecSoh+iiWpvO+SIcg0
 tL/5HWEO2i5E47KE+GcNVxHLkPQU+L/zDlJYnOJSEU7q/h+YRoq1lZzXrZvTbnk8uE6aekmilBj
 iJS0I/Tua9wuFQ6LAq2l6Ddo3+qvY/1VHVG21E6kwSXNZ0tjgA/h+e5+cRRancVENjDvMoA97Xg
 1Jd3UAeZkz+IuIIhmN9O7sdW5O+RXw/XmeTFubKFDPJMfCwiBFi479sAPIIWmUGRiIatPbK+bAS
 xmhK0NCHfmhOp7EKi4xuqMWtoyeqYTvTbi93qbJ+4rzCCDIy5g9xujZl6n71DOAdNOWfJTRPWhE
 oeXVMwkFW/yp+kVCSEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-116585-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:sound-open-firmware@alsa-project.org,m:konradybcio@kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D38C370B0B5

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 4d6e9300a9c0..e4b6b6c18e02 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0


