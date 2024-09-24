Return-Path: <linux-arm-msm+bounces-32324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CA79849C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 18:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21DAE1C22D8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 16:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379031AB6F3;
	Tue, 24 Sep 2024 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G/0Gxoly"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AA01AAE16
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727195777; cv=none; b=QQIRXKYX7yO26U5mVB3pemG2t9yDXuShM5sSSt50lN4WvLcKBuw0OQpb3I3ODffw5Q7+/oisWnooX7knOSKcbsiXP8n44aqPyilDeOYZ5vD9cBf5MpOo6Ede740OPECHslWQdcaAMzaWWUgrJFLqDML9goLJBwMRfGeyQCV1ho8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727195777; c=relaxed/simple;
	bh=yOKDWrqMHDZcNXDx65GPLsC6nCA8U/1FHB/wST6tcQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7eom/mSVBEVL+szw8VPaylQE7tEO3ppkumYnJW0YFMl7ETzC+r5Q825KWeZCGaDOqNQWeAiQxD8XkRcuN3Sj27vwBmUEQuGOpSoPQy4kwBnI5VoVZqaScAo2R6pz5Hc3i9Z7/uFMDvXZhNS7iG6h11irI6XEVCLDym/Q4Z5xBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G/0Gxoly; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727195774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XJe4D9rQuQ5l/vjHLU/ym5f3xPtTEEP3VLGt0qBDp8w=;
	b=G/0GxolyNTqAtn1VQwocAa/SvpnMZjK3nxcLS91d7RPwOeYC4WlHYEqwILc+2uNDO+TH9G
	zn23S0llbkc9Bq407BIcoUaZH29oYB9+zdPJyWhcjXRq+jfsMpQyavulbGaDwxLqmrBMev
	lvyyqbK6BLZdvaLhbR4uN1cModsLdfw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-PFZ8m6iFPdaxjKik8b3fDg-1; Tue, 24 Sep 2024 12:36:13 -0400
X-MC-Unique: PFZ8m6iFPdaxjKik8b3fDg-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6c3643faf9dso99761386d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 09:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727195772; x=1727800572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJe4D9rQuQ5l/vjHLU/ym5f3xPtTEEP3VLGt0qBDp8w=;
        b=fW2uoICQqwzfgp0d0wvBRlZ+kmzZjBp35C3AJit3EStMHNd2wcVHyd34ONls6M+ywS
         NRH0RTagfsO4YhXqSJip9mTFETFxocVG/yztSGCCwP8f8kfN0cXvfYRvPSRFQDjbhlSl
         43H3gYwo8qj3D54vRAxleQe3T36GAjgpf0Ot80SVmk3p071cBiFHY38Ww90rlZwcTCD4
         j5/FgQN2jEuxzYs3SGwTkx6cVY4fOKfpRbTU/8GOKQN4VYyGzyOc3uYdBkcoChGVjz4R
         ViI0g+4uakaLdctYmIoaQYYHw8fpTOXyP3I7HrolM6lVUmgCwl9tAM39VHPAMOsLqt2f
         0AMg==
X-Forwarded-Encrypted: i=1; AJvYcCWHvGR/54TLfzlwx56x4DCqRrpbfe3s6gDPZybTKcwAgKzC1z1xYsHJy4zWS1D54+I2NJrNALrXuSJPbvjp@vger.kernel.org
X-Gm-Message-State: AOJu0YwgNzIwrasE0uS77aU1sgc7Q/L7qM7NaAmCilE43jewsruiZaAJ
	uthVYdwzvay1EgzwagKxHyJxAh7HrX+6iEoCQrwuXzdQkZQxYydhFMjWLxuXSSbbVfrVMxyWHRh
	k2ZSP0wMl8f6h4tFA8JDiJ+P3WH9hcUnlwbe0wKA3kcCRYfY2qx17Lzm0M/hLqLU=
