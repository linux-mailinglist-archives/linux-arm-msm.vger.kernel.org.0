Return-Path: <linux-arm-msm+bounces-114533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t2ZeBWcsPWrWyQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:25:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A486C61F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 15:25:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=HHQfHeXL;
	dkim=pass header.d=redhat.com header.s=google header.b=YjwiGejQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114533-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114533-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D04D73016ED3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1F4326924;
	Thu, 25 Jun 2026 13:25:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC73264E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 13:25:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782393932; cv=none; b=hMbNcpA4vsOOynfek52wZoVsU9BOGfNkTQ/Kgex7s9srJT98P8CkGnj+MQqwBbkaZxRPCXFDUVgfWGXaVAuKO/bg4w+HlGVzsSKwdGlRV1KX6yvJIiH4GNVIQJSAtggAK4x1MUO9xPI+SozQUsV0xoRSwx/1JRHxMAAURsNtlwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782393932; c=relaxed/simple;
	bh=CuJ0BugtLYxwc1oJUnknpEje0INE4USJkZ2gvWfu+d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjFnKMlPw/hS2jXx1ETeuKCwrRWSFvTxTUUtVyNaN9LlyrkGmptunNjzZeux8XsmIiirMbMGjBuxyIBQR/86NHQGEn0VPGsBfDVmAeACbjpHHztcKb1OJsj6Iqz34dn4agKd6mVD4tyTlLC+s0lSZsjW1XImlCpsg81LNfJDg/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HHQfHeXL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YjwiGejQ; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782393930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1O7Yij0Kw0ewgtwKjx6DJe41xbKPrRcBzrJalpv0Dok=;
	b=HHQfHeXLqlHjEliwt0tF3Ga0Vu8LFq5+NJxAoknMYwHJdemDwLQLkHjC8xu7GI1PUaE94V
	qG+0eCM3IinPur2BH8OjJ+MJDzEEveiqHBKA9Wvly08NNzR36gm2tla5qNmIaNzUdtIBOJ
	3OMTBrhD1/LhDX4rKQlEaoaYhvYZONc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-ZAuvVD5xPtuPVzx_1dLDFg-1; Thu, 25 Jun 2026 09:25:28 -0400
X-MC-Unique: ZAuvVD5xPtuPVzx_1dLDFg-1
X-Mimecast-MFC-AGG-ID: ZAuvVD5xPtuPVzx_1dLDFg_1782393928
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8de60a7a813so55572966d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782393928; x=1782998728; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1O7Yij0Kw0ewgtwKjx6DJe41xbKPrRcBzrJalpv0Dok=;
        b=YjwiGejQC7UPEFYbTu8MLpEUW8Cvvjcc/Hhp41yU+fJCXd6Kg/w40Vjp8lA/vAtasO
         OdA6JkaC+K80qZHOTuM9BL0t/e1uPg+rAZw6ltoZh1zwtdZagzFXPwwAZFXq5ipxd6la
         HV90xu+VrT+KsZ/JI1OzV9Csb0OhRBeurSStcq8VSlu0EUVEuW6thT5K49+tEvu2ikTU
         /ZalshN/jFrIBQrLvuPtNoWwbqSOBVTcnq/N7PpW7PrTb/ew6XPxT+O2maJ02so6QR13
         YHxG6J8B8W6phaLAZf5tnlf1vpfYTjhKoclk4Z/LZLpAJPlo45tkqXWGUO/JNzhoUUJ/
         nQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782393928; x=1782998728;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1O7Yij0Kw0ewgtwKjx6DJe41xbKPrRcBzrJalpv0Dok=;
        b=QciwVkZKtxRaVUZq0/Q0puOnLlfxzAzkU92BmzmAQva6CXxlkM/QIrKoIYE1ab89ne
         VzOSRBgryzcbpbgobn3ek/OTsc4NhXoWWT0M8rDC56S+pwtK0q0AffKx7qXMw85lzd+a
         Z61Cj3LiQhplqSoxmD9VsFOynpLgQj42Blx7eNL8eNhwvzJGNH3fHwnVJ30zMdxQkDIH
         dH5M41FGZNLMCpHYzI9v5TEn3qNyhUIfUk9VlQWXucF13x6+L2LVeC2rkSK7spj4QWT5
         CqdR37spzFaY6bN/pTQWH5fb7ZQvdaBvKuNbqM2j+XCPjXhb/UqFO/zYyvxO6AaXjeZb
         facA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7T+KJanyM39jNzxAW/Iyivr81wIhRFbd14+b+BPq/X/AfctHPqScQtT2/o8WzSJjddufG4yhvr+J+uL1w@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1TUiCU4aJncb/bPdp/JOWxVg0ae+KuRym5e+efVHXVGCgY0wQ
	o0gmjo6AG/mkRV3zrnff0AsFkOBCXmVi4jL/TJ97UC021d3m0Ll7d+cKy0x2AEDGinAxZT7//8W
	HLJZqnErNPhKynoD2uVJLG5BdwUUplrZa6Y6UHporH1r+ksKQyzAAV9vF4p5JeqGBXp8=
