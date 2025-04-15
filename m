Return-Path: <linux-arm-msm+bounces-54307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F417AA894DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 09:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FFBC16BBF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 07:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069DF27991D;
	Tue, 15 Apr 2025 07:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s0aWOljH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1028727990F
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 07:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701827; cv=none; b=SVKDGPzOr6Y3R0DR8nsZp+1ASrFWpc/l4QAb7/Ip+CQ5VrGl9TYUgVV5bT+EPSNLZAolDaJKi4sDlcBk5RdXb0Re/j+4ZnVFB48ncsNat9SYHvZHNlt01Nk6YhfpSfCEf9ymHYrtV1C/ly2QX5v8wPxdcW0O4+G0qSbN9obTg/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701827; c=relaxed/simple;
	bh=UDj4eAeCiIPS1KrBXrK6pNmhKNCEyzIvzN6l8yfOIt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TJsQ/69RlkUenc/EkibBWOvwoP+r8Iu1NiP4QOH18CjNmilFDkN7XgOJZYHhXB/syUlJFb5rEihKNGW2MT5mPAURyoQrYqppWHUxB+a4HLcjjbefSa/kGGRKz/1fmw8b1a41o39QFYjaNLAmpp/WiQPmcq1y881QOPOI+uEevUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s0aWOljH; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30bee278c2aso64512091fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 00:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744701824; x=1745306624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDj4eAeCiIPS1KrBXrK6pNmhKNCEyzIvzN6l8yfOIt8=;
        b=s0aWOljHtl3DYidT4aBuJ5RbOxGD9xuVQ7XbynkofVHRGqgSxThq2b/B0pWaoy4maz
         auxxhCx/GtAGSO0VotQQynzt+4gcaYpVSeWmWWYD7mdXYfqz2GJC75tK+MJv5UluprA+
         E6D4Bq1vpEYg92kphPPOahfOs06pLP/evDQK02BnCI6bvavUEMdPlAhpO5LHP6wDHOPF
         ugVSHq4Nhx8ih2HHPLHAJKSN4nzEMWwcPg8u89zEwPFMLlKTlvG8PWaYt97TOsTz3era
         h3BVoZKC3RaadKJ2aI4+Lk8YLjSF85BJTNcuSRg16dWdASx6XTYDusqGbdIYFjK3SBqk
         gkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701824; x=1745306624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDj4eAeCiIPS1KrBXrK6pNmhKNCEyzIvzN6l8yfOIt8=;
        b=AGoWRfmAFzR9De+PNgQod/+xsFH55suFqUXDqehaDsPLLHzzzZ50Y99W3ylyoWh9gX
         8IkIXfNHI6t5MXq2hMDll5/YC7ftS/amJPqSHml+bDIvFMdxByXT1gAxIzfaK3U8WQlH
         pF4/Nrm9dpFjmTP6hLTXtRjlXECF4Ov89p3+5eNXxJ/jxuf5PY8lNkNKP0M3R/qCiUnK
         bMKHiyBpa2RMLc2DDHaz/uWx2D9s8jxM0SlRwHGdMYcnlFVyZ/xSLNAMyZURGR8+dUJh
         YjBTTYg+KMRrNtcvsvI4KndtTZ+ZQ10yVUgefl7PDIsq44jLsGVS+vc6kaLnTdWPI/70
         33AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl0IK5JEqmBZWt19HfCBKFDL8+SZBaOyo/hZt9BfIp8qbRHubrglrgD5FoB00QBNnp6OSC+msspezsNFB/@vger.kernel.org
X-Gm-Message-State: AOJu0YzrIpK7QxBhMdcaKepL2ltU7wXKmFGHDj66If2IbNOd8234ZLkA
	iSzDBiwFTgU/5MiFkoF8uUkfY58Xvlnz//aWWj966OvzKS7oSoZaoY6FAsIOewgBERlgpsRTBT9
	p5GAuJce+7YpDGxxZV4p6jLUTwbNPmJp2VcTXtw==
X-Gm-Gg: ASbGncuYLcWFE2JzSIUWJmhQLxDwU6fP9XygNmZNssuwXuDrojEsGSlQCbDsq393+tx
	Ht3AaVM5v2pRrMUOIwntpziERdDjRrM9WuJFxtkcYi5cKMbtrDiQQDja1hMktnsW1WIsToCADqc
	XMFb8+7Hp+R/PSEh9C48D9xA==
X-Google-Smtp-Source: AGHT+IFglWsLuajUozFpVPnPlBh2TjItDXNHlDH6L4EnWFRw+AziSkdH6rFqHcXtAE7NLHbCAo69n7eu1N1+R9UHYqI=
X-Received: by 2002:a05:651c:54c:b0:30b:c36c:ba96 with SMTP id
 38308e7fff4ca-31071c0b5bamr8409831fa.1.1744701824036; Tue, 15 Apr 2025
 00:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325094932.4733-1-hanchunchao@inspur.com>
In-Reply-To: <20250325094932.4733-1-hanchunchao@inspur.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 09:23:32 +0200
X-Gm-Features: ATxdqUE5jF908PdCkX3CIFaPCBX4_mmXl_uxNevSNqAZQBsFJDSR9NbcxEZF5qo
Message-ID: <CACRpkdbWx5u2RBmZ8bjoV-85b3HmQyWHxxwQ12zx_6pAFPPMUQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: tlmm-test: Fix potential null dereference
 in tlmm kunit test
To: Charles Han <hanchunchao@inspur.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 10:49=E2=80=AFAM Charles Han <hanchunchao@inspur.co=
m> wrote:

> kunit_kzalloc() may return a NULL pointer, dereferencing it without
> NULL check may lead to NULL dereference.
> Add a NULL check for grp.
>
> Fixes: c7984dc0a2b9 ("pinctrl: qcom: Add test case for TLMM interrupt han=
dling")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Patch applied.

Yours,
Linus Walleij

