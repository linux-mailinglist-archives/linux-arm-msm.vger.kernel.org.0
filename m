Return-Path: <linux-arm-msm+bounces-32323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B7C9849B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 18:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 153E0281002
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 16:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BC51AAE0D;
	Tue, 24 Sep 2024 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RT8NAUY8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567C11A4F22
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 16:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727195713; cv=none; b=olVyQVQ8uK8J5UufE/ixruZaaBo1dSnPq2RjK4iylmK6ZPUW9YdXrRRpggXjmPdoDmgIkmntEeTEiUUZfV74xdq0VroouIikaKMd3RxusaTepQz3DZOtdiLjZjdiz+GzYeJVfIRlxPxk6tW9tSHHR7I2LuLD8pX4FeYDEQ01xlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727195713; c=relaxed/simple;
	bh=nZcAH53nKtuSRiPPswTpKMJohJ9/e5x55okmBtqWeCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/SgILz7RnJWBr3KeDlHKDkqSYQXmypdypYSfgP8hIDyOePyzQtUSNK96pL5nDLtYYXT+gi1pc06eQPm8ofUm9WBAYCwPauOfFfW2mkCZ5Ji0CdGoNlU/HG3ZG9cS7PpK6AVjuxGIJoM4VoDGM63j3ANRkT+FmBV/ibDl2QNPd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RT8NAUY8; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a0be4d802cso30628765ab.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 09:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727195711; x=1727800511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxgReBRcmQg7Glmid18ciROrQdN50U9hW6ffcqeRzcY=;
        b=RT8NAUY8jE3tT8B2JR+KSwyJqk1L3OBlPB1tpSE61GmZoLtFhJlGph8d9Z+iC25qvZ
         4TMKKTiFCmniiahrYRWX4IHhzuG4wKx36MqrHBZp3W/Tzv8ltqTJ86T6pNkAC3eJa/lv
         NAxUdBrLQD9eZqjdSUKeiyh+tWkBoEZKsgOezHA1FmBp+2jMPLXoLmkyXJCQmrkktAvs
         k968OKDGRfvV91EGlX4oaR0iAs9L48ZCAnl8oZdbcr8KHX9oIrk1Nu68+5lf8UTTIUY4
         nqDXTo3QGUl43quphmS9KCzHwoRLRytOWYpGcDGsiJw3wAqJXWAt9Xo5nyFEJpmjyeUC
         6EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727195711; x=1727800511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxgReBRcmQg7Glmid18ciROrQdN50U9hW6ffcqeRzcY=;
        b=N6rwulsyGIPvaYgziJvDUOwXsVjD/B533+8KB/DsdQMH5dW/V42mjyLQekdgkrbgVq
         pcq0qcaJnLbSz2kqo2bcQIWmn+RvHiC7UtD7QvW7kd8gb0FkSabsrX1loIUNCI2jNkSb
         DjtYnXnK/H7A375ttLayoz33EC1DMlnju9knlHyjGJMUHmtmrEo6LEdO5p/7aHFu25fT
         CXlTgKfqMvf5aVF3W9PaXQsXe8U06bC1xUt0/62SPfljVp1BGFflXTUWIBuK0U9PRTd8
         oxwvBTWRGr/n0XVB4ADJ+FNsc8BWzYCLCIjPOwKEXqwVRL5sjj+a5y0X5/R06HKQ7hn+
         W9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK9wdCFoF5qg6m+hjA882rW8z2Ad/xuigYCeuOydcOtQWcDDYbP6E+ZS8WjPG0CFiYABMGolwBH1LOh54L@vger.kernel.org
X-Gm-Message-State: AOJu0YzGuchBN7SWdKaF+q/3mnKEhLFMEiJCrq2Mex0SF6Fxbxrlyqfd
	tOYXl9TEVcboeYX50zBztFNJCSbHEGLToYMIsf3yDXdMASqwOH8AC5DF0JzRJsFWi6dfjndVw+O
	MoA8zVt2bQ+Dm8G2TW2kIxuxRdTw=
X-Google-Smtp-Source: AGHT+IGXaTiW8/flvk+UGxFCesjkNoQKpD54PMszGOmWIAXfxjQh1gYC8li7UnAGO34ZFQxw5CL2OA6rntSCYLWhxU0=
X-Received: by 2002:a92:cd84:0:b0:3a1:a26e:81a with SMTP id
 e9e14a558f8ab-3a26d729f35mr1072495ab.7.1727195711321; Tue, 24 Sep 2024
 09:35:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240921204237.8006-1-john.schulz1@protonmail.com>
 <g7jofgrxwdypuemq4xe5h45pbewwviggllffoxongmarozme2m@cewhxcp7ij7j> <20240924155442.74210-1-john.schulz1@protonmail.com>
In-Reply-To: <20240924155442.74210-1-john.schulz1@protonmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 24 Sep 2024 09:34:59 -0700
Message-ID: <CAF6AEGs8a-uYfOi6Yhj0WAPdp0r2TPEjxBHTUVEdxmhzObnMig@mail.gmail.com>
Subject: Re: (No Subject)
To: John Schulz <john.schulz1@protonmail.com>
Cc: dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 8:55=E2=80=AFAM John Schulz <john.schulz1@protonmai=
l.com> wrote:
>
> Hi Dmitry,
>
> I do not have a way of testing this patch. I do see your point in that it=
 may be redundant/unnecessary
> since basic/generic drivers should at the very least output a shell inter=
face.
>
> Upon doing more research, I came across the fact that some X1 GPUs have O=
EM signing that prevent the
> driver from working. I suspect that is what I am running into when I try =
testing various distros. All
> of them exhibit the same behavior of the display halting during the bootl=
oader handoff and the HDMI
> port does not output anything. Even the Debian 12 image from Linaro exhib=
its the same issue.
>
> I find this a bit odd given that there is a dts entry for the Asus Vivobo=
ok S 15 X1E varient. I
> don't see any comments on whether the dts for that laptop was tested. The=
 Vivobook I have is the
> X1P varient which, to my knowledge, is identical to the X1E one but a dif=
ferent SoC.

I think we'd need an x1p variant of x1e80100.dtsi which has the
description of the SoC itself.. which I guess is similar, but not the
same as, x1e.  Maybe someone from qcom or linaro is already working on
this?

> Perhaps it would be of better use of my (and others) time figuring out if=
 the GPU drivers not
> working is due to OEM locking and if so, trying to unlock it. What do y'a=
ll think?

It is probably not OEM locking that is the issue, but OEM signing of
zap shader.  If you look at the x1e laptops, as an example, the GPU
node has the device specific firmware-path for the zap shader, ie. for
the yoga 7x, it is:

&gpu {
        status =3D "okay";

        zap-shader {
                firmware-name =3D "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.=
mbn";
        };
};

That qcdxkmsuc8380.mbn file would need to be copied from the windows
partition currently.

BR,
-R

> P.S. Apologies for the incorrect prefix, should have done more research i=
nstead of trying to
> make an educated guess.
>
> Thanks,
> John
>
>
>

