Return-Path: <linux-arm-msm+bounces-75127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76590B9FA64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 309012E0188
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E6A1FDA9E;
	Thu, 25 Sep 2025 13:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiNW8bxX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3425B18BC3D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807970; cv=none; b=SVDhzeIS7NsTNAURVaD0QX4ulqTx0iWUAhzbUqrEnCQ9S62bbvKer4ZiC6EtUDXLwVq0NU04wETvgrzfg7TX8fiNM5KORBNZ4KPY6T/p4Jp6DTHirFegFsTBIKJEEiqNS384QIBfpqveAwDYNyictUcOqsihnOGj5BkRyGQbEC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807970; c=relaxed/simple;
	bh=pHyKqP1Uh80It6oT0jRI0YIpxXPjZpzLcuVmlSJEK1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPepvXASBnWz1wcYv5g2p9zFWXk67o+qBJPzDXQ2bs5TPTFqCKBMajMC8o6BNgjHSWD0gT6M+Hw+Mq4scW1Gko2zrhZVnMXrs8RpCLWStqyf2kzP6TZaOUJsiXAenFeJLsq2O4a38SZd1YTQTY4sM2EWBekrs4Hp3LPwrZGeQhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiNW8bxX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31CEC116B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758807969;
	bh=pHyKqP1Uh80It6oT0jRI0YIpxXPjZpzLcuVmlSJEK1c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XiNW8bxXTf+AbnOtfSmD5CrhXa1fuuLgoQd0HlrZ24VB2O6uQRFoXkX+FLOPpdQY6
	 VUOCfpFFTdv8l5jZmx1qpxxDBKc83G+fDhrd1Xag215A4Kd3cvC0JfjNoASjCexKw6
	 5JKkbodzP3Mvlve8ygvjXUogDiGcB7rudsD6Q6qXFpZOeVhxT745sj2bLO32LJifDg
	 KV3TSZ4MVzBkk2OWUU8kmdW4sMEgCcd3M00EqcJy1vtvYU87SSFpq5TXT0XPSS35nF
	 hJIl9FxZOIUqT0FGXeTZM+GMr0hR9IYRYsQfU89n9ghi+PGhP3YjU91nmZ4GV5J9uJ
	 +4FspOZTZu8rw==
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b551b040930so668947a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:46:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjZ0QgDFNdE9poHbDHayZYp7rjVi2qGv1AGH20OcA3hScq/GuOC6To3qLobwTrhxywzT7K+pdLyO87tY1n@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi7CLj024Lfca4cij/4+XNFvG7FAgh/4YkWq1UjVks18L44yFp
	ABYgsKjJLsP5vGb9TgPWrQ/AQzC3Or5oTxPjHYSAteEBbp1RdA5iu9+GkUv7pjNumQ8s1b32jhG
	7ptu6L35GJ2HVHc+JVkLDVq3+8EVGEdo=
X-Google-Smtp-Source: AGHT+IGYiTJ1wnTGYsqQn62kGuq/Qk4m+FLl3QNtyI9gHwCMbuPRif0+n7p6QvUqoKMqu/CcGrrIjG0cpQ8IrhIQzAo=
X-Received: by 2002:a17:902:d2cf:b0:24a:d213:9e74 with SMTP id
 d9443c01a7336-27ed4a60608mr43986485ad.49.1758807969443; Thu, 25 Sep 2025
 06:46:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v2-16-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-16-8e1533a58d2d@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 22:45:57 +0900
X-Gmail-Original-Message-ID: <CAJKOXPd9KbrOcR+0+9C+8E7EGZox8CvhA+ohVJzqav3qOiSaKw@mail.gmail.com>
X-Gm-Features: AS18NWBvQ2h2Q9lWRzUJAnfxzgiCdQUhDR0fS4kR1DkeIzXQ0g9dyjgD4jgxyEk
Message-ID: <CAJKOXPd9KbrOcR+0+9C+8E7EGZox8CvhA+ohVJzqav3qOiSaKw@mail.gmail.com>
Subject: Re: [PATCH v2 16/24] arm64: boot: dts: glymur-crd: Add Volume down/up
 keys support
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 15:29, Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>
> Add Volume Down/Up keys for Glymur CRD.
>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)


NAK

Keys are not a separate feature but integral part of the board. Your
split of patches is artificial and fake. Please stop sending patches
per one device node for a new bringing.

