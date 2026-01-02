Return-Path: <linux-arm-msm+bounces-87194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37573CEE374
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 11:55:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A187300A6EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 10:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16982DECBD;
	Fri,  2 Jan 2026 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7nEObdI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCBE2DEA75
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767351297; cv=none; b=XVDUoPE5luuoG3l9RN1X7JUOgUvqdUAiyl03n7RaGXqkvUNsoeU1cz+0f/96GbOMNT/G2WFV4QUNOc2AxrdImAw/hSUG5mLT0siUuR5Hmqi0P5c4+bA1wEHwoRPT2d01zMbc12b6Y97KCS27A+9ZL2gC4W5iwHzB4Vdw0OXVTJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767351297; c=relaxed/simple;
	bh=2MSWLmERer6P1TQXzvhyk6/QJFLaS0pEuKvejes0xqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+FUy+KTDpajciuunx6UZ23eu0szuSj9eHKXThp+8B5fqmEbpjMAR+LLSSybNcWkuGMjacV3C9Zob3A2VzmCD4vFezprQJVSrkdsTXih/rj0xQqYerQAdB35WntCBITTzsO8RrklYw8LG9OAy1yBkqEh+T1zqomCSxpeoLXM3WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7nEObdI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D04C116B1
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 10:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351297;
	bh=2MSWLmERer6P1TQXzvhyk6/QJFLaS0pEuKvejes0xqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J7nEObdIKvT76wNd4LVyS/5yE315iSpvpQax38KXDtMgpEk69W79APryrs/0M5taK
	 U0rfU2I/uLbQfiws6180HnOaL/MCC4uIURj141Tzibsu7W3GTKOvejr7TonqbIrE+f
	 mLgNOHIisIYraHcjgUvdXSeN3cBqs7+jk12BSB0B/k0ZIdDKtPBYOGH4OnKbRaYM3o
	 bO4womAsnx3B5M8r0AoHn7VuXIrFhMtY2xhrW2hMSm20jf+Yqc/y5aHE0agNhxRe1s
	 rJ1dn2mmzWGqd73u2GeWCQ1RbufIrw2bYS55695GkqyZ7SA4vBAI4QvokxjFVU6TTA
	 rTYsYJ9FtCt4A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5959d9a8eceso13555796e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 02:54:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVCXxS3RtFnbh4UEeptb7VVBCg93qsXJis8a7g43rBvUTQRFl+v9xd0B2WIkcfinq+d0NgW+rExM9r1tfvM@vger.kernel.org
X-Gm-Message-State: AOJu0YwaM1bPBI1Au5DAd46oSkWkPWAjPbAtRWPOIDCstKg6AmMhAM32
	FnZ/qp8bfkufXh1FA1jafKzeTqCPMrsklKdeSlIOpG/kciQN2ZW3iwnFgbr4QsjDtWvkm/U6loH
	t/LAXEIUHkRKq4tANcCtAdEKmzNCys237tzqfdwyZ3g==
X-Google-Smtp-Source: AGHT+IE3wuqwhhZBoW5XeciJahkVWmtDvaII43AmrTFI+5uo0TaQV8ir4NrgZCEOO0OAdXxh6N3P1CB6vFYdTkYD2Ug=
X-Received: by 2002:a05:6512:ba3:b0:594:55ab:57ff with SMTP id
 2adb3069b0e04-59a17ddb48amr12071035e87.33.1767351296119; Fri, 02 Jan 2026
 02:54:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com> <20251231-wcn3990-pwrctl-v1-1-1ff4d6028ad5@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-1-1ff4d6028ad5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 2 Jan 2026 11:54:43 +0100
X-Gmail-Original-Message-ID: <CAMRc=Md4pqhouCc0--Ew-cPDYp3wOj97=vfCPqELJjbqZCd5Ag@mail.gmail.com>
X-Gm-Features: AQt7F2qltvB2UU7GWk8z6M_fSp-9tAVaUHvoANn-Hv2ylsV5N-rqoTXZjvTtmcw
Message-ID: <CAMRc=Md4pqhouCc0--Ew-cPDYp3wOj97=vfCPqELJjbqZCd5Ag@mail.gmail.com>
Subject: Re: [PATCH 01/14] regulator: dt-bindings: qcom,qca6390-pmu: describe
 PMUs on WCN39xx
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
> WCN3990 and other similar WiFi/BT chips incorporate a simple on-chip PMU
> (clearly described as such in the documentation). Extend DT schema
> covering other Qualcomm WiFi/BT chips to cover these devices too.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

