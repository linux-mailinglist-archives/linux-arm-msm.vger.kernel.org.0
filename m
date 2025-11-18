Return-Path: <linux-arm-msm+bounces-82363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F36C6A6BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E049034CDFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4C6368287;
	Tue, 18 Nov 2025 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k5pjPCDm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C013A36828F;
	Tue, 18 Nov 2025 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480883; cv=none; b=j0mp5Et8s8q1nAWW1K/HRdjVKd/v8ysC1YIk4d1lwDgWoTYOK3X0vpNBkfHRaV5/rlCIkXUgK2LnljXdbuUQkIFh/6qv6NmTUxN7pIlrA6Oq8s8RCGyidg6MrDFl1GqvYsD75PWdjH1lzrlv5adxUZEhlzDZ6asQu/eGU1UMm6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480883; c=relaxed/simple;
	bh=ftZPrL7pkqvYgzApMIEmVisxDVAsYx0F5C0VOMSH8Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8EYfMzOWzhdgVI28QvMy8XlhBejiLliwwTmHJ8OHXuJXp3VOCzB8tZaqaC+8Lu+JrHN8o+5r6XDyynmUe5aqZVPn5brmAy6rOswLtEyVsxU5LpPHD4r/ZDPRTdd965E0NoR9OP9rdGO1sd6oiGROzsd2h9cLMe3jiGhWbTeU6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k5pjPCDm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED5DC4AF0C;
	Tue, 18 Nov 2025 15:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763480882;
	bh=ftZPrL7pkqvYgzApMIEmVisxDVAsYx0F5C0VOMSH8Uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k5pjPCDmvhAAn2oD9/OV0u6iLC0wJSXclH9vdGlaSAM+UfJxYDhpzeScPhOK42i5a
	 novsxhH4WsGPI03LBveRVb7SU1HdfjfUyPCKxB2wPSW2SnVZAadV1fN3ytqp24ezF8
	 gGKajyIDUkQmuc7r+OHkA700Bva3XuF2atYlX8MNRmtRxN8sU7/WKvQHUx6j3eCrIs
	 D9SjRUcUqkSOBJisCQ6Hz+QHTrZ1Mf1srHA9CTSq2c8ybWCR0jgKKvQwGtwXCINSU4
	 AyMM8+k847N3VhhKl9DRi1Bpv9L87t3x4tqDp5EMhbHmXXrGOkZA5HVXb+4tYKh55J
	 ziWLY/7RtV2aA==
Date: Tue, 18 Nov 2025 09:52:49 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com, 
	arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
	ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com, 
	aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v3 3/4] misc: fastrpc: Add support for new DSP IOVA
 formatting
Message-ID: <yucfjksc5w2eac6fmsamknjhbwebxg7xsz6633vs2rw3qt4kfa@w2wsbfvszhb7>
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-4-kumari.pallavi@oss.qualcomm.com>
 <di5fqyh4uygb72xov6zqvg2i2ujlllrnnzlsphlzvghgttdqpe@u6uwwa4rxiow>
 <8c59e08a-99cb-473b-999c-e7d08bc2124b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c59e08a-99cb-473b-999c-e7d08bc2124b@oss.qualcomm.com>

On Mon, Nov 17, 2025 at 12:32:59PM +0530, Kumari Pallavi wrote:
> 
> 
> On 11/14/2025 9:21 PM, Bjorn Andersson wrote:
> > On Fri, Nov 14, 2025 at 02:11:41PM +0530, Kumari Pallavi wrote:
> > > Implement the new IOVA formatting required by the DSP architecture change
> > > on Kaanapali SoC. Place the SID for DSP DMA transactions at bit 56 in the
> > > physical address. This placement is necessary for the DSPs to correctly
> > > identify streams and operate as intended.
> > > To address this, set SID position to bit 56 via OF matching on the fastrpc
> > > node; otherwise, default to legacy 32-bit placement.
> > > This change ensures consistent SID placement across DSPs.
> > > 
> > 
> > In patch 2 I said I think it would be a good idea to separate the two
> > perspectives (Linux/SMMU vs remote addresses).
> > 
> > Looking ta this patch I'm completely convinced that it's the right thing
> > to do!
> > 
> > > Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 46 +++++++++++++++++++++++++++++++++++-------
> > >   1 file changed, 39 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index d6a7960fe716..bcf3c7f8d3e9 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -33,7 +33,6 @@
> > >   #define FASTRPC_ALIGN		128
> > >   #define FASTRPC_MAX_FDLIST	16
> > >   #define FASTRPC_MAX_CRCLIST	64
> > > -#define FASTRPC_PHYS(p)	((p) & 0xffffffff)
> > >   #define FASTRPC_CTX_MAX (256)
> > >   #define FASTRPC_INIT_HANDLE	1
> > >   #define FASTRPC_DSP_UTILITIES_HANDLE	2
> > > @@ -105,6 +104,15 @@
> > >   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
> > > +/* Extract smmu pa from consolidated iova */
> > > +#define IPA_TO_DMA_ADDR(iova, sid_pos) (iova & ((1ULL << sid_pos) - 1ULL))
> > > +/*
> > > + * Prepare the consolidated iova to send to dsp by prepending the sid
> > > + * to smmu pa at the appropriate position
> > > + */
> > > +#define IOVA_FROM_SID_PA(sid, phys, sid_pos) \
> > > +       (phys += sid << sid_pos)
> > 
> > This is a horrible macro. It looks just like a function taking values,
> > it's named to sound like it takes a sid and pa and return an iova, but
> > it has side effects.
> > 
> > And what's up with the ordering? Take argument 1 and 3, and put the
> > result in argument 2?!
> > 
> 
> Thank you for the feedback regarding the macro implementation. I understand
> your concern about readability and hidden side effects.
> To address this, I’ve replaced the macro with an inline function
> 
> 
> static inline u64 fastrpc_compute_sid_offset(u64 sid, u32 sid_pos)
> {
>     return sid << sid_pos;
> }
> 
> 
> buf->dma_addr += fastrpc_compute_sid_offset(sid, sid_pos);
> 
> Could you confirm if this is in line with what you suggested?
> 

That is possible to read, so yes that would be much better. 

Regards,
Bjorn

