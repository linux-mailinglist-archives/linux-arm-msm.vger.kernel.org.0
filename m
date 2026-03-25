Return-Path: <linux-arm-msm+bounces-99929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJhYFkcnxGmZwgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:19:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D50CD32A788
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56A5331116BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F77421A0A;
	Wed, 25 Mar 2026 18:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BowbVxWU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65FD41324B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462106; cv=none; b=Inn5euypy7ll+wt3qmaRpKyHe2vGD/9b7Jf+5gU9IhRFWHZBw6mGGukV6CtlE2zgWDvYoot2X/OFr/+Kda4Sldg07sQFE5z2fPdbEYdhVIgo0VMQKx0Sibu/U6Hqr2v1YHLZiSAjcM0+Xgz9UeFswI514mbJKf07uC+hrrFZGNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462106; c=relaxed/simple;
	bh=O5VLqveoT1MLTeYBJSBjiMtqJBUVJFLJ/CLj6h7ZMKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FPL8H7cNvPwd2fQ9YtDZE4YTzs/rFeU8CDhOfhw0cov7AsJgEvGa8KcwJ1ez57yYlaB6obPafvTk6TglvgilLwGdgIcbcCe6Rz1VSNLymQ+qhnYcm4Wx9Gvt3FbNZIW6y5qa83VPzfJKifAmpV/k7LqPVzisMP6L7Udse1i3gQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BowbVxWU; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b04fc8851cso1090065ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462100; x=1775066900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rvofdNd3f5+/efY7L/G9vZlRMw7vdhOoBtyFgJOyhQ=;
        b=BowbVxWUsTxPoaN+CY/4SCHwbmKekGCN9oRDlaklsw8SuxO9WJB1c0981LdLlONhPe
         SwaoMB5eTZvLEuRoCMtIwBNJhETQJql2EVD1lAZjnNL/LM9wuIzxfYs2SwBJFhFyYde5
         AF0wkLrb8mZtVsrmgL4EAuEnKBVOuqc+muqxzsjEOQZ2AuCwNnr6W48hiC+JU6CSRMls
         S2uHNUGm7Kr1xi31mTt8mSxNbHxKs3Tj3Ud80pGE/1NC59RITZ+ycot0AHe/7r47fYAP
         LPz6S/9CGGb2ggzK4R5jo6YLTgj7CBrSAZeodDBD4thBFnuAWlTglg755o0YjNqYW+8q
         gsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462100; x=1775066900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+rvofdNd3f5+/efY7L/G9vZlRMw7vdhOoBtyFgJOyhQ=;
        b=RTjjIkZP1ADZbqacRVDJgEVmz0aIyMC2Ul+aHVsqDJFjlOCUuQ/1MU++gThgrvanRO
         6Ei6Olx0Hl0WZ+T9tjDDSUhSFaXEVNG8gA/PzT+taEV5+GPLTuL4SaxChgS0LHLlOFTw
         v4JJiDM/5d2RrnacyFlaPS+WMgZGMFU+d66bh9hy5Pt2Zm0lJM7gFdtcJ45st1uAs8/0
         Ids76vNmxMagkpUldE1p9GphtVbRjFEuGvp9FJoBcsRtSNz9SHWN1iOHCMJejVLrsDbh
         HzgGnrogj5TsmASEImZz9j61d2Xv6dVqUN9JrAnW+NG6YyJZDp5Vs8XvgnWnT+D/rwwy
         TvBw==
X-Gm-Message-State: AOJu0YyAq76jtE/FmCBTsJ20N6Ltonddl20Ax/LEC+AiCRYcnnV+q1yD
	oVQvWIpwAHIs4lXNe1IrIKk8JOTPiPdGWHfa6AYsUMmLLhVdoUe5yShm
X-Gm-Gg: ATEYQzzBBOvbeXkHaDQBKVNU2BnxtZRDJ0akcOMtjmVx9ZetIRr1pahRanHYdEGf/vg
	xta/X2qE+y1jlHisk+WHSN2nZyi1WRCB9sU4LR4cNFep7QvMwAyplJaC+aZZ4kiPCP0rSRTgGIp
	wY24jv5+LEJ2Mxnz3tTYZqgHdjNIMHDTWnX9jcosF6P475IGg/QEH/bZbQovkTRw4+3ML4ocmE+
	ZddcJGC0ko2st2lhfwjEasrEEsxu/oMetzmLtJE/QvJM9UYkmiQPfjTpRhnhptHG6bYxxUicyJi
	LCE3DsP9jnEklDQXEAN+ZYCcjBWUfZCZBDhTgLludSfBO1W3oHJDMjnZrldhvM4MzcKc4PGS3v+
	O3VsH2tfoeTJqlFAp2EXe7K5xHVfsZND7MEQkPwYI4bd6ppKbVPYymusCyof3W1MPEBWwxaWoIR
	9myz+vx/cxWXh5fckJriTEFmOh65QM
X-Received: by 2002:a17:903:3843:b0:2b0:9a61:916 with SMTP id d9443c01a7336-2b0b0a7f831mr49090795ad.31.1774462099766;
        Wed, 25 Mar 2026 11:08:19 -0700 (PDT)
Received: from [192.168.0.102] ([43.251.91.187])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc773b33sm5687805ad.10.2026.03.25.11.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:08:19 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 25 Mar 2026 18:07:30 +0000
Subject: [PATCH 7/7] dt-bindings: clock: qcom, dispcc-sm6125: Add
 #reset-cells property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ginkgo-add-usb-ir-vib-v1-7-446c6e865ad6@gmail.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774462047; l=913;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=O5VLqveoT1MLTeYBJSBjiMtqJBUVJFLJ/CLj6h7ZMKI=;
 b=rUnZtLLz4Xmj0RcCQQLRkTmldWk3RQ1b5aFfulPjR4kYbTcb4NhNVfi/aoK7g8WkEfY0jg3ZZ
 1uXUOvuzSagDL/2aA9WfaTAyKY05yLQdKb4KrPcmZQxOrgym2fPHKNZ
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99929-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,intel.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Rspamd-Queue-Id: D50CD32A788
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The '#reset-cells' property is permitted for the SM6125 SoC clock
controllers, but not listed as a valid property.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
index ef2b1e20443..0d467c1f30e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
@@ -45,6 +45,9 @@ properties:
   '#clock-cells':
     const: 1
 
+  '#reset-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 1
 

-- 
2.53.0


