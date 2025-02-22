Return-Path: <linux-arm-msm+bounces-49008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDDDA40483
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 02:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9AE919C7370
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 01:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8085916D4E6;
	Sat, 22 Feb 2025 01:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T2M1WL+O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482A515853B
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Feb 2025 01:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740186422; cv=none; b=itQAhbTsqXAiBjNnYyxN7I6J1pLAfUFE83A6LCzweWbMbosVsmCyupbXIZtPVN7KAEFEcou4zKfH/y+iWt25KXEsG+uRfMwRR/tjs6wwGBagfhfoEmx6yChWqTv6CupeohMVXCXEPPIdNtQV8cDplVzO0iFXwqQcazrv2ezHWKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740186422; c=relaxed/simple;
	bh=oWNjA4iAb86TL9euhzKXI+ikt4IOF7STMLKlY2f/5Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEHTDN/FfhZ4Vb7gc4+ivhUHU9f7xKVcM2YPYi2KIpR8C/EOUclJOpR0MUNlDyswLLJHzoU7Orrnw51uaoNETkI64SVf0YOX2CX0P/jWNaDt8cHjaGRnFBGCsUJ6D8o24Kfo+AdSExEObpZ3P5CNeK52w3CDPU5eAC7fSrc8y30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T2M1WL+O; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5452efeb87aso2696372e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 17:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740186417; x=1740791217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SXPIaDT705xuetNhhFasT7VZfBwG839I1ETVy1U9JU0=;
        b=T2M1WL+OQCezs9X6uQsXyfVuar8bbfB7qZLDjwJVCs6wCdR0EMJXi8sZ2/8Yz2QUwO
         C3KLTupYXVyK5T0abivr+XyEFWP5DYgRTD41HVkYT7bHIm+d1vKGoa5smSrKSg9/ab4y
         VgrlwqxWy1pOqZhgdPiGqvAept+ngle5rYLR9GN5CDnnhdGHyPgC5D3PKogKoQiibpL4
         gs/+sjsntGsEfxewj3+6lXzh0u94TIGk92Qc9eAYmXemSf2j/hIpkZaWCav/tEUoBz28
         qezxudzzIutHPyiisII9hryeotOBL2XVn/CaH+jqWOR+AQa44nHMFAwDJZT9K5s3z+l3
         4tZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740186417; x=1740791217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXPIaDT705xuetNhhFasT7VZfBwG839I1ETVy1U9JU0=;
        b=a0wmweLdbT36Z8wMF2iJMOHPRwCN0OKVLU0sVgL+7lybcEpxHrE2hLLotMCIUs11p4
         lRW0tGsBRecQ+Qkm1v4dlyFxZ3hPtJxCW/ptUU94DBo+lAQRgwrmSCq8/U9Rhnq8+hfs
         YT58svr+FpxFkbs5Em/ZFbV8wk+ieOdyT95WCA/9utIOr3QUzPBqin69FSNfHwA5FTWZ
         zH0wT1TvZPkkZVhJqgM7sXtG4rx1ytGj8iUDnsZX/X+brKDDQFeSW5DB4g8Ut2a2hbMq
         zzqKZuFKOUH6KdEwrivFRvH4OwdQeEj1FLE7+baf6fUgNr88TP6yyDWmXhoKsa1Omww0
         VnKg==
X-Forwarded-Encrypted: i=1; AJvYcCWKkSThbY3MD7kGS1Q4rvbmdg9Ca5uyQ3Zp08tHKP1Wsf8XEB9Yb6jRE1q0n6Khd1mXNu4k15bKBW2C8rmW@vger.kernel.org
X-Gm-Message-State: AOJu0YzN2+ttQIdmjj/tOJDS5nsniNNJqYf78biB34En4cCjpVU7aG0n
	t2n+JE+nbWveI7l5dFcdGNBo4s86/VthTVfr5Mg03b3O5ZsqtB2aGcqwmd1W1v8=
