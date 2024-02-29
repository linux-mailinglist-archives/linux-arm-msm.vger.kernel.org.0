Return-Path: <linux-arm-msm+bounces-12930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DB186BE71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 02:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F9F01F24CF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 01:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465C036126;
	Thu, 29 Feb 2024 01:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jq8MHo2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F202E62C
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 01:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709171176; cv=none; b=PaSa6V7cYZgXIszhCQfAaQHYaLzW3jDlG7p1O+blTF4imbx2iggQglaneL7T1Ffu8VkA7bZAuI3apavWXfcZI2y2bO2Ym1i6ZDOzetloW1oGlD7eZgAbFkf6dbHngayUjL7zBz/VsnCHkVnXh/i6ZuDkHknsUCkHoX8znHmZ2pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709171176; c=relaxed/simple;
	bh=OWe4oUBOmApqxp6RuSwzBaqEjECsstdX9gvjE7NjtL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=De0Ukem6cBg/KP9ftDRE3CKBiXfGdHRPMV1gdBg8bx/D6YgGJOuYmjAxPPfbYxGF2Y/q+HFUdZAcz//6HiUfqwhWCW3x/W6i/n6U/WLqiB0RCNsefcUWgb4bbSp/7NDAc9iebnUcfNp4OsWmgPR7el+2aIYSO7ppHFbmo4fTycI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jq8MHo2b; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a28a6cef709so59985266b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 17:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709171170; x=1709775970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4l+dEcSZUPzIQHrYPeg5QRKPOIlq4y/RNg3JOxmjZQ=;
        b=Jq8MHo2bF5AJswsSKYzCbY+qPx0+zajkQBpaZBx2SfGPavR7CVCgmfOgJqRANNoAQ7
         bDaIRf2GzsvW2YwBirbrZ//GC47rC0o2hXsyZZlG18PUdNN1upT0FaavqGhpVErZpCnk
         yYFL9Q/7JMF+xNOVsftiSkw8ku7791ifQPYBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709171170; x=1709775970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4l+dEcSZUPzIQHrYPeg5QRKPOIlq4y/RNg3JOxmjZQ=;
        b=ICVXqajRLdXisjmpfo+g5nkYnPCr8kYG/FRA3tYtV4qf7c2lwa+Eb+vllM7mhsDh97
         DB8hml5UGQgm9Zpo4bqxUnGgQImOHh3tdbbkxYKeWW2PXK9LwVx2bou8J/YhtvWRVTMn
         e51Uv9IkZwsk7Xx/wdzn8ipLk1cNnFy3xSUFFM21uUDLMWqGQ6c76MYvjIgu3nkJh/3x
         lDEPn0Um7lDQM6gZGjlPzfj/hn2ClqI9OmD9tISLoDL/aqIVSth0r7Q9XupaTnr3zixh
         Wp69yyx6qo8ahtz+R6tKdOhZ9N0spQ0y6v1bKj3qsOxGKVzefSYkA86/1nZ1VJjkXuA3
         W5nw==
X-Forwarded-Encrypted: i=1; AJvYcCWtzG3tvMW51GE53+apzzaanB2Mvv95joza18+nkII/lcQnMcdXNO54YpeNo9AgRC8NbF5vFgNRxDoqke0I7KytoXGKgPW2YeRP+cG3Og==
X-Gm-Message-State: AOJu0YyiR4kjMo8ooWxmgwBlEfg63kYWt5gEZ4vNN5r4zRGU967dl0Xi
	4pCPrA6JNMPX+5RpXPIHRjbdo1dvoGe8ZIpTrGGQdEgjrACjeZRRHD+7vTVcRCbqtCRlVkGNFOJ
	vIwnq
X-Google-Smtp-Source: AGHT+IHpghBUI3RKxSt29cLAzc3JfL7RTwSUE+PNCvkmJEVxphM6mIyAaFr+v21kXOgu4jJ2ssPoOw==
X-Received: by 2002:a17:906:f6d2:b0:a44:415d:fa3b with SMTP id jo18-20020a170906f6d200b00a44415dfa3bmr178073ejb.6.1709171170630;
        Wed, 28 Feb 2024 17:46:10 -0800 (PST)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id l26-20020a1709065a9a00b00a3db46018a4sm135046ejq.71.2024.02.28.17.46.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 17:46:10 -0800 (PST)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4129a5f7b54so19635e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 17:46:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVH8XlZLZ+xUMJhlZuMLcpwjcdmtU3wXXfNNlHVAKAIwJ9RdKjX7v6mgM6FRrIaAJJ7WID5whK4kHJwDlAzjbdG9DtKvq77fgfnnjThdg==
X-Received: by 2002:a05:600c:1d98:b0:412:bb83:bc7c with SMTP id
 p24-20020a05600c1d9800b00412bb83bc7cmr14062wms.7.1709171169334; Wed, 28 Feb
 2024 17:46:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240229012828.438020-1-swboyd@chromium.org>
In-Reply-To: <20240229012828.438020-1-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 17:45:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wy9pPqFGhU3MGoNXFVrCpyy8Yk=FTNa2MV-DTVLWQdUQ@mail.gmail.com>
Message-ID: <CAD=FV=Wy9pPqFGhU3MGoNXFVrCpyy8Yk=FTNa2MV-DTVLWQdUQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Disable pmic pinctrl node on Trogdor
To: Stephen Boyd <swboyd@chromium.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, cros-qcom-dts-watchers@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 28, 2024 at 5:28=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> We don't use this pmic pinctrl node on any Trogdor devices. The
> AP_SUSPEND pin is here, but this pinctrl device isn't a supplier to
> anything in the devicetrees that include this file. Disable this device
> node in the DTS so that we don't waste time or memory on this device.
>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

