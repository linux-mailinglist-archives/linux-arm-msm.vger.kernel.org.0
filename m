Return-Path: <linux-arm-msm+bounces-23294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 817E990F828
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 23:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E70F5281BB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9A115CD4B;
	Wed, 19 Jun 2024 21:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="tmNyGCWU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588C778C71;
	Wed, 19 Jun 2024 21:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718830990; cv=none; b=pkNSXqSApwVe3ELDS9tU5dKqUwpXKz0ygsCi+cvNhoVRotAm7k5+w5zLyxZ/cT6bslrQNaBaLWn+Atbyfk1agersBxRChoMzHiqso2Wb97LQfxhUaNd+ZA3KI+3SSmoRSeDqt+m3p1C9e130TPTtq3POY6GDnWM2PvKqWvJWZb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718830990; c=relaxed/simple;
	bh=4WOS+AvxaEa+0SC1/3K+gcJiiNNwidC9fY7Pa0VsfD4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HlfVPY5i8xqroYPcvapoMav/bVP/NWiNKpr4d8aLSlPQW9FySmmHGAojkN/j6LmJC6ZzosAIVw6ncjc31uwrQZ+mFENWn53wwSnEFW2ferKFG+zt+YLW1WefnM444l79RYOGOTYfLseLjfXe32CBf9l4HXvDGrC7Nkzp3fVvoAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=tmNyGCWU; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1718830985; bh=4WOS+AvxaEa+0SC1/3K+gcJiiNNwidC9fY7Pa0VsfD4=;
	h=From:Subject:Date:To:Cc;
	b=tmNyGCWUSi/Ht87O3WeKShW3PE4S+TSiz5EBYgYHSWOU536izOOpI6lwZx/HYCezI
	 5N+/LmMAuGWOVeGns3nLhqSzr1QV5vSoLJLtdtEbMk+9ypAqXN+Zj2oRLZOcq+qhJ7
	 v6bhOfg6yQIIWpmMp1lv/FCpyjVhgmhl4B4pJd6U=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH 0/7] Add CPU frequency scaling support for MSM8226
Date: Wed, 19 Jun 2024 23:02:44 +0200
Message-Id: <20240619-msm8226-cpufreq-v1-0-85143f5291d1@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHRHc2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0NL3dziXAsjIzPd5ILStKLUQl1zC4skg6Q0AyNTs0QloK6CotS0zAq
 widGxtbUA/htYi2EAAAA=
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=4WOS+AvxaEa+0SC1/3K+gcJiiNNwidC9fY7Pa0VsfD4=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmc0d2S5Un48OGVLTnxHEVLWjPEi8tuzfTqVhk3
 F5BniAFEdmJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZnNHdgAKCRBy2EO4nU3X
 VkirD/wK2zGzeK5HkWUxhlhEViNepbpmeZXNM0yaAWRh5qp5J1VsPF7qt/YG8UYLLn1n2i9r76l
 YxZfKbbp7w0J1CglJVeb6D5KgCZz2Lco60TXgqT20xGjQ9Q8DVFM1cvgg4cLLLgiyyeiYQOtHKD
 oxGtXPBU1F3x3JfCplEHqJvqmZsBMGPu+9Dzr2sFkx4BAgHUBQe2JDAdlQqc3yiImbkwoYiPjvT
 4c9URAAuSx2vTKVbBoWaZ2dUYKcgJwhYZUdF3yTSUji2JZSh7D8Oi/Fx9h5DoDMrvBgZp8/DaQS
 0GKrgGGevHiSj5h42ZpZMDKIbo9zyCMBY4XMWAuOFIOuuptK8ZORlLQsqiK9QdCWBogVOuKiqI9
 zzboC180royI8zhoc+EFDf3jWFnf9n8KLFRLQ5Vu/NU3C4VPYMJ0CQm6togK8WI5waH/hIdmulF
 0jcCUaHTP48MRrsIHepg2fD4i1MxQYr8RlzqY8Em4TlUdVIJhAfLdft3jCA7CRFe53VS7zsUb4/
 +0LD0NZejeJojuJiZ6XrY42sZT3yb5O/XgzVdYB7X8QMnDMvjRast0K0A0FWOwc8D+bpzwnZFki
 WDGdv4AuFWFKyHFV35G7YtMoW8aMyOlmCToorA440YYZ7ueniV1YK+lYN2bI2h7MRWXySziaq+A
 MZoGxVrSrbnviLA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Apart from a bunch of bindings updates, add support for the a7pll found
on the SoC and wire up everything in the dtsi. And finally switch over
to using apcs via mbox interface to stop using the apcs via syscon.

Only a limited list of CPU frequencies are supported for now, higher
ones require speedbin support which I plan to work on after this lands.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Luca Weiss (7):
      dt-bindings: mailbox: qcom: add compatible for MSM8226 SoC
      dt-bindings: clock: qcom,a53pll: Allow opp-table subnode
      dt-bindings: clock: qcom,a53pll: Add msm8226-a7pll compatible
      clk: qcom: a53-pll: Add MSM8226 a7pll support
      ARM: dts: qcom: msm8226: Add CPU frequency scaling support
      ARM: dts: qcom: msm8226: Hook up CPU cooling
      ARM: dts: qcom: msm8226: Convert APCS usages to mbox interface

 .../devicetree/bindings/clock/qcom,a53pll.yaml     |   4 +
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |   1 +
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 134 ++++++++++++++++++++-
 drivers/clk/qcom/a53-pll.c                         |   1 +
 4 files changed, 134 insertions(+), 6 deletions(-)
---
base-commit: 0efa3123a1658dbafdace0bfcdcc4f34eebc7f9f
change-id: 20240619-msm8226-cpufreq-788b0bf0256a

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


