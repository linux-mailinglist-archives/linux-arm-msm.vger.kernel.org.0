Return-Path: <linux-arm-msm+bounces-96683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EaKElousGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:44:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B764625254E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEAF434EADDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B7A279792;
	Tue, 10 Mar 2026 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wfg6Pb3J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F379C211A09;
	Tue, 10 Mar 2026 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149875; cv=none; b=qOhCeKgdM7YE32YmHV4tIIXp4GiTTcIMaO/sg09ZWnWZvvQLUrHp6dShMFWZHuCD8kwCb1OwN5uXtcShR02wQ1D4z4xxl5c67F8F0mHlAfn2aSa1Ha9imc/sfXH3COhLKf8VUXMFTutf+c/xET4TVDgDLN69Mx1Lrb6kK9scJrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149875; c=relaxed/simple;
	bh=7n4LiLaeOu7Y781LaaH2FD19YKv/KTfp5uLzE86UGvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwO0GvmJTIhY08LtD+idxothqMAhC9VbniqlznXDAyq5UJX0T34cS53uuUh5orD32kCWbV9UxXQaT2en1w4RG2/6lxv1EfAfJnsbrL1H0SmuQWFhSwWQXqGXB1WoMI4hCy/v7UkyJ2rFHTeTvnKTTbpVbu38TfwvhNnuPHJy20Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wfg6Pb3J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E847C19423;
	Tue, 10 Mar 2026 13:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773149874;
	bh=7n4LiLaeOu7Y781LaaH2FD19YKv/KTfp5uLzE86UGvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wfg6Pb3Jv9nz87f4TL4NjXyJ5y2dr7izkZZumUwjox9UckLpwcrxyLugMkVY+Fey7
	 SfYvsQTEuFF2OfasvZRT2nw7myg1Oo+0tpDr4v1qpwoxvtd+ZkHD0PTQEuXq7PqGPD
	 VANFVMhmUBZpDbWl3YRwC++GuB6Cjau8tEg2hWOXuW/zpDPqnyJzDayYz9eU9Nx3CH
	 9FK6bCQ6MNNb+lTG6RIyqf2b0qh7VM1vKivIZkCqrqJ5w25XEKS5hiJJf1wJLL76Pw
	 M0Cfc/d/TzPtaGqx4SK9wWTSCS8weZqpmNtfBtEfEAtfujyVf0xgDxIHy3dGER0wnr
	 +juElQl3Sas9A==
Date: Tue, 10 Mar 2026 19:07:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com, 
	Bjorn Helgaas <bhelgaas@google.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <mevtdhght66tds7yhmr5a6xg5a75fb667b6lyvguoxqexmc74p@mroqidhzptxk>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <aHoh1XfhR8EB_5yY@ryzen>
 <aHokdhpJUhSZ5FSp@ryzen>
 <tujurux64if24z7w7h6wjxhrnh4owkgiv33u2fftp7zr5ucv2m@2ijo5ok5jhfk>
 <aJ743hJw-T9y3waX@ryzen>
 <lakgphb7ym3cybwmpdqyipzi4tlkwbfijzhd4r6hvhho3pc7iu@6ludgw6wqkjh>
 <aLmcO8ukT-CDZMuT@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLmcO8ukT-CDZMuT@ryzen>
X-Rspamd-Queue-Id: B764625254E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96683-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,google.com,linux.ibm.com,gmail.com,kernel.org,sntech.de,pengutronix.de,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,wdc.com,wunner.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Niklas,

Sorry for replying very late. I lost access to my EP setup, and just got it
back.

