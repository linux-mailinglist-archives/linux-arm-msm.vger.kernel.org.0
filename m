Return-Path: <linux-arm-msm+bounces-106069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO93Ljfx+ml1UgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 09:43:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B18F44D75B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 09:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88D3B3004688
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 07:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FC53CF670;
	Wed,  6 May 2026 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="hd3q9V6f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9643CD8A8
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 07:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778053425; cv=pass; b=PjUlmNBYcIj5b70sG+Ovmah4MfvM9oJrgYt19EiyacSJnWtYurGtPkCDUtT+vs413NAGG2UVn3jQkPlkehgatQC5GndamN8k9FRHnOPcblkvO+ajmGabUEtAeg9tw2s+too2Pm3ixVWZJdgpPLWqnX1aaOzK3mqZGqTc0lfXOUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778053425; c=relaxed/simple;
	bh=RFbvpvHKnRfMKRV5cipTG5wqX1hpuMNrtGYd3OURDQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8PWQFjYTWg4VXsJ9zkftlP9h4YOr05y6/jXf5l8RvITsYwRKldJGLeWs1heyh6riv+D5t2i5ldmrkJJk2y+8fDHDwc7Vyov8kzyxGYe1b4qvjEiwpGmhBeOXnFHlRg1pJrgYE8f9UKdLKueNV3lk0sBytStjz+I0u6IaG1RYG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=hd3q9V6f; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36528851d7dso1680409a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 00:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778053424; cv=none;
        d=google.com; s=arc-20240605;
        b=RvCJ4QsarSVHErc/EHrqjO5agiEfT4KeIW5bJC3ZJZRs/yZkQx2zgf7ieOmeWNbKtP
         +R7wSmFD0u2b0RJzPmiXdRlnDOEwDEMbDhTEz1qlT0yheq/GLMBACTvARBhxdjgGOm2i
         nscijLDnLT2JFbk4HDxkw2FnRqlBIIsGLXc9UJ8oVDJHJ4EoCNMDCXoOAZq1XMKI30b4
         UfzXUbLZESS1fSAmnSl0B+QP0/0maOwIozfYqGcRcHBfjUSbtb+10+vqR/az1/7hQDkD
         8RAmSHHF4rJHFcPuQbJbZ+1bXNo8kmNY1els1WbW7AR9ybb0UZFIr0Ca4Z836AuMj2xn
         Z+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g5P3Od/dQhtcZo5k/0Xi9Vgf4dbLkIvbPE4wYTTN+tg=;
        fh=LmR8j/2whuhV68k7k9VJ5FVei0XXLyuziuzQ37xgaYc=;
        b=dlk7w+CY83PMwrbaceUbRkeZgWVu47MQsnlxEXkmRwfyHMbl9TwIm9m0ji9ERG//zB
         T7iR2Ot5KCwS6jC8cMHderLfQWIlzzFveHoWwU/CKqxLpUJ3v+GYddjLOVkiEOMOvMth
         rOOZUWPCzgxYmwEEN9a7u2Zqh+7vhZtzytPuGrQ6CTpyTTQWSqf2qZgXFHUH6mPc/OLL
         W5NA98y4jHN/+QztO9aBEMfJ5gEjErXBsRpTXiQ16RF1YKa84ielUE6EdYxxZo4yqcZQ
         lErfgsKI4tJl5gWKw6F7U3EVLsHWJc5deNi3MA8b4GOoXR2S31o96493vdYLoOTZxUPs
         yScA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1778053424; x=1778658224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g5P3Od/dQhtcZo5k/0Xi9Vgf4dbLkIvbPE4wYTTN+tg=;
        b=hd3q9V6fis79Fk8mHqWjo1BZ31U3SC/cFiMo0XOeRgutgKj4SLdjUfwzd+Cqkr9nTp
         BinxTIfBpd32IQ181CfM9CVpHbwqjw4m78uv9LxpvYCvq5A2pZyh1mF/Gl2iPYGouGjf
         c95bVaHmdiw40GtuvQ5kNK7ETGR5xTp5GO6f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778053424; x=1778658224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5P3Od/dQhtcZo5k/0Xi9Vgf4dbLkIvbPE4wYTTN+tg=;
        b=jTOLLpZMIy9cM32Z2LzEewN82KdnR/CN+V5gNm4cmnXHM/aB0IEQmf5hLcbwO5vOsf
         Qv2Ogm0euNWmjdE4LBPuQSlhCTXErN+9r4VBMee2T86NA52nkE0ommpmn3Fx6ZiESB3q
         rIg6bdBh8Z7R3pxx8L6+iWgD2REH6KIT64r5NmYlXlpODt/RXCdzAMUhhIwReTCD6J1K
         U5oMdFBvR8rbYUhRRD2F8HAIjLJKa3iOU0uEz77OZQjtQD/UCTrw8OZxIBFDhGm+75qj
         a48MmGwOv9FLXiPfw9C7rOtEPqhh2EYwLEdqW4zqbWTlprMOClqR+JBWeIA8qiSLddca
         HcWw==
