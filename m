Return-Path: <linux-arm-msm+bounces-105459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FcvOQtx9GmsBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:23:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 871394AB4D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:23:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CA253047053
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 09:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52E3382F21;
	Fri,  1 May 2026 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YmrYNVfn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75868381B0A
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627126; cv=none; b=JRqL8qYvRL9Z1yA86Vz0RVAtatr16f9bQCEOFbxJrTBK2uXJG/HTIEcLkL+HJb+I47213D6zlTiuqv4jpMbhvCAfAG2+VPjTJsw/VPiXw9V0WJlFNSAfolFI/Si5byND1zqhqCwZjui7REhS6wkym0DjCRbjOtB21xIw6DkvgF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627126; c=relaxed/simple;
	bh=2GM8iILc+e+kkT8uuqti/v0hmU/nmTpy3cu5qfGbOaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NR89+jf4DR7IvdIFpCsf8cZX67vXPmUYr1+AxjGarxJ7tqWW+y08+918rB85cxwnpDRWCdpwgDc4PytL3A4vUQCC697qG/Z+iGWJXjU98KvaHPHk/CmNtQAJCDTg4EogkOeY1VAu8lzwyP/5TmY3ein7lRkbiTBIjr+qC11QhkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YmrYNVfn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so17241595e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 02:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627121; x=1778231921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXg42DnzNUk3hE0wclWkHErZDdBr7JTlVE52L0ztars=;
        b=YmrYNVfnw72jZIt2c0uqKrT+3+lXkMOlS2HMnVNKR91b8Ng0mp5vU6j8g8AuAdioC+
         v1GpGBXJ+5yYUH+d/wjTAaffPs8nAL70XNS4HB2RA/E4efeS3OOmdL/4xyjQndHVBr6a
         mXMAnWmr8pxhsO8Lll2KKtOjrOEMbT28VR96RsjH991FRNKtIDTNgBmW8KUiP0+bzZQs
         ITumXlWirX8x0sH6Wm6zOVxOK3b6HqQ+iYVrkJLskuGZ15VtaPJSanYNGWCjwpZWYYTC
         k7i/SrWL9jzWEeuINfEEyKGgTqWV99ZkHf0scLxIdFcmlHr37aqwg8EShaAxFvDeTW+p
         X+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627121; x=1778231921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wXg42DnzNUk3hE0wclWkHErZDdBr7JTlVE52L0ztars=;
        b=T3IXwYtSSN0fCK/w93byQ1SBxci9Z0o6HxiJpqnkxd3TSi0w1MYswrgF0+irYFVJZN
         wrwTHh6RaSyKYjVFONcPRpqCX6SxlW125jrGVPSFUkckWSxmiW5SDwWNY0cjrBwyQ7YP
         vbju/1LMTkonYEwjDylS2y/WQVz70oUiXNLwhUwcKo07QfdJJwODyRQMhwjxyyT1Hq+G
         QrA27x8Tui1qimfsqgE87Y9fQ/M83GHRR1pr7M43duNVBz9jClNfVa8bkRJg69m/fadi
         Dga+ZSOlySBHRMfMztFyXNtfUophElcWkFD/EuEyAumjcgqcKFSMVoULRSfoO0i2NK1B
         rERw==
X-Forwarded-Encrypted: i=1; AFNElJ9nwVRJ0b+rNIc2gi5KkNUKnnOPG1tv3SbvsqoOq2apHYJCVIHYTfPzf9aJvZXJpxGxqjCDrHjWWbvaUgrc@vger.kernel.org
X-Gm-Message-State: AOJu0YwoV/utJBX6H2yLSLVfSbDfkP061lJ+75M1d4QgX6VKZt5vzHbR
	NuiCR4GLwlH3l+54gvW4no7BJSHfrbe8ZZf5jlDKterBjJenZx/dGIcdmCKiJ6nPS2nAFqIh5A4
	jIB6IBGc=
X-Gm-Gg: AeBDieu6frb7aeuZE1aq0XOVoRyo+cUmspDnZEd6Jobqz16bfPP5bq6fRzKKTpDh6qr
	6sLehIj8Pqa2r1jh0u6V9cDPgKAuxzD4OgwpZRPX9UsOoY5uIK8m7tFdOa4q5OUwQrr5D4fB5Cl
	IL4yhZhZImG/pTfUFc4AhwlrlGrjCGUxlicotnHGBnm6hH2/V+2yOCYTV/rEOjYl80AMNaYt+zN
	fjHqtM7F8/fPfO5QcicbXdoKJc4VH6ORXLuhzIIKqTByqioqzcUGM5FZkYPcdJr7ePRDzCbOUmg
	E75kZVMqLdC5SHFpk4G0JoRDOh84xt4oar63x8QluEY9P1lkQs/LJkJDt+S6cOWCgnmKxOIDf96
	lJBg1fWDjbsjP/+o57bGS2o6CL/2N5zi1N6HSaRy8gW3VqTYybufhSUpdkxdBmY3L6VGHAZII9V
	42Hh8yBmZEsWyKYkY+s2JrckbK2cPKNXMHyIJFkUWiVVBa54ECEEloOJ07FDF1rNeLeyiVyhZkO
	AVQj99g
X-Received: by 2002:a05:600c:1387:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-48a84459c6bmr106593135e9.20.1777627121640;
        Fri, 01 May 2026 02:18:41 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:41 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 11:18:32 +0200
Subject: [PATCH v2 4/5] clk: qcom: camcc-milos: Declare icc path dependency
 for CAMSS_TOP_GDSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-camcc-icc-v2-4-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=1070;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=2GM8iILc+e+kkT8uuqti/v0hmU/nmTpy3cu5qfGbOaA=;
 b=ss53KXLsizSBDZefj9m8ibIfFPWlpBeseS1W+oUtlxEk5L8svzteRZ/WbyCg0wJBSBBFKL2do
 0c2CAgCXk+GA7HnF39rz7yQBell0BW+k4rUJuacCUZNB6/7gJ1B8s+l
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 871394AB4D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105459-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,fairphone.com:email,fairphone.com:dkim,fairphone.com:mid]

This GDSC requires an interconnect path to be enabled, otherwise the
GDSC will be stuck on 'off' and can't be enabled.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/camcc-milos.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/camcc-milos.c b/drivers/clk/qcom/camcc-milos.c
index 409d47098c10..579b71e0e089 100644
--- a/drivers/clk/qcom/camcc-milos.c
+++ b/drivers/clk/qcom/camcc-milos.c
@@ -30,6 +30,11 @@ enum {
 	DT_IFACE,
 };
 
+/* Need to match the order of interconnects in DT binding */
+enum {
+	DT_ICC_TOP_GDSC,
+};
+
 enum {
 	P_BI_TCXO,
 	P_CAM_CC_PLL0_OUT_EVEN,
@@ -1971,6 +1976,8 @@ static struct gdsc cam_cc_camss_top_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.needs_icc = true,
+	.icc_path_index = DT_ICC_TOP_GDSC,
 };
 
 static struct clk_regmap *cam_cc_milos_clocks[] = {

-- 
2.54.0


