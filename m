Return-Path: <linux-arm-msm+bounces-75006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22623B9E020
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D16EB425B36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4206825D533;
	Thu, 25 Sep 2025 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtnHNsMa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4812472A5
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758788142; cv=none; b=qvPZwiKgnwhEPeM1M3ki8/ykQTWGrBzdqkRSrYWMh7/CYg7Hs0JK8gS/VfaC/Y6KiI1MdlnjYcB5id4tHuhzlCVY5VontVc20DzHO7NDGBGBoJET0Z7ST6AUhlerDJEaaPJE2kuaQlSO3bFVN4yI0uNmnVfdvxePyBUHud3ndUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758788142; c=relaxed/simple;
	bh=qB8EIC76yynZpPD+iGD9bbKGgHlzdHHdxyQDmgQ8+Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxietRnRTEfeAAVac3vOi+LRDZjxfkwmh3PzXkINk4/pWrKrCa7rBb7iPxE6Cd9X+jNzRQ8nW9jFJyQae/Zw9hNphULyMt7XuBV+Fze2kgqUQDWSu0S02BhjcLrzKd/wo6s5Ob5T2R4k3YVUsZe6ODSqOevmhNCWj05pZL9O2b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtnHNsMa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE969C4CEF0
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 08:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758788141;
	bh=qB8EIC76yynZpPD+iGD9bbKGgHlzdHHdxyQDmgQ8+Vs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DtnHNsMaE7uCn28r1UzIgxn0U9D+C4hKS9BNQLt9yA1q7Ckjf9lSDNRyzzlwyW/rC
	 vlH3YxX3f7azc3uZvEoGGYfzIljOA+mifgRNtTb3Eijbhnqg/OPEHsOEzRtZpK4U39
	 6t4QrtW4N2tMahJf2QrOgnQszh7jaEw3AqrQ8/mhaNK2Zaj9ZCqMN8PAinihe2BjBw
	 9BgXyBJ+WSwyTXVzjEKMeHgj/ENUcFJEQCAWTX4DTo9ttkAC8bp1/W3/Dd3g0EzGRS
	 WfSozU0o6SWK2AjiTPf3FM+iyYY+d3hI4IfEyNd5w//lCkAaIaPbViofEkr2jQwPP0
	 XDdvaOQkzvDvw==
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b5506b28c98so492310a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 01:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWM2HaMePQQLZ2m/c4WvA/oOm+b2vtk/XfbHSp4wnvo2tY2+0H0JmjMu8fIHs6tp7mXGdy5grpPMFxfGkpv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyn5Ka9mNBupqBTkYTNWYfmDkcLDQna6ERWAB6Mjl9cCUyFjNL
	RzZh5K2rOOdPr/SQv4z14esH9L/L78KBiPhZf7hRkzcFfJ3weU/j7AI4aeZdOdPIb/zyFUw/6Pk
	2tJxOgY1WlvEmT5LDWrfid3rG1QLQbsg=
X-Google-Smtp-Source: AGHT+IHqxVAHinq0YrMehvWQ428cTGqfBLIl0Edkiu2K2M2r5uXXog1vXHjMI0KYr4aTJmxM5jgk/D8Qg/P/2Fw/mX0=
X-Received: by 2002:a17:902:d2c1:b0:269:96db:94f with SMTP id
 d9443c01a7336-27ed4ac8880mr34085195ad.49.1758788141423; Thu, 25 Sep 2025
 01:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 25 Sep 2025 17:15:28 +0900
X-Gmail-Original-Message-ID: <CAJKOXPdQ0-Bj6xgx4-5BCJphsPymbHrU4kvKTWH7_LZ0KmstJw@mail.gmail.com>
X-Gm-Features: AS18NWDhswpMf7dmCE23QXJxJ_GfpyxVAxVZaGkE-Pa_B_DcqFi9c40yGifXS_8
Message-ID: <CAJKOXPdQ0-Bj6xgx4-5BCJphsPymbHrU4kvKTWH7_LZ0KmstJw@mail.gmail.com>
Subject: Re: [PATCH 19/24] arm64: dts: qcom: glymur: Add support for PCIe5
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>, 
	Qiang Yu <qiang.yu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
<pankaj.patil@oss.qualcomm.com> wrote:
>
> From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
>
> Describe PCIe5 controller and PHY. Also add required system resources like
> regulators, clocks, interrupts and registers configuration for PCIe5.
>
> Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 208 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 207 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index e6e001485747785fd29c606773cba7793bbd2a5c..17a07d33b9396dba00e61a3b4260fa1a535600f2 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -951,7 +951,7 @@ gcc: clock-controller@100000 {
>                                  <0>,
>                                  <0>,
>                                  <0>,
> -                                <0>;
> +                                <&pcie5_phy>;

No, you just added this line.

Don't add wrong code just to fix it immediately. Qualcomm received
such comment multiple times from me already.

Best regards,
Krzysztof

