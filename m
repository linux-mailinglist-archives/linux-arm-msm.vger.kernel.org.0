Return-Path: <linux-arm-msm+bounces-96476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFZPMdyVr2n3agIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:54:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F95724511D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3F35303049E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD323BD63B;
	Tue, 10 Mar 2026 03:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEGi8vbP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhEz6HE4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4B21DF755
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773114826; cv=none; b=VBgi6aqQ+5TXDS+Q2D/kqah8s1+d3gjn5A7KWLmdrdZT9zp1sRE5CnYo95zAiTGCtrEzPjv47MzsIUU98v+ED1UdIG/IkDpLkmD7bcg/XvF7duSlasQoNbZcYG0Lm96D4NknC0ilgHLkcFf532ieAsIjzCc094HdrPqEKTsjmW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773114826; c=relaxed/simple;
	bh=2c5oRtP2vj4QsL0Tk2H7RcKbwwJ0hple3SJkH2pC1OQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L7pYDme7P/t7j62CFnEDgUL8y7kyRdPPpfIeSvTKhy8OfpXZFlpoc7PdbzOI1j4diLikP8ENqlje0uuVkY2V5KaCGXyjskqm9CfWCMzWlhXkrVr9NvW2/szP7SOAXb0u1V9QKNu+K6LzLTh/kirN7TGxbfZRvJwab5iQXrxHu9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEGi8vbP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhEz6HE4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EY2t1900088
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t8v0G6gCfJ4JhN/4R5+M1N
	IjQLf621G8ZADlD7ggQAI=; b=CEGi8vbPVIwZxxmsETx46oEl7NoqsKng80NbkN
	ATlX0XVNPvfqUidOm9sZajd9Qm8fSqGbtCeyobv1Zv+3TsNq/P8aS0nAPSldk/rK
	o7s+E0ly//Gm8h07fuNarY1jVmOj6QF2G+51lyV8DE4CsqrTrLDp+PCIcdFCSk7u
	/xCvX1EszCIkIddN9oWmZdr424C4p7jz32mtFSTMmWTJLYSgwaZDu/03hFsqh5QJ
	HW3JBD6t4jlqH5m3iAwG9QIvDdzoXWeyIV2fStmc3Ab9m824qhRCB/sgv/1B9wCX
	sMYRj46BkL/d0E/CUYCypsEjVHPw65vlEU2/8sFft6h9iSKA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsabhst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:53:43 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d74cd7b1e3so7100974a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 20:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773114823; x=1773719623; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t8v0G6gCfJ4JhN/4R5+M1NIjQLf621G8ZADlD7ggQAI=;
        b=IhEz6HE4LlLsPqzYXaQyK+6L4dQ0e7Xseeire7wlWF5ejpbjXDGcbMOimLED8cVM4C
         xf3qkcY0PLIqRIYXF0HtdiHkxcEB0A4LLJwx77eL99VGYluSQ2HBlhOTTu4jDslCTC4U
         JiMMzpbyQ5budsXP2m3eu6NyBK79SP8KC8fGq+YZ4jsAR9P2Bu/pyqDWnQRMdPYTl5ce
         s6phlGMbs+UV/ERXk5GvfW5zJqlVWjvO226SqHFNsBTu+jonz5WYBSj87trZjLdRV+w5
         S+wyRWyrUgPrELtpEYiNvyyA4MlkKSvHp1/355QlBbshlRoEU7UnVEqf3lQSwqDLGzQT
         oCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773114823; x=1773719623;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8v0G6gCfJ4JhN/4R5+M1NIjQLf621G8ZADlD7ggQAI=;
        b=f+B8OrTsxq+ltoF6iBlOIM9Wo/FaffBA4k+0BqCFTgBpw/qBcuS1vWjczEdvRCRBtr
         ijS3rGUPltND9JvxamibO978PAFYPwj4DEqdVdJH198gMss23dK1KgJnpkWivP8UmGCu
         H1H8AEA5VGcDDE3z193EvK9qWjvXE9sc5/bFLtfoIH/WnzUDVY2p6T80U1i6slFuwh8r
         bMb7St0Zo6Xpr7N/ksjhSnTV5nXhrV4MtrUW4/U4PT0mHrngUDP8FG5/4y88m45DxD36
         EH4aMYIQ7kC9xWN7ZPg9O+FINjy/zdfUZcl9ZnBHfZaOGQ+9pm5Yv4TSUEn3njeTrAkz
         u11Q==
X-Gm-Message-State: AOJu0YzqcyPqnamQXZzYNqJDgLgScgdVTOyVakPUkfN3s06wmP5MvTSR
	d6Nr/XIIKKoOA8H14WdkvJmFUFmyiAayoJFowZxD88OlRNVqcr79AJGtXInaq1+Pf13ls2V6q/L
	vjjRLzcNBOIsy93IQFbO8wuXZzVPTfSbXvJvVyFQEizoLsS2NmGRap4ps7cTuUnUiA3sX