X-Received: by 2002:a05:6214:33c7:b0:6c3:665e:a1fa with SMTP id 6a1803df08f44-6c7bd4cf316mr310754896d6.11.1727195772538;
        Tue, 24 Sep 2024 09:36:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGew2zuZt9ZSk16pZrqHOtQorzrABia/GALgdjyGkoRh1si8Hxu4SKK/UToMXIaBARoadMnVw==
X-Received: by 2002:a05:6214:33c7:b0:6c3:665e:a1fa with SMTP id 6a1803df08f44-6c7bd4cf316mr310754546d6.11.1727195772191;
        Tue, 24 Sep 2024 09:36:12 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::40])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb0f4e05c2sm7897726d6.60.2024.09.24.09.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 09:36:11 -0700 (PDT)
Date: Tue, 24 Sep 2024 11:36:09 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Sarosh Hasan <quic_sarohasa@quicinc.com>
Cc: Suraj Jaiswal <jsuraj@qti.qualcomm.com>, 
	"Suraj Jaiswal (QUIC)" <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	"bhupesh.sharma@linaro.org" <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, Prasad Sodagudi <psodagud@quicinc.com>, 
	Rob Herring <robh@kernel.org>, kernel <kernel@quicinc.com>
Subject: Re: [PATCH net] net: stmmac: Stop using a single dma_map() for
 multiple descriptors
Message-ID: <gbia6rqppcc53vmel5q5jvgdri3cmeowb64mxfk7jzo6ncuz2f@6kd7acqii62x>
References: <20240902095436.3756093-1-quic_jsuraj@quicinc.com>
 <yy2prsz3tjqwjwxgsrumt3qt2d62gdvjwqsti3favtfmf7m5qs@eychxx5qz25f>
 <CYYPR02MB9788F524C9A5B3471871E055E79A2@CYYPR02MB9788.namprd02.prod.outlook.com>
 <ypfbzhjyqqwwzciifkwvhimrolg6haiysqmxamkhnryez4npxx@l4blfw43sxgt>
 <05909d17-0111-4080-97cc-82ed435728a7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05909d17-0111-4080-97cc-82ed435728a7@quicinc.com>

