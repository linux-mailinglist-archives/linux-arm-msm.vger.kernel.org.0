Return-Path: <linux-arm-msm+bounces-112537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jj6rOnimKWqjbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:01:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E17F566C1F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 20:01:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JwHUGy/R";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VwHfF620;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112537-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112537-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DAEBB3010DFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539571A238F;
	Wed, 10 Jun 2026 18:00:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E453629C328
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 18:00:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114437; cv=none; b=Z4SdlCWA8OIklpqlBeuSvGvMa1miVLkzNJIsekjwvYDFdV7lUT8jrl+sVV13SpLcs7WSiCcAXJP2taUAGZh6+a1LMwNby68/nZ6lU6woS8ZhqRYzmyVRnJbTBq5B0z2bhoe9Jr/uYvrxEYYYPZXRAOK9II+NRTMh/1+sFI7HB18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114437; c=relaxed/simple;
	bh=nd70ymVn4qETjMvmdJGh8lIRSl3/z5VnYzyg4y3mSzI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qNE+MC5SvZHkVZynoD79jN3vLHubOIahJCI695Oy3dVntSTS61j82atVavoLCGm9H+6QygZ23PfOES7RI+h2807YGVvB74OWkRI93NyroL6AxVAUZMqdCXzk3Y1PH3rwZtEIK45+yAHXItrfIFbBHZEHLmNMJi83r15t3bWvmWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwHUGy/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwHfF620; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65AFx39P2082798
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 18:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VFl2C5BL14QmwiuVG0p+7rJNetgeu3x3yCB
	atH8LuKQ=; b=JwHUGy/RPDR89jYVBW3MFof/plyWvOQVSL+on5HBoPIdPBzCZB8
	MM2QFg1YoMtCgW9bPoBict2VsDQ72/STt43JLIBsdP00u16Nnz+2nISocLGHWqly
	2FHiJq7A6OtNu9M2lk1arI9X1IvyRS+pMALRvr/yK4EG4bs7yG2kz1+P9SbqECrM
	m+9X2tUEoCK3FYLycenAOLBy2l2/V/0x5zXrOIgXRYMjHOd+wdjZf1lC3fp3aYH9
	CoJAdtalTp9nWz9AKtusr1KubA+g89LT9u+xooPDDdyF6nFffTE1g3upJAsv33ea
	3peYmd8F9CFO4EsfDgaWydnSBpX3oELqXvg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnnuygr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 18:00:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso12101929a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781114434; x=1781719234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VFl2C5BL14QmwiuVG0p+7rJNetgeu3x3yCBatH8LuKQ=;
        b=VwHfF620azGUg6svQN7i42LS+q1hOWFE+Kk16ooA0vEwOYlYB+ULjvUYVGZYUFfoRW
         A22tiAkYALliddfyKlFwaIlngtUk9Q0VzCih8EfX0bOj/k9QdcipKSqxvSOu7Z2TpcxS
         lOToEgBWylG3ob0q1BVq5tudSt/AZaOTTVnCpFqUw0nPpm3jG21Yhhsr4I/y/l55F/wO
         wC6pX6zN3mVbgH2LORLoUBDicgrW9+6bVF7PXDnOWqWOyRahWVyu76faA/0efblNdAel
         0+a3Ss0siBVvmbCYjM/zTy5R5OGalMpK0hQoxbZS4S4UE+jEqiSzVCVxa0ZbTnQyFRAS
         3IgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114434; x=1781719234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFl2C5BL14QmwiuVG0p+7rJNetgeu3x3yCBatH8LuKQ=;
        b=e8TxWXmfKf1qMbgRq8V6H++tsK/HlOaOIOwa0t6nFnodu0Qt04Wn8wRJZIACYH5GKN
         HGU7jIitDKxfvJqg/BFOuVRQxyRczkEXoIemxZUV6DGGPGIm0VMwur4uWarDObAmyJ6O
         opYSeN/1W/dP1fDJtbKMBTu7hO/DvwLK2rbgyTLHFCCBK5Y3zU1v1/Di6m5i+8dZEI+d
         K8dC+Z7Qr0BLPcIu1EqPCxafcW9iTdXM4UGZ9Fy6VeEvjpjey2iZ4vUl3jdRqFaD7xqP
         yyUHT9aCChXaxJmaK93zEaX9hTIvZjbSec0e2mnA9qEQ2kqOGuBcF8BW07WuVY31Wh8d
         s3jw==
X-Gm-Message-State: AOJu0Yxjr6FkhlDVpLGUonLhbLf/wPFcini5I5zThAo0YGtBB/ZZWOgM
	sHNPt9cBaJxgR0hICGyRxt2AkGRnwsi+daCb3td0BZ76sy80PtNyyTDSsLHCiqULZyJL6MjJfn6
	SFfgV3BgmJNGUGFrezCYQWKnmcvneOLLEgoibFuNkmbo3vk2ce4f2V0v/zGE1TMRz/UwN
