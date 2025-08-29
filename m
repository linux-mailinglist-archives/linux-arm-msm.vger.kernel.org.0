Return-Path: <linux-arm-msm+bounces-71259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1603AB3C5DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 01:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 611E61C882CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 23:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288E835CEAE;
	Fri, 29 Aug 2025 23:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QwpIW/gI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA5335CEA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 23:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756511910; cv=none; b=uKqs6KGZjIdtpcclTWu7KoCOij0tIKwlKFhIRpfcBLJl0dPpBZjiP4eUYyJuCNGU8p3Ng4eSxrinnz7Whii/YjFGjxTPx+ueSha/Rr3YABxVDVYITEe7Ex8GDKW5h3LZGulTHwR9nFO7cjuIfALwgXsVjzhrpElnFMOCq6ClZpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756511910; c=relaxed/simple;
	bh=8itxN2CvlAYGgXC2jkdop3/WfWUI/Yu8r0UJfeNgHxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lC/GfZ21y03tM1Q8G8nIE7RoYi/ptdaK4uMnvfxDL9ThHn33ZRHurlMu9Cm+u6Gdph+2QIjxYmWmCjwq0AJ0vCbxkPcZ7kF+19Xntl/alYW7drLdbUUue3tqCO/6UQOStwHQo9iRUwBkbGVAjauc8nejK0nrxg76FZhe7wfYWeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QwpIW/gI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2465cb0e81bso21363915ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 16:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756511907; x=1757116707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZkOb/hPcVe8gnDPdefZkpPuz6ZACFjeMAIL1vSEcE4=;
        b=QwpIW/gIhYlW+ZpPfejRKNhjd/ujxeMTbooCX4wz3WvJjglfFIruZN+Qqr9JE7X9Qe
         9nwYwpkLyV36JGb2Y/FchHTTEBkpb9/OTNYOVADjImUtwuSnmXVS1nVgAfoo2AAAJD1g
         CnCnuMb+z7rlnyZ2xd02AVjcceyCAS9CXRLzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756511907; x=1757116707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZkOb/hPcVe8gnDPdefZkpPuz6ZACFjeMAIL1vSEcE4=;
        b=icCuivW4JBIvMMXHeW/Xh7UBGJGmnbh5OV16PIW+2+S0I+gpMZJH0VIGFnWk2ziPRA
         53sG9dDQN66rBX229rctL75458UON+4ZSoXYCbnljyfuyJPCr9i9Yu0gvZ3BQHJUOPj7
         baSstP1NnosKO8nrfkJZUf8L1iRauBPfCFDIlRSpQ3roA6zIso+6jqDnDRLoyN5QIFvw
         d9DBQz9XPwDk+fwZC0yNU81gz4GY5ScxmJcSt/quqzttBy4fv6EbUpedSWvP2KkSbdPD
         1eUys9LqACigmjHRcZDjUTWupFrRBLaoj/XBYMe7gCpsncrKw3DFu9frujkS/9gm9CWu
         NO5A==
X-Forwarded-Encrypted: i=1; AJvYcCX1fpKOgDHnJfraHKZoaW5+lnsfaFSeNpIt8a+7Zej+Q8CP/Slc/0+z7ezLVrPM87dJCMAR+53g0dtjwfyX@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYYBHNAA8c5+a7XgGiQkiVWbiAORX+fgo//qpbfbsvS0xcR9p
	Vdqxq3BK30cW09PFddlTPrOM45MnBzOQBmPJcoPdh/MAVZLuTEr91PAFA/r+41u0bw==
X-Gm-Gg: ASbGncsuypfRzgm1IGzLepsnG4TtbkyxjdPGPrleroHvKbMXRiuC/3seo/wDADTAa2J
	BnuRzG5felPOfZTg5sesBr6njhi5pUpXVgCChkU9ByDsEXNeSqNVWFIcu3+FPxPUd8XdtMtOyH2
	BsS17qS7Cp6SQX1f9woHR/2KQ+yDK905nokSQDeLUzgLB6T+mTQSL6i0lHYOZllYEdnPsXAIYwo
	3PkeeHsOsAs2XklNIQq7aS/pzOqBgFy9/MtMwouZOoGELbDT5gwCklIh14cHXClK06Rk8vxIdz0
	Opw8A8zUl0urN+aKGJMgBsj3plyp/51l7xGqdZXoHrKgVZvW2Tpqp8/HiksLMk5w/XxwUodXD7h
	HUKcyo7iopXdQzaqgttT6yImvHMEQC2aChPW63UccuuTRZnC1rcrrLmx9IW7b
X-Google-Smtp-Source: AGHT+IFvZvVbN+tcqDt9IuyuJa1uB30zy62FBhMsBU2d4G2xup0DO7jJDkNE7M+ZQIjDPW8i5FxZDw==
X-Received: by 2002:a17:903:2308:b0:249:33da:b3a with SMTP id d9443c01a7336-249448ad928mr5527165ad.14.1756511906811;
        Fri, 29 Aug 2025 16:58:26 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:1d4b:87a6:eef4:9438])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24906390e6bsm36386045ad.96.2025.08.29.16.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 16:58:25 -0700 (PDT)
