Return-Path: <linux-arm-msm+bounces-111444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fZjIJWbtImpVfQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 17:38:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A66495F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 17:38:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fWcnhy3n;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111444-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111444-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 682EF30A5B03
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 15:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81ACF3B895D;
	Fri,  5 Jun 2026 15:28:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BA33438B5;
	Fri,  5 Jun 2026 15:28:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673307; cv=none; b=Ofn2d/+Ff15CqP3gsDjWeEiuO+TA7JkeCRQRE51n3Y5P8b3e/VZkvN9vjZIqQtxgniRsZqGDSJfljfeEPE12fU9Wc51ldhcoo5GAC2GBqgxl+F/is496RE4jy65nY1hW/O4kMQ4olZWllP+DRxivWOLtO5sv+/kFIpa6s0VMGAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673307; c=relaxed/simple;
	bh=WFwBSFveNwk4QJwSulfQzuXUhPta92VRsj+plVVpd+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RV4+TxEEKl6XNoEv49EhDufW/wjR1BFFjgbaaaXnKy2N592+/lIYS5ucmfpHFZqnPNpWP1P1+KbsVr9rnyOsR6slZX7vXgdoKLSfmtSRfsMkt6dch0cYh4b+sidmqU/H6P4Qh3ChmDEjYBZ27gCXAef5CXiWYQEgeoBW6wtLdLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWcnhy3n; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAFC1F00893;
	Fri,  5 Jun 2026 15:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780673306;
	bh=oBR7PyLS1GRVWsoOzBh999WZkqMfxUWSYE8ZccTmdu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fWcnhy3nfcLpIlGX0XpRreSQve+kDKX+VCRsbzRkZTzcjuSg4kzdSS2wyWj8P895v
	 jKkdzwnkTT5yteTGM9/9/QBzAFs6w3vEe87/8KZFMMv/KNDg+s744VLpMqPH026Waf
	 Jrxj/+9wMD2QI1VoeD4SsJCbjT6ObfXL+ph5R6GAc719K6snd3iICjMcMFG3aKonso
	 stdD0sB9iTsCFQkTE1M2tBsD6DmUxxORwjhJoNmAcsvN9bk4B5bkPeU0OkaTy99iRb
	 etnBbGQogMRQIDITILsbejpAzhcBvs/d/D9TB5HEg0PZS+rmZ/CNX9BZYpD+gBetG3
	 yLryZkt+t7VaA==
Date: Fri, 5 Jun 2026 10:28:25 -0500
From: Rob Herring <robh@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: panel: samsung,atna33xc20: Add
 ATNA40HQ08-0
Message-ID: <20260605152825.GA3740391-robh@kernel.org>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-1-57c70c23d0d6@oss.qualcomm.com>
 <CAD=FV=UaPKiGSL6mhVdywp67skSr2B7977f3kZ23FFHaD=95RQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UaPKiGSL6mhVdywp67skSr2B7977f3kZ23FFHaD=95RQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111444-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:dianders@chromium.org,m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D4A66495F7