X-Forwarded-Encrypted: i=1; AFNElJ+iQ1L5W0f5hg45HBdnpHrIdPNTQ3m4bQECNVzWklWkwuKtNScWExgpqlz7CCl2jF2+IfsDlb7DedCiLXsO@vger.kernel.org
X-Gm-Message-State: AOJu0Yysj6K6tGetoeiTmXpyI2BRX1YO9puDbfcsJnHmDZQm3z/30Sfk
	Lxq8m2IC2JD5EUy6wmVSQpcfzofqp17h3ww40I8CxAyE3WZep7Xhw9yVB5uQ2C/DgnCEupYcKXb
	3Z+WFLkeJ/vesfqeQsGuwfeQuHfTmc+ohgMCw5yr5bQ==
X-Gm-Gg: AeBDieu3kdBnP9P4rlO71Z6FqLA9qDZ1iY7ktFPsBJ/Eu7LzK/Iu0Ee+/ksXdKdWR5A
	CZm2j6JL+2HrEGPIrorLuOTIrLEzceZBHv1Hf5DdL6e8r0JDm8ae+2LN96bQyuCpzy7y5A++4tq
	lv/vn4zKoG+fSoiiMbyLyEW4lKjtv9JNizVXgpChGYrC22mjPtdg0K6idrEmTJGD8ITBaT5MO27
	8J0roFyaeOrmdbM5EdjY2O+7+Bw+DK5psoehrxcImnW7fooc+THK7dQveBe5G7G/dSY5OnTo2FD
	+P6d2sW+HCCWppvmYljS5JJbl83BBIeiV2NTgFDdIR0B5ZaE94ykZo5lMN5ogIp1EmjBXVwx/Xj
	aJwuoYgOSh400BSmYe5fV1IH0wbt1zqF/VYDr0YLmrm+xqPB7aQkaOJ44DaZwf94/EqfJBgZ9oz
	FLT2ZwUTRwatQM7lKUdyzi7bzOvhNbsxQO1nJm858DJTqfRJSktBeObGatQ0hyg94OkWjDOvqRh
	lPAaJo=
X-Received: by 2002:a17:90b:2703:b0:35d:a5cb:95c1 with SMTP id
 98e67ed59e1d1-365ac76b0ccmr2428335a91.23.1778053423619; Wed, 06 May 2026
 00:43:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505152908.302097-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Wed, 6 May 2026 15:43:31 +0800
X-Gm-Features: AVHnY4JCbXxxDzq14SSrsch6ke1ZEydvkRZgDuga2OQ5LeaqIKdcgjww-KpcPz4
Message-ID: <CAMVG2stysMiG_9J1+7s42yCfkBC3sm+w6DMJK_cR_qMAGC48pQ@mail.gmail.com>
Subject: Re: [RFT PATCH] clk: qcom: dispcc-x1e80100: Fix (possibly) dumping regmap
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: B18F44D75B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[quora.org];
	TAGGED_FROM(0.00)[bounces-106069-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]

On Tue, 5 May 2026 at 23:29, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Reading few registers at the end of the block (e.g. 0x10000, 0x10004)
> might result in synchronous external abort, so limit the regmap to the
> last readable register which allows dumping the regs for debugging.
>
> Reported-by: Daniel J Blueman <daniel@quora.org>
> Closes: https://lore.kernel.org/r/CAMVG2su+V5fcZ9LOC0Qm3bpfnhpbmQdJackc7-RvfztDL_dajw@mail.gmail.com/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>
> Not really tested, just idea based on sm8750 and datasheet/manual.
>
>  drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
> index aa7fd43969f9..575ba90d2070 100644
> --- a/drivers/clk/qcom/dispcc-x1e80100.c
> +++ b/drivers/clk/qcom/dispcc-x1e80100.c
> @@ -1634,7 +1634,7 @@ static const struct regmap_config disp_cc_x1e80100_regmap_config = {
>         .reg_bits = 32,
>         .reg_stride = 4,
>         .val_bits = 32,
> -       .max_register = 0x11008,
> +       .max_register = 0xf004, /* 0x10000, 0x10004 and maybe others are for TZ */
>         .fast_io = true,
>  };

Great work! With this change, no system hangs are observed reading
/sys/kernel/debug/regmap/af00000.clock-controller/registers on my X1
setup. This and the same fix for the other clock controllers are a top
candidate for -stable.

Tested-by: Daniel J Blueman <daniel@quora.org>

Thanks,
  Dan

--
Daniel J Blueman

