Return-Path: <linux-arm-msm+bounces-78415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0381EBFE616
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 00:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA7A81A00A89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 22:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3DE30595B;
	Wed, 22 Oct 2025 22:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhK2UoMz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A35303A34;
	Wed, 22 Oct 2025 22:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761171042; cv=none; b=swGpLasv1TceUfGZ0cMsZZ1tAkq58pY8NjGLVIKRx2KxRC5h/DiOukaWs9qpb077marrzIQxFBTrkHuurXAdJL1qpoTGgc7sccGZbbYmAl0KgXSuYx8eJ+iq0+iDDsUW6PUddOhxz8bj+n7YJoiFym01e67kPPYQRQXTtMOnmMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761171042; c=relaxed/simple;
	bh=FhGqT6R33JooC0q8pWPEwTdXpzfVXS3oMbyo0IERYnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcLTSP5TsNX6fDsXszX2hh79ppZCb+gYTqhmtOur/2uyCIBawXySBPIeHXmA8Wfe9aoPQYUKHymSQk1qUL5VMOsb0Pi4Dk6DWWunmjOWsRiRi0P4UhiZrnTcS7nfoio5lF291SeanJiB2K5TrtcplWxPWU8NNKDJn790SBqT8Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhK2UoMz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A65C4CEE7;
	Wed, 22 Oct 2025 22:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761171042;
	bh=FhGqT6R33JooC0q8pWPEwTdXpzfVXS3oMbyo0IERYnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EhK2UoMzFgojhgijdVDg7eeZTrKq15pLS0iJQlGBQ1vGZw1+2car1srcDMcUKm+20
	 TnSN74ZyIhkbswE3UrSSNFvCLMb8Wa5+bdi9S2im2jsqzMlE/0dATJpc+wgotHH22F
	 DLTyKThbXRUx+yrQF8HS0ujwmysrQ37UI2mhJq4sbdw1cNoqZfGrUMXrw4WurjMgUQ
	 RuYzC9r6TUW7fS7mKV47rVMmY6408iOkDVHjR1zKMr8ZmGKwKUxkrzO3CtdtCa/nOl
	 UGaNX8k58RnRb/7se2u39YNS6l53WX2QCELWgKuc1dQMkue7Iib324M1jsu7dH1cHu
	 XVXwt6kZ/Lc0Q==
Date: Wed, 22 Oct 2025 17:13:04 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Deepak Kumar Singh <quic_deesin@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chris Lew <chris.lew@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] soc: qcom: smp2p: Add irqchip state support
Message-ID: <xfzzf3vebav3vhwe6n2vd6j2s3nhu2fgnoqkcalhrnhmi25wxw@zghvkcopsz54>
References: <20250923-smp2p-v1-0-2c045af73dac@oss.qualcomm.com>
 <20250923-smp2p-v1-1-2c045af73dac@oss.qualcomm.com>
 <15c56c70-928a-4939-86a2-e7b81f1596a6@oss.qualcomm.com>
 <c239bce2-4bef-4085-8a74-c6d7c863febf@quicinc.com>
 <344f0f72-27c5-4b88-99ee-f71065cc3a5f@oss.qualcomm.com>
 <f2a46da9-23f1-425e-8978-0fa412ed1dfa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2a46da9-23f1-425e-8978-0fa412ed1dfa@quicinc.com>

On Wed, Oct 22, 2025 at 04:27:28PM +0530, Deepak Kumar Singh wrote:
> 
> 
> On 10/21/2025 3:05 PM, Konrad Dybcio wrote:
> > On 10/21/25 10:12 AM, Deepak Kumar Singh wrote:
> > > 
> > > 
> > > On 9/24/2025 8:20 PM, Konrad Dybcio wrote:
> > > > On 9/24/25 6:18 AM, Jingyi Wang wrote:
> > > > > From: Chris Lew <chris.lew@oss.qualcomm.com>
> > > > > 
> > > > > A remoteproc booted during earlier boot stages such as UEFI or the
> > > > > bootloader, may need to be attached to without restarting the remoteproc
> > > > > hardware. To do this the remoteproc will need to check the ready and
> > > > > handover states in smp2p without an interrupt notification.
> > > > > 
> > > > > Add support for the .irq_get_irqchip_state callback so remoteproc can
> > > > > read the current state of the fatal, ready and handover bits.
> > > > > 
> > > > > Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
> > > > > Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/soc/qcom/smp2p.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
> > > > >    1 file changed, 55 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> > > > > index cb515c2340c1..e2cfd9ec8875 100644
> > > > > --- a/drivers/soc/qcom/smp2p.c
> > > > > +++ b/drivers/soc/qcom/smp2p.c
> > > > > @@ -222,6 +222,39 @@ static void qcom_smp2p_negotiate(struct qcom_smp2p *smp2p)
> > > > >        }
> > > > >    }
> > > > >    +static void qcom_smp2p_start_in(struct qcom_smp2p *smp2p)
> > > > > +{
> > > > > +    unsigned int smem_id = smp2p->smem_items[SMP2P_INBOUND];
> > > > > +    unsigned int pid = smp2p->remote_pid;
> > > > > +    char buf[SMP2P_MAX_ENTRY_NAME];
> > > > > +    struct smp2p_smem_item *in;
> > > > > +    struct smp2p_entry *entry;
> > > > > +    size_t size;
> > > > > +    int i;
> > > > > +
> > > > > +    in = qcom_smem_get(pid, smem_id, &size);
> > > > > +    if (IS_ERR(in))
> > > > > +        return;
> > > > > +
> > > > > +    smp2p->in = in;
> > > > > +
> > > > > +    /* Check if version is initialized and set to v2 */
> > > > > +    if (in->version == 0)
> > > > > +        return;
> > > > 
> > > > This doesn't seem to be fully in line with the comment
> > > > 
> > > > Konrad
> > > > 
> > > Hi Konard,
> > > 
> > > Can you please elaborate more on this?
> > > in->version == 0 means remote has not initialized the version yet, so no need of enumerating entries. For other case i.e in->version == 1 or 2, in entries added by early booted remote has to be enumerated.
> > 
> > It's not at all obvious that 0 is supposed to mean "uninitialized"
> > 
> > Please #define it
> > 
> > Konrad
> I think that can be added or instead we can replace (in->version == 0 )with
> (in->version != SMP2P_VERSION_2).
> 

I agree with Konrad regarding the discrepancy between comment and code,
"Initialized and set to 2" means specifically version 2, while checking
against 0 means "any of the remaining 255 possible values.

I don't think we need a define for the version number 2.


But we most definitely need a comment about why the remainder shouldn't
be executed for all other (initialized) versions. Today, specifically,
why isn't this code valid for version 1?

Regards,
Bjorn

