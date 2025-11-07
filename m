Return-Path: <linux-arm-msm+bounces-80797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A7CC40DF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 17:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 620963AB457
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 16:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E072E27991E;
	Fri,  7 Nov 2025 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RoWUvi5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CDF276020
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 16:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762532674; cv=none; b=COBYlsrPaDf9GCnPmxUSkoqy4ZBpeeCSGwXF9OIt1CjZ5rHez/r3hwi1kx+Yt8sbWFBI0B+rM4TCNeUTmih5gxZCzTHmbHEQkDpqHelxs3QJXIvQtATLioOwizTRA+xZeseeCXHN3tHwuQ6YgPGuJYzS+PelfSZVL1OuvTJkjPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762532674; c=relaxed/simple;
	bh=Y03UhLZaCnCjcJ7WP8An0sGjRjCfU0LH+nO/nDS9o1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CVErUxjiLHPO/RCP04DzIzfOAeS+RX9jNiwqrPUouaQoerQ/+grfqGv3FI2oPie63MyOXo0b5CJPyzot4hsQPhwJ8x/HrN99FB8XXDjpTvkcpP/Q1victYBZMkZt9y9oT5h8Rsh9W7xW04yMeMpf1PehL2cOq9CRQXl1aYwccF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RoWUvi5t; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ed82ee9e57so12844921cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 08:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762532672; x=1763137472; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dg933HfjmwHj361hda6LQqGZtOS/62lJRP7depBzGUE=;
        b=RoWUvi5tCQFpb3VhMuGblvT9VWYPFD+V+WvI8EtJ9zvm8OG744zmu66hIGJXeZ5EQD
         OWxWTTwPgGyTRlxleeSvhQSzRg8CUCjtXT2hpCSdzthAxHrnOeAIFlolDBYS3ZyH2Sgu
         MQJHdZYK6se1nd+giXLfZz0QTF+z/qBZmKQWEBjg154bi1rrfKu0j3nDQYDUI3QIgYLp
         bJ2g1eA60iR/azO1pWZ8LpP7I2xEUShufhMJra7QbFgTbdO3tXeEno/8Olryf4TXyFjt
         kbs6OV/YG8L5T4FOk0YH7nNOcVaNasx/mmb75XZTHCWwYvC5VXt3h+NUCP29z10cHZMj
         ghIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762532672; x=1763137472;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dg933HfjmwHj361hda6LQqGZtOS/62lJRP7depBzGUE=;
        b=eXhbUIa0KqfN0WKIdm356LDPgdcGs+1x7nqrTws3m5zGObojJjmuQtMmDKmaxhup6k
         AjIksI6i1qD2+LImH63zo0hkSe3jiJ9OQpir4HLj/LtWp2dfKWdOTnHY/ugcXsJ9v+xh
         FerG8N/pIsq8JIH3EAfcWsf07rSzeBQoZKMDleeOhSDcMM73uac56wdDDPzeY0CcB0jC
         Tyu3oaaBcpqIHOprQUg+5DLHxXFA+KYcYCa/dwRE5d92oO6wtAxPo44xYsV+WnOYUMLo
         6VJd2WPvew00lAMN2KsaePRlS4sX8jbBHZVT/ir+ELMfg1NRKSc0sZdxSm7bOSbgEGBE
         XjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTgGO/JaKS4vYf4UH5MulEmcmXoqVIv1/sH5SiFDagzt1WZxA+C/FKUPsDl7aPYLgzCnKq/vHj4ITKi8cF@vger.kernel.org
X-Gm-Message-State: AOJu0YwdNsP4wwpQfNqcJlu/rbpenqbHuI54yFHL/rKOCB09jD0PyxMZ
	kaT9MQD+khTIhzguGj7aAMiGkfGn/c+xw4BzZ31KwS2Ris1cNzCctWAAFw21L82sWm+VDjwORji
	8nIeVtzLELiL0pXfMbeYYj2CskplWYi9bkpaxH7aWxA==
