Return-Path: <linux-arm-msm+bounces-39228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B715E9D9FC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 00:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0AE2B2244C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 23:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313361DFE3D;
	Tue, 26 Nov 2024 23:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oCUdUsoi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433CD1DFE11
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 23:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732664676; cv=none; b=hktdUfPR2oGdqDoSpeEBHZsC50FiTJ20d/2cwDb1N7t/Cm4k8LYzorZqmu28wbPBAGKBNaDWVnO3KPn71V9osWwgIT2H6pmM0cHyI0Pt79LQVOi0+OLChAiV6g3JlCmFytsqQKquhHtLirJWBPoB816PHqPlxt3ZzZ5V+p/RHGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732664676; c=relaxed/simple;
	bh=+fhFM24qdTFklU9m2XwiT7YHYQrJaiSziSmW70rJDQQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kTcwlgU8fS3pu85/2gQhi59rbtF1Zm65WX3LKnE6yDcudLPvxy0v+fSWEe81ZUbnRImRwpfQ9a0vpPBiBvmYbd9I8T5uKe3uWtiKuVQX3WwOGKVd2hza3QAu3rZrtngT0oImYPMnfwrzXg61B8ihL6XF08XaMBd4W7kXDT/RFJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oCUdUsoi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a752140eso9643795e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 15:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732664671; x=1733269471; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CJmU59J+M2fvIhoTK/DsvENc1HKmlM36AHXQwtD2KaU=;
        b=oCUdUsoiFAyrnEu0aLgsolTfbOYpbUFi5xIt9YgPd8pRMrg/3XvGJ5Qg4CacbQg+w5
         iWugoTZqjVukKvzJTPnZEbxIzTloML3Cd9zgOT4XF3CBo2LvgRunwCp7k/9D5NmHIBW6
         42zKM0ZbUVFvFu35zyJgGxuNdpd/tpRIyOvWsiwnOxKKilUZh5P/C9C3TGovykzUdFQg
         m6TzK8aUNMiZ825IKMmotSdmiaGig76ctw5AIINf77ybxqXKsxvP0DMdlqSnnMNvzQ8e
         Hi9x0YHn+knMFQou2YVx3PTL5yUPi6cFDYsP/p+qOkhmanrQ+Bz+O6LJ2XmGvGnQuqqb
         ratQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732664671; x=1733269471;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJmU59J+M2fvIhoTK/DsvENc1HKmlM36AHXQwtD2KaU=;
        b=TwCSZ/9MQ5VTBeqhvJukn+an1XkcYzBchYRpGOz4pNSs+nWDHl/0flNxdJ2puWYEim
         w8EypJbFrsz8ZCmAwI76HjJgtKHPLt7bOCPplk9a9fhdPP+RYCs/4YTtlgcjTQNh17pa
         SPIY5T4BqxhqMi7RI9E3trZ8L0Wkx3RpTZ2p2cAobmM1poXIjn2YX3o2O3X5s2MHoDF5
         dac/Gow1tyxKyhRMUBqE5DKme0gI9RT//Fl1ZpphepdGWrl9JXRRiy6CNGrdcTLA3by2
         YPMM2QVpLXQ00FZ6NxKLuXMhUBllDzRWWDQTd1MqzjGDDUlN82nS8fFwCQmRy3+tw251
         +Mrw==
X-Gm-Message-State: AOJu0YxbD4jhjr0pmCXndmMgvnOYCqc0NZW1aKOLehRkhD7cNuIBvchh
	3W8ivh5YmLZTfXAAx70YXJ47cUsg/TOkpqEm4HgfJ3STqfkdWCH/q/SPd8c2aYhgrclAMXfOHO8
	ODA4=
X-Gm-Gg: ASbGnctrxwLYbz+91yBeyYMkKdG95Q+nFJnadsQ1arbNlbD0zUWYnF+2vxXWpZWwKtR
	2xUSC6VgjyPTS9fYObV8kjE8EqvVmBH0fYr31dRKdnvy7vZPcvwctUR1S+s8HNADuc2MIt4g2gB
	Mrdl3fBrC9+Ehs771j5Xzm+gf5tVD1ICU5dcmCLvuDCPq29hg2g696zP2hDTu6x5YvHoaG96uoD
	Fdpc6nQPzWlSvkX/REuz5oyTGwAH/jj0V/kxtjuf7EaJYHwI6YMPFNE7O8=
