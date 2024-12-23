Return-Path: <linux-arm-msm+bounces-43135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E57A9FAEC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 14:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42FF11881CE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 13:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B7C19F131;
	Mon, 23 Dec 2024 13:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwPxUD/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A41714293;
	Mon, 23 Dec 2024 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734959332; cv=none; b=gn3stYJe/1LYwBnmNw23YVGIVzhs68rMjBoB2iNtb9s/jO7ayTH+CPTD6Y1k9JFn0QO6J5FDZ6rGgFkAO4SLGeptktv6ZRfC2GsFCg2lBYjZxIQ5+eOXqFCQkYRulgtq8gHQcvTW4kSm4WpdGrcfS/yc7k2YPCFj8kNpJG0ZoBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734959332; c=relaxed/simple;
	bh=tjqJTiJ8FRPANf/4k5jCg10eJTvbE2riGBCge2fKz+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oOXxbA0OQa4eAR5U+cmvrl9e2WKoiCoBVJFza0sh6iLAqs1sLfSpOFGjLKs8lEkD6/qHVKmSEAONyy7WULc55+xTxZd0L3If4BTpfOGuGSylqn033V9/0XitK+CfRNNfB+HBtIg38JVQIgHycSD7MSvfMN37nQeW+y/nOUgTqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwPxUD/Q; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-725abf74334so3513320b3a.3;
        Mon, 23 Dec 2024 05:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734959330; x=1735564130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bMwBt3vULI4U/PfhJViv9u4okoT658TEEwfvSqeKv8=;
        b=AwPxUD/QT62AqifVwPGPSW2vcOUDUKamSCQ0Ps4B15gvFZg03vEhakXhgbzCRG4d1b
         BBBSTVX/C+VIMxnSjlMj1EqEj9t5XweQ3EZjxc5dNuLY7fmM32y/kpG8KxL4eXJ/hGKh
         jrCMl7dtQ3hFuaebnkF1xf2B9K6qNGX/J6bAKNa9ml0HRvrHxpb8DP//7uZfJNHo+8tw
         AhWBLxwHpG1D7+KNA2nMWvPpCJJQqHgye3oH5zG3OaESL2QvfcbL/Y61U2VtdBn/uDc+
         FeqQ7XE+mrLdFgpy9jHxX8VAaSEfFsPAXKRYuNT3eZUummJn/BQlSC5D+7fv+W6y5K0s
         R0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734959330; x=1735564130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bMwBt3vULI4U/PfhJViv9u4okoT658TEEwfvSqeKv8=;
        b=vYg5H6mok2wxdMz7v20/gCwvudl08SOz5V0HN03MY1ZsDA6NTQTcdKhzjHR+SyYJR5
         /YkWY9DUyx4zqp55Zc9HJFt6CIR86wvB/b7BVBN8DMOMTeB4gIbAqRbuNauBybUEBUpy
         LgWhDfy1ZkplNkIF975R0RV+lIzdbAoYutT+xAG1rZwH843uYjaU3wAXcDHwpVFZah96
         r99yPyeH9yOm0B6PiE6h1BM8N+oEqgnixwoxgc3lW9ehxNW6GHteA1Z+zEPtyqvk3MOM
         sErhCyyU1KdCFYqqw8T5li8ciA+4tNgHOTVuM17j16N8x3re1rAToZHO3/UCpSeIeI/k
         4ibA==
X-Forwarded-Encrypted: i=1; AJvYcCUEDj4W4Nbp/fVLniRe57bByfFYQ/sw/Rn2E3l2gTGx7xVJuENm46oS6ytD6+f09BcLjvkT1E/G7spU@vger.kernel.org, AJvYcCWbeAXmmyryWxTOKBQeb/pCpbEnk2mVubgASZGIB7fVYWIfYjyymbaSr2eJVzS06DXU8pb9Cjhwsj1mA+uX@vger.kernel.org, AJvYcCXZq2XIcXUsEifJOkBzDbhqwxls7IVUXPo7nZR90vHXieTl+vaue60bc9BeSbuc1+xPwaIJomrkwIfkJsBJcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF0DfnRmKQJ997SLZiSGuGo/+T/a/VecXetzWMT1opSfI5PSBP
	pnSmoszYrBX1Zb/uebmM3gCyu681Cq+Z7cAnN+X+oB//nqram4+J
X-Gm-Gg: ASbGncvJy03m4rbfeSDwIS1KDHo5asguH1wX7Zxv/b1I1FWkwQjWaGOT6tOHONa7CUw
	LZBZONzQQV5YW/rfsWolVkK/PSnkGXGxanWomx3JMIkSrxzYANzHVtkcJLL4OlHfJ4/QXf93IAF
	+whQ3Om/6UVdS1WUSKi7UY8o3q5ONEsup4gs3nI7f0RpNUoM3fpi3oLxhLk4hY+lkuGZFh/AfBU
	2MOXdC+OgBF9ob9G582+HrYOcvJqGv9erte/1szpfhIFfru3m2lmmg=
X-Google-Smtp-Source: AGHT+IHoxg9yuqRl1sRUSdUBj8cyZPew7i+a091UQnGfrFwd9D8OQKJxHVk3sivTnt7+9l6s72qbdw==
X-Received: by 2002:a05:6a21:6f87:b0:1e1:ab51:f531 with SMTP id adf61e73a8af0-1e5e048adecmr24356855637.22.1734959330335;
        Mon, 23 Dec 2024 05:08:50 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c133sm8049589b3a.183.2024.12.23.05.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 05:08:49 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	chenxuecong2009@outlook.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gty0622@gmail.com,
	johan+linaro@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)
Date: Mon, 23 Dec 2024 21:07:31 +0800
Message-ID: <20241223130732.76968-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <d9c9cb80-0331-4cf0-9988-15f571d4cf7c@oss.qualcomm.com>
References: <d9c9cb80-0331-4cf0-9988-15f571d4cf7c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Dec 23, 2024 at 8:25 PM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> On 21.12.2024 8:57 AM, Pengyu Luo wrote:
> > Messing up, reply again to fix thread.
> >
> > On Sat, Dec 21, 2024 at 5:14 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> >> On 20.12.2024 5:05 PM, Pengyu Luo wrote:
> >>
> >
> > [...]
> >
> >>> +     chosen {
> >>> +             #address-cells = <2>;
> >>> +             #size-cells = <2>;
> >>> +             ranges;
> >>> +
> >>> +             framebuffer0: framebuffer@c6200000 {
> >>> +                     compatible = "simple-framebuffer";
> >>> +                     reg = <0x0 0xc6200000 0x0 0x02400000>;
> >>> +                     width = <1600>;
> >>> +                     height = <2560>;
> >>> +                     stride = <(1600 * 4)>;
> >>> +                     format = "a8r8g8b8";
> >>> +             };
> >>> +     };
> >>
> >> I still don't understand why efifb doesn't work for you.
> >>
> >
> > In v1, you asked me
>
> Ahh sorry, I churn through a lot of emails and sometimes forget things.
>
> >
> >> Very very weird. Are you booting with clk_ignore_unused pd_ignore_unused
> >> in kernel cmdline?
> >
> > I said yes, as Johan suggested in here (see [1]). I am adding Johan.
> >
> >> Could you share your .config file?
> >
> > Here please, https://pastebin.com/UKew61ZC
>
> All the things one would expect for efifb to show up seem to be there.
>
> Maybe try earlycon=efifb video=efifb?

Not work, whether or not adding clk_ignore_unused pd_ignore_unused.

>
> Konrad

Best wishes,
Pengyu

