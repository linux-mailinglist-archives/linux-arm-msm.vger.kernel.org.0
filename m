Return-Path: <linux-arm-msm+bounces-59917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB45AC931D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 18:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1183DA476D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 16:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C7B235057;
	Fri, 30 May 2025 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OWFPFv75"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B003F2356DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 16:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621380; cv=none; b=EHXS1nvKu2OeP6hoGDoRiPGdzHc6P07nqEb8wStFb9gGHahhT75O0ORSGrm0bIygP3QHdFt5/HA1kDPW8RiKG6HsYgR6TkPHQ7R1QsRe2UN6+yMCxn3GouX7pFUDYNyhrsRGdtHz1TN81Svknea4zr6AulOgXpOV3HfiITNiOcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621380; c=relaxed/simple;
	bh=K+noXdjQU+U9M/qLIQSRjbQSnj/HMYLZOggdzA0wRz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rkflhf0P9IvdFlvlRqjW9PUOs2E7f0/nvb3R5yGE6yUcEPI4ExKkcNWAXptGp6k5jEW2C3tHgw5jOVEPfLEU+o0Oc1mJWoPu4MVB9qv1U/qtI0aPrbweraUWh2v3mIHXbgqIVo4jG3YyC82jWtQo1gaMOjoUGCRVSYwkywRFTTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OWFPFv75; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234d366e5f2so29127595ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 09:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748621378; x=1749226178; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxxufLK3KekEdbbP35QTahMDHa855MkqcMEQ8g1zMTk=;
        b=OWFPFv75jUMcyKqM4kiH+1WgnnOJm4KXeza3803Uox+dAiompg3hJW5h+YD0tVjqdO
         XATohQgUVGofAGheL5Jt3Jc9uC13xgItDQLkQp95H96DTvZu9V/btZ+Pr6LKMLsY3p45
         A0S6zihhWrK2Cx+MyY6uy3Wf9QJxKm811VzvpC3XHsgTa895OIUTZe6sh0kbGLHKqOwP
         lyU3LUWRiX4wjYUQ2Xy4ebv3S4Kph2L7Ve0birT984fSyVU2HffG7a7cY34QFuffT8+x
         klN3Nivi3KPECpqmV7f6HAsSAOxhpB3eyyhRXMXnoqxAp5w4YgCUnmrB+YWDOEaIkZx7
         8S4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621378; x=1749226178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxxufLK3KekEdbbP35QTahMDHa855MkqcMEQ8g1zMTk=;
        b=HBWdVUoak+qUaJ7Ge30MI5Vbl0rGU6X9EW8FPSGKo/P7XaCAyXM3DPSsOuajX0AnUR
         CrjldJFfM129MtIejtRtmFaw6f04UX0le+dolmm8dDzfe0cLqWrJ5Z9nJrWc4aGhmprS
         pfyGqC9+flzAq44ifRxp+cF5c2vWw/EnygDOYy8cizZwatAMfmRWsi18Il+8GY6QqtKl
         LYOcXpFWx3ZODLhKcfXEvGtjgy0l9HhOrKYCKoVckGVQ7f3XnilaPM/MSUOpRmN1Q2Jm
         W7TfuF8YXdrJLtsu8QgivMZNe8VHCsRxzSNeXn8xc7qGSCNVQN99p2yohzvT8ECB5Zc0
         PFxw==
X-Forwarded-Encrypted: i=1; AJvYcCV/DTYlQSSsU8B1hcwJ6BwXInEiWaAcDuJub9KUOJvJruOvzlqisKmK6Kvt+iXtSotygqmbRZ5ZY0QxeuGb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7tJs92Qm7gIcoWtc3oWNfnk3U/EmB8AIl4yL0sMo1n4YsdiBK
	fqH4qW6bxRd5HrP9mPgDMJQxvo/VvN4fv4qrTMj6C+iAIxt1pSLS4+iFxyuZT7qStg==
