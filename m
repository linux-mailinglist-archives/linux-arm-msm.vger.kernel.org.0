Return-Path: <linux-arm-msm+bounces-24141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7806C916F07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 19:21:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 224F81F2295F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 17:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02306176ABE;
	Tue, 25 Jun 2024 17:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZO2LjxV5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E24E17554D;
	Tue, 25 Jun 2024 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719336105; cv=none; b=Lw28Em1AXwQh9+Hy1PukwiQ021pLgiYy/pcSrMoGrXHqeid25OE9U/37yW8Zig8zwn2FkhVg6R3C3HbLeamzE3ak+acXdaZG114qgiH6AgSZ4Ojph3X7J/j7muX6U0vatqxPHzIjnhehWROrC1juNijNl4qppSHkWfsHc7aEHrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719336105; c=relaxed/simple;
	bh=s8KbmMcm4KLYRhQkh2vJq5ToCwm0f8AYwsjrhCzNrxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0gHbxIf92w6JCBXxh8blxFl7ygF4lOoZNoIcO6drIC39HueBqg8f4VfaxU4ex5cdoVI+jzPLr2m8n+Zs/+6wNUgNPhgalQ3+1vcysEhaGgXoW6SBXnzG+nC7JphAh2Dnt/G2WibZm6qzYX+E7S5/Dn//U8w6lTL0qZFW9U5hhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZO2LjxV5; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57d046f4afdso3085746a12.1;
        Tue, 25 Jun 2024 10:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719336103; x=1719940903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PF8X3EVfaOc0m47BxMvYz7nb1AddbCK1NzyBkiDSsiE=;
        b=ZO2LjxV5R5HCQX5oxnCcMyZB6f3Fr2P9J8ilPfL6g/DfwUBEzOQKeIdoBPvvxE4WiW
         EwCk7XIHxZD4BTygb/WyTMx0pqeOa88V34yRw0JmitSM58dQz9uHkQsw7inC4Y87ReM3
         kapX7O2BAfFq+Ua+0KCOWyONmkXRlhM/2bIzMabegkjyuGIAighxSWfaExbY02QLpXHt
         O2Q/1fGR3NSsy6gLMX3o8RD8BpmbQ8FNEf6x9lMzToWP00xcDnMwqhMlTw+SMLRvDcYS
         GHKGFvZSiYrrpz/Q9JKE/yboXdMSxnoYe4UbY4VkpL0+XBlZcmd9gNWKQdWyYa2OMn6f
         b6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719336103; x=1719940903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PF8X3EVfaOc0m47BxMvYz7nb1AddbCK1NzyBkiDSsiE=;
        b=cdjdF/pwJ8O71ejQno8AfSLkXmnxylMhyWLPdkeJ8WQvpdGnrkzc3vDPrhi/uLyzse
         rmP8cGXip/uXylxF49amryrei7n0T7OjRZ7mZ8kbZyMhBYWTuxS6gWTQ4iaqK2vvp7jg
         KLIf81CNfLNiV2goO21bwM+qScUJmmR/yDj86qUJ9kAxX1W67W55qQJh2cKs5c33q6e9
         a2f5FDXusGq8hx9ZMQhUDTlC71c1CGUXMz60ht+ciqCa6Mhc842eSaqtKuK5Pb62Y2ji
         0VXZ7h8cGJokhOGOt0IcPQD9bDpdPkh5KQdj2FygZpaalywbObv3hivOie7k9B9XengQ
         oSMg==
X-Forwarded-Encrypted: i=1; AJvYcCVUh9M2Y0o77AvYc7w0csWb5mlUD3Oc+z8xsEiMDXxy07LH8kD578nCrBmUIqFPKQQ0G2DHsycfeTVJY/fz7dEPI/FmVUiAwDinoELxvG5iPsXfo174BdEfwJoN+6PFxrg4ZOgq7g4b6aXCoueKFkqT5iv6J+iXxOuB5bx3jvXgBmKRmnv6N50=
X-Gm-Message-State: AOJu0YwqI8HaKKwV/IA9Xf1RqCOJwMuEscUGi75U6OYd14UQFFsKUOs5
	j9RK3vkprhvCvbE5bnrrunH/YqbedM8+MJowj1I3mFwVUJGY3N0KAEVpQWecTk8HKGwXie3CZ9t
	V9dAwaUO05gungkpeUAkOvlhGeRE=
X-Google-Smtp-Source: AGHT+IFeIuyJQKXKtU7lWnptJ+g4b8NhOfTie3eIuQqqinLgHNlVbZ9//tdM3Vu2irFhjN3um1vvb0W6+8VMOyR8YoE=
X-Received: by 2002:a50:cdd2:0:b0:57c:5f77:1136 with SMTP id
 4fb4d7f45d1cf-57d4bd8fcf3mr7296749a12.24.1719336102439; Tue, 25 Jun 2024
 10:21:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org> <20240605-topic-smem_speedbin-v2-4-8989d7e3d176@linaro.org>
In-Reply-To: <20240605-topic-smem_speedbin-v2-4-8989d7e3d176@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 25 Jun 2024 10:21:30 -0700
Message-ID: <CAF6AEGsqv3c8EfBK_CxP7Xgoxj5w6n+XdHcGMC8HxrC8C=D8qg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drm/msm/adreno: Add speedbin data for SM8550 / A740
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 1:10=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro.=
org> wrote:
>
> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index 901ef767e491..e00eef8099ae 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -570,6 +570,10 @@ static const struct adreno_info gpulist[] =3D {
>                 .zapfw =3D "a740_zap.mdt",
>                 .hwcg =3D a740_hwcg,
>                 .address_space_size =3D SZ_16G,
> +               .speedbins =3D ADRENO_SPEEDBINS(
> +                       { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
> +                       { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },

Did you really mean for these both to map to the same speedbin?

> +               ),
>         }, {
>                 .chip_ids =3D ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
>                 .family =3D ADRENO_7XX_GEN3,
>
> --
> 2.43.0
>

