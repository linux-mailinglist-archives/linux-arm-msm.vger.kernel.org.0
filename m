Return-Path: <linux-arm-msm+bounces-115199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 97kVGOOWQmr9+AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 18:01:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B816DD111
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 18:01:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=WiCoE1eY;
	dkim=pass header.d=redhat.com header.s=google header.b=aPWqSA1w;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115199-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115199-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C72C323550A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E80D43D4F4;
	Mon, 29 Jun 2026 15:48:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E4943E4A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 15:48:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748102; cv=none; b=RYNFS+po8OVZFVxk/hqQDWavbaIFibZGdcp7vv5racruxP2w++Uh+if/px/R67v7jjclcCA8KAp6U8Ox96pERoixt6IKlnJ7jZUQ3ZfWGhxHNw85oyZ/6c3jhL3Obxni1lQXosulS6Rp9h2H8CoxyC7XRez+Rad4/EUGWQfqkC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748102; c=relaxed/simple;
	bh=xEj2dKDGeASR+fSR2Rl0OKNkvS5xk75qjuIZf3NSAJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ucw9wJ1FrE9XWJAvSzcOHeVMulv30/VPNlKb9cilh/FFE2M5+VVpeWNuzIkDDmT/PSEFQve8RGawogdKXKXiU0SWATWZMnhNBKwfvdEFzT7+enl5GfozqXFyjFpxkidU3ZWRB22buUKRNPVcD3BqRkxgjjK6jS/7hrYN9UN98ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WiCoE1eY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aPWqSA1w; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782748098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5qsO792Ztaa0qn5nI0kJBMOa5Ndy7BivqDU0OQn0EDk=;
	b=WiCoE1eY+yFPoOy0R43vseCayOrwtxmVubD//9VknXIbppzE6LoCbTpNgCY3B+x07okV1j
	QdGdofyC2fbumE9wZaG5cSciiRpM2VhXKbHb3+QcTo3P6k5uMJOb5ILibXqarqI9i9FTIu
	hZsEgsg0izzF11PolEen1fzexbdNnJ0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-nVGSu7JRMIOt8LA5yPxFtA-1; Mon, 29 Jun 2026 11:48:17 -0400
X-MC-Unique: nVGSu7JRMIOt8LA5yPxFtA-1
X-Mimecast-MFC-AGG-ID: nVGSu7JRMIOt8LA5yPxFtA_1782748097
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92aea0d801dso521652485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782748097; x=1783352897; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qsO792Ztaa0qn5nI0kJBMOa5Ndy7BivqDU0OQn0EDk=;
        b=aPWqSA1w99vyc3/BXLJ+BrznWgIAnP7X5gj1EtG2y1KF9LkFMLciagnaa4ehNNt6gy
         3ZH6Jx4rKk7affpUP7sBwAsEJ5vY0B5Es2iTfGzX/50FLhQW8CNvWgZypGDN8N/3YxuJ
         3oXakenjcVDAZSz4uU13B+l22tgb6nkSIVJPpT5fiTU0vsAoNGWOqm4iTURR8ltH9Nkb
         WIUXYqZADabcAsb0qmtkMgYvgj9HAQgpYYelPSnT6mTBx1Jbk6NKXQZuvGrAV8ZlgeHU
         fIj92jxiBonTh8dU7KK1j1eawDHFBbS+sHstNbya7sc4mMSGjNDSgL5OzXcdh1klorV0
         w/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748097; x=1783352897;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5qsO792Ztaa0qn5nI0kJBMOa5Ndy7BivqDU0OQn0EDk=;
        b=a+zZubb0oLlTCxpXNKIY5SyFV+FxNvJfYVYVp1htlR8WQaqMY4ucUB7AqoBDB72Am2
         rMvTDusY6rieCVq9CJ2aZUH+MxlzFaHv2E03cfB/cdy7Lf9RPx/+8rxy6i0QN2eEs+vR
         lNSUYfruRgf7jfHcHLQzwdZoc7xg2PrznyR/9czddgDevL3xhZt4SQMpIBXDH9OtWgRN
         kphUm7hTC0NkZ4oDFSFj1dSiFhmXQO6+BsBoxcHp4tB842NJ1plKwYmVPxJZel/E8kVX
         3B10s0GOCnngGThCntMcIRq8qQfc9TcHEkYI142+CN0isT/7IPd/mxMK+RvWJOWpSUvF
         QB5g==
X-Forwarded-Encrypted: i=1; AFNElJ/nfAtkkPgHWJSF2VJ6dbveG0iPlddcdaTmVGNl89B+K/csyZgj8fahYO9ERaUWwQrqEoPtlfw1/j0IVKA5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7l+UbKKvifAAxoDS3QElb2Xw/OwIMKM40qSLCVl/hcbGA4ypj
	DrdxGOaE+HViNvc8w8mwMYlsDxQOkIJPazv1uD2Gv8g/YkXOwiMlC3oD0U6pKPPYbY8tXwJLwYi
	sOvzbELuqWT3C48PAf5+SpmiRIN3JAlx6HydCcuu+TYv0aliP8bIGxzAZUS343dgN4vM=