X-Gm-Gg: ATEYQzzevGuSM4+HCDqULZmqEoSEZ1hOGmooCKxi5TPu/WUhpyOwKvxCxoiKGzFtLwQ
	KbI5K9rETpytoU5rYSTa2eR0XUi9lRaTCBxcpUjikWEQRC/7ET2RBIKmJi6knjcjqDHlIO5rtVQ
	G6db9iptDrKKPZNdBNp6IyG52GP4cJ1HNg/LEkykKTU5GlCqGFJ0TM+wphKIQGHhKUbWC7bv/YJ
	YU/MwaTs4al5AjOiIomtzNb/FXD3b5S0jZwS3TiNzib3q2fR5RbiahJc7Dl9M6EN8LgEQpHkGMb
	mB75A9W8t+5WCGGsp6TSA7MpY/PsfNoT5NYBSpHjttF30yqLOTyr3xcWw0y0n1jpBKzHOFKIkzc
	bB56iWgYLHsOpnCPmnCp7TUL/tzJ4ZYmeK0M+8NydAx8=
X-Received: by 2002:a05:6808:1993:b0:467:14e:6bef with SMTP id 5614622812f47-467014e6ec0mr4409202b6e.33.1773114822895;
        Mon, 09 Mar 2026 20:53:42 -0700 (PDT)
X-Received: by 2002:a05:6808:1993:b0:467:14e:6bef with SMTP id 5614622812f47-467014e6ec0mr4409194b6e.33.1773114822469;
        Mon, 09 Mar 2026 20:53:42 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41756e13565sm1543658fac.18.2026.03.09.20.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:53:41 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 22:53:35 -0500
Subject: [PATCH] mfd: wcd934x: Unroll regmap and irqchip on removal
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-wcd934x-unroll-regmap-v1-1-9a5fb305540e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL6Vr2kC/x3MSwqAMAwA0atI1gaqFbVeRVyITTWgVVL8QPHuF
 pdvMRMhkDAF6LIIQhcH3n1CkWcwLaOfCdkmQ6nKWmll8J6s0dWDp5d9XVFo3sYDnSHVtrpyxja
 Q2kPI8fN/++F9PxqXgKxnAAAA
X-Change-ID: 20260309-wcd934x-unroll-regmap-f9e08834f9d7
To: Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3725;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=2c5oRtP2vj4QsL0Tk2H7RcKbwwJ0hple3SJkH2pC1OQ=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpr5XFgfJmWpkz492UggawYj0y1uYv/IyCJ8hiz
 Pg9EnUFVjOJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaa+VxRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWtBg/8DUUvH69S3vF6mI1JcC/MbdEuNPtyOeNpAV+mLmG
 hL1K/T4VdEgiqfeL7AkGmf6ajQug4lj6WUjSgGjqTPyl14p6omtIKC8AgGrmQ+WbpZ6zSljGjd2
 WEmrPKiK8wrfmV3eloq8GYiJfkBSf733054CKmv9VI7O6bujeN1cZ6JPjHFmhjGv2kTidmReO7P
 vSuPNOU9CKlEwS3E2uzmtdbHVNpLHOeZyR8WZ/KjwNuGOKzpcMPYjQ9O2OGqTcZgVHjWZTua39m
 c4dvYOGDDZwDOEakObV3MdUNSG1YK6LJitXGERabpfF5A8BgyiixM9RTynetTtDSw3w6xkz6oWg
 5awtQ9mvLAuVYBS9JiBp/laGiANmZ6PVzM0hl3MpziVZyDOOJa/HB/YTQ/OZsq+La8HsIWevMPa
 jHjg6ADUJ6q38BBx5MD4yOraEoB9Fo17peu+Bd8UhMcxasiOKnmAuoi5eug+q5g/zQ6RsU8cQKz
 hMWDK/b2r86Gb1kwBDLJp+7ziqWmKTvENr5aa6z/y9N/CjRZorku26flU5nujKk8tKAHW0FEjMN
 uhAlH09Myz1E39dxi3iWFdsNHkU+qEA66f+3JjVrzZJXbOS9BgDVG7rvr3CkEDmgoInJ68KLimz
 ItbfGEeU/ZnxuXYLZyfkLIGX5CEiStcSSb0M2Q3OAq1Q=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: LL3mjeTSK-ZVAisVrnmWlAdoVNBnRpaP
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af95c7 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OgaCUeAxioZO__sieaIA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyOCBTYWx0ZWRfX8yArr6ra7P95
 V0k76qRVKJ1lLMbjdYQ7VdsuZZP6dQYpdawUUlC4F2cDsS65UlHkJV7vE2ZyGq31kjCtO6XYXEu
 ehxuHx23THyk2IytS7MQrHmwelezRTJjVEi4E5/ijeRXTOsD5Yml/75TV5aU4ocvM6bzJwAX67y
 /p+/8M4NjRKBzh7IW2kBmot+XTymau6TBVqt0YseHe1U2VOt0tro5bKqlb4oI87GcS94Tl6hgvK
 waxdpha4FGux5HvhqmK6BoEp6hLPZsxrRTEzLKqjMWoyXlEWsmnhCWtdO3TKDtsmRsnt9tcipxb
 DBDDQVW7zGOeUzJ1FIINbIujfyB8WluC5Hb78Ri+EfmVS2KOVPl9WWPf0X1SgEWPCh+BOTudmsD
 9IwZr9eZehaBznLk4CzcGy/5yrkvtkTvx8D2XKIljNCFEfWBv9maZTPq6dBezrdx+MYD/Z/g6WL
 x2tGF7igfrZOaJFWsDQ==
