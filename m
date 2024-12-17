Return-Path: <linux-arm-msm+bounces-42516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA949F4944
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F24A16D40F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 10:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D7215DBAB;
	Tue, 17 Dec 2024 10:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CEy63q2G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E51B1E0087
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 10:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734432830; cv=none; b=Py27UXoQNKQpUOjJQeJ0HR6FuF6NZr24FAHzX8S+rPtczK4IGXP4/mdsJV70diQFZpFG5Ouk1iKBLVRXqfHHGSfgkc4XfFnEsmKE94fcVZGoR7b77rA5854h+SHiRip7SgsjwkwtVEUEAfsZMQp4utT/UW0peK5X7rMrucD1mVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734432830; c=relaxed/simple;
	bh=sn/GJ4+g44OhE9Mc8Vrz5T6j/3vd76+SDLofs3xOB4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnwQQ2+vbZhVQn7c8jMlU7lPgpOj9XFkZ0EJfNZ5sgh+6n7724gVaQ1O01voxyPVFHacmhGiiiA2YVjPLaPoi0YyP1MmCK1MxKbc1QSOuHJmonR1GnPuwSti0bjB774KExV9zL4WygnHQeX5FOIYR5LOcbktAQv5T95Ay7071Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CEy63q2G; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401c68b89eso5591525e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 02:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734432826; x=1735037626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TC5jCVTWg7lej2YzYw5kT82WMr/4h0gli5MbAUjaM8=;
        b=CEy63q2G4ruYlwFglV5g0nsvR0DrhO2Q3RusQmORCfhjo/GKsXfuSg14deeNToGFOz
         fEUWaKadMYdOH74OmUALYS2QWHOmRXZZBFnqSnnjTlk7QNx4xOWLDG1y3egQ0st8OV1o
         OIfQv7JUlfcNDYJxzBR0oWQAz8/NgPs6wuF6868Fko4J4fOvuUCuUy3t/OwkFNX0IYj7
         3K/xOr1nzdYN62mRXXEUkPRcm4ObRa6rbSaesn3SX03YO6lJYCqPoqiMMUZIIY76Tut7
         yH3Nd2maMvAd9r/XsUN+ZUt3HltIJLSwsGI05/INlFMPoTltU+cOq0/v+rNNDHTVLwrU
         ypxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734432826; x=1735037626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TC5jCVTWg7lej2YzYw5kT82WMr/4h0gli5MbAUjaM8=;
        b=wvWWH+oBDlCX0tGUjNq/Ds3+kXqlcUXw+PZ4XIaBAcOCGBBiYL+SDiN2GjZH0OWppn
         GXgyBqQLGCdIcTVqybaPvZfCUQ8Hl1OpsFo9A4dPKawHpMPj+p9U2gxkAVBK2zFnCe6g
         vV+NRHLRd6+j/staMPEgHUoQmDtbog9N6nOFEgQZT6UC/dVvzi6Du9ZjSm4OSdmQhY4X
         vd8M7zwzg5VIlFq2EQuYm+YKAN+bOYSHvzcdTbqzgn/rekpqeJd9r1KvNeqEsvK1gMxA
         Snis7dVie4FTqGGOu1Yq5jeqU21SjbBSwNBN0jrkCJ4bHVo4wbTozP2TZELv0jVnlGYE
         cBww==
X-Forwarded-Encrypted: i=1; AJvYcCUrVRFgI5sMg9l2izobsI2jZ8OP5mGD0Vvj59g/yVmJ86izYW4tPaICcpYuratNFbtfIfr5vE0oGYVk/bHb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1RA3/W0SxDVh++jOE21MgPK/XPPV2Rkuc5247sf155Ng4a6yp
	G0WsQ5NidimizDRKv6abhKsCSxSbH0EgXURA2Sag2ELl2MnIwOu+Pctku/W4pbwmr6VBAI0Rt6p
	ar1ak76LrqBEx4LpZjLHCuqYwmhHtuSkqGAiK9g==
X-Gm-Gg: ASbGncs1UMnER18XSovK/spS2fQH2LD9c9fPs/XwOfa4ukzuqiH+GGnCbhZqHI8HBU4
	fAIoyPnbFA19Q9MAxoJWaB2cNjCfFghQcFEu3uA==
X-Google-Smtp-Source: AGHT+IFCphVocPAZunWIma8kPi4+wa7YjuJsfjmpYKp21Qxrzj+4sr7LDLYc8cAc2pcpQ3Dk/5SYwN1smESPCaOVYA0=
X-Received: by 2002:a05:6512:3094:b0:541:1c5f:bf86 with SMTP id
 2adb3069b0e04-5413158b015mr867723e87.18.1734432826342; Tue, 17 Dec 2024
 02:53:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217091308.3253897-1-quic_mmanikan@quicinc.com>
In-Reply-To: <20241217091308.3253897-1-quic_mmanikan@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 11:53:35 +0100
Message-ID: <CACRpkdZimr26=3hndy58OkxgVxDZ2990h_xRHwMweJykfhT=4A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Add SPI0 support for IPQ5424
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, konradybcio@kernel.org, quic_srichara@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 10:13=E2=80=AFAM Manikanta Mylavarapu
<quic_mmanikan@quicinc.com> wrote:

> Add an SPI0 node to the IPQ5424 device tree and update the relevant
> bindings, GPIO pin mappings accordingly.
(...)
>   dt-bindings: pinctrl: qcom: update spi0 function
>   pinctrl: qcom: ipq5424: split spi0 pin group

These two applied to the pin control tree!

>   arm64: dts: qcom: ipq5424: add spi0 node
>   arm64: dts: qcom: ipq5424: configure spi0 node for rdp466

Please funnel these through the SoC tree!

Yours,
Linus Walleij

