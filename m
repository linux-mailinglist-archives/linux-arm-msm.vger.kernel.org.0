Return-Path: <linux-arm-msm+bounces-100750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEdpB/NPymmb7QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:26:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D3F359398
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B2173011C5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675F93B4E9E;
	Mon, 30 Mar 2026 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2d0Zcm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452D6389115
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866177; cv=none; b=Xrr51YivIxavRHJTgoLOvtBqIxHzph5OUIt/tNmd65fvpMgQfRaHxVRt0uSz4OCSanj5OE0j/o4E2A8WJfIIuDhcl5vX6kzfpKGAlKEWVMZf5xm+RKwpG+wLk268QVMQ0zjHMmFxAlHRxlDYubhWQt11AKGcJ4deKzX5vcEWUYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866177; c=relaxed/simple;
	bh=UhIoh20nwHnbqvK6wntY7QrMeI9nU8d6741W+cn7i78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZCvdzoKIc4xBypkzoXIgWEEpZEhwieByZHnFNQLLurqut5w5qrY9qGFJVmroNU+sLxktB1hpvwFRLwIkE8cJdxEU36rkc1Dw7XLoX5zc9Yq8NioC7lkm5008EAzkcQ5qmeZUWTp4CeVeQymMBLrAR8m8l2300+PSA3oqIEZQ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2d0Zcm0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA12FC4CEF7;
	Mon, 30 Mar 2026 10:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774866177;
	bh=UhIoh20nwHnbqvK6wntY7QrMeI9nU8d6741W+cn7i78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X2d0Zcm0jEdPA9C1KtcJsvtZPphaNEm3GQ7tGAU0D7imMGpfGzmgaiz1tE1cyYysN
	 jhQ8vmW7WxA0m9zZqwAw0IjYeX0tkMhIHguCgHCgUmcJJsOtebvnPslTfbr2GimFC+
	 uVN791npZ/E+tWOyo6yS1Zk8UXiL7EsQf6Agok2GTJZ1glJ3uIkEJz/UJ7yyd97wL6
	 nqFK/iu+AWniDPeT82aXeERD6IUwkNEQ/oJ1suF0+BsEMStiFhgslZD4tT3hO2fHaL
	 q1Guu9JVgYjacHLelGyOWPvN1Tzs1w2Y+KaRK7rB7l8HkLLcATOc5UpDrMV17qWT0R
	 rUHsmV9mxklCg==
Date: Mon, 30 Mar 2026 15:52:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, 
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, alok.a.tiwarilinux@gmail.com
Subject: Re: [PATCH] soc: qcom: llcc: fix v1 SB syndrome register offset
Message-ID: <6cnoynufmd7fptlczppesfxp6faxpt5ike3eiqr422dounhnvw@o2j2berg5ixd>
References: <20260330095118.2657362-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260330095118.2657362-1-alok.a.tiwari@oracle.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100750-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:email]
X-Rspamd-Queue-Id: 73D3F359398
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 02:51:11AM -0700, Alok Tiwari wrote:
> The llcc_v1_edac_reg_offset table uses 0x2304c for trp_ecc_sb_err_syn0,
> which is inconsistent with the surrounding TRP ECC registers (0x2034x)
> and with llcc_v2_1_edac_reg_offset, where trp_ecc_sb_err_syn0 is 0x2034c
> adjacent to trp_ecc_error_status0/1 at 0x20344/0x20348.
> 
> Use 0x2034c for llcc v1 so the SB syndrome register follows the expected
> +0x4 progression from trp_ecc_error_status1. This fixes EDAC reading the
> wrong register for SB syndrome reporting.
> 

That's a silly typo. Thanks for spotting it!

> Fixes: c13d7d261e36 ("soc: qcom: llcc: Pass LLCC version based register offsets to EDAC driver")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/soc/qcom/llcc-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index ad5899d083f3..b80d3f9cff64 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -3943,7 +3943,7 @@ static const struct llcc_slice_config x1e80100_data[] = {
>  static const struct llcc_edac_reg_offset llcc_v1_edac_reg_offset = {
>  	.trp_ecc_error_status0 = 0x20344,
>  	.trp_ecc_error_status1 = 0x20348,
> -	.trp_ecc_sb_err_syn0 = 0x2304c,
> +	.trp_ecc_sb_err_syn0 = 0x2034c,
>  	.trp_ecc_db_err_syn0 = 0x20370,
>  	.trp_ecc_error_cntr_clear = 0x20440,
>  	.trp_interrupt_0_status = 0x20480,
> -- 
> 2.50.1
> 

-- 
மணிவண்ணன் சதாசிவம்

