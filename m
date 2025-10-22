Return-Path: <linux-arm-msm+bounces-78337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BCCBFC4C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 947A856569C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 13:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9EB34845B;
	Wed, 22 Oct 2025 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vrD7MCFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B26234C15E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761140416; cv=none; b=BcJImGPCcU9iFX0Ioj7Jal7VMGomlAZ5M+kN7LzOEKXJLUFzY2mkzzJsWeNLsuuAo+XtBBlN2vhYzIYP1UghKhb8Z5RzGXAS2kuBd0gCXP47YPPAcLOJE+kyXCiUeHRyGLTHbfIZG6QMhXa7u1ghCAlAqlVImkkERcmyynBYaRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761140416; c=relaxed/simple;
	bh=orIYgaMNJClTUKA2Pj42SRVGg9kx4atmkKO79VfJkGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ov0QQmaY1Iqi/aM20HLG9bLrWtadqaIwDq/Zy6U0kWX0VdZMShc3c+oLKar/4TvzVpbXn2GUKdiLWEbwI802gGBfXd+tYwqdImNI+dS3x5G4zpsSdKU2An3zcZTGNrJwlCmsAaY+tM0jeNEZr7CxD7UKU41SwGTH2Lf7qu9E4ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vrD7MCFR; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-591c9934e0cso7694328e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 06:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761140412; x=1761745212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9Gx1TCR16ehe+RsUpMtumgWDjpXuT38xi+HNgTYzlg=;
        b=vrD7MCFR5TiQfiyQ4b02oUQqocgr2+soVZ1doqOvsLFk21dlz6ansHvxpg/DOmiPM0
         Ts1epqVzsKPTxIZEgTAPG9E2iwlz02J7DaqDODW1db/2njFkQJbarS6Levwn4DB2q6gi
         ohXRYq70x90qVfc11r+1GmB1lxZfg+Ml8RL/1e+MdroVDnsqQDagTA7w4x/luiWwUnb6
         Kb7fsbnaZGMqIEhPMYWYXn3oxcCxsfcUswJGBDLQkWp63WfpuWv1mjLkguanLZJD6xVq
         x7Q3AK/upmP1LgDrkGUPeyKJLmxAtJs6N38B9cckdbfVEdtCoqnHqdg6YYIUcJ+3qH+O
         t6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761140412; x=1761745212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9Gx1TCR16ehe+RsUpMtumgWDjpXuT38xi+HNgTYzlg=;
        b=azKmWte+4b9nsnkgMMmryOH/waQ985ncIrACOY6rH1PQe1trIlxPKkkrUZQayQd5BP
         IXEYKJFmEZJuzgoBIj6uvIn2nrlMe5bOAFQegjuSyah9vq/yORFUq1/GXwqhWSdWheO6
         18eWLa3+V8xwW7zG2ow6/bigNJtdaO3QhtoaBh+Ch0TrwIsvHYkz41Uf1eD4aAMrbVUn
         T8q6uOjCo4GGnRnoq0jNWYR0b+FJ5qy3ipJq39oEj7l9np8rbpXgXn28XtFeFE6C7tvX
         w7TI/qrXSIpVWdzIKUl7Cy25Xz8PWBlXpuj+7rWBKFYB6eJemKmigIQgXtlx6Imw+2Sj
         SCpw==
X-Forwarded-Encrypted: i=1; AJvYcCVvR8qapVuyX2kv0v7VmsRLiTYGL/QOdcSeadLd5W9B/9WLG9wRy1QCsUpByRCmr6tyqxes9z6594NKfHu5@vger.kernel.org
X-Gm-Message-State: AOJu0YxUk2UXOmTjX8mPlQbaDT/5vxymO+kjXIKeWgYmve7ACev4we7G
	l2pxoJHtIKNDDqRoIz/UDYj5BLeKIBu0XpPcz4W32/x4eWjUEmzMpvmqs/gKWoaYRPRXQd7cQpi
	qcrGUNqbZiPMsu/xd+uizhIo4ussrySVo1TZo5odK+Q==
X-Gm-Gg: ASbGncuiv/dHwKJ3SWoCLMiHglAjIHg9b4aieTpkvXGGClZKbUsk7anTqyno3yIXXBE
	aj/fHRcwLD5/W9LGY9SsM+ZgNwktbGOd1N+cedwBFL9BiRg+js777okt3Ml6R/dhnAh8YAeR1cP
	xyNwRo26MU+ZESAy0FAT1BbiG9BJKbua57Ivr7kbqBE5jl9UruDnE4awwkuKPBgu9wWr6oNpuE4
	XXf8x/Zw0xuV3k5kLxXsDJhJd0L3dPl6v6lGDNDg+4ACSbxk82GfSbF9WFh28h5/5YQCJ1nDfqr
	DSf3OV90FRDB4OlECaBzwVKrR9Y=
X-Google-Smtp-Source: AGHT+IEKqm8lYyfETbDHoX6GlVAlvBKAEAKibR9/ZUGF9ZkgmvVU7aDY+sPQ7pncE4VQkSkH1+uh5CHDb76NK4aZXko=
X-Received: by 2002:a05:6512:694:b0:57a:1846:df77 with SMTP id
 2adb3069b0e04-591d8550fa0mr6598936e87.40.1761140412394; Wed, 22 Oct 2025
 06:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
 <20251022-gpio-shared-v2-1-d34aa1fbdf06@linaro.org> <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
In-Reply-To: <CAHp75Vewc2OoD7=eoFtrkPrGRuB9ZGT2vu4Z_wdHZUDZ8igUtw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:40:00 +0200
X-Gm-Features: AS18NWC2AFr1HYLKJbD6SJ_gfPPZz3lolA3TRfFJfK8fopnOG8MhqaQPJHZTguM
Message-ID: <CAMRc=Mf_qfFzWqy6ND+YDuXcv5NOYiRTo9QY76V719PqJBMxPA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] string: provide strends()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Wed, Oct 22, 2025 at 3:34=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Oct 22, 2025 at 4:11=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
> >
> > Implement a function for checking if a string ends with a different
> > string and add its kunit test cases.
>
> ...
>
> > --- a/include/linux/string.h
> > +++ b/include/linux/string.h
> > @@ -562,4 +562,6 @@ static inline bool strstarts(const char *str, const=
 char *prefix)
> >         return strncmp(str, prefix, strlen(prefix)) =3D=3D 0;
> >  }
> >
> > +bool strends(const char *str, const char *suffix);
>
> Why not static inline as strstarts()?
>

Because it's not a oneliner.

Bartosz

