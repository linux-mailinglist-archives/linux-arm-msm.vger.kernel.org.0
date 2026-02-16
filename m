Return-Path: <linux-arm-msm+bounces-93013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNoJJrNek2kr4AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 19:15:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1775C146F0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 19:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15D2A30360BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 18:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EAA9329C73;
	Mon, 16 Feb 2026 18:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T6IucpcW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2405318EF8
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 18:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265511; cv=none; b=VWhIewW7eYqvnHJsZxUuJ32v/niEzkVevEwJrngVSD1ZZxY+Crt0a9kz6ISxSpmt0ReYpRmZIuGn26PdABpEFsXl4djRXS5WckfJa2N/TMIYN7SO1/PU3pfgKcu5AVw3iOVpOUc+VCg00I8w1htBCJ2KXtvPyFjRDFwaCcYcZvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265511; c=relaxed/simple;
	bh=HTSdkJk9l98H+40HfSCW5IdP+PKN8qaGfdBkjMVQkVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NN5c4FGVaEXBC9zZogwbVijD9gfVBzUn3POQFoqih4J3oVSK2jy7TbviaKT8jOy6ryu6uVQdt9Pf4ySpvo9Amfd2gXj21jT50AC/CaMhe6eCp/Rm+gSNoyGSHhteTBZc5Rt69UqJn2G/YuuQg3tR5BcCMQmV+dnoD1QpijxkJzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T6IucpcW; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1270adc5121so4507132c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265510; x=1771870310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiI5aUOPqb58UplGIDNV8w8jAQukJhPp7ypbCHDoRdI=;
        b=T6IucpcWOJ2bmD/vR+S07/qhgTn7sjxirbmNw326SFulKmWvfLhke3C3G7Wfk2YcOy
         1lLeNfweqsijgobNwbc+wbGhz4eFyAoPCctk7ZFvrtLibfp++RS/2wXQ6VePiTvThg0Q
         vZp8hxsq0FIPsv4S+t6Ajvx51v0DthQVIXAgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265510; x=1771870310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oiI5aUOPqb58UplGIDNV8w8jAQukJhPp7ypbCHDoRdI=;
        b=ToCZkBwEWijrbDW3IhmLL6NIcxvwau/DGNMs0NaelFHPOur+kTZxOx9SqD9swXNprG
         T4tfu3lYLyFaKbqsxeeYVb6UE5tILMYcjncb7hSbhaNasn+l7mnxsyWESlHRFtAJXhU2
         G3dMgWF0wajB2YTEcUx08yVTLKvaSLVt3FIwbiJ+TQURfMNEWz5i3lshHe0nvjZAV6S0
         BZ9RnfjFqJBASEMPuNXpkFRXpv/DymH9vVrYJjPiLhsMIGCUC2JMq+/FYK2KwQuDwjoC
         o3v9DprIuk1bSe4GqSbTIZZSQYT8y9xJ8htXaQhIKvn9HwtexgiB5rjXK64LmlzvI+cp
         He0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrdktbw2Il7QXCP6LEqMTU74KfXQ8rVz95LabNRaQJI/ge3lnUt8zxZuUgH4JUDrI6cqjHTe5PQbv6SeYg@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3JCC7OM8diibVOBPVnzRqx1RwMJKiFddDNDyHaa+pgkbs9Ow
	X1njarv95MJ5zcnJfJdYCQQkLJVr8Y+gAFVqRENIftjHc1vhMP5CUmGn5+h8OY+kczukZxL3+G4
	KEog=
X-Gm-Gg: AZuq6aJOmklMdGiIQdgMQOf2BN7bKFHTwt8aMlIQlx6xGM+mf8fBwzHvgzz0NGXqh8d
	k6vsV4IgLCVXlNTuFLsvYOBteYMAV0katESA7Nsl7ziTJqZgscReb6dyHEBIBH7A2kIbQe7kBzU
	FU0Vb6iQnQ4MwblZhGOK/j8SZiYdoZPZF+JFiRqgx8+NrVv2UCUcBwW5NyzrwDmW/XAmDJwANfs
	ipRljpEeHpBtaVIzxmMGbYgW5gSZ0Xi3VZZOGse2cRyu9WJzaSiuCsHiWt6RenHbSuhIA68K5fu
	eFvOnR0XJc1jMuyygZJJ6Pdh3NtqeIpiDKl3N6gtFSAWH6NlRcEUkZH+wIy4TMeSEMMOSsXKYQe
	hCKmzwBAc+yXEIXWLd9rANeNnLhhoSbQRiINNO21h/Cd6MujyRalFdg6iqfFI5StKhkGn2oxHEs
	4jYKmiSkYGTeO1Y77IMeYdcF+2exmIxRJImTXkfixSkyci5aeJKp/rmL+FrT2XhgYZlnSeBQNhp
	p7AMTiceKA=
X-Received: by 2002:a05:7022:6285:b0:119:fb9c:4ebb with SMTP id a92af1059eb24-1273ae6945amr4340040c88.30.1771265509962;
        Mon, 16 Feb 2026 10:11:49 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:48 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/15] soc: qcom: smp2p: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:49 -0800
Message-ID: <20260216100943.v3.12.I4e47dc2356edbaadac7298ddd65dd649d9b5ee16@changeid>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
References: <20260216181002.3475421-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93013-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1775C146F0F
X-Rspamd-Action: no action

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward. We can remove the call to mbox_client_txdone(). The
call didn't do anything for NULL messages and it's now officially
documented not to be called for doorbells.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This driver is used on my sc7180-trogdor Chromebook. While I haven't
stress tested with it, I can confirm that the system boots normally to
UI and can suspend/resume with this patch in place.

(no changes since v1)

 drivers/soc/qcom/smp2p.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index cb515c2340c1..139307b66a47 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -169,12 +169,10 @@ static void qcom_smp2p_kick(struct qcom_smp2p *smp2p)
 	/* Make sure any updated data is written before the kick */
 	wmb();
 
-	if (smp2p->mbox_chan) {
-		mbox_send_message(smp2p->mbox_chan, NULL);
-		mbox_client_txdone(smp2p->mbox_chan, 0);
-	} else {
+	if (smp2p->mbox_chan)
+		mbox_ring_doorbell(smp2p->mbox_chan);
+	else
 		regmap_write(smp2p->ipc_regmap, smp2p->ipc_offset, BIT(smp2p->ipc_bit));
-	}
 }
 
 static bool qcom_smp2p_check_ssr(struct qcom_smp2p *smp2p)
-- 
2.53.0.273.g2a3d683680-goog


