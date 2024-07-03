Return-Path: <linux-arm-msm+bounces-25202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82D926861
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 20:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8764F28FAB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 18:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601CF187560;
	Wed,  3 Jul 2024 18:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfjlK69k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32421DA313;
	Wed,  3 Jul 2024 18:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720032027; cv=none; b=pql9QutOrq1x4Q90o7cm6JAzZKcOjSjQC4zjFB29rjdhRahpQsH4395zXFUb7+ptT3r/j2OrNtUx98RCl5t+LNubBlMAjd7j1vjjWmkbUyx+VLYLZb1XSNmnJBixoA1gvp5Mm3vqsQmXPwp178DCt4xfTzRM10rfu9JMD0HX1hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720032027; c=relaxed/simple;
	bh=Oj1d10s7TZz/O/U8oSMrvs64BZo0o6g/hvl+0ULOJOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwtA7BLoowR82OGu5VfTkHUqCbSN5jiEIfncK2zncBd5Q5GNsYxMKLWnJpaap5qaAv/yinHjJ1IJ8ESxaNK2P8KSOZF/RRHvhzQ9Pn4IZCaQgeFGTNk9BiQeeH+VGbEEaqNCwYScGeTrYcRD0nqcMJhHmMOHJr5EAhpXcy+AzTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfjlK69k; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-446427c5923so7720151cf.0;
        Wed, 03 Jul 2024 11:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720032025; x=1720636825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJtlUQr1V/Td3Ek+PCwnNUq8quOaMRlSlzvkM1qbD0k=;
        b=hfjlK69k++uqjp2du90gmbl7Nh8hskbr9fJaCy1ulO3Oant7IDA0oERyNqs3BEVUo7
         stssHaq23fczG2Zb7EU7d5W/SwigdsQxWt/+/Oy1OJVPNtqkbPX9vB6XSF/xaAFbIy0i
         bfD5fov2GZLLYbGQIrJzkFZ8ovP4NQUq4exuloe/h81Q2SannTYPKc7sgzA9mllLKwWc
         D9Zb17vzBCJrQrx/BnqN+wi3WRurB7sHuDmePShbj6DAIvGHpJ6nZDL6sg+LwHM5FTk5
         bapWBqep1c7kJlb8FR4BcjmtXDc3oQef1eC/aS83PfQEY62kFk2rSqftrphIwGPGG2In
         nIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720032025; x=1720636825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJtlUQr1V/Td3Ek+PCwnNUq8quOaMRlSlzvkM1qbD0k=;
        b=owqpTSV6WM9cz5ZK2Nd1SrcKHB2o550cYEIvjMJkIbxXKe/W10oo5tjYPNQybYIkik
         XJcTJNhHShp5Un6682og5BYQc9DyLc1o1tf8tnBU5ZNuYLM6YmesYbWqBh13zQaA8AXy
         kd4CbYyx945uY6cMF2iNcfT+yyrSHBr6/NaBPWTFwKz+U4XiL0umm7vdXzqab1H+3YqV
         xaFD9V3KIijLoa8lcP1lL36qPtUy9VSc9vukcsLzsB5Rd4MAfp4DctjgEhPTdOz4RkXg
         05k4spJPLi9NiPD6gRBii6HfqCPZuyjq/Vk4Lefl4hy9fSLPc94m3mjlr2bgyRFkvoZW
         +esQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaNFtYbF/iL3Y046xVgbf5tJZ+BAe2tXJLyYQ6iZvi29CB0Pb8vyg4U0pGfGRTMcIi2GrtgbBE2pXS6PcJzj5pIZAnbD6J8eznFq3u3RFeV6t3sYFW8f4LDamMXfMg5EnDCM1TuEzdtp8rNoyO7nltATMHhN7VvoItx5eBdLbPQcu8qYhbfto=
X-Gm-Message-State: AOJu0Yy3hq0748h++IdLdqVJXI/kh/0wnsc4JU/TWsnypVdSAgdPxkxx
	yD2iRJlyV11dI9kAEYX8HiBZGR/uV1TSJAxpYI1GBPVlUdwhj3aKOp0X5EpyvT7CzPrwazXZLDo
	dIgSYTSdHQrIUEkFCIq2hePnA7Zs=
X-Google-Smtp-Source: AGHT+IFU6K+fRyWZMDSxRvdrQZWYEZK82oDyu3Y0c55ypIpf/Ufgyo9zTxhe9Mpyt1hO6cdgJkET7KzYjCIzPwRCL+0=
X-Received: by 2002:ac8:578b:0:b0:446:59db:9184 with SMTP id
 d75a77b69052e-447bf8e2f81mr42689071cf.22.1720032024739; Wed, 03 Jul 2024
 11:40:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240703-yoga-slim7x-v1-0-7aa4fd5fdece@linaro.org>
In-Reply-To: <20240703-yoga-slim7x-v1-0-7aa4fd5fdece@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 3 Jul 2024 11:40:11 -0700
Message-ID: <CAF6AEGvcb6EBrmRTDZhPtUD68L2tztoPmFk80Wn7pw+APsp77w@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: qcom: x1e80100: add Lenovo Yoga Slim 7x support.
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 10:01=E2=80=AFAM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> This patchset adds support to Lenovo Yoga Slim 7x based on x1e80100 SoC.
>
> Tested features:
> -> Keyboard,
> -> touch screen
> -> Display,
> -> Speakers.
> -> all 3 usb ports.
> -> WLAN
> -> GPU
> -> NVMe
>
> TODO:
> -> touchpad.
> -> 4 x dmics
> -> Battery level (Does not work)
>
> Note, All the firmwares are copied from windows for testing.

maybe it would be worth mentioning (in the patch, so it ends up in git
log?) where to look for fw?  I found 'em in
\Windows\System32\DriverStore\FileRepository\*\*.mbn/jsn/dtbs.elf

BR,
-R

>
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Srinivas Kandagatla (2):
>       dt-bindings: arm: qcom: Add Lenovo Yoga Slim 7x
>       arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x device=
tree
>
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 910 +++++++++++++++=
++++++
>  3 files changed, 912 insertions(+)
> ---
> base-commit: 5f18d86e750408030e3980e566ff87f0319d7f34
> change-id: 20240703-yoga-slim7x-35e6cbb5e13a
>
> Best regards,
> --
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
>

