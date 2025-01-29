Return-Path: <linux-arm-msm+bounces-46546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EBEA22368
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 18:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFFB03A420B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312781E0DD1;
	Wed, 29 Jan 2025 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="M3pqxwOk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D88C18E75A;
	Wed, 29 Jan 2025 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738173122; cv=none; b=eGQ83upgkSUrUDCEC+cmZJBGwtv4IEzrkCPwDbP6qW7EbiSE750Ab8ZKoNi4oMz84cXx3Z91o9ZvIio+R0h1haKtzKxv4ATwcyCKopwZnM8EU5BXcUCy3q63kGVmiOwoUNFgsDBcG8ZS/XPYqEbOtJZ8MxZlAs8WNh+bBF6n6g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738173122; c=relaxed/simple;
	bh=F034U0F9Qebn9T+CgagQAO5PapIj94Zzv/Iz7/IHDIg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NKOlpUhyVA01FA3ECmqWeGepmVvb4s8wIz3l0nTn6CO0rhk3J1VDodyCP6dJQon3clGkJKHgh/rJmQh1sdWr6XKmfriAEBMgDhRLais9Rf4uO+ulQ8zZsJ3FTfQtqCsatP6UN/54jQzaufFlWDbLUTpjPKUVL48mfcydZeblNto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=M3pqxwOk; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738173118; bh=F034U0F9Qebn9T+CgagQAO5PapIj94Zzv/Iz7/IHDIg=;
	h=From:Subject:Date:To:Cc;
	b=M3pqxwOkcktu7YnNP2z8nCHJlZWrpuGXXg9c5+cA4QHS9sKGglnRXtJz5LqWZKMqV
	 F/yTvtWguqeJHvYuztoLBvuRzslHZ94EjV0WciWzkPAqie9t97bBxr9GlLDiBoBRZq
	 tAcoyB7qDGjumhkxbLlLfJdk2zzq1DP1mntFmoHY=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/2] Support single-PD in wcnss driver
Date: Wed, 29 Jan 2025 18:51:42 +0100
Message-Id: <20250129-wcnss-singlepd-v1-0-b01a6ba0b1bd@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK5qmmcC/x3MQQqAIBBA0avErBNMsrKrRIvQ0QbCwoEKxLsnL
 d/i/wyMiZBhbjIkvInpjBVd24DdtxhQkKsGJZWWnTLisZFZMMVw4OWENzhMuld6RAc1uhJ6ev/
 hspbyARg55qxgAAAA
X-Change-ID: 20250129-wcnss-singlepd-f9e6854257ed
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=740; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=F034U0F9Qebn9T+CgagQAO5PapIj94Zzv/Iz7/IHDIg=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmmqwG1zV5BsrzT266t57OFG2ifaSlE9T8MBJ1
 YGBjjOvOC+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5pqsAAKCRBy2EO4nU3X
 VgqZD/4i7tdDIFsnP4xU5NVP9FQkZNVKpFZSa28tLjk1x+3bnQCLj942EaWPNKKZQF39KPw125L
 4TlVQ7kEINdEIRfFKdsb5wBY879wYV9ze9DzWzvK+KY2QKraYvP2uyi4zLwX3nnrBwBwwyiiMg/
 7d5y4G60Iw2tPsWJcXLyPR/dJzzoU9GipNMO7E1P/ynTMuTHUhhWTOzt2s+K2d7hohMC2tV/lkH
 7B8jrJKJtvz4wViZXkgaDpMwSJN5P+HeRPzq4AGBZJ1T2VriwET5bN//iPRvB/TOkGIpaadFWDQ
 kosMC0HNF+tESMSizB04xp7IOJwJY9cHrZQLEPw1jaMWbAyHB6Bb7uHxXkoUIn+e2MXCGNB82WQ
 WxGxqPbt+ylPtLKPisUJug+b20SdLZNoTWUZSHw4ThcW2iArEpAjEtwGuJ4Giw+f17noEUp8EIq
 usyNs3/Cbf4Xw6eUfHOdp0jrpNCFuovU6ZIrnEmftAGd7pxCqARei8wqlWoa6VT8kGSP9XC8lme
 lHaufgNJnaLqI4Iq7Na4maKrkxrABOYW86PrrcwflrUd9TDf6ZRBv8Bc15Cp4tztBs0+baDVhRk
 2cB2P0S/lOvQKkmRtgEHOz0rZeKJrzfzrjpHlvEcjxpcKdeABzmbFGfBW8AgSP1lLNjl06uB/bb
 Sc8rA487D2mX/4A==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Both MSM8974 and MSM8226 only model CX as power domain, leaving MX & PX
as regulators. Add some patches to support this use case.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Matti Lehtimäki (2):
      dt-bindings: remoteproc: qcom,wcnss-pil: Add support for single power-domain platforms
      remoteproc: qcom_wcnss: Handle platforms with only single power domain

 .../bindings/remoteproc/qcom,wcnss-pil.yaml        |  2 ++
 drivers/remoteproc/qcom_wcnss.c                    | 32 +++++++++++++++++-----
 2 files changed, 27 insertions(+), 7 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20250129-wcnss-singlepd-f9e6854257ed

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


