Return-Path: <linux-arm-msm+bounces-114817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cC5eLl3zQWoZwwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:23:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 099926D5D29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:23:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=cdgD8Aml;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114817-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114817-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5516A30107C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161A43233F4;
	Mon, 29 Jun 2026 04:23:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89F42F8E93;
	Mon, 29 Jun 2026 04:23:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707033; cv=none; b=STA4MLp1m55JqV82WT6kHEpplpGQIKAijUkVTr3HxoJoH9U2GOw4pXmF/UOogsW0rua/45i3ApWHfBFJ89auqafT7y+fZOAdgpf3dYoReOeGFNsassGVl0WAnn2EbG7jjygC6ATSbhBVSeTNPZGC7KKV3se3263N2vUeacKVdZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707033; c=relaxed/simple;
	bh=2v8U6YY2IfvuIrRd6d3Ish8RxCNCO8hgI2WlB/ukcAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBlJgLzxRNAAqPCv12yN3kKGe8WAw/tIA/4JygU9eO0V0RqWccua2b0s39BjR54MOZvfe0quKNh+qAn6RXQ0nlqLnOqUdGdJ6GS3eSlYnuvWYeNvUlQBRj9naZu7krVftxUW8qK3kddKUEipa0TozKkNP24bXwN3ntYbZmHGqek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cdgD8Aml; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAB11F000E9;
	Mon, 29 Jun 2026 04:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782707031;
	bh=GMSEo47JNrqpAkPqEL+EygxS63QZdMKPNqyBWVmnlBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cdgD8AmlegczizJj7HovfqCr7SrqOL+w/drR6Tl5guPoMQYY3u5GR4gLyeG0nJ4tv
	 EVyCqKa6WK0q2CNJOP3b3TZ7+0iRKNbI/XT/8Jp+Z0RhEnEHzti04M/pkR2DFYGQ6+
	 ByMAjCB59wvpDwOTUJanulyVggfWVeh2S6aEOR0c=
Date: Mon, 29 Jun 2026 06:22:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
Cc: andersson@kernel.org, alexander.shishkin@linux.intel.com,
	mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
	suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v14 0/7] Provide support for Trigger Generation Unit
Message-ID: <2026062959-distaste-launder-e253@gregkh>
References: <20260417073336.2712426-1-songwei.chai@oss.qualcomm.com>
 <48c6abce-c492-46a6-84ef-3074983e817c@oss.qualcomm.com>
 <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a36a1ed3-5194-465c-b029-0404e0f2bcee@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114817-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:songwei.chai@oss.qualcomm.com,m:andersson@kernel.org,m:alexander.shishkin@linux.intel.com,m:mike.leach@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:james.clark@arm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:coresight@lists.linaro.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gregkh:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:dkim,linuxfoundation.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 099926D5D29

On Mon, Jun 29, 2026 at 11:03:33AM +0800, Songwei.Chai wrote:
> Hi Greg & Alexander,
> 
> Apologies for interrupting again.
> 
> As the TGU hardware plays an important role in Qualcomm tracing design, I
> would greatly appreciate it if you could kindly take some time to review
> this at your earliest convenience.

The merge window _just_ closed, please give us a chance to catch up.

Also, why us?  Surely you have other reviewers for this code, right?

thanks,

greg k-h

