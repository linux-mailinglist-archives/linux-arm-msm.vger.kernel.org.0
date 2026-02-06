Return-Path: <linux-arm-msm+bounces-92079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLbsEp8jhmklKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:23:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A429A100E98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 569023008776
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 17:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46503B95FA;
	Fri,  6 Feb 2026 17:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vr+6/uzH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81096389445
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 17:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398619; cv=none; b=tgqfH9z4R5rRtBByrq7wCHdXbmy2Gpc+7loP3lGOj5WG3qLN1dbuH+1zcSDBv1Oa2L5gzg2yOylK2s1PQRx5KU1Pk/uT4nuwWCQHwLCYLjIB5K6XRRpg0d32ER9G1dLD5TcRKdVpW1Gob+Pw7jNc0NL/qXvDZUi9VwqM6e5yQys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398619; c=relaxed/simple;
	bh=vqkMEjcj1rGIaVpWFvTi5oQ4M4I9y3Vf18QDsu9g3j4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBtLDd5QC7Usm5NF3teQlcnvRt1lqpuxBHTSxcvi53Rvdcwjb0ImmXC9uZhr5sfHULZBAP533aF3HjHATT3P/bKXl9swibrJ8DfWBPCC5IxVGhdkw0Dg61WOKT00RxpBgC72Ivmy/oz5zzM2t+cc9N9la1nblKK4vbng/9h5mVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vr+6/uzH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4172EC19422
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 17:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770398619;
	bh=vqkMEjcj1rGIaVpWFvTi5oQ4M4I9y3Vf18QDsu9g3j4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Vr+6/uzH68AG69ur11y1oNusZreT9I2/7P1W6znJGtka9ZlW2n9MGOTzoej30VpQA
	 hIQQ95ddzF7cq1BiCV/f0OhovlYKqwSq4104YvO5A7v5dWi/C9+FzO3hZSq9Xu6DK4
	 jBHJFAcNregiJx70Ke9hjn7Wrq44JNyvCfUepBbha9Po1AByMe5LnoaNGa8ldNsONf
	 vwHfucAhm9jxpdjzMbg8LhFvQzYK3d558IbisPMhKV5iJHu3MXOvCY3biMjfT66Res
	 /ngMaqPmxyGB6C1lQhGNCukFHzDLSIgA35DswMHTg1hb7GFIg6n1cK0Kpscn55S6BY
	 WDZq9/gCSwW/A==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b834e3d64so1042599e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:23:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8BocwzJTpjUHtVkhm5n59ElDKoKTfdPaxQ7Ts/cNacJRzKzCHe+KreP8/boNkCb+y7EYVYdtycCDQ3EHR@vger.kernel.org
X-Gm-Message-State: AOJu0YzQlkoOK7f3PUIl80eSGZpPe7kngggQmtLaYUQLROZFNw5k2pEU
	rk2IbctcIIBLsol/9L4bjKCcRFYzXPFy2rV93TSEgGKDsZ+CJxVT2iHgxeBx9rMvVvo3RDHC5IU
	j35nrs1rmv9ucmGop+rEHl3G2vMeekr0Gso5kABJtxw==
X-Received: by 2002:a05:6512:3b8e:b0:59d:f2f3:7e9a with SMTP id
 2adb3069b0e04-59e4515dea3mr1004810e87.36.1770398617911; Fri, 06 Feb 2026
 09:23:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206134506.72679-1-bartosz.golaszewski@oss.qualcomm.com> <76a35ff1-5b6a-439a-9bd8-81fef945e3a5@kernel.org>
In-Reply-To: <76a35ff1-5b6a-439a-9bd8-81fef945e3a5@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 6 Feb 2026 18:23:25 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfpHC3AJK7pW18WwZ+Uwz-1g56hHEYdGaqQBeC8N0gUSg@mail.gmail.com>
X-Gm-Features: AZwV_QjWp1QPm64HYYcwKbFJ_UV9ezmQ4-uLQaFXxKdvW8WH0JUjcSim0j3FPeg
Message-ID: <CAMRc=MfpHC3AJK7pW18WwZ+Uwz-1g56hHEYdGaqQBeC8N0gUSg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: remove msm8996-v3.0.dtsi
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92079-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: A429A100E98
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 6:08=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/02/2026 14:45, Bartosz Golaszewski wrote:
> > This file is not used anywhere. Remove it.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Rob already cleaned up all of them:
> https://lore.kernel.org/all/20251212203226.458694-3-robh@kernel.org/
>
> at least reported-by could go to him, especially that I told you about
> this removal on yesterday's meeting.
>

I don't recall talking about it yesterday nor was I aware of the other
patch. I noticed it today when I was running my WiP dts formatter.

Please drop this and take Rob's patch.

Bart

