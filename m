Return-Path: <linux-arm-msm+bounces-82157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3D1C65A34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 18:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7ED1A4E52E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 17:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3EAC308F39;
	Mon, 17 Nov 2025 17:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="j0sRUQvE";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="/uZjEUsg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B7229B796;
	Mon, 17 Nov 2025 17:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763402363; cv=none; b=fPbF2rjsknF1vupqcGvzBEgLG6x0RDr0GxRg8vc3FQIj1j9CL2xN4/zPSK3jEcDeOIgE9IZvUUme6F2fjPR/8kg0m7Y5gbyw4hlPCLWeO4f6FQIuE8Et5zb51wj3mIPtlarusaZvIt8qLt5rSSzq9AZ0R7SRFPtLPRwhd8WGwHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763402363; c=relaxed/simple;
	bh=cv9FgGkCd8N6arFCRZS3eOrBErQaZM+S/sP6pgOgkuk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PyUmyLcmaNEb0yZpU9FY3qnX7I/TQg7UDpNXBSIWuc/L2/iK5B+6fss737N5UNeIeOr75WFPy0Yc+8QgmJ8KFeVTkEW8IMkn/iT0cddbwgqxoIP84kQO0F7tkWOeGiSHvfLYWthiVl/e64OikbKcNsEPMLaGsPGEmPgH/ZUfZ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=j0sRUQvE; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=/uZjEUsg; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1763402330; bh=8j1TXYdemwIblpZ5w05T0pl
	In1pq99v5SjoGvJ4OhfY=; b=j0sRUQvErKiqePpyNrg1VxiotVAXk1wHxwUrxmbBgmU6oA+SCS
	JESZ2Pm4b4RhD/pqCSrpAY+G55rG97IvrtTPY0cowpKTRGwnFo5L4jBrISuUjs5AnkHz8mmSISW
	Fq1CaqbbJn25E+nZjtQogso9lVowdYNZHhJ2FD7h6ru6rmphvAV88o8Lam3hror9PlA05MyYNDZ
	pqslp/9p0g2o0pTqUWguom7cikyDKXteFhF2sqPyLzuMGjOpf/zyHQK6I11/nizYRytVVsSkTBN
	xDwZYLqaVSEErPd7IUx8mXhtTzjiWb3VdJ8MTka1mhY7CssGdWJ65LjQClnAInzV9xQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1763402330; bh=8j1TXYdemwIblpZ5w05T0pl
	In1pq99v5SjoGvJ4OhfY=; b=/uZjEUsg3kUOS8Uhf3P4TWIO2usjIm1fznxcf9JYOfBFAnis31
	yvTI1H3MbkPVRrCwzyFl5B09QbAsp+V9ovDw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/2] MSM8917/MSM8953 Remove ALWAYS_ON flag from cpp_gdsc
Date: Mon, 17 Nov 2025 18:58:46 +0100
Message-Id: <20251117-fix-gdsc-cpp-msm8917-msm8953-v1-0-db33adcff28a@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFZiG2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0Nz3bTMCt30lOJk3eSCAt3c4lwLS6AgmDY11jVOtkxKTDY3TUwxNVM
 CGlFQlApUDzY+Ora2FgD1cwGabgAAAA==
X-Change-ID: 20251117-fix-gdsc-cpp-msm8917-msm8953-3c9bac75ad56
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Lypak <junak.pub@gmail.com>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763402330; l=726;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=cv9FgGkCd8N6arFCRZS3eOrBErQaZM+S/sP6pgOgkuk=;
 b=l8SfFheaybdMmYrqLU6NXQtXn8BBSKVbw5Jg/5rvyzr6z8IZzG6EMqFjQf69pBgnInOpgNr/M
 nfrOCPo/2VdDmVL8V1h5ukxqYLh6Zft6gBQphj8Xr70upIwZojO8JGt
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

cpp_gdsc should not be always on, ALWAYS_ON flag was set accidentally.
The flags were used for debugging purpose and they were left as always on
at the gcc drivers submissions.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (2):
      clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from cpp_gdsc
      clk: qcom: gcc-msm8917: Remove ALWAYS_ON flag from cpp_gdsc

 drivers/clk/qcom/gcc-msm8917.c | 1 -
 drivers/clk/qcom/gcc-msm8953.c | 1 -
 2 files changed, 2 deletions(-)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20251117-fix-gdsc-cpp-msm8917-msm8953-3c9bac75ad56

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


