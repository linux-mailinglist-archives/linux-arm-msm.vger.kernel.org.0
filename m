Return-Path: <linux-arm-msm+bounces-46416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B2FA213BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 22:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62219165AA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 21:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF06195980;
	Tue, 28 Jan 2025 21:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Liu6TziQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47271946B8;
	Tue, 28 Jan 2025 21:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738101260; cv=none; b=Iv4j/ru1XOnnmQULO+8RshU2JEhCxCnwGqdSz+lCyiW/2JS7b3SkPFkiJtDNmOjikC/4x5L3nrV0KEeMzEqSjwkSPj0hpYuA7jeTEf4zYgLDvze3mwWWc6+D4BL74VJuPJdoc+PcCZYL+WPfeMmAlPCWxw6XbMrIMpVRM9W6ehQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738101260; c=relaxed/simple;
	bh=e48j6OiMUEeUN0CSopo4eyHILcJuPuBzf5GTDLuUUjY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dC3wumvEGSa/C+uOiazMlXoLrbjj3E1ldNgZUdviFUooxL5WsG5V8+zfOQC0R1Ey4vdTG66G4zXyrIu53YrrqawOoBeBam8JkoaFlhlG6OLJ5g0LYuUmlkULyB09CWOyo+yCJ8Q3jWswWYgch7AzCSqO/py6oXiEVh2QiE1ZUuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Liu6TziQ; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738101256; bh=e48j6OiMUEeUN0CSopo4eyHILcJuPuBzf5GTDLuUUjY=;
	h=From:Subject:Date:To:Cc;
	b=Liu6TziQyEesgtPFS6nXrLWp9jol+lac4RyK3yBJWy6BRzldpQMNS+w9xCRYvijp/
	 qriPqZIa47/rONm2MhzIiMRrKYFm61//hKMCyVSuw6OKULZpTitfVpK1NmH+fvV8Zn
	 gGKqS8aL5jz4tdZQdzbi/2ewpLUL8+Z3Yp1UJuRI=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/2] qcom_q6v5_pas fixes for msm8226
Date: Tue, 28 Jan 2025 22:53:58 +0100
Message-Id: <20250128-pas-singlepd-v1-0-85d9ae4b0093@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPZRmWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyML3YLEYt3izLz0nNSCFF0TM8vERPPUVKPkRAsloJaCotS0zAqwcdG
 xtbUAekHITV4AAAA=
X-Change-ID: 20250128-pas-singlepd-469aa7ee2ca8
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=678; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=e48j6OiMUEeUN0CSopo4eyHILcJuPuBzf5GTDLuUUjY=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmVH4mFuKfETtvc9D3UzpFnn8+XUBD1BRWoVaY
 fnMyQphbdCJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lR+AAKCRBy2EO4nU3X
 VjjlD/45i1HmOWe5OneZ1Acr6xVEUsNG556t6Jaz5QdeLXzlB+SstpxcDw1KVnxN1/rDiVWz4QU
 jovSinOlVrxQT1M03n+erMFh+kwDvCUL3OaUwNAVDmqWmgcEoxYO/SJYM10cYnN0qoLUbJkJjqh
 1nk8mxTsR17OS6RmrncIzb87vW4VCAheFq+ApcQ2avfsuj9cxsbeAzjgthUsUxN2Aj06cKkdfeC
 Up1920rwd5W72Ft6pIWpNmYlRXwkd3lLujPTFss10ttOBO1I0FmZkNVBLCk933GF1teMsgtpXqP
 WlA4YW1k82hr5rqp2zrkLPWwgnBPi6YH5kSyeqftdVGtLkr4Pa60i2ctc19Aacb7WYkDukMpO3s
 YYeVVbszGmJICEvsQUuwCPB9Q9wL699NrRTCZsoY0z09ILj22A+TG/lW35AD2MvhgDq+bEWwO3n
 BZJKdQI0+wP+DQEClvqh9BCTAcQ77ma69aHxVRp5ZsS6PO1y0yqCUg4pj7vQbHdFp/Jx+Rkj9sa
 hwlpceUzhHnCLvsAnCNtwp15Nv+osSDs+yP8c5AV4o5Qxw+2G7M4FYTNVhHywZHH9LWALcCSwxO
 r1AhrCbpGJu2D36roPovwhml9Hsw8nj1wx6YjAcvuGYpF7X6GUZL98fP9hTatogI8ST1kdp8SQh
 TqbR9mCyc6oyTNg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

During msm8226 mss bringup it was noticed that the adsp on that SoC is
not behaving quite correctly. Correct that and add a patch that improves
the single-power-domain handling in the pas driver.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Luca Weiss (2):
      remoteproc: qcom_q6v5_pas: Use resource with CX PD for MSM8226
      remoteproc: qcom_q6v5_pas: Make single-PD handling more robust

 drivers/remoteproc/qcom_q6v5_pas.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20250128-pas-singlepd-469aa7ee2ca8

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