X-Gm-Gg: ASbGncvNGUT8cCZjJtQFbnIKxdwLNcHtU9kBZV16Az8D2vT69FwtuhzUYOxtrgPFhJz
	0ZzyQyWkJWhO5nlgeLxr9T/zlM94KfLtIuts051iWJQlR45l2tk2ybJp7hRWgSwEkmchqNl/zNA
	MZeSvwSqgYQw7rhjr88BSIOxwb/NN1kfaPGlsp2M4421SlRHnAH1r7nuIFu1fyMXGNsdqCChbDo
	e+z1Zjrg3EU+pYZ2AtQWeCcFfMVMPl8pzEKe0kmlKEtxtNY42s2w5Vdys5TeDHfkUvEIrQtfPoK
	Dkb+TOvAO9b36+C3w2ymrb3LB40tv/YfbtEi1le8nUNQUOhRkEVyyqXxQtl03A==
X-Google-Smtp-Source: AGHT+IEaQI64EZVaM9JygVJu/CqqQgOOBJm+b8JHY4a69IBYYuuTYL7zefQI+S32XWNK9lzdgNMIBQ==
X-Received: by 2002:a17:903:291:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-23529a28ab7mr65505535ad.37.1748621377852;
        Fri, 30 May 2025 09:09:37 -0700 (PDT)
Received: from thinkpad ([120.60.139.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd9478sm30412095ad.77.2025.05.30.09.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:09:37 -0700 (PDT)
Date: Fri, 30 May 2025 21:39:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
References: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
 <20250530113404.GA138859@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530113404.GA138859@bhelgaas>

On Fri, May 30, 2025 at 06:34:04AM -0500, Bjorn Helgaas wrote:
> On Fri, May 30, 2025 at 09:16:59AM +0530, Manivannan Sadhasivam wrote:
> > On Wed, May 28, 2025 at 05:35:00PM -0500, Bjorn Helgaas wrote:
> > > On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> > > > The PCI link, when down, needs to be recovered to bring it back. But that
> > > > cannot be done in a generic way as link recovery procedure is specific to
> > > > host bridges. So add a new API pci_host_handle_link_down() that could be
> > > > called by the host bridge drivers when the link goes down.
> > > > 
> > > > The API will iterate through all the slots and calls the pcie_do_recovery()
> > > > function with 'pci_channel_io_frozen' as the state. This will result in the
> > > > execution of the AER Fatal error handling code. Since the link down
> > > > recovery is pretty much the same as AER Fatal error handling,
> > > > pcie_do_recovery() helper is reused here. First the AER error_detected
> > > > callback will be triggered for the bridge and the downstream devices. Then,
> > > > pci_host_reset_slot() will be called for the slot, which will reset the
> > > > slot using 'reset_slot' callback to recover the link. Once that's done,
> > > > resume message will be broadcasted to the bridge and the downstream devices
> > > > indicating successful link recovery.
> > > 
> > > Link down is an event for a single Root Port.  Why would we iterate
> > > through all the Root Ports if the link went down for one of them?
> > 
> > Because on the reference platform (Qcom), link down notification is
> > not per-port, but per controller. So that's why we are iterating
> > through all ports.  The callback is supposed to identify the ports
> > that triggered the link down event and recover them.
> 
> Maybe I'm missing something.  Which callback identifies the port(s)
> that triggered the link down event?

I was referring to the host_bridge::reset_root_port() callback that resets the
root ports.

>  I see that
> pci_host_handle_link_down() is called by
> rockchip_pcie_rc_sys_irq_thread() and qcom_pcie_global_irq_thread(),
> but I don't see the logic that identifies a particular Root Port.
> 
> Per-controller notification of per-port events is a controller
> deficiency, not something inherent to PCIe.  I don't think we should
> build common infrastructure that resets all the Root Ports just
> because one of them had an issue.
> 

Hmm, fair enough.

> I think pci_host_handle_link_down() should take a Root Port, not a
> host bridge, and the controller driver should figure out which port
> needs to be recovered, or the controller driver can have its own loop
> to recover all of them if it can't figure out which one needs it.
> 

This should also work. Feel free to drop the relevant commits for v6.16, I can
resubmit them (including dw-rockchip after -rc1).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

