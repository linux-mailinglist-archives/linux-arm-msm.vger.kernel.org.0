Return-Path: <linux-arm-msm+bounces-26605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DECC0937103
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 01:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7B8B4B21213
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 23:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C640E14532A;
	Thu, 18 Jul 2024 23:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Po0/GAeF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E9277F2C
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 23:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721344325; cv=none; b=csuBjhVQs1Z6di7Fn3eMUW8DOooRCyJ5BpngxVxCJlyDHqm9VmK0vo5nZPvkGMLmGDNBKLYC86wMXj+IxLr5CsWRdyoCkH/vJL9zwLcK8ol89FyaO6f2N38bbAlT8QieNLBHQYou0BFPc8akdpWJeHlEz/gqSciRs3VrBbwUN+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721344325; c=relaxed/simple;
	bh=7xPyN/a++eW85lgR9HwYmEav3SElM8LKOPms+Vep1Zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyt7MhJF8CkYTwIq99JC8xyRC6EP+RjPfHe/+UqFBLwrfrcpHzB/BVZxEUhnqA1LGgtUAtJILNp0qnpvyMRDPiXKtOq+oHvBNuR3NDJ2Nv5i+PS+AaLQPe1nwd+DyVnTCZZ03aR2bJlMjjd9vE8VKZXCjucav3kQGKwFWgmIAQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Po0/GAeF; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6b78c3670d0so8105266d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 16:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721344321; x=1721949121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9khtoctNp6Gh3eP9HY6HLZ7GyEjG4eZ3UQ7stBpEWc=;
        b=Po0/GAeF+4CpcKiuBKrfubZcLYgBVpDCRSUBY4HeBOJ+jX7eEG9oJMNgyiLkG39EKU
         5M5fhaDmw4x5Tfu+l49CzKiNv9X9kY0EA60PEk2uS7TlOo8Z4brOuOB/CeO7WSiWI3cy
         Px00XIFUj9FmDZz2jyT0bic5gi7IiH+UUObZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721344321; x=1721949121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9khtoctNp6Gh3eP9HY6HLZ7GyEjG4eZ3UQ7stBpEWc=;
        b=P6zRLVeibDAHemYJsZL55p7+jp1+EQBdBDr85fE5AulRkJ40sC3iEfBKqxkC58c63+
         /oVNc336SGpA/4d4u1RrwrIJhjHYVc+qEkOes/gHTs9r44YYj7BymHA7zObQtE79YWD6
         RmyDEzFlvSXSUMWQE/Ll3Qxb6czmSQ3Il3vDvya05BeehSdg2+kJU+a2dv7/NzSixbZA
         vmusIfjO+2cbK/qKf8qteY5A512cwzR4mxG6ux3dC5tECtz7BK63fb60sxdNxO8jDvGj
         AMWRJu76GhVFuDDNzgA4D2+NSxKkgKABLL3uqn3tLLqBBWG+b22U9oYKkm+TTOvECqYe
         32eA==
X-Gm-Message-State: AOJu0Yz6s09duuopddSHpSXfJaD7Z8SqneIvBTXneVwnltvs0GcefL62
	jfGaVVJOnrVEg6IolrvqxbWKwHU0+cocuAeSQ7bqAfhWh3VzetMsvOqeFcpp/3QTPmLprmkCMco
	=
X-Google-Smtp-Source: AGHT+IG2Qz2zKQrnqJwtH1czrNW4GL8HNTE/92RWq2+k9StW4PD6i21CltxCUh0fbWOHuDvSrDPPGA==
X-Received: by 2002:a05:6214:1c0f:b0:6b0:7413:e0e9 with SMTP id 6a1803df08f44-6b7ac7b5bf7mr4028676d6.5.1721344320994;
        Thu, 18 Jul 2024 16:12:00 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7ac9c3b2fsm771616d6.99.2024.07.18.16.12.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 16:12:00 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-44f9d7cb5c5so5771cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 16:12:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4187:b0:44b:74aa:1838 with SMTP id
 d75a77b69052e-44f9c6519cdmr636121cf.5.1721344319670; Thu, 18 Jul 2024
 16:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240718184434.6307-1-robdclark@gmail.com> <20240718184434.6307-3-robdclark@gmail.com>
In-Reply-To: <20240718184434.6307-3-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 18 Jul 2024 16:11:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UDopTSfpfzjUDPFQKyhUTNOk9z_Q5qnH4Up24M0xZoPQ@mail.gmail.com>
Message-ID: <CAD=FV=UDopTSfpfzjUDPFQKyhUTNOk9z_Q5qnH4Up24M0xZoPQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-yoga: Update panel bindings
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Rob Clark <robdclark@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 18, 2024 at 11:44=E2=80=AFAM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Use the correct panel compatible, and wire up enable-gpio.  It is wired
> up in the same way as the x1e80100-crd.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index f569f0fbd1fc..37ef05f8c7e0 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -592,9 +592,13 @@ &mdss_dp3 {
>
>         aux-bus {
>                 panel {
> -                       compatible =3D "edp-panel";
> +                       compatible =3D "samsung,atna45dc02";

Instead of the above, I believe you should use:

compatible =3D "samsung,atna45dc02", "samsung,atna33xc20";

...which makes the dts work without any code changes. This is what we
decided upon for Stephen's panel [0]

[0] https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7f2f6=
58a3@linaro.org/

-Doug