On Tue, Sep 24, 2024 at 04:36:59PM GMT, Sarosh Hasan wrote:
> 
> 
> On 9/10/2024 7:34 PM, Andrew Halaney wrote:
> > Hey Suraj,
> > 
> > Your email client didn't seem to quote my response in your latest reply,
> > so its difficult to figure out what you're writing vs me below. It also
> > seems to have messed with the line breaks so I'm manually redoing those.
> > 
> > Please see if you can figure out how to make that happen for further
> > replies!
> > 
> > More comments below...
> > 
> > On Tue, Sep 10, 2024 at 12:47:08PM GMT, Suraj Jaiswal wrote:
> >>
> >>
> >> -----Original Message-----
> >> From: Andrew Halaney <ahalaney@redhat.com> 
> >> Sent: Wednesday, September 4, 2024 3:47 AM
> >> To: Suraj Jaiswal (QUIC) <quic_jsuraj@quicinc.com>
> >> Cc: Vinod Koul <vkoul@kernel.org>; bhupesh.sharma@linaro.org; Andy Gross <agross@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Konrad Dybcio <konrad.dybcio@linaro.org>; David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>; Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>; Maxime Coquelin <mcoquelin.stm32@gmail.com>; netdev@vger.kernel.org; linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; Prasad Sodagudi <psodagud@quicinc.com>; Rob Herring <robh@kernel.org>; kernel <kernel@quicinc.com>
> >> Subject: Re: [PATCH net] net: stmmac: Stop using a single dma_map() for multiple descriptors
> >>
> >> WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
> >>
> >> On Mon, Sep 02, 2024 at 03:24:36PM GMT, Suraj Jaiswal wrote:
> >>> Currently same page address is shared
> >>> between multiple buffer addresses and causing smmu fault for other 
> >>> descriptor if address hold by one descriptor got cleaned.
> >>> Allocate separate buffer address for each descriptor for TSO path so 
> >>> that if one descriptor cleared it should not clean other descriptor 
> >>> address.
> > 
> > snip...
> > 
> >>>
> >>>  static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int 
> >>> queue) @@ -4351,25 +4380,17 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
> >>>               pay_len = 0;
> >>>       }
> >>>
> >>> -     stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
> >>> +     if (stmmac_tso_allocator(priv, (skb->data + proto_hdr_len),
> >>> +                              tmp_pay_len, nfrags == 0, queue, false))
> >>> +             goto dma_map_err;
> >>
> >> Changing the second argument here is subtly changing the dma_cap.addr64 <= 32
> >> case right before this. Is that intentional?
> >>
> >> i.e., prior, pretend des = 0 (side note but des is a very confusing variable
> >> name for "dma address" when there's also mentions of desc meaning "descriptor"
> >> in the DMA ring). In the <= 32 case, we'd call stmmac_tso_allocator(priv, 0)
> >> and in the else case we'd call stmmac_tso_allocator(priv, 0 + proto_hdr_len).
> >>
> >> With this change in both cases its called with the (not-yet-dma-mapped)
> >> skb->data + proto_hdr_len always (i.e. like the else case).
> >>
> >> Honestly, the <= 32 case reads weird to me without this patch. It seems some
> >> of the buffer is filled but des is not properly incremented?
> >>
> >> I don't know how this hardware is supposed to be programmed (no databook
> >> access) but that seems fishy (and like a separate bug, which would be nice to
> >> squash if so in its own patch). Would you be able to explain the logic there
> >> to me if it does make sense to you?
> >>
> > 
> >> <Suraj> des can not be 0 . des 0 means dma_map_single() failed and it will return.
> >> If we see if des calculation (first->des1 = cpu_to_le32(des + proto_hdr_len);)
> >> and else case des calculator ( des += proto_hdr_len;) it is adding proto_hdr_len
> >> to the memory that we after mapping skb->data using dma_map_single.
> >> Same way we added proto_hdr_len in second argument . 
> > 
> > 
> > 0 was just an example, and a confusing one, sorry. Let me paste the original
> > fishy code that I think you've modified the behavior for. Here's the
> > original:
> > 
> > 	if (priv->dma_cap.addr64 <= 32) {
> > 		first->des0 = cpu_to_le32(des);
> > 
> > 		/* Fill start of payload in buff2 of first descriptor */
> > 		if (pay_len)
> > 			first->des1 = cpu_to_le32(des + proto_hdr_len);
> > 
> > 		/* If needed take extra descriptors to fill the remaining payload */
> > 		tmp_pay_len = pay_len - TSO_MAX_BUFF_SIZE;
> > 	} else {
> > 		stmmac_set_desc_addr(priv, first, des);
> > 		tmp_pay_len = pay_len;
> > 		des += proto_hdr_len;
> > 		pay_len = 0;
> > 	}
> > 
> > 	stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
> > 
> > Imagine the <= 32 case. Let's say des is address 0 (just for simplicity
> > sake, let's assume that's valid). That means:
> > 
> >     first->des0 = des;
> >     first->des1 = des + proto_hdr_len;
> >     stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue)
> > 
> >     if des is 0, proto_hdr_len is 64, then that means
> > 
> >     first->des0 = 0
> >     first->des1 = 64
> >     stmmac_tso_allocator(priv, 0, tmp_pay_len, (nfrags == 0), queue)
> > 
> > That seems fishy to me. We setup up the first descriptor with the
> > beginning of des, and then the code goes and sets up more descriptors
> > (stmmac_tso_allocator()) starting with the same des again?
> tso_alloc is checking if more descriptor needed for packet . it is adding offset to get next
> descriptor (curr_addr = des + (total_len - tmp_len)) and storing in des of next descriptor.

