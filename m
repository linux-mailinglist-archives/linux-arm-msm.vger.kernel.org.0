Return-Path: <linux-arm-msm+bounces-89397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8EED31AB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 14:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 14DD830116C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06A72550A4;
	Fri, 16 Jan 2026 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bXxtbdvj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0680227E82
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569447; cv=none; b=jAUQPFZ3XFSzMTYo5o8X2s2V3Ru38n2w8SUOadDw38mMnMBJjDEnTZHmoHMkKu/1rxGnFGdpBqSflsw5qwqdRgVbZsSkXKcfY3FGu4jjyObZp483atPBvo9laEoSn77h29oSqcHUMHjbYlkmto8xZEjgfkD1N+LkmujqiDCJysY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569447; c=relaxed/simple;
	bh=0IcwqQH5YyvspgnfvtfN3G6ejhtG8SMMlKk+P1Z9ZNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H3vvwkY+fC5deRPlZhPdLRx2mDuTxgegUQUXxLs47brRPzQSbUj7llzdJnklAvh6YQTQH3BbkymnrLYxMPnYgZoHiOmc7ziN+6e0+3nwkpYe2SLpP0kjLpGme4y999OoaWM3qhIK705SuapIjexvd7jXszP50Jawu+mg4tyw6Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bXxtbdvj; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so3070899a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 05:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569444; x=1769174244; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LeO3PxpMi+3RzgWBsyhtH2vzdSGJNBJ2My5HKc/4nPs=;
        b=bXxtbdvjNWxN8CPYrzUOVoTVIk8UCAj4YMnI73pV+i3SUZNY0BkEBaOvxKjvOisM19
         z4GLiV/jFAmjXHmKVkjtZbkhRx5XPaZE7OsgLwvsK3/7/Zt3AV5KGfQUb/jS+uXX/sl6
         +TdgE8dOKuZC/0zxlgqXHl2pFOID1kEFo897MHioVKQAKETgAJm5aV6rpiiZzmy1SyIy
         SQ3KMho/ferVejQqTJx3uo8ft+IUfmYP+pe8XQdjsgezHrNPIyv8298abTsBr0mH5VzJ
         kfhr3gsp+Wu3qS7WMaoHa6kHNc8N5IynhFA6dP5n+GRjNjkQHP999M0FBfH1TspCeHJ1
         wyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569444; x=1769174244;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeO3PxpMi+3RzgWBsyhtH2vzdSGJNBJ2My5HKc/4nPs=;
        b=eyBZ2HvSvMg1VU4J559PA1GbR3FpvcSonktEWwXy5TjnUmTgMsBjuuRACGhgYyBARU
         J/R9+DtZB4eJ39TakV3G0SzmSBikPbJ8UPZ3yR90V/wrOCJlRGm/jMcc5m6WBTriUrC5
         a0UlpZHI14xLZTzZC2PcEPViral9/C1J6Gaz4KxTjfqsEEeyXy0e75dRR2gSX63saXqY
         5++GGOYltliHozh+CxO87EtCYyZJ9j7PkepkHfbaYSqQq96q8TU2YkUxaUQEPtM1QQkL
         k37CYBaDZuKJgLJk+Zlkj1wnHwnmMHlqJ8vN08jIup1mBkT8OsEZzZH/SeyEyystLio3
         zAtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1ukBtjfcAa11ZZURErDmmJWMRdUaSs+wPqsGV00zmckfsTNhKBdOHPHwSif/VBiVj0/rcRJ7ogQ4bSUqR@vger.kernel.org
X-Gm-Message-State: AOJu0YwnhMSX5GC2yte87EsU4P8gfEKf97acT87d3NP/ubPhCHGlGqOX
	jyJpTCMAAJaejikkbr4XEvT9j6Lpb+gFUSiskZBULNIexCIMDUsfdSNjd1HfT0iDoco3vC2nfgr
	gGlVy
