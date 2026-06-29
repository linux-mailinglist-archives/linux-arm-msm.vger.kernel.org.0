Return-Path: <linux-arm-msm+bounces-115195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kLwiGcWRQmqi9wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:39:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5886DCCE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:39:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=HGWqOFri;
	dkim=pass header.d=redhat.com header.s=google header.b="M/WBv65m";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115195-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115195-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 426DA307717C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E1D3E6DE8;
	Mon, 29 Jun 2026 15:34:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF2337D11C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 15:34:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747258; cv=none; b=dcxNvavFptR/ipFiVNgIj/Fx5B8m2BjKJu6qsrZPfVohSIi6Tv4jTxAxpdrR7gSQ9JK6/CQipjJuKBouQdBOflQXzy+j6hx9HMZcbif4JkIS7q8wvkjzi4AfCh5VwgKfgVr2i3TiFkze19NdkqQ5PgDwHlrwLQ/G11CnQaYAOFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747258; c=relaxed/simple;
	bh=Sy6JGeil4deLnMSvof8VqxcsucaS49cWaMJykRuqdh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRla+QagrTF6M5MX4evyxI34//HnyCYovwN02QIS0Z+KQO/AoElo4IYeQQiVS5+jwTcYEQCFTS2kxYrtQAI1xI1emd6sZT8dCbU15RLHkCqxLy6tbLUiD+Nf55LB+5METq57LMmQ8YrPlRFP15oZvI5ixvqXh9YWj/AOKDpybkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HGWqOFri; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/WBv65m; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782747256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jyH6F/rzycE55igieO5QcOyc46xwfU6NRg+LIEtIXp0=;
	b=HGWqOFri7YSXihiKD4euYGZLmYCQx3kEy2E0apZgqmC4bWgPcWwmKgH6aU7uMOs02a2zYp
	hyDWVfjiDxs+CXHncQtXzeLzoCT+FW6nco+MoYaycPNHYe7lADZfWgoeYf1M5kXVpS30qz
	9XjWR8PXLdIs2XjXjXICqt0SxaQ0Te4=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-8JPre5QqPhCVTLaE3N9WNg-1; Mon, 29 Jun 2026 11:34:14 -0400
X-MC-Unique: 8JPre5QqPhCVTLaE3N9WNg-1
X-Mimecast-MFC-AGG-ID: 8JPre5QqPhCVTLaE3N9WNg_1782747254
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-967552ac7f3so835219241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782747254; x=1783352054; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyH6F/rzycE55igieO5QcOyc46xwfU6NRg+LIEtIXp0=;
        b=M/WBv65mw8+Ab3Z6LZaPLTIutifdE0W0Qk6OaZYwkKf2a1oCIUKz4cSTQFHoDIDV/I
         B7W0I1qygRcsznmPy1MMB8SHE5JxvxTezob3YXVtebSkHg5JN1c2yndGhFyq75ge3gxk
         1m/Af86Jznsj1MxhaV2rCKYfZf1NMInBFFBX2ZGbNcGd2I8pBpuzuTYgQouU7yw76rd2
         CEpU3mq22Zi1BX1PUON1DP0Yy36D8FyXw20u44lCGtHUzZEsxVsM1h8hfW0TVRFxfpC5
         dMp9oKju8BO3u2NKGX5JmFidhNzTrJdIE1rzwNGpX9muhoFORheiGJz5p8ksnUBmctbE
         PGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747254; x=1783352054;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jyH6F/rzycE55igieO5QcOyc46xwfU6NRg+LIEtIXp0=;
        b=DnLJCKkovk8CQiZwprLUR20Cp1BNGonXHcd0dlPOS6kbm5El2cCDsmeNWvzFa2QQke
         jq5h7sYDtJTk2ZBnkiy4maYDRObepA78zgFJB0SY8rl+FsxkzgVUnKzYm17OSr5WyQx8
         vSPM2xjsYsb7GjwSGEcufXNwrw3bqNB+RbrVLsGeabcivNvQOOa0lTw7UojXSvtqTGnU
         yeowR6dFKkUgAgld07lYKi/e8MGjsFniR+keyrND079FSlXdzDBa/w1hEo8wYsbyA9qs
         iKtngnrEXg/0yMbMntBRh+cWu+v+20dOUUz2dJrhL6Mbdq+ypRDAmay9ZKbEoaQk/V2a
         VQyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgTM8sj6KgH3cOgMkv6v5O05rAZwKZvZ6QN3xP800p5MM82JjEkkPxVPTHG5OnkXsR0GmMJwOlZMVdt34f@vger.kernel.org