Yes, so in stmmac_tso_allocator() we currently have:

	static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
					 int total_len, bool last_segment, u32 queue)
	{
		struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
		struct dma_desc *desc;
		u32 buff_size;
		int tmp_len;

		tmp_len = total_len;

		while (tmp_len > 0) {
			dma_addr_t curr_addr;

			tx_q->cur_tx = STMMAC_GET_ENTRY(tx_q->cur_tx,
							priv->dma_conf.dma_tx_size);
			...
			curr_addr = des + (total_len - tmp_len);
			if (priv->dma_cap.addr64 <= 32)
				desc->des0 = cpu_to_le32(curr_addr);

so on the first loop you've got:
	tmp_len = total_len
	...
	curr_addr = des + total_len - temp_len
	i.e.
	curr_addr = des
meaning with the "first" handling I've highlighted we've got
	first->des0 = des
	"next"->des0 = des

where "next" is the cur_tx descriptor in the first loop of
stmmac_tso_allocator() (essentially the second descriptor).
That seems broken to me, and was that way prior to this patch.

You've modified the behavior in this patch unintentionally. I think it
needs modifying, but it should be done so explicitly in its own patch
prior to this one. I also think the current modification in this patch
isn't a fix. See prior reply below where I highlighted the programming as I
understand it with this patch applied, which would result in something
like.

first->des0 = des
first->des1 = des + proto_hdr_len
"next"->des0 = des + proto_hdr_len

Which again seems wrong, two descriptors pointing to the same address
isn't making sense to me.

Sorry to sound like a broken record, but I want to make sure we're on
the same page! Sounds like you're looking into it based on the below
comment, but some of these comments here made me think I didn't explain
the situation well enough.

> > 
> > Should we be adding the payload length (TSO_MAX_BUFF_SIZE I suppose
> > based on the tmp_pay_len = pay_len - TSO_MAX_BUFFSIZE above)? It seems
> > that <= 32 results in duplicate data in both the "first" descriptor
> > programmed above, and in the "second" descriptor programmed in
> > stmmac_tso_allocator().
> curr_addr = des + (total_len - tmp_len) is used in while loop in  tso_alloc to get address of all required descriptor . 
> descriptor address will be updated finally in tso_alloc by below call .
>  
> if (priv->dma_cap.addr64 <= 32)
>                                                desc->des0 = cpu_to_le32(curr_addr);
>                                else
>                                                stmmac_set_desc_addr(priv, desc, curr_addr);
> 
>  Also, since tmp_pay_len is decremented, but des
> > isn't, it seems that stmmac_tso_allocator() would not put all of the
> > buffer in the descriptors and would leave the last TSO_MAX_BUFF_SIZE
> > bytes out?
> > 
> > I highlight all of this because with your change here we get the
> > following now in the <= 32 case:
> > 
> >     first->des0 = des
> >     first->des1 = des + proto_hdr_len
> >     stmmac_tso_allocator(priv, des + proto_hdr_len, ...)
> > 
> > which is a subtle change in the call to stmmac_tso_allocator, meaning
> > a subtle change in the descriptor programming.
> > 
> > Both seem wrong for the <= 32 case, but I'm "reading between the lines"
> > with how these descriptors are programmed (I don't have the docs to back
> > this up, I'm inferring from the code). It seems to me that in the <= 32
> > case we should have:
> > 
> >     first->des0 = des
> >     first->des1 = des + proto_hdr_len
> >     stmmac_tso_allocator(priv, des + TSO_MAX_BUF_SIZE, ...)
> 
> let me check <=32 case only on setup and get back.
> > 
> > or similar depending on if that really makes sense with how des0/des1 is
> > used (the handling is different in stmmac_tso_allocator() for <= 32,
> > only des0 is used so I'm having a tough time figuring out how much of
> > the des is actually programmed in des0 + des1 above without knowing the
> > hardware better).
> > 
> > Does that make sense? The prior code seems fishy to me, your change
> > seems to unintentionally change that fhsy part, but it still seems fishy
> > to me. I don't think you should be changing that code's behavior in that
> > patch, if you think it's right then we should continue with the current
> > behavior prior to your patch, and if you think its wrong we should
> > probably fix that *prior* to this patch in your series.
> > 
> > Thanks,
> > Andrew
> > 
> 


