Return-Path: <linux-arm-msm+bounces-45401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 074C5A150F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 14:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C69D3A974F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 13:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81D61FFC5D;
	Fri, 17 Jan 2025 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hewSYLQb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA48C1FF618
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737122052; cv=none; b=ovfaXrWmMPnnBS5C6MyWwFQPIGQ5iZp7mV9JyqAjZy3gZANvSOZAJ3HXDZ/+IVN67litnOduF5SPdp/qk/GfS/llPTbxpuCzXTN98Ni3PsA5Pno2cz9XF0kcSS8V88Xp72vkQ4ubI95shxvjQL6N8ErTD2ownIc2kYsr11VAFTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737122052; c=relaxed/simple;
	bh=A9aAMGGnsTEhFX1U+oiiKa/uAspmjBna60FbJ48QEPE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RgR2APouuy9Brq1Oq4fPXFRsbDM5arT9c/ft4tSGBV4NXToSkpSbLMtR9s3Np+32IFBjC5wv5jyP2XJzM/qgsPczSKqYR9DrszaCzu3YUDOlFAqaiaBS/g3RjW6dDqli3UcL9RhB7nW/mtN6cLnWqTHPurBlEMMuWW5tE1Q4ks4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hewSYLQb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43635796b48so13570985e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 05:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737122049; x=1737726849; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G8dm039u0h/bE0Lku8VlFtIRyKFOkFgqiMCpqXYzbhk=;
        b=hewSYLQbrZF282ncJCotaMM8z4V9AVqjVTVRs0P7oH509Gr+eyVtvztXz9c85p0YtR
         X9k8F9sDtxGu6g8C1WV78dIlJjnY/BHIjetydXyroVYw9asjM725a4sq4Fv6R0ep0eJU
         K4COPk+pBHoOmqhYIM3XQ2KUulBXU+U5Z/XLXBKQnYqkTtUY8w7aHFy/w0RD9UB5oPw/
         d5lmq2yMR6oDGt2b8uWpl+p/FomycmeZI4xiVpGfftC+QnKl600qfnLQXOZZVVCzL9LC
         snFvGdYEuWCJaPENUKF6jMHzcdg3IDb9PXACQqSZCdSz/KnFUiGYsHcn6XeRLrZHyEPZ
         eDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737122049; x=1737726849;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8dm039u0h/bE0Lku8VlFtIRyKFOkFgqiMCpqXYzbhk=;
        b=MprDjvuTRr6CMi/3RfVNl+Uyq0t9pJKm/E+t5aP5yCixddRDpGB4Gzwg7EUIu7dkgx
         GEN0GlO0MGmxTkS+YDp+kdH9GNxodn3gg6jJxvU0kFkLxfv7spo5SoOvKvWlkr9Ec49M
         19PQBPl8SbBKa5HsG2F1yxfd0esMUaRoEJIpO0uM62r/IZtptA5rHeMFgXoFu1RHYunO
         OPV5HCYF3+P1xi1Zh2uHv9COLvUt11tLgn6GWKnLPxHDGU+PnCCaSNTWjRjVtgPswfRG
         1TiATBvJuaFHt5rEQDBoO6ZHhHpQDmSrEitacC+d1VonYBQbUqAY0TattnL3rckTyBSX
         vfCg==
X-Gm-Message-State: AOJu0YzTp6ZEVAEZsS9JUTKrhlXOlK53eW/ZKKuRazYz/iqiVQt2F5oS
	GZ/qCm17ROWfpUGlXWckvNnyJlHIitDkVKuQw+CL5wtkiQ7Uo4iyTerc4ON/dBE=
X-Gm-Gg: ASbGnctsL5OPZECvrEfUYMixabaBMs8nX247kEeZ3ufVRt2X9MujEHjc+aNnmFJ1B63
	JibzIuP+9KUW4t/WStijgLF1rFCZAa3FKxpLVNVuf7G5ax4kJPp3eM4FzPD+g9Ku/svE+RVJcG8
	B7af+DPTOQ2ah9BdYxkvaN6BR1MhBBP2yyfQsp4/yefpPlLUSTht/HDPUpm+/Jabtd+MLpfUoVx
	BRpYRVTuiguPDuKlpEUh7JRn1sXotUtBpxpQSVxU6Vfw2zm1g0muvtW5bqmn6bXwg==
X-Google-Smtp-Source: AGHT+IGIKvWGLgyUIWVx/VXmZV84JzoLHCX1quTsEBQ4TrIU9xwoJZlGH1jpLDRZRCWPwilY6CwVFw==
X-Received: by 2002:a7b:cc06:0:b0:437:c453:ff19 with SMTP id 5b1f17b1804b1-437c6b4707cmr100788035e9.14.1737122049058;
        Fri, 17 Jan 2025 05:54:09 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221bf0sm2545279f8f.28.2025.01.17.05.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 05:54:08 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v10 0/4] clk: qcom: Add support for multiple power-domains
 for a clock controller.