X-Gm-Gg: AfdE7cmPzC1Nlk34xiwZY61LdAXz9sqT6JC429xMuCMFkYGI8ZFUPjWq1418ueiLVuE
	7wgcj4TSHqh9MPTXovkmUlgpbdfbAb09p+8/MJ3JWNEkDWEFT3x58qRHfM0gJNrQJAEGmGj0n0s
	lD+PkcBscyk+7r8C6bEGPzQtkMeOnvhP+c43OUw2YmMrgm+gZLacs1ye8pxDWvhQLsf/kEnR5kl
	FPJ+R+5hA9y8Rg2IKE288jxtOxYdNcYiu+icTxqOVSWWV3fwiG0pYeyMvGIpcO8hteH01FwL1uA
	v3YXmLEYdk7rR6oE1rkN3HQbwyuxB4cJNyUxHTk52nUT9KkySOqcTW+h2SKhT3/J/hmZu/3/ZA7
	CMClbbQZ0
X-Received: by 2002:a05:6214:2f13:b0:8ce:aace:eaf8 with SMTP id 6a1803df08f44-8e6d658248bmr40429356d6.43.1782393928220;
        Thu, 25 Jun 2026 06:25:28 -0700 (PDT)
X-Received: by 2002:a05:6214:2f13:b0:8ce:aace:eaf8 with SMTP id 6a1803df08f44-8e6d658248bmr40428846d6.43.1782393927741;
        Thu, 25 Jun 2026 06:25:27 -0700 (PDT)
Received: from redhat.com ([162.255.191.18])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df820bfdd0sm180527086d6.35.2026.06.25.06.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:25:27 -0700 (PDT)
Date: Thu, 25 Jun 2026 09:25:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v2 2/5] clk: qcom: common: introduce qcom_cc_sync_state()
Message-ID: <aj0sQLsPAwZPUR-K@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-2-15f82c64d95c@redhat.com>
 <21bbffb7-ce99-4c38-a5cc-6a3f3c7f48eb@oss.qualcomm.com>
 <aj0TQuaPWmSlLwIw@redhat.com>
 <b790c13d-0a4e-48c9-b8e1-743481c5e6b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b790c13d-0a4e-48c9-b8e1-743481c5e6b6@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114533-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93A486C61F2

On Thu, Jun 25, 2026 at 02:19:21PM +0200, Konrad Dybcio wrote:
> On 6/25/26 1:38 PM, Brian Masney wrote:
> > My next version of this series that I haven't posted yet allows chaining
> > the sync_state callbacks at the driver core level. It doesn't require
> > any of the QC clk driver changes, and will allow us to play nicely with
> > the pmdomain subsystem, and any others the move to sync_state in the
> > future.
> > 
> > I think I see the confusion between us the last few rounds of review. In
> > this series, I added qcom_cc_sync_state() and converted 6 drivers over to
> > use it. (I excluded clk-cbf-8996.c since it is separate.) Only the 6
> > drivers today that called icc_sync_state() now call qcom_cc_sync_state() ->
> > icc_sync_state(). So from my vantage point it is the same overall
> > functionality.
> > 
> > I didn't look at this from the perspective of qcom_cc_sync_state() would
> > be common infrastructure, and a newly added driver in the future that may
> > not interact with the ICC framework may use this. Is this correct?
> 
> Aaah right, my mistake. I assumed that adding that binding
> qcom_cc_sync_state to all qcom clock drivers was the next step.

OK cool... I'm glad we figured this out. Email can be tough sometime! :)

Brian


