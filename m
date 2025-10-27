Return-Path: <linux-arm-msm+bounces-78946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F8C0E579
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C91819A3227
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0942C30ACEC;
	Mon, 27 Oct 2025 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dp4ar7Wm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9610309F1E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761574312; cv=none; b=qbf/RlMRIfN60KZqzXiONIMZ+4aYgQIMBHMH8VTdIpPgrmWECFaNm3Gm5HlhwPrVbM/r4noXOuDHk3FBj363fBvDNV16lX1HgayPQstiepRwh1hKZ1rZN7SmDF0Hxm1RqkD1SznxZjFSFkEM3aTvAnnbX10s4/aBmzbDnTWFhsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761574312; c=relaxed/simple;
	bh=8pSKogHAV0YCMjRL6oB8JJn2I1t630qC+Zdgt1EdXNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0fPB5izLfOg0WxrDmdnJu1UVLpuqxt01LrisY5lh/JHI7hxuU44ni0dmziz1E+UeJNgVKKFqaGCS2RQMNBwloS+qyiOnOlrJMzGsoVIdk+Dt7kewoWm4OMeV57R3+NYvwzIaFcD7JpXCdgsQdQ6b+3JWIyK9G6Clmymep1SbWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dp4ar7Wm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C74C116D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 14:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761574312;
	bh=8pSKogHAV0YCMjRL6oB8JJn2I1t630qC+Zdgt1EdXNw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dp4ar7WmuEdc4ozF6d8Mnvrz2aoSjAxj7SGB3kpSF18DQ/dYLlG7ogeL2YDXioqhE
	 MFC5Rdf+QYbyTChRkOixVB+ZNc0fTjlmbEYRG29PrQYhcKelByyWh4mg3WOWGIo7Ra
	 UPhkgk6ukoQjYMDzh4q/XLJI/s/DKqmQgn154dAMMPKdjDaTRzhCn3r0wjOS1jiuAX
	 l4bGCxmtwsZbBxgsUIvFkOEKpXENqYQz/r7bH0cFhipBplFKDjZAVHZmIN91/rvCC4
	 HvOk3KQENw+o/RQikHBDGLffJ2tdGex/tAz8+UAsNNIeCGr6BNXrbcp2PcuFxHqv0r
	 B/+6oZkuiJpEw==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so1106261866b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 07:11:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZ6WFlCZ2S1Aw0izpQx2BSYqliH/0T+F3AmsRbURJ5gVMY4fmMnmPWE6+OsCW6tKus+n+KZhvWmkFRV0ZY@vger.kernel.org
X-Gm-Message-State: AOJu0YzZtJ0z2HrzYKkdglwBx9ULabeUAOmF50sC2LGi+mvGqbMWGkx4
	GWVPTgbRBi9iBTLENASb3X3JJDrhXOPUGhBPHGYudpMWUWzC+uEbTCbpdWK6r0+ljApN5Db+agt
	mAVdwP8oZqaALTr/WNkQDlwkMfUWqKA==
X-Google-Smtp-Source: AGHT+IFj8EZV8kIUyITeEbObKp3pkSpn/VEF/SrKqfhWlJrQlAhj3nZehJL5G/aueVs5l/+xNxsm1tQL0HMrR6Qn2y4=
X-Received: by 2002:a17:906:f58a:b0:afe:7b8c:a583 with SMTP id
 a640c23a62f3a-b6dba3f306bmr9821366b.13.1761574311195; Mon, 27 Oct 2025
 07:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813214949.897858-1-robh@kernel.org> <CAL_Jsq+vUNtMw6JS0ac6a8LTdJBB+UepadpDxP_S8vr6QwUiNA@mail.gmail.com>
 <0bb932e4-9fb5-4ee0-bd21-6e30d6c8044c@linaro.org>
In-Reply-To: <0bb932e4-9fb5-4ee0-bd21-6e30d6c8044c@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 27 Oct 2025 09:11:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJHzPUyB6nDaTS87eHysoh5W8o=CefWt6hH8zbpM_aQJw@mail.gmail.com>
X-Gm-Features: AWmQ_bnwI83EeKQTO-531dVAI_XpG-oG19djxHv8cu5QJqGiPGiiOZXN0MqZNC4
Message-ID: <CAL_JsqJHzPUyB6nDaTS87eHysoh5W8o=CefWt6hH8zbpM_aQJw@mail.gmail.com>
Subject: Re: [PATCH v2] media: Use of_reserved_mem_region_to_resource() for "memory-region"
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Dikshita Agarwal <quic_dikshita@quicinc.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Ming Qian <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 4:25=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 18/09/2025 21:22, Rob Herring wrote:
> > On Wed, Aug 13, 2025 at 4:50=E2=80=AFPM Rob Herring (Arm) <robh@kernel.=
org> wrote:
> >>
> >> Use the newly added of_reserved_mem_region_to_resource() function to
> >> handle "memory-region" properties.
> >>
> >> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >> Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>
> >> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >> ---
> >> v2:
> >>   - Rebase on v6.17-rc1
> >> ---
> >>   drivers/media/platform/amphion/vpu_core.c     | 40 +++++------------=
--
> >>   .../media/platform/qcom/iris/iris_firmware.c  | 18 +++------
> >>   drivers/media/platform/qcom/venus/firmware.c  | 19 +++------
> >>   3 files changed, 21 insertions(+), 56 deletions(-)
> >
> > Ping!
> I'll pick this one up.

I still don't see this showing up in next.

Rob

