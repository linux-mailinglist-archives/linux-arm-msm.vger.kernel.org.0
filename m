Return-Path: <linux-arm-msm+bounces-93320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id E8d1LZYKlmmaZAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 19:53:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE473158D2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 19:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F9A93012C4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACED309F1F;
	Wed, 18 Feb 2026 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2CDNTES"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764B52874E0;
	Wed, 18 Feb 2026 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771440786; cv=none; b=ad/sevIFNJ0w8Yqg/u1yneDcdcGihyx5p7V+F4Uv9doz4qApOwGMqnH10dw0OY4QOQQ+W2HKGOpZlgK+aw+LxDABGl1kja8cqQ1dHoIcjxVggQ2MxkrJvTqXsQBJDicOxq3iIyKTIhP976uHABqlKGhkFQoZ6RJQIkKgnRcF8AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771440786; c=relaxed/simple;
	bh=FRllGX9nLo+CpVjaG2YksqYXbdeYtFiLPME24SliD7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ht74rRpIblbZXgR3zeuKPfnSkZFhBrqhszz03Nw3j0wgzjWBd6RqIDQorlHplPoa9JlMpFsh2rXXmRS8QDmgWwlaHW0nYbEXgtHm7Ajob94oG6RtXpo1qJFktpC5ztwABUWVmvJ3zVbDZe68NZNaWGb9ml1XbMe1XCrJF9QkV2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2CDNTES; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCBAC116D0;
	Wed, 18 Feb 2026 18:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771440786;
	bh=FRllGX9nLo+CpVjaG2YksqYXbdeYtFiLPME24SliD7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2CDNTESaRrCSKdOZB0a+CsOvs025z6t9xnHCAm3im4+gboUNNyQeWvceFb40N2a6
	 n10wr669Z/L56T1OtSoIZxx4KuriPXk4IVW+DPp9St0G/W7cmbmZ8+fT3DdSVjOOi2
	 j2g1UgpKskVk9/JyA1iOGJv9N844ExVPzQEmCJP87qXAUVnir/tDa7xTNWXhjjhT43
	 pEHN2Pu1nbA35ys6G+xXR+NspnXzOxKM/cL39h29+7O2Zlz5a6zEdARjQ0s9DjssYx
	 LTKd+IbBqjkATDYHd4K/95FiT9W4gvtcV/AusAC4SwQmjpYZWsmdGdgSVwYGnbOl2R
	 ZSJWh3inAfFSA==
Date: Wed, 18 Feb 2026 12:53:03 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>, 
	Chris Lew <christopher.lew@oss.qualcomm.com>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
Message-ID: <q2gogah4suu3nftewye2l3iud2nxwdi7ykzqnagnz7npmrurgm@7icn643kozp6>
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
 <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
 <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93320-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE473158D2F
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 10:00:22AM -0800, Jeff Johnson wrote:
> On 2/16/2026 7:25 AM, Bjorn Andersson wrote:
> > It might very well be that the underlying bug is my expectation that
> > elem_size should be reflected in the struct and not only in the encoded
> > message, and hence what I wrote in https://github.com/linux-msm/qmic.
> > Perhaps the length-specifier of an array should always be u32?
> > 
> > @Chris, what does the downstream generator produce here?
> 
> Is this behavior just constrained to QMI_DATA_LEN TLVs?
> 
> I'm looking at downstream Android WLAN code and it has the same discrepancy,
> so it appears the code generator is always producing a u32 member in the host
> struct to hold a QMI_DATA_LEN member even though the actual element size as
> defined in the qmi_elem_info array is either sizeof(u8) or sizeof(u16).
> 
> Does this issue get fixed if we change the member in the host struct, i.e. for
> the issue mentioned (that I chopped off) modify:
> struct qmi_wlanfw_request_mem_ind_msg_v01 {
> -	u32 mem_seg_len;
> +	u8 mem_seg_len;
> 

Yes, that would fix the problem.

But if your elem_info arrays are coming from the downstream tool, then I
think the correct way to fix this would be to move in the other
direction and turn some those u8/u16 members elsewhere into u32.

I have the downstream code generator source here somewhere...

Regards,
Bjorn

