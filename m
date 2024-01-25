Return-Path: <linux-arm-msm+bounces-8264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B99C783C398
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 14:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 716C7291E3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 13:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7A55025B;
	Thu, 25 Jan 2024 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c6tC7PP7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F102632189
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706189175; cv=none; b=TcRpRLerBxuXUHlITpykiv9d/vfqetmC1JESc29kOXIMhl2qQcxFYrm0y/C/vgxBwjTzOX5tvNOMhqwDyLIOKjntlo635j5DswaKkVg7C5e1L5nKg7ZIGZcn0TvRK+fTC2bKsVP54rlVi9OEsoIH3tupokKfPmYQ/JFwJC+F0jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706189175; c=relaxed/simple;
	bh=OdEnES3N2mwllexWqQO9ngtOXv9U9R5XkdDBtoztrUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KC3IeZZbTAUOpwtBJlkVX0jUmbX9eWW7QxrWXyLLeNNvAgF1LOtbvKG6x+QcRn+5LEsB1OCxNqoSaziuPomHdiE2ixSVRLNIUVo2dLw3djBL6ajvfjm7c8Y6PmdLGCLs5x93tTqilOqmVZKL9Z+YVpuRON5uF9NCPwdr+6hsH1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c6tC7PP7; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-db3a09e96daso5914621276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 05:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706189172; x=1706793972; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qD1ZKWE0B9mPlYYZai7EguRVWmOqxII0xx7XOFkWAvA=;
        b=c6tC7PP70AgRMIeyqpLR7YYjfpVeryL4Kngj2RozYNUgX/e4q61Jn6wVHXf1HK7jUr
         LaZrhlZYlQsCg5r9mLCkZuBeQLIB2VYOyeCGl5luonGMeRI5z/JfdcDiGF7Ty6rKl/Tu
         nze57boxpe1RBq8yBjPcFxxXV+l7BVM6zy0/kp62KN3v8W/X4FN7OVQw3vY3sTmI5u8S
         cZ0zdzel5eCqoAVu2XTl2FXZ0AmAKsB6uRZmld7YpZ36OYo5U2x0Rj/HoFL9uwvVhVLL
         3derQGcx5NF9hi0fvgAxWh8RBqKbGgrDl/zXXp8H8HQt03+WMQTeJF8j8ZibHQkx1xKW
         kWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706189172; x=1706793972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qD1ZKWE0B9mPlYYZai7EguRVWmOqxII0xx7XOFkWAvA=;
        b=nXVsd+YhBDqC69RtOk7wY3+idcfwwiD0hMRFDPOLp1XO/qdMH6skshyRrgTFVQaFc3
         KbWa9lTXrmeaKa9IIGq66H9m61tgpY27SwAWwMXmIUOEr1LItnGO9KUJ4+drKcN2UMkQ
         UgjyjDjoSRBgzHehZjAzXwmqIGv0B756RYXIfEbT5Zl7eXXni5MgB4m9oWL8LWZ4xf07
         l9nUCsi2r4eIF3s4KUYYYY5cUrE0h6E8rLfjRkQ2VtiHGcIX7/89SNdPtKIVF/9IV3VV
         vg0hNPUvdwSKSb5EbuxE0RgvxuVwEKoOrFOZcK1Pkd1Pjg/s19FkBxXoYyDy42YZudqH
         XyLg==
X-Gm-Message-State: AOJu0YzmVfqdyjsurq9q1/apH8wlvJAcqjDFQwvVbA27QvOfPHd4MLKR
	P/Kq/XjkL6vIyu3cYcrx5P5gAhH17ufWhVOVKFTglzEJ1Z98tZb40I8IIkdqYsBunCziS0grfqr
	+tfS92iGFuL44q2iCBTlC82qSsQJOEMSNpqhp3CRpcJE31HarnEw=
X-Google-Smtp-Source: AGHT+IFe89d6zyjO+YVRArNJDGtlX2xvQWPn8+Np5QJNilc4XliEI6Sh9RXsgvzDuDIT6vKU4P54YP3WHrkAxW9tJO4=
X-Received: by 2002:a5b:f41:0:b0:dbd:b105:3a49 with SMTP id
 y1-20020a5b0f41000000b00dbdb1053a49mr643374ybr.91.1706189171975; Thu, 25 Jan
 2024 05:26:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org> <20240125130626.390850-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240125130626.390850-5-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Jan 2024 15:26:01 +0200
Message-ID: <CAA8EJpouB7MevdAagJe6QH_D2NRxBZ-88PFYpZF5fieapoRdJQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8550: describe all PCI MSI interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 15:08, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Each group of MSI interrupts is mapped to the separate host interrupt.
> Describe each of interrupts in the device tree for PCIe hosts.  Only
> boot tested on hardware.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

