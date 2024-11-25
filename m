Return-Path: <linux-arm-msm+bounces-39002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FA59D7994
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 02:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7582A281BA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2024 01:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D9ABA2D;
	Mon, 25 Nov 2024 01:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zTktfWmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3C7B664
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 01:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732496418; cv=none; b=AQmW+bgOuiv3xrQOkHnvqWvRUCSiA7ZSCnGBTF4qn0gr2zZI5unsrdxlDXowAfSIDGqZBsTt5oEdj9Qc2Fxs4m9974v/E1ixgyd1wu4iMDSVTbFK7u2f41rFGSL4M9iLf+NL46/STsi0teIZdszU5bw/v4n24NOAPr+Qk3WoSAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732496418; c=relaxed/simple;
	bh=y9ZYoHlM7i+ZIGS1n6D9HnNvAybzn9tIZCKWJEMEOx8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=la3uol2GywHhawmYG4879D1NYefCIEyDlKlPONlC3K3AFqfusz6FwJ981Fi5yseqPj4E1f2RGcI2/MDgxLpvf+M3UwZ8uUX5exEwIFkjMmuUgpFk4pRDxUuMu8/hCflSk2DSxA5vXlx/ol/lH4ybRxC8hutAFIwyZTwDrkQUKP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zTktfWmz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43494a20379so9149075e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Nov 2024 17:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732496414; x=1733101214; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WSAFwrtbBp4QZXwb4cvKT4kmuPVZhzrRlaNd/kKe9r0=;
        b=zTktfWmzTcjhALtn7B6cqFm1+Y1v8u4ZrYHONfH1E0skj7ljiOJGUhpa6ebPVZCJbG
         rb0myWKglvReaA0HSV2BgqdiNQ8MijdGGVi7B8Yr238DYyIrxUUNB/rPYAxjLq2K5582
         xT13IgXjLiMcOoj7g5KiMkGzq+bV6tpXV3CAbmeHgqDxfMT7ml8yKOSo3mSCHS+36C5t
         EqiuBju0KoGPGsq6Fl+qnHh4oMA5k1kH+XVvO0rBGaklLtIpPTXJilxucuHg1dJcpTyA
         ihrBeKQnZnHi5fwDGtk8OPPpkjDgzeSnupjnJniaaXzEWFc5VJDReaHbMVHZWQKiQ1eL
         JP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732496414; x=1733101214;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSAFwrtbBp4QZXwb4cvKT4kmuPVZhzrRlaNd/kKe9r0=;
        b=iqGYmRytMaBRh4aIGZFHi3+y2OUnXYf/dcVa4AYQ6k30EaJg/tUksAw8ZqwK7HkCZy
         VhvN1+7aiNM17jNIGF33itQaQebWy/FGQeIOnkaG0Llfewb+CiwFJDQ/QStZeEAmou8i
         U+X6EKyse+zpqGi2qyJytBzLZ/+fr4m/NScEZy2fqcY8BvLahnFhql3pqM9HoYwq2I9c
         VfsJr9UyzCGLdGNtJ8EfFOuQ1IAQhwxzD7jv2hRFyizpG8ofmYvB+v3RwT7eJ8KbQI3d
         74ANG4Ua09hjO7kh+At7dnbHJlL4qzO54wNLLUObQ+ip1S0LNETA5P0n+3Ju19DY1TeQ
         W4wA==
X-Gm-Message-State: AOJu0YxLdNs+Ld6ugouTxg/iO5Ti1gT2Mq/JZjhtnI82DBFMGQlfOLez
	CsCyzyn/OfTkBqj8gA4NcWnQJ/mBWl/VqhU/h7iugC1XoETJrF9zSy9WEeBO79k/JdOt/LQZCij
	NzyY=
X-Gm-Gg: ASbGncu6MD9BoLUe9a2Z26BHKonAbwCwPVlQulXzb38TLh1Lc3Nbn+L+EjRj9VgmqnT
	OvgmVNkTEFlkuzeoTCSORHuU1LxXVsHozrMTzmwgOEYGDBtTaDuXvmGqse5d/kdETKAV8HSAIoD
	aLYH/3O6ACBXobs46Vj35kUpNv8hRjjAoFE+WhXPs1rIyyhRupdknm79hvt7dHbIQMXenvyJTbn
	lmxgL1eBHVjfUoHzIczP6gPZkTRJihXm/J/58vwGHA095i5ICLn+vLE4YY=
X-Google-Smtp-Source: AGHT+IHwtJmNP48EGzwPcqGQSZvah8qf8gxfMFdioGK3JU3AqrMZHFhSAUOMjEPV/VaWSUORfl7mJA==
X-Received: by 2002:a05:600c:1c01:b0:431:547e:81d0 with SMTP id 5b1f17b1804b1-433ce427004mr89943655e9.11.1732496414134;
        Sun, 24 Nov 2024 17:00:14 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349f0ba652sm24125125e9.40.2024.11.24.17.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 17:00:13 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/3] clk: qcom: Add support for multiple power-domains
 for a clock controller.
Date: Mon, 25 Nov 2024 01:00:11 +0000
Message-Id: <20241125-b4-linux-next-24-11-18-clock-multiple-power-domains-v2-0-a5e7554d7e45@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABvMQ2cC/6WOQQ6DIBBFr2JYdxqhGLWr3qNxgTDqpAgG1NoY7
 17qFbp8b/Hf31nEQBjZPdtZwJUieZdAXDKmB+V6BDKJmciF5JxX0Eqw5JYNHG4zCAmcQ9Laev2
 CcbEzTRZh8m8MYPyoyEVQRVfX0mhZCMXS8hSwo+2sPpvEA8XZh895YuU/+19v5ZBDWyrRmkq06
 lY+0oQK/upDz5rjOL4qIjYJ9wAAAA==
X-Change-ID: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-355e8

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


