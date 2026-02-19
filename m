Return-Path: <linux-arm-msm+bounces-93432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNmvHgxil2mCxgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 20:18:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 20636161E47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 20:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76E3530158BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 19:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBBD2F6931;
	Thu, 19 Feb 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXexcDUL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2362DB79F;
	Thu, 19 Feb 2026 19:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771528707; cv=none; b=jv+FoyWjQVv88D7cYxffqDq36B1x9Cir/QYshR007wUTRRdR/5KMyXlHeAxHh8g2gvd78jVkfzDWcxezYiz1QWjj7fcirZP8VolYtvB+A1NOTFAk8y5hzDbxe1JXvCpDoV2Wn8cftvXay4iF65OWZDDXYqbfwgepspTuGNBuyT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771528707; c=relaxed/simple;
	bh=gvXBwyLFdk3xxBFxRxUSJbv6JkCAypUGLwGbTH/OBCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HM/kNRV7uabwik2zDTODSnnpEkOOhPvM8oSOVsjGoDHge5PDAnDtT4TfKzjcRlxdKKU3A4AgeXrh8n4tOdTagNKvN6nI76WvkJ85IpzLgp3KWoi/NjaOlaAry91vCKvi1xTKq4BJb2rVnn/uU3MKZvbZD7/eEp4JMyn6Jq8y7Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXexcDUL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A723C4CEF7;
	Thu, 19 Feb 2026 19:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771528706;
	bh=gvXBwyLFdk3xxBFxRxUSJbv6JkCAypUGLwGbTH/OBCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YXexcDULOjzDtA93bwTJbt66rlxWvePfarSZ7k26QtLaKNqU6T+CWX6UdHtWp/MGT
	 JcUiYSscYQTLtwOQff/J5lt2XrQLKeTnn8c0JZOVNm7fCTF04JAIgkQfAcpINhIain
	 biUi47EYDyxPtJgId52KmRmQtDjrrTULDAlVBtKyzs3pff6p3S+nVUGYICuA3zPyQi
	 Co+HbvuXtvRHZR7AAGU1BgG2134yjsjtv1RVOsqGcJSAvfjhMTtznX6y9MOWztzwst
	 jIw3RTQ817uv4tbW8DZL2Klxn1HR7pt0R3fzYqUByU4AjW6ebXBor+UzYXcnJbwUkd
	 p8z8H3Hov92eQ==
Date: Thu, 19 Feb 2026 13:18:23 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
Message-ID: <ke3anvhgm7popzmrh3eg272eczhtcmgtho6trkwleczim23lcd@dnaudbsrslhr>
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
 <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
 <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
 <q2gogah4suu3nftewye2l3iud2nxwdi7ykzqnagnz7npmrurgm@7icn643kozp6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <q2gogah4suu3nftewye2l3iud2nxwdi7ykzqnagnz7npmrurgm@7icn643kozp6>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93432-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 20636161E47
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 12:53:03PM -0600, Bjorn Andersson wrote:
> On Wed, Feb 18, 2026 at 10:00:22AM -0800, Jeff Johnson wrote:
> > On 2/16/2026 7:25 AM, Bjorn Andersson wrote:
> > > It might very well be that the underlying bug is my expectation that
> > > elem_size should be reflected in the struct and not only in the encoded
> > > message, and hence what I wrote in https://github.com/linux-msm/qmic.
> > > Perhaps the length-specifier of an array should always be u32?
> > > 
> > > @Chris, what does the downstream generator produce here?
> > 
> > Is this behavior just constrained to QMI_DATA_LEN TLVs?
> > 
> > I'm looking at downstream Android WLAN code and it has the same discrepancy,
> > so it appears the code generator is always producing a u32 member in the host
> > struct to hold a QMI_DATA_LEN member even though the actual element size as
> > defined in the qmi_elem_info array is either sizeof(u8) or sizeof(u16).
> > 
> > Does this issue get fixed if we change the member in the host struct, i.e. for
> > the issue mentioned (that I chopped off) modify:
> > struct qmi_wlanfw_request_mem_ind_msg_v01 {
> > -	u32 mem_seg_len;
> > +	u8 mem_seg_len;
> > 
> 
> Yes, that would fix the problem.
> 
> But if your elem_info arrays are coming from the downstream tool, then I
> think the correct way to fix this would be to move in the other
> direction and turn some those u8/u16 members elsewhere into u32.
> 
> I have the downstream code generator source here somewhere...
> 

I reviewed the downstream code generator source and documentation.

We do generate tables matching the ath12k c-structures, i.e. variable
length arrays are always prefixed with an uint32_t field - not a
uint8_t or uint16_t based on elem_size.

Looking back at the original implementation of the in-kernel
qmi_encode(), we only read elem_size bytes from the c-structure, but we
do so into the (little-endian) uint32_t on the stack, from which we
encode the message and act upon the result.

In qmi_decode() we decode elem_size bytes from the message into the
(little endian) uint32_t and then write 4 bytes to the c-structure.


The fix would as such seem to be to just update the length fields to be
all uint32_t. The problem I see with this is that qmic [1] is the only
publicly available code generator, and if we change it to always
generate uint32_t length members, we also need to fix the
encoder/decoder in libqrtr [2] - which will be an ABI breaking change.

If we go the other way around, the drawback is that we no longer support
the c-structures generated by the proprietary code generator.

Worth pointing out is that the structure of the c-code is an ABI between
the encoder/decoder, the code generator and the client - it does not
affect the wire format.

[1] https://github.com/linux-msm/qmic
[2] https://github.com/linux-msm/qrtr

Regards,
Bjorn

> Regards,
> Bjorn