X-Gm-Gg: Acq92OGWrguWw0EFPm8odk6n6wS5pkLVJv/2RqmDCjvXcR2SVFNfPky/DbVahe6nJ0J
	W9EiDq1pBByOqBcC1gkRVaYtT+/QxQIWzBrPJBdBcXzqPLL8Og2HUZJ5ONoyt4nrV9Tg00fkCqx
	FP0BmbddE0M2WyTTbBhBDqS1MYA4nilDiyNCobCuxpyWe6h3pD2YHQ2tJzepSjA6mFCK075Ap9e
	2WX6aYMoV+e8N4eirHFCIODDSQ8Q1kQ/IpyZPezCW5ITozZ3FOSQJZvPdLGSq5rPFTAQj3tpQzD
	9+EXiEeqZClYcij1Do4TnFSCC9ZkrbcNJqwT5jEMw8f3v+h7Za9sxAW3voeYu/fZKJiGAXfv7D9
	cofiwm/pHO0JIFeCvStGn5cJhlvOK1+xlIQVYaojnUsLwI26tu4UfCe0+O3MJ
X-Received: by 2002:a05:6a20:d529:b0:3b4:7b3d:179b with SMTP id adf61e73a8af0-3b4ccd56df5mr32680969637.12.1781114428254;
        Wed, 10 Jun 2026 11:00:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:d529:b0:3b4:7b3d:179b with SMTP id adf61e73a8af0-3b4ccd56df5mr32680917637.12.1781114427753;
        Wed, 10 Jun 2026 11:00:27 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a4e59sm22229744a12.16.2026.06.10.11.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:00:27 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2] pinctrl: qcom: lpass-lpi: drop unused runtime-PM write helper
Date: Wed, 10 Jun 2026 23:30:12 +0530
Message-Id: <20260610180012.3505877-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bhMHJgJ5r1Oy0Aw_HnIs4ly391aJrcSr
X-Proofpoint-ORIG-GUID: bhMHJgJ5r1Oy0Aw_HnIs4ly391aJrcSr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE2OSBTYWx0ZWRfXzZs4ls280oqk
 AnBwnaau4UktcG1Ks/h6O1oROYl6RJIr7wpwMZXTNnkEcHiO48Cqp/cVs/Gtmw9W2rjNLxRFYAk
 uDcxZ/c+wEVL+ofUnFqVC4evD3Hb4Ul+RBayvv6t9DJZZeJKNsGNvhaEfB6w/CJIFTL5jPZSQEi
 uEt2CId4JzoI+D2adGMRmrSHfTCdJNUPym0B0mA1Rtv7CUH41xypj/hPVVZn8J+8inyGi1GGtIZ
 J9h2UZs7RuBrnfbPtJzguzjTCO/idZv9QhsAYWYCT9g+uxOqGPgsccn88MT+Wq5pBxMP7qFWWon
 v3u5JJU1+A5Y+GuORIgm6pouh/W7CBhyzte16tIzjzhrpPTudiKmzipRM1F8ci6WXrBClSOZadY
 ryaraGJibZ5JAkE7ph1opt8/Jeqp7sBaRgqPZgwvqbhkZrmg8AVXICj6a46W2eJXM/eOEZ/gUpZ
 wGC7J0UfTdu1jaPUZRA==
X-Authority-Analysis: v=2.4 cv=epLvCIpX c=1 sm=1 tr=0 ts=6a29a642 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4v8pcrgwZPo3ib7Z4i8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100169
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112537-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:ajay.nandam@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:nathan@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E17F566C1F9

lpi_gpio_write() became unused after the PM clock runtime conversion
switched write paths to register helper calls inside callers that already
hold an active runtime-PM reference.

With -Werror this triggers:
  error: 'lpi_gpio_write' defined but not used [-Wunused-function]

Drop the dead wrapper and rename the low-level MMIO helpers from
__lpi_gpio_* to lpi_gpio_*_reg for neutral register-accessor naming.

Fixes: b719ede389d8 ("pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM")
Reported-by: Nathan Chancellor <nathan@kernel.org>
Closes: https://lore.kernel.org/all/f03850f6-186d-4988-a450-e6e95f24a551@kernel.org/
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 50 +++++++++---------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 4d758fd117c4..5fd4a4eba654 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -52,15 +52,15 @@ static void __iomem *lpi_gpio_reg(struct lpi_pinctrl *state,
 	return state->tlmm_base + pin_offset + addr;
 }
 
