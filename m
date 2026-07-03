Return-Path: <linux-arm-msm+bounces-116227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u7ofMfFzR2rCYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:33:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D46D7001B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:33:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=d+7N0sLp;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116227-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116227-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F251730AEE5A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CB33403E0;
	Fri,  3 Jul 2026 08:22:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027B533B97B
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:22:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783066962; cv=none; b=Cq7JZ4Te1fktNlpKkX+oEACr+VFY3HkEqekGzAAFB7xsIgy+3KcTgzpOAghiCTtDCPu/W3Yvdj3sI4yiIZG3IpRS3DduG4PbOEiTQp9Kf6hVO/98i9264YHNMg4RimDFQT6rAaR/nJzGOKFE1Nv0IwoU2E1+HrO4eT28CbLh2QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783066962; c=relaxed/simple;
	bh=vLVgW3xulLa3nCqtqtWHvnpLz3Ze9clktRd/QXErZG4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ojQAuWHCozr0j5EltFeeQmvzM0lLAmEuKyMw8het9LiMSKSOuYtxDeHICxR0RzAZfcd5fh9yNlkioJv+PzEILzZfRib4oWqefxz+z5kaA7o8oaAttTllXtLy17vNdiS/qzREpRHVkfHuwdankFgkFSQwyZt8kpRbGoQUlNNixwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+7N0sLp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10261F01559
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783066959;
	bh=ywuJ0AZ8u1hP0D95hIbh7X9+0JfEtduzaP9JnPgxj/E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=d+7N0sLpH35mDzs/9JKmSII1SjW1ma9BUJbMPe+N2VNH8WDlVTIfORYwkNo1jkstm
	 a2/ispO4rTyIC8hb4QV6c9wV9WMXbzwsw6ZOGsKEJK0GNdhwHuIAEDUrgK0XjbhxaF
	 46zaVHdJIPFTjGTdgdGnns2/+rusj0JVuQsRGVpU8JwYFVRqAfttXWRLY/GyrilpET
	 za7dA+P/kwj0blMgHiXLy50QuiHL+OKaz85mjebhpKrfdeMYY/QSr4nxeHi1B2RrpI
	 CSTTvihq3aiVlnqkDcJSHxRl6gEHfR8GqPGeQsGEDcp0AMVMDv1cnmZflcHx3PXn4Z
	 aUrOoFV+6+wNQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39b349ae174so2576111fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:22:39 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxj1GW1WcujdHtg31iyEtNI2aA397hgA9u8d3gKjmfyAw5IzsbN
	iuH5V+L4liichnj1FR7FvK+U6RpZzVs5uVNsZc7PGvK349U6d9UhA9lWSHOERJMX0wws3+RJjff
	jrWHpGAIvtyFtJnUY+7RqcDwoMDNmO5YZs9ERElTQcA==
X-Received: by 2002:a05:651c:154b:b0:396:9630:5ed with SMTP id
 38308e7fff4ca-39b36e4249cmr20150231fa.15.1783066958510; Fri, 03 Jul 2026
 01:22:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:22:36 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 03:22:36 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703-sm7125-samsung-v1-2-3e5f752048c1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com> <20260703-sm7125-samsung-v1-2-3e5f752048c1@gmail.com>
Date: Fri, 3 Jul 2026 03:22:36 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdgFa52SLZwmaNNfAvQqfAdJ_6y3k62FoMZ7z8qdzjydw@mail.gmail.com>
X-Gm-Features: AVVi8Cc7bwuKMYohPWqp1zH4CSCcBUAXYimhNm5HsDqGhbfxgP0goQuvcz_VCfA
Message-ID: <CAMRc=MdgFa52SLZwmaNNfAvQqfAdJ_6y3k62FoMZ7z8qdzjydw@mail.gmail.com>
Subject: Re: [PATCH 2/3] firmware: qcom: tzmem: disable SHM bridge for SM7125 platform
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Vitalii Skorkin <nikroksm@mail.ru>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116227-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xerikasxx@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:nikroksm@mail.ru,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,postmarketos.org,lists.sr.ht,mail.ru,kernel.org,intel.com,igalia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D46D7001B4

On Fri, 3 Jul 2026 09:59:39 +0200, Erikas Bitovtas <xerikasxx@gmail.com> said:
> From: Vitalii Skorkin <nikroksm@mail.ru>
>
> Currently SHM bridge causes RCU stalls when booting. Disable it for
> SM7125 until a fix is available.
>
> Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> index 0635cbeacfc8..50f500834758 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -81,6 +81,7 @@ static const char *const qcom_tzmem_blacklist[] = {
>  	"qcom,sc8180x",
>  	"qcom,sdm670", /* failure in GPU firmware loading */
>  	"qcom,sdm845", /* reset in rmtfs memory assignment */
> +	"qcom,sm7125", /* hang in rmtfs memory assignment */
>  	"qcom,sm7150", /* reset in rmtfs memory assignment */
>  	"qcom,sm8150", /* reset in rmtfs memory assignment */
>  	NULL
>
> --
> 2.55.0
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

