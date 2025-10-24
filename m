Return-Path: <linux-arm-msm+bounces-78686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8B9C04B30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 09:24:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56A633BB304
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 07:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2006F2DEA61;
	Fri, 24 Oct 2025 07:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="do0n/H+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC03F2DE703
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761290455; cv=none; b=hcYfGI3SfRoWguE51tU70VHrNg0l635OFVMmdOhkem6BbeI29RLQR4DawoqKzt96WhgMx/pvp2f0siM0GODbaZg6amilqOcTJP1gzH3/gcZWAY3BpVeipmcV9XqH1sbVRnjWR2PyOu5yY9D6n4I97+EKWbp69udatNcDeGdBa/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761290455; c=relaxed/simple;
	bh=CR+8roHK+/LDuQ73yW6ockKv+8Mv8IDa0Xrtz7eQhq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDlwFqbEc/wH89ns0gZ3zK7QOI1wBdkcj/RD5MOPQZeLYQ9PAYnRal1v5AGLIiGxfP2naM/lqCDFCWGdwFtbTTeE39+41/JSSbnyzA+scj818QaGSF1kdfIQpOKp2hdxxZayWGZCQr7bAwJELhGjHm4iQnI2+sYEQLDfSNDXNXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=do0n/H+0; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so2028400e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761290451; x=1761895251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR+8roHK+/LDuQ73yW6ockKv+8Mv8IDa0Xrtz7eQhq0=;
        b=do0n/H+0YBdSMkTq7sBSXWn2/iExuSH4K0sIPxL9iTSfguBIyMA23Lt0sQVhm0PSy0
         0xOcYCLnv24GEMyEVQXR6ARjMO7Mu8VwfZzGGYTd2CkQ7DgrYJBnTyT8tXGIFBZcd+2z
         /7Aupadl9J7Add8zraBmNJfaTmayqpTtIQYwASfQ+2z9NaRvc8O2BOMxiTcgGNNatDjn
         aTy/UOiUjqg1hTXOt2qLk0r2MeMWkvJxIiPlV9sv20AD3ZIonIu05vFTjISc4bFpTg6o
         fjK97f4HJYjgLkswp9aaoSnhY2zJs1fHeFRj/b/czuWD1FFNJTn+X9mHV6UEvyS/RjPm
         4qIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761290451; x=1761895251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR+8roHK+/LDuQ73yW6ockKv+8Mv8IDa0Xrtz7eQhq0=;
        b=sSRl844vVyTqZFGXH0bGoqduYNmS/5CM2KVnqt8XKq03i3nlq1hzqTUWXRVi/wpxTN
         eVYjx0Kg4p2FR9d5eFB/wcfNiI0eyh6ljEyDR07kXAV7eNMVnXNQ+fTDJeFb8oI291bw
         6xUbtPKSSWSQldyvMB3eRdPuxnP+LL0z0YjnJC7fRsrQRDfPGhGVFyQjmrFCFJDHIZlI
         mBzEMvQS9lGlrY0Uu9xknml8zhIHBsCCj5sRKDbjoVZ3YWq9PGr2fAbX/cBAVM9JkKIJ
         636zaXweepexVW4xuGAzLfEwogPTbJys1NZyekD3KA19ow5KEqVxzG8rUI2jD5pqfSfk
         YkCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWWjreinxWcwOlPTfYpd7hHodhtZRjpMBfXQyqGZ2Pjz2NW2oQxw65VzGzILsEFO9F3n0wURCeztcZN061@vger.kernel.org
X-Gm-Message-State: AOJu0YwHWG8RaJZ+eFaFDmug/V3XfI5VuCyImgE0Aq3liLXg2UOPaKy5
	djojEZB/Y8/tTaObwXrXMjFTf0hm0HYJIFNghOk2x3OHgREDaNeMupMfcYSabufSC1AFtg1xIC0
	JjHDbMFMvAsCDXR71j+aCoPGC4RVNsYL3w9GES8zRZg==
X-Gm-Gg: ASbGncsU0fyEUH8WeRnQTVNGkvz76khleoFjuov1jr/eOQMtw4mL1D6GahbrPG85wKH
	Q2wPp1FyWpXq5aP8pgUpoe+d6j4Gn2BhJRPY4I+klrIpyYoGdwAwPLA0/uryW/Lw6GqQk29LGAt
	sNybAhdxiNAYH+WLtqJEK1kDcueA+k6LO6DdhrknTKm17MBU4h8UGL9WtS62a915R2a0RSid3RH
	qqJI5qaSS6Dim+iIuCjy4WXE8owZO7CmlDm7Ld4y7X6O2EkJPOiaIaV9fhGJBWqciMa0TDNTE9F
	YWT5ItHzOS1rBboAFRNPPa0Ddg==
X-Google-Smtp-Source: AGHT+IH0zdKNAnAn0HY8zeCAL8aa1oecPklr3WTZJPyPQRrZZ9JAeaLToU97/5gWoSWPOCpiqMgKR7gX6TBItcaDYYE=
X-Received: by 2002:a05:6512:220e:b0:592:f5f9:f5a9 with SMTP id
 2adb3069b0e04-592f5f9f709mr1849794e87.36.1761290451029; Fri, 24 Oct 2025
 00:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org> <db05003c-8ac5-49da-b0ce-e0b668f49caf@linux.intel.com>
In-Reply-To: <db05003c-8ac5-49da-b0ce-e0b668f49caf@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 24 Oct 2025 09:20:39 +0200
X-Gm-Features: AS18NWBFHHtshqZfLTmGnpCECipG6SuC-vURJ7Hpik3InZgpuKVx4aYTO-AzQUA
Message-ID: <CAMRc=MdWjyTyJh5zfE5qncO8ABn7QSuV1CUZXa+cSMjWoXUrNA@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] gpio: improve support for shared GPIOs
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 9:17=E2=80=AFAM P=C3=A9ter Ujfalusi
<peter.ujfalusi@linux.intel.com> wrote:
>
>
>
> On 22/10/2025 16:10, Bartosz Golaszewski wrote:
> > Problem statement: GPIOs are implemented as a strictly exclusive
> > resource in the kernel but there are lots of platforms on which single
> > pin is shared by multiple devices which don't communicate so need some
> > way of properly sharing access to a GPIO. What we have now is the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > doesn't do any locking or arbitration of access - it literally just han=
d
> > the same GPIO descriptor to all interested users.
>
> I had few stabs on this in the past, all got somehow derailed, one
> example was:
> https://lkml.org/lkml/2019/10/30/311
>

The main issue I see with this approach is adding an actual device
node for the shared GPIO which is now not accepted in DT bindings. We
only create nodes for actual HW components. All the information is
already in the device-tree, we just need to scan it which is what I'm
trying to do here.

Bartosz

