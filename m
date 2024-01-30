Return-Path: <linux-arm-msm+bounces-9104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DDB842F73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 23:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E911DB237D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 22:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4967D414;
	Tue, 30 Jan 2024 22:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DLYKVGPw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46317D409
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 22:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706652946; cv=none; b=Zyr4fhI29n+63GhzRZbUeXWKAKAjny9jx6sXLdcjO04z3H14PVW+/Yf0PfzvTEp47nA8qovP+BIIWKsraloE4pXRZeFbgwRa1uFX5KDSmIfGBw8eGxs6NS/2QdDfkvvrBDXvFWTJRzpaL9AuQNjM/xMiLuHRKOwGJGIciMXrhXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706652946; c=relaxed/simple;
	bh=p5XT6Nu5EoivBXhR3C7wW8pO0ajuHoZHPFfjAWz9Y4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYHLBycL1YeHWRnElg8L35mPuiDfep0V2e/TPAR48cIg1jTtSwrpmQvZc8xfYb+wPtWzij6v5fKqtIReOpobh8n34HZie8JG5z/QOuzqfSQuaAsGH/dCY/q8Fo6UOaK3UAkgpvepHhYzDQsgHitsDiR61nqVl6vvXGuC+4bPMPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DLYKVGPw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706652943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7OBLocajFnxfsUX6y3IeQvRjDnwJRDZ13qL3o2UwSYA=;
	b=DLYKVGPw5SL+pWj/KKOKkPypUdFgF/4YOAGOEAvm2FVMPQ6jEOi2ova0We34NeP3hoBJc/
	8xI4MmG+cVJ2DPH+dWxZjF3KkoKBg5XlXR5XiYecOXVZmVMjHtSZ3Xq5RCu5sYmA91OCNq
	xmx8ZNI8VtISXG5+o+DxvoE7j2/60YU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-60e5JGhKO8CCss991TVBFQ-1; Tue, 30 Jan 2024 17:15:42 -0500
X-MC-Unique: 60e5JGhKO8CCss991TVBFQ-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-42a1ca15f88so78320651cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 14:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706652941; x=1707257741;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7OBLocajFnxfsUX6y3IeQvRjDnwJRDZ13qL3o2UwSYA=;
        b=G3NwToyZ1RNmd4RmhL96goSubHdtnHSxuHTYGOxqw/ikq0zmpR8Q1TSOFec8V1iD3k
         tkxrG1FCpqOb6bIStpCyjztiRGWlH2Z1stc3SG8wL0y99MCI+/HwfONR2gCB/IVkXtel
         zlQZb6JP6maJI77qANH32mXPUJ0qzXeub+h6+xals4nZV/h4IXqmmQsE2ExUvg8yjsCr
         NoOQxFIL8oQo/bBAd4m04hCAnazJ4ObOMkDLur08y4xLwxDkqcoC1+2by1GgrQ/qyO8W
         WxF/mEr8yfiqp2DCPTRYWq6zCh+o7oJ/ydDGGWH5seR8jzV/Ph35cvDhyaNt9Tqj5IQH
         I7nA==
X-Gm-Message-State: AOJu0YwH1zbO4s1Cjbla+ebeq2XBcZEMNWNIppfEkIJpB2d+cpGdK+cb
	GCX+fvaDB7dG0IA7aMeUuKiZ9oa5bBwuEgkviMb1XxU+TKcHNFNYZbKsiJDNa84gQV7irAejRXP
	7JZ0sTQHdNZhHr3WoiDa1ub5wdzHcKyzPErU3wv31AAgeCxLPVo4qLCDLjsyPfEorVRYPLFw=
X-Received: by 2002:ac8:5704:0:b0:42b:e3f8:59b1 with SMTP id 4-20020ac85704000000b0042be3f859b1mr9679qtw.7.1706652940886;
        Tue, 30 Jan 2024 14:15:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRFj9SRA43tibDOgbc8/Ff1PMq3IJRrHrv4p3cCJNa2EcqIj2pBgxuENh8xi82gzxQihGkEQ==
X-Received: by 2002:ac8:5704:0:b0:42b:e3f8:59b1 with SMTP id 4-20020ac85704000000b0042be3f859b1mr9662qtw.7.1706652940625;
        Tue, 30 Jan 2024 14:15:40 -0800 (PST)
Received: from fedora ([142.189.203.219])
        by smtp.gmail.com with ESMTPSA id d7-20020a05620a166700b00783da2644besm3956478qko.136.2024.01.30.14.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 14:15:40 -0800 (PST)
Date: Tue, 30 Jan 2024 17:15:38 -0500
From: Lucas Karpinski <lkarpins@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v2] arm64: dts: qcom: sa8540p-ride: disable pcie2a
 node
Message-ID: <u3jekcxdu55zs4tq6mljcdgsvanuhj5dydew2swiidj3wkf764@twbz27a3fexp>
References: <qcoqksikfvdqxk6stezbzc7l2br37ccgqswztzqejmhrkhbrwt@ta4npsm35mqk>
 <mfdvit7jgr53qlhuedkrq6mtgjjmgfoejsuh6pgy6gusqq7vxq@rkufgqtht2ve>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mfdvit7jgr53qlhuedkrq6mtgjjmgfoejsuh6pgy6gusqq7vxq@rkufgqtht2ve>
User-Agent: NeoMutt/20231221

> Why are there interrupt storms? What interrupt(s) is(are) involved?
In the earlier link that Andrew mentioned, the DesignWare PCIe driver
uses a chained interrupt to demultiplex the downstream MSI interrupts.
This meant we couldn't identify the MSI interrupt source, so it is not
clear what is causing the hw to misbehave the way that it is.
                                                   
> Do you consider this a temporary fix?            
This will likely be a permanent fix. Qualcomm disabled pcie2a in their 
downstream kernel as well, quite some time ago, so this may never be 
actually fixed.
                                                   
> Are you okay with pcie3a misbehaving?            
Yes, it would be great of the underlying issue was addressed, but at 
least the boards are usable with just pcie3a enabled and the nic will be 
available.      
                                                   
Lucas  

 
> > Signed-off-by: Lucas Karpinski <lkarpins@redhat.com>
> > ---
> > v2:
> > - don't remove the entire pcie2a node, just set status to disabled.
> > - update commit message.
> > 
> >  arch/arm64/boot/dts/qcom/sa8540p-ride.dts | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > index b04f72ec097c..177b9dad6ff7 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > +++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
> > @@ -376,14 +376,14 @@ &pcie2a {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pcie2a_default>;
> >  
> > -	status = "okay";
> > +	status = "disabled";
> >  };
> >  
> >  &pcie2a_phy {
> >  	vdda-phy-supply = <&vreg_l11a>;
> >  	vdda-pll-supply = <&vreg_l3a>;
> >  
> > -	status = "okay";
> > +	status = "disabled";
> >  };
> >  
> >  &pcie3a {
> > -- 
> > 2.43.0
> > 
> 


