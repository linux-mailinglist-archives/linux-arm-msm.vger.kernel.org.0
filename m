Return-Path: <linux-arm-msm+bounces-40408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BF69E4826
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E09BA284907
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E45B202C35;
	Wed,  4 Dec 2024 22:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gJ9Buxxr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3011F541C
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 22:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733352570; cv=none; b=iN07u6aAAJPHVYgUAdC4hecE3o8gHG3OLx98GZwbqyI3cN5e1g2jLQCzZtq05RGkVNk2RzE1V2bshvY0iUG6i4LVfUSHEN+enSOpvXBasIA67HLf5NpSTFlnoOGq5MXu7z9Q0N0Rl8QSF/Ng84XKdLsvOdKfUtieBtoJpTAmxDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733352570; c=relaxed/simple;
	bh=TFhy+fON5EYXB48RBtCSmjPevQfB+1YjtuhEruheq8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4Vg9Qu+Dcw2+AbViT+Z1SMV/Eo1oKhLXWiPiMHPes9u160MPotsqV21j97HF+zIWPVk7d0U7kOWPj+Xmqd8Zec4SmRzuI5Bx92OeVbSdFfQdHDUVug5tnbT4SKLvPVypeFvy790HRkqaAsPbcEZqKHAH3+HYZk+tjCbxXrV02k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gJ9Buxxr; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e2129be67so362651e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 14:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733352565; x=1733957365; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3NqyklxNKjn7GA1Xiioa4rdBEF1bx3QvQxtDhyi8+k=;
        b=gJ9Buxxr4i+Zh6zHQ84t1zFOu/ew1Y4U7mWy78f/U7w/hx7N8N8W7d/jJG79Dh0xJ8
         6ZeRKcS6YXNTjQf/WbV+IpV8jp+ObWuYrVj1YDZWKlmXyJl0+s2dXyd5a0X46Ci8brFp
         VhMqaetajVFBEXAMLIW1NJ7MjulHdFgN00v+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733352565; x=1733957365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3NqyklxNKjn7GA1Xiioa4rdBEF1bx3QvQxtDhyi8+k=;
        b=Z2pmfzQbtt+YgnXI65LVcDu1T1xmtznGCcjfFTYDF9MNHLpg43AbFu+lwLHCmFBgJg
         TosWT5TY0SderdTCCxJu4w4e2n5ntfBd+KvjY62g9ZFNSadlU13l18qZ0ECR4uVxP1Ro
         O7iVOIccxiTuMQIMoiRtuKmqNeVbQ3ez5YAUY5wuTKMK02gd8muhStU1fBrzHic2ndqX
         h3oHMGpDPWphyXmXa5Tc608iMxAaijsXgQ5YhF2yOL4Ry5ZXQYfGH70FGn+i5pcporPL
         /Gwe2J6HL0F1CTotdsY8jgqJEaSw7A7Vvn3PoZaBI3MyvIVTKV6LQNHHPkxBHZ9z3fl2
         BtjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi50BHkNwRduWhXKrzJ6nTFSloafXw1xopuM8u9r5oRPFjg3tq6bx0iTsaGT7f075cOxijB8opnkPf0WU7@vger.kernel.org
X-Gm-Message-State: AOJu0YzgLk5C315ayb7vGr7zuH7vL+hoEWDvvE+KN625/94a288ZS8KI
	zhtnZ1WVLMvPtCy4b+72vacnnyMpwVi8Ek+DSBSgIJvCl6Gp/wGoKqEyi3RP0FsUjg34Zn18lJs
	FVwiG
X-Gm-Gg: ASbGnctP7xbusrRrOSemwSOXZKLLRiaiRC8hSGVzDhAQfH2+7BCea7hACSvTm2t38Oo
	TIqUtWCA3m8qIsKWu57MZ2pxgbNTquUai9C3x9hgEFFa5jFM9YM4H/fYBUoKJMzb7rfEsakBNsv
	zbDBj0s8v0Jzpl/18fCL6q+H1H4mnJTWVrlPcj6VAshdvn3uYr8Qtl3dCyAeBfKCIKzbcV0NDwm
	VQbUXuXqRRTNsg/wsHEOh6kjmtXR9b6ZUHjZeANQlO5tiAfDO7HcuTlibEIlAY+elq5q/2BDw3B
	zIQNdftbm3CeYQ==
X-Google-Smtp-Source: AGHT+IGI2uX15vCPiDTfFU4PxHvadThrJ14sFohWKvUhzpdJSNCLoUaPKPSvGz3YyTn8OjGwh+WWRg==
X-Received: by 2002:a05:6512:481e:b0:53e:2052:f0b2 with SMTP id 2adb3069b0e04-53e2052f12dmr1250046e87.24.1733352564802;
        Wed, 04 Dec 2024 14:49:24 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ba6c4sm25685e87.156.2024.12.04.14.49.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 14:49:23 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53de92be287so333514e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 14:49:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYCD4DpPTF4TdZA/D/ZEL90vSvxjp2U0IuNqj5STGwJkNwgGtyfifYJXZV2ac1nZlc/bQuBWsW3vlv0hqI@vger.kernel.org
X-Received: by 2002:a05:6512:b0a:b0:53d:d44e:fae4 with SMTP id
 2adb3069b0e04-53e12a0687fmr5763487e87.28.1733352563093; Wed, 04 Dec 2024
 14:49:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org> <20241204-topic-misc-dt-fixes-v1-5-6d320b6454e6@linaro.org>
In-Reply-To: <20241204-topic-misc-dt-fixes-v1-5-6d320b6454e6@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Dec 2024 14:49:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UKyyp4_BfHwpYLEB-N+-R0P=RVBsUDHHu2gS=Zwi3WmQ@mail.gmail.com>
Message-ID: <CAD=FV=UKyyp4_BfHwpYLEB-N+-R0P=RVBsUDHHu2gS=Zwi3WmQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sc7180: fix psci power domain node names
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 4, 2024 at 2:57=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> Rename the psci power domain node names to match the bindings.
>
> This Fixes:
> sc7180-acer-aspire1.dts: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'c=
pu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^pow=
er-domain-', 'pinctrl-[0-9]+'
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

