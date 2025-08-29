Return-Path: <linux-arm-msm+bounces-71200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3EB3AFCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 02:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 546AB189D851
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 00:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD77E1DDC2C;
	Fri, 29 Aug 2025 00:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0t+9GC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BBD1D5CDE
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 00:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756427923; cv=none; b=byKJIcpZ9vTFD4yyi1Cx2eXlbPmfMus4/8NUDYygnO/pQc9wfc3SfzCg5pPpJEm9+Nt5mmc4nScfJdV4md2K2KSxmgQ/zLb16IOSDQfEK7edpYdcVIMUWZXFB/iHgzpWdEbvtwIDnhGjjaS8pha3EVnnJP8OcvrJFCBysshxu8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756427923; c=relaxed/simple;
	bh=qOHN+W3Wz6uTZsr/RwMmfVYf0YXCACp4YcP7f8Cqg6U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fzRkRarPunG5h0PfQ4iBPVcJ9Uf54YYGE201ipUbyU0IeEQ/EvphsT+rKzvJ/kboml/Bc86tEYfPrmHti7def2i3ZM47OkSEfrN/Z6GkcsubWv6nlk7ndJlV1trEIuHEephui2ODcEQCb0jEpg6aBsHLa+aprcWHiQnS757vuD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0t+9GC6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8rqunLN033sFAkyGdyaLYf8O7m070HCgXqjcGrGgaTc=;
	b=X0t+9GC6MoI0PLs/HRu/PxT+/AY4xABaaScSagmhPOusllB28RY8IWK3ypJwlUkOTOB1Qr
	714SLQy7zv6d2N28AkfP04ZtcKt1BtESlHrarkzmouELJWpPMfLtvLBr7PGUJE7b+EMZ/c
	wqFX+NeSFVSEoj8W3knQsb1FI6x1njw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-k27Yv7mHPX-2jfAg9Vi7_Q-1; Thu, 28 Aug 2025 20:38:37 -0400
X-MC-Unique: k27Yv7mHPX-2jfAg9Vi7_Q-1
X-Mimecast-MFC-AGG-ID: k27Yv7mHPX-2jfAg9Vi7_Q_1756427917
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b30d09da4fso5802421cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 17:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427917; x=1757032717;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rqunLN033sFAkyGdyaLYf8O7m070HCgXqjcGrGgaTc=;
        b=h1dB0jruCWmQNbnZXh8+M13wbPOzMZ5DyLVly8pglTzpbCbnd3ENUmw2j1rUXTKtxg
         fCCA9WWgmaAN6S50xhHcsbz6P5E+0JtNotb3aeeTZ+tQzfb7K8W2FUpXpSEcfM3LMN20
         KYiPIeKUW/Y2Wz1VGAvmmxBk6sfF0pVefSjfyJCvwPlFM0sjaiNnl+Bsfe137EJQ+9fT
         tMr74Eaf8NxoFK4IH1MbdfaxvFwTnIYzeq6zGiLidkAEBVd+8y9oPKmo+kRV2qmnA1vV
         qd7QhvVXNrnoCg8kUHdHWKjt76QpNWhuqGSokqSjfdDD2itdOQV2+5vfoOHgOkq4Gj0W
         iDOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+9iusfy4N4db1rpvsCgbeM5mGlbszoyAddd7/EnT7SoUZeipcWvahqefeMnarYv0NZIS9lGVdgY5oPCpW@vger.kernel.org
X-Gm-Message-State: AOJu0YwFp7PqBmrwi7MV2SdIhv/wzYFvVfoXivmo/T0q/b7veprrvgu6
	CzJa2dK1xfWsRRjhsEJHeHnmlLokFUZIU/n4XLhR5eQjX22+cfYOSPqgiy6VTwAcPU8Uk0sFSsF
	D3bGmlM+B+AFpe4CW8o2cC6u7b1RInu37HtUUPJsoo2BQmf5b4PqkPGkPyI4Okp5J4jY=
X-Gm-Gg: ASbGncuZ8N+Q4W3vu1BWJ6sYk4iy7U7rbZDCxSjnLUI9l5cQY3t1hCsV5LuWa/VfuqD
	SEqyfY0Y/oDWxFcxwueE2i29YyzTJfFHm9kiGRlvLjo1C3vZR0MLcadAucIRuoDRJu6gHCshSCq
	bRf+4gl2QiU+mLVY/2LGNa7sxgmd/7F5N5PYhVQr/8fgo3nZg+ry7jgP3JemiOhY2nsT2vbYiKz
	MTtAcknx8XawMjtSybqxA1fOxhGns9UyWkwWAGTY5tLnDqm+p5GR2riwIg6/BNOH46bcDZmFjqv
	DDbz3w6UOQ1UfI21zl0yJZmEH8tfOImfgI072GsSzZUT6EDPYo7lFtCbK0cQt7WLSVlanTf9dfQ
	VfK4tlv4vg/m5ckHgIXXw9ehtz3LVnA0Nrw==
