Return-Path: <linux-arm-msm+bounces-116935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z1wPBK7qS2oqcwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:49:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6460D714137
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:49:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=fcPvws4o;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116935-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116935-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F01A33373E52
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE579430CCD;
	Mon,  6 Jul 2026 15:37:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E8540D592
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:37:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352257; cv=none; b=gjKwaXmc3trmCMV0kGoR1AL/GF7T5ZCPbyOGBWMUJ6Ls8mHB1K5jS7BcykR50gfkaNilGYPirSaYE/LuQQQ78Q6JfxZ8q4Cubc3yg/r40TdckthK1Tp1S2hZjNoPsR2wX+E9I08VA6Bx2SEncnrh+v8v2VSG6PchEOuiDwNbt4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352257; c=relaxed/simple;
	bh=6DLOycX+bQwmHe2uLJ9WAcEIdgy1KhKU6yIrO4vS6Bo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ad+pFd/r58xB2/3LhGt4MeRpqwWPqW1T4LeVoMUn6KvjGvtr8UpBwRP3KRuxyI8hGoLj0hUm/DyKWcgtcxHHkPq7dZK3+2KlQreUjZCS+gXzj4U24sWvkUN5GbXquSfKw6KzQB/M4ZIG794MTiZJ8w1veKpJvo/NXYAuXoopelA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fcPvws4o; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso1748203f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783352254; x=1783957054; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqMiQQ98nHAgcvaTwsFNUoborAmq4QuAGIXg3iW8PZo=;
        b=fcPvws4o/LFA+ZgtXFZQRfqd3s5gcCv/ecX56+w1N6B1WU3Q2i7PmNg93y4fvEen8+
         DAasLLnsTB01FhaEz9e9Haqqkz73BYjLeitp91QZ9KA37rRKH7ZTKRwOVnkgHYyc3pU+
         ZOo6aff11ASo2GJ0UbbZoLhfgjuB9n3MNiQyV7Pww7U+STQmpfITbwt7GPqZkHTCcigo
         fqGpVCYz7b7Fkaiw7IpGCADWq6ape7j/0zS1XUDNsg+L/dqG3wCKB0V1JjY0zqA3TQyc
         mXBFHd1J49BfxOlVVOEhC1yzC4RigV+d+qILxhYitgGfsGUJ+Gt+3Mfkt14aWaJwP+2B
         H1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352254; x=1783957054;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqMiQQ98nHAgcvaTwsFNUoborAmq4QuAGIXg3iW8PZo=;
        b=X6fv2lkWegJRxN/Abr+i/ZXPGE3uUIyI7T/M7zjbPypebbunqVWQ7YRRek6eIMfoEM
         RmYOt89euSrYolH2zDO4YG1h2mpIZMZM99OKqIY/X/hMNf0XziYs1uPjksBWywPtcQd5
         b8/8yt84XegBkVx3W4qxX1hHiwx9LkOfS4ttaY00x4hL7uOgbDjowoT2DbTOXmx+gapJ
         l3RoDTZD/LGMqPFp1PrWVD5jbdYmC1iBS57MqPeZBh+ugi63YMOj66GBJAwFujXbVZzl
         nhDvn9CrpcrMB8vaYF10JrFGBS+cD23V4Dpj0Dnv0kFJRAc//0K2kFz0b49xcRdqId/a
         9ivg==
X-Forwarded-Encrypted: i=1; AHgh+RpHDNOr93MoCYcHKM4quafYP2bPwjByx0ac094EfaYWB8G1c8WMCexy6l0BF3mGae0BI1yOuVB3mJfc1X5L@vger.kernel.org
X-Gm-Message-State: AOJu0YzZCQmPvNfllk8TF9bj9LrB5JQBBP+tUfg3UOeomBTEdET35F3t
	ZCujhnRRPFUEfqEssleJhGz6ozI4d/Grz8MNDDzmpq7TGx+0dDAItwnWpSGJjNPgbUk=
X-Gm-Gg: AfdE7cknfgWAdh8QqjST4szfcUF6iNP8hA+HgOEaW5WHlKps/rKjIOeG0csOU6fuifU
	o8k2GWmcWkOcDRzrqjY9kihoRy8kvl1TnzlXAP0Po4c2lHhO5w/31Tr4NaocuBjxX9a2Hy8Dx7H
	9X93uTdpfG0hOJo4JyAMsS2d3Zau8SAKcBoBaP8Cn7AQnefCcUAOL1/e057I4/xlmP6qj7Sjyxs
	8FogHcK9JwtONE1eeOnuETJ6NZgGdKVPXi5jKD53ByuGGgpE3RdmaN0otkAlHF5bwyxhXRzY12y
	lbuL0SIqhzBcrh4domOCen5SIcBSJMDnJs/xWdbuiQn1M6liuEy6OUUIeTTBmsUm05hAYo/nxFe
	aqCNADideYazk0EKfWDktvFQQQ6/Yby4i1BZZE7adGFRE6HUP7iZiEMYvZVlrP0pZg8HPA9oMR9
	dvyJPAr4yJ5/xoTvxRa0TNmRKuZw==
X-Received: by 2002:adf:f043:0:b0:475:cd6f:720a with SMTP id ffacd0b85a97d-47de666af65mr632471f8f.1.1783352254464;
        Mon, 06 Jul 2026 08:37:34 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm26216613f8f.5.2026.07.06.08.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:37:34 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/2] remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem
 control instance ID
Date: Mon, 06 Jul 2026 17:37:15 +0200
Message-Id: <20260706-qcom-q6v5-mss-mdm9607-ssctl-id-v1-0-f59e728af621@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKvLS2oC/yWNSw6DMAwFr4K8xlJK1UC5CmIBidMaET4xRZUQd
 6/bLmf0NO8AocQkUGcHJNpZeJ4ULnkG7tlND0L2ylCYwprSWFzdHHG1+w2jCEYf7+pRxG2jTrH
 0VR+IqmvwFjSyJAr8/h007Z/l1Q/ktm8VzvMD6O8VToIAAAA=
X-Change-ID: 20260706-qcom-q6v5-mss-mdm9607-ssctl-id-7d8bfee83fd6
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116935-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:barnabas.czeman@mainlining.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6460D714137

Currently, trying to shutdown the modem firmware on MDM9607 results in the
following error:

  qcom-q6v5-mss 4080000.remoteproc: timeout waiting for ssctl service

This is because qcom_q6v5_mss defines the wrong instance ID for the QMI
subsystem control service of the modem firmware. Make this configurable per
platform and fix the issue by defining the correct ssctl_id for MDM9607.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (2):
      remoteproc: qcom_q6v5_mss: Make ssctl_id configurable per platform
      remoteproc: qcom_q6v5_mss: Fix MDM9607 subsystem control instance ID

 drivers/remoteproc/qcom_q6v5_mss.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)
---
base-commit: 8ca01dbc70b5856b8ad40f5178d6cbf13898896f
change-id: 20260706-qcom-q6v5-mss-mdm9607-ssctl-id-7d8bfee83fd6

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>


