Return-Path: <linux-arm-msm+bounces-65266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF3B07816
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 16:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A06B5188CF6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 14:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1AB2045B7;
	Wed, 16 Jul 2025 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iDnWc7VK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08342214232
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 14:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752676179; cv=none; b=b1RD12lSLjOye0pCj2+dGY7YmSnRm76D4rqs+ZVQFAQF5r0sTWU8yNuZdki3db9c24P4mlSlvDR0Vd3m6wmU2KywaPdaf03wLWGVqtz8tkKV73CIpqZMqqu7QBbpjz0JTXtj3MUzOVCufjuI0VlQlxUNmZwmmJmQnWKkYzmAYcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752676179; c=relaxed/simple;
	bh=t9cGAC1V8k6SxfXrsLQjmHsOU+fuaxnp8/UHtdTovTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYYtRr3vH9/HFbWqDM9BpycatXqEBj/Bs4Pyrs5jDny4XUsWdsLN3iVmzUr116bMV5w5OnVshOG4YgYobuujZ3sfC+v0mb9gQBvq640K/flQ1C8tmo/wE0Cj2d9Ffxmi79VHBEVuT2P+jSzm0gfCDUQJ8Mg87AFEn5rnyHq/T/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iDnWc7VK; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-73e5d932ab5so801232a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752676175; x=1753280975; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptfKV/lWd5XKyT6rmwDogz+72ly7gZepKQSMRpdWixE=;
        b=iDnWc7VKyw7OGVuhRTkEDo3BquGWs1Ol0DkBR4JqfcCsvDjayPOrDpZqtjTNf7huEo
         HGTT/9RPw3XT/TzmsPw5ofFsiRp5Ac3hf7SktXsiyduxrggD9QcrYxnqPfCYPyf8ctcW
         ogErQeG0Q8n940D0TBRFike7F6wC2ZnXMzbb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752676175; x=1753280975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptfKV/lWd5XKyT6rmwDogz+72ly7gZepKQSMRpdWixE=;
        b=aeDG0yyElmV5Plj/ozWQn30Bhexer3Qp1ZOujQieRK2E8mdA+9Cb/bHjsASEw3tMRd
         gV7mfDl02OZGBY0UEWY27YmF/rgESAKHY3Er/Z7jFCVPAAh99IJilZFzFJEGP44g7nCW
         BL4aLFiKV+Scg+GMLwymfsDyBE8ZpwukHJcrBWCbZRmxE+ZGJjSjh2fi+A7wC54nluwU
         4cibXSmmAduNBxshW5dAWlEgUaQCRz3+/tSFbga4DkUUL68Uf+fczKq4mUFG3ld34csU
         U9rhdmQdleTuYCb1+V9gjSA8lymwnlDogEjHqE7gm9PnR4NttLf5XJzz1c1xj9eOmHGd
         rLKg==
X-Forwarded-Encrypted: i=1; AJvYcCUBTnxE2w8ITtDzQKpQ03ElYGHMxkmXxmCL8+fjpikwdTKwNpBqG1SBPemMgggDois5K11rzRbWKGtv5EjU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz748ad3RSkFTbVW3+BUfqZJPAmfgh3YxCXSjzCn5y462sNBlyX
	ziUxhzJ+mJWzMqYKyfL8/Z+VTeHeNcN43XvfxwTwBKiAsRh4q1nuWVi4Ooc7FrCAdfxmMnCrdaK
	WxlQ=
X-Gm-Gg: ASbGncty+X6urcJXK821WrA22K2wAINTr+BY0k+rxzCPpgp1ojGWi8yDXz2psC91LSO
	J0Jkce1ErQeX3AVuZWHA3/Rc2lMVh1aDscxA/kM2oQ9cB27SXtkR6M4EzJBfkHyWpwYEfNFwsl7
	bDm9P6G3xvIHPC/O/6figa33qIlWHRpJ0FYtlRvKi3oEItFJY3/8cMsiBPzgLP3B8G7zjBpXuC1
	LkR5j+bJG9QHe5Z67eHPNdaz1phYHb7yf7S3v9FBGJm6lsMw3CusH96BwkaLzHxtSHNhnAW8dea
	Fo038nQoL8ps+aQtvpDU/rNgjyug+fDXj+4gfj2pcvR1oPaPSSfxEdBT8kOZkWsWaHFwCD93TMP
	ullQ3Syxv7QDa/nNvU2PKaxHSQ+EDx0Hzwxhmxs83wypgQ3Yv/8JADmh00GWkiw==
X-Google-Smtp-Source: AGHT+IEZHYUX7iNx15pvGmckwjKDX5f9oxV0krKIuQTYu740cLqMPE5zpww6IQ/FSIDrnpfr9C7yKQ==
X-Received: by 2002:a05:6830:4d87:b0:73e:66fc:d6bc with SMTP id 46e09a7af769-73e66fcd8b3mr1886686a34.22.1752676175024;
        Wed, 16 Jul 2025 07:29:35 -0700 (PDT)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com. [209.85.160.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e5d9028c4sm1158916a34.59.2025.07.16.07.29.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 07:29:34 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2ff9b45aec2so750135fac.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:29:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1Gw5aY1qT7kygXB2Tcp+GWvcchWWJKKOFNfKAjRm0EtFGy16Y7LXbKHqdKpkVKA0ZRdNPvbAXdSL1esfG@vger.kernel.org
X-Received: by 2002:a17:90b:3c4b:b0:311:fde5:c4be with SMTP id
 98e67ed59e1d1-31c9f45c8e9mr3962513a91.35.1752675732176; Wed, 16 Jul 2025
 07:22:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250716-topic-goodnight_cheza-v2-0-6fa8d3261813@oss.qualcomm.com>
 <20250716-topic-goodnight_cheza-v2-4-6fa8d3261813@oss.qualcomm.com>
In-Reply-To: <20250716-topic-goodnight_cheza-v2-4-6fa8d3261813@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Jul 2025 07:22:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VnE0kUk58GxmfwwZ7eP-9xe1Hqv8n9y2tHkiMK3nwFGQ@mail.gmail.com>
X-Gm-Features: Ac12FXz8ywMx4qZ-nfHra53TjelQ0XaS7lSbI5YSdJlI09vDJzDmVP6OfgYR9ro
Message-ID: <CAD=FV=VnE0kUk58GxmfwwZ7eP-9xe1Hqv8n9y2tHkiMK3nwFGQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Remove sdm845-cheza device trees
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 16, 2025 at 3:16=E2=80=AFAM 'Konrad Dybcio' via
cros-qcom-dts-watchers <cros-qcom-dts-watchers@chromium.org> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Cheza was a prototype board, used for developing Snapdragon platform
> support on ChromeOS.
>
> Since almost none are left in existence, and none are left in use, the
> device trees for that family of devices are being removed.
>
> Clean up the maintainers entry with it.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

