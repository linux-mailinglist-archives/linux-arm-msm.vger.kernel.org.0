Return-Path: <linux-arm-msm+bounces-48206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A17EA3822E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 12:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 530903B5C58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66858218EB8;
	Mon, 17 Feb 2025 11:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="p/SUC7bY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F9C218EA7;
	Mon, 17 Feb 2025 11:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739792644; cv=none; b=AK7hkM/uPIHix3+qc6Q2YXIj9jOjM8JLOJF3T+iNRrcPfi/d9pXVR1sW/CXPEvb8q1kcKHWAsitY+Yfd2pdnEA0A0Eqmoa0qR2ordDxg6FmkDcqYnw7JmBBfsyfbJid5Xv+VPJ5dy+t6jvOhmbzRDWBbR7lvITsgPUp3A0AaWSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739792644; c=relaxed/simple;
	bh=BR3LESeh5qWqE1nsMsX6OvvYNBnjmcXgWQfYW0WVmZc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FVhPLxaRXwr2oNjAPthg0c2unBK/fjYHusEBpnENNCTJdszPs0OPX0Yn6naDeYfRFYQcGeNeM1h92p0w7yDyrjoXyyTXQi16MK0YhVYGnhQM5QlEoWw/8gUTg5seasmBzs62eJPJdLRgDWZTuwr6wIANZlHnYnkcWgqvd9mzzEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=p/SUC7bY; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=BR3LESeh5qWqE1nsMsX6OvvYNBnjmcXgWQfYW0WVmZc=;
	t=1739792642; x=1741002242; b=p/SUC7bYSpF3dYnCspmuCWZQsiMdRj8V4E/Cc26dKbkypOP
	GY3uF9XgtpG0V5pavFr02tj7y2rNTCj9Sr0gJLttJE9NBIS5gUCCdivg+6SkA9KhyhTJgx7bczSox
	Ece/Zy5R95szc+MirErz0wTJNJmHlDhJbgyA/ccTQZxvNjIX6ob9STlq0y+7ZMHVg6yiS6l71EOTX
	pNNxfFVZJzfSoDzSieRbBCCph2wxzW9/JPp6wAS5ynHoNPIiRIVvzynqTT15oaMZESFGuEIhr9NSK
	aTphOPBym6RYLfsfsJhBedd+pVgYiiuGoyiVYf8lED177Ih8QulZ8kYBUkTHM0JQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tjzXZ-00000000JSW-1v57;
	Mon, 17 Feb 2025 12:43:57 +0100
Message-ID: <673d0ef9477f1dfbed474cc51ad68092814dfe85.camel@sipsolutions.net>
Subject: Re: [RFC][PATCH 00/10] pstore: directly mapped regions
From: Johannes Berg <johannes@sipsolutions.net>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 	linux-hardening@vger.kernel.org, kees@kernel.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, 	dakr@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, tony.luck@intel.com, 	gpiccoli@igalia.com,
 pmladek@suse.com, rostedt@goodmis.org, 	john.ogness@linutronix.de,
 senozhatsky@chromium.org, quic_mojha@quicinc.com, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Date: Mon, 17 Feb 2025 12:43:56 +0100
In-Reply-To: <885a9312-484a-4b60-bec0-5adf8f1e4a0e@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
	 <c4b48faeae8531e670ea5909800d1a0bfed69862.camel@sipsolutions.net>
	 <b304d582-9328-4e1b-9e34-5604125b0c06@linaro.org>
	 <59333d4aa8a3bb3222967d70d10d9288cece444c.camel@sipsolutions.net>
	 <885a9312-484a-4b60-bec0-5adf8f1e4a0e@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Mon, 2025-02-17 at 13:39 +0200, Eugen Hristev wrote:
>=20
> On 2/17/25 13:19, Johannes Berg wrote:
> > On Mon, 2025-02-17 at 12:44 +0200, Eugen Hristev wrote:
> > >=20
> > > At this moment going through devcoredump is not something that impact=
s
> > > the idea of the implementation.
> >=20
> > Yeah. I don't think it _should_ go through it at all.
> >=20
> > > The whole reason of going through it (because things work without it =
as
> > > well), is to see whether this has any kind of impact or not, and if
> > > there is any kind of fit/reason of going through it.
> >=20
> > So it's just a trial balloon?
>=20
> Yes, that's why it's marked as an RFC.
>=20

(IMHO) that doesn't make it acceptable to just randomly go modify code
you don't understand the purpose of, certainly not without actually
stating such. But anyway, I'll leave it at that.

johannes

