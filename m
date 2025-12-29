Return-Path: <linux-arm-msm+bounces-86840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE9FCE6BA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 13:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC6853002698
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 12:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA761310635;
	Mon, 29 Dec 2025 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBRqOZ3I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857173101B1
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767012005; cv=none; b=O2x3d9cHo5MChlUCX6prp8WDXnCudqfZfFzbOMekiw243a7+JrwWOBm9KjAe6wFpD9gNszWfds6qjuLf2wvur3W6Ip2ubzzAB563EkYPhX50Yc32VipxltF38rRj5C7nmWzjvPI+CBriwQo7UrKUQZxC/3LNHy12qAtpqQ/E3eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767012005; c=relaxed/simple;
	bh=na8fdtccQtGXNx7i8pepErKE1n5e5WlnLO8Yn+fK3ZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVo2HUr4OPfQvUVn5GVIO5m+iuKhKHOixagzxjZa84aJ0Z4HMPpvtBD+5qOBHdqogAjjZ7DxQwjhARsWSxAHuFoOpPCrqPFeLAtV2g5rEt5H7RPtrHNoRj0qmkN/GqlsVUTa7zlwRsdL/0G+irYYU24YSzNgGcRpI+iRvA50Y2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBRqOZ3I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073C3C116C6
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 12:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767012005;
	bh=na8fdtccQtGXNx7i8pepErKE1n5e5WlnLO8Yn+fK3ZY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bBRqOZ3ITqbKN29ar7XFv6Y1G6o/JSSx1rqESJBgyJnwtAL2zNkcu4HqqlhTHw7bz
	 +DVs9ZV6aXrW1NBDid/gFlwJbObcUelP54MHoVvzHBHWbs2HhhBsat4EJJT0c5iphC
	 QQLIa3/dQWg2QyP8cpeF18675bkg+nXNdOSsPxY/NuQxYhCel142pCNJ50qxgYyX1F
	 XR12UAOLPrZqi1gxbfgVlNuAujmlnu5NjceGUB9cS6JnIK+vag+LghiXc8e4S8R3H9
	 jSNXci5jUaM7ED8B4Mzx85zQpsT5/k2XueJy5jrsvIvs0nzXvM/AU2JcTQw5eYqSQv
	 zwZuCKhp2XqKw==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78fdb90b670so48603567b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:40:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU184Ug7sXmNYN52AqkIalY3UOuLo2jVHY7yzH7o8eOat0V4BNhvHCawFLkmtAEtVqqCB32f+3xd/HjhDUK@vger.kernel.org
X-Gm-Message-State: AOJu0YzZoK5gz3dIANfEba0R7DiBzZ1CShSieJc2aFbRhZ1cxNvJ+p8C
	ApA1f4AzWdh4S9zKYKmxKo18ZtwONj9AjHq9xRgvMguFaNWNu7ge6EdCN1y+/vCT2huTjSjuHRj
	rA84Mz0sD7hhyfAYCiLggE5E2UYAVDpU=
X-Google-Smtp-Source: AGHT+IE1CJPM1ECp3Aic0fzUaIWAevOpdqZ/m0oeRwOjevQhJJFuDhlT+7sTL2fxFLBWnt6fezgleEipLHCKXwFl31s=
X-Received: by 2002:a05:690c:6a02:b0:788:1adf:fa6c with SMTP id
 00721157ae682-78fb412e929mr198480127b3.33.1767012004260; Mon, 29 Dec 2025
 04:40:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-5-82a87465d163@somainline.org>
 <CAD++jL=X1hX6kmodcOC3+x-w6t+Vg6XTaCMab-Dn=vHAeD82Gw@mail.gmail.com>
 <aU6XXi2HmgjZY8CY@SoMainline.org> <CAD++jLn0cFtDhg9WFU2LS6g+cLa7ZMzzcHAJ_W9REVHodFYpAw@mail.gmail.com>
 <aVJou4aNqfGATv3g@SoMainline.org>
In-Reply-To: <aVJou4aNqfGATv3g@SoMainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 29 Dec 2025 13:39:52 +0100
X-Gmail-Original-Message-ID: <CAD++jL=nthAEi5A3DvShB2qM-ojpzDmGduM7GsKEpbeL0yGKqQ@mail.gmail.com>
X-Gm-Features: AQt7F2oDH0YmvH5BS4ynnLBstdj4kng_UTIixW0GIbGR8SitLrk_nlb_6iOErx8
Message-ID: <CAD++jL=nthAEi5A3DvShB2qM-ojpzDmGduM7GsKEpbeL0yGKqQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] drm/panel: Add panel driver for Samsung SOFEF01 DDIC
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 12:43=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> > Actually all of the samsung s6e panels are suspected to be s0fef0/1
>
> Just noting the first 0 is actually the letter o.

Yeah I'm sloppy :D sorry.

> > display controller variants, which you see if you look inside
> > panel-samsung-s6e*, for example panel-samsung-s6e3fc2x01.c has this:
> ...
>
> > I think the s0fef0/1 drivers and all the panel-samsung-s6e* drivers
> > should probably be unified a bit maybe we can just create a
> > local s0fef.h file with the above for all these drivers to use?
> >
> > (If someone has actual datasheets for s0fef0/1 that would be great.)
>
> If we know exactly what the commands are, and have their arguments docume=
nted,
> it'd be nice to have these as constants and functions in a global reusabl=
e
> header, but it does require being absolutely certain on their meaning and
> equivalence.

Yeah well. When all we have is code dumps all we can do is try to
split out the stuff we know for sure is shared. Like the different
unlock commands...

Yours,
Linus Walleij

