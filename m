Return-Path: <linux-arm-msm+bounces-106711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG8dM/oc/mkRnAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 19:27:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3214F9F4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 19:27:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5859F303F064
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 17:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8C833ADA8;
	Fri,  8 May 2026 17:25:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4B22989BC;
	Fri,  8 May 2026 17:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778261143; cv=none; b=Cw5nSmblXEEWnGu3MNPkvtLa6AIOahtfX7rLeX1kDuhHF9QOK5FTeelxV98NFMKhEuyfESUd1hOKCDTaB6ya7I27ArcE8T7yGRKJ8Z18buKcnUwFnMTw8DuUEwNl7ZqfUDBXjinLuDhVIJzv8duHjpG6Tt+a5wasEpc9yldddac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778261143; c=relaxed/simple;
	bh=meW8hoDSYVYhOU+KTAjOT1Zo4ZdSt6Joy9YDKsW4iyw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oHE/uUStyXFHI0ifHs0Az0CyK21mOH2DV05E2fiUEwCfpAQn+WjpyRkLlkp3kZxTXNCEFTZmBiZ8lXAhztQaaEVlVrgfll3Oep/dl+HaOtpISP5Hh6m4nNv7tNZ3lASPueDEX40OEv70xnYK77gx4YcMb8isvdMLc3DhAtZkBTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 34FCE1C00C6;
	Fri,  8 May 2026 17:25:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 7E41B20028;
	Fri,  8 May 2026 17:25:31 +0000 (UTC)
Date: Fri, 8 May 2026 13:25:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Konrad
 Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-serial@vger.kernel.org, Mukesh Kumar Savaliya
 <mukesh.savaliya@oss.qualcomm.com>, Aniket Randive
 <aniket.randive@oss.qualcomm.com>, chandana.chiluveru@oss.qualcomm.com,
 jyothi.seerapu@oss.qualcomm.com
Subject: Re: [PATCH v1 1/2] serial: qcom-geni: trace: Add tracepoint support
 for Qualcomm GENI serial
Message-ID: <20260508132543.4f100ae0@gandalf.local.home>
In-Reply-To: <20260506-add-tracepoints-for-qcom-geni-serial-v1-1-544b22612e08@oss.qualcomm.com>
References: <20260506-add-tracepoints-for-qcom-geni-serial-v1-0-544b22612e08@oss.qualcomm.com>
	<20260506-add-tracepoints-for-qcom-geni-serial-v1-1-544b22612e08@oss.qualcomm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: pbwffrhnjpor1o8jn7kduz9435km6fgf
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19GCmoc2M5FMeOEaj2DNukzaL262jgj+uE=
X-HE-Tag: 1778261131-565295
X-HE-Meta: U2FsdGVkX1+xYsK3T5FT3JEIiEOLgp7WSQHXLeHoD6UniVsPHJybK/nx76Mhu1RHbGrVEiL1KYFap//ZELjVdh9wl/NS5jk63r6kf6kNmVmttDPnZ1CsmtTuVJGP6fC9CGT/lFUA80r7xE10eTt9qkydxHpEZOaeoePRsV/UNhqycENjt0u6Sp5M/F4C9ZyvATGa5wPnyXdtPMmvtioXSF9iDDK4tdTh3wW8ShUFxCv1s40RbEmJC3Xh6K5eykjdLDANwae8VyA16Rx1qBA4UzXbjk0KjZsiVz3j0u16jed8BXhzBR+NMok9ZSPwlC5d2pbC3l9stVouTLPDcmQb3pzAWXzKvBoP
X-Rspamd-Queue-Id: 7A3214F9F4D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-arm-msm@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106711-lists,linux-arm-msm=lfdr.de];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, 06 May 2026 22:54:44 +0530
Praveen Talari <praveen.talari@oss.qualcomm.com> wrote:

> +TRACE_EVENT(geni_serial_tx_data,
> +	    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
> +	    TP_ARGS(dev, buf, len),
> +
> +	    TP_STRUCT__entry(__string(name, dev_name(dev))
> +			     __field(unsigned int, len)
> +			     __dynamic_array(u8, data, len)
> +	    ),
> +
> +	    TP_fast_assign(__assign_str(name);
> +			   __entry->len = len;
> +			   memcpy(__get_dynamic_array(data), buf, len);
> +	    ),
> +
> +	    TP_printk("%s: tx_len=%u data=%s",
> +		      __get_str(name), __entry->len,
> +		      __print_hex(__get_dynamic_array(data), __entry->len))
> +);
> +
> +TRACE_EVENT(geni_serial_rx_data,
> +	    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
> +	    TP_ARGS(dev, buf, len),
> +
> +	    TP_STRUCT__entry(__string(name, dev_name(dev))
> +			     __field(unsigned int, len)
> +			     __dynamic_array(u8, data, len)
> +	    ),
> +
> +	    TP_fast_assign(__assign_str(name);
> +			   __entry->len = len;
> +			   memcpy(__get_dynamic_array(data), buf, len);
> +	    ),
> +
> +	    TP_printk("%s: rx_len=%u data=%s",

Do you really need to say "tx_len" and "rx_len", could it just be "len" and
have the name of the tracepoint show what it is?

Each TRACE_EVENT() is really just a:

  DECLARE_EVENT_CLASS() followed by a DEFINE_EVENT()

underneath.

And each TRACE_EVENT() costs around 5K in size, where most of that is in
the DECLARE_EVENT_CLASS() portion. Thus, you can save some memory by using
DECLARE_EVENT_CLASS() and then define the above two events with
DEFINE_EVENT().

-- Steve


> +		      __get_str(name), __entry->len,
> +		      __print_hex(__get_dynamic_array(data), __entry->len))
> +);
> +


