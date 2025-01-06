Return-Path: <linux-arm-msm+bounces-44048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF34A031BC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 22:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BD78162BA6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 21:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D461E00A7;
	Mon,  6 Jan 2025 21:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtGfCiR7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7151E00BE;
	Mon,  6 Jan 2025 21:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736197266; cv=none; b=FmIf9gYGcv8E+2PgyZdiEDvb/AcWuxGxhAIZQZB3O6XBEToFfngcpN4L825SplQ8zE1RSSTxFPa1jqcwCiJolAQtbLmr29QP/06ED6/GsM1EZvo8IhP/yn9CTtJjXSpSMzirUqB7rXJYUKp0s4AOuKzJ6q2j5ZAF8sqBaNCVijE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736197266; c=relaxed/simple;
	bh=zvtMZtp5ZFWxiSkY66nztDv/vjqLXEPxyjWnZTntGxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdGN6+HTc/yfC4srgbgI4V4mo8D2RF46Xal4XdScUpcyuiTUw3N3sXjv7sUgTc2bnnvlvCh7biUUW2pS3SLdnHO6JOZGVLorfVunh+XQyPE9IS10FAOJRytzs6pblfBSDlUKFvD4x9zPIucQq0124nHuOmH2VDQVe345puXA3e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtGfCiR7; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3ce3000761eso3727665ab.0;
        Mon, 06 Jan 2025 13:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736197263; x=1736802063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOzmxccnce1E7CXNiUs8eoUX3tWPwgiUu+2R9Zn1q5U=;
        b=UtGfCiR7+z277/Oe3S88tMfnqV9dw7g8NFCm6kZq0O/4UQlK426i3mgN2G6A739VVx
         wgPd3V2oH22qCx99+oIXlN7S8z3Uhm9PbOSQMN/SF+kQxL1wk7biZeG0QEFoamPpDuZZ
         LI0vEi/5nOv6D5mOFTgY/K35x7Eyr69b7Il4COOOv8upuv1NpAYs8Zh9kfdLLdSZmKVa
         kXTG9x63LTEXezo6h5H1mR7cqGshlgK4/T8R6dhi9cmblF2glJipAZpw7FVtJQ06uVi2
         EJwwIX9JwSR6gElf4UZq8p10375OUrV+cSwairrYsRku4ptlHL0k9w4jT9AxoSqwGN8E
         UhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736197263; x=1736802063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOzmxccnce1E7CXNiUs8eoUX3tWPwgiUu+2R9Zn1q5U=;
        b=Cg47REt/4/ys0aFYKviV7JEqoFU4r4lQ8gfBwWZ6eYgCTmDH6sBCGsphMw6ZOmaKQh
         G3FUiQGZ79yVqeBa2+iRQjJTEYX7upmgF3wBJoROp17nXi+g7t5VFBzagPBjinQG4Chm
         6Awc5q/VPauQ4/FbYVDmt5G8poNEMZjzkVhEB1MC7rfMq9q2Ga+8n7vQP84Kb50zpwvT
         iPm5Lxo1OX1+AUQAPYbwfl6MlXbw1W5lK2OB1uVuox8b3SZ0zwLJ4CeFG9yZAAdZy2i6
         VZHxlQqYi3H1WrsBO9ie9Z32jOAirbKXwcWQDnX39kF8QgvAUrzwibJTDTolFwCATLHn
         618w==
X-Forwarded-Encrypted: i=1; AJvYcCWl+YNz266PUBSZ7E2lx0TGoSXMAHr9Ql+T5UcuoG8gTgfvjq1Z18MbpSusH5edvuqURl6VfFz5pBJz3XTY@vger.kernel.org, AJvYcCXPQ4uf6h5f8Z3Cwnu1Hl80pT2mUCwRcgQDjwMwOa/G2a3wi2iqYrG+ejUPSqauTvr0YEQB9qMU2RQvYuyP@vger.kernel.org
X-Gm-Message-State: AOJu0YwcOLTQd1B4QdvxwPGH26QryNNdIb0gvM4W6BwXcbfamJXWf5ip
	U79FgO8R5pXYXn7lFDueUtGKyCnh10ha2z/ykaTnCN9d2j0Umk7WDvvAVR6AJgrdsApqJVrRvuY
	7Y4dc8INEnpuqRAKNy+VlTqYzp9DxWQ==
X-Gm-Gg: ASbGncvMT+tX6Mx59vULiLwfxe9gefS8Qn7pHyuoEeR968my2A3oS8Z8SE8pGoSEcUU
	DHrV3firL+7KBC5vKubANOUbCT1LSmWhMff9W41y6UBSAoyJcVR6t1LDwUG0k6LgaFoMm
X-Google-Smtp-Source: AGHT+IHqQnod+WLMTaza+oYE9/HZ2z8HLcXB/MzbtBLsKVq4Jqi09Mbkpt4Wcf/3+HNCWqrXskcu8GZwWbHmP3/D/R8=
X-Received: by 2002:a05:6e02:18cd:b0:3a7:81a4:a557 with SMTP id
 e9e14a558f8ab-3c2d65e508dmr468450635ab.24.1736197263407; Mon, 06 Jan 2025
 13:01:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102183232.115279-1-robdclark@gmail.com> <76b822f0-c4c5-4d47-8e0b-c1eee513e228@quicinc.com>
 <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
In-Reply-To: <48373519-2867-419d-9f51-e7bd330b311c@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 6 Jan 2025 13:00:51 -0800
Message-ID: <CAF6AEGtNBoWnLA_dBBC-4U7DrWLO+hM_-9iraXgc45Aj885nCQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>, 
	Will Deacon <will@kernel.org>, Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>, 
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 12:11=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 1/3/2025 1:00 AM, Akhil P Oommen wrote:
> > On 1/3/2025 12:02 AM, Rob Clark wrote:
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> On mmu-500, stall-on-fault seems to stall all context banks, causing t=
he
> >> GMU to misbehave.  So limit this feature to smmu-v2 for now.
> >>
> >> This fixes an issue with an older mesa bug taking outo the system
> >> because of GMU going off into the weeds.
> >>
> >> What we _think_ is happening is that, if the GPU generates 1000's of
> >> faults at ~once (which is something that GPUs can be good at), it can
> >> result in a sufficient number of stalled translations preventing other
> >> transactions from entering the same TBU.
> >>
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >
>
> Btw, if stall is not enabled, I think there is no point in capturing
> coredump from adreno pagefault handler. By the time we start coredump,
> gpu might have switched context.

Hmm, we do at least capture ttbr0 both in fault info and from the
current submit, so it would at least be possible to tell if you are
looking at the wrong context.

BR,
-R

