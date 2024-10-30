Return-Path: <linux-arm-msm+bounces-36484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2966C9B6C61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 19:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6024B217DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 18:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727DF1CEACB;
	Wed, 30 Oct 2024 18:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTwmmIz6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302A31C460A;
	Wed, 30 Oct 2024 18:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730314668; cv=none; b=iZInKqB28DV4c+Gv8sh56L/ojIrUiziDoX4Pcne08t/DY53+gpDlZWttjqVjXwRDxj+ukvRO88Dv2IS0b4qMqdRALjzvsoaN1p9FnpNNBS237MXau59Yp3EeomfR0HynKAh5KNjvGrAqTuIMYZsWjRQHxO02QMrlgr/mJJmuUYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730314668; c=relaxed/simple;
	bh=w0ajx2Sh8d0sC0yvdzkk0j4Y6uzxVCNrmMwL3+B5CQY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KqLr3BEAbVCqZhOtgsKOTe45eIz6ix4z5A8yw5NrXVjdwMUtEDt7y0kafdyVzLX3wplIKCXIf2qFjsIjlsJJhgW0qCmUg7xSgOdyOgYxN4y6btfvfaIjL4NXVZXIXelYmkrxnRaqIBe07XWrlLiic6z1Wb+y2I5uqJr8Jjkbvw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTwmmIz6; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so788511fa.1;
        Wed, 30 Oct 2024 11:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730314664; x=1730919464; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QC6v63zN/LS8xn8Q6J/qgxLNxqB0A6W28tutvITfh9I=;
        b=PTwmmIz6pGIlawV5BIiq1t2pThR42eO/dYNtYLKNAeu779LzH8VlhmjC6CVhNLfdKs
         3b/ezQEBVWUvEOVqY7SChMDDEECxbbDfmor520RVstgPGZB8TBMXL7xXVFt1rpbP2bsc
         BvP6mmd2s2LIjawnR038ey8iQM+LM0hrcQimNnu3ObhjRWp88qlOU6HX88NPHseIXqGf
         fWwEIoHb26W9o2VXFi5//yFmvpByks6Uer4XMrwJh+MsNJpjETwp6tpUt0L7ebeY5f+b
         oaVUVkhNKTV6Qb9WtbYIwVhy4+Vcy1Ja3x6BHmfeWRX9ODto+xxkJVj+t6iKJqQl0NZD
         p6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730314664; x=1730919464;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QC6v63zN/LS8xn8Q6J/qgxLNxqB0A6W28tutvITfh9I=;
        b=X9GcsS7coCHHuCN1+Ex9x0DZsvcxCC6jFlNXid5r7Tc/XM2kcTU+BUEkitR6Oi8L8f
         mpC7MubL95N6Ff2rk3sOT8MjWmWd+QKYbO6n9Mghx9kGMdXz4yqvR7G3gW0kK7NL3H1/
         M/c8KnNa8vi9eAaewXKrCgOjPNnJHrPj8eNl7Tt4C+yVv640cIOeHUFM+blpDRMSRvJB
         2FIKGna1ixMIednmHQBpKgDjRQ27yU6qdu0C4TiOQhA6T/nwP904oxBDYJ6srEhsBGZ2
         7TU+U+6icqgRRsVD399Nb4Tc0rxGwEDENzT/8qFG22fqLNpqHP00f0d/QyCmzNruDl5W
         qEHg==
X-Forwarded-Encrypted: i=1; AJvYcCUoGYZ0G3l57OK2tM0Aro8hxmcYwH6lKfoW/pMGOfYDIrhrPPmfiOUICg3LxHNUULSsDU97UtxhBPYfZmaQ@vger.kernel.org, AJvYcCV3FmdJKVMUJxdy6oOcihDNbPpVd0yc5NWRfCEg0+SWBpVNqwRQVrodXnU04hRL88Pe4z+KiDpWylE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Jm+N0FlSNfzvpOkcZuLF1wFbIgJOeSDQ5IRsf4HMn/aDhdxi
	aGcs4K6wNpTN3eXsAGovflfvQGIc0PPTojY41f/cJ3GyXvysMGua9YwlfQ==
X-Google-Smtp-Source: AGHT+IHCG+mhuZFXAkssvYttYw+C2ak18SRCZRDBsu4cqwbK81lSNtbLdRL+iQIxNFxOXi3TCo57lQ==
X-Received: by 2002:a05:651c:1a0a:b0:2fc:a347:6d87 with SMTP id 38308e7fff4ca-2fcbdf7db3dmr75162601fa.13.1730314663536;
        Wed, 30 Oct 2024 11:57:43 -0700 (PDT)
