Return-Path: <linux-arm-msm+bounces-10170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEEF84DF69
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 12:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A9C428E609
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 11:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7638876910;
	Thu,  8 Feb 2024 11:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ud9mfGlv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A827641C
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 11:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707390392; cv=none; b=sOHGiIcNmMSfmZn8D7KYg58/AUI17txyHcaBC7TvJpdOEsazNB+TZtBv7e1SFgI3Hp1lkk1ZJkKhb8lAqW4WtqMyhn5X5g/WHYhOW81a2u8L7Mo4mu9wv6QO5eEEeTjUuAHKKCaQZzyYhzDAMQYd22B7amSPEubbw0WFSHO9Hjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707390392; c=relaxed/simple;
	bh=nXEJucPloRyNfQg1hxo160IEH9PiiHbyQJDfLM4pJ+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWd7wuN7A3YQ68o9/fT/f0WmXdTEfmPb7GmxcKhcA4/tDf94h0JPYUVWz5ShI98WuqmYKRi6jFjU2ftre+7u4WiVcFln84dNjnhJ3gsthPSHgengoIWJ5kX1ToYmyziLGQxwJaFCiTwRXXuqVD2zOm76uKLZt17ou+hhYyioAWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ud9mfGlv; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6049fc02a19so8903717b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 03:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707390388; x=1707995188; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zv2QzNoNrHR0W9Z/ijLeBt72BsIROQonHbxqN4l0J00=;
        b=ud9mfGlvEMFoCtW9mj0hleJ//Mg44k8dI6ENHYyaa1gbxWXi/6K9AtzVApt/URJ4nF
         unt9/3hF2cyIo4zlZ431L/xAYGdRQ20VU6lwwvrZclpvyQFFYoUq1l3ip1daxdtV+bzl
         JI/TfmPMrpFOYqvOIkle8t4O4fb/Na/l8GB9hWzU1WMsrpjGdtE7oGqIAEpGMRyWOGjh
         UNeh+lohUqwqKt99J5jkbkofaksjbmpMrloTACQLQe0qw372QmzdZobIUiLuUDiyf5L8
         1eyyJnVwxq4savaaIxoCbYEHKzkqApXgExF/Dfm6Ldt+I5dOvnJjYvqNcGIp0YPFlwE6
         BA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707390388; x=1707995188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zv2QzNoNrHR0W9Z/ijLeBt72BsIROQonHbxqN4l0J00=;
        b=Lp2wM/SRsTIxQrpBJ4yzTbyhRfdWlbSvPfA6B6N8bQ5/VXr00TPoKt0yn4OykeC/GK
         uJBAmIfp/EPKYkL+GWI1/juAZadoBG6AKLuf+q/cUACKiMRfmPg4TE2mUNbaHfjPEyga
         +i8x+lDoMk2MljWFW5WPil+oc81GXwaAL86+qlKVIgBvpk10IaPAKude+ojpaYzocQ+Q
         9GBC7hzN+YsCT8kSDIypGTT20iYHmodZbCqQVKSF3d4kADw2sDDLHp8CBSoI/ehOjRbB
         HBlRXOBxpkHNBuNBrtXlHN9Irjgi92TiqL7bYEX2N87jFBqUhMF4nDnYRO87XfXGSlb1
         jlfA==
X-Forwarded-Encrypted: i=1; AJvYcCUyapGsvpay9S4hVZUfb2ReEGA+1tg2omW5wE1Wh54nH5ku/JGwm7cuOrdSRENwGycluorBuM68uPDtgy3AAfcgfX8g3TyaQSpQO0vBXA==
X-Gm-Message-State: AOJu0YwnHQTyqU2pJc8Hjr+4XIrKoYzBj8XIIeJxDfx0UGm73d240NjG
	TjTyZejqqYgIx2ZBvusZ5b20FzixeODAbXimfLiVfZhAnjnFNKiQAlWn/CDNcXnxiY0D/g4gTk4
	hs5kRTDSl0gq8gThrD8uuckSf7l6yni1X6eJm7ZLZwCmp0ZRXgeQ=
X-Google-Smtp-Source: AGHT+IHpsrmLs8p7zk/kqkNB77JilHmJAQmArskIr5lryhEV7krDIR9S8OA/Q8HDEtMaT6Hvsgwrjhorn6jBJPtU/cE=
X-Received: by 2002:a81:d202:0:b0:604:20ab:fc32 with SMTP id
 x2-20020a81d202000000b0060420abfc32mr8311495ywi.17.1707390388572; Thu, 08 Feb
 2024 03:06:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208105208.128706-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240208105208.128706-1-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Feb 2024 13:06:17 +0200
Message-ID: <CAA8EJppiNEJVUO-pTsCBXXjNHVrCqqV7J5wC+CihBtH0FdncsA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: minor whitespace cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Feb 2024 at 12:54, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The DTS code coding style expects exactly one space before '{' and
> around '=' characters.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm4450.dtsi   | 2 +-
>  arch/arm64/boot/dts/qcom/sm8650.dtsi   | 4 ++--
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

