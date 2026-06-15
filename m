Return-Path: <linux-arm-msm+bounces-113198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r0OuL80MMGobMgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:31:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E905B687328
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 16:31:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=PHy1hDd9;
	dkim=pass header.d=redhat.com header.s=google header.b=kyk5KUQP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113198-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113198-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BD433051A55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 14:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B3A63F6C3B;
	Mon, 15 Jun 2026 14:22:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E87A3FA5C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 14:22:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533367; cv=none; b=OscsHezT7JSTA8L7RLfl4hhoKSp1aeyFOUfcoH+Evrwxq5xOI9dq3zDO8VaElNq+JV7nZfQN7hNZWJ4yP6CY4WV8qDp9hcvnjwOTOadkFaRAmnjQ9PCjgeDcu9wPvXwQ04qjpWljN+8B0ROLpJs2kfJWMaCEho68zkMQqbH+AEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533367; c=relaxed/simple;
	bh=ZQn8hPrkM36VCBIdCi3eFgK8VPUUP8gn25zK7fcuS7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p1TZPlLfTDhlCOH2iefF+JWw9EjmOuuX+djSro8cVDa2O66f6rIH2pcEux29t4gkpLH3rtbOE2uk6BXg6LiFTrRfGRoNEO5C+yD3Ac6s1BRuQlsaXJHh2LcmxURHuYvcGl38tY9XiRP8lJtt6mAhRuYagL+fcjQMpZAEDl9kFXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PHy1hDd9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kyk5KUQP; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781533363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zuMhQAEiwW8EZyF1+ggYbLN42TmxHM1hwGejQcOObs=;
	b=PHy1hDd9hnr0l5rMkejst0Pk1ZzCyMPErTf6dOtBVhuuit0fohZhNV9jJHocH3yso7zB6o
	UyeFwszIPW7wi4m+OzzqTkTRSER5aJ0qRQqMVuZILG5159upvN+xEidKENj6XXb1u8X61G
	eM5NtAIP8RRFHTMSHa3TpiUS1J5dnso=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-Z1QHuAglNXWkKp7ot9Kbvg-1; Mon, 15 Jun 2026 10:22:42 -0400
X-MC-Unique: Z1QHuAglNXWkKp7ot9Kbvg-1
X-Mimecast-MFC-AGG-ID: Z1QHuAglNXWkKp7ot9Kbvg_1781533361
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157f1be083so599067385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781533361; x=1782138161; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3zuMhQAEiwW8EZyF1+ggYbLN42TmxHM1hwGejQcOObs=;
        b=kyk5KUQPY6IiQqZqKBxJpnYeLi+ufrcDYW01yXtg0oVYtHKe/78MdlnaHhlDLeV+vr
         AuGKAYKwGF0K6KQ95Jy22FMAwxzHu1YGZUChseL7c+z+6eUuHZtz+NKeClqnxING6tMz
         LVrIOBEqZmKh0qm27iVgplLFx895CjspBGoD+EQZ2fZcTDqwjijRWeTDi+UKPG3iW/xL
         aq5iLE7V7GoKoFX75aqJiwhGLWOgej1vuBdUjIzfxlek37xhNLaCW5+ahhklvo+m+dJ2
         dMkreoclrGwnk2zn80pkYfszv7X3OCXipJEJDdY7hMQaP7nDN+7Cjy+k6t04CyX4x5D1
         pKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533361; x=1782138161;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zuMhQAEiwW8EZyF1+ggYbLN42TmxHM1hwGejQcOObs=;
        b=BOWaCQpg7oc38jAaOkYE2XTCNhxAPTAC+wbFi06DJTCZEHjBWMfIUDPomOSKdpAGwW
         +qJgFlDKfnBaUO5A0znq/Qc/o68JyD2pt7ViSvDObKvD2bN26TD+Ji5gux5rs3Ew0JNU
         iYagH/n7RpXIiAKMsTuXfMr7Fns1wxKuIlnBakK2qleMICsM839KPuBwqJKt7Js8PIoY
         x7nXdH4BZav8mw0j2P2c+i2vzJXZAkwgzEbQ5i53QKoGDhxoT77Va0FpsYVKFB5RsDYA
         rMZYPeQR8UMUoP3YeGBUxvhveodyV9fJXlgRuouw8r+Yyxy0BFFPUYEHkeacv/u7o1r4
         oUUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YnfnOM2dbGQBKjalRH4VamVeb0m/cbbkWzJ8jFNjfYQUQbuigkIYEUB39x0moUCXxixOWY9ruBTCScdbT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Sft5G0X0lXhuA6zPotA8abaIO4UcjDBmNJ/TA+r8M1TUVWgU
	CLvyKPvHhhZ50Jft79Vs7HtBtTzA4z+sEs7wu4zK9V7hOlkO9129pVycyj3DWOy/+7caPRHwTL1
	rC4Y8ZcRCx+CEZ4/SNUPWuztRIDIgVUzuBB4XS0lfu+bz91GamAGTr9lpxAgNlMnnSFg=
