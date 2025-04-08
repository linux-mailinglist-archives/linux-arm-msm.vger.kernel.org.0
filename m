Return-Path: <linux-arm-msm+bounces-53592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 948AFA8162B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 21:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E7AE4682A0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 19:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0093F23F41D;
	Tue,  8 Apr 2025 19:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IdgILvda"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB1422F145
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 19:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142381; cv=none; b=SeshXdov0dM0q/UD2eY36MDeLHEwjJkB1bfRdS+IISaB7q1kL4t9xivInQPeYNGaUU4Rdq2YxiaDh7mvfics3THcrBMhcuEeCynHe2aalFx7mXISlzxEnGavcWF/a30q4u9vP3icdokQFhgnQWFqTOcN2DbXtL1T2BibL6w4xtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142381; c=relaxed/simple;
	bh=T3dxU9Xzp9z0tf6G7dXM8herRtcII2CldD29N7/opUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z782VSH869WBUyOIU3gFtbbt3uhY36T6RH5psUEozIyuomRDIbrryX/nZJkSfFm13uw0gJx9w+ksN42ENC/5n+xN5T/uHpqC046xRI30OfrZo31lmlArk/z69pzsSXsPtZdUtPT6e3ILcEs5QV6aBUiALfZ3snxiZur/qjjckHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IdgILvda; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736b350a22cso5362630b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 12:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744142379; x=1744747179; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P36tuhRNiXUx83uwdjI7YGhqW3UK9LAxmTlrMVh1D9o=;
        b=IdgILvdaSSt31NfzSJDntSsraVrg1swZByNq55EayrGs7kaYcXoVm9GmYmjLes43b+
         ECJLyYYo+EYrUkImvn6RUtk6QGMOzstGElXo3PjaIqHs/pKkCs0ojjCPCnPZi7xWk9l8
         1KBl6DpivUKNWm0Zr+Q1XpFWi4JVtdg4D2DyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142379; x=1744747179;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P36tuhRNiXUx83uwdjI7YGhqW3UK9LAxmTlrMVh1D9o=;
        b=TCsW88rpmDGv4poLk/SEKV9hbf3Lw9tu8XoS80+H5z0gnytixbNG4Op8V/4JuxkZRC
         h/RD80S/okYSukzBG+TvFSSFAHN0Ni5x5x5iIeSpQdqbZXFn6lUBSf8rcdCvRr5XdW+8
         eiCkhs2hjsAehANCZVofMZXuStB6cS1DwYR+YaqPf4us6HqVxzW+uMiGRDEeSUa23wDN
         wl4X8CcH3kQVQv78HUovxFxrO80UXfgHlVxWGv8r+4iy+4YoBoIO11yHLVGqfhi5oBxG
         Upv7fjDaUEvc09EhkNpOw9IdvSv9ne0uP04TJ5gNdOijMUe07k6kSYne6tHQLEfXdpxU
         Z41g==
X-Forwarded-Encrypted: i=1; AJvYcCVXho1QqUXGhCg06QVC4MH+8b0LBuiLNkcQA5Qsx4kxVWozMtdk4fk4lW332XSsEbQSuBskd/sDbX0bZGhW@vger.kernel.org
X-Gm-Message-State: AOJu0YzmxsvIlKSErouhYhTcHO787rEh4DbktOn0USsY8VjgycUET/4a
	CezrBkHw8vid9pJjYTzubVCChtwVtFCBSQRh6u94Mv21ft4EoalYsmSXPbxA3w==
X-Gm-Gg: ASbGncthT+Twju1jE5zxoWXKcPIUiK82dvdpp4f3P55KwzlZ++SDzZHJlWmSLzMi+l5
	xK22s7u1nm+W7gKNvU9X/OEc8sQT5+XyzupBQfNIJIUA9hXB5mS6foytJavTWm+o+ufWHfAM8zG
	+OdwYKxpKPvib//IczGzpcIGThhC+uwEjUlQpcQTiDEUWoCYaI1i4qT6vqgtWYTkmbzO9TwTLzz
	hpScm8SHEEH2o9ReNpa09vkSwfez6bTsYjrp/O3hzN4TJvS2j7OUpQMRWmA1g/VdAmtxM3ysvnu
	eKyly/uuB1bEjDcBNCNs+qXYFRRXih/A93O2QJ7h3UOx1bwcGCQIvxe8qa7QZfXIKioQxvuaXFH
	NoomWxp0=
