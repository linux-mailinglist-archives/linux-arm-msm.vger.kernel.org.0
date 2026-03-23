Return-Path: <linux-arm-msm+bounces-99341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJV2J15jwWn/SgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:59:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 438642F738D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3931319119A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B804D3AB295;
	Mon, 23 Mar 2026 15:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="ttL/xiXB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2673F3AE1A1;
	Mon, 23 Mar 2026 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280637; cv=none; b=RusX0mD99ziLyqMid7qYmx7wA97+bwKCdfQVH0LiLBO4nfXGVjVFtGQ6UNbt1jF1/kcUOFeG796bM9GMLp8DHgOzRGnDKpSOU2CHDA5YGxGDjN60USgl04MxhUStFvjoPhHFzPitAG7lzWWmfuiL4LkqoBf/3ZodCDfXkkzW9bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280637; c=relaxed/simple;
	bh=B1o5URvPzwmEcxoUWyKBoqgUl8HaRFFY9YxmPEjcWOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKBZGep3dypkm3G4KJQ0QulH/Qd4P3ONkhvlrXuX32FGp6nrqRpxBOWySSR1WbbuJInkEjj/sDRoJc0WXY1qiKK1bImwcn+5rfO3JbwdRubkwzWVr9Cd7RPeoGTis5EwLpmkvLIuy3fdXEIC5EMgC66IzQ5/5JeXRE2o8Jeq5sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=ttL/xiXB; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4ffcsR3cj5zlfl7s;
	Mon, 23 Mar 2026 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1774280631; x=1776872632; bh=B58XW4/MT0oQw9QUUAtmwPA8
	uU0YmaPC0MBV72BTgsg=; b=ttL/xiXBb5oHkHZuuQoXQ1kxSGhXJjTVM+l1WtJb
	CeBVurzFUCvNNDNeSVCewWsN8mjLe2dkWxxsI6lU13bZuU28yyTQIReAVHDbyXL4
	sij1WD7p0cCFhDASZzmu0o36XqZAhFh6JXNM4dmhUb7DTjNahJqbVIFeuYoKkpFE
	LAVxuzEQrwUveh7RB7UEueeU64HdYo9YvJrrjHzcOF6RAJ7cfXpVvBqBc1Qaetl6
	eTx0UK5UPBuA8ZTeRME9fviZ9Z76f4r5Pt4358PMKA7xFAf81xu9/e5Z1ykaUN/B
	7Pj+UdBFKa2YVfrnZw6WAWXnUktTlg64cRq6qQJye/5LqA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Uf3_bMWNNfWk; Mon, 23 Mar 2026 15:43:51 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4ffcsK4PbszlfvpM;
	Mon, 23 Mar 2026 15:43:49 +0000 (UTC)
Message-ID: <7922d339-5e85-4b12-9e32-f095e10b1211@acm.org>
Date: Mon, 23 Mar 2026 08:43:48 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ufs: core: Configure only active lanes during link
To: palash.kambar@oss.qualcomm.com, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20260311060912.3139257-1-palash.kambar@oss.qualcomm.com>
 <20260311060912.3139257-2-palash.kambar@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260311060912.3139257-2-palash.kambar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[acm.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99341-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,acm.org:dkim,acm.org:mid]
X-Rspamd-Queue-Id: 438642F738D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/10/26 11:09 PM, palash.kambar@oss.qualcomm.com wrote:
 > [ ... ]
 > +static int ufshcd_get_connected_tx_lanes(struct ufs_hba *hba, u32 
*tx_lanes)
> +{
> +	return ufshcd_dme_get(hba,
> +			      UIC_ARG_MIB(PA_CONNECTEDTXDATALANES), tx_lanes);
> +}
> +
> +static int ufshcd_get_connected_rx_lanes(struct ufs_hba *hba, u32 *rx_lanes)
> +{
> +	return ufshcd_dme_get(hba,
> +			      UIC_ARG_MIB(PA_CONNECTEDRXDATALANES), rx_lanes);
> +}

The body of the above two functions is very short. Please remove these
functions and instead inline these function into their only caller.

> +static void ufshcd_validate_link_params(struct ufs_hba *hba)
> +{
> +	int val = 0;
> +
> +	if (ufshcd_get_connected_tx_lanes(hba, &val))
> +		return;

Shouldn't it be reported if ufshcd_get_connected_tx_lanes() fails?

> +	if (ufshcd_get_connected_rx_lanes(hba, &val))
> +		return;

Same question here - shouldn't it be reported if
ufshcd_get_connected_rx_lanes() fails?

Why does this patch only call dev_err() in case of a mismatch instead of 
adjusting hba->lanes_per_direction or making initialization fail?

Thanks,

Bart.

