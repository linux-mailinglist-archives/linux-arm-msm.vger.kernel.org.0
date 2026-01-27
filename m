Return-Path: <linux-arm-msm+bounces-90791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPldGY7LeGmNtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:28:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 465C695A93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EA22A300AB0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B19135C183;
	Tue, 27 Jan 2026 14:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UelAs+En"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99CF35BDC2
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769524085; cv=pass; b=ee534TcwB/ya6l2Cbu3s2BO6RL1vs3a7EthoshGhVpJlpCxbvlwYWIdXzKqPqA3SQ/h0ozUvNIcIrjHOdfeiZ8wRMR8X3LZqYfCBsIkAvu45g7MIBj103JKyZ5EPrtFeryeMNzfs+g4RWS+zYKDmUPEI4F6hkaFUy35Wdi7Bu24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769524085; c=relaxed/simple;
	bh=sU1Vg/kLcdpaO14iSB3e9Il5RGpJGeIN1xvZkn171Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jo1ROOMjS5eKtWZPsbbZ8EMpO3sxSjcJHQ5mK6ij6138guZqlnIjsaxUzuXqSZpVaib/+qlz0ewQJyszKuEUgdaoZBTm3YuZMEWJY+eUOC2VtBiy4YjqYphnEepiOMCi2tiJTL/B8uqOA4e86KVtEo+zTwDFtnTQZj4zrJcGVfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UelAs+En; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59de66fda55so4868260e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:28:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769524082; cv=none;
        d=google.com; s=arc-20240605;
        b=bfGawERfEATkAwLpgJSoB5YaM8f3LfqAetkRQDmdvokFU9zJ8Qvxa8buaWjwAGRXg/
         nSq4YshlWkEqzWc66L9d1qI8f4zq1noeS+yy0nnpz+KqStYkDccbkWudP7DR7SXmxUp5
         GnXSRvqXJWS+HRfrApjogCpUfMV9Ua2a3QvDxkzC8MBN8xYZqz1ToTYNKeDpk0AJwzdn
         ZxJS2AuJfpOLezouDzIxxwTRuF52OTSLdNvpCmDzAykK5tLVnErwIZ2syRlCROvC8d4S
         GuHS86C86CFVR+4JjFVLXwFnACePrV4t6oAXsBXWG1+mjd9spVNSRfODauvahAM3UCBq
         CYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qCmiHLqy9FjRMdlmt5JaP3VO8zWbnL0sHgenoXsEyCY=;
        fh=UBeKuqb5zSk4SyVV9zSSDyJEQhbQV3XWU6rHd4sR2RM=;
        b=QZzifSMToXC6nlricrzm8V78EG1oYa+Ew0dKHh8vwUGIbG7NkKZyafdHXaSuPXhfAe
         ejM/B/mO/SV/ejxAVXzEIeDcMuF+Av1s/Bi6S2uQ5Cl/3+OFd+EgmUI4HuuWF+vnm2xU
         vWMs5QcTrAsoWUuxRievKuK3c05Y2YBkqM8C85AapVpQPclYB5qUB+OpnO3sFIkb2ZN1
         AVg683EW+DgnV4SNjgtmjFmcNj84jZh3ZvntBSpCcA9GMpmyoEqw8LlaOgodGQApsLX2
         3hPk2nxdvBJN+01Md2e5GarRmutNhar7onuf53CuVKJwpPtp7wNsZ1FuWg0k8IuC70JI
         kkwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769524082; x=1770128882; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qCmiHLqy9FjRMdlmt5JaP3VO8zWbnL0sHgenoXsEyCY=;
        b=UelAs+EnU+Qf8cFBaXc1lQpLK4OQEG+Z6IRbd92uiY86RhSkSwOrKo4Fs2SpjkiWCn
         2iS21jkPnFbrUqKgE3aAbHsmfnA/bmFudnO70oglux5nFO0NTkfTUSEa5d2NakcI/SuU
         fkxOYX9B5AHmNyPBMGn523kUivKt+2VN17wPixGpCykR2MQlGNzvhcb6uGMlG+6o/qyM
         6+21OVTSOmOPEWhLeZeu85yLxwUWa/tpVNUBCgruajx6PCOg2WvDK+m+ZQcBLVYL8dWH
         bcU8vCRZzfZH52J49QeMMwD6CDSRi6hdyBOdO36jryMg0MU4OT0bfAZTzgZBnoBqLVjB
         ksGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524082; x=1770128882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qCmiHLqy9FjRMdlmt5JaP3VO8zWbnL0sHgenoXsEyCY=;
        b=LPrYT/JQ2Ga/AGoQuinvqtMCQPT1Z9kQoC0316eFvQA2KWYVKjtkdSO0s8cHDYOdYt
         CFNSQhhD00hHHUPr8PS75UcOVjshUaDpKds9X6oUO6VrwHwhFYWPzWiNn1QIqCc6ugrG
         JlhxRop4h8O4KihYkY6XBjylBy8tDE/4z9krPBvvPWqm+IxnDwRwXnDxWBoGp0B4gdo0
         4OV2XJGABENw9OHgmAKJrzB5TwYGiIFV31JximxWpuHKfUjDV/d7l2oAZg2okzTykU9j
         RrxZFtZ6JTQejPtP8fiR2neSzkIgod7EMzWjDGgI/pecqEuySGrgyCW6kAXXNsIKVb/A
         FCEA==
