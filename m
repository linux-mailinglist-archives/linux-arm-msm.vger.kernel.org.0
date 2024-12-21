Return-Path: <linux-arm-msm+bounces-43033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE2C9F9E74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 06:17:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50A4D189203C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Dec 2024 05:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB411DE2C8;
	Sat, 21 Dec 2024 05:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JF5fEbBO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E1A1FC3;
	Sat, 21 Dec 2024 05:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734758238; cv=none; b=gm7DQDfquQT3KvVkjI2ftEyxQFep7v6WaTrYs1/cmDySINIutx71fJ9GBd2OL4LvkfLrqbYm5DLIRGbXHDrL64u1Z6D2mDhRxB5Tb4rxBRTI/ItJuAfQCNwvwaPoPGijqM7RXnQ10pAd8lwTJfNX86ditZDFt1cPJf0gwgqk3Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734758238; c=relaxed/simple;
	bh=V+8LK71GuHOIxNIIWAX8mRFCH3CWG2D/PuFBhElkwpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y3OvuHn8SmY+a+UFnZd3l+CKv1nvHP5nFbHl++RKU7qr04jlKSxUtXTqOkI+ZNTCQ847yANEE+Sb7DKnaDU7dNufr1FNxNZV9Y3kOnvm1A+o0QhVfkiAQlyNf5+Nj3XXUQotZ8oKTQdk1N8j0lqb/quwUrbTmexZNjhxznEHQUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JF5fEbBO; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so2235322a91.0;
        Fri, 20 Dec 2024 21:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734758236; x=1735363036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJuig2DmpBBntDut655C4jp/lt/DyD+Pyx7q/GcSfcM=;
        b=JF5fEbBOD5mNvCH7GWrAbkbCGSymo+larcYIYV+0iEJeeH72uNztz0TTNx5gjPJKcc
         CPalzDYKz/NKb1OdIx+ESJEw0L2wT9eI5LsXfQyfP3s/FCGGMwXezdqTKxg96BHn5RPh
         YJVKAGIe9a9tvU82TZZ27DTw0C0p8CqgKJ2GkGFnTzE19fTKlWdqmlPLMb4QaFxUKDto
         jItWVBRIYG9dKIZTgAMWqrWyDhhGjm/Vps3XNTSUg/NoK4xjnnYSrcKP1ys90qiqEaUw
         8PNKzwiQIlaBueSKjMBZpU04w2Hc6zMFTi349T+/DUVJg1RxX8egZmD6v796it403QJ2
         C2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734758236; x=1735363036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJuig2DmpBBntDut655C4jp/lt/DyD+Pyx7q/GcSfcM=;
        b=eu/dX8aH4CWXWQIXPYirgrSuvdWOsfKL2Lt0gxPd7SagUV3o3fhBheqM1nAnBA3zDH
         Nk62tk9Ga+/zIu0HzPzBGCdw27FG7FsR9vN4Xr40uL6tyhG3d+b804AqUqb9GwtpBYRP
         MtZttYBOF62AXloQRerlShxm/cSmG0dRnGNvxiQx6bZ2+fYk6zDhD2KeJTNsdCLHBUor
         mdTeFUQsaeXpMelRMyS5WOcyukngmExbHcL0131ShU1fx+KVtbOYE0U3PTyD9MFaitKz
         anMu5AvzjmlzrNolM0vYs7lgQYSCm6btKlBkjATffZlAUxXwnwwmHdURCfnKtA3voTI3
         m5hg==
X-Forwarded-Encrypted: i=1; AJvYcCW1u6x5jXIB2oR8Wb0VaaLdpatwPPvqn/B8vdQ1pK2z6TgO8P4jkgRELJGI8nQ7fTbqrGm+Z42GrSRUcXDg@vger.kernel.org, AJvYcCX/FONf7ur7hT0Qn1DJxk+BPtUtUr/XWc2jOZzHX0Hckf0waFnI0iCbWlONtu7qtWC7r3M8plidSUtUOzF5mw==@vger.kernel.org, AJvYcCXgNsFswr/4OQlq/Sk+/nXrnoSiDCq8u9RKYvzdhANg/7/N8mV4Pa9SCLiUa5VSDK/bsglmSFJWt1Ar@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4cX0ua7Nuz+eVmykYtp2s3BKgFNOQxz2SzoP05Rs2ItMwEyaL
	z0ez0mUu65o4ITbE8Ti3FltW7JmsLc/uNRl9R5a0mv3P+Exn3N8a
X-Gm-Gg: ASbGncuwUeUAM9ph8tMXujEJskT4Yl9QY8B9DxSddYvyyNg8f1eAtzpOCbWn3xtC5/T
	8yI2tVathJyyxunGqUAYYdCKnnJsRrV3ysq8Bj9svDNLuzF4ywfyK0+0PFfY5q06KqLvaajP7xa
	G11KfahoTiL7C48YSqr1MmlpOfNUC8lTEgxEdBh3O+0PJsllaeEjz8Z+V8OvO2oaYrwsAI2t4YA
	1NCxCBpr+kqgtiuyWixEJJV1QiqnAv4x1LT1tB+Mro7p+93AjlEgtE=
X-Google-Smtp-Source: AGHT+IHo7rNzTyTM4UUN8dpQfT3ymojGTEzbN0D23GVqZ0kQv7Ut6oOxYKKGBrP/2jALr+3Rqr8O0g==
X-Received: by 2002:a17:90a:d88f:b0:2ef:31a9:95af with SMTP id 98e67ed59e1d1-2f452ec6fc7mr8191899a91.27.1734758236255;
        Fri, 20 Dec 2024 21:17:16 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26b125sm6747298a91.43.2024.12.20.21.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 21:17:15 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: andersson@kernel.org,
	conor+dt@kernel.org,
	johan+linaro@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: chenxuecong2009@outlook.com,
	devicetree@vger.kernel.org,
	gty0622@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)
Date: Sat, 21 Dec 2024 13:15:56 +0800
Message-ID: <20241221051558.450550-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Dec 21, 2024 at 5:14 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> On 20.12.2024 5:05 PM, Pengyu Luo wrote:
> 

[...]

> > +     chosen {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             ranges;
> > +
> > +             framebuffer0: framebuffer@c6200000 {
> > +                     compatible = "simple-framebuffer";
> > +                     reg = <0x0 0xc6200000 0x0 0x02400000>;
> > +                     width = <1600>;
> > +                     height = <2560>;
> > +                     stride = <(1600 * 4)>;
> > +                     format = "a8r8g8b8";
> > +             };
> > +     };
> 
> I still don't understand why efifb doesn't work for you.
> 

In v1, you asked me 

> Very very weird. Are you booting with clk_ignore_unused pd_ignore_unused
> in kernel cmdline?

I said yes, as Johan suggested in here (see [1]). I am adding Johan.

> Could you share your .config file?

Here please, https://pastebin.com/UKew61ZC

> 
> Konrad
> 

Best wishes,
Pengyu

[1] https://github.com/jhovold/linux/wiki/X13s#kernel-command-line

