Return-Path: <linux-arm-msm+bounces-94180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gERqA2Ezn2lXZQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 18:37:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C1119BA70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 18:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C34A13011757
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 17:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991243D523C;
	Wed, 25 Feb 2026 17:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AS1GkDtK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5BD3D3326
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 17:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772041053; cv=none; b=pwQv551dvUqyfz0oilam4v/TCvwxGxRPfagTIAMH94Qru1Xwr4eqaSFuSpKtbdKnlbcI8PJ1dKuSyz27v9StH/ps8+51ai6mLS0U9UrWrGPXz0TqWsO//pBV2JEbptlAMDByZtpDcRxvuNe2olJmEkaCCRclgEvCs9Hl5WKb07M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772041053; c=relaxed/simple;
	bh=kv/A2EIN0uhCCReZv0n1i5Fr/U77+NnW52CPmq472XE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GdhTrEd0Ml3jSEtzBnm9WX7FiMqTQROfdWQnZX2HKowcoiraTwQ7U/tiYdXBxmpGND8+GwE9qUQcQ794FpJUWOb+8ywDqFNLgC2hNECaIkJaoPYBnQ5RqrWz8EfoBKYQrjbCrHvUceW6ZT1CdmAsvIiMSzsosZT2v9noTlIGS2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AS1GkDtK; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3870c2c7aafso5611fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772041050; x=1772645850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hGPEVWznUxuljKqRh9MZjaJpnthDr8IRzBmoNyGFLk=;
        b=AS1GkDtKQspsMwNbHmkVev5MBHFUQXzLoy/FwJjVHUXIY1+TMhb5LRSposI09+l2bG
         KQiVJEtgDYM+sWL7+nCOYwqunR9owZyiVLwgeEYkbpSeb7r+n7JSp3+vvCu1Jmu1SsKg
         WtOpbkP4JCzPW4/ScVg5CAgNGbt7fd/IClx+jR4bBwmNppWfQblQegziOeKemrjEiFhB
         9WaI1Ry0SmlHCv6ce677q6pVM+q4+f9HWYTiEyHUHF4i/rYINzWN53saKBQZInLXADzC
         mV5bvDqAIRo+6P3P4FquxutrhFSR0aUFwAEPvRgCTBc7tZ9QagCyvRnOTyCQXUTPqnKT
         LLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772041050; x=1772645850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2hGPEVWznUxuljKqRh9MZjaJpnthDr8IRzBmoNyGFLk=;
        b=D1EKvXVr4gRN9TFiJmM+NX+qaxaiQMI3AQXVa9K5qW2rBNC2May/KGHSUWiMN87Wi0
         49DkLGQXCT1AsrN6cMRYZWwsuvzwA0VO7itBqZWWNhQ3WMuWQwgWpX1OQSlWliUiC3/G
         ZxxpQ7FK1b9cKKiS8DRUxCha1j0+uHrfYNr16HkUyx+/cURWdETEpr3dTXfaX1I6kRnf
         INnBMEXt4S0TtCuHejZoN9udIOE6y2lMq3/g8ihXTp8qiOcUDSj4nkyFiTpuD/YVRp7o
         /A6p/C9PUOuClYnx6M69vVp6GiwFBvNf4hpP8S1KUja7VBF9iRwefGD8qK/gcCcaSWRT
         dItg==
X-Forwarded-Encrypted: i=1; AJvYcCUuTE+Y+MMpKSNkGslsLYCS1wsm6x9m0MWcBRSOdTjRhU19oC9WEaenNg3QaqwSKNyUlBCgle2nTy2yyLhv@vger.kernel.org
X-Gm-Message-State: AOJu0YzEJaja1I2VSX34O8rWMT888T9IrBjMx25TFimL6Zf8iNH79VVK
	PsQXQsQLaVsSA5vnp7CBwIZQYfhNS4n3GO76+XGXrcb8KWT6qowX86Zucq9AQxExDGs=
X-Gm-Gg: ATEYQzzF6EISMWx3UuMLX7NRYTlI1R5iuwLedDYlByuCeBkmY9fMCgz+p597ER+kI9L
	5M0fMHBCiLEqqG1RUrPaHeLyVOyqPwlrxKePil6Rs/tUqvq8dEPFLU7sVNDPsGw7cPW0zIUmBM0
	pHipX9WXIaBZyKeuNfF/3jCvYXFXW7trFgoz9KrUoVnrMqEuloHg17xzv4Jq4rtMgUxfzC1BAfW
	wXcGel172/JUGrN0Ou9nBMhIYPoU/9ybLP1OK5toFKLakYfz5mokEaaMY1mcBe66GsETeFXS+u2
	AEbpQaKjBlzW/Qw6noMOMbXg8WKxklaFSbf45uFY+FIggW6dLu6CmyGsy5aOHknp8p2cgwQPiMJ
	u3fUqomHOuUt/9jywIN+hpD43+L0iuJUkQARYRvAbWqAuYQf8ZIdcFXxQPKw1bIVq06lnyfC///
	B0cKmTTxePWwc1kLM+RjwF06I1OLyEcM1CuZ2awa1ZarHS48tNAIBItUG95MAKMoZsb71lxc3V/
	bzkdA==
X-Received: by 2002:a05:651c:31d4:b0:385:fbff:ab38 with SMTP id 38308e7fff4ca-389a5ba336cmr28781451fa.3.1772041050307;
        Wed, 25 Feb 2026 09:37:30 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389eb265625sm3386641fa.23.2026.02.25.09.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 09:37:29 -0800 (PST)
Message-ID: <95b16445-318c-4ccf-8e17-c7c40f8b3828@linaro.org>
Date: Wed, 25 Feb 2026 19:37:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself as a CAMSS patch reviewer
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260225151446.766586-1-loic.poulain@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260225151446.766586-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,cisco.com];
	TAGGED_FROM(0.00)[bounces-94180-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 65C1119BA70
X-Rspamd-Action: no action

On 2/25/26 17:14, Loic Poulain wrote:
> Add myself as a reviewer of Qualcomm CAMSS subsystem patches
> and delete inactive maintainers (Todor & Robert).
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   MAINTAINERS | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e08767323763..b7a79a8fd730 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21390,10 +21390,9 @@ F:	drivers/bluetooth/btqcomsmd.c
>   F:	drivers/bluetooth/hci_qca.c
>   
>   QUALCOMM CAMERA SUBSYSTEM DRIVER
> -M:	Robert Foss <rfoss@kernel.org>
> -M:	Todor Tomov <todor.too@gmail.com>
>   M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>   R:	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +R:	Loic Poulain <loic.poulain@oss.qualcomm.com>
>   L:	linux-media@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/admin-guide/media/qcom_camss.rst

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

