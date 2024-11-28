Return-Path: <linux-arm-msm+bounces-39482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E06E79DBB4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 17:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A027D280C3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 16:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC211BD9EE;
	Thu, 28 Nov 2024 16:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OVvS2We0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C952914A08E
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 16:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732811885; cv=none; b=NX/1+8BBWH4uL2SUDBqAP3JEl14CcNFoLRgUAGvnq0Fn0+sQ/yzpAS71Z07zp2n753KyryAlLGHbxq+0TGML9nyLUHN8cTCOrImXJavKmVFY/bENLgV2bnnlFPmCTP20b+REo9+TfcaPrxnd0CHbXFhc1aObM3SKWv4G2qt7d88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732811885; c=relaxed/simple;
	bh=vgYn9zLNQyjYaYo46ANhVNKjH+N1vOVW4WBYhS938hg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S70yWFIbRdmsvNdajLRYAMuzjFmyahbg2ZY+fsAIX9NUuRzIeA7WMMvQTrdw8ZOLhtTyIIUZbTfVlctJ+JWkkCCQdvGlkeqgXL/pXXipHAe0WXO1GZXaFQW/XCSr8BAqYRq2HPsL/vtvRoPfjewbs1qNMTCKwwNcek0PRyn/roE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OVvS2We0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434aa472617so9051845e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 08:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732811882; x=1733416682; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n139LLUWEGUGqX2c4/yhRzaQFakjalspoAimcmAKESw=;
        b=OVvS2We0nKvnV9MxHao376WSR2lqlpIT+WnE3qufQzvHNPleLhT1NpelBn6+hD5ht/
         yN5IX+bQnMZfjmI3LTxXsB5YnXoSq1XZttnAAAR8PxPDxA5MQx+nRejccV6+yEoJEA0O
         oaXt/2QFIRyz9Rh2UMsMO1YuDhzojbzBG9f9MEAbojPbacpUt/1RYNI2ukiuPdeJYVA7
         IZBBW/DxfV50faEguinyhbsM2PeAOYOASHGG1sbEivLzqEz1hm5Ll9Bh0bY+1Y/CtjCG
         nH9Ea9AN5nwS6zXoyiCT7XHWt+HMhpujXtkX8O/GYodNz/npXSbkPrrK58kJGiQPLOZ/
         N9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732811882; x=1733416682;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n139LLUWEGUGqX2c4/yhRzaQFakjalspoAimcmAKESw=;
        b=lGEvOAI4pwNsI0lbascDr6eeg3xcSqLC5e94KZ92om4e6SC8mu+1gagIjol9OS43rs
         D8rRE5J99sCrmovxtbTV7ODTkaNpir15trengMo1Rqbpu2LtVJLKn62UIkcqBRWHaHUc
         hX5uEqlpjBH4WRkZUe5FAGFzI6V2iO+5U3sGqD+p6ujOq5mLkmGZfSolVcZxJAEi1vr9
         IZr94ERjQMxHszDqLKqsjCzQsEOp/W7hqKyPAXdbZO8yA171RZmZu7pW0lS64NlkvcXO
         FHJ1rh8LFmDFEZQjc/V0nENYqCeL0HnQCcqtf6WBh4aDr0EIM33+XezfaG6DbN46Mvxd
         aoSQ==
X-Gm-Message-State: AOJu0YyAgfP6HdZs7CCMulmOR/385VKwQELle2fproT+N4tO+oCs0bZQ
	RHzOXt+M+8RRuisdhTqctgqfNf7VvC7wzWiYIPprNatlgTmcipq5hEGHhvc6JCM=
X-Gm-Gg: ASbGncthxYu20jnnLYsl4qK4W2MWhtqT2QMGOopzvYIHIa2i+HBuWjXkJDR5/1TqNz9
	UyeOdxmPQlQuLcSn+OfpavS2emnV+lK8MJcEdhEeXSziZpnWw8rDnzRqAbAd+BQGV7dkOXdcjnY
	Z0ZzXeJi/e1stzWLHh/y14G07haOJtf9+Zb7XsovOQ9RuFi4A3OlKVjzVCJ1gu9a3wq3QkDZbt4
	PokHOP1h0iPjRf+x1QVv/G+Zbzxp+7ZvHPX84+JkrGCQ4otq+pC8LNRPb8=
X-Google-Smtp-Source: AGHT+IEiOOWgACWYX1/g1Wg/6XsKndsm80tgMnVPgYh0auGFPAFq9tazzhfi/I9LzHYD3Q5bujPz1Q==
X-Received: by 2002:a05:600c:4ece:b0:432:b38e:a048 with SMTP id 5b1f17b1804b1-434a9dbeb5emr72168095e9.12.1732811882220;
        Thu, 28 Nov 2024 08:38:02 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa78c202sm57990155e9.26.2024.11.28.08.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 08:38:01 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 0/3] clk: qcom: Add support for multiple power-domains
 for a clock controller.
Date: Thu, 28 Nov 2024 16:37:59 +0000
Message-Id: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGecSGcC/6XPTW7CMBAF4KsgrztVbI/j0FXvUXUx/gGsBjuyQ
 whCuXsNq1Ts0uV7i/fN3FnxOfjCPnZ3lv0USkixBvW2Y/ZE8eghuJqZaARyzjswCH2Ilxmin0c
 QCJxDrW2f7A+cL/0Yht7DkK4+g0tnCrEAqcN+j86iEsTq8pD9IcxP9eu75lMoY8q35xETf7T/8
 yYODRhNwrhOGJL6s05QTu8pH9kDnMQKEWobIipCymul0GmP6gWRa6TdhsiKdLJ15KRUgtMLgmt
 Eb0OwIiixc9hY08q/nyzL8gv8eeR7JgIAAA==
X-Change-ID: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev-355e8

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
Bryan O'Donoghue (3):
      clk: qcom: gdsc: Capture pm_genpd_add_subdomain result code
      clk: qcom: common: Add support for power-domain attachment
      clk: qcom: Support attaching GDSCs to multiple parents

 drivers/clk/qcom/common.c | 10 ++++++++++
 drivers/clk/qcom/gdsc.c   | 41 +++++++++++++++++++++++++++++++++++++++--
 drivers/clk/qcom/gdsc.h   |  1 +
 3 files changed, 50 insertions(+), 2 deletions(-)
---
base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
change-id: 20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-a5f994dc452a

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