X-Gm-Gg: AfdE7clZ3yPgbCPmnkkKFFVqHjrilFiyRbdkGaOZWdo4PoxXPdEGtYvZfTSYpF4QxfQ
	yrzC9wWZPdt2DhYrrQIiQeCmQoemPV/B4MB8h6PmdyxplfW30nw4c5lgMMw2v6d3yypNWh+CUt/
	rG+hpWMmuLw720cLdPXpfz1hGoi05CAlNKLgKIjltgG+qUQ/22VsEstE82AjXFqRdyUtC4R9ZZj
	Y0eCqCLrSo4Cs8BFtEowwbvAEQOySwpq6r07LBu8WfNKEBEeKTGxaGhIlkCrr7zOMxfouSX3K/N
	kPmuEVmPL9tII1ueqiFF5dvqeNP8W7uw/pZecYHFyZgfDnD21r71qomhrlVrOEAnH8FeeYZmwfy
	HDQ2iHaOaG9rjjV8tkfYnpKY8ELZTo1t2fYUNiJGcU+U9LQ==
X-Received: by 2002:a05:620a:4690:b0:92b:6805:9193 with SMTP id af79cd13be357-92e627e2931mr13878685a.59.1782748096900;
        Mon, 29 Jun 2026 08:48:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4690:b0:92b:6805:9193 with SMTP id af79cd13be357-92e627e2931mr13870385a.59.1782748096281;
        Mon, 29 Jun 2026 08:48:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a69c283fsm947266d6.26.2026.06.29.08.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:48:15 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:48:14 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xuyang Dong <dongxuyang@eswincomputing.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: implement sync_state support
Message-ID: <akKTviIP_rt4eRSk@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
 <20260626-clk-sync-state-v1-4-4156d8196dc8@redhat.com>
 <f280150f-f829-4425-a856-9ca9f7aca233@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f280150f-f829-4425-a856-9ca9f7aca233@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-115199-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:ulfh@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:neil.armstrong@linaro.org,m:dongxuyang@eswincomputing.com,m:jens.glathe@oldschoolsolutions.biz,m:johannes.goede@oss.qualcomm.com,m:mripard@kernel.org,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:driver-core@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92B816DD111

On Mon, Jun 29, 2026 at 03:44:26PM +0200, Konrad Dybcio wrote:
> On 6/26/26 6:32 PM, Brian Masney wrote:
> > The existing support for disabling unused clks runs in the late initcall
> > stage, and it has been known for a long time that this is broken since
> > it runs too early in the boot up process. It doesn't work for kernel
> > modules, and it also doesn't work if all of the consumers haven't fully
> > probed yet. Folks have long recommended to boot certain platforms with
> > clk_ignore_unused to work around issues with disabling unused clks.
> 
> [...]
> 
> >     [    0.366737] clk: Disabling unused clocks not associated with a device
> >     [    0.367232] PM: genpd: Disabling unused power domains
> >     [    7.791413] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unused clocks
> >     [    7.799702] qcom_aoss_qmp c300000.power-management: clk: Disabling unused clocks
> >     [    8.548820] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unused clocks
> >     [    9.121849] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unused clocks
> >     [    9.121985] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unused clocks
> >     [    9.122691] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
> 
> Many of these drivers only register fixed "virtual" clocks that
> don't lead to any registers being altered and only exist to convey
> what the clocks look like on the hw level.. but I don't think we
> have great infra to skip that..
> 
> >     [    9.122760] disp_cc-sc8280xp af00000.clock-controller: clk: Disabling unused clocks
> >     [    9.142121] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unused clocks
> >     [    9.169149] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unused clocks
> >     [   16.057997] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling unused clocks
> >     [   16.058149] clk-rpmh 18200000.rsc:clock-controller: clk: Disabling unused clocks
> >     [   16.334879] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unused clocks
> >     [   16.706113] camcc-sc8280xp ad00000.clock-controller: clk: Disabling unused clocks
> >     [   21.565731] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk: Disabling unused clocks
> >     [   21.597069] va_macro 3370000.codec: clk: Disabling unused clocks
> >     [   21.605039] rx_macro 3200000.rxmacro: clk: Disabling unused clocks
> >     [   21.630313] wsa_macro 3240000.codec: clk: Disabling unused clocks
> >     [   21.635069] tx_macro 3220000.txmacro: clk: Disabling unused clocks
> 
> This is a bit noisy, but then it's necessary for debugging the
> related hangs. Maybe if it turns out to be a huge issue, we can
> hide it behind a _dbg() in the future.

Agreed. Personally I think we have this go in with dev_info() initially,
then after it's been there for one release, move it to dev_dbg().

> I was hoping/expecting that sync_state would completely replace the
> late initcall (which would also simplify this diff), but I'm surprised
> to learn that there's a whole bunch of clk_register(dev=NULL)
> calls in the kernel (are most of them doing it for no good reason
> by chance?)

Yes, correct there are a ton of clk drivers that use
clk_register(dev=NULL) to register clks from __init early in the boot.
My understanding of one use case is that this is needed to setup arch
timers that have a dependency on a clock.

My understanding is that lots of drivers that register clks in __init
don't need to do it from there.

Brian