X-Gm-Gg: AY/fxX7hxy0oXvwfqyOu/h/JEH03FA7vZ90CBjIHSV4oT4P55wFA3UdqUjYEokNuIzj
	nSzMdpoS81wjYNpOKsTOmDoOVRrii6hJJqUDjW3oXWj92MUN9+nepZl5efCqci1ArkEwFohmUVI
	tRktnUkZGG9uDnlly1ctIjD3fYKckJ1HxycU2GYutUt3HnVu1m5dsQSxjN0jrWJMDFQxKzR7t87
	c/F7kFsDzZKssoPeCuPgnLy6wWsOwmWHrd5Y7wb4VrEPbl+dYk7mCgXE4l6H2qEN0KwpCLSRXuw
	qJ1yxVUEfv5gPf+VU1PGowF/OgFaRoXReXHweWjK2Ey2uwNjb5t+hLTCiTpjRhqtiCYt8151Vzn
	va6RG6eYZVsZjwHEsucMe04nIrZeb0Sx/aGoldXyyGIOXq2+aS9/bgx4NBbrn8pLlBDNyv2mNC4
	HV2iqtFUDfxeHRo9dF8BxUpGUyOsa5A3SC+oIk30vrirAVvVvezSg7NJV2tsyrEHvm
X-Received: by 2002:a17:907:7201:b0:b87:281b:1453 with SMTP id a640c23a62f3a-b879324d5bbmr279364666b.59.1768569444136;
        Fri, 16 Jan 2026 05:17:24 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/5] Support enabling interconnect path for GDSC for fixing
 Milos camcc
Date: Fri, 16 Jan 2026 14:17:19 +0100
Message-Id: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MuwqAMAwAf0UyGzAqRfwVcdA20YAvGhCh+O8Wh
 xtuuEtgHJUN+iJB5FtNzyMLlQX4dToWRg3Zoa5qVxE53HU7Df20e4+aCS3NQaQhlg5ydUUWff7
 jML7vB5s+w8FhAAAA
X-Change-ID: 20260116-milos-camcc-icc-d41bdff31ef8
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=1538;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=0IcwqQH5YyvspgnfvtfN3G6ejhtG8SMMlKk+P1Z9ZNY=;
 b=BF0Kn3KVXUmmI5VyWZ3MMLd9Dx/ED72uHOpJt+C3M/p0HmU+c2cc0GJqaqF2EZhm29Kh8nBAS
 h+npu+bFF5wAFmKECrIX1NdAbRXBeh55KJ0NEtbwkro+ohqY4bJsVIm
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Some power domains like CAMSS_TOP_GDSC requires the enablement of the
multimedia NoC on newer SoCs like Milos.

Add support for getting an interconnect path as specified in the SoC
clock driver, and enabling/disabling that interconnect path when the
GDSC is being enabled/disabled.

Then specify that dependency in the camcc-milos driver and add it to the
dt-bindings and milos.dtsi.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (5):
      interconnect: Add devm_of_icc_get_by_index() as exported API for users
      dt-bindings: clock: qcom,milos-camcc: Document interconnect path
      clk: qcom: gdsc: Support enabling interconnect path for power domain
      clk: qcom: camcc-milos: Declare icc path dependency for CAMSS_TOP_GDSC
      arm64: dts: qcom: milos: Add interconnects to camcc

 .../devicetree/bindings/clock/qcom,milos-camcc.yaml  |  8 ++++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                  |  3 +++
 drivers/clk/qcom/camcc-milos.c                       |  7 +++++++
 drivers/clk/qcom/gdsc.c                              | 19 +++++++++++++++++++
 drivers/clk/qcom/gdsc.h                              |  5 +++++
 drivers/interconnect/core.c                          | 20 ++++++++++++++++++++
 include/linux/interconnect.h                         |  6 ++++++
 7 files changed, 68 insertions(+)
---
base-commit: 48746fac3857845ce7ed4aeb56df58735208ffda
change-id: 20260116-milos-camcc-icc-d41bdff31ef8

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