X-Gm-Gg: Acq92OHIHQCOBHWz4Qt0JHf2Fs2Lg1YXnsvH6ae8vumhRHfDqBYfKYIW8qCl9R7R4ha
	qjxptl2LhdRXbI8cskhBu7E/cQcHYMOYBqpLRELrKfOxahDa+60zudeL/hMcJZ3ke3pBhcFpvPs
	uLYcBIJn7IFlReZO4zJomYjbYCbsuk02d19iLT3yFymWMZEiblwYQ+XNh8c6X76K/R+0xdUl2D6
	Za8EF6AUNxoQVXcMU/PgphWy4awVqKhHQaE3ghs8LG0Grjj0JjIKcKFeO1fmglJnaLRrEtVyzuD
	mTBhIsINZkDDrA5k8TTk0SuNMJIiPgFppOkcvGJ9Ovcs/3vqiSHvqunEiSs23ERYobdSRJs0Kff
	t5jvjSdVNJgsRoAWQ3/Nidz+AR0rGW/Luj9XD84Z+87+syyRqEJoKMKmR
X-Received: by 2002:a05:620a:8906:b0:915:8c48:4975 with SMTP id af79cd13be357-9161bc8d76dmr2160615185a.34.1781533361195;
        Mon, 15 Jun 2026 07:22:41 -0700 (PDT)
X-Received: by 2002:a05:620a:8906:b0:915:8c48:4975 with SMTP id af79cd13be357-9161bc8d76dmr2160609685a.34.1781533360658;
        Mon, 15 Jun 2026 07:22:40 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006ef0sm1087098485a.24.2026.06.15.07.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:22:39 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:22:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: convert from icc_sync_state() to
 qcom_cc_sync_state()
Message-ID: <ajAKrYK44-C9B9Yp@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-3-457120eed200@redhat.com>
 <b732e65f-5963-4598-a341-06338044d90c@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b732e65f-5963-4598-a341-06338044d90c@oldschoolsolutions.biz>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113198-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jens.glathe@oldschoolsolutions.biz,m:saravanak@kernel.org,m:abelvesa@kernel.org,m:mripard@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux@armlinux.org.uk,m:andersson@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oldschoolsolutions.biz:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E905B687328

Hi Jens,

On Sat, Jun 06, 2026 at 08:25:45AM +0200, Jens Glathe wrote:
> On 03.06.26 16:21, Brian Masney wrote:
> > Convert all of the qcom clk drivers from icc_sync_state() to
> > qcom_cc_sync_state().
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> [...]
> > diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
> > index 0b40ed601f9a..0d920bd5a992 100644
> > --- a/drivers/clk/qcom/clk-cbf-8996.c
> > +++ b/drivers/clk/qcom/clk-cbf-8996.c
> > @@ -6,7 +6,6 @@
> >   #include <linux/clk.h>
> >   #include <linux/clk-provider.h>
> >   #include <linux/interconnect-clk.h>
> > -#include <linux/interconnect-provider.h>
> >   #include <linux/of.h>
> >   #include <linux/module.h>
> >   #include <linux/platform_device.h>
> > @@ -249,7 +248,7 @@ static void qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
> > 
> Hi Brian, thank you for the patch set. To successfully build there seems to
> be a header missing. I tested this in my tree on Thinkbook 16 G7 QOY and
> Ideapad Slim3x 15Q8X10 without adverse effects, looking good.
> 
> jglathe@tb16-jg:~$ sudo dmesg|grep "unused clocks"
> [    0.492547] clk: Disabling unused clocks not associated with a device
> [    1.178818] clk-rpmh 17500000.rsc:clock-controller: clk: Disabling unused
> clocks
> [    1.314479] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
> [    1.327608] tcsrcc-x1e80100 1fc0000.clock-controller: clk: Disabling
> unused clocks
> [    1.544869] qcom-qmp-combo-phy fdf000.phy: clk: Disabling unused clocks
> [    1.614767] qcom-qmp-usb-phy 88e5000.phy: clk: Disabling unused clocks
> [    1.616222] qcom-qmp-usb-phy 88e3000.phy: clk: Disabling unused clocks
> [    1.690273] qcom-qmp-combo-phy fd5000.phy: clk: Disabling unused clocks
> [    1.726354] qcom-qmp-pcie-phy 1bfc000.phy: clk: Disabling unused clocks
> [   10.956342] qcom-qmp-pcie-phy 1c0e000.phy: clk: Disabling unused clocks
> [   15.858926] q6prm-lpass-clock
> 6800000.remoteproc:glink-edge:gpr:service@2:clock-controller: clk: Disabling
> unused clocks
> [   15.867120] rx_macro 6ac0000.codec: clk: Disabling unused clocks
> [   15.867990] wsa_macro 6aa0000.codec: clk: Disabling unused clocks
> [   15.868589] va_macro 6d44000.codec: clk: Disabling unused clocks
> [   15.970465] wsa_macro 6b00000.codec: clk: Disabling unused clocks
> [   15.973614] tx_macro 6ae0000.codec: clk: Disabling unused clocks
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Thanks for testing. I'm going to put the Tested-by on patch 4 that actually
adds the sync_state support when I post the new version unless I hear
from you otherwise.

Brian