X-Google-Smtp-Source: AGHT+IFEVy+GFyChwMyGX3zYW7HedKd+ZJuOOOX9WnEe0gqFxgoin7KxxjobZqlNVSmcDzY3B3n1dA==
X-Received: by 2002:a05:6a00:1148:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-73bae4d52femr329321b3a.11.1744142379428;
        Tue, 08 Apr 2025 12:59:39 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:f6a0:ca46:b8a5:169e])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-739d97f1c4bsm10955081b3a.70.2025.04.08.12.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:59:38 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:59:36 -0700
From: Brian Norris <briannorris@chromium.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dmitry.baryshkov@linaro.org, Tsai Sung-Fu <danielsftsai@google.com>
Subject: [RFC] PCI: pwrctrl and link-up dependencies
Message-ID: <Z_WAKDjIeOjlghVs@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TL;DR: PCIe link-up may depend on pwrctrl; however, link-startup is
often run before pwrctrl gets involved. I'm exploring options to resolve
this.

Hi all,

I'm currently looking at reworking how some (currently out-of-tree, but I'm
hoping to change that) pcie-designware based drivers integrate power sequencing
for their endpoint devices, as well as the corresponding start_link()
functionality.

For power sequencing, drivers/pci/pwrctrl/ looks like a very good start at what
we need, since we have various device-specific regulators, GPIOs, and
sequencing requirements, which we'd prefer not to encode directly in the
controller driver.

For link startup, pcie-designware-host.c currently
(a) starts the link via platform-specific means (dw_pcie::ops::start_link()) and
(b) waits for the link training to complete.

However, (b) will fail if the other end of the link is not powered up --
e.g., if the appropriate pwrctrl driver has not yet loaded, or its
device hasn't finished probing. Today, this can mean the designware
driver will either fail to probe, or at least waste time for a condition
that we can't achieve (link up), depending on the HW/driver
implementation.

I'm wondering how any designware-based platforms (on which I believe pwrctrl
was developed) actually support this, and how I should look to integrate
additional platforms/drivers. From what I can tell, the only way things would
work today would either be if:
(1) a given platform uses the dw_pcie_rp::use_linkup_irq==true functionality,
    which means pcie-designware-host will only start the link, but not wait for
    training to succeed. (And presumably the controller will receive its
    link-up IRQ after power sequencing is done, at which point both pwrctrl and
    the IRQ may rescan the PCI bus.) Or:
(2) pci/pwrctrl sequencing only brings up some non-critical power rails for the
    device in question, so link-up can actually succeed even without
    pwrctrl.

My guess is that (1) is the case, and specifically that the relevant folks are
using the pcie-qcom.c, with its "global" IRQ used for link-up events.

So how should I replicate this on other designware-based platforms? I suppose
if the platform in question has a link-up IRQ, I can imitate (1). But what if
it doesn't? (Today, we don't validate and utilize a link-up IRQ, although it's
possible there is one available. Additionally, we use various retry mechanisms
today, which don't trivially fit into this framework, as we won't know when
precisely to retry, if power sequencing is controlled entirely by some other
entity.)

Would it make sense to introduce some sort of pwrctrl -> start_link()
dependency? For example, I see similar work done in this series [1], for
slightly different reasons. In short, that series adds new
pci_ops::{start,stop}_link() callbacks, and teaches a single pwrctrl driver to
stop and restart the bridge link before/after powering things up.

I also see that Manivannan has a proposal out [2] to add semi-generic
link-down + retraining support to core code. It treads somewhat similar
ground, and I could even imagine that its pci_ops::retrain_link()
callback could even be reimplemented in terms of the aforementioned
pci_ops::{start,stop}_link(), or possibly vice versa.

Any thoughts here? Sorry for a lot of text and no patch, but I didn't just want
to start off by throwing a 3rd set of patches on top of the existing ones that
tread similar ground[1][2].

Regards,
Brian

[1] [PATCH v4 00/10] PCI: Enable Power and configure the TC956x PCIe switch
https://lore.kernel.org/linux-pci/20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com/

[PATCH v4 03/10] PCI: Add new start_link() & stop_link function ops
https://lore.kernel.org/linux-pci/20250225-qps615_v4_1-v4-3-e08633a7bdf8@oss.qualcomm.com/

[...]
[
[PATCH v4 08/10] PCI: pwrctrl: Add power control driver for tc956x
https://lore.kernel.org/linux-pci/20250225-qps615_v4_1-v4-8-e08633a7bdf8@oss.qualcomm.com/

[2] [PATCH 0/2] PCI: Add support for handling link down event from host bridge drivers
https://lore.kernel.org/linux-pci/20250221172309.120009-1-manivannan.sadhasivam@linaro.org/