Date: Fri, 29 Aug 2025 16:58:24 -0700
From: Brian Norris <briannorris@chromium.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] PCI: host-common: Add link down handling for Root
 Ports
Message-ID: <aLI-oKWVJHFfst-i@google.com>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <20250715-pci-port-reset-v6-2-6f9cce94e7bb@oss.qualcomm.com>
 <aLC7KIoi-LoH2en4@google.com>
 <aLFmSFe5iyYDrIjt@wunner.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLFmSFe5iyYDrIjt@wunner.de>

Hi Lukas,

On Fri, Aug 29, 2025 at 10:35:20AM +0200, Lukas Wunner wrote:
> On Thu, Aug 28, 2025 at 01:25:12PM -0700, Brian Norris wrote:
> > On the flip side: it's not clear
> > PCI_ERS_RESULT_NEED_RESET+pci_channel_io_normal works as documented
> > either. An endpoint might think it's requesting a slot reset, but
> > pcie_do_recovery() will ignore that and skip reset_subordinates()
> > (pci_host_reset_root_port()).
> > 
> > All in all, the docs sound like endpoints _should_ have control over
> > whether we exercise a full port/slot reset for all types of errors. But
> > in practice, we do not actually give it that control. i.e., your commit
> > message is correct, and the docs are not.
> > 
> > I have half a mind to suggest the appended change, so the behavior
> > matches (some of) the docs a little better [1].
> 
> A change similar to the one you're proposing is already queued on the
> pci/aer topic branch for v6.18:
> 
> https://git.kernel.org/pci/pci/c/d0a2dee7d458

Wow, nice coincidence. It's a reminder I should work off the maintainer
/ -next branch, instead of just mainline...

> Here's the corresponding cover letter:
> 
> https://lore.kernel.org/r/cover.1755008151.git.lukas@wunner.de
> 
> There was a discussion why I didn't take the exact same approach you're
> proposing, but only a similar one:
> 
> https://lore.kernel.org/r/aJ2uE6v46Zib30Jh@wunner.de
> https://lore.kernel.org/r/aKHWf3L0NCl_CET5@wunner.de

Wow, that's a ton of great background and explanation. Thanks!

> > Specifically, I'm trying to see what's supposed to happen with
> > PCI_ERS_RESULT_CAN_RECOVER. I see that for pci_channel_io_frozen, almost
> > all endpoint drivers return PCI_ERS_RESULT_NEED_RESET, but if drivers
> > actually return PCI_ERS_RESULT_CAN_RECOVER, it's unclear what should
> > happen.
> > 
> > Today, we don't actually respect it; pcie_do_recovery() just calls
> > reset_subordinates() (pci_host_reset_root_port()) unconditionally. The
> > only thing that return code affects is whether we call
> > report_mmio_enabled() vs report_slot_reset() afterward. This seems odd.
> 
> In the series queued on pci/aer, I've only allowed drivers to opt in
> to a reset on Non-Fatal Errors.  I didn't dare also letting them opt
> out of a reset on Fatal Errors.

Right, I can see where the latter is risky. Frankly, while I have
endpoint drivers suggesting they should be able to do this, I'm not sure
that's a great idea. Or at least, I can see how it would potentially
break other clients, as you explain.

> These changes of behavior are always risky, so it seemed prudent to not
> introduce too many changes at once.  There was no urgent need to also
> change behavior for Fatal Errors for the use case at hand (the xe graphics
> driver).  I went through all drivers with pci_error_handlers to avoid
> breaking any of them.  It's very tedious work, takes weeks.  It would
> be necessary to do that again when changing behavior for Fatal Errors.
> 
> pcieaer-howto.rst justifies the unconditional reset on Fatal Errors by
> saying that the link is unreliable and that a reset is thus required.
> 
> On the other hand, pci-error-recovery.rst (which is a few months older
> than pcieaer-howto.rst) says in section "STEP 3: Link Reset":
> "This is a PCIe specific step and is done whenever a fatal error has been
> detected"
> 
> I'm wondering if the authors of pcieaer-howto.rst took that at face value
> and thought they'd *have* to reset the link on Fatal Errors.
> 
> Looking through the Fatal Errors in PCIe r7.0 sec 6.2.7, I think a reset
> is justified for some of them, but optional for others.  Which leads me
> to believe that the AER driver should actually enforce a reset only for
> certain Fatal Errors, not all of them.  So this seems like something
> worth revisiting in the future.

Hmm, possibly. I haven't looked so closely at the details on all Fatal
Errors, but I may have a look eventually.

> > All in all, the docs sound like endpoints _should_ have control over
> > whether we exercise a full port/slot reset for all types of errors. But
> > in practice, we do not actually give it that control. i.e., your commit
> > message is correct, and the docs are not.
> 
> Indeed the documentation is no longer in sync with the code.  I've just
> submitted a series to rectify that and cc'ed you:
> 
> https://lore.kernel.org/r/cover.1756451884.git.lukas@wunner.de

Thanks! I'll try to take a pass at reviewing, but it may not be prompt.

Thanks again for all the info and work here.

Brian

