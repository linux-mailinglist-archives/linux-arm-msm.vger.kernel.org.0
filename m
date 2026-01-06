Return-Path: <linux-arm-msm+bounces-87700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03379CF891F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 14:46:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8941F30136C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 13:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851A8305E32;
	Tue,  6 Jan 2026 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWqCgj+y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6B22F28EF
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767707162; cv=none; b=gAK/si6EUYJPAC21LNzCMkmULsjOPknoyo85jWpK5vJ7nE9/Yj443PA7SbHNlCXhNEsDR7QSVYJE90HpVGkwg1wruycdKYmHWbSxGnrTIJJ+9v8c/LnjFMIbU/H6ZdV6gMLe+d+GGV6Bp9PhdpccgQJz7Re5pjmZMIE0nBLSPdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767707162; c=relaxed/simple;
	bh=vzdhfJRb/NEWPe9OQNZEg2hhlzRzCS/z3grDJ9+322Q=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1MjCM/JMkaKI+oYgnHuMMrgOc1smQ67hSPp+RalLz/upLy9W/vQgc87AhWAUh7zQO6hQO3iR7/+FkNCQGAm69XQmM1HSgkw3l+TAXiXZQue1SIrRfozLH+Bh8nZegRJLVwXE87gmiE5mdvMknjqnLxVkufJWBPSFgqgEex++dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWqCgj+y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB163C2BC86
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 13:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767707162;
	bh=vzdhfJRb/NEWPe9OQNZEg2hhlzRzCS/z3grDJ9+322Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=tWqCgj+y8j6fiwGTCfGWw6JE4v9i9E8+g1Bl6h5+YQ8+3tcw7iXUbLSvyunBWYxDd
	 Ix9ZUNpMT6yarJYapU+Wm7IK3EUve8aYYbOE07//VddsucBiO8/xCC7L5M0N+74yC/
	 cvydB8rBHffXMf1yOREcSRDZ5Fhm1eYcdL+HoktTFN9/Z5gqy42jJxFCfUjEl9UCT0
	 jGZindPaxjTAkmxNSxF9eWTHYmLM+0tp0BXnElYtYtmkqUBMTbSiulEyYU3pcyWldM
	 esdFhHDczjILE+UU16MJKgpPTk3GIiZ36peK/7ZkRNRlZS49kMSteNT7QHAk3mid6W
	 Vphfp5SGOUn+A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59431f57bf6so984044e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 05:46:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWuemtzJ0gaadm3iLB26O7+keVtY8uui6vv/0X1KLnmE81uc6yOfRpbxihuZqsutTUrtxq/T7RiLUN1sIQu@vger.kernel.org
X-Gm-Message-State: AOJu0YxK3DHgwMGxvk4/loZBZZOTt9dSameTf/v4cuiaENqRSjEeEXAJ
	qO/KsJzU05LskabJlgLyVzrzxOJEJjbyyUuTMFRqy8DZNcNPkn9xoYGaij7weLdz0AhUmB0H2JH
	yb/D7lmkKhkon5OPvhSw8ilCi3g/PpFmIqbp2BeLxqQ==
X-Google-Smtp-Source: AGHT+IFuUBVzJhOvSBkhabTnRfCSxq9y4IZWaB8hriE4vmSSMkEBXOCUH+U1B+LTH/VhedFco9Pzr9/bl4SisPkcfgY=
X-Received: by 2002:a05:6512:32ca:b0:598:de1b:40e4 with SMTP id
 2adb3069b0e04-59b652b4065mr1055700e87.30.1767707160533; Tue, 06 Jan 2026
 05:46:00 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 07:45:59 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Jan 2026 07:45:59 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260105-pci-pwrctrl-rework-v4-2-6d41a7a49789@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105-pci-pwrctrl-rework-v4-0-6d41a7a49789@oss.qualcomm.com> <20260105-pci-pwrctrl-rework-v4-2-6d41a7a49789@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 07:45:59 -0600
X-Gmail-Original-Message-ID: <CAMRc=MeoZ-JdBBiy9Ddrx78NB3Bm+xfBqjqB--GXBR5+i_WBGw@mail.gmail.com>
X-Gm-Features: AQt7F2r19m_p9_pap1FMud7aAZPr1pnfDKx1w_5p9K05axcHgBG3gCo255deyOQ
Message-ID: <CAMRc=MeoZ-JdBBiy9Ddrx78NB3Bm+xfBqjqB--GXBR5+i_WBGw@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] PCI/pwrctrl: Add 'struct pci_pwrctrl::power_{on/off}'
 callbacks
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Niklas Cassel <cassel@kernel.org>, 
	Alex Elder <elder@riscstar.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Jan 2026 14:55:42 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> To allow the pwrctrl core to control the power on/off sequences of the
> pwrctrl drivers, add the 'struct pci_pwrctrl::power_{on/off}' callbacks and
> populate them in the respective pwrctrl drivers.
>
> The pwrctrl drivers still power on the resources on their own now. So there
> is no functional change.
>
> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