X-Proofpoint-ORIG-GUID: LL3mjeTSK-ZVAisVrnmWlAdoVNBnRpaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100028
X-Rspamd-Queue-Id: 3F95724511D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-96476-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

When the slimbus-up event is handled a new regmap is created, an IRQ
chip is registered on this regmap and then the MFD devices are added.

But the regmap is left dangling if either any of those operations are
failing or if the slimbus-down event ever comes. Which manifest itself
as an error print from debugfs once the next slimbus-up event happens.

Likewise, if for some reason a slimbus-down event would be followed by
a slimbus-up event without the MFD being torn down by the slimbus
controller inbetween, we're going to have a dangling irq_chip.

Add cleanup of the registered resources on failure and on removal.

Fixes: 6ac7e4d7ad70 ("mfd: wcd934x: Add support to wcd9340/wcd9341 codec")
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/mfd/wcd934x.c | 49 ++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
index 3c3080e8c8cf7ecaaa62e255c7e01a850e65e9ad..b03cc91cc3a6a114a34efdb278420ae3dfa016eb 100644
--- a/drivers/mfd/wcd934x.c
+++ b/drivers/mfd/wcd934x.c
@@ -170,29 +170,56 @@ static int wcd934x_slim_status_up(struct slim_device *sdev)
 	ret = wcd934x_bring_up(ddata);
 	if (ret) {
 		dev_err(dev, "Failed to bring up WCD934X: err = %d\n", ret);
-		return ret;
+		goto err_regmap_exit;
 	}
 
-	ret = devm_regmap_add_irq_chip(dev, ddata->regmap, ddata->irq,
-				       IRQF_TRIGGER_HIGH, 0,
-				       &wcd934x_regmap_irq_chip,
-				       &ddata->irq_data);
+	ret = regmap_add_irq_chip(ddata->regmap, ddata->irq,
+				  IRQF_TRIGGER_HIGH, 0,
+				  &wcd934x_regmap_irq_chip,
+				  &ddata->irq_data);
 	if (ret) {
 		dev_err(dev, "Failed to add IRQ chip: err = %d\n", ret);
-		return ret;
+		goto err_regmap_exit;
 	}
 
 	ret = mfd_add_devices(dev, PLATFORM_DEVID_AUTO, wcd934x_devices,
 			      ARRAY_SIZE(wcd934x_devices), NULL, 0, NULL);
 	if (ret) {
-		dev_err(dev, "Failed to add child devices: err = %d\n",
-			ret);
-		return ret;
+		dev_err(dev, "Failed to add child devices: err = %d\n", ret);
+		goto err_del_irq_chip;
 	}
 
+	return 0;
+
+err_del_irq_chip:
+	regmap_del_irq_chip(ddata->irq, ddata->irq_data);
+	ddata->irq_data = NULL;
+err_regmap_exit:
+	regmap_exit(ddata->regmap);
+	ddata->regmap = NULL;
 	return ret;
 }
 
+static void wcd934x_slim_status_down(struct slim_device *sdev)
+{
+	struct device *dev = &sdev->dev;
+	struct wcd934x_ddata *ddata;
+
+	ddata = dev_get_drvdata(dev);
+
+	mfd_remove_devices(&sdev->dev);
+
+	if (ddata->irq_data) {
+		regmap_del_irq_chip(ddata->irq, ddata->irq_data);
+		ddata->irq_data = NULL;
+	}
+
+	if (ddata->regmap) {
+		regmap_exit(ddata->regmap);
+		ddata->regmap = NULL;
+	}
+}
+
 static int wcd934x_slim_status(struct slim_device *sdev,
 			       enum slim_device_status status)
 {
@@ -200,7 +227,7 @@ static int wcd934x_slim_status(struct slim_device *sdev,
 	case SLIM_DEVICE_STATUS_UP:
 		return wcd934x_slim_status_up(sdev);
 	case SLIM_DEVICE_STATUS_DOWN:
-		mfd_remove_devices(&sdev->dev);
+		wcd934x_slim_status_down(sdev);
 		break;
 	default:
 		return -EINVAL;
@@ -276,7 +303,7 @@ static void wcd934x_slim_remove(struct slim_device *sdev)
 	struct wcd934x_ddata *ddata = dev_get_drvdata(&sdev->dev);
 
 	regulator_bulk_disable(WCD934X_MAX_SUPPLY, ddata->supplies);
-	mfd_remove_devices(&sdev->dev);
+	wcd934x_slim_status_down(sdev);
 }
 
 static const struct slim_device_id wcd934x_slim_id[] = {

---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-wcd934x-unroll-regmap-f9e08834f9d7

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


