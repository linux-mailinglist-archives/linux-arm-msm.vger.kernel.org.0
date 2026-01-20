Return-Path: <linux-arm-msm+bounces-89824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEbHKwO7cGmWZQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:39:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F80A56202
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:39:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6D2DD666992
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 12:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CB540FDA8;
	Tue, 20 Jan 2026 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRFdRonN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4479B33F8DD
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911082; cv=none; b=pkGdudoJJslQzVyWOx+Vw2MrUW65nP+s3cNIi9h9R1ZA6HGft3OGFTM7tXRgYCdqsYed17dGCQ48wUBNThMmv8aF5J0YR+a4uqnEoHfOmozC0FPLf4SFSWuXwuGyiYRFiu0Q52MThTT5Mpjj4ZPWCWMjRiugzKu/qhcC45edqZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911082; c=relaxed/simple;
	bh=slZnAA52hGrFdTpmjpe7wyFEKpTUV81xk18IsByotC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eo75X/q0TWHGRQIsP0OITON7xwy+0lLCX5XYtsuntfkgvCosG83mUCFvqcNSnAjIFTngV+v700R/FJ9m9ATdACqOPbTro5jae0i6HqNz1648OQOnAHEoHns9YOIr/VKjJ7D05Kj8BQQIaENkaivg3xYOuZTPfTBi/VFxYhIjFI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRFdRonN; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-655b5094119so767971a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 04:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768911078; x=1769515878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EdNwNcGnrHVRj7c7tzYxsUBjZ6i7z3klcWNlJbURQPw=;
        b=RRFdRonNmgQR3KU5OcQZqZy0IFfHC/H0GTsJ1+5n1Cy5gZRhwvo8WEmTZceAtFnfPO
         B6RmJ3MrCZgMtUCaXJQ0HFhkSHuRFI9Kc/DTTe7VyX6xytb3RM5eaVHGYu4bppdWEc2I
         +Ks6vBCiEs7l+9O/ZDiYwbggRPYQYFKhD4f1oZ44R8KePw6nhr3MZPSTYd4HyxyCJHhD
         jnWfoKh00/NZCWLlKMtkEoHgCy7MNvz/xmLHpbIkoHjSChMBo48rY1wX35aTlX/Qq4Hk
         VDKJuqSeYm+1UGzK6F9c3Ska044LNOqSdxny7tF6ZvmxLdqBpN9tXhw0FEJAll4uYVO+
         QjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911078; x=1769515878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdNwNcGnrHVRj7c7tzYxsUBjZ6i7z3klcWNlJbURQPw=;
        b=BoTgFSoXaZqpL0dEGjr2m+5h/uHcAaPGgF08JYCg3NONeLZHdIfUu7OajdBYbj20vb
         8a5BzNRKSFOdVmQxWChG9sCgLAkc/zbxBo4zWsT5CmgBqCaeYlH9FXc7BmKfvIW9eKUX
         UZs6+3oAMYMVppeBReQDAOju2hrdOd0UM1YA8FmIbfgJPE2U16OYpr1A3GlZ43TWg8Aa
         HbHACEmVAnYfScIFNoyquxbd/f22Fhikq/in8MOf7ao+Cz4xiaqZ23KbthxDFEBM2dpb
         mLTFOLilZfell3O18ilTIBwMUSKrNHRnzNRbm1IwlI/KvpDpWglUEdR8wxJeoZv7mpnM
         wXfA==
X-Forwarded-Encrypted: i=1; AJvYcCU234ukh+UHslrFz22Kr5f47MjPygF8OoZz0VE3sY7MYPJTDZ6UzH2PeRawK0YelaH1ehKa1UqQF9hvZ3D3@vger.kernel.org
X-Gm-Message-State: AOJu0YxO7/KR4CQoPzBJB/El1IsOMzQy46wV66kWTMQR0HLuUIwNq8lu
	sHCHi0pFBIve4XqwR6x4/vT8SPcTzIAUMZdSBio1YmIs/APsN9zLRMNl
