Return-Path: <linux-arm-msm+bounces-13539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4998740C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 20:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCD862866E6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 19:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C25140396;
	Wed,  6 Mar 2024 19:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z4bYcwU8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E673513E7DB
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 19:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709754636; cv=none; b=c9rd8qgQSBP4ll/g8SCjzOvd0PrjxtJnnytz7+imWphqBHMe7A32rArgrfM/5PtWtMJO9xA2Q1k8XW2Y4UJvezzhDkgtoriUgWaSN8L+9FuI2Lb8hwqYugL7rX9OO8gDXnEEZoiCR76C2WmzqZmF5BW1DUco3xpWbBMMD1/KDeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709754636; c=relaxed/simple;
	bh=J/J/WYR0a/jfL/L8CmcqoJd0/LkmdHVXKLnGZM35uAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRJ88g3J0UFw1wDEnMN/OiCr6Y3q0M3zuPK0BRVe7Ixzfj/EFIvUR7FTzVPiwYy5jY7/7bH824YzcORp0YFnmgi02pCyk+zuRMc2ny0H3jJm4juiXSnr9Fk+xGLFvIBJJaaUlL1ybS4YknZ5wgLdexgkae+zfgnYXHfIODHHdtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z4bYcwU8; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dd02fb9a31cso38427276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 11:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709754634; x=1710359434; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XYqVqYpwYt6rNIG76DtvSNsSsOOOlu66e5YGMr8JNM4=;
        b=Z4bYcwU86sOwtH6K6/+Sbkt+PgwbvwKMzcHZsWI7M6tYKURQr3oQ22WCNfWdb9j5B3
         4D+nwNP87Xs9lOHg1NXBCMf3sSj7PEXQxp31pPjS1IA5gHBSepO7qsYfJMSUUIxcNYQe
         TSltAQp6FD0E5zGO7MadSNwCCbqeDmuWUtLml8VN6agw89Oy7Lyi6sEfvwZ2NMF6BiZ6
         q9wh1YLySyhb1vYiUFXGmuyxFE98GxmOlAHXXHXoP/FVGKLedUsne+UHRP0qk0GQJy1y
         xxrXDCnpmK2wTWng74G9AidBXpwqpKti4O29edVXxDh4WdTveghboA4ugaMz21Tk6U+B
         dwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709754634; x=1710359434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYqVqYpwYt6rNIG76DtvSNsSsOOOlu66e5YGMr8JNM4=;
        b=u6UAy8GjgSmLgr42ELTdiZMhU44Dd4ti2BOQYFMPFpYCwYj4SFHP6GCQ2BKCWARIEO
         L08qjDdpYH4xwSs3IRIV4IRgSefSVSUI+SRKJyhPI4Bq/R4hw04Xm/VeomOlsFRkufbv
         6d+DQGwjc9Sa6w35WZ2lBh7hyJQ9N5bjwWB8Qel1ftLZW7JnXBuWzp4lR4ZoJu6GvLLT
         Hsj5gbmjAPdMBsV3tVebi/YYwkjIWkF/f6prLOknhvr9QfpzTFVkAz898dDFXtRKxNfS
         NNdT0Z19y56awqe6EyrrDiTRXsoKRw/EQXuVixTrTtewF/LOx0FfZpJ7w/0b0rs+OTa7
         3rVw==
X-Forwarded-Encrypted: i=1; AJvYcCU2NnUC7vxDZyaOvgQTI6V9c+Gc6k1P/0TuDKYLzm1k6NFav+ZqG8OXEPrQwHEVtDcbiHAYDxnowg4APMyk8/4l8esm91p2j+GDvi6ujw==
X-Gm-Message-State: AOJu0Yxuf8RAmZclj04ed4v3y8ZcmvTVTEzJ8j3fp3rY9l4vDcnZ6hDD
	JKBgTzG7PmRq8T5rUlSXbLJzHu+sR0lH1RKM5WQe2BsABcfYMnUULw8HNmdchnIo9LwG3L9yFd9
	VdmiLUAwKoFC+SWNvv5F8iovuLFQ7KDNU4KeWpg==
X-Google-Smtp-Source: AGHT+IFCY6UXVEeXo4Ge0RRKwR7IuVdrQnxEw4oe3yP+Y7OxURs32fyQY0uegRM9q9PXK/Gxa7fam/d+oeVVOvQQAJs=
X-Received: by 2002:a25:aea7:0:b0:dcf:477e:c82e with SMTP id
 b39-20020a25aea7000000b00dcf477ec82emr14974521ybj.50.1709754634018; Wed, 06
 Mar 2024 11:50:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306172710.59780-1-danila@jiaxyga.com> <20240306172710.59780-3-danila@jiaxyga.com>
In-Reply-To: <20240306172710.59780-3-danila@jiaxyga.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 21:50:23 +0200
Message-ID: <CAA8EJpo22Pk-6zPWEhVjD+HbYWbmsYNm-ZuurOQ2KVw4=0dC3Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: pm6150l: add Light Pulse Generator
 device node
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: pavel@ucw.cz, lee@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 19:49, Danila Tikhonov <danila@jiaxyga.com> wrote:
>
> Add device node defining LPG/PWM block on PM6150L PMIC chip.
>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  arch/arm64/boot/dts/qcom/pm6150l.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