X-Gm-Message-State: AOJu0YyTN0VGH7gEvjN+um7DPzIB7sAaUDUwiqG4Kw2PfEZd/6OgPIqW
	75aq6s9I9Mxa+Q0x9KgQoyw+BjHBhkJyMVIcp1+5URvau4og0NUWBfc50OCQ3S1H5t8sqg41gj2
	l9Kx6ecOM5q8zkQ0PEDJHFD8Yp49oAGNe5Zd6x5dh8/LJb/de9OSUF+8MfyYqE0Oo/6Gj9AEKA3
	o=
X-Gm-Gg: AfdE7cnL6LDuSPM5Jej1ucqVq37OsFamgMZGR7SnLa+ArZAgNLXtJcxm3OMiDrH4KO5
	uC/mJFvG9+6N8/alkk0vSHxmJHrR14Sgk56bceID0HeK+R8cpCNEFmzLCUxCrFJZVlZsl96pgMo
	Uh7DWszcY+BB34dUNAW452piVCRaeHQNDpQBu/QvHs6a3wUYn5U8CLda7ZTqcy4evxlP9UBF0aI
	AmR3XUxCef8gUa2w16zd+IqvjPIpMF7JSRgYTMzuTK1IEmLFzquGVPr2O6T6rnCudrjTm5sZ2pO
	+h45z0/ZWzLiu7eNoZufZgNN0rbZvQIj/JSLvBtp469MGqpOEgdzCpq5TJV+5SEZ+AQS55MxEQK
	lxwTWburiGnloBfvpBR5wQREPT1+8vL1HdZOo3MOewcIrmA==
X-Received: by 2002:a05:6102:4187:b0:738:9bf0:f80c with SMTP id ada2fe7eead31-73a366f5f9bmr155591137.9.1782747253707;
        Mon, 29 Jun 2026 08:34:13 -0700 (PDT)
X-Received: by 2002:a05:6102:4187:b0:738:9bf0:f80c with SMTP id ada2fe7eead31-73a366f5f9bmr155536137.9.1782747253174;
        Mon, 29 Jun 2026 08:34:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f1a3580949sm1005826d6.21.2026.06.29.08.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:34:12 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:34:10 -0400
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
Subject: Re: [PATCH 0/4] clk: implement sync_state support
Message-ID: <akKQciC87HxiwZPj@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
 <bfacf381-8112-4c12-b87c-46cab7d7f284@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfacf381-8112-4c12-b87c-46cab7d7f284@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115195-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE5886DCCE3

On Mon, Jun 29, 2026 at 12:06:19PM +0200, Konrad Dybcio wrote:
> On 6/26/26 6:32 PM, Brian Masney wrote:
> > The existing support for disabling unused clks runs in the late initcall
> > stage, and it has been known for a long time that this is broken since
> > it runs too early in the boot up process. It doesn't work for kernel
> > modules, and it also doesn't work if all of the consumers haven't fully
> > probed yet. Folks have long recommended to boot certain platforms with
> > clk_ignore_unused to work around issues with disabling unused clks.
> > 
> > This series fixes this by adding support for sync_state to the clk
> > subsystem.
> > 
> > Changes in v3:
> 
> The version tag is missing from the subjects of the patches you sent
> By the trailers, it seems like you used b4.. did you play with
> prep --force-revision by chance?

Oops, yea that was my bad. I mistakenly got too aggressive with rebasing
my branch, and I dropped the commit that had the cover letter / b4
metadata the previous day. I didn't know the old SHA, so I had to
start over with a new b4 managed branch, and cherry pick my patches on
top. I forgot to run b4 prep --force-revision to force it to v3.

Brian


