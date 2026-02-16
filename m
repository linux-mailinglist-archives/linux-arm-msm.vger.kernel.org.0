Return-Path: <linux-arm-msm+bounces-93014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM1vBLRek2kr4AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 19:15:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 338D6146F10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 19:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 65CE83018E1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 18:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BBE2DAFDA;
	Mon, 16 Feb 2026 18:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q2e/89e+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F563314A4
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771265515; cv=none; b=VXmO5YFBJAd68+CUfBg/uRfP1RIimpFG1+JVnC7n2/QOgoZWTMzTTW9EIhvkFAx+S+/XuhKY2CoDpMNlFG/YJlRqImieoOwJwcY0t862VB/EWB8PZJQKX3n8fTGv8YjqrF4CAyBzNJqzHWnyD5a69ySUdndP/NU5Gk+21NwxtzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771265515; c=relaxed/simple;
	bh=W+176oTBG/C8AKzIcrHzVeoVwp5F8+32rXhrWXykrzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePTc5/++LC2h96sDRIITroo+fOsh6I1BO+jlo0askRmThnegLFqIo+jMiOrnrpEoal1E5RCyL92r9c7OJobQ0k5Oisp9L684Q720E15bOboIyVyx3tlJtWYx0DD+U/csNJtNs7QwGrA8RPfqgXP2y1Uh/6eKNWmp5c2N/IrJxAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q2e/89e+; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1271257ae53so3481709c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 10:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265513; x=1771870313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4sITQtMA3O7CTV7vddQrukiiEajLzgMMa0j7tx2Nig=;
        b=Q2e/89e+vjYz9jKA5aOs2uzHdizUVZtUXFt5MEA7uNJpNdnW4CuTD9tFXtspH1FAWq
         oIKGLhPj4Fsj019uDTzGldX5xQ+1ucr0YxRv0+sRSwNzS5PIBO8XA1SIJ83bjH7x+Vjp
         MB9FIK2kfU8Kvv+GJvKXMMx9mbemZpRFpA0rM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265513; x=1771870313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e4sITQtMA3O7CTV7vddQrukiiEajLzgMMa0j7tx2Nig=;
        b=lTDug4O1Gmax40Fz/MarY8Tr0FDCyJXbvkqwzyWsNUFMlAZG8H6DMsxmfDS+Hryc4p
         zChrz8BACfeUe9PR05lxwH870GH+TGveyiHhPZFOB0IUQihWjG/P+2cq01aLjJGiumOF
         dJqKIiS1JAFpR7F0stRGR65DLVVafdzGvOaP2rNcdTotW/0UXZFa7uXP8NEB6IWfgshV
         XHszsFidujjSmfAed0OdKpeVIsPJYbbOEl/26u/47HKXvd5Gc8aCmZ5U33+dliB6/jP6
         SDjnNvfPPtbEv8fterwk53sXPFHNMOoOMe8OA6rmAtJ0F5nz1JtdNqtpuBm8dxWQw6Ep
         Imxw==
X-Forwarded-Encrypted: i=1; AJvYcCWuMc4jNYniO3hMJA5jr+/1wPGY/8ne3w5RC/gurc0D1i2alFpPwi60lr7Z/uR0WNcGy38siv+d+S8tU7zS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk8FhO6sLxxfSOoBYV14N66Yy3PeWAKPZSuUVIpCVb1qnEo8D+
	DXoi8U/cAeEH3s3pwsb9aI9jzkE1nAChgCO30lO2b0BjaHfkJ02mgxkhbnHvKeaTtg==
X-Gm-Gg: AZuq6aKLKJoedXYu98VVUU/RWK8JweqEm3NHaUStKqld6FIvJFknQZQzuHm4hkPb+wI
	7M1Fkauq1UkMKloW/o68hMvljmtC8uizzYdLSRnfCGfGefEC0iMHiVHgch+0jGw06HCgUIRY/Sv
	ycpLsnsL5emY50GcVMmRngwFog5+KYSpO5Jt6aFflsUPGzbwBiEzAoyiV8omQvEE9334NZTeKHi
	Xf6X5XW6mjCf+EmWKdHFhPA+RomgpR/M0dFFpBYtwXeWvTVug16tVXK26mlrtsJT+VzRleQ9aWd
	WfDPXX8QVZKe0f9uktogPZS4cZ0MOlr3+9AI8II/oyRNMcOr7Dyt8yk8oO6F//tfoxbJihexSsk
	W6FsFQl7v9sJyEIvB3M7nzyzzIS5lJ0V8NaamIetspBlbLmSGdJB2zV4pbu3uztsdjmtZ3ornMS
	bSOdJ3RphxaaACorHz1S5StixYLJpHTI5Q5iYQreZmaM+3Zhs7pHzb3QbXi7kJeWiSSYh9+K12Q
	iUmyoXEkxQ=
X-Received: by 2002:a05:7022:69a:b0:127:380e:ff5a with SMTP id a92af1059eb24-1273add779fmr3928066c88.17.1771265513269;
        Mon, 16 Feb 2026 10:11:53 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:50 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/15] soc: qcom: smsm: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:50 -0800
Message-ID: <20260216100943.v3.13.I18ba5837ac5c89cdd3531b6b09a2ab24a95912fa@changeid>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93014-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim]
X-Rspamd-Queue-Id: 338D6146F10
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
2.53.0.273.g2a3d683680-goog