-static void __lpi_gpio_read(struct lpi_pinctrl *state,
-			    unsigned int pin, unsigned int addr, u32 *val)
+static void lpi_gpio_read_reg(struct lpi_pinctrl *state,
+			      unsigned int pin, unsigned int addr, u32 *val)
 {
 	*val = ioread32(lpi_gpio_reg(state, pin, addr));
 }
 
-static void __lpi_gpio_write(struct lpi_pinctrl *state,
-			     unsigned int pin, unsigned int addr,
-			     unsigned int val)
+static void lpi_gpio_write_reg(struct lpi_pinctrl *state,
+			       unsigned int pin, unsigned int addr,
+			       unsigned int val)
 {
 	iowrite32(val, lpi_gpio_reg(state, pin, addr));
 }
@@ -74,21 +74,7 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
 	if (ret < 0)
 		return ret;
 
-	__lpi_gpio_read(state, pin, addr, val);
-
-	return pm_runtime_put_autosuspend(state->dev);
-}
-
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
+	lpi_gpio_read_reg(state, pin, addr, val);
 
 	return pm_runtime_put_autosuspend(state->dev);
 }
@@ -150,7 +136,7 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 		return ret;
 
 	guard(mutex)(&pctrl->lock);
-	__lpi_gpio_read(pctrl, pin, LPI_GPIO_CFG_REG, &val);
+	lpi_gpio_read_reg(pctrl, pin, LPI_GPIO_CFG_REG, &val);
 
 	/*
 	 * If this is the first time muxing to GPIO and the direction is
@@ -160,23 +146,23 @@ static int lpi_gpio_set_mux(struct pinctrl_dev *pctldev, unsigned int function,
 	 */
 	if (i == GPIO_FUNC && (val & LPI_GPIO_OE_MASK) &&
 	    !test_and_set_bit(group, pctrl->ever_gpio)) {
-		__lpi_gpio_read(pctrl, group, LPI_GPIO_VALUE_REG, &io_val);
+		lpi_gpio_read_reg(pctrl, group, LPI_GPIO_VALUE_REG, &io_val);
 
 		if (io_val & LPI_GPIO_VALUE_IN_MASK) {
 			if (!(io_val & LPI_GPIO_VALUE_OUT_MASK))
-				__lpi_gpio_write(pctrl, group,
-						 LPI_GPIO_VALUE_REG,
-						 io_val | LPI_GPIO_VALUE_OUT_MASK);
+				lpi_gpio_write_reg(pctrl, group,
+						   LPI_GPIO_VALUE_REG,
+						   io_val | LPI_GPIO_VALUE_OUT_MASK);
 		} else {
 			if (io_val & LPI_GPIO_VALUE_OUT_MASK)
-				__lpi_gpio_write(pctrl, group,
-						 LPI_GPIO_VALUE_REG,
-						 io_val & ~LPI_GPIO_VALUE_OUT_MASK);
+				lpi_gpio_write_reg(pctrl, group,
+						   LPI_GPIO_VALUE_REG,
+						   io_val & ~LPI_GPIO_VALUE_OUT_MASK);
 		}
 	}
 
 	u32p_replace_bits(&val, i, LPI_GPIO_FUNCTION_MASK);
-	__lpi_gpio_write(pctrl, pin, LPI_GPIO_CFG_REG, val);
+	lpi_gpio_write_reg(pctrl, pin, LPI_GPIO_CFG_REG, val);
 
 	return pm_runtime_put_autosuspend(pctrl->dev);
 }
@@ -337,17 +323,17 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 	guard(mutex)(&pctrl->lock);
 	if (output_enabled) {
 		val = u32_encode_bits(value ? 1 : 0, LPI_GPIO_VALUE_OUT_MASK);
-		__lpi_gpio_write(pctrl, group, LPI_GPIO_VALUE_REG, val);
+		lpi_gpio_write_reg(pctrl, group, LPI_GPIO_VALUE_REG, val);
 	}
 
-	__lpi_gpio_read(pctrl, group, LPI_GPIO_CFG_REG, &val);
+	lpi_gpio_read_reg(pctrl, group, LPI_GPIO_CFG_REG, &val);
 
 	u32p_replace_bits(&val, pullup, LPI_GPIO_PULL_MASK);
 	u32p_replace_bits(&val, LPI_GPIO_DS_TO_VAL(strength),
 			  LPI_GPIO_OUT_STRENGTH_MASK);
 	u32p_replace_bits(&val, output_enabled, LPI_GPIO_OE_MASK);
 
-	__lpi_gpio_write(pctrl, group, LPI_GPIO_CFG_REG, val);
+	lpi_gpio_write_reg(pctrl, group, LPI_GPIO_CFG_REG, val);
 
 	return pm_runtime_put_autosuspend(pctrl->dev);
 }
-- 
2.34.1


