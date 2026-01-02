Return-Path: <linux-arm-msm+bounces-87186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8438ACEE2CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 11:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADCBB300DCB7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 10:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93492DC34E;
	Fri,  2 Jan 2026 10:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hL1NA0mP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50972D6E4F
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 10:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767350017; cv=none; b=r5n3f36Mt31oTba3kungmZLGRyBuIE3ZfkiJSId2VbhoqYcpM9K05DZTPoZWAD2ui51f2b1VKZr1rC5eCNeV2xjWPu92U3t7K/JDXDxrOWu+vX2PXVMoW8txTX9FdrG9Vvmj7MhIs9+lkPrrhbBe3CSXAbUwhBDkU8YtoyOivko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767350017; c=relaxed/simple;
	bh=A0qONLkVZbPsPnKckIfQkcczqlnRmA9L8RYgFTezUw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXJ4U7h0CWtLKMgKTKg5cSXKNCINdDPSd2fRBTCptZa/0PZJe/gxijV1aBbHUQsTJytLfDPkJGJ5fb2EL1otHw6+74m/w41pClYw/OxSdKiEr1gbkJS6oSMtZ/wVLyZDFTEHljjUsKorachZTEWxeRHuM9g06fxKGsHWQjONY1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hL1NA0mP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637B0C2BCB4
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767350017;
	bh=A0qONLkVZbPsPnKckIfQkcczqlnRmA9L8RYgFTezUw8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hL1NA0mPb5yOQ9xMUzwBPK5mLRdXyfnjnt8KEVGMu4Jg+WQyfgDy2jPKb8UeGiq44
	 JYkyTKQsGCat2fAZP7gad2Abnp1LZXTyOk7tMxNh9SCe8VLGHZ0fTjGmh8Jpv3FNAy
	 53/YFPER+P3tUvSKzP/B3qUgFv10UwlQFJlHQyUkEL/oc7uldl+wMGA2wSrNKSovp7
	 FlYCK3lwf6ohbtmvVZSkH6dFA3ZcYnfPdHPFFx22YzQUiZkxolLYwAEzqygjOUJYqR
	 jM7aGyVCn1ad0vxDNEOXEgWxgbxNOQBRY9FEQXofbukvXnGoD0X4GCXWyMtOd4I7b+
	 bAxcmsX5SxWOw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5957db5bdedso13789746e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 02:33:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWh2SeCfldBdCG+AUK/9TAenh6iQ9qCzotFT83zkKIlXe7/9EHpCztbkAv8qrDeApFsKtFpowgDAzczeX5e@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9LYFci8/XtjNjRz0IWhF5iqS122Q+idcDg4YlNdi42QV/BASo
	grD3AKH3kqqKZiECo0/QH2yxdhKGdE0yVMnYZmUhvssxG2ph5asnWS+cquj+m68asjElOsuWMXK
	HYzGVOa+AOzkm5Dzt/0uAd2E9GAniH+Dh5R1RfrWLQQ==
X-Google-Smtp-Source: AGHT+IFz1P8JUDB3m78xG4JMv2W0HVtLRZ/WsXZNHNG01D4tm87qUYlJcn7VJnG4LRHgTHHzEjfbyGcJwlzlvzauRbA=
X-Received: by 2002:a05:6512:3b0a:b0:595:8350:5824 with SMTP id
 2adb3069b0e04-59a17d18081mr13844896e87.7.1767350015887; Fri, 02 Jan 2026
 02:33:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com> <20251231-wcn3990-pwrctl-v1-11-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-11-1ff4d6028ad5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 11:33:24 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mese6Zyn45oZCzv3G6eg3w8Obvwq6TE4-MnXT8w7P6fgw@mail.gmail.com>
X-Gm-Features: AQt7F2qL-yjjeTVapL27TBw0paXaPtMV-m6Ka4LrQJAKTqWS7TV8j8nK3HvZ8xw
Message-ID: <CAMRc=Mese6Zyn45oZCzv3G6eg3w8Obvwq6TE4-MnXT8w7P6fgw@mail.gmail.com>
Subject: Re: [PATCH 11/14] arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT properly
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Matthias Kaehlcke <mka@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2025 at 12:36=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The onboard WiFi / BT device, WCN3988, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

