Return-Path: <linux-arm-msm+bounces-16759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C704989B810
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 09:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59975281B44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 07:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458CB200BA;
	Mon,  8 Apr 2024 07:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wjxkGp7k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B86A14294
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712559726; cv=none; b=OU7zaEiCVPWdhQY2mrzNuHaIvBBTtBUde+Y2C6P63gCiRpa9WTpy8sBcoybt0E9DIr1bTW7izUcwIJmNKPNoGCc13fWypDmKUOxhU55gb7CvkMfAxFEPADCVXxCB8PJ0/GDGi3u7+rmHRHkAUsUTSmmVzhPX+7pbSfzmIpCLjXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712559726; c=relaxed/simple;
	bh=+J3hXyNpUJmooVXir9znvQFZPVRcR4aW/rauvt6w34U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DKFxzIaM0jHEpjhUqQ/jG8n3gIRRA66h570eCuISi4g6U4Rtlai5+NrlNM7XziBzrsOghkvjIme/wknWqiFs+3N1WrKTQBNE1JYJXqQGjaraCc2G8B54ohx6sNs7GC0ZcaXkYEWpd+kFIyxkwukopX2R9xjudNJStN9K0pHnxxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wjxkGp7k; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a44665605f3so457308966b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 00:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1712559722; x=1713164522; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=offh16ke5+BtPn8lxdjzqkvHVyx4akkldH1viry0sBk=;
        b=wjxkGp7k12Td4AboIjdg9pKXljKYpNH+ozz8ZTkpL+VJCOiT7V7s/uvZ75gqYSDq1f
         j4jg41b0OegzTE+eGBZPIxXVKTin1871OXqaaJ/1eG43LPRbDa2Q7pHzoVSvlryb23Y+
         xKFmK99qS5QpljrP5jr42IzhpqysZkFiOyKSDwM1EF1HwxnsHSxWEHn1MzqpsIgyd1XD
         Y58PNkR5KmONRm2CmYFs0n/N+GKa7ab7b2TslPzspt12z/r52qWozHRD8NuJ9VXSx1iS
         9UTiLLnqP0GGFbYhgzHnTfStHlLMYgxH7L+OT4eYn2fxJ8u0K6ZcpO7JBk/ocKxhWnLG
         8Cng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712559722; x=1713164522;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=offh16ke5+BtPn8lxdjzqkvHVyx4akkldH1viry0sBk=;
        b=lTH59+XgmObx3i85D1iURUJ9nMf7tieXGDSOO0JZPkW9lfuyEPMZMj4mR7OvCZdR92
         F1ijMt6FhbmpsMipb19B6gmU97NIT96DxzQavSWR/cMBNiuPneEfNKvOzHJt7ejPIdkc
         WgdCepZDDxSE3j3nCQgUo2hyb95SJYkme2a9AIZtvNvh8LueDtp6fy6O3br3WQR7xYlZ
         gvQMpa528xajQ8S6+Ngz4j+O4BhGS/IqNALhHKx6FyvWVRLd+Qi0a7nn8daDSSl/di4w
         71AbHDI4SbY/66FuGiYY81x1cv+8Ja0aQzk224oqPVu6u80Kez1LgjdeNDQXhotmAWNQ
         YayQ==
X-Gm-Message-State: AOJu0Yx2nOyyNMbPsyrhp0hjqurgdSRisEA9aE//TgLWbfSlOUnvEpJ5
	osc4RJ6h9VV2Veza4WjO1c0b2GMPS2WPVelLsLDoxk/cPz5Y9uKKnjWtcd8gc/Y=
X-Google-Smtp-Source: AGHT+IGx9XWjPlhTGwhQaw4YbPMUv+UviHwS/hf5jfRvCaR11azYOCmvOEGSZXxsXF/fHOKZQMqw2A==
X-Received: by 2002:a17:907:6d0e:b0:a51:cdef:f7a7 with SMTP id sa14-20020a1709076d0e00b00a51cdeff7a7mr2608583ejc.54.1712559722617;
        Mon, 08 Apr 2024 00:02:02 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id og9-20020a1709071dc900b00a4ea067f6f8sm4055003ejc.161.2024.04.08.00.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 00:02:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Apr 2024 09:02:01 +0200
Message-Id: <D0EJR77G6HF0.2LUJ3XY1YFG65@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: qcom: add USB-C orientation GPIOs
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.15.2
References: <20240408-hdk-orientation-gpios-v1-0-8064ba43e52a@linaro.org>
In-Reply-To: <20240408-hdk-orientation-gpios-v1-0-8064ba43e52a@linaro.org>

On Mon Apr 8, 2024 at 4:33 AM CEST, Dmitry Baryshkov wrote:
> Populate orientation GPIOs for some of the PMIC-GLINK-based devices.
> This leaves only FairPhone5, RB3Gen2, SC8180X Primus and SC8280XP CRD
> without the orientation GPIOs declared.

Hi Dmitry,

How would I find this GPIO on the schematics, or downstream devicetree?
I scanned over some relevant areas but nothing jumped out at me except
for the USB_PHY_PS signal coming from PM7250B CC_OUT and going into
GPIO_140 of the QCM6490 - but I'm guessing this is something else?

Regards
Luca

>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (4):
>       arm64: dts: qcom: sm8350-hdk: add USB-C orientation GPIO
>       arm64: dts: qcom: sm8450-hdk: add USB-C orientation GPIO
>       arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: add USB-C orientat=
ion GPIOs
>       arm64: dts: qcom: sc8180x-lenovo-flex-5g: add USB-C orientation GPI=
Os
>
>  arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts        | 2 ++
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 ++
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts                    | 1 +
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts                    | 1 +
>  4 files changed, 6 insertions(+)
> ---
> base-commit: 8568bb2ccc278f344e6ac44af6ed010a90aa88dc
> change-id: 20240408-hdk-orientation-gpios-141bc7fd247d
>
> Best regards,


