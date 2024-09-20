Return-Path: <linux-arm-msm+bounces-32088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 224EB97D66C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 15:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC36D28312A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 13:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D611217ADE9;
	Fri, 20 Sep 2024 13:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Dx6zclKJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2649814EC64
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 13:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726839909; cv=none; b=J0k3vFUALKVmAHHdHAMj1eBGnsUUGNb2ZyK5ARW3MzwYmYr/5eFX4HQZZToDvbN0NSN8fb6tcVl3OcdWmZiXm7cXIMqXkurqWgUuGRCJvH4e/sBhmE8nnbCuzvlDe6do67brnfNZ9fOsayBAT/kGgjzSOSs/FId4WC+fFgTPX5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726839909; c=relaxed/simple;
	bh=gDN/sgBuhIM3JVUFXVcLakscRVbrc1kau7V11AQd7YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rr3F80nXlzEp3PSKszvNCB+Ku2geE8aehTWH2ewbbvyeuORS8WdZ1AsRWI+XoKWdTqCWrCAnzmcxXrTUBTWx1qLrvzcUfRbkSEwFPa01TFxnbku4zKSXK8ti8dVqHfDe+Y6mTiVsJ7odcOnLmJE1YUhca9kb8lPmqRU3/eilwUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Dx6zclKJ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ddcce88701so20229237b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726839907; x=1727444707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdvJ+kr1RTk5qIQIrIC2yclK5Px3xgR1ScHS8srLiXw=;
        b=Dx6zclKJ3rT3xDoek6YfZ7qdF4/D3AD7RrFuwZRU3e+5IZH1BGasPwFVlJILH3uRKV
         cPZDAwjDKxaK2jkrDJOr7Bdy/pi09qjt3dZz954N6VtvvMRTgLk7EBxyOuXNIKMXroVl
         NPwUCRdWUw7y4aJ1pIhtHQ5pCK07i4cjDAAiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839907; x=1727444707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdvJ+kr1RTk5qIQIrIC2yclK5Px3xgR1ScHS8srLiXw=;
        b=gsMw9ADF/PrZCu3Il7CoyoPaX3r5ESWAWSseAjDNacZiDWzo7jowrR1vdXaoOqjBK5
         RfVIzLvfy4pzjwlTDGRK+RFz1GR0pTzGTpXzW3MA1M00cr46eWdMlE0woA7f9sqCjaib
         9mWP81ZoX++FfLlht2vXPL8bmZCVFP1uqbEO2A97Exm+ltWateiC9TACdQQ7Ql9ZJTDx
         yyveofvxUhMSyv0HLv98a7TT12GM+efx6KxL/xJIMPGrhgDM7ptHDZsgsSMWn8QfabF3
         dP1vmX6a7mTHC5yDMLruRIHs+SFaQNeBHIeWq8Ywbtq6NP7T9QLxW4xhNzG4fTq4AexI
         Q1qg==
X-Forwarded-Encrypted: i=1; AJvYcCVVc31deZZE9GALIMswVOA7oi6rfAGYKbKbx+tPsdv6Qd+1y9jl09Ky1MRNfouqjpdmfczpDc71J/Uxg8/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YygWzoxYJZU3sLzd+jVr23MecGVn8z6xXNkBWJAR+gOOpZPiEu7
	fVCYlKkxviPe3v5Az5Er64v1kf0CLJergW/vVoxV/RmNvEygMVtyFbEVvpzWMyEP8+5d77JUENk
	8hQ==
X-Google-Smtp-Source: AGHT+IEfB7fkGobELQ//+LzAalfZ4bjaSoymRKayaIwmcd9ghR3DxN9fWUsx6ZIwzkJdfLpIfACuDA==
X-Received: by 2002:a05:690c:6603:b0:6be:3601:7189 with SMTP id 00721157ae682-6dff2830d15mr18668097b3.10.1726839906634;
        Fri, 20 Sep 2024 06:45:06 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2df0763sm24481017b3.20.2024.09.20.06.45.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 06:45:05 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e1d0e74f484so1834634276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 06:45:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQp+HZOfnu9AVzYoDU6+fy4xrl9cxog9eUzU3/ijp6MfI3DMx3N+ai89/zBoPWDpSg7DKp53T1Tut856i6@vger.kernel.org
X-Received: by 2002:a05:6902:2b05:b0:e20:2245:6fa2 with SMTP id
 3f1490d57ef6-e2252f54996mr1772372276.29.1726839904812; Fri, 20 Sep 2024
 06:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com> <20240919-topic-apps_smmu_coherent-v1-2-5b3a8662403d@quicinc.com>
In-Reply-To: <20240919-topic-apps_smmu_coherent-v1-2-5b3a8662403d@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 Sep 2024 06:44:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xrbe1NO+trk1SJ30gHm5jLFjd0bAeG3H46gD+vNFZa1w@mail.gmail.com>
Message-ID: <CAD=FV=Xrbe1NO+trk1SJ30gHm5jLFjd0bAeG3H46gD+vNFZa1w@mail.gmail.com>
Subject: Re: [PATCH RFC 02/11] arm64: dts: qcom: sc7180: Affirm IDR0.CCTW on apps_smmu
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <quic_kdybcio@quicinc.com>, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 18, 2024 at 3:58=E2=80=AFPM 'Konrad Dybcio' via
cros-qcom-dts-watchers <cros-qcom-dts-watchers@chromium.org> wrote:
>
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
>
> On RPMh-based SoCs, the APPS SMMU advertizes support for cache-coherent

FWIW, the "RPMh-based" confused me a bit. This isn't really related to
RPMh, right? I think you're just using "RPMh-based" to establish a
point in time and that Qualcomm added RPMh in the same generation of
SoCs that they added cache-coherent pagetable walk?


> pagetable walk via the IDR0 register. This however is not respected by
> the arm-smmu driver unless dma-coherent is set.
>
> Mark the node as dma-coherent to ensure this (and other) implementations
> take this coherency into account.
>
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>  1 file changed, 1 insertion(+)

I remotely booted this on sc7180-trogdor-lazor. Since I'm working
remotely at the moment I can't check the screen, but I can at least
confirm that nothing seemed to go boom. I can also confirm that
without your patch I see:

[    1.580607] arm-smmu 15000000.iommu:         non-coherent table walk
[    1.580612] arm-smmu 15000000.iommu:         (IDR0.CTTW overridden
by FW configuration)

...and after your patch I see:

[    1.569350] arm-smmu 15000000.iommu:         coherent table walk

Thus:

Tested-by: Douglas Anderson <dianders@chromium.org>

I'm curious: can this also be turned on for the Adreno SMMU also?
dmesg still has this after your patch (which makes sense since your
patch didn't touch the Adreno SMMU):

[    2.423521] arm-smmu 5040000.iommu:  non-coherent table walk
[    2.423526] arm-smmu 5040000.iommu:  (IDR0.CTTW overridden by FW
configuration)

-Doug

