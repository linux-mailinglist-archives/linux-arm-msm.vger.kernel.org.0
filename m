Return-Path: <linux-arm-msm+bounces-21599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD78FB228
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 14:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66DC4284BEC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC4E146009;
	Tue,  4 Jun 2024 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ga5Ft538"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B89145FF6;
	Tue,  4 Jun 2024 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717504038; cv=none; b=WC5MFiRo9TFgptmAL5CEdf1+WHtTfwGcH8Q9M0Gp5i6nP5FiICV0RlXSypaxhfiH8B9SuKLWOkpC3oqZtFpOm+AfB5IF1txUGFYTowgFYpIfEQaYNd0yDvJcIlGPCE6v9VEVm22QBiKYc8br1+1bj3oTNiezObH+7nyu+xkowZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717504038; c=relaxed/simple;
	bh=PgK7pQO8oZO3qtbfhUxgOeJd0wc2pZohOX9nRR/3LWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQ9Y0eWC6dEZ/aXlHVAosulpt+8ECYsIR0/9m6AHHqKEwUMZJyF+aPGDPnt0I/gxlgzt8tpR7A4vmoPBrlyKIdCnFo2L8fFOdayRtMXz9BC/IhmT9GsBTfugIvCNkhirmxZstB63COaNHSRqIM1yzS94aD7aec7fjhhxvHceY3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ga5Ft538; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6c4926bf9bbso2807065a12.2;
        Tue, 04 Jun 2024 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717504036; x=1718108836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWBz78Abu0CTj2Sphj5nhGk0PlgynOAQxXUthSgBAMQ=;
        b=Ga5Ft538dylQBgfl912uFS4vEmB/9BB1Yw64gxPmBB58e4Ixs7eS1K5kusMHHGR3YJ
         cTSqJp9PIM0uY9KqAEc+ft4PCi5O8JbjBmWInSQbc0lj3Klvo2Lu9GYLS6ptf7/6euKi
         7kn+GrQqZLxrjR50rqR7OPjeOoN4AsgTf1KEb1N4koChKrfYdP51vRjc1w35TJOjAELy
         YjifW0pLjGDO6zBOU0G6yOqEHrGbjQ3Vejwt7MqJkFADq/0WPx+Tf4gxF7Juby+uOWXJ
         MIL+VfMhAcbgpmvWiQWjPCPe7EoYGp6mHvhZLfBaoKtUZ0fBnHCRoBhtNO4sBP5zk7H+
         tsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717504036; x=1718108836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWBz78Abu0CTj2Sphj5nhGk0PlgynOAQxXUthSgBAMQ=;
        b=oWJVLtznOQdwbWliLL7bA/N3SjtoKtOg3NkZ0OuO6I3kGafFpY6I40TZyd63kOcDFy
         vIaZh6fS4a/b+DyBLpELnug2g5zBt2rpShIfW6rT5E5Yr86O1QOW+9WGl5WZ/uRMiFcv
         mozIbc6MHM9bPuE17QwpI17FoS+PCRuYgesPahLOMI3RDx42oLBWyZIv2tE5EdeuL+EN
         Hv7UBHoswlMkU3ehUILwfr9XqacSRWKZt2H6uQ2VBbCL0CPavQ86WQDRI1QGfUXn89hz
         B+ydBs2d9FFivszhyj+oWh9sY+zS4HyrIOXtaNS4jGTgoy8nf871wi/nAmI+fQZvG4KR
         QamA==
X-Forwarded-Encrypted: i=1; AJvYcCXLxn+ggFiyH9dUI/fp1Deq5VnB5P08v2oTN/I1kkLBoP/iC+VMHCFU4T04BNyDoaVUmpjiFv/0A2z5L3zOlvQEeoP1LqOkCeM3ncQzdWiZsY75815yL1Y2IeUq7ZbByDVb5NCAkmSUSnKx9g==
X-Gm-Message-State: AOJu0YxIgfTDOCoko/KPUBeltf2XgKiHYC4HoxodjIuBs3or3TI5vor7
	NRdQf5CIEcLoykskhOG8am64SAPm9BAiRjvPS8EA+KLaSi8yVU/dg7yZtJkPaguMosycCUHtwW2
	qQOJVh/bIOL0Z5LYklad4eL/ysGQQUXgABVU=
X-Google-Smtp-Source: AGHT+IFK/4dyXU3onorVfBIGrQ7RGbLlCzZrBNsv8DCE6538BNa55fpTJA1mERcBai/KbPLJggqRDcYyI5Nfa3Vr9kE=
X-Received: by 2002:a17:90a:bd18:b0:2bd:f439:546b with SMTP id
 98e67ed59e1d1-2c1dc582296mr9121768a91.19.1717504036018; Tue, 04 Jun 2024
 05:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604-a505-v1-1-82ee1c04d200@gmail.com> <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
In-Reply-To: <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
From: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Date: Tue, 4 Jun 2024 14:27:04 +0200
Message-ID: <CAGsSOWV=i2JHsYNvi5EC6q=NoD8v7SiTjbVQhTDLNw35+irTCQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add support for Adreno 505 GPU
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 1:55=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
>
>
> On 6/4/24 02:20, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrote:
> > From: Daniil Titov <daniilt971@gmail.com>
> >
> > This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MHz),
> > SDM439 (650 MHz).
> >
> > Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> > Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <trabarni@gmail.com>
> > ---
>
> This all looks very good, just a nit
>
> [...]
>
> > +             /*
> > +              * Increase inactive period to 250 to avoid bouncing
> > +              * the GDSC which appears to make it grumpy
> > +              */
> > +             .inactive_period =3D 250,
>
> Are you sure this is actually necessary?
Every A5XX GPU is using the same value, but i have never tried with
DRM_MSM_INACTIVE_PERIOD.

>
> Konrad