X-Gm-Gg: AZuq6aLYc0eNrzGQ0PiNcSG1FR8LlrUWg8y1s2+N3Mrz9lw5ZA8fiTnv0R+Iog6WXI0
	ZfTdJ9JEV2RnGLCc5Uy7EdHIsQVQlW1pNVHA0dQVECGp5Ercp4By+uyFjaGnM0ZlQEA4cEPezNK
	GTTT6jQBJm294j1gWE8W71Y/PBd6VN4FugSO/yQkBhBRaoHpV4/zSe2QDe6q16c/OwAGtqwlhqP
	DmKPBDtu0T4Ktpvsyq40UgHyK4m3mp7JQPvR2a1G2OaLZNyKQO0sHRsbiS0K4NrUEWxw3DvLOJj
	Yq10XsOiPgr/R8v67Prg0bYoZW7tekx5Joo/vd5iLb+jmRtnD0GluflZURTeAI907Ibs5XQP6ug
	hTCirXSiZWV/TZiXrj1+Ux5SRS1bpQwz2XfMyMQrVqaStZCMeoYumZLt5AkUK0i3Ty8SS7czvcY
	PjNaQ=
X-Received: by 2002:a05:6402:348d:b0:64c:9e19:982d with SMTP id 4fb4d7f45d1cf-654523cc85bmr6515961a12.1.1768911078156;
        Tue, 20 Jan 2026 04:11:18 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:619a:24df:1726:f869])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654535c4aa7sm13503305a12.34.2026.01.20.04.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:11:17 -0800 (PST)
Date: Tue, 20 Jan 2026 14:11:14 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-phy@lists.infradead.org,
	davem@davemloft.net, maxime.chevallier@bootlin.com,
	alexandre.torgue@foss.st.com, mohd.anwar@oss.qualcomm.com,
	neil.armstrong@linaro.org, hkallweit1@gmail.com,
	mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
	edumazet@google.com, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, vkoul@kernel.org,
	andrew@lunn.ch, pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Message-ID: <20260120121114.2aedgu42i2wax3yp@skbuf>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120081844.7e6aq2urhxrylywi@skbuf>
 <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89824-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,lists.infradead.org,davemloft.net,bootlin.com,foss.st.com,oss.qualcomm.com,linaro.org,gmail.com,vger.kernel.org,google.com,lunn.ch,redhat.com,st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 9F80A56202
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 10:12:46AM +0000, Russell King (Oracle) wrote:
> First, I'll say I'm on a very short fuse today; no dinner last night,
> at the hospital up until 5:30am, and a fucking cold caller rang the door
> bell at 10am this morning. Just fucking our luck.

Sorry to hear that.

> On Tue, Jan 20, 2026 at 10:18:44AM +0200, Vladimir Oltean wrote:
> > Isn't it sufficient to set pl->pcs to NULL when pcs_enable() fails and
> > after calling pcs_disable(), though?
>
> No. We've already called mac_prepare(), pcs_pre_config(),
> pcs_post_config() by this time, we're past the point of being able to
> unwind.

I'm set out to resolve a much smaller problem.

Calling it a full "unwind" is perhaps a bit much, because pcs_pre_config()
and pcs_post_config() don't have unwinding equivalents, unlike how
pcs_enable() has pcs_disable(). I don't see what API convention would be
violated if phylink decided to drop a PCS whose enable() returned an error.

Similarly, the fact we don't have to whom to report an error code
doesn't make it pointless to offer the guarantee that pcs_disable() will
be called only when pcs_enable() has succeeded.  It is only the latter
that seems necessary in order to develop reliable complexity on top of
these.

If SerDes PHY integration in phylink_pcs drivers is a model to follow
for other drivers, I think the way in which balanced calls can be made
from pcs_enable()/pcs_disable() needs to be given more attention.
And I think it's a bit worse than "doesn't matter, the port is dead
anyway".  For example, we can have QSGMII where 4 PCSes share a single
SerDes lane, so one single malfunctioning PCS instance can affect all
the others through the lane's phy->power_count.

