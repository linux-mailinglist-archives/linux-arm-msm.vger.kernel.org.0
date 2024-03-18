Return-Path: <linux-arm-msm+bounces-14426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BB187F357
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 23:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10A4F1F21A3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 22:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0508C5A7A4;
	Mon, 18 Mar 2024 22:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pI569OBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DE85B5A2
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 22:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710802167; cv=none; b=DzJd1FuZrVz23kHieHNlEv44I6hxWWcBzpMLRCtnUi5sH1KJqvY2jU/nMtYJI/ojH6LJzaBCjmVnuUnzgWsJ3Qyt4va63n/MnoaMltNSbjrPsgD3f3i+figymV8jjb/6szKGDNVqtdNzVlvll47qt8ASMo70+yB9hEGlhX4UKeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710802167; c=relaxed/simple;
	bh=7ElkExln+LzH1qJsWL78fTMZuik1BMBe40sUEK3gv20=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EZIqhNdddGQ4HMqhBYXwkU1b+BBASm1BcWioTbiEfDnIWJ0C6X9VqrqWtCRo3sDog8shafzwkOSZzAxIhNr/IrUFvlRBJ+MUdAbuvauvq1NnY5BDo6iQRbLTc8G5GDFTt3gL1OTC5d7S7JA4NeBpQCe2fS+ZB6a91ejZ02nIl3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pI569OBW; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-7cef80a1e5bso439f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 15:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710802164; x=1711406964; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LgDnfik+9/3BsUysoVFP/f8YdrJMDhMQegoRsxaj0Vk=;
        b=pI569OBWIUrwNnT0xtrOqGhiJ5cHoBK5UsHqayDzmLdnr2MVNCQrS76zR+B3jZgqDe
         Uc1qf2I4vh6+/9oNv6d3bOQh9XN+5iEqGmHVdliPkSCFtlNMJi7t5/h97BLdyI7o0Puj
         4gFAGYUENkqJhKfQJ9szC4zM9mMuhel8xYVa7YdITgjO+XEwRySuhcK+cOp0BDkmxrLt
         sIm42wKLGwDURitoDoDCIP6oCtNGByHr4rMtNvHjqihWrz3zug0ASEWjOrnE6F2YoWI7
         GE3UVqGNEoomi3e6ZhlS/QMdqvvOeoPuHztfzAImMeAnhduxacwbyNeM+vLzSLTLRO8N
         OUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710802164; x=1711406964;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LgDnfik+9/3BsUysoVFP/f8YdrJMDhMQegoRsxaj0Vk=;
        b=Fl4CoTIxwN54ZySyvmQejLrfMzNmgdtYVOkjmRJUMUTmW42PPtGVpe51uoc8DXYNbP
         2Ai59L+cxyYis/ZynzYZl+bzFsBFSABE3z8W+8kI6zI5gE9WBUgrPOK4ncs6f9HnOHK7
         /lQGDHOiFS9rFBONWGVNAY0x/M/lxfG5gLYx151HyLwnk8KzKpSTc0/0KV5hX/5AdwDU
         S2YTnOwDkYDL3QG0cWqvrbff8i8DT7VoWmcQVtfKysgr1UvW3c7XPXTI3B0iVMK7YSIs
         sG8O8TdG/s0RDVJ3sA9x8Yd5iEZD2WgSdVv6Lw0F2z57BTzjxUFPfIXMjo0H8fE1Cx8t
         d/Rg==
X-Gm-Message-State: AOJu0Yw3rjWQFcexJt186spFtt/jZflERxJKUw2KDg9QJf3Zy/z6Qth3
	pXoVVzHXMYC6nBb0dwYs0Br9mEFhQnKnGwcnwB+eDdxzuDHrZ0/DMpLEWOyVGQ/g/ftCSRx7KPl
	FELoz8B6mRLMKdbbuAUBn+g==
X-Google-Smtp-Source: AGHT+IHMpcJoXZdyrHjAYr1x0gAOLz6kDbg2aET0fcmbxdiALkUs3IYlBcuQW5IgSRdlf2q80a1jpzftzVuiOykGvg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6602:2c94:b0:7cc:342:72f9 with
 SMTP id i20-20020a0566022c9400b007cc034272f9mr230571iow.2.1710802164523; Mon,
 18 Mar 2024 15:49:24 -0700 (PDT)
Date: Mon, 18 Mar 2024 22:49:23 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPLE+GUC/5WNTQqDMBBGryJZd0oSFaWr3qO4yM+oA9VoRkJFv
 HtTb9Dl+/h47xCMkZDFozhExERMYc6gb4Vwo5kHBPKZhZa6kqWqgLc4u2UHHylhZODgYHVhAjd
 58BYc6LbqS2ONsbYV2bNE7OlzNV5d5pF4C3G/kkn91n/sSYGCRva1r7GRTamfQwjDG+/5JbrzP L/AnnN60wAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710802163; l=2041;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=7ElkExln+LzH1qJsWL78fTMZuik1BMBe40sUEK3gv20=; b=2o9Mfp5OBit8WuRHJkby3WD6RzVls4Keg34t/5M2jalSBs/dZ3Qys4mmBx2jYrJLKgBnHKO3H
 B6IiMtq77BiA691RdJp1BUVkGirAZymbUYDAEZ4NAKMlveJamKnqRhn
X-Mailer: b4 0.12.3
Message-ID: <20240318-strncpy-drivers-soc-qcom-cmd-db-c-v2-1-8f6ebf1bd891@google.com>
Subject: [PATCH v2] soc: qcom: cmd-db: replace deprecated strncpy with strtomem
From: Justin Stitt <justinstitt@google.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

strncpy() is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

@query is already marked as __nonstring and doesn't need to be
NUL-terminated. Since @id is a string, we can use the self-describing
string API strtomem().

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v2:
- use strtomem instead of memcpy (thanks Kees)
- Link to v1: https://lore.kernel.org/r/20240314-strncpy-drivers-soc-qcom-cmd-db-c-v1-1-70f5d5e70732@google.com
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/soc/qcom/cmd-db.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index a5fd68411bed..d05f35d175bd 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -141,18 +141,13 @@ static int cmd_db_get_header(const char *id, const struct entry_header **eh,
 	const struct rsc_hdr *rsc_hdr;
 	const struct entry_header *ent;
 	int ret, i, j;
-	u8 query[sizeof(ent->id)] __nonstring;
+	u8 query[sizeof(ent->id)] __nonstring = { 0 };
 
 	ret = cmd_db_ready();
 	if (ret)
 		return ret;
 
-	/*
-	 * Pad out query string to same length as in DB. NOTE: the output
-	 * query string is not necessarily '\0' terminated if it bumps up
-	 * against the max size. That's OK and expected.
-	 */
-	strncpy(query, id, sizeof(query));
+	strtomem(query, id);
 
 	for (i = 0; i < MAX_SLV_ID; i++) {
 		rsc_hdr = &cmd_db_header->header[i];

---
base-commit: fe46a7dd189e25604716c03576d05ac8a5209743
change-id: 20240314-strncpy-drivers-soc-qcom-cmd-db-c-284f3abaabb8

Best regards,
--
Justin Stitt <justinstitt@google.com>


