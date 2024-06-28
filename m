Return-Path: <linux-arm-msm+bounces-24663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 319A991C511
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 19:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2E031F21F84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 17:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88AF1CCCAC;
	Fri, 28 Jun 2024 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ZBjX/H8V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306391B94F;
	Fri, 28 Jun 2024 17:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719596477; cv=none; b=s+5R50q4FDMC7S/u4K0cXDy34GMALBDaDplX/DQN9HX8VNanue2eam21oywD+eBfcsqXy75u+Dt5v/td1xiiY95ntxrJsQgiQtnA3DLUheTruDyZpFyfK+kCKmJemXxz6dNGcaNQ0un0coAH7GGSEDFCkGPPOaTS8JpLbMAkagQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719596477; c=relaxed/simple;
	bh=toIiav45hbrwvCItcKkP6A45Os2fpVL346q+vWA/6IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eetTjuYMffnFyw14oGyemDrYEiXsLw/cG1df/3gzlHiaDV+WQNj5qU3gTdimPE30AaFz8JWxx1s6ywdbvKZX4yCG6Bfj9nOXVWsYOccU5KxMiBqoNAHI2OquQamzzgECd5Cr/CMNZhHWRH5fWDVxRvEwj6z09KbgV0EC1UnZang=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=ZBjX/H8V; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1719596473; bh=toIiav45hbrwvCItcKkP6A45Os2fpVL346q+vWA/6IE=;
	h=From:Date:Subject:To:Cc;
	b=ZBjX/H8VWPTvLPm1ftDaOFAaEcOi9R2E+Ce4Rg9vfolEY8AwPd1FKpvVdunhqwMOJ
	 e1X8wMkWwHdFB7QNZ2L8RFF2Md2ew913WUQya7Kw9yumX9SPrxTAPXhXBgtajBC8B7
	 rVxd7C906/TRN62YPlAEuhevkUIfv/r8cF08232s=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Fri, 28 Jun 2024 19:40:55 +0200
Subject: [PATCH] mailmap: Update Luca Weiss's email address
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-mailmap-v1-1-a0d12ffd1cd9@lucaweiss.eu>
X-B4-Tracking: v=1; b=H4sIAKb1fmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyML3dzEzJzcxAJdY1MjizRzYzPTxKQkJaDqgqLUtMwKsEnRsbW1AOn
 eJpNZAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=toIiav45hbrwvCItcKkP6A45Os2fpVL346q+vWA/6IE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmfvW4le6rriyujXy0XorJNe8GloR7MugOVonFA
 faFM5vNEl6JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZn71uAAKCRBy2EO4nU3X
 VrKvEACgd7YTcnp9R2cdZnmGgIjv9KZojIHB+mzQNcQFZg7z5ZyCLOgF4GnMyH8noKOwAEecfFL
 GbJg1DCQd3UrYuw01OeAvtFyjK9JU2oIk+pWYY68QOP/JOJM6NwNr7e6nCG1s9y4TLup4u/m1U1
 0jlDiAUgjcR8pmYz+b0p035PbGdKG1Mp56w3+Up/ufu2NABVr8/fOa/jMkvFBea/fa4obfdKon7
 u1JdOt3OCfznujgKW4B7bHMM3gXBqJSYjGM5xsRNmg3gpSODahztn5LdEB7bxIgAQWEBQK5FBnv
 BTVujGIsdu4oC2yurvIjBro90sc7vHhlvIwyGZVCJ13Tt4k9hIco2XTeqE2EQWZHNiMXJ+mta+h
 dlp8HyB0WluDjpgxbZp1Kj2tw322WJDHIoJ9IiBUa0h0UHZJiD6oOFcl8SMxD6YixPkHhfwKI7N
 JajdnWhuwFqeVhX7gmzlud17pqJJ2EcpN+dMuwoL0rbA95Z3boma5EcqupyHLOGWCyhZ2oe8aGr
 4w/BWW4WoYC1DkKNME2j2FGXp4jusrfsHd204xdv9LVUlrVAn9c37UW+Vj7uQ98Gl1FS2nJXzjg
 oJZmPqkmpMFvDmHQtH1UoWncJO47Fv4y4+jevnX9rTxBnl2RFmCSwARvIkpjtgH9KNFGBTnzdgW
 sMdR7f0cTE9hilg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

I'm slowly migrating my mail to a new domain, add an entry to map the
mail address. Just for clarity, my work-related @fairphone.com email
stays unchanged.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Since my email address also appears in a bunch of drivers and arm(64)
files, and two devicetree binding files, how are those normally handled?
Just ignore them and let mailmap handle everything relevant?
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index a6c619e22efc..e169a99ce7c7 100644
--- a/.mailmap
+++ b/.mailmap
@@ -385,6 +385,7 @@ Li Yang <leoyang.li@nxp.com> <leo@zh-kernel.org>
 Lior David <quic_liord@quicinc.com> <liord@codeaurora.org>
 Lorenzo Pieralisi <lpieralisi@kernel.org> <lorenzo.pieralisi@arm.com>
 Luca Ceresoli <luca.ceresoli@bootlin.com> <luca@lucaceresoli.net>
+Luca Weiss <luca@lucaweiss.eu> <luca@z3ntu.xyz>
 Lukasz Luba <lukasz.luba@arm.com> <l.luba@partner.samsung.com>
 Luo Jie <quic_luoj@quicinc.com> <luoj@codeaurora.org>
 Maciej W. Rozycki <macro@mips.com> <macro@imgtec.com>

---
base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
change-id: 20240628-mailmap-3528f7365abb

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


