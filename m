Return-Path: <linux-arm-msm+bounces-6844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C051829100
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 00:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DF4E1C2514E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 23:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919C73E47A;
	Tue,  9 Jan 2024 23:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CRmQFLZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA21364B5
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 23:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704843954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rOO3UIEaa1DOmRPFzE+OZTgeyQIQE8df8WwuPyKWrNo=;
	b=CRmQFLZLlzpkvXpsbnTECO3Q8UFtLUwyuk/1fD0MneZAdmIjaXMhDyeyijKJxEt5i1b0Ja
	Us2cG7lh5xJPAQXu/aQSzzS7P7FRwyTnplsqURj8MMbzDxnouSVzrWkqbdyi6hcNXSbaPN
	8R75h05OUqVF+I7FQtokEcTXb6tR7WI=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-vzOsbb_4OnCJXsd20ZQGsg-1; Tue, 09 Jan 2024 18:45:53 -0500
X-MC-Unique: vzOsbb_4OnCJXsd20ZQGsg-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-5f6f51cd7e8so46576957b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jan 2024 15:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704843953; x=1705448753;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOO3UIEaa1DOmRPFzE+OZTgeyQIQE8df8WwuPyKWrNo=;
        b=KOi0+WCN+Ej5RL+lo0MIj/v7dntNMxeW3wvp/o/RlCOABsJeVm0SGePoVH/rb7uZ+i
         5paoI+g1DNQswvnB5Soyvw97XNWyD0ratNHMTgCQhSi6yDeEn6VZav5L6RYgKR+7DDdD
         43MjZT2QnHfY7MoQcNbsOdNEFERAnRiWHjRrBBuhkz/u2vPla5ibRwO0/2iyJsLA+NUq
         sWpw07B7HpLXA5T2JMncTpG2NP/05+IIsgegYNNPeOL5yCbqBvIzLhc7HU5ZzJ9CYn5H
         akkS3mIpvc8nC4qjzttv1IeeyRlFnNjmo+o0C/OttIrTI73kq/qIaucqy58RtmTybUnZ
         oEVA==
X-Gm-Message-State: AOJu0YxrBrMXDeUviiQuZAxW/WQdm09zZhZGF6LIcQytdI4+lIRIhav1
	RrxTek2rUQo81yPYPxXYigf8b2L35r+KNTVlabYTgujeYXybMwNTNPaLNS4a0fG7bTPQqC/v833
	atsl4GGJJr04ceuDhdDl7zz6WiVKkA0I13g==
X-Received: by 2002:a0d:dac6:0:b0:5ef:d5e2:eae2 with SMTP id c189-20020a0ddac6000000b005efd5e2eae2mr336622ywe.21.1704843953050;
        Tue, 09 Jan 2024 15:45:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0YPNLaZINGtIvV1zfFEAX0fK9AacresZK3FYnQ1Qy1KbgWQkBAoGIbVtFC75on/+3oYUEvg==
X-Received: by 2002:a0d:dac6:0:b0:5ef:d5e2:eae2 with SMTP id c189-20020a0ddac6000000b005efd5e2eae2mr336617ywe.21.1704843952788;
        Tue, 09 Jan 2024 15:45:52 -0800 (PST)
Received: from x1 ([2600:381:b81a:c842:2a5f:92bb:b82c:e934])
        by smtp.gmail.com with ESMTPSA id x6-20020a0dee06000000b005cb1bf4d466sm1136570ywe.82.2024.01.09.15.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 15:45:52 -0800 (PST)
Date: Tue, 9 Jan 2024 18:45:49 -0500
From: Brian Masney <bmasney@redhat.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Shazad Hussain <quic_shazhuss@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Eric Chanudet <echanude@redhat.com>,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: sa8755p ufs ice bug: gcc_ufs_phy_ice_core_clk status stuck at
 'off'
Message-ID: <ZZ3arUiD95zlVayx@x1>
References: <ZZYTYsaNUuWQg3tR@x1>
 <49d85352-d022-4b59-a3f2-d8f7ef3028ac@quicinc.com>
 <ZZxgCKQmQdUL81pX@x1>
 <d9335515-157b-4b6a-ba41-c31ca76362ee@quicinc.com>
 <ZZ2-P1xzsDwk91Yq@x1>
 <37ff80b1-62fa-45ce-b181-955cc887d47d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37ff80b1-62fa-45ce-b181-955cc887d47d@quicinc.com>
User-Agent: Mutt/2.2.10 (2023-03-25)

On Tue, Jan 09, 2024 at 01:56:30PM -0800, Elliot Berman wrote:
> 
> 
> On 1/9/2024 1:44 PM, Brian Masney wrote:
> > On Mon, Jan 08, 2024 at 03:35:55PM -0800, Elliot Berman wrote:
> >> On 1/8/2024 12:50 PM, Brian Masney wrote:
> >>> On Mon, Jan 08, 2024 at 11:44:35PM +0530, Shazad Hussain wrote:
> >>>> I can see that gcc_ufs_phy_ice_core_clk needs the gcc_ufs_phy_gdsc to be
> >>>> enabled before this particular clk is enabled. But that required
> >>>> power-domain I do not see in the ice DT node. That can cause this
> >>>> problem.
> >>>
> >>> Thank you! I'll work on and post a patch set as I find free time over
> >>> the next week or two.
> >> I think I observe the same issue on sm8650. Symptoms seem to be same as
> >> you've described. I'll test out the following diff and see if things
> >> seem more reliable:
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >> index fd4f9dac48a3..c9ea50834dc9 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> >> @@ -2526,6 +2526,7 @@ ice: crypto@1d88000 {
> >>                                      "qcom,inline-crypto-engine";
> >>                         reg = <0 0x01d88000 0 0x8000>;
> >>  
> >> +                       power-domains = <&gcc UFS_PHY_GDSC>;
> >>                         clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> >>                 };
> >>  
> >>
> >> If yes, I can post a patch for sm8650 if no else has yet.
> > 
> > The intermittent boot issue is still present against
> > linux-next-20240109 with the following patch:
> > 
> > --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > @@ -1556,6 +1556,7 @@ ice: crypto@1d88000 {
> >                         compatible = "qcom,sa8775p-inline-crypto-engine",
> >                                      "qcom,inline-crypto-engine";
> >                         reg = <0x0 0x01d88000 0x0 0x8000>;
> > +                       power-domains = <&gcc UFS_PHY_GDSC>;
> >                         clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
> >                 };
> > 
> 
> Things have been a bit more reliable for me after adding the power-domains.
> 
> Are you getting stuck at the same spot or somewhere else?
> 
> I've been looking at a similar issue to [1], so I wonder if maybe you're
> facing that instead.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20240104101735.48694-1-laura.nao@collabora.com/T/#m39f7c80b59c750ee4c0082474c5c15b6055927ef

So it could be that issue that I'm also encountering. Previously I
could configure a timeout on dracut and it would drop me to a shell
when the system failed to boot. That's how I was able to get the
dmesg for the ice error. However, dracut did not always time out, and
when that happened the system wouldn't respond over the serial console.

Now the boot still hangs for me about 50% of the time, however I have
not been able to get dracut to time out after probably 20 reboots. I
have magic sysrq enabled in my kernel, however I haven't been able to
get it to trigger when going through Beaker. Let me ask internally about
sysrq to see if I can get an interesting stack dump.

If I boot with the standard verbose logging, then the race condition
doesn't occur and -next boots fine for me.

Brian


