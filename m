Return-Path: <linux-arm-msm+bounces-13436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 425F187308E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 09:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F267A281754
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 08:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4C45D72D;
	Wed,  6 Mar 2024 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tde68+9o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6535CDFF
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709713225; cv=none; b=kwmxtviGqWxeuUUFCBRahF/LBC8y1XUJhgm/pOHHRk3hmgZZbZWYsWYX7V5L3WCRCioq0wy9BhBkOkJORgb+I3FgMNSRPpSX7QR2ZqX5NFCcBrinRLMNQk6KBti4LuRl2uBd52qdF+9oTESxME7oTM6gbyQrWz+ncBS8dEU9iYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709713225; c=relaxed/simple;
	bh=KTDdaS8pSZ7S0Ht19FItkyULUTjJ5smibVaca3J25K8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZcSSZCcJwF6dnlnmzBZ7u9PkIh8TXcomfYS+c74uqRBc6eMtLaGrcgIWkYN+N4IQlCgilu5md8VG3qr6gPxWP/vS8a82co0n/cERrYsHp8/AM3eFHUJds9ZTjgwchEXZnSCX2QgVOB4JksaVJszya3PwH5tDdEv7l5w/GFiMNC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tde68+9o; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc74435c428so7231851276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 00:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709713222; x=1710318022; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yEWYz4fTnrwGdwxrJSxUI6WQLItdsaHDpjBckmCjGBo=;
        b=tde68+9opuhIpNESgV9JR6CIHmR9Q5DxzeGIr3OLv70vUifj60N03baL6rd5Gy/dI1
         G2Gci1+52t4ASyDJVTGbaBnWe8Db936k9cZBRQUDyHEuA+PTmywNeellsWp9ORYW0v9H
         zd1YDmis8FeR5bFtkxb4SBHWZSLLzjuyhVN62ypqLzL3u4A9W/VngXa8w52LD4ICLgO/
         /8yWrDZC/Ma1wGeiwJofnetjwAP8/CgIF3riltJ4TIb0KWRA6Ufrc42X4/MZoGVOA3w2
         6z3O5Hnpx5ciPxJBmyNHwnQ3OSBpNTVs4EP50lSSP8PGANuD1t0dU94hpKppSR0VVbZE
         NEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713222; x=1710318022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEWYz4fTnrwGdwxrJSxUI6WQLItdsaHDpjBckmCjGBo=;
        b=TmNIm7U7AoJnZG+EP95lFtmdfJXWB331uK/QIXTulaLKutDUiO0PU9Z5XHCwIIlNPa
         9wX1XMo56tS7osqFha3ylLltALUJPqdQWdZJcboXmuB82XC4teB9xQ3SYdRhZljJmvuR
         ROMT6Ou/G8XCfQSYs3dlDJSaZtIw7Mqrk+vuBzqezNSWPuEP57vMmgYFeXaHIa734hFI
         aecNalywu4tXUFIa2ypCGLUwveZZCGeAQDXxRH5baRzcckmfEbPN9q6Caxdxe32kVm/7
         +fGoAwL4n6/j1m4v4lMPLDiziU87wK4sQxM+VuQTea5JA7xrfjlUiSnOtL+np095mZpp
         Mufw==
X-Forwarded-Encrypted: i=1; AJvYcCXlhKb5mx/I8rBOYr4BdqLJxS3BRPZID+Qj3oZB9yIyNZvTPMoI3a+lDqBhDNcNTRDAB2s5AqfXoyETaL85A9PcKlDHIlTW6yezaxEqcg==
X-Gm-Message-State: AOJu0YyK4E6Pdl5H3XI/dNwhCfKuwbiRNZQe2oDYZMX7fECKRdAir/lV
	mBM4q+joDVETFJFeChmzlY1Ze6qCzoK4xd9HhdYee2kvi5c4JQxWFKHYp0Gp78YXEpqSH2sfqzS
	0NvyvA0UEDUXxLY828NwSU5zGT0a62FWUPDqcDg==
X-Google-Smtp-Source: AGHT+IHqaAUVnMg7KxPdK8tkDPA3uORN9IoePxYNCC3cqO9e5WJNI2KZdPGog1tQCvSwi7LWQ6nGEb52GA0R7WzgoEw=
X-Received: by 2002:a05:6902:2513:b0:dc7:8c3a:4e42 with SMTP id
 dt19-20020a056902251300b00dc78c3a4e42mr14807411ybb.30.1709713222025; Wed, 06
 Mar 2024 00:20:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306-castor-changes-v1-0-2286eaf85fff@z3ntu.xyz> <20240306-castor-changes-v1-2-2286eaf85fff@z3ntu.xyz>
In-Reply-To: <20240306-castor-changes-v1-2-2286eaf85fff@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 10:20:10 +0200
Message-ID: <CAA8EJpoYmdfB30byfAW3ngUTw_11-uD+emfdFevVd7kqqFWt6Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] ARM: dts: qcom: msm8974pro-castor: Add mmc aliases
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 01:26, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Add the mmc0 & mmc1 aliases to make sure internal storage always becomes
> /dev/mmcblk0 and SD card becomes /dev/mmcblk1
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