X-Gm-Gg: ASbGnctAEhK3tppM6mr8JsceSgf19ShwYatpFKq7cFStRpKpu6l0ZMNAMZw9Kov2lTf
	zg8oH4uXFlaaWmYIuFQujD+pXLju4HYHQDfy+ngTGJiKfqftHT4sHOFWJiGxTKw54lXEhHJK2Rk
	78UL2YhpfOk3Wr286rDbgVAwl/AQRs0IJYsfoKmkmjFyVYHag46t93QkmlHJC4HSQzDVBwOQON0
	3kcqx1n+v9eyuQhH5lz7YqDkjndPUc8JXxwpe7V9NQMpPye5wRkpR/HjdNMZJfQW0nIA3mcQlyi
	ma0udiLYyXf+o3skJQ==
X-Google-Smtp-Source: AGHT+IHCkiDrjY2sdtFhfnWtIG5/yIGmjgCTWa+pkSAhfbWzXXqFVFpKvKWb21AxAOgEsY/fAjUmNILp7tvkwx81+WA=
X-Received: by 2002:ac8:5d47:0:b0:4ec:ed61:997c with SMTP id
 d75a77b69052e-4ed94988581mr46526991cf.30.1762532671602; Fri, 07 Nov 2025
 08:24:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
 <176235893222.387743.2128022832743502879.b4-ty@arm.com> <CAJ9a7Vji3fFnc-XPhdTxh00QW+AjqLqJo=zt+SMwovttQRwR8Q@mail.gmail.com>
 <2835dd93-c945-4c19-9d10-0271b14147b2@arm.com>
In-Reply-To: <2835dd93-c945-4c19-9d10-0271b14147b2@arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 7 Nov 2025 16:24:19 +0000
X-Gm-Features: AWmQ_bnU-O7JUHwcgVFk_3qB9Yn3r0GZGnNdkrfA5bMc_HIfGoFxxRf1tq0dPXQ
Message-ID: <CAJ9a7VgXEQQmj6o7n-mPx0qtrCQXKmddGS6BugHb=xaxVAUTUQ@mail.gmail.com>
Subject: Re: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Linu Cherian <lcherian@marvell.com>, 
	Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Fri, 7 Nov 2025 at 13:28, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Hi Mike
>
> On 06/11/2025 14:14, Mike Leach wrote:
> > Hi,
> >
> > Is this fixing the correct problem? If we prevent the buffer size from
> > being changed while the sink is active - which is probably what we
> > should do anyway as no real good can come from allowing this - then
> > the problem disappears.
>
> Good point. But this is completely fine for a running "sysfs" session,
> as the values are not updated (unlike perf, where the session is
> scheduled out and put back in ). So, I don't see why we can't change
> the values while the sink is active ?
>

Why would you want to? There is no reason i can think of, that a user
would need to alter parameters while the sink is running.

If this is a sysfs session and a user changes buffer sizes between
enable commands as per Leo's example sequence - the result is a silent
failure and confusion for the user as the captured buffer size is not
in fact what he just set.

Moreover, the sysfs files (not just the buffer size) write directly
into the internal drvdata structure, some of which are then used to
program the TMC registers  on enable - which is common code between
both sysfs and perf. Thus for perf you have a lovely race condition
and for sysfs you again end up with values that do not apply to the
session just run.

Seems more robust - not just for the sysfs buffer size. - to only
permit changes when halted.

I have sent a follow up patch which should make things clearer.

Regards

Mike


I've sent a follow up patch to address this - and the potential race
condition.
>
> >
> > Changing the buffer size while the sink is active should return -EBUSY;
> >
> > Mike
> >
> > On Wed, 5 Nov 2025 at 16:13, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> >>
> >>
> >> On Tue, 21 Oct 2025 16:45:25 +0800, Xiaoqi Zhuang wrote:
> >>> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> >>> and enabled again, currently sysfs_buf will point to the newly
> >>> allocated memory(buf_new) and free the old memory(buf_old). But the
> >>> etr_buf that is being used by the ETR remains pointed to buf_old, not
> >>> updated to buf_new. In this case, it will result in a memory
> >>> use-after-free issue.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >>
> >> [1/1] coresight: ETR: Fix ETR buffer use-after-free issue
> >>        https://git.kernel.org/coresight/c/35501ac3c7d4
> >>
> >> Best regards,
> >> --
> >> Suzuki K Poulose <suzuki.poulose@arm.com>
> >
> >
> >
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

