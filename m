Return-Path: <linux-arm-msm+bounces-111450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KMu/Nof7ImpPgAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 18:38:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B287C649D80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 18:38:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=marek.ca header.s=google header.b=U31cEtL8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111450-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111450-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 959543017E4E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 16:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4303803F3;
	Fri,  5 Jun 2026 16:29:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453BD3B42D5
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 16:28:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676940; cv=none; b=BGn23to7t41MU1lQp0yCLgBLI3qEb/g58a3OX+G1p+83wvuAq99HpjZKVdmxrC3iZr4hEBLi5YX3nqZe7Jq2vfeXgfi9GjMLZSIz/Ryi0HKXIJYzJkwXmCIZEWvRImfJgoU4T/y+YP1wqz4j+trt0KL71MIO0jWHKOOwEy8fnkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676940; c=relaxed/simple;
	bh=G2UoaTUBsy8YP1XAK8MC20PbrieDy7yS/loF19hogbg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Cu1boaHZSDokPWNHd44Ux5qJEWnckFqcnnJMZX8WZiVkhHXX2pDA2fWsvAaVOE2XQcUoWQLyfO6s8wrA0WE9M+jD53W7ssriSCWfa+e+R2SILNUthtb1hpQEGjEJYhICmeFV/04VeJxddLyoFMZT3nYSJ8pFRA90CHmTUHqub94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=U31cEtL8; arc=none smtp.client-ip=209.85.222.178
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-915ab38ac14so152214385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 09:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1780676931; x=1781281731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keYw8EcQ4PK+W0SNMoTM+wvQ1RmTHYvCycVi3RIxEGs=;
        b=U31cEtL8hb102unwA4N19zq3dZs6hHu2KoOQb2fPXFc4EzSKfLLxyp0NHMfHBo5vaN
         6uUnP0i8qymujvCSA/fj1Hf7xxTCr6nHhwW8ZIP1qgmFpYS+QO3mvhobckR+5cC1gvT4
         OfZIEf9uSHXjdWPHhAc6A2EpeAAuToMnN9nBpIdAbRXRT/+zMa66m64jRfDQCXQe9+Nx
         stdKGDKCm4KKR0a0XWNYEnqccp4t14zP7mzingQqjTMemzIkyaIRapQdbN2oRsk8QF1L
         m1lGBKJoWCaPnWGySGxnSAO2ugJDDCkA1MSaEl6y+jre866A320dm/XqJ6+uzJZdnPkg
         07uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780676931; x=1781281731;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=keYw8EcQ4PK+W0SNMoTM+wvQ1RmTHYvCycVi3RIxEGs=;
        b=MaOlNjJSf+fuE4rPAKCccHAXFb/RLossmCPNEPN5xjjc4aFRGgfAyYqg1dRcCChCU4
         mSMvtoCVeODnwajK+B5QMNKBpdz7ihEQ1kwi+ZzQAPbyU2ULUdaAkZpsS96xAg0N3bDk
         ofL4ajOoOGmUNnvT6Znjk3KOXzi8+498SJnX4SoqjqZCC5dM6UQSILxrQrEae5Ybd8mA
         XFjONCgQxIFR6hkswyhpggfa6LsXj4weqvtOQb0frgLxJHr3VBRj8UplzJUJg20l6fwo
         9BHEACE4Cbjk4zAmrW7A8YyBbK+T3CHztx0WaeCqQrLY3JFFO/lzZZ6ZwuH/lj1uiDcZ
         E7Uw==
X-Gm-Message-State: AOJu0YwFGBEtyDFTAg8L88o55aRMfkMCuj8HYddD4uCNL4RMKKowHre5
	ZL8Npke4zDY/XCNq43y36OE7kYYhimHQnG8Kd5hV6JRZ87YHjuVp3EDkMusOkrhF5c0=
X-Gm-Gg: Acq92OEZ/tJq/QlPRntJa3LBpWAPY4yujO751rEQChLIlUK4z8Ya/862M+MhrvJarF0
	xWHDFLGv1TMH2HDTddyqGxMdwNHvh/gYhFYE/98x0mHUTUSRLfCS/7D4Cmtxyb/xDd7h2JBFyD/
	k9CPOvRikKnnMyZK6uEEealvjMNnEuQovs6Nor4FLtce7ar7BT7tn6d/T8adB9nzgsnIzkNs5MG
	upjSPFe3niuOsMs4rbEPVLqTIfAvWfEShxoTKySbvkYDbXA10UWUiimzpBtJrCSr3ILd9gRfM+T
	dr56MunHgGaUtqPmp1bN8FnHCjHJ5vM8wLEFQg4b98fCopAwTCX66xhwHGXsDhezRArAacIx2rX
	0VcO/l1JkxIBr2vY+FlmZnM2juN6kE0v843+/twfurQndkRUFfnXdkvnJZ9eQHi8ymNtt8D97cw
	KYNBrFyKrgKkqC3yTdvXUCajQqIwneNscvcXlOmLLz1+lKcBYXvcX2EVQPwytCFY58HiVESx/3j
	EC/XdRTHU2QgbPQ9Zk=
