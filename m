Return-Path: <linux-arm-msm+bounces-87182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF6CCEE1B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 10:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1660A3006AAD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 09:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132D02D8383;
	Fri,  2 Jan 2026 09:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6JVKA9i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF234262FFC
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 09:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767347585; cv=none; b=slheYc0MwtgzGdWv5Ib762IioKWlpzyx3aXdTY8C771FXD9SCuTWHI7XSQZOnDF1jLTL4AFiBB7sjg+MbMNUzbv83/vIw/4R8ZEJmCdOXo2+h/lYBXuj68/CC74r64pG0CIvyLMZC64JAQ2K32J/V6XadjqZPxNz2oL4/gy39uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767347585; c=relaxed/simple;
	bh=RABTphJbjveLyb+ZVfbZhXGTF+2TZRO1eYngRdD2ACU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NMsPTMV25xXUyVloKXL+K1DgExDMaRl8VKoBuzfQC9c3HXieETrL9OJ/y5e+Jq+vQr8lBQ3+wyUjlgNQTOLLo7rdlw485cQW+0ly7DNhsXCZ5d4X4Q2tyCiW1vDB++4bceiVj6Sy/qrHbdLhCldxVkIpEmRfAsPp0dPip1YohwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6JVKA9i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFEDC4AF09
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767347584;
	bh=RABTphJbjveLyb+ZVfbZhXGTF+2TZRO1eYngRdD2ACU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b6JVKA9iBHqMJ2WEl/TJWYBUGGPQG6CxgRpKvjEQA54ozS/+drXSYxg5qcJGt66pl
	 S8HEWS2B2ItLgOBw5Ev15Iw0zR4xpBt2WcODMA/TB6hbCFIsYG9aKu/0fqDRbm9tYg
	 BnHl5VWG6ejaJEcJmwJDNX9EWDQjJ2qAF2IPvxZIOld6oS3YTpdi4AWyDtlPow45Rl
	 fAJFQrcdE58Ox5m/4IGgyr718uqt9yfIcQUAWpGsl3t4s5oVwFGcPfK2wxWWlCD3hB
	 ayPw7b2YeUM89z2DZy9/h/T+l4b2FzZimXdFJEs6xVsnqbChJaFLfv78LMSqiFm89p
	 3lIUatnr1ah8A==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3825ae23d95so41827921fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 01:53:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8LXU3HoBYwsI6vE73Z0ZuhMuDNfjy/49RGiUO3nJIh3BCsgOJwpK0NBaRdcWHH1UMBXsODSkAp8W6Xgp/@vger.kernel.org
X-Gm-Message-State: AOJu0YwNAi4cRejzT2MNkf+lh+cXx1s61EzbR134Ax8bg0fZM9ZxLttV
	XpGzXHodViILkSXs+cOTlW3H1ovBgHAo4R7Lal3KXxsRRArElmnmxqv645wBENZ4k+lLWf+S0La
	CMcrzTNi8E9oJiJJogkDkWrTN9lksJV8ZO5fpTXXg8A==
X-Google-Smtp-Source: AGHT+IGbECLOdZOOC0s2WEHaaJW0az647jTqeIVtGicekW9VDB0ZTWEU8u1EUtypGYoR7HcDicw4i/ecZGCd4Ioj9Bw=
X-Received: by 2002:a05:6512:3c9a:b0:599:eee:8f63 with SMTP id
 2adb3069b0e04-59a17d093f1mr13859081e87.14.1767347582990; Fri, 02 Jan 2026
 01:53:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <39e025bd-50f4-407d-8fd4-e254dbed46b2@linux.dev> <20251219172222.2808195-1-sean.anderson@linux.dev>
In-Reply-To: <20251219172222.2808195-1-sean.anderson@linux.dev>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 10:52:51 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdpJqfNzwp4aOSDJAaLmwBPJ6FfNN1pNzeZaXCtyry9mg@mail.gmail.com>
X-Gm-Features: AQt7F2p2XsoJwFkhUajo7FMNK25yZHddCe-8r-tvrHRa1sDCy05D5PEngPIpFjo
Message-ID: <CAMRc=MdpJqfNzwp4aOSDJAaLmwBPJ6FfNN1pNzeZaXCtyry9mg@mail.gmail.com>
Subject: Re: [PATCH 1/3] PCI/pwrctrl: Bind a pwrctrl device if clocks are present
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Brian Norris <briannorris@chromium.org>, Niklas Cassel <cassel@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 6:23=E2=80=AFPM Sean Anderson <sean.anderson@linux.=
dev> wrote:
>
> Since commit 66db1d3cbdb0 ("PCI/pwrctrl: Add optional slot clock for PCI
> slots"), power supplies are not the only resource PCI slots may create.
> Also create a pwrctrl device if there are any clocks.
>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

