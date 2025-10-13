Return-Path: <linux-arm-msm+bounces-76986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C85C3BD290E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E56283C2DED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 10:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1AA2FF64F;
	Mon, 13 Oct 2025 10:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SsolKaTe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FF32FF64D
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760351224; cv=none; b=WzqI4c29LOJpmWLAu+N8svTXnszObqLaCSORyC8sGclKqMLMu5WA2MGnUX7P89tspyhhXs/wV30kyusb2VwvuAbjcHumaWjLiD2om8HS1CeEd2mzu99W4y17WxFr/8ALTGwtNafyGcVU78QJHcJx7uFVwjokbts00hqRlc1ezBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760351224; c=relaxed/simple;
	bh=mYP/OQKzVS1m6M+HpUKFSESiFlsi27UhRPn0dyau2kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GVcjoHelk3PGugCIq61gl9yIRUWeNz4Ma8YqLmuEqmE5obAtu1nG6Yg/wsMLp5O4VPbhtMD/zpCfaJsnlkQDMgpZm4YO64VsqDZQ38V/EKYX3cBqZEiWdyxlQC/9BuE8WjhqIv+0eWhocAPMLUGCapsiAN+WlXGJQQYdb5v1bHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SsolKaTe; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3682ac7f33fso46868061fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 03:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760351221; x=1760956021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUycCPtJNwSyf8L3pkwEVzuTkjNQoDRYegjRAHgk7u8=;
        b=SsolKaTel+wOEiH34+tTPJIPAO7a03Br/+cCmXFLjq/daH3rzWQm6FzeftLmlmiNxP
         PbxFFyDH54AJMVAEn5YQZnDTFnZoaAPXiWaIVr2vlv+B5HcmKjb3MpR4bYZugomGzXVV
         95czHWAvbVksRzkqABUVRn0qdj6/iOE7bsrobtNe1ilco2kYIB94GGIDfZ9iCGy2SFAQ
         M01qxUkWogyG7UZ2lCraonpybGL31SUS7PoAnnQ1I/POtnMnE6XVej0txDchL3rv061t
         zE4GUVRWqKnaQIqL/ArlI6yCZha6HC64v+ImMxlr+qSfb9IHlurTspnSkZr4WcedGAm8
         uWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760351221; x=1760956021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUycCPtJNwSyf8L3pkwEVzuTkjNQoDRYegjRAHgk7u8=;
        b=ZY/o4JPWKcK2z2Dp9pM/pnnBo1UuzaGQh2TsIow0+RsLJXQuwxfHki+aiftwkHmSdl
         px1Qarzdhg1svYxgCpiqQEw6eH2UGhj3vjxyRAXs+qoKCcRpefwEZFLysge+2iboXRru
         +DE0TuGP/DPcpfLQMtGtk4yweh8uNmaFRSCFm6+IRq0U7tsfMYPvwe7Ki9Au3ZUZTcCO
         TeOg3M50waYHMVy0lt1bGu0R6xZhllagd88c+MmNn/3jZGGib+VRd/n7tNAB8ENcfOnT
         4lpUysAIRqNbtPA/TVU+E4pAG8TCgfVzV4Up3sSJezN+lhTpwMGwBrCweuaa3QUghEXB
         bEPw==
X-Forwarded-Encrypted: i=1; AJvYcCXCINhFlbazzbMyT1VI2Uc6gboKoL+hUzIxW/p9GgsL9R0F3i4ygw3pBjeXMAUDSc0iBwENKtF7HCcYDVqa@vger.kernel.org
X-Gm-Message-State: AOJu0YzzRPFOXqNyIezN4bY6Sl21Iz/+0QU+U4uSsS2L0jyOEvGv1I7T
	aVmLlu8c0o9B5zsrFNpQ0G3NnUHg6BJZGiYJXA0GVXupAWbtFDyOPFntD+lbnon1xgAL2EAIwne
	L5simO8TPjlywxLjYuzFl1FjBDRXV1/ZQ9LX6O4gpyQ==
X-Gm-Gg: ASbGncsVtcVjM2G3juouGZqf4+1O7MUhHbxs27s/V3MfeIeqbuf8CoMe7ThLklqGr58
	LBmTJJyubMu6yeoQXzpTPkN2t+x2ni3gDV3im5+4/+/kKSmB42x+MCes5z2fhfQ4I5dmdwMwNdM
	DY1O6REAv+FWUwdOQRg1A5/h7sCpG5FT0hGEpVn43I+bNFzGnC7tFJFytqH2B1/mzMMwRLzC3lg
	mPGi+Ij6cEzr8XI1LbVnLf6Uw48jg==
X-Google-Smtp-Source: AGHT+IFAEsHnMAjQz8hxHe77PJ/PCdDOE9sQkCxeRCWPsKIX77lQMxoPbYN5YcgGmocyzXCOJWX9oJCl9IJt3sstsZ8=
X-Received: by 2002:a2e:a54a:0:b0:373:c272:d986 with SMTP id
 38308e7fff4ca-375f526e5b0mr67753781fa.17.1760351220605; Mon, 13 Oct 2025
 03:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com>
In-Reply-To: <20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:26:49 +0200
X-Gm-Features: AS18NWCGvuxtBzvkEQk1ZaKR73JeD7vVIfCcLysVpFERoAJPL1BMWsaJUOjyAzE
Message-ID: <CACRpkdZOSvEaUU8AGQY19co6maeFwkqEFP+TH-=NnToJuoih9A@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jingyi,

thanks for your patches!

On Thu, Sep 25, 2025 at 1:16=E2=80=AFAM Jingyi Wang
<jingyi.wang@oss.qualcomm.com> wrote:

> Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
> Kaanapali SoC.
>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Jingyi Wang (2):
>       dt-bindings: pinctrl: describe Kaanapali TLMM
>       pinctrl: qcom: add the tlmm driver for Kaanapali platforms

I have applied these for v6.19!

Yours,
Linus Walleij

