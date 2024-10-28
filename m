Return-Path: <linux-arm-msm+bounces-36135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 091789B2BC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 10:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AE241C21570
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 09:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF301CC8A4;
	Mon, 28 Oct 2024 09:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zRMt8avn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3662B1CC16C
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 09:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730108717; cv=none; b=aUjyf6wGlymgNQI/N7seLQnXqrMswgO/GDJYwq3MLu/dFf46GaY5MlS9FzWYvqPEsXE3CIOlzdsUqJY6MQ7YCFg5c1FKLzVWw0364eaeXklptA02+oPSPUahIs0jXquaEjG9AJ4Fh68dZz4kh4VCtstvEleoM0YoF00H5CPQHak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730108717; c=relaxed/simple;
	bh=3MJitMTYQvzBLNF9sMRy5XkzlRGBVvd92VB0tZf9Aw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQg2jYQdFbbtRUmtsp9939B4mRiuDPayLBD5XZG3RQ3m3TqdVJvStIXPTG7+dhFp2Q043zSMzPSEJsFDaN0M1z0hAPJ2tpOTYoh8+PTT5xxuaw3QS11kEr/FG9QhOY1KSbIzReXzXFn1XyW5qKJERPmgNSw0yi3sBBjpSco6gAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zRMt8avn; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e2e41bd08bso47426797b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 02:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730108714; x=1730713514; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g4purl6VOxzkEsnc4oRLBmu6SBR+DzFv4k58o2DEGGI=;
        b=zRMt8avnb3pPMZhOuT5RY4Ap367apS++2d2UVA7sFbqOv7DD4QYPwV67zV0z7+WVGB
         Qv3yOuwUWWWTXxHjvo05ro0i4JCOSt4QItW3t7zYg6cHZeDQtJYlu+EGa90Uus0SwZ0l
         Ek40bCkHVj1JqywsNXj9JcQmPTC3bVSV5DhS9A/rjdmeQXutd8M8UzPfW9xnhRX9u++Q
         DPvpCnm+kv7Yx6O5verteaA4LaUl4zI68gleBPBXhYYZgW+nYBFwSzKKmjTu4uvBm5Nt
         vWHo/KxMO5DHCQBmr5Bj72vochCEbp1XPY3bhluzZs80dnkw1pr0z1HG6JkOmUlwINGd
         9Ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730108714; x=1730713514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4purl6VOxzkEsnc4oRLBmu6SBR+DzFv4k58o2DEGGI=;
        b=WaJMhIgZV2cdk2Eu8WuwLoUGdB06l4FrKmmKT2xCKZCL73S9AMqPP18MJx1c+oo/Hm
         kZ/GqVUWaUfwYVWLPPItzUYZxnTwKdlfvUl4homOiYsSI/BOUygiyTMTJxv1EFdCXTno
         EXCt5UmM0m5B68rWKchAegM4dNDXdKNGdGKBFZ51HwMuvh1gvnS25YA1dTGshlGdGzHK
         L0eLs7ZkwJ4Xuf8lQ/D2aZ/qxIO94ZVuJqsbSkscX7RYdD3IlIwaX+5jjzaQLNDT0zlc
         +BRVW2Nfb1WA1s0xhCbmrKm7IW8R2Hwa61zId/uWvjyvDpwLy7hNXu/odGrr+YYHCiEh
         RdEg==
X-Forwarded-Encrypted: i=1; AJvYcCV8ANixI3EjQf3Qu4VIVxM0ZFSm1yDRcfnyxnmzYC61N0Nc1zPowwoDj/HH76f7q2URZDS8xsE9CMLBuvSG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy20OLhQwYM8jNY8HkSemdZ0bum5dr40sk2Dv/WqkIy2f9HWclt
	A+9LGxhDMIvCG3Uh0jrvPxHQuMMvQs8fIjWEiZLLCGjysqmPIPan8aXw+yBnaExn3PsZ1lvKzSM
	lE8xDesHouG9XxoSZ5A98T+cVK149zNDqbNcUIQ6Q6iVmJKm5
X-Google-Smtp-Source: AGHT+IEupfDCefy6TjFI+paigzl6D9rWDxC4Jk80B80GSsgHE9+Lq4uZCFPuhfxvwFw1FlZEne+hFMVgPQDcMc6ZhUk=
X-Received: by 2002:a05:690c:45c4:b0:6b1:735c:a2fc with SMTP id
 00721157ae682-6e9d8aa93a3mr66763297b3.27.1730108714055; Mon, 28 Oct 2024
 02:45:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008112516.17702-1-quic_mukhopad@quicinc.com>
 <20241008112516.17702-3-quic_mukhopad@quicinc.com> <zluuezrywecffsh3f7yzrtvd2sa3nyzl52sk6bluvjch5icvuu@noecozosseko>
 <e7543055-316e-447e-ab0e-15d2fdd19dca@quicinc.com>
In-Reply-To: <e7543055-316e-447e-ab0e-15d2fdd19dca@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Oct 2024 11:45:03 +0200
Message-ID: <CAA8EJpqcnxbZAUJm0fdbQNjZ3Dw189oDMkC+0pMLz1XGO7HhnQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p-ride: Enable Display Port
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_riteshk@quicinc.com, quic_vproddut@quicinc.com, 
	quic_abhinavk@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Oct 2024 at 10:49, Soutrik Mukhopadhyay
<quic_mukhopad@quicinc.com> wrote:
>
>
> On 10/8/2024 5:46 PM, Dmitry Baryshkov wrote:
> > On Tue, Oct 08, 2024 at 04:55:16PM GMT, Soutrik Mukhopadhyay wrote:
> >> Enable DPTX0 and DPTX1 along with their corresponding PHYs for
> >> sa8775p-ride platform.
> > What is connected to those DP lanes? If they are routed directly to the
> > DisplayPort connectors, please add corresponding devices (see
> > dp-connector).
>
>
> We are defining the functionality of gpio101 and gpio102 as "edp0_hot"
> and "edp1_hot"
>
> respectively. This ensures that the hot plug will be directly routed via
> the display interrupt
>
> line "mdss0" to the display port driver and no external dependencies on
> dp-connector is
>
> necessary.

Please describe the hardware, not the driver necessities.
If the board has a DP connector, please add the node. E.g. it allows
one to specify the label and the type used by the connector.

Also could you please fix your email client so that you don't have
strange/unnecessary line wraps and empty lines?

-- 
With best wishes
Dmitry

