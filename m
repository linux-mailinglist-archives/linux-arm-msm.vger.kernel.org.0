Return-Path: <linux-arm-msm+bounces-113799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fdrCIn1fNGo7WQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 23:13:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 282916A2BE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 23:13:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=XesuMcAB;
	dkim=pass header.d=redhat.com header.s=google header.b=s+Yzq9TF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113799-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113799-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B42023056848
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 21:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BCC34CFB9;
	Thu, 18 Jun 2026 21:12:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417DB3431E7
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 21:12:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781817171; cv=none; b=F4sXs9yYahoOTOzCzkz5arlksIhNTOnYK7M0Md+t6XAJFjUWAKdbRxWxC0JhPGf5NMiKDgr6pxEJAptdRx6C4/lFUQupv6Pgw6iCnGCiwHnor+JCWvl14058hCqGit3X//y2uRtJDLsHkrMJC1iVOUbCzWLSUQVERSD+i5aP5G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781817171; c=relaxed/simple;
	bh=BPJXynNAo8Jcooz8/RyQzKJBfUECCST9+2kUSac33zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvnZNpPhP0y6ppLbkUw+X8ht5Ng6FOk9KMgEU/vcAqiBWEQD/7PYOdC0vYShnI35sd7/HqAVlKCPON50USObqh1YfE5IAoEg9z4ALt2QCHEKuHyrxkqh+DpUDGnn9wudCvIqCvZNwe8mROg11IE0f0sKihxj9DLotsaJGe5r1QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XesuMcAB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=s+Yzq9TF; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781817167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=avP9ibHNPh0uZocZWfTS/uf3Zirh7iSsxekjlin/Vn8=;
	b=XesuMcABWgf0CvQ+Xuvlcc2kOEa17wMj5slqp+Qn8OgH8phEJDx8PcMeXexSwPl6AIY+sl
	b5prZRYX3zvbVANF4GxZ5tw7ATaQ8rE27eDG37RfwKULcct2ucOMQ4cAGBPPbKi1NmOBTe
	BRASgZNJ5CCOAIaxNwg17dgSywuMZQk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-_q02bQUpMbCyIaerLXiQRw-1; Thu, 18 Jun 2026 17:12:45 -0400
X-MC-Unique: _q02bQUpMbCyIaerLXiQRw-1
X-Mimecast-MFC-AGG-ID: _q02bQUpMbCyIaerLXiQRw_1781817165
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157f1be083so269248385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 14:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781817165; x=1782421965; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=avP9ibHNPh0uZocZWfTS/uf3Zirh7iSsxekjlin/Vn8=;
        b=s+Yzq9TFSIuzKFBZ/vi1TPnuGPSqHAxQVN0gO2CN3DnYKWqY834dtOlCH7udxrhGf+
         zkCFlsZNtuFsKYeA60k9v8aXOfFVQHz0Fy5BK5hYFR3pbAANon8nvcPyhUNOSC9/Il60
         RfmcKAKQOz2+Zwu6gAP0poWpWLZsrcVyTZMCM482X9Iu3I8Ykzm3EhwPR0iWUr92eYyq
         CpexjaZHlemKdAB1Y6m6Hh/2QL11dhxuhj4Nu/U8usydkTjm4xNEipN6TeQvgycjmKA2
         6vrz6YyPv1SgHqpqvvKFrVUPZKsX433c63JklHhzX4J7JolTipw/Fh9G3qINuHDrmgwA
         4wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781817165; x=1782421965;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avP9ibHNPh0uZocZWfTS/uf3Zirh7iSsxekjlin/Vn8=;
        b=Wf/OwfGV4EJWOVjybjvvTAsWVndJhQj3GPaLucwnWeMn6vNpEU3nrFZ5y1u+VzmGgq
         5lMGhfYvkPzJRJGYCzcRIajEMtNbNLrfUFQbwv6JaghHfA74yGWgzlY58sP4qDUkY+IO
         ZTvt7aFwGtdV0Ve89/9VgJdIvcef7P8gGWI/apD/YKaRTtkP3PHDfW6sUba4UKbR62OS
         BYbc17nEgrQ/nm+1ub+PdSOxdFX+1A/+MnngDM63yVdik8PYWE7ZBRlbB1iAfmT3D7Nv
         GhiDO/pW1cFr4zNe3kepTEUqQVbMR6atHTdY49h3r2yOsROo65eTQo/Lyvtepv/Pp5Tq
         E/2g==
X-Forwarded-Encrypted: i=1; AFNElJ85HB/J3En4+NV/ZZvly89RJw5NyLi+yamWH/JcggK2yiAqYtv3YJGSRxzOYfq1TnRNewqcE0YN8/uJ3+Jd@vger.kernel.org
X-Gm-Message-State: AOJu0Yys9i0AXo7mkqWqreEeSZaIfHz1WSZmlTaZKOkta08URVs9dO8r
	9580GGvRTer6B8QbBGWCCS2b3NuQez80N545ceawpx87YHiJEQ04pfvUiMquPpEJfN4ssroH+Dh
	yivZMKiSRbeqMhAxIHEQHZ4wkdqrhGez2MtuFXkF03F0Rg1ejVbythqe0ONAyozS/d6E=