On Thu, Jun 04, 2026 at 02:23:25PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jun 4, 2026 at 1:07 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > Some variants of the Qualcomm Snapdragon X2 Elite-based Lenovo Yoga
> > Slim 7x Gen11 laptop ship with a Samsung ATNA40HQ08-0 2880x1800 120 Hz
> > OLED panel which seems to be compatible with the other ATNAxxx panels,
> > document it.
> >
> > Note that I stripped the -0 suffix from the compatible, as it seems to
> > be of little importance and some sources omit it.
> >
> > EDID:
> > 0000000 ff00 ffff ffff 00ff 834c 422f 002f 0000
> > 0000010 2300 0401 1eb5 7813 6603 ae85 3851 24b9
> > 0000020 500a 0054 0000 0101 0101 0101 0101 0101
> > 0000030 0101 0101 0101 0000 0000 0000 0000 0000
> > 0000040 0000 0000 0000 0000 0000 fd00 1e00 e678
> > 0000050 47e6 0a01 2020 2020 2020 0000 fe00 5300
> > 0000060 4344 2020 2020 2020 2020 2020 0000 fc00
> > 0000070 4100 4e54 3441 4830 3051 2d38 2030 c402
> > 0000080 2070 0279 2000 1800 1200 2ffb 0042 0000
> > 0000090 0000 0c23 5441 414e 3034 5148 3830 302d
> > 00000a0 0021 ca1d 5e0b 4007 080b 0007 7ae5 8551
> > 00000b0 b9a3 024a 020a 5445 5fd0 644c 4400 7823
> > 00000c0 0026 0609 0000 0000 5000 0000 0022 0014
> > 00000d0 0ad4 3f85 c70b 0700 1f00 0700 7707 4f00
> > 00000e0 0f00 2e00 0600 4500 5fd0 644c 002b 270c
> > 00000f0 1e00 0077 2700 1e00 003b 0000 0000 9085
> > 0000100 2070 0079 2200 1400 d400 050a 0b3f 00c7
> > 0000110 0007 001f 0707 07f7 07cf 000f 0081 731f
> > 0000120 001a 0300 1e5b 0078 8fa0 6a02 7802 0000
> > 0000130 0000 e38d 8005 e600 0506 8f01 016a 0000
> > 0000140 0000 0000 0000 0000 0000 0000 0000 0000
> > 0000150 0000 0000 0000 0000 0000 0000 0000 0000
> > 0000160 0000 0000 0000 0000 0000 0000 0000 0000
> > 0000170 0000 0000 0000 0000 0000 0000 0000 900f
> 
> I'm not a fan of the EDID being presented in 16-bit words. :-/
> Changing it to this when applying:
> 
> 00 ff ff ff ff ff ff 00 4c 83 2f 42 2f 00 00 00
> 00 23 01 04 b5 1e 13 78 03 66 85 ae 51 38 b9 24
> 0a 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 fd 00 1e 78 e6
> e6 47 01 0a 20 20 20 20 20 20 00 00 00 fe 00 53
> 44 43 20 20 20 20 20 20 20 20 20 20 00 00 00 fc
> 00 41 54 4e 41 34 30 48 51 30 38 2d 30 20 02 c4
> 70 20 79 02 00 20 00 18 00 12 fb 2f 42 00 00 00
> 00 00 23 0c 41 54 4e 41 34 30 48 51 30 38 2d 30
> 21 00 1d ca 0b 5e 07 40 0b 08 07 00 e5 7a 51 85
> a3 b9 4a 02 0a 02 45 54 d0 5f 4c 64 00 44 23 78
> 26 00 09 06 00 00 00 00 00 50 00 00 22 00 14 00
> d4 0a 85 3f 0b c7 00 07 00 1f 00 07 07 77 00 4f
> 00 0f 00 2e 00 06 00 45 d0 5f 4c 64 2b 00 0c 27
> 00 1e 77 00 00 27 00 1e 3b 00 00 00 00 00 85 90
> 70 20 79 00 00 22 00 14 00 d4 0a 05 3f 0b c7 00
> 07 00 1f 00 07 07 f7 07 cf 07 0f 00 81 00 1f 73
> 1a 00 00 03 5b 1e 78 00 a0 8f 02 6a 02 78 00 00
> 00 00 8d e3 05 80 00 e6 06 05 01 8f 6a 01 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0f 90
> 
> 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> > index 1bbe0da3997c3b06eccd18fe8980b58a6c05d963..27536eeaed8594c047dd0fa1cf425912be189508 100644
> > --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> > @@ -25,6 +25,8 @@ properties:
> >                - samsung,atna40ct06
> >                # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> >                - samsung,atna40cu11
> > +              # Samsung 14" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> > +              - samsung,atna40hq08
> 
> Sure. I'll repeat the same comment I made the last time someone landed
> a change to this file [1] in the hopes that maybe someone will post a
> patch one day:
> 
> <repeat>
> Given how many of these we're up to now, I'm starting to wonder if we
> should come up with a generic compatible like we did with "edp-panel"
> and then we can stop having to merge CLs like this. All of these
> Samsung OLED eDP panels have the same power up sequence and once we do
> that then we can read them via EDID or via DP AUX bus to identify
> which specific panel we have and if they need additional tweaking,
> just like we do with "edp-panel". Do DT folks have any opinion about
> that? Coming up with a name would be a pain since I wouldn't want to
> assert that all future Samsung OLED eDP panels will have the same
> powerup sequence. Maybe "samsung,amoled-edp-panel-v1" even though that
> sounds terrible and there's no known need for a "-v2"?
> </repeat>

If things are the same, then perhaps there should be a fallback 
compatible. Or just reuse an existing compatible. I can in no way 
prevent someone from using 'foo-panel' in their DT when the h/w is 
actually a foobar panel if the differences are transparent to s/w. (But 
I will reject a quirk property later on when foobar turns out to be 
different than foo.)

Rob