X-Gm-Gg: ASbGnctzBk4gAKtBvRMASYh9DSHeSgAQ6bjfAiljE/ib1S/qYH5gA0UxKhMqMDlMcXT
	rP/Q+fClgWq7X52J/sryoXlnCdDNEk3gei5Jj1u0o1BZMQH43ywz8ILfevSR9v7NARwXKk9TGGR
	kcTU++nuTuV0VFkf2/FwJFbScIYuY+5HQ9GF2b/z0Z1A1LonJ2QT3ALU/WlGV1QBGEUcNWwFvcv
	xbpi3DdeHVPdypU5wY5VDSLR3T1eT/ooxNv6wBzJjDBFZV9U3eSB/3o4UoWWzLnTulIFF7fyqYZ
	WiPsxvlez+UdD5BcREdnoxb5kla4JBNDnbQgyEmvJRJmWLD3YN3fwdT2jcIdX4tX4btsEqae/RS
	ns4W0Hw==
X-Google-Smtp-Source: AGHT+IHi+ordHXE50By3g3XEuMDzRdPKjNWp+dXW81whZVyJYjc5ubTtNYsiZV1PtpJnAOhMKIvswQ==
X-Received: by 2002:a05:6512:3c87:b0:545:d54:2ec6 with SMTP id 2adb3069b0e04-54838ee2884mr1658130e87.2.1740186417340;
        Fri, 21 Feb 2025 17:06:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54527b7961dsm2518317e87.46.2025.02.21.17.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 17:06:55 -0800 (PST)
Date: Sat, 22 Feb 2025 03:06:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/6] Bluetooth: qca: add Qualcomm WCN3950 BT/WiFi chip
 support
Message-ID: <3s36j75eoqszm5hiftia543h2a6nxaa74wubrr6nq4akzq4hta@wyuwa5onjauz>
References: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-rb1-bt-v4-0-d810fc8c94a9@linaro.org>

On Fri, Feb 07, 2025 at 10:41:14PM +0200, Dmitry Baryshkov wrote:
> Qualcomm Robotics RB1 platform uses a new member of the WCN39xx family
> of BT/WiFi chips. Add support for this member of the family and enable
> it to be used on the RB1 board.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v4:
> - Added empty line before status property (Konrad)
> - Reword Bluetooth commit message to follow linux-firmware changes
>   (cmnv13t.bin and cmnv13s.bin were merged).
> - Link to v3: https://lore.kernel.org/r/20250202-rb1-bt-v3-0-6797a4467ced@linaro.org
> 
> Changes in v3:
> - Mention new firmware files.
> - Link to v2: https://lore.kernel.org/r/20250201-rb1-bt-v2-0-fd44011749bb@linaro.org
> 
> Changes in v2:
> - Corrected QUP interconnects (Konrad)
> - Added /delete-property/ interrupts and an empty line before status
>   (Konrad)
> - Enabled downloading of different NVMs as required for v1.3 of the chip.
> - Link to v1: https://lore.kernel.org/r/20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org
> 
> ---
> Dmitry Baryshkov (6):
>       dt-bindings: net: bluetooth: qualcomm: document WCN3950
>       Bluetooth: qca: simplify WCN399x NVM loading
>       Bluetooth: qca: add WCN3950 support

Gracious ping, these patches have been sent two weeks ago.

>       arm64: dts: qcom: qcm2290: fix (some) of QUP interconnects
>       arm64: dts: qcom: qcm2290: add UART3 device
>       arm64: dts: qcom: qrb2210-rb1: add Bluetooth support
> 
>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  2 +
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 31 +++++---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 83 ++++++++++++++++++++++
>  drivers/bluetooth/btqca.c                          | 27 +++++--
>  drivers/bluetooth/btqca.h                          |  4 ++
>  drivers/bluetooth/hci_qca.c                        | 25 +++++++
>  6 files changed, 157 insertions(+), 15 deletions(-)
> ---
> base-commit: a1d1e1f2fae5fcb5f2e43b81afa9596c606e683d
> change-id: 20250201-rb1-bt-cec7a314991d
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