X-Received: by 2002:ac8:5acb:0:b0:4b3:7ec:d22d with SMTP id d75a77b69052e-4b307ecd715mr29164771cf.20.1756427917012;
        Thu, 28 Aug 2025 17:38:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrNg2tdKhgAQRayLc8LgRw9eIVhmfPzttivKDw9wQ2+vibEJMjJFoedzMgEqufDrqQJ1tp1A==
X-Received: by 2002:ac8:5acb:0:b0:4b3:7ec:d22d with SMTP id d75a77b69052e-4b307ecd715mr29164561cf.20.1756427916486;
        Thu, 28 Aug 2025 17:38:36 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:35 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/8] clk: convert drivers from deprecated round_rate() to
 determine_rate()
Date: Thu, 28 Aug 2025 20:38:19 -0400
Message-Id: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHv2sGgC/x3MQQqAIBBA0avErBtIQdCuEi1KpxoKi7EkiO6et
 HyL/x9IJEwJ2uoBocyJ91ig6gr8MsSZkEMx6EabxmqLfltR9isGlOEkzBq9GpVVk3E2OCjdITT
 x/T+7/n0/tcMa8mMAAAA=
X-Change-ID: 20250828-clk-round-rate-v2-c1b181f598d9
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=2337;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=qOHN+W3Wz6uTZsr/RwMmfVYf0YXCACp4YcP7f8Cqg6U=;
 b=2DUui3a8WkDmdWMGxKa0tpZlU3l9oMHhpwiGjtyJgflCFJnuf9oCUJ5nnO47Aeh60KidBjjhF
 owMBgQLSuwVBuDusC8N4CQta4YOJg/XwS432e14Efcrlr58u+ubkwbg
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Here's a minor v2 to my larger 114 patch series at
https://lore.kernel.org/linux-clk/20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com/
that only includes 8 patches where a v2 was needed. To reduce the noise
in everyone's mailboxes I'm not including the other 106 patches that are
still valid. I will supply a 'b4 am --cherry-pick xxx' command on the
other cover letter to exclude the patches in this series.

This series has no dependencies and can be applied in any order.

Changes since v1:
- clk/rp1: Updated to avoid merge conflicts based on what's already in
  linux-next.
- clk/sophgo/sg2042-clkgen: Removed &*
- clk/sophgo/sg2042-pll: Updated comment from round to determine rate.
- Removed unnecessary space after cast on these drivers:
  - drivers/clk/nxp/clk-lpc32xx.c
  - drivers/clk/x86/clk-cgu.c
  - drivers/clk/zynqmp/divider.c
  - drivers/clk/qcom/clk-alpha-pll.c
  - drivers/clk/rockchip/clk-half-divider.c

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (8):
      clk: nxp: lpc32xx: convert from round_rate() to determine_rate()
      clk: qcom: alpha-pll: convert from round_rate() to determine_rate()
      clk: rockchip: half-divider: convert from round_rate() to determine_rate()
      clk: rp1: convert from round_rate() to determine_rate()
      clk: sophgo: sg2042-clkgen: convert from round_rate() to determine_rate()
      clk: sophgo: sg2042-pll: remove round_rate() in favor of determine_rate()
      clk: x86: cgu: convert from round_rate() to determine_rate()
      clk: zynqmp: divider: convert from round_rate() to determine_rate()

 drivers/clk/clk-rp1.c                   |  58 ++++++++------
 drivers/clk/nxp/clk-lpc32xx.c           |  59 ++++++++------
 drivers/clk/qcom/clk-alpha-pll.c        | 136 ++++++++++++++++++--------------
 drivers/clk/rockchip/clk-half-divider.c |  12 +--
 drivers/clk/sophgo/clk-sg2042-clkgen.c  |  17 ++--
 drivers/clk/sophgo/clk-sg2042-pll.c     |  26 +++---
 drivers/clk/x86/clk-cgu.c               |  35 ++++----
 drivers/clk/zynqmp/divider.c            |  23 +++---
 8 files changed, 201 insertions(+), 165 deletions(-)
---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20250828-clk-round-rate-v2-c1b181f598d9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


