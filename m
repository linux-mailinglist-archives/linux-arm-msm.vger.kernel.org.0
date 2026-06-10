Return-Path: <linux-arm-msm+bounces-112336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MtheGdscKWqBQwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:14:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFD0667039
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:14:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OsztrHXk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NRA2VkMr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112336-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112336-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C268C30ACBF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26334397AF2;
	Wed, 10 Jun 2026 08:08:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0221A376BE0
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:08:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078908; cv=none; b=fNYv6hz9sLemO1JxdiLk3semi/67eU+8Ec+PHbf1jISQKndlqtPJtM8tLDg/06VCU/YJhQCNvVz7HSrbuApaDUCP1BeF+ah/mUhnZ654GuirVTrdw3CcxTsHc6xjMAK5NWUhehhpQdK1E45l4PxiHFf5gDvLQP/2fAxR95EX6gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078908; c=relaxed/simple;
	bh=AY3as8coQIhQU3s/ix4OCkPvNDef/1OzdUAbu/ZM/9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JXRrKHMbgBHRoe1/Ohlf23F2+uPjm/m35u7NFvo46DZWdU0t8xSspQF/XfEkrE/ZnTKPnX2KgSDuprqAsGicAi6fgmtKOAGXtR4uh/QqPBQ4Pw0eyRHstfBNlRo6n61M2SF2hvmzYkMktdtoMO7/lhkidMwx8kTVNt53p8TgIEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsztrHXk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRA2VkMr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hlv4469513
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PVo5QyG3TCPUPVzN80d/ywq4altrwXSl6ez
	L5d/SGIw=; b=OsztrHXk/+bYuLaI8BqJLAbe/t9tvDErz4lUHiPGXAd+3/47YQm
	Ho5WJKVBIEj8kjwQilHyJ2+0EF//KP6ImVkGrAo4cIQBuBxkDy4TXoExCUZ2/THj
	2Gt9YoVKl2LQGBtYXwMbcOaNU4DTF+b1CNr+gUFuHRjcLJEit39PNZvrRn6p+aZ8
	NhiyFDSrejDurolA5n0kXZhJ5e7wJyKQu9+JU4OdvaJu/rOsVs5EsrbrHNR0b3xy
	t/wYYQ1TegMEc6D1Y+Sh0PU++j4Pw/NnowyP64iL57if812iVOO9hnp3l5M8SUIj
	cwirBOXxOC7KD7fRIcFANbwbJ/IEgH5GvSg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvh5wa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:08:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso3897732a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781078905; x=1781683705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVo5QyG3TCPUPVzN80d/ywq4altrwXSl6ezL5d/SGIw=;
        b=NRA2VkMrmdEsBAyVsE9eRQQnlFI/x1HAUCmtXO96PCSbpAkI3fNZoFsIG0ZVOLLKgb
         ovPSjbA7maiVY8u+ertWPVYpNSTaRqHj0zzFEKP1A+i7JCI/9A35vm6eX34ylrhPaiuI
         T/NODw2eLQM7/9Q/ETMXG2efjLrnTxKUR+nMXhSNK1TTIEW78fAuO715ptT1r0JY5HZa
         wOV9DkZvychgOz9dVkIL4NyP43u/yU4pQWRXTp+b9StXEnQM9htgbifWdsphI7sP8ykJ
         nTyKQoiejVxWRwj6lebQjGwIqsjX5z2BQJAgfZUmfJGJRmh2cqMT+/gst8LjmdbcRRA3
         ugnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781078905; x=1781683705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVo5QyG3TCPUPVzN80d/ywq4altrwXSl6ezL5d/SGIw=;
        b=kDbTWCzn9JTB/mkPBOpLTzv2fHTkaWzZp6GyE3LEPwKlHqayYR2aBs6sakFbNl3Swv
         HLyt0XebjMWdhkZet0V/hmxry/XWchJPxqmUXEaG43s56cvuUHwFX/HaeSWsOdqhiawQ
         PhzqI2s8zdrgWT7A3VQlWw9bnIaiQuE+CdnTbZNI0zF9rsRLe8m+3C72Nm72a8bcjj2j
         jYEWlcguILGesuVe133J5Hve8zhnFWKqWJdCgXbAW4KC4z1N8ojs/4ATA/pEaT83i4M9
         uYz4BcTJgMSGX4MQppoXV4X7h1heORywBbY3nHX+G/QvMvI5Dhc+5LVQ3RiwRTDSXrZn
         j25w==
