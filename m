Return-Path: <linux-arm-msm+bounces-110285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNKiOXGhGWq7xwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:23:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA6960376D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CE9830057B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BEE2E22BD;
	Fri, 29 May 2026 14:14:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C6835E1C5;
	Fri, 29 May 2026 14:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064072; cv=none; b=BUYMNayqx6GVzqJ03AEhHUHOWi/s+oHQQI2u/iTlGk+B76Stp5iJfNYvTrpZxtDv8pwuKfh1RaUGya+y/xTKvEhx2OUGWcFtaFO7wCZjCSBr1dq0s00Re5zlrY17fG2aANKU74T7LO20/haMqLNEhJcFkgw/0Q5GtSB+7xKZWv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064072; c=relaxed/simple;
	bh=GrTSQWjc1sYSEz63RTYdrlsQS+sKWphZpM0iM9qZw20=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hks9VlDS5AubntG2drTqut63ey+luLTn7wOWGkHz/sMcbVlcnpulUDUzw5g2Sr6pYrHiPHIwGIBCjjH7Rkyg4FoqMMpYniJTxIXFxfkmRdBWxOp29FVvUiETMly1+kU2876Vyk+RIazsWteQKKFQwilAOhQhOKqkyGkUUXGbTrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 85C751A01A2;
	Fri, 29 May 2026 14:14:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id A9F982002F;
	Fri, 29 May 2026 14:14:23 +0000 (UTC)
Date: Fri, 29 May 2026 10:14:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 konrad.dybcio@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-serial@vger.kernel.org, mukesh.savaliya@oss.qualcomm.com,
 aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH v4 1/2] serial: qcom-geni: trace: Add tracepoint support
 for Qualcomm GENI serial
Message-ID: <20260529101422.18dda2ae@fedora>
In-Reply-To: <20260526-add-tracepoints-for-qcom-geni-serial-v4-1-e94fbaec0232@oss.qualcomm.com>
References: <20260526-add-tracepoints-for-qcom-geni-serial-v4-0-e94fbaec0232@oss.qualcomm.com>
	<20260526-add-tracepoints-for-qcom-geni-serial-v4-1-e94fbaec0232@oss.qualcomm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: yfgnoe7jw9zye7366momfqct7ppk38yh
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19fjZ7XFQxwrn4oDXu5JyJWuPJ107L2vLw=
X-HE-Tag: 1780064063-462947
X-HE-Meta: U2FsdGVkX1+eEZ3KTVI3Xc+qc8WXgyMca6DhnKvtG9vLtduJksWXDfvweGPagdAmyWFJ82ALJiTU98LrHde2ODnQ8YQdtyOpv9jB+c9Ep1Ls/vQRyyt0tWmxngSQs7ag1bbUjYTnWEL85ZR7iyaNWg+an7OVLTL8xCczcuM22tIYval4ixRLxD5Ml2UGtTEtJgprymVumSmp6huNzzTp66op8p0nOdEjezmcbguN/gFbGiKGSlq0Nwm99cgfJiBsjmHJnUDAwsWxb1z5qo3HzuFEtFMLqHxwI6bz++Pk+W3bKVQ9xoEBEY6if4//EqV+OGFQAgEyWuxbwChBlLNRI20PvTjZ1KPM
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110285-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6AA6960376D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 23:07:39 +0530
Praveen Talari <praveen.talari@oss.qualcomm.com> wrote:

> +DECLARE_EVENT_CLASS(geni_serial_data,
> +		    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
> +		    TP_ARGS(dev, buf, len),
> +
> +		    TP_STRUCT__entry(__string(name, dev_name(dev))
> +				     __field(unsigned int, len)
> +				     __dynamic_array(u8, data, len)
> +		    ),
> +
> +		    TP_fast_assign(__assign_str(name);
> +				   __entry->len = len;
> +				   memcpy(__get_dynamic_array(data), buf, len);
> +		    ),
> +
> +		    TP_printk("%s: len=%u data=%s",
> +			      __get_str(name), __entry->len,
> +			      __print_hex(__get_dynamic_array(data), __entry->len))
> +);

No need to save the length of the dynamic array in __entry->len because
it's already saved in the metadata of the dynamic array that is stored
on the buffer. Instead you can have:

DECLARE_EVENT_CLASS(geni_serial_data,
		    TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
		    TP_ARGS(dev, buf, len),

		    TP_STRUCT__entry(__string(name, dev_name(dev))
				     __dynamic_array(u8, data, len)
		    ),

		    TP_fast_assign(__assign_str(name);
				   memcpy(__get_dynamic_array(data), buf, len);
		    ),

		    TP_printk("%s: len=%u data=%s",
			      __get_str(name), __entry->len,
			      __print_hex(__get_dynamic_array(data),
					__get_dynamic_array_len(data)))
);

That will save you 4 bytes per event on the ring buffer. And a few
cycles not having to store the redundant information.

-- Steve

