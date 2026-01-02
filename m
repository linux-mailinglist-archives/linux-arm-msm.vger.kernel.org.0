Return-Path: <linux-arm-msm+bounces-87190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02029CEE32F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 11:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE68C30057F6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 10:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580CA2DE715;
	Fri,  2 Jan 2026 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EahzZliQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BAF2DCF46
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 10:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767351079; cv=none; b=bPh+jYY3vOjWFtkYqUDOKI55cC1UV8Lj7zJsv5W7RZCFfm3WS0Cs5x5kXLSjP7nnBmyhnt4pbzD0R/13F5gSapn0HLe6K0h+Dq4/k/SktG6SX9dzegsIN02SysKZRuB30rlC71L4T+ciGm7abtC50luYkn4zrm2BTkbkIfdX91k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767351079; c=relaxed/simple;
	bh=xCx5AAentnk4QBvWh8rauxDanszvphvmntZcvGZ11JI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1GyKxj4tCT9/SbiGpC2mpTf2vgNU7ImLwPiM30nOHcgpNHDUA52Jo+I+oP0slVOmdNSgym8GAWHKDh0EE2vJfV2C+XCMvaKHV54HZX1rYefzbyYiK0YahSnZtC79D1U45+y5US9bdoXmlzfV8OIPI9J2/LzeRGWrTtdw/FrId0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EahzZliQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94D8C16AAE
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 10:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351078;
	bh=xCx5AAentnk4QBvWh8rauxDanszvphvmntZcvGZ11JI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EahzZliQRaogJeP3S8smgk7ZnNjc19jRWY07kDnp2jgj8UCpfkERAwKP+iTZb0D3g
	 IElGpf8kaCIbKcTkJlQkWiA5BOxpZKiZ4NbOEXP86+72k6cGAsG+EH+8f+u74QkRWn
	 cuamc5xtvzV1THHlwQpKC5pRn18p4wQ1ANLV0wLV9IOCcQTTNrZTVmz9XdQkZfca8o
	 YQHGW71Qa4f+OMbS8iEv0hKpYXluglGOPgL8R5EpensfttsaDQVyth89FZOt8AkcVe
	 LNry1dBl9ioRG80RQuVURXLyX6h8pFOJOsp4aID4DBH0H/kPI/phUSBHyp6j5BEJkR
	 b9ahc1wEQ7Jcw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37a2dced861so122457361fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 02:51:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXmDwu8LweEUrxW4SfTJvSUyLSh05na68uDR4itIqHUr8s3t3v1ze+rMbeTer07uCxQec5mg6CSlBSU5qN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw28awmaMPr02lH7sq7Fxzmgr7CI7c9wzoG0jS9sDGF2oodNVZ9
	pkZiSPuxcCjUO2yDvU/kGesTFaF42+FWOEIvv5R7L2N8tKXizO5A3uHGsFHC+R5j7YL1emFdgBD
	Vr4W3S4MDn45f5TIgKhIwRQXZfxrZz9dUQ9SyYe9zPQ==
X-Google-Smtp-Source: AGHT+IHsTD9adaJDmyGmY1It23ntuHwPKruzTO4CUZ5lqrhgY5dCs2ctjbHSYlm1/KVO3NQ94ib9c9b+lWmDxYLnems=
X-Received: by 2002:a05:651c:50f:b0:37e:6884:6756 with SMTP id
 38308e7fff4ca-3812081e6dbmr136602621fa.14.1767351077385; Fri, 02 Jan 2026
 02:51:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com> <20251231-wcn3990-pwrctl-v1-10-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-10-1ff4d6028ad5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 11:51:03 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf+FFEQPb1vvaY09_P=jCuzzFw_ZyaV7xB3BEdbWveU1w@mail.gmail.com>
X-Gm-Features: AQt7F2pqkjKwFIx8hZpIu-TfXbr4Nzd5pfqyrhbXe7nGgy4iKw45mcVh-sFbf3Y
Message-ID: <CAMRc=Mf+FFEQPb1vvaY09_P=jCuzzFw_ZyaV7xB3BEdbWveU1w@mail.gmail.com>
Subject: Re: [PATCH 10/14] arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT properly
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
> The onboard WiFi / BT device, WCN3950, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