Received: from [127.0.1.1] (leased-line-46-53-189-50.telecom.by. [46.53.189.50])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62c20dasm4970447a12.46.2024.10.30.11.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 11:57:42 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v8 0/3] Add divisor computation feature for sdm845 gp
 clocks
Date: Wed, 30 Oct 2024 21:57:36 +0300
Message-Id: <20241030-starqltechn_integration_upstream-v8-0-40f8d5e47062@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKCBImcC/43QTW6DMBAF4KtEXteVMfiHrnqPKoqMPYAlMKnto
 FQRd+8QqS1iU5ZvZH/zNA+SIHpI5O30IBFmn/wUMOiXE7G9CR1Q7zATznjFZKFoyiZ+DhlsHy4
 +ZOiiyfjncrumHMGMtLFaasEa3kJJkGlMAtpEE2yPULgNAw6vEVp/f+79OGPufcpT/HrWmMt1+
 rNR/79xLimjULZSSs4KZex7Nxo/vNppJCs+V39gXZQHwApB7ji0TlihldqDYtvwwE1mgaDCp7U
 AI5iu9qD8BQvGjoASQeeUsExaxbTbg2oD8uoAqNaGGkzLC7AA9RZcluUb5xSIvCkCAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730314661; l=2883;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=w0ajx2Sh8d0sC0yvdzkk0j4Y6uzxVCNrmMwL3+B5CQY=;
 b=L9uETTYMA+obpYQMYdMCIcrO2A5ocERtsPoPoPgvsp4oWUe4fJli7OnAj73MlMHPjXaPJ8joY
 OG3SP3j0+E8BKBO60PerWqO5IEPHgn+xiHxKVfd6fTl5hL/SSdwpv2E
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

SDM845 has "General Purpose" clocks that can be muxed to
SoC pins to clock various external devices.
Those clocks may be used as e.g. PWM sources for external peripherals.
    
GPCLK can in theory have arbitrary value depending on the use case, so
the concept of frequency tables, used in rcg2 clock driver, is not
efficient, because it allows only defined frequencies.
    
Introduce clk_rcg2_gp_ops, which automatically calculate clock
mnd values for arbitrary clock rate. The calculation done as follows:
- upon determine rate request, we calculate m/n/pre_div as follows:
  - find parent(from our client's assigned-clock-parent) rate
  - find scaled rates by dividing rates on its greatest common divisor
  - assign requested scaled rate to m
  - factorize scaled parent rate, put multipliers to n till max value
    (determined by mnd_width)
- validate calculated values with *_width:
  - if doesn't fit, delete divisor and multiplier by 2 until fit
- return determined rate
    
Limitations:
- The driver doesn't select a parent clock (it may be selected by client
  in device tree with assigned-clocks, assigned-clock-parents properties)

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v8:
- format kernel-doc
- test with scripts/kernel-doc
- Link to v7: https://lore.kernel.org/r/20241024-starqltechn_integration_upstream-v7-0-78eaf21ecee9@gmail.com

Changes in v7:
- split gp and non gp changes
- Link to v6: https://lore.kernel.org/r/20241007-starqltechn_integration_upstream-v6-0-dd75c06c708d@gmail.com

Changes in v6:
- fix kernel robot issues
- run sparse and smatch
- Link to v5: https://lore.kernel.org/r/20240617-starqltechn_integration_upstream-v5-0-761795ea5084@gmail.com

Changes in v5:
- Split patchset per subsystem
- Link to v4: https://lore.kernel.org/r/20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com

Changes in v4:
- Replace gcc-845 freq_tbl frequencies patch with new approach,
  based on automatic m/n/pre_div value generation
- Link to v3: https://lore.kernel.org/r/20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com

---
Dzmitry Sankouski (3):
      clk: qcom: clk-rcg2: document calc_rate function
      clk: qcom: clk-rcg2: split __clk_rcg2_configure function
      gcc-sdm845: Add general purpose clock ops

 drivers/clk/qcom/clk-rcg.h    |   1 +
 drivers/clk/qcom/clk-rcg2.c   | 198 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 drivers/clk/qcom/gcc-sdm845.c |  11 +++------
 3 files changed, 193 insertions(+), 17 deletions(-)
---
base-commit: 86e3904dcdc7e70e3257fc1de294a1b75f3d8d04
change-id: 20240617-starqltechn_integration_upstream-bc86850b2fe3

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


