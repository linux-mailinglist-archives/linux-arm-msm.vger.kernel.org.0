Return-Path: <linux-arm-msm+bounces-113157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rEjUJ6rYL2pfHwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:49:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D91685775
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 12:49:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=UUqR6UkO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113157-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113157-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4EBB3041A08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4B933F360;
	Mon, 15 Jun 2026 10:44:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525B133BBD0;
	Mon, 15 Jun 2026 10:44:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520244; cv=none; b=TJO8SML6QW/1Qi/izAcrLurFn74qhZwUMImcC/IOmWr5Az6DkxY5EKZNDNgR8ECtGZQPztvctgMRftFArcnXp062dpkW1mdFxVMd5rUS/hQrfBW2tbuwR4uhHZTySq2IrE9z0Zlk2Oh9tz9WG62x89pVle2rKqnNLtqFxXciWTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520244; c=relaxed/simple;
	bh=DfTgp2wSml4ZQjrhx3SwSpEFdvwaWTFKpjFP0sd5Z8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=If0nIRHGb8FGiCAVfzfhL9eF+kAcPXRN7piK20QEqSUnKu6Xwx4gOybhvpKh0xJPYMw7HQh8HyjlnHSwY447Z+CyPtv6ROFEg7miTuh6hC0kMCX9mB/ui3/kA/GD5PwshSpTf3suBJkyvCj7fEGRwcopdGjOS/T9LNdIXQbeXDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UUqR6UkO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C553E1F000E9;
	Mon, 15 Jun 2026 10:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781520243;
	bh=9PDFtaN6WevL9bkN2giohbvDON0ZjFvXdKuHiADWkbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UUqR6UkOshzVEYuGZkk+LJkA7CkM7EcoZrgKhlTiZRfiZk+quOcDp3nkIh3kIAwBI
	 b9KuRpWKXU0GTtJBpGTC5MrA8nZUoxYSU1SFmj/j/0SwcvQNxFftTqYnkidl92tHZD
	 uewi5M85cgGu3zj3IqIQ57cE9LCnSWh+YbxQc9ws=
Date: Mon, 15 Jun 2026 12:42:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jiri Slaby <jirislaby@kernel.org>, konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH v4 1/2] serial: qcom-geni: trace: Add tracepoint support
 for Qualcomm GENI serial
Message-ID: <2026061536-skirmish-nuptials-8fd6@gregkh>
References: <20260526-add-tracepoints-for-qcom-geni-serial-v4-0-e94fbaec0232@oss.qualcomm.com>
 <20260526-add-tracepoints-for-qcom-geni-serial-v4-1-e94fbaec0232@oss.qualcomm.com>
 <20260529101422.18dda2ae@fedora>
 <688f0529-44ea-4cdf-bb0f-6c42cb3fa07e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <688f0529-44ea-4cdf-bb0f-6c42cb3fa07e@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113157-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:jirislaby@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-serial@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:dkim,linuxfoundation.org:from_mime,gregkh:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0D91685775

On Mon, Jun 15, 2026 at 03:26:25PM +0530, Praveen Talari wrote:
> HI Steven,
> 
> On 29-05-2026 19:44, Steven Rostedt wrote:
> > On Tue, 26 May 2026 23:07:39 +0530
> > Praveen Talari <praveen.talari@oss.qualcomm.com> wrote:
> > 
> > > +DECLARE_EVENT_CLASS(geni_serial_data,
> > > +		    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
> > > +		    TP_ARGS(dev, buf, len),
> > > +
> > > +		    TP_STRUCT__entry(__string(name, dev_name(dev))
> > > +				     __field(unsigned int, len)
> > > +				     __dynamic_array(u8, data, len)
> > > +		    ),
> > > +
> > > +		    TP_fast_assign(__assign_str(name);
> > > +				   __entry->len = len;
> > > +				   memcpy(__get_dynamic_array(data), buf, len);
> > > +		    ),
> > > +
> > > +		    TP_printk("%s: len=%u data=%s",
> > > +			      __get_str(name), __entry->len,
> > > +			      __print_hex(__get_dynamic_array(data), __entry->len))
> > > +);
> > No need to save the length of the dynamic array in __entry->len because
> > it's already saved in the metadata of the dynamic array that is stored
> > on the buffer. Instead you can have:
> > 
> > DECLARE_EVENT_CLASS(geni_serial_data,
> > 		    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
> > 		    TP_ARGS(dev, buf, len),
> > 
> > 		    TP_STRUCT__entry(__string(name, dev_name(dev))
> > 				     __dynamic_array(u8, data, len)
> > 		    ),
> > 
> > 		    TP_fast_assign(__assign_str(name);
> > 				   memcpy(__get_dynamic_array(data), buf, len);
> > 		    ),
> > 
> > 		    TP_printk("%s: len=%u data=%s",
> > 			      __get_str(name), __entry->len,
> > 			      __print_hex(__get_dynamic_array(data),
> > 					__get_dynamic_array_len(data)))
> > );
> > 
> > That will save you 4 bytes per event on the ring buffer. And a few
> > cycles not having to store the redundant information.
> 
> This patch has already been accepted and is available in linux-next.

Great, can you send a fixup for it?  Or want me to revert this instead?

thanks,

greg k-h

