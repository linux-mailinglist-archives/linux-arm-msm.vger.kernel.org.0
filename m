Return-Path: <linux-arm-msm+bounces-61562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABABAADC631
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 967D43A5737
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A21B292B29;
	Tue, 17 Jun 2025 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j4sK07r3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2D52147E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152252; cv=none; b=YEqAQs9pKdaGcB3mtof1cJJoQLNoU59MFfj7wRuxddmanyAXBVggx3qD4FznIoEyeVhOYo4p44YKFg8m81c9VVlLCb+CMafEvRmt3Lcekvi+cSwjenmgqUJg+sGib2R2pmPM0+ed6kns3/JcwDPOti1J44GuedCzblqf8F5BNS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152252; c=relaxed/simple;
	bh=0FVH0nf1hFWs5snO5t/bUXQFon9Yjbecd6o+YdwqYHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0gakwZ/ia8O6DIRztRC7rMVZScq9bP5DvXZ7V0G9/rcoyv2eVwWTJtFPnNhl89uXpS4KlcyrIW+FSkagYMvrPNEGw8q7HdyKg1K0llf6pgzK1GevHRlPLiYEb1I0uFFAOL6KE+7LwxGgRFhbb+6hDdMStnJAhdCxOYiKfzfEpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j4sK07r3; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so1386567a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 02:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750152249; x=1750757049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qmCi5AjNmyApPkeggD1UBIutb08W79XxmIwYywNdyI=;
        b=j4sK07r3C3B34LEq1JlcgfnUK/UE/dCLXuO4dz8YQQJGIno2LQys94N5/ZyMTCAFOh
         MGcyy2PEMp8eBZjP0jJMMQ7Ij3t/OnoPzEWbh6/Mactd2fke2/MYh5e80Bud7d1yBJMf
         /zpP8SbMEIEdZnfEz0+XyiSSsqLhK2f6FmOLhS0P20EY9hVBFW15w7z3gn8N+ScU0N3T
         L0d9Tv6ZDkNjXSz6pY7nUFgRItZiDVe9Ua9MfiE9Bh2LeV9OBUjRUrebINV3KPPLNE/9
         I+IENTwKfwK38QsrUHY+lM8foI9HuT2WUk5YufntXLPKd1TtHZxuZtc/7BbZg1wY2Uu9
         S+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152249; x=1750757049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qmCi5AjNmyApPkeggD1UBIutb08W79XxmIwYywNdyI=;
        b=lzdrURyQlspbVsvjidPrVTerDpne9qeBEq92JfEetMZIzJBMgN0sHGNF4cShb+sxkC
         4Sg8eAZIDEMPhEcswnvMT6HrEC433HSC0Q3LSCX9BfuRw+rpasBUGdH55nFcRsLNTd3r
         vH23DSWfDZEqmzda33G4wx1SBfpllZ5raXzdvNS3ElQW6T4YuDvnZSr8KrVpPfwxs9AR
         4+U+EUzWNEdxqN5ghFysTtVlpCNlC0R8sC6r7sLFXA4eu6lq18IKZ06Okik+qd9jEKIF
         sYyvaSkpyKP9iVy1rWPKRvsbYBrm1qllC7/N718asaFGdHEcaeFD80tDaPUp4Bw/zbaf
         f5bA==
X-Forwarded-Encrypted: i=1; AJvYcCUbfVRxMlsLKwVjuZIEsdghR6zrHhPyP0cpEFB+cMZT69zFqR6y8nmB9NIL1qVpJmQzxp/FD5twwROnIGZI@vger.kernel.org
X-Gm-Message-State: AOJu0YxhsxxxFpspl5RrYUV9Qc+b0iPO2bnMnejnpoHRgMjJfqoccEpX
	drfciLl2MDmAtBoOFnL8WcZQCROsug0qdGZDSpS8N92RO7bjYmj8RX+J2eH+XNDkKqw=
X-Gm-Gg: ASbGncvwVTo8l55H1XEvRW0pxRxyiqWxIA4VzDOSocJCqMtx6z6nyVz2ZH2Vl5891yw
	Fb31O/tgMaGkEBUhsM2H3tGD0xUzxe3Y3xmwAbPytwbYH4pBu8tYydR+XRh9ymbsqRjdhwHzFUH
	krbX32ZUzFLwpe58fkTO3kgVXtixK5OI3VrWyZvNuWrH9HAUBB31N3KKIIUqzltqEncEaOOqePS
	LvYnTxZ5khz0tPpmapgimvwmtULEBwq0Nao56DVpDDnOI0YwcNI2ll4l30aavFbWYf9bIKZDKl7
	00Ak2YKT3SyigXl5YAssxr7us3ELIPdGy/zYsmJHknSrJ6lYdKgwRaWLNaQ=
X-Google-Smtp-Source: AGHT+IEnQHxM84ovHQi50egnS9UEgVOz9GmXYcPlKnLN4jCfbnYv7EbdDH2huGe6x+oNGIph9jx7kw==
X-Received: by 2002:a05:6402:34ce:b0:600:129:444e with SMTP id 4fb4d7f45d1cf-608ce49deb8mr11863903a12.4.1750152248723;
        Tue, 17 Jun 2025 02:24:08 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5b6a5sm7931639a12.40.2025.06.17.02.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:24:08 -0700 (PDT)
Date: Tue, 17 Jun 2025 12:24:06 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: Don't
 zero-out registers
Message-ID: <aFE0Nu8CKFBlCCrd@linaro.org>
References: <20250617-eusb2-repeater-tuning-v2-0-ed6c484f18ee@fairphone.com>
 <20250617-eusb2-repeater-tuning-v2-2-ed6c484f18ee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617-eusb2-repeater-tuning-v2-2-ed6c484f18ee@fairphone.com>

On 25-06-17 10:26:36, Luca Weiss wrote:
> Zeroing out registers does not happen in the downstream kernel, and will
> "tune" the repeater in surely unexpected ways since most registers don't
> have a reset value of 0x0.
> 
> Stop doing that and instead just set the registers that are in the init
> sequence (though long term I don't think there's actually PMIC-specific
> init sequences, there's board specific tuning, but that's a story for
> another day).
> 
> Fixes: 99a517a582fc ("phy: qualcomm: phy-qcom-eusb2-repeater: Zero out untouched tuning regs")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

