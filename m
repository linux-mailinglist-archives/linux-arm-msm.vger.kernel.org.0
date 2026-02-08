Return-Path: <linux-arm-msm+bounces-92150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DIsC3oLiGmyhgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 05:05:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC524107CEE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 05:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3DF26300BBB2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 04:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B02B2D2381;
	Sun,  8 Feb 2026 04:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SrsrWVWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C52C0296
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Feb 2026 04:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523487; cv=none; b=O0cpoLBrGPFQClRkRcKqEX9zC6YNrTg9uEph85XEhPRWSvKPJyHWESGi17rBLayR+9lNdvrmaNpmLh59T5ssvJ0ZtXi8NrcrOG+NFwildbs7m7R+Gn6aqIrU+rtCTBR5bJ9NeaG14FbKu6EwB2RVn5va2/NU2Fzk4+r4OJG43N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523487; c=relaxed/simple;
	bh=G1nudZutYj6d9MNzox0nHfR1iYoPe3imRgM6voCKXqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkjZq5xJwxkbolOeLx4v3D46DRwDjVBTW96J0Xfy+ZLA4JvqlaYCDOMGHg7snLk5tJuNpnlelm21jGTRuECLdJbqVuxsvALh1AQupRjcg+jQFYe5U6RGep6GZ9F7S+x7FD0GqTYKRGowSPPwXraQPgFQFUeUyJo0kBiQut7K8cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SrsrWVWE; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-124a95e592fso1565745c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Feb 2026 20:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523486; x=1771128286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDSoxJmUAFCsFOozdtCEnUcIaNdh6KfxLjvN8lzvaUE=;
        b=SrsrWVWEQ4GV9FKiXWl0C6wpWS+xgTlrd77iq5c+tvlRIM9yQ/Qfd5F+wIB12vSUKC
         hSFyrqZxuQPjb+BmU0k5rky7expVU48+o9v5Bp79TlfaTZjgR7/BvyLRWyRu2dPwNHog
         hp3pu8HDPQhLdeOUgxkFcR4Xv8FRRkako++YE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523486; x=1771128286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZDSoxJmUAFCsFOozdtCEnUcIaNdh6KfxLjvN8lzvaUE=;
        b=X1A3aSIQ2OdpsetJadVCwlKf0GZ/DhoxhD3xL7jtkdmNNGONhOeMJDLc2mSbslwUdk
         JUG52fWxVlPbnQEbNvfZGLRC+piaReEASVD+RncxYK+5YB7ryWYYQNwAHzaUuA8Pa99w
         t4lwZO+RFEv05ESiBgqBztkvNJx3oTMhmSs9QNDYTTv4Wlp9DyyU6GoA7TKNrMQrdYXi
         5gmCqxsuHjt1/txAtG5TBgrqrHSER0IZGEHF4mWiF3CR4wG72ELLzuT6VFnR99xnWUfz
         7kAKyxeLW1jc2+SDXWyzlSeKf3C3O2xc6+9KwvHVM4tJoUfD8mLySJ3ULMipKmMv3vxj
         BvKA==
X-Forwarded-Encrypted: i=1; AJvYcCVqjRf0BRKSPDgrpyEo0+Xpst60gTsF0ckQqTcp98Z6b0dDNePQroBicngA8liyA6ZnMwzKOi3Y5ZKElGgC@vger.kernel.org
X-Gm-Message-State: AOJu0YygK7odbZktDrxp/EhqZ1YW/Obvw9n2ROE0lykfBfeO/ad+3lKk
	DYiOOruEvuKqzTmd9dwCk6DFn4agJpIn4g1gQeprZSvLZ2QeK9bduFjxCWRwVZWi0A==
X-Gm-Gg: AZuq6aIZOs3yTi9zYsbPlxwH1fnWFCjoUklNvcAhsVy4acCtks+A5WGrEgCS+gXPjjC
	YSMKr7meaOGkXUciZdkCKn+tlndfHZ4QfDwtVBP/ye6ljHJUZXJlJSdyCtL227tNs4C4kzHt9lQ
	zWZt7OGg+Qo8d8vBzXT6ONwNiFUcHXeBfUacX019er0UiRfV1ZO9oOFgCPEMB3bT2FN9lBmcePN
	lTNe95Rhlw7wDg4dWb75qywzSVyzPRTeNZtm/O9J+A1V20rrsgjfN6U2ZR/Oji+B+dhL7+wW2SA
	MWqX2kgkOFzG+CGXcPNsc/1H7VnV6dYqyav0ZQw5VC1Ue7+qpZuzeleLfrDZHUYwHQ/ECObHUIi
	t1rnnOaQTP3nohFsuW67jn0Y/te6nUp/3nBObYS1n9pRnTXB2okDs6m2TpMwAcCotQyceFs5UKO
	UjbVOX0ZtNSr0f6fQ3DHASwkMLxTvEs8dKgy5c9ALU82sqYhMet51ALetpZuR+cQOvmzPPkkY=
X-Received: by 2002:a05:7022:301:b0:122:345:a948 with SMTP id a92af1059eb24-1270419f523mr4166171c88.46.1770523486146;
        Sat, 07 Feb 2026 20:04:46 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:44 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/15] soc: qcom: smsm: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:35 -0800
Message-ID: <20260207200128.v2.13.I18ba5837ac5c89cdd3531b6b09a2ab24a95912fa@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
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
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-92150-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CC524107CEE
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

(no changes since v1)

 drivers/soc/qcom/smsm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index 021e9d1f61dc..1e127678fd9c 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -182,14 +182,12 @@ static int smsm_update_bits(void *data, u32 mask, u32 value)
 		if (!(val & changes))
 			continue;
 
-		if (hostp->mbox_chan) {
-			mbox_send_message(hostp->mbox_chan, NULL);
-			mbox_client_txdone(hostp->mbox_chan, 0);
-		} else if (hostp->ipc_regmap) {
+		if (hostp->mbox_chan)
+			mbox_ring_doorbell(hostp->mbox_chan);
+		else if (hostp->ipc_regmap)
 			regmap_write(hostp->ipc_regmap,
 				     hostp->ipc_offset,
 				     BIT(hostp->ipc_bit));
-		}
 	}
 
 done:
-- 
2.53.0.rc2.204.g2597b5adb4-goog