On Thu, Sep 04, 2025 at 04:03:39PM +0200, Niklas Cassel wrote:
> Hello Mani,
> 
> On Fri, Aug 29, 2025 at 09:44:08PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Aug 15, 2025 at 11:07:42AM GMT, Niklas Cassel wrote:
> 
> (snip)
> 
> > > > > > ## On EP side:
> > > > > > # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
> > > > > >   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> > > > > > 
> > > > > > Basically all tests timeout
> > > > > > # FAILED: 1 / 16 tests passed.
> > > > > > 
> > > > > > Which is the same as before this patch series.
> > > > 
> > > > This is kind of expected since the pci_endpoint_test driver doesn't have the AER
> > > > err_handlers defined.
> > > 
> > > I see.
> > > Would be nice if we could add them then, so that we can verify that this
> > > series is working as intended.
> 
> (snip)
> 
> > Ok, thanks for the logs. I guess what is happening here is that we are not
> > saving/restoring the config space of the devices under the Root Port if linkdown
> > is happens. TBH, we cannot do that from the PCI core since once linkdown
> > happens, we cannot access any devices underneath the Root Port. But if
> > err_handlers are available for drivers for all devices, they could do something
> > smart like below:
> > 
> > diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
> > index c4e5e2c977be..9aabf1fe902e 100644
> > --- a/drivers/misc/pci_endpoint_test.c
> > +++ b/drivers/misc/pci_endpoint_test.c
> > @@ -989,6 +989,8 @@ static int pci_endpoint_test_probe(struct pci_dev *pdev,
> >  
> >         pci_set_drvdata(pdev, test);
> >  
> > +       pci_save_state(pdev);
> > +
> >         id = ida_alloc(&pci_endpoint_test_ida, GFP_KERNEL);
> >         if (id < 0) {
> >                 ret = id;
> > @@ -1140,12 +1142,31 @@ static const struct pci_device_id pci_endpoint_test_tbl[] = {
> >  };
> >  MODULE_DEVICE_TABLE(pci, pci_endpoint_test_tbl);
> >  
> > +static pci_ers_result_t pci_endpoint_test_error_detected(struct pci_dev *pdev,
> > +                                              pci_channel_state_t state)
> > +{
> > +       return PCI_ERS_RESULT_NEED_RESET;
> > +}
> > +
> > +static pci_ers_result_t pci_endpoint_test_slot_reset(struct pci_dev *pdev)
> > +{
> > +       pci_restore_state(pdev);
> > +
> > +       return PCI_ERS_RESULT_RECOVERED;
> > +}
> > +
> > +static const struct pci_error_handlers pci_endpoint_test_err_handler = {
> > +       .error_detected = pci_endpoint_test_error_detected,
> > +       .slot_reset = pci_endpoint_test_slot_reset,
> > +};
> > +
> >  static struct pci_driver pci_endpoint_test_driver = {
> >         .name           = DRV_MODULE_NAME,
> >         .id_table       = pci_endpoint_test_tbl,
> >         .probe          = pci_endpoint_test_probe,
> >         .remove         = pci_endpoint_test_remove,
> >         .sriov_configure = pci_sriov_configure_simple,
> > +       .err_handler    = &pci_endpoint_test_err_handler,
> >  };
> >  module_pci_driver(pci_endpoint_test_driver);
> > 
> > This essentially saves the good known config space during probe and restores it
> > during the slot_reset callback. Ofc, the state would've been overwritten if
> > suspend/resume happens in-between, but the point I'm making is that unless all
> > device drivers restore their known config space, devices cannot be resumed
> > properly post linkdown recovery.
> > 
> > I can add a patch based on the above diff in next revision if that helps. Right
> > now, I do not have access to my endpoint test setup. So can't test anything.
> 
> I tested your patch series + your suggested change above, and after a:
> 
> ## On EP side:
> # echo 0 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start && \
>   sleep 0.1 && echo 1 > /sys/kernel/config/pci_ep/controllers/a40000000.pcie-ep/start
> 
> Instead of:
> 
> # FAILED: 1 / 16 tests passed.
> 
> I now get:
> # FAILED: 7 / 16 tests passed.
> 
> Test cases 1-7 now passes (the test cases related to BARs),
> all other test cases still fail:
> 
> # /pcitest 
> TAP version 13
> 1..16
> # Starting 16 tests from 9 test cases.
> #  RUN           pci_ep_bar.BAR0.BAR_TEST ...
> #            OK  pci_ep_bar.BAR0.BAR_TEST
> ok 1 pci_ep_bar.BAR0.BAR_TEST
> #  RUN           pci_ep_bar.BAR1.BAR_TEST ...
> #            OK  pci_ep_bar.BAR1.BAR_TEST
> ok 2 pci_ep_bar.BAR1.BAR_TEST
> #  RUN           pci_ep_bar.BAR2.BAR_TEST ...
> #            OK  pci_ep_bar.BAR2.BAR_TEST
> ok 3 pci_ep_bar.BAR2.BAR_TEST
> #  RUN           pci_ep_bar.BAR3.BAR_TEST ...
> #            OK  pci_ep_bar.BAR3.BAR_TEST
> ok 4 pci_ep_bar.BAR3.BAR_TEST
> #  RUN           pci_ep_bar.BAR4.BAR_TEST ...
> #      SKIP      BAR is disabled
> #            OK  pci_ep_bar.BAR4.BAR_TEST
> ok 5 pci_ep_bar.BAR4.BAR_TEST # SKIP BAR is disabled
> #  RUN           pci_ep_bar.BAR5.BAR_TEST ...
> #            OK  pci_ep_bar.BAR5.BAR_TEST
> ok 6 pci_ep_bar.BAR5.BAR_TEST
> #  RUN           pci_ep_basic.CONSECUTIVE_BAR_TEST ...
> #            OK  pci_ep_basic.CONSECUTIVE_BAR_TEST
> ok 7 pci_ep_basic.CONSECUTIVE_BAR_TEST
> #  RUN           pci_ep_basic.LEGACY_IRQ_TEST ...
> # pci_endpoint_test.c:106:LEGACY_IRQ_TEST:Expected 0 (0) == ret (-110)
> # pci_endpoint_test.c:106:LEGACY_IRQ_TEST:Test failed for Legacy IRQ
> # LEGACY_IRQ_TEST: Test failed
> #          FAIL  pci_ep_basic.LEGACY_IRQ_TEST
> not ok 8 pci_ep_basic.LEGACY_IRQ_TEST
> #  RUN           pci_ep_basic.MSI_TEST ...
> # pci_endpoint_test.c:118:MSI_TEST:Expected 0 (0) == ret (-110)
> # pci_endpoint_test.c:118:MSI_TEST:Test failed for MSI1
> # pci_endpoint_test.c:118:MSI_TEST:Expected 0 (0) == ret (-110)
> # pci_endpoint_test.c:118:MSI_TEST:Test failed for MSI2
> # pci_endpoint_test.c:118:MSI_TEST:Expected 0 (0) == ret (-110)
> # pci_endpoint_test.c:118:MSI_TEST:Test failed for MSI3
> ...
> 
> 
> I think I know the reason.. you save the state before the IRQs have been allocated.
> 
> Perhaps we need to save the state after enabling IRQs?
> 
> I tried this patch on top of your patch:
> --- a/drivers/misc/pci_endpoint_test.c
> +++ b/drivers/misc/pci_endpoint_test.c
> @@ -851,6 +851,8 @@ static int pci_endpoint_test_set_irq(struct pci_endpoint_test *test,
>                 return ret;
>         }
>  
> +       pci_save_state(pdev);
> +
>         return 0;
>  }
> 
> 
> But still:
> # FAILED: 7 / 16 tests passed.
> 
> So... apparently that did not help...
> 
> I tried with the following change as well (on top of my patch above):
> 
> +static pci_ers_result_t pci_endpoint_test_slot_reset(struct pci_dev *pdev)
> +{
> +       struct pci_endpoint_test *test = pci_get_drvdata(pdev);
> +       int irq_type = test->irq_type;
> +
> +       pci_restore_state(pdev);
> +
> +       if (irq_type != PCITEST_IRQ_TYPE_UNDEFINED) {
> +               pci_endpoint_test_clear_irq(test);
> +               pci_endpoint_test_set_irq(test, irq_type);
> +       }
> +
> +       return PCI_ERS_RESULT_RECOVERED;
> +}
> 
> But still only:
> # FAILED: 7 / 16 tests passed.
> 
> Do you have any suggestions?
> 

I guess what is going wrong here is that you might be rebooting the device
*after* restoring the config space in 'slot_reset()' callback. So all the
previous config space contents would be lost and the device would've started
afresh.

I don't think we can restore the config space after rebooting the EP device,
because host has no idea about it. It can only restore the content after
recovering the device through platform specific means.

So I think you should just remove the PCI device from sysfs before rebooting and
rescan the bus. If your Root Port supports Data Link Layer interrupts such as
Link up/down, then you might get Hotplug MSIs which will take care of removing
the device and rescanning the bus again once it has rebooted.

The core idea behind this series is that to make the PCI bus useable on the host
after LDn and without rebooting. So if the device can recover with the help of
recovery steps carried out by the host, it should be in a useable state again.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

