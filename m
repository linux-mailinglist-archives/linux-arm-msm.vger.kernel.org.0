Return-Path: <linux-arm-msm+bounces-110829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YYb/IUv6Hmq8bQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 17:44:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E979762FEAB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 17:44:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=nTWtNnAk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110829-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110829-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1ABF3028E98
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 15:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E0C3EFD35;
	Tue,  2 Jun 2026 15:35:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F513ED3AF
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 15:35:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780414547; cv=pass; b=qndmegP19UT7Cz/rmzn0oak7GfOuszeEJJSYE0jIQa/7zH9683uCRDboVAvcfTVawd+qtwcOf8IuX/9dh83JwOcrd7JgrdBIY9ZPU4mWN3BnooBYFbg5d1dUdcu4hZzt8sJLPyWNL1FVTZOSZ27NwkE2XYxVEZ83cC3kRfeX07g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780414547; c=relaxed/simple;
	bh=oKhZRKSNDQsRxVT0JGr6nA+dxNnWA37kOR8/qGg6Q1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e30nVQoRbRwVLuTE2eMulFC4RsHiCwERq5lFVjGW81I5pKIqCMtTI5iovLu6czTRZA0S52e+n+VPRJgmPYOhsgyCa1n5MvDBqxCLgNEHzsfaC6a0LG7wcFJfWOEMOEXlcEBLCIuej80jQXQkmWgDyUgRSiOkijUz0ho8goGPkrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=nTWtNnAk; arc=pass smtp.client-ip=209.85.210.180
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84232e83ca9so1238453b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 08:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780414545; cv=none;
        d=google.com; s=arc-20240605;
        b=ELwm6d5K1CGWITwX0zmx3aNicF+ptw5z4dQpAYCGzizp+cGLxtKKnoFN8j4uFCWF1e
         LpV+AnAWFfFfq5WIY1PiIOnsNrN9NdTPZ34LvHXdvy5N9ReIlxyNI3THcGOFkFs//lF5
         aXWkswJv3HnPLjm0lXk3yKMoqPHcHr0qIJZn/Uf7H7J7jE3PedV2mbOcK1xnA6g+mRFd
         UxsmE1SsbTt9eQbdxZs7he1XQnZNG66k/RvFKlzshPk1CNUJG9uzTuXTAs0iGgvLEMEP
         iBcVtP6DrzWpyhKvEMJq9BptH307kc87FNRttu0ugWppnvYYtXeqLT7rOtMGm1FK1IYB
         EOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xIH2uRX8VoTWmyY9T8w1tKTf1uWV1y+wbUzLia8/LPI=;
        fh=c0zA0uOiLJoafbvUn4F2yaZ84u5a4hKw/WY8ckVV3B4=;
        b=bD5xnAgvyTS5Cqe68tYyukJfINC+Oi/j9fSApQzBLMtzQPv11l0qeArMC7x/E7hs46
         i9kuh7R/53Z8BQiwIeZlDfhsfpu69hoKHLXJ2Paozjk6Awp8QpPHL+vx+uZcc3FMVQ23
         jl1qp9k+vDLw/83AAzOGT9jwmGVcqOHPRE43RG9H5hhJJw2SqPZ1VLU4JCfmEuaJRARA
         FVLEcNiZ3dVGhvCBpYFc8oV+46vmodCQDm79OuNcVs1GXxLPodl0Z5wYerk7m4CWARRx
         qmo4PIk4fJdUS+j+zPpv8pBNWGAoaA72SvTdHeuqOKRZ9/1mbeeov2tydJl5TmdTtzA3
         QT4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1780414545; x=1781019345; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xIH2uRX8VoTWmyY9T8w1tKTf1uWV1y+wbUzLia8/LPI=;
        b=nTWtNnAkx2IZWX2abNaxi39nj78ERcYHOQaia/o9AT0DuOcSJkDKIYJ4VnHqmaFVu3
         LfRcqexPGednanrxMWijK6dQdeuj7Pi5A3nx9YKv/CQclRE//vE6DIKj6d62tR4D0wuw
         zpFx2j9j+Re94WhP7QfWxYNIH03BJfbG/Q24E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780414545; x=1781019345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIH2uRX8VoTWmyY9T8w1tKTf1uWV1y+wbUzLia8/LPI=;
        b=GlSzU7SWbLGGWX0dcTNRotwKhez7D2yCoiSbo6RC0eDB4f0tCH1jKLqeW77dMrlA2C
         zC7hQ6pgwuta5ed34lfMDXTC1KVLP7ccvJSyE5zq4NsccifYgnObZYbRIWYflE+FLE6L
         L1z00DwMS/NeTg+4x2X4KzHOMSxve8V6Wi1zI0WmIRL93bCWDjfjAHYOFIzheOV177Ia
         +SUVo13a2ricsIEC5w4lVLXbZR9z0bAUS706kNffhfuQhWyhIs7JMvts/eGHNSKkeYpr
         n/2u3PE/dvDytqf4y4UP4XF77cvyCB1qobNKtLF0+9g6TThSjt1jZgPzn1IORdSHuT2I
         bnKA==