X-Gm-Message-State: AOJu0YzL4C/isis3gwtjS7EiPh0YGqXKaHptKz9nUVysgfHXdBdOClNd
	O/U+pzPLAmjEWM6sMrNqBeg7bvZA6V1mVzHpRrIAWcD+SknvNnueGpBJkREV99AmL84PE8p8wxX
	cUH5LdWlL5cHxlBZjTPp7xw52FnR2jVdNbq+lRI4SjpKM60asmzd1U/3zjJeVRc8C93tG
X-Gm-Gg: Acq92OE8PGM9vQEL8lH9batsthVRnVbxJWU8TrsgSh/0gZxz9AFJ4i873vGFd71AKcE
	S7wOV2WjKBYMeoBhLS9MQYAcqj6HHXmgzEde8/PPXtz++IQfn09xFa2lNFvvk3RQUmoIvXg7ziw
	I5oYR3zSFTbqAo4F8qAvAqpuMon4pSHsIoGSSIEhyxIfg9BuJdXAjR5c3K+55+q/5d0cy0OS5sH
	V37ZQsqTULBKWG7Ada9QsANag3t/Ymdyq0qvte6OGQNrZ8CydJSLVMS6MssoRNJ0a5AplcCyBrq
	Y63vQjQN5I9kkg/5NUAGUk9GNuE4bQsRKFqkFQg0dwEAJjnkvR9Hjkz9BWTBsodORwAB6bsmX90
	c+70+QYXIwGVmoqFNlHD4CmM5gokYr2KxVSEio4+acqGdPpm1gQs0G/FjBAT+
X-Received: by 2002:a05:6a21:514:b0:3b4:8818:fd20 with SMTP id adf61e73a8af0-3b4ccd3a373mr27867168637.8.1781078905477;
        Wed, 10 Jun 2026 01:08:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:514:b0:3b4:8818:fd20 with SMTP id adf61e73a8af0-3b4ccd3a373mr27867131637.8.1781078905023;
        Wed, 10 Jun 2026 01:08:25 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df03387asm22191901a12.4.2026.06.10.01.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:08:24 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] pinctrl: qcom: lpass-lpi: drop unused runtime-PM write helper
Date: Wed, 10 Jun 2026 13:38:09 +0530
Message-Id: <20260610080809.2588640-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -AnRvDTh0W_34uA59MqgD682351TOFs8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NiBTYWx0ZWRfX9mK8s3z8ZI7s
 BTgmqZUH7rIVxUukJcaM4A3LQ0cecshxmV5F/eggix4ckGlnKBppvmReEnfZ4S6aP38Aj+WTAYV
 Lz9wvudWYHGRsDB7OiKulGsBA9YlCpMAmHszyPHUDJ4lYPdfTXe33v4t+3JEnAbL9UjOiaDNhVH
 cl4OQr34R3LB5Ht/YedacOisvENNgUdSaPkdFASxmeEvAV+sE+tCnhwWhAzPq64NaE3zD36qMIf
 2ARAK7sQ50uv10vZiybv1MxOV82/GkvLqcDFSDXhY+0+VGUkhyAP/CLtfzsBZiznjmm2V2wou/X
 6htv6mEF2ts9A5xqowEKd4hQAx6i7sJVq8QTZIKCMoVcjwiSXpezX55kTFk1FDsNkB8p1x+c+P0
 mZGWfEuvWyvL5O4kgy3bDyJAbH75EUcSHmWXZy/OBeinv53DCR73c+ryBDKroSO3qegMXZMLLyq
 CGoj7MG0ShG/LWtZsNg==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a291b7a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=cbsZFf3Q0uKgmDm8bSsA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: -AnRvDTh0W_34uA59MqgD682351TOFs8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112336-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:ajay.nandam@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AFFD0667039

lpi_gpio_write() became unused after the PM clock runtime conversion
switched write paths to __lpi_gpio_write() inside callers that already
hold an active runtime-PM reference.

With -Werror this triggers:
  error: 'lpi_gpio_write' defined but not used [-Wunused-function]

Remove the dead wrapper.

Fixes: b719ede389d8 ("pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM")
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 4d758fd117c4..fe7ec0176081 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -79,20 +79,6 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 	return pm_runtime_put_autosuspend(state->dev);
 }
 
-static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
-			  unsigned int addr, unsigned int val)
-{
-	int ret;
-
-	ret = pm_runtime_resume_and_get(state->dev);
-	if (ret < 0)
-		return ret;
-
-	__lpi_gpio_write(state, pin, addr, val);
-
-	return pm_runtime_put_autosuspend(state->dev);
-}
-
 static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
 	.get_groups_count	= pinctrl_generic_get_group_count,
 	.get_group_name		= pinctrl_generic_get_group_name,
-- 
2.34.1


