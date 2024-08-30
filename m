Return-Path: <linux-arm-msm+bounces-30219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB19965DDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 12:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 657111F279E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E44165EF0;
	Fri, 30 Aug 2024 10:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="V5s9JdGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2150717B4F5
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 10:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725012210; cv=none; b=sXSWhf+YsKyki/4psA621lCltNYSP9ZQwAIfhoTS061021KPXqPrKs00xC2cABYnAeh3TQuxB6aaXgJbDw7NPvBbg/7sEgFBvFgyRuAEyLxnOvllwz9gxoH0qCdI0whxqo8WhG2RzDHbrOjM3yqATTkB0nMRIimbIn5KwmN40X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725012210; c=relaxed/simple;
	bh=Qzz2aWEELYP8mMctfESYoFBlj6mzA2qfCfyV6WlS30g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Vh+ZZzgjxASqmF56zgbt96iqeGZ5doK5tF2q6dqRf033P8T8ROyOUwH6GcnPzraAssLIMX4UDUHq+o3gFy7YdpVF/0uG0OW1WUGRJkPWKQdu/x3JKuVCeQXUgLPp1SVQDCVhjX2N+UI0295FHkScpPhZZ/tmMTG3YhhFzlxZR9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=V5s9JdGv; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so183373766b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 03:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1725012206; x=1725617006; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cIeMDcm3LN97MVIbOIXKOQTp1QGgYG2TQG0/ddH0/U=;
        b=V5s9JdGvjpMmzsjMgKNa5LQuI1pfSY4Rir5lYRnlWhYtHkVtHdWx7DSb6ARrmgZCQb
         cdq5tQdJvlGTAc2vO0ttqHMRXJhiUq3cPPp/49alCMBQpLyO5HAXoPEg/YuDJ7RPDe69
         PpYNhHsidavUsb6cDU7aNPqq8zKaGGGJQAiUNKpo+clM3dzHkh7yXfn8nTVJDoQK9FHk
         Pc9Hy+YFUuhEudlLmOOmPmcaMToEgZWLfDJcpKc1CnlraEf1YoRUwuDfTfJfyHbm07lS
         v62Ygjr/4zDbUUHdcbC/AYN05b0d96FJwFhElQqUVRKp6s8KwRCUTnXa3XPsHwP70lkL
         Y4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725012206; x=1725617006;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9cIeMDcm3LN97MVIbOIXKOQTp1QGgYG2TQG0/ddH0/U=;
        b=Q+K+kaJb5Kh9TAP78Cr49vhZfoJ3MNwRbAMkjPBFYCirq07m4Q/TMwPBF6ufRCqXit
         wQWJXWp9TUROOpyBLBU2L5j+H9R3EGQEy6tgXHVP1PIv0vCvgYRaQp6xsJrx3KSXncE/
         +yzcyUSt79U6CaqCRnzusr4VtuWJrwHuDilKDjkQmpYrjqW5v8fHAJH1ZQ1yJwZPN90n
         LVT8iBX2zBqaC72y8cFL7gtpVd8E0GloAnmsKSFJV0cVBlCPKOVMcWa5UuXGaasqlj/D
         Wlq1LFYbjUyZuwpND8TIwfrKUMZWBbKx6l3yTxdIo757s9fVIha5vOaXaPxK6NTHuP9h
         6JWg==
X-Forwarded-Encrypted: i=1; AJvYcCUpRNScapyum2dZAmmcPFAogqbkIzY5zDgIdOrFY5hsPqO77a62dDyDLsYSN+sh/6QpKTjLoNBMz/yX+Chh@vger.kernel.org
X-Gm-Message-State: AOJu0YzwujkFOyTktB06OD0hhIwuChSymUY3jIWmrv/fEhIoRa8sUyd/
	hMBUH8TrAYi0g+gzNuDLy8Ef1qA0PEPJ3OQTGBcz6dekBrAdSYuU4YnpH8qmDNg=
X-Google-Smtp-Source: AGHT+IHtyYxAeiiHI3ftANQtuGsazwoduUWpfMVaJOsb+Oa0tdg31ut88AFK+yFMeMN/gW5P+qDwyA==
X-Received: by 2002:a17:907:9717:b0:a7a:a06b:eecd with SMTP id a640c23a62f3a-a897f775d8amr420312666b.5.1725012205800;
        Fri, 30 Aug 2024 03:03:25 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988ff289fsm197362666b.2.2024.08.30.03.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 03:03:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Aug 2024 12:03:24 +0200
Message-Id: <D3T5SIUJ281Q.2APOQMPFJ9VYI@fairphone.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280.dtsi: Fix PMU nodes for Cortex
 A55 and A78
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Danila Tikhonov" <danila@jiaxyga.com>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>
Cc: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux@mainlining.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240818192905.120477-1-danila@jiaxyga.com>
In-Reply-To: <20240818192905.120477-1-danila@jiaxyga.com>

On Sun Aug 18, 2024 at 9:29 PM CEST, Danila Tikhonov wrote:
> The SC7280, SM7325, and QCM6490 platforms feature an 8-core setup
> consisting of:
> - 1x Kryo 670 Prime (Cortex-A78) / Kryo 670 Gold Plus (Cortex-A78)
> - 3x Kryo 670 Gold (Cortex-A78)
> - 4x Kryo 670 Silver (Cortex-A55)
> (The CPU cores in the SC7280 are simply called Kryo, but are
> nevertheless based on the same Cortex A78 and A55).
>
> Use the correct compatibility.

Hi Danila!

Please remove the ".dtsi" part from the commit message, the subject
prefix should be just "arm64: dts: qcom: sc7280: "

Regards
Luca

>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/q=
com/sc7280.dtsi
> index 91cc5e74d8f5..ab024a3c3653 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -845,8 +845,13 @@ wlan_smp2p_in: wlan-wpss-to-ap {
>  		};
>  	};
> =20
> -	pmu {
> -		compatible =3D "arm,armv8-pmuv3";
> +	pmu-a55 {
> +		compatible =3D "arm,cortex-a55-pmu";
> +		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pmu-a78 {
> +		compatible =3D "arm,cortex-a78-pmu";
>  		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
>  	};
> =20