X-Forwarded-Encrypted: i=1; AFNElJ9RbYaea1MJL7AcQpaCoiwl9UivHX4K5mrRnedndpTpnjo6z69ARNKFkaojIXztBCue3h7Wa+0CD4wNAoDn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+lueUnFq0GCUw6uLM1z1o5RrlBKOtdWNMffX0ngDwgMoWMHOB
	z9reuQHjPoVi5cFuB6DY0OhUCsATzpSJj2G+gWjTBazj5MQzhiVqbvdYmvFpLdI6HkN6cFhTjPb
	dGnKg92lFKUO+TxSdPFhsNEzUOovT/pM5S5FeQirCYA==
X-Gm-Gg: Acq92OF8pNYTp/V6GroArIySyXpFtLtokA8zFWE6d/J0NFS2jTYnIfF+0cjerDNxKaf
	hy6mMStohGwFLDH4ikSSH1gzingf4Dyq7tenZeFLyBQfDaIFi/DCYl2fP022SejstSoRzTcMJsI
	62ySbX/+kKUNuIF3to52Uruo8Rx2VbPLBpwxgAt2zRAiCdEHbJ828GBhJDEAmadXuTU7z5vN2cb
	MRo7yNfjmYVIWKO0wNNgD7XSzejdisXyHPk7NEPmqJ3PrIBrJ33+Gbdz9tepMLhdqN5hFWwju9F
	Ut6vjGbQrGhuKiOQ15+Ry6qm+VjkKh9uvBWZosvnqn6v/tURm4Bek34zqEjy+oMR3N3DEUY1Cb8
	GbwYpkdU3GAgsGN9cZQfIXjQjiJVQDRd4ZNdjMuwQpMF2vqxSmkI/V07rLnttTFzlY2ie9t7jr9
	5rSy508pI2kv3EvbbEi6ZNHts3+jG9FVftVQOUJNRIpQrJznJ3XR9oesYk4gs=
X-Received: by 2002:a05:6a00:1bc5:b0:82f:9985:d4a1 with SMTP id
 d2e1a72fcca58-84282f4be9emr114808b3a.24.1780414544733; Tue, 02 Jun 2026
 08:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601041336.9497-1-daniel@quora.org> <ecavEnqJTDXvfFykc9uJb5No7ioighpjrCdw2CFZ4c8Izr5DxpTs-606Bg7K0RtHTaOqksWivHxWQLzMBP6qow==@protonmail.internalid>
 <20260601041336.9497-2-daniel@quora.org> <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
In-Reply-To: <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Tue, 2 Jun 2026 23:35:32 +0800
X-Gm-Features: AVHnY4Jsj6RGlQW4Ea0C-JB6jRZRFbYG2MvxlnfYpmwEKpWeXFNaNH003Nh9F4U
Message-ID: <CAMVG2ssnyH=KUKrdfnUOtPYU7p17inyzcYWcKhT4EAZxDzDjfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	"Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:quic_vgarodia@quicinc.com,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:bod@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DMARC_NA(0.00)[quora.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-110829-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quora.org:from_mime,quora.org:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E979762FEAB

On Tue, 2 Jun 2026 at 18:27, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 01/06/2026 05:13, Daniel J Blueman wrote:
> > On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
> > triggers unhandled SMMU page faults
>
> How do we know that is a correct address - does it come from qcom
> documentation or trial and error ?

@Vikash, beyond your comment I linked in the patch [1] kindly cite a
source for the different stream-ID <600MB behaviour, and share
specifics, eg if silicon, firmware, or driver and constraint, defect
or otherwise, so I can include a definitive description.

Also good to know if my workaround is good for long-term, or on the
other hand handling streams <600MB is important/useful.

Thanks,
  Dan

[1] https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574

--
Daniel J Blueman