Date: Fri, 17 Jan 2025 13:54:06 +0000
Message-Id: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP5gimcC/63RTW7DIBAF4KtErEsFw/DXVe9RdYEBJ6iObdmJm
 yrK3TvJpq68o13OW7xvYK5szlPJM3vZXdmUlzKXoadBiqcdi4fQ7zMviQIGAlBK6XiDvCv9+cL
 7fDlxQC4lpzh2Q/zgx3N3KmOX+Th85omn4RhKP/OgW+8xRdQQGDWPU27L5cG+vdN8KPNpmL4eW
 yzynv7NWyQXvLEBmuSgCcq+UkWYhudh2rM7uMAKAV2HACFBZ6s1JptRbxC1RkwdoghxyqSQlNI
 gwwbBNWLrECQEFbqEIjZGbV+i10jlTTQhMYADE9E4iRvErBFfhxhCANGZYIRrnNkg9gcBKqxCL
 CE2KwFtEh6d2yDuHxBHiE5exdx6KcL2u/wKUaIO8YS0UrcNCp3b8Pvwt9vtG/NhD5QgBAAA
X-Change-ID: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-1b0d6

Changes in v10:
- Updated the commit log of patch #1 to make the reasoning - that it makes
  applying the subsequent patch cleaner/nicer clear - Bjorn
- Substantially rewrites final patch commit to mostly reflect Bjorn's
  summation of my long and rambling previous paragraphs.
  Being a visual person, I've included some example pseudo-code which
  hopefully makes the intent clearer plus some ASCII art >= Klimt.
- Link to v9: https://lore.kernel.org/r/20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org

Changes in v9:
- Added patch to unwind pm subdomains in reverse order.
  It would also be possible to squash this patch into patch#2 but,
  my own preference is for more granular patches like this instead of
  "slipping in" functional changes in larger patches like #2. - bod
- Unwinding pm subdomain on error in patch #2.
  To facilitate this change patch #1 was created - Vlad
- Drops Bjorn's RB on patch #2. There is a small churn in this patch
  but enough that a reviewer might reasonably expect RB to be given again.
- Amends commit log for patch #3 further.
  v8 added a lot to the commit log to provide further information but, it
  is clear from the comments I received on the commit log that the added
  verbiage was occlusive not elucidative.
  Reduce down the commit log of patch #3 - especially Q&A item #1.
  Sometimes less is more.
- Link to v8: https://lore.kernel.org/r/20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org

Changes in v8:
- Picks up change I agreed with Vlad but failed to cherry-pick into my b4
  tree - Vlad/Bod
- Rewords the commit log for patch #3. As I read it I decided I might
  translate bits of it from thought-stream into English - Bod
- Link to v7: https://lore.kernel.org/r/20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org

Changes in v7:
- Expand commit log in patch #3
  I've discussed with Bjorn on IRC and video what to put into the log here
  and captured most of what we discussed.

  Mostly the point here is voting for voltages in the power-domain list
  is up to the drivers to do with performance states/opp-tables not for the
  GDSC code. - Bjorn/Bryan
- Link to v6: https://lore.kernel.org/r/20241129-b4-linux-next-24-11-18-clock-multiple-power-domains-v6-0-24486a608b86@linaro.org

Changes in v6:
- Passes NULL to second parameter of devm_pm_domain_attach_list - Vlad
- Link to v5: https://lore.kernel.org/r/20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org

Changes in v5:
- In-lines devm_pm_domain_attach_list() in probe() directly - Vlad
- Link to v4: https://lore.kernel.org/r/20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-0-4348d40cb635@linaro.org

v4:
- Adds Bjorn's RB to first patch - Bjorn
- Drops the 'd' in "and int" - Bjorn
- Amends commit log of patch 3 to capture a number of open questions -
  Bjorn
- Link to v3: https://lore.kernel.org/r/20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org

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
Bryan O'Donoghue (4):
      clk: qcom: gdsc: Release pm subdomains in reverse add order
      clk: qcom: gdsc: Capture pm_genpd_add_subdomain result code
      clk: qcom: common: Add support for power-domain attachment
      clk: qcom: Support attaching GDSCs to multiple parents

 drivers/clk/qcom/common.c |  6 ++++
 drivers/clk/qcom/gdsc.c   | 75 +++++++++++++++++++++++++++++++++++++++--------
 drivers/clk/qcom/gdsc.h   |  1 +
 3 files changed, 69 insertions(+), 13 deletions(-)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