X-Forwarded-Encrypted: i=1; AJvYcCVo0X06zGhPjEGD8QxdZyvJAb45zyi+owsAPzE2ml7m3sVpTTlSfAiYkchYgHZJFlPCYqhuCVYWekUG//im@vger.kernel.org
X-Gm-Message-State: AOJu0YyClUbWXb0a8ql7LUgiukDRP9zM2TQm7JSyzfAFYTFyoSWGNFna
	y90kogdpux7hzaSFdppX9YB01HAWDs9Uok+gK2Jaa3d7+hPlGffh1BPEQ7eEcN2FuN9Z2FCj+oz
	pqoeltBaDq8BzsantrMLM5lQXYbg6tCkoG0dpq+FuFA==
X-Gm-Gg: AZuq6aLWBDharXNc2OQMqUjC3dFepmnz9ScYuiCITj+4ja7iMrOaQQU3ZeSVkMTUnmF
	zLPHE3H4QucYoY9YCchQzDuAhOkPlPSDm2688Mp6ChhqMVTl5ZrMlUJCUynU/dIj6uQFhohdXFm
	0DRkwGgcQmM2qexa70xHhyColqzwOGlqOdh/lORo/5paju/LQ8Ehy+YzWxWJiTgQAsUb9w16fq0
	SrYhpy/ra3CaJMIv5AP786oXhiMuPgnsZzuhUiZ+bNbClk4ie0iOcmDfM06pJ72Ovx152Eo
X-Received: by 2002:a05:6512:400c:b0:59c:c05f:bc with SMTP id
 2adb3069b0e04-59e0401301dmr935887e87.4.1769524081689; Tue, 27 Jan 2026
 06:28:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-qcom-rpmpd-clamp-fix-v1-1-7b6a67975a69@gmail.com>
In-Reply-To: <20260122-qcom-rpmpd-clamp-fix-v1-1-7b6a67975a69@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Jan 2026 15:27:25 +0100
X-Gm-Features: AZwV_QhNKAvMxW5zGk9dgdyAh_Vaj5wio9znE_bOhSXXkGo9nVOwSzfks89OeF8
Message-ID: <CAPDyKFr7KC3yYUWw9Ncs_W3WPYqJ2e2E__XOxUZ4hay=8F6Xkg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: qcom: rpmpd: fix off-by-one error in clamping
 to the highest state
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90791-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 465C695A93
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 at 18:20, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> As it is indicated by the comment, the rpmpd_aggregate_corner() function
> tries to clamp the state to the highest corner/level supported by the
> given power domain, however the calculation of the highest state contains
> an off-by-one error.
>
> The 'max_state' member of the 'rpmpd' structure indicates the highest
> corner/level, and as such it does not needs to be decremented.
>
> Change the code to use the 'max_state' value directly to avoid the error.
>
> Fixes: 98c8b3efacae ("soc: qcom: rpmpd: Add sync_state")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/qcom/rpmpd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
> index f8580ec0f73785544aeb6f686438f39b477d134d..98ab4f9ea9bff431614739f37cd32b7b3bb407e4 100644
> --- a/drivers/pmdomain/qcom/rpmpd.c
> +++ b/drivers/pmdomain/qcom/rpmpd.c
> @@ -1001,7 +1001,7 @@ static int rpmpd_aggregate_corner(struct rpmpd *pd)
>
>         /* Clamp to the highest corner/level if sync_state isn't done yet */
>         if (!pd->state_synced)
> -               this_active_corner = this_sleep_corner = pd->max_state - 1;
> +               this_active_corner = this_sleep_corner = pd->max_state;
>         else
>                 to_active_sleep(pd, pd->corner, &this_active_corner, &this_sleep_corner);
>
>
> ---
> base-commit: 95fad101a21d31b4facd1b9e0713bba1c517db6e
> change-id: 20260122-qcom-rpmpd-clamp-fix-060fcda9cd74
>
> Best regards,
> --
> Gabor Juhos <j4g8y7@gmail.com>
>