X-Gm-Gg: AfdE7ckVZ1uy7qffGdC/m4OFBfoXsGHRHDlZV1EoxlXY//CLHrMrPXnhOiCuxqjOIX3
	mq/nCaBB1n10Q8X5dQdqEAmCRuxI4TQxolCkltqbbD9j+A5k8QbIRiXxQ9u+hHD4GFNkBsXg6T5
	OUpUq9c4/rMzjKOPinN1VHoYda3N5nZKw+dYaoNKV8P2odBdQreBc/i4Nsarc3me2i6ljCB1++9
	hVP/OitjcfnfA7JrbJy1OLofnTRCIQuq/4SXqo7XGSoLQxd2cj45+IU5mlTLmFd/yYvIrMRMKtt
	xsIwphOj40ya4T31pvYD54qGzuU651/80JKO4fkwKFsblQVf45Xl7TftFbxnt14X/wWs84cBf4M
	0TeUmpGIdalhBe7BiOMtNl5Mg9mk296vn2V8WH6NWcCd39A==
X-Received: by 2002:a05:620a:27d2:b0:915:9de3:226b with SMTP id af79cd13be357-9208f256e5cmr124279685a.18.1781817165247;
        Thu, 18 Jun 2026 14:12:45 -0700 (PDT)
X-Received: by 2002:a05:620a:27d2:b0:915:9de3:226b with SMTP id af79cd13be357-9208f256e5cmr124271785a.18.1781817164653;
        Thu, 18 Jun 2026 14:12:44 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a1819fa5sm28625685a.20.2026.06.18.14.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:12:43 -0700 (PDT)
Date: Thu, 18 Jun 2026 17:12:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v2 5/5] clk: implement sync_state support
Message-ID: <ajRfSbkAYusH5H9H@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
 <CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com>
 <ajK29WcueJ1wLCLQ@redhat.com>
 <CAPx+jO-tHYUa5oYEjuCdgF440viiR=Q6O-X6q=JNGwLgS_stsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO-tHYUa5oYEjuCdgF440viiR=Q6O-X6q=JNGwLgS_stsA@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-113799-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ulf.hansson@oss.qualcomm.com,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:jens.glathe@oldschoolsolutions.biz,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 282916A2BE5

Hi Ulf,

On Wed, Jun 17, 2026 at 05:29:51PM +0200, Ulf Hansson wrote:
> On Wed, Jun 17, 2026 at 5:02 PM Brian Masney <bmasney@redhat.com> wrote:
> > On Wed, Jun 17, 2026 at 04:24:05PM +0200, Ulf Hansson wrote:
> > > On Tue, Jun 16, 2026 at 11:09 PM Brian Masney <bmasney@redhat.com> wrote:
> > > > @@ -4345,8 +4382,17 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
> > > >         core->dev = dev;
> > > >         clk_pm_runtime_init(core);
> > > >         core->of_node = np;
> > > > -       if (dev && dev->driver)
> > > > +       if (dev && dev->driver) {
> > > >                 core->owner = dev->driver->owner;
> > > > +
> > > > +               /*
> > > > +                * If a clk provider sets their own sync_state, then it needs to
> > > > +                * also call clk_sync_state(). dev_set_drv_sync_state() won't
> > > > +                * overwrite the sync_state callback, and this call will fail
> > > > +                * with -EBUSY.
> > > > +                */
> > > > +               dev_set_drv_sync_state(dev, clk_sync_state);
> > >
> > > We have cases where a device node represents a provider for multiple
> > > types of resources, like clocks, power-domains (genpds), resets, etc,
> > > as in the qcom case, for example.
> > >
> > > For power-domain provider drivers (genpd) we also try to assign the
> > > ->sync_state() callback, see of_genpd_add_provider_simple() and
> > > of_genpd_add_provider_simple(). This means the above doesn't play well
> > > with how genpd behaves, so we need to figure out a way to manage these
> > > cases.
> > >
> > > In this regard, we also have of_genpd_sync_state(), which allows a
> > > genpd provider driver to explicitly call genpd's sync state function,
> > > if/when needed.
> > >
> > > Unfortunately I am not able to suggest a detailed solution for how to
> > > move this forward at this point, as it requires some more thinking and
> > > I am heading for some vacation very soon.
> >
> > One approach I initially considered was to make it so that we can have a
> > list of sync_state callbacks that can be added to. I already did some
> > work on this, but I didn't think it was worth it for just the QC clk
> > drivers in isolation, but it would address the concern here.
> 
> Right, maybe that would work.
> 
> One more thing to somewhat consider, is the problem I have been trying
> to address for power-domains providers [1]. At least for genpd
> providers, we need a more fine grained sync state solution, which also
> must be able to co-exists with other subsystems sync state support. I
> am not sure if something like this is needed for clocks too?
> 
> [1]
> https://lore.kernel.org/all/20260508123910.114273-1-ulf.hansson@linaro.org/

I am not aware of any clks setup that way but that's not to say they don't
exist. Stephen, and/or some of the folks from QC would know better.

Brian


