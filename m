Return-Path: <linux-arm-msm+bounces-17648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF18A7CA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 09:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED79628243D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 07:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA166A357;
	Wed, 17 Apr 2024 07:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZSHvCfO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27816A33A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 07:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713337344; cv=none; b=jUUDqKuFd3wNfsuekpbV/STRyVLV/Pd7QCqE4N0yzGcbPgz2cHQ35NO9xr9zAS/lnlTX2KvSkWvozFTVuy3adImhxMnGIbCvnA2Z7KYTW1GZe6MiIwhjGcxIzDbN/PBWKsF/GDB6aR6hXf8ERDvPYCacwlqjztiI4bbeFFvspUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713337344; c=relaxed/simple;
	bh=ZEDa5YTizJoRKvvXZle+WMCzPDMzbAnkbhmq2IQY7R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DujK5DCKLDV61KKaFKu1mfSGMxOpC4a7NbfsJxQfdwlIW4z1ImQUkq6LlZGhohULJo25RkNUz9gnizUn760G89rgd/0J5wGabxkLSLwEaALXRUv84dBpp3QJsiD4eoYnVvTzG3HZtbCSw4/ss34kH7yzSHiB5sVlqfx3iy51HVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZSHvCfO; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso5424143276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 00:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713337342; x=1713942142; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sGvt/OcevPOUXaTJnaPKCznXL12lo9XavRWzKBHcfZU=;
        b=TZSHvCfO7fKK0pRSSY3yqOFhqCJUdQguPeDEvISu5T9J3IjCbL6yR6LlMS1+nSxnxE
         uekvqMnIIkcG2ZBXM286bUe6XFcuGshj70i6AyGHF2d++X9FneHriAnpRMaZmL/aXLCW
         XQtyCXI5Cle1SnR5R3F9ldI8CtHg1+sEiGkDxRvc6Jubpf3FoELzTf4BcyCPKT26u7Yu
         JKYUdlXCOGesjAHikSN4bO2WrpcX9nkKJo/VwZ3jwRBhcMYUON6kF4OZA6IddatF6qcd
         ofvE4KBvq4skg/PImWg7L3QsgaIVINCi5zj0mmr7wlsQl5Pz5l7VjGhtWuQQGQtYoT6O
         2a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713337342; x=1713942142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGvt/OcevPOUXaTJnaPKCznXL12lo9XavRWzKBHcfZU=;
        b=SEthgu0CMjzpxEk0J89BpvuiV6GJvdCb860PNB/GyXgrAOBwwOIEHyZSCln1qHDs90
         AEOxUU0y/7T+MglQqAMYLkmM9H0oKLy/TEvzf3SMUrBC+6SbYrtQks9exJ1Y/FMFamTb
         braEsTFi0AapDFBxb0im6Qqw97aPUOE8WNFxXbNBk+eUUeKOeEc6i2qoYyn7ktEOgT+L
         L4kcQErsBT058/yeBsCTR5vjTE/mpZXt+V3NeRgusLTheu53p0gLAVhAUJwtmMzx5kzG
         jX2+S730Kd79Qf7MP2yPOGfrNcin+qgJtrAZyzZLDA3f7ZvuBY0FV/RpczOPx1VNgDh9
         TL1w==
X-Forwarded-Encrypted: i=1; AJvYcCUNIezppz6rWO358oHM7w/Yyu8kGii8HIu+9Cc6HVxqG9EdnFB7GXguIZV4a7BqKhKuO5/M/Ze9MBKdUjqkSnYxosPMIpinVLFW2TKxvA==
X-Gm-Message-State: AOJu0YzDSiu7vY7GoMIv9toEW9xW7rF0D35Ks7cMJwYHBzMcBSzVjfkD
	YkigmR7ab49Qa2P7mMhuBtq3GrloDL6HCADLUG6GUVY51PKvX5OASsD75gwlHrNioBOlELrtVj3
	jJQ3CHT6E5aTfh+olvduylClq7wdfp4W8racx6w==
X-Google-Smtp-Source: AGHT+IH9CEuOupRBWZQNFxyza2VtLQoxomckgth+p7ynPNtYc07M5PELX35fU9fO3bLqrnFXrCHVMiYXlfx9K0YMLWY=
X-Received: by 2002:a25:aa30:0:b0:dd0:c12:411b with SMTP id
 s45-20020a25aa30000000b00dd00c12411bmr14962497ybi.8.1713337341963; Wed, 17
 Apr 2024 00:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA8EJpo=nd8ywUzz2e42p7WAyuFm439yvNf6H=MD63LCV0xTnw@mail.gmail.com>
 <20240417065020.3599755-1-github.com@herrie.org>
In-Reply-To: <20240417065020.3599755-1-github.com@herrie.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 10:02:10 +0300
Message-ID: <CAA8EJpq4mEKi=WW2o-tmkSCoKv01sV5wM-U-KxXXGAcaKSp84g@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: phy: qcom,usb-hs-phy: Add compatible
To: Herman van Hazendonk <github.com@herrie.org>
Cc: andersson@kernel.org, benwolsieffer@gmail.com, chris.chapuis@gmail.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, kishon@kernel.org, 
	konrad.dybcio@linaro.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, me@herrie.org, 
	robh@kernel.org, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Apr 2024 at 09:50, Herman van Hazendonk
<github.com@herrie.org> wrote:
>
> On Wed, 17 Apr 2024 at 07:52, Herman van Hazendonk
> <github.com@herrie.org> wrote:
> >>
> >> Adds qcom,usb-hs-phy-msm8660 compatible
> >>
> >> Used by HP Touchpad (tenderloin) for example.
> >>
> >> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> >> ---
> >>  Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> >> index f042d6af1594..ccf23170cd17 100644
> >> --- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> >> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> >> @@ -15,6 +15,7 @@ if:
> >>        contains:
> >>          enum:
> >>            - qcom,usb-hs-phy-apq8064
> >> +          - qcom,usb-hs-phy-msm8660
> >>            - qcom,usb-hs-phy-msm8960
> >>  then:
> >>    properties:
> >> @@ -41,6 +42,7 @@ properties:
> >>        - enum:
> >>            - qcom,usb-hs-phy-apq8064
> >>            - qcom,usb-hs-phy-msm8226
> >> +          - qcom,usb-hs-phy-msm8960
>
> > This should probably be msm8660 rather than 8960
> Hi Dmitry,
>
> Thanks for the swift feedback. I'll send a v3.
> I need more coffee before doing this in the morning

Please wait for the feedback from bindings maintainers (this might
take a couple of days).

> > Note, nowadays the rule would be to use qcom,msm8660-usb-hs-phy
> > compatible, but I wonder if we should enforce this for such an old
> > platform or whether similarity wins.
>
> >>            - qcom,usb-hs-phy-msm8916
> >>            - qcom,usb-hs-phy-msm8960
> >>            - qcom,usb-hs-phy-msm8974
> >>
>
> I plan to send more patches for the msm8660, so happy to understand what
> is the preferred approach, because it doesn't seem consistent.
>
> These are my first patches, so learning mainly from what I see in commit
> history (which might be outdated)
> It's indeed ancient platform, we just would like to get HP TouchPad
> (tenderloin) running with a mainline kernel, hence these patches.

This sounds really interesting. I recently got apq8060 so I should be
able to test your patches if the time permits.

-- 
With best wishes
Dmitry