X-Received: by 2002:a05:620a:480b:b0:911:449d:98c0 with SMTP id af79cd13be357-915a9c4bd5emr831113485a.7.1780676930899;
        Fri, 05 Jun 2026 09:28:50 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a411333sm989320385a.46.2026.06.05.09.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 09:28:50 -0700 (PDT)
Subject: Re: [PATCH v1] spi: qcom-geni: Fix cs_change handling on the last
 transfer
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260529-fix-spi-fragmentation-bit-logic-v1-1-3b30f1a3dd7d@oss.qualcomm.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <dd247b87-71a2-78d6-fb6f-663906c8ec59@marek.ca>
Date: Fri, 5 Jun 2026 12:24:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260529-fix-spi-fragmentation-bit-logic-v1-1-3b30f1a3dd7d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[marek.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111450-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:viken.dadhaniya@oss.qualcomm.com,m:broonie@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[marek.ca];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jonathan@marek.ca,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[marek.ca:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan@marek.ca,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[marek.ca:mid,marek.ca:dkim,marek.ca:from_mime,marek.ca:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B287C649D80

should have another Fixes tag for the GSI xfer fix, otherwise LTGM

Reviewed-by: Jonathan Marek <jonathan@marek.ca>

On 5/28/26 3:03 PM, Viken Dadhaniya wrote:
> Commit b99181cdf9fa ("spi-geni-qcom: remove manual CS control") introduced
> automatic CS control via the FRAGMENTATION bit, but missed the case where
> cs_change is set on the last transfer in a message.
> 
> For the last transfer, cs_change means that CS should remain asserted after
> the message completes. Since GENI SPI controls CS through FRAGMENTATION,
> set FRAGMENTATION for this case as well as for non-last transfers where
> cs_change is not set.
> 
> Additionally, setup_gsi_xfer() was storing FRAGMENTATION (BIT(2) = 4) in
> peripheral.fragmentation, which is a boolean field consumed by
> gpi_create_spi_tre() via u32_encode_bits(..., TRE_SPI_GO_FRAG). Storing 4
> causes u32_encode_bits to mask it to 0, silently disabling the FRAG bit in
> the GPI TRE regardless of the cs_change logic. Store 1 instead.
> 
> Without these fixes, TPM TIS SPI transfers deassert CS between
> single-transfer messages that use cs_change to keep CS asserted across the
> header, wait-state, and data phases, breaking TCG SPI flow control:
> 
>    tpm_tis_spi: probe of spi11.0 failed with error -110
> 
> Update both setup_se_xfer() and setup_gsi_xfer() to handle this condition.
> 
> Fixes: b99181cdf9fa ("spi-geni-qcom: remove manual CS control")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>   drivers/spi/spi-geni-qcom.c | 27 +++++++++++++++++++--------
>   1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index a04cdc1e5ad4..0618f6bd7878 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -449,10 +449,15 @@ static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_master *mas
>   		return ret;
>   	}
>   
> -	if (!xfer->cs_change) {
> -		if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
> -			peripheral.fragmentation = FRAGMENTATION;
> -	}
> +	/*
> +	 * Set fragmentation to keep CS asserted after this transfer when:
> +	 *  - non-last transfer with cs_change=0: keep CS between chained transfers
> +	 *  - last transfer with cs_change=1: keep CS asserted after the message
> +	 *    (e.g. TPM TIS SPI uses cs_change=1 on single-transfer messages to
> +	 *     keep CS asserted across header, wait-state and data phases)
> +	 */
> +	peripheral.fragmentation = list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers) ?
> +				   xfer->cs_change : !xfer->cs_change;
>   
>   	if (peripheral.cmd & SPI_RX) {
>   		dmaengine_slave_config(mas->rx, &config);
> @@ -858,10 +863,16 @@ static int setup_se_xfer(struct spi_transfer *xfer,
>   		mas->cur_xfer_mode = GENI_SE_DMA;
>   	geni_se_select_mode(se, mas->cur_xfer_mode);
>   
> -	if (!xfer->cs_change) {
> -		if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
> -			m_params = FRAGMENTATION;
> -	}
> +	/*
> +	 * Set FRAGMENTATION to keep CS asserted after this transfer when:
> +	 *  - non-last transfer with cs_change=0: keep CS between chained transfers
> +	 *  - last transfer with cs_change=1: keep CS asserted after the message
> +	 *    (e.g. TPM TIS SPI uses cs_change=1 on single-transfer messages to
> +	 *     keep CS asserted across header, wait-state and data phases)
> +	 */
> +	if (list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers) ?
> +	    xfer->cs_change : !xfer->cs_change)
> +		m_params = FRAGMENTATION;
>   
>   	/*
>   	 * Lock around right before we start the transfer since our
> 
> ---
> base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
> change-id: 20260528-fix-spi-fragmentation-bit-logic-880394337ff9
> 
> Best regards,
> --
> Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> 

