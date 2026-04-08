Return-Path: <linux-arm-msm+bounces-102376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jH7SLOfW1mmPJAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:29:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4B03C483B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 347BD301048A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 22:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C15C3A1E6D;
	Wed,  8 Apr 2026 22:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="px6Pkjfu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B023644C3
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 22:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775687396; cv=none; b=gNvtCuJmdwlgyFsh0sMOIQbstLzaHgL7bE5tIddYHSMZS9UpgeBYSA/lDcpc8KUB6lPHGPpyoC6FHAULgTJ70HcMzZiRTgTuWB8f1T7/DlQxaejlFnZT9k8DFfct350Xg0RkzFVk9skFP/r0IZJVD+DfntRQENWcADI3VkSNm3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775687396; c=relaxed/simple;
	bh=prwd17M7JxELofGYoEJJNZIQU7RumAbcrI8O831MYvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cl6GOPaT0XdVj/SxmYQp88kTU8O0pjw9ZYU3tcTi+Zlpvd+Euitp7JkCkOAI7tvVZDTOhRkI977CftiRLgTCA4APEvoRxzwi+KcEVP+gCSLb9+B2rY0C3mhdHgRjOSUuEqi9buah6ekPZ3SQrs5NsOOOx3RCRvjWcVrWkY9DqSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=px6Pkjfu; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50b3488fb31so2470111cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 15:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775687393; x=1776292193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qeg7SYz5U5slZCh/riNwU6KseeGH/B83E/l64VPEeX0=;
        b=px6PkjfuYxDAb1/fmM5dugSXGo2AomFEOmQ3oxaxm9g01qf3c0PcoDI4hNp2JLUtpw
         gMXqMfRlPmIYhwQQ7ZXnVcFcu45o1S5yzkKUBY8kcOgUbiHoDJ7qJGZhmqr0pk0yqo6M
         Jn3Lp4xAdN6gNJ2NSMsnp5/ucfMM3lMu1LjBbbj6Am9jZfVjNFwsb3ReB0Nk84zuhzHu
         lpuF48HT1TVKpEMY7X7VxBEIi4TINMsUClGtU3NeWxKkrX8ZLDhvFkK8ChfXBDxAQOFS
         NvM7jIBExYk3SPFh/PdcVZqi/GTEaeTgrej396gAwUUMBrL0NQcQqjvLInQhrxF/pzqk
         An4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775687393; x=1776292193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qeg7SYz5U5slZCh/riNwU6KseeGH/B83E/l64VPEeX0=;
        b=MfY/duM2MI/7kJM//eHIWXhuvwTFGjVsJogkMRMi55xoWmfZxwP0zPWgZdZER61AOy
         R14Ww6gMxaCbE1WadTtq+p0zRsk47ImlLWK4qJc180T7i+Hl644nDvUoByfWwhnDKk4N
         81Q4MNpZIBuNMF/t/nDMgXMqp7zpxDC9Ct7jcU53KDsufBLbq9f1QJJRBFgnhlp9k60C
         pLigLWkx3RpviYXoBbd503KbAkM3UotwUTD1Sv7cUcdYEkDetcYN86/5tylYIppjIw5q
         RxkqH/WYRJ1iAC46V/hQSAtJ2cku9VnzG/xb65PR4VwdFuiDjBqlDIBqAS9QTzx6WCNY
         YQsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBIu85Ko7xfOr5iR8+JWwPz1N/eYzigFMWV0UNo7O6b9XVbfhuy5p2Ko/OaIl1ixPEL+VeG3F6W0oSk4dP@vger.kernel.org
X-Gm-Message-State: AOJu0YxFjG4cd0v298cXHvFkzVRE3mLmluuLHZDR1OD3zIaeRT7TWtAf
	YeGvJr7pm7ccTk3ePgwivbX24EBv3QuSHQGLbTRSgX2zC+rS1bQvxyKFIZJ7qw==
X-Gm-Gg: AeBDiesOmWqh0Uz/ZxrFDCr3kX7cgBK9X70nV2IvasK97MyGvGM+LWq7aNSuCRf2hlW
	Zi4l8TO8lfDjPBwqaJLTVTIHA5gzRxi9y6/VUv4oguDC08AWuWYjkylnIy1mRFWqwWHAQyt7Uhg
	BfPpSpq2aDWn1tpPAsBv6X5HZJxHOzF1o+rKeAL5RsNiEzIZ5RAmHpVhi2IA4Qur5TjH4gCOw+Y
	WzeirDoIT8uTjA6c0QYSCXcb5Aq8NrzpMo//oFhK13v35rdC8sP4xyx9EQ0qOa7gEmOUjfHeE5E
	8Ha/XHQTTydSdN6noqMQO57M3snZyYYODQ8hpK2uabTjWh9E2U6+EYpO58jlfN9O2GuYVnFCjGm
	PNloVRV6SIZx3EY8lDto9BdVG7oTm6G42yp83uNbo6hKDkVas7pEGyDqNjEE2bkqI7ztA3Qeuvc
	L5Yte2FNWrnhUnMr8MT2f8uoUEV6JROEeyMIZxXmqIydoh4WeoAuyu1S5CPew6i1+TvjCcQLuaz
	tnQvg32dMu6RYM=
X-Received: by 2002:ac8:588e:0:b0:50d:a682:2c6b with SMTP id d75a77b69052e-50dc183ecddmr19680501cf.0.1775687392984;
        Wed, 08 Apr 2026 15:29:52 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b93dd10sm171255511cf.7.2026.04.08.15.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 15:29:51 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH] pinctrl: qcom: sdm670-lpass-lpi: label variables as static
Date: Wed,  8 Apr 2026 18:30:38 -0400
Message-ID: <20260408223038.52264-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-102376-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A4B03C483B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These variables are local to the driver and have no need to be exported
to the global namespace. Label them as static to fix compiler warnings.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604080950.Mvm8aN0a-lkp@intel.com/
Fixes: 9826035a75da ("pinctrl: qcom: add sdm670 lpi tlmm")
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
index 6270c6d09c22..858146c408d0 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
@@ -80,7 +80,7 @@ static const char * const pdm_sync_groups[] = { "gpio19" };
 static const char * const pdm_tx_groups[] = { "gpio20" };
 static const char * const slimbus_clk_groups[] = { "gpio18" };
 
-const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
+static const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
 	LPI_PINGROUP(0, LPI_NO_SLEW, _, _, _, _),
 	LPI_PINGROUP(1, LPI_NO_SLEW, _, _, _, _),
 	LPI_PINGROUP(2, LPI_NO_SLEW, _, _, _, _),
@@ -115,7 +115,7 @@ const struct lpi_pingroup sdm670_lpi_pinctrl_groups[] = {
 	LPI_PINGROUP(31, LPI_NO_SLEW, _, _, _, _),
 };
 
-const struct lpi_function sdm670_lpi_pinctrl_functions[] = {
+static const struct lpi_function sdm670_lpi_pinctrl_functions[] = {
 	LPI_FUNCTION(comp_rx),
 	LPI_FUNCTION(dmic1_clk),
 	LPI_FUNCTION(dmic1_data),
-- 
2.53.0