X-Google-Smtp-Source: AGHT+IE8eKTrNeWUzbOE7vIWSLENBWD9fjmEpqowThwTsPT8/dFfLlB5O1ysxqfYmXhLujNL/goltg==
X-Received: by 2002:a05:600c:5253:b0:434:9da3:602b with SMTP id 5b1f17b1804b1-434a9dbc410mr8471415e9.5.1732664671287;
        Tue, 26 Nov 2024 15:44:31 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe338sm14482899f8f.33.2024.11.26.15.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 15:44:30 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 0/3] clk: qcom: Add support for multiple power-domains
 for a clock controller.
Date: Tue, 26 Nov 2024 23:44:26 +0000
Message-Id: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFpdRmcC/6XOwQ6CMBAE0F8hPbvGrm0AT/6H8VDoKhuxJS0gx
 vDvFk561ePMYd68RKTAFMUhe4lAI0f2LoX9JhN1Y9yVgG3KAneopJQFVApadsMEjqYeUIGUkOq
 69fUN7kPbc9cSdP5BAay/G3YRjL6UpbK10mhEWu4CXXha1dM55YZj78NzPTHKpf3PGyXsoMoNV
 rbAyuzzY5owwW99uIoFHPEDQf0bggkxmnKtlc1J6S9knuc33akzplwBAAA=
X-Change-ID: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-355e8

v3:
- Fixes commit log "per which" - Bryan 
- Link to v2: https://lore.kernel.org/r/20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-0-a5e7554d7e45@linaro.org

v2:
The main change in this version is Bjorn's pointing out that pm_runtime_*
inside of the gdsc_enable/gdsc_disable path would be recursive and cause a
lockdep splat. Dmitry alluded to this too.

Bjorn pointed to stuff being done lower in the gdsc_register() routine that
might be a starting point.

I iterated around that idea and came up with patch #3. When a gdsc has no
parent and the pd_list is non-NULL then attach that orphan GDSC to the
clock controller power-domain list.

Existing subdomain code in gdsc_register() will connect the parent GDSCs in
the clock-controller to the clock-controller subdomain, the new code here
does that same job for a list of power-domains the clock controller depends
on.

To Dmitry's point about MMCX and MCX dependencies for the registers inside
of the clock controller, I have switched off all references in a test dtsi
and confirmed that accessing the clock-controller regs themselves isn't
required.

On the second point I also verified my test branch with lockdep on which
was a concern with the pm_domain version of this solution but I wanted to
cover it anyway with the new approach for completeness sake.

Here's the item-by-item list of changes:

- Adds a patch to capture pm_genpd_add_subdomain() result code - Bryan
- Changes changelog of second patch to remove singleton and generally
  to make the commit log easier to understand - Bjorn
- Uses demv_pm_domain_attach_list - Vlad
- Changes error check to if (ret < 0 && ret != -EEXIST) - Vlad
- Retains passing &pd_data instead of NULL - because NULL doesn't do
  the same thing - Bryan/Vlad
- Retains standalone function qcom_cc_pds_attach() because the pd_data
  enumeration looks neater in a standalone function - Bryan/Vlad
- Drops pm_runtime in favour of gdsc_add_subdomain_list() for each
  power-domain in the pd_list.
  The pd_list will be whatever is pointed to by power-domains = <>
  in the dtsi - Bjorn
- Link to v1: https://lore.kernel.org/r/20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org

v1:
On x1e80100 and it's SKUs the Camera Clock Controller - CAMCC has
multiple power-domains which power it. Usually with a single power-domain
the core platform code will automatically switch on the singleton
power-domain for you. If you have multiple power-domains for a device, in
this case the clock controller, you need to switch those power-domains
on/off yourself.

The clock controllers can also contain Global Distributed
Switch Controllers - GDSCs which themselves can be referenced from dtsi
nodes ultimately triggering a gdsc_en() in drivers/clk/qcom/gdsc.c.

As an example:

cci0: cci@ac4a000 {
	power-domains = <&camcc TITAN_TOP_GDSC>;
};

This series adds the support to attach a power-domain list to the
clock-controllers and the GDSCs those controllers provide so that in the
case of the above example gdsc_toggle_logic() will trigger the power-domain
list with pm_runtime_resume_and_get() and pm_runtime_put_sync()
respectively.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (3):
      clk: qcom: gdsc: Capture pm_genpd_add_subdomain result code
      clk: qcom: common: Add support for power-domain attachment
      driver: clk: qcom: Support attaching subdomain list to multiple parents

 drivers/clk/qcom/common.c | 21 +++++++++++++++++++++
 drivers/clk/qcom/gdsc.c   | 41 +++++++++++++++++++++++++++++++++++++++--
 drivers/clk/qcom/gdsc.h   |  1 +
 3 files changed, 61 insertions(+), 2 deletions(-)
---
base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
change-id: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


