Return-Path: <linux-arm-msm+bounces-58811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8C3ABE63E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 23:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C31CB8A41C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 21:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E17125F795;
	Tue, 20 May 2025 21:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbI0Y6mV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2334825EF8C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777405; cv=none; b=PWL57E832isj2g6aUOitQMRyneqFDTZJ8BpBy6T439UNngqTbReoBuYOGRqYn39NjijCDndXw9byR9Llrn3uyFkfK8fQQuhkCUQUSzkIhHcfqjSktuCkBrHa01w6fNa1ShLq3bE5nrd8ZKm4S4sZsSrdFZDhKwfB3LsIN8bxwfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777405; c=relaxed/simple;
	bh=ZkzIX6B8EKK8PhGVq8MydiP2lp2DU4X5qXSyT/4mJuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTl+f/I03GV01Mz7AQbhCUgFsMRg+tLb0Gz5KMSZbwM01CWzr7ro1Tw76oENP2m/NwGQXCwph7xuuu2/ts2kmP660STVUI5Q7dOoxTADRuIu5NqBoqGu70u3rg7ZKZL3Mh6niueRgu8hxHq47EQTHvPJgVKj9I5iSKSo+YyyUQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbI0Y6mV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-551f14dc30dso2755815e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 14:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747777400; x=1748382200; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkzIX6B8EKK8PhGVq8MydiP2lp2DU4X5qXSyT/4mJuo=;
        b=WbI0Y6mVNq1oydgnPoFVdKTl6U+8hIH+/PHFaVP6/L3EWF4ftYP4KWNrJ5f0Gk33IR
         CDDpGO3ySHVj7FRTjwj4fZhBGkWARhHKr7QKNdOu1M20ZvV9Y/y7qcNByRfJZo1HhsPc
         kc5w1vJklwyoyj2W8t29dOSZWfG4VYr8XvzcIcB/VG8gwMp9Wa5E+tA2kl9qmxvVUrET
         jj2JPox5+0Z32QAnPMmojlEiO7Q60BZ4nE3/UUDqX2cCPHGzvgaYePrGBHfcwLTj4gMM
         95DngqU4eWOo7hl3taHWqCFY5A0tq8Fv8WH2e+174sNC8F2w1IDObrJef1Ig6E0i90U+
         8mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747777400; x=1748382200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZkzIX6B8EKK8PhGVq8MydiP2lp2DU4X5qXSyT/4mJuo=;
        b=MLnIFx/dqKBVZKoVresdqZ2GCi7fBXSGBeTezEzJnuItYcV/Lghxz+id4JtbxmR9lH
         7CYJo87LbhtiQSwwhxh3kH8qbydjDRt0/57lQcXK1lBqnVHSbOc5cWQspbQ83aNnPHRm
         QFE2s+waGsS+ncpGbWtWMJgs9jlXUMcFfGgfwhvVZnzmOuxN7Jb5tJgiYjRggVpy673s
         4niLGSUStdbd4fF1vmW3IMMeyZw4LdTbLvOy02DbPYQORSD/ls55DlCQJxc60M2sKsWw
         4ybR6C/JDNOfvB4s3D78h56yF0sdmqKgAlOo/s22WzcatOIyOP1umZwrRoLpgw/ZCvpY
         GUoA==
X-Forwarded-Encrypted: i=1; AJvYcCUjnpLR3RWUbJaG3B4uXYPiFRWh5/FB1A0r8my1ZP5zVmbPzUgkNOndcLc253nU2KmZao3aN9+SvpqJbr6q@vger.kernel.org
X-Gm-Message-State: AOJu0YxCYpiNNHmMDoNS1YfxvesoHr/FptYON0OfluepD7qoafXRXW+z
	2sO28azBeND8e3v32m37yXen7uTiP85q4yJ6Ockr9MLOBbHXM2FAtXB7WkBr3SKb1HOx3vMPlBA
	l4LVysFTEHIuKCrMbTb4hxuW2/LB6s2YSDkfz5/RYyg==
X-Gm-Gg: ASbGncuVnoSDAfep4XBtntr00k3HTnCE5ZI4sZLpg3QRKQzLTpibinYI8ZQe/54G/Be
	9eFz20c9WxfHIXBnmyfEwFxytjkOzUQnvIJ+NGDhMuWMy8oNeyazXCMkciLODCMtrIhv9g2Fkfd
	0Pco1fy3Iys7wfp3NH35rBYedr2q7qgrmW
X-Google-Smtp-Source: AGHT+IF8sxYQYwPs1M87QK3eMhV+cFNvlhWyc3i+7XrWnhigNXZ8VV0IgUxf6qNyKDjghUzFOKBHeIzo7cNE1x0xtVg=
X-Received: by 2002:a05:6512:1383:b0:551:e99c:de65 with SMTP id
 2adb3069b0e04-551e99cdf40mr4151687e87.15.1747777400193; Tue, 20 May 2025
 14:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
In-Reply-To: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 20 May 2025 23:43:09 +0200
X-Gm-Features: AX0GCFtiXGv3w0rhSo7VfJ8xdUZJIxrZrQmBXgjBoZzWgZEfr2JdrMnuBSFAqXQ
Message-ID: <CACRpkdYbzxsDJm=h+vzCcj=LpY9EHfu67otV-Hfv5r5owJhxQw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: qcom: several fixes for the pinctrl-msm code
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Josh Cartwright <joshc@codeaurora.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 8:39=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> Fix/rework several issues in the pinctrl-msm common code. The most
> important fix is the one for the gpio-hog handling.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Patches applied for current.

Getting them to Torvalds as soon as we see linux-next is fine.

Yours,
Linus Walleij

