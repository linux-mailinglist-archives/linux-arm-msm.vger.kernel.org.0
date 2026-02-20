Return-Path: <linux-arm-msm+bounces-93440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h0C2NhfTl2lM9AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 04:20:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AA01645B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 04:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC76730209E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 03:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4349A274FE8;
	Fri, 20 Feb 2026 03:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTJJkWdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDC11DF755;
	Fri, 20 Feb 2026 03:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771557653; cv=none; b=oG+LJGPRptPXaSnQqpMWwHGPpYJQJOMsg8szvvk3N33uy+nQ9uEQeKQnAD1fU10TuRdhVkX04OCX+z1UnIbkQWgi4ug3n1I27eEuoEPW9sHCbTLs/cQWwDtLzxvZGovOgGNaUPdDSrHv/6z/VYKHJ+4LOCgvJMzpP+KbiemVEEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771557653; c=relaxed/simple;
	bh=wgWPPCRutcpO0Vhe/8Eobv+T7qlKLjGdFeswF+1azuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HR4n1JOii8Xep99r5os6KQ0WOs6DJ4AeLMNY8WBTQBQRZb0XhMkHy19jDbrIxWuaojNMeQTXO1UuTNlcQ6UAkpj5ZGtUq47EWvyEKhypHK+84W493s5RTwPnWGE5+1B5EQkO/rixj/DS12c4JG3DkKogPFG26ksom9HMCZXI82U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTJJkWdw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 938E0C4CEF7;
	Fri, 20 Feb 2026 03:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771557652;
	bh=wgWPPCRutcpO0Vhe/8Eobv+T7qlKLjGdFeswF+1azuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTJJkWdwSDM3vKCDuXGH7+QA7AxvOe4/p4VvANZJGC1UXLvxckICmzFt1ZsiEmlgP
	 MqvGYf/lrB5t0UnDAUrz4B6LwFK/8DZaCy7Ci63LpyUE8ESBH70GxDhq7OZYSdHKG9
	 fvLtjZgnUCseWLjoB+PgbE4XHIOTBOA6CjQGO5+RwZWYCuQ6LpEQVetCmzg4i7ieta
	 VlJ3zicDCTHQJRRdW4m2wzDy7/TEbEh+Z2/6houW6nc8Ja1gYmGrwP42KkwmYJ/TrM
	 TpdPUk7fZAiGYeHxYtTgAUEnGY+/Yj/35XpVnYmMWQgtMQaBx/guFVhJrgEZRovJXQ
	 sgHkhwHnXdYGg==
Date: Thu, 19 Feb 2026 21:20:49 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
Message-ID: <jys6bzcbdl5wly255nlcyjqrq4tehxpez2ydybm4ae7dalqxmq@s3xcuzy7ckqa>
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
 <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
 <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
 <q2gogah4suu3nftewye2l3iud2nxwdi7ykzqnagnz7npmrurgm@7icn643kozp6>
 <ke3anvhgm7popzmrh3eg272eczhtcmgtho6trkwleczim23lcd@dnaudbsrslhr>
 <1ad37b2f-5f3c-493e-ba3c-fec1a0377767@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ad37b2f-5f3c-493e-ba3c-fec1a0377767@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93440-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 28AA01645B2
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 01:25:36PM -0800, Jeff Johnson wrote:
> On 2/19/2026 11:18 AM, Bjorn Andersson wrote:
> > I reviewed the downstream code generator source and documentation.
> > 
> > We do generate tables matching the ath12k c-structures, i.e. variable
> > length arrays are always prefixed with an uint32_t field - not a
> > uint8_t or uint16_t based on elem_size.
> > 
> > Looking back at the original implementation of the in-kernel
> > qmi_encode(), we only read elem_size bytes from the c-structure, but we
> > do so into the (little-endian) uint32_t on the stack, from which we
> > encode the message and act upon the result.
> > 
> > In qmi_decode() we decode elem_size bytes from the message into the
> > (little endian) uint32_t and then write 4 bytes to the c-structure.
> > 
> > 
> > The fix would as such seem to be to just update the length fields to be
> > all uint32_t. The problem I see with this is that qmic [1] is the only
> > publicly available code generator, and if we change it to always
> > generate uint32_t length members, we also need to fix the
> > encoder/decoder in libqrtr [2] - which will be an ABI breaking change.
> 
> And IMO that is a deal breaker since it would break the interface with all
> existing legacy firmware.
> 

No, the firwmare-facing encoded length in the messages are currently all
little-endian elem_sized, and this would be unchanged. It's merely a
question about the ABI between code generator, encoder/decoder, and the
client code.

> > 
> > If we go the other way around, the drawback is that we no longer support
> > the c-structures generated by the proprietary code generator.
> > 
> > Worth pointing out is that the structure of the c-code is an ABI between
> > the encoder/decoder, the code generator and the client - it does not
> > affect the wire format.
> > 
> > [1] https://github.com/linux-msm/qmic
> > [2] https://github.com/linux-msm/qrtr
> 
> Going back to the original implementation that reads and writes a u32 on the
> stack, can we stick with that but add endian logic that correctly converts
> between u32 host endian on the stack and either u8 or u16 little endian in the
> messages? Is this specific to QMI_DATA_LEN TLVs?
> 

I gave it some more thought, and discussed a bit with Chris Lew.

If we change qmic to produce uint32_t length entries and align the
in-kernel interfaces to use 32-bit lengths the kernel works fine - and
thanks to Alexander's work, should support both endianes (will double
check).

For the userspace library, the decoder already writes 32-bit fields
(into the u8/u16...) so the situation for currently generated c-structs
will be unchanged and it will be correct for 32-bit fields.

The encoder is reading u8/u16 from the c-struct and encodes this. Just
as with the structs in athNNk, we can change them to 32-bit without
impacting the encoder; as long as we don't change the encoder...
The only problem I think we have left is that we can't fix the userspace
encoder - as this would be incompatible with current clients (u8/u16
can't be read as u32).


I'll take another pass tomorrow, to review this, review Alexander's work
once more, and prepare some patches.

Regards,
Bjorn

