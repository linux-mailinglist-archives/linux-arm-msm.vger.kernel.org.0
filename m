Return-Path: <linux-arm-msm+bounces-66613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 557E9B11052
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 19:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93B215A1829
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 17:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99F12EA754;
	Thu, 24 Jul 2025 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xo4HP9qj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B240C1E5B6F;
	Thu, 24 Jul 2025 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753377884; cv=none; b=aPaaCIBeIoS50KJVFYmfyUVbuJesE3XoGIsT4lmTrRml+QLW3P9lpW+FXSZERUWUbgG96T0JbURjt5boA5ATatig0LwK7k4xq8ph5QCioz8LP/UdSn54x53jSYPX1G4pRqkNn/6N7PkVS1IPIdpEoLpSpP+rXQ79auOHsxl7HSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753377884; c=relaxed/simple;
	bh=5v+6sLWT2JVv2tQxwXZrtzOuzBW2sPjmsZrpfsMk3SY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eb/GPlGUT1Y1UURVL5ID1ODdDdl5kcXFKGmRNqv3MyJr5sdCVzsCi+bacdOtHdq841J/AOhCGqyybQepnOrL8fPrzFp7FrP5Dv9JWWvjYkFPsce7E/0qLThevF1+6zHaT96Xa6RgQtJnGKbD2JYEJO8WlsKdaddG1XuMsr0dL/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xo4HP9qj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4317FC4CEED;
	Thu, 24 Jul 2025 17:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753377884;
	bh=5v+6sLWT2JVv2tQxwXZrtzOuzBW2sPjmsZrpfsMk3SY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xo4HP9qj61T/9+5j2qTf6oFZ0LieIfFtww1kckJi6Ypx2BurwTBEMaK+0CHMRuYBF
	 3wptLnCo9IDUsdm1JDkuajyFnqxG719li02ENTLNc4UOMXdwskgFYYfI49UupCv3T3
	 Xic1TD2Fj8XG9QeZebq/Dq2vDKdVoTj7OWj6NXlbN387wJd3YiIo2625YmhmesjYy7
	 Q2w4qarlPAAdwfTfZYsOdjQQQa5/pYZ8UcBP3UmuAHaGR+Sa+NofaEQxTo5ruAu2eL
	 WkhE1+605zNlCeJywNEVkLkJWI55b3tYNbZiSKUk4pqhSzET2nDnMSgiSJONx9xSLh
	 odHExFQISx2Jw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aec5a714ae9so163010166b.3;
        Thu, 24 Jul 2025 10:24:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoUT1WQkGOf1UOsZx8ps7vSSnUCI7RhIyj7jZuaZcL9DBQbSDjPbOKTWaGAOE4jXMqeWftUEe2ZqKIU+K9@vger.kernel.org, AJvYcCXzKS9Jw78/nXCONwzKXOIEZmyMNk2Nz2DEgt6Z6A8IDS8qEzk3at8GEfGsMnXM9dNTwT3AwG5LKfLpUxQL@vger.kernel.org
X-Gm-Message-State: AOJu0YxDMC06pvsvuB10ensQhKAHy4qklIMdW1d3VeuS4rlmBnpI9WFr
	0hI1+1NAZ4tWLOtUykavqjQuPwPwpC4znfuQsm5tJJ95wI67TAwN91iZvFYryBLF8VveRRrn35c
	HxDsE/jrSHsMF7RkSwfUMiOoJ5YtZqA==
X-Google-Smtp-Source: AGHT+IFo55rmjjLqbcaAhGBJ/ERMN7a6ahY+65NfrJ3IaCAqER+bDUI3Z3JrteeZr+zlXqaj2XuM64IibOVOM3hwD+k=
X-Received: by 2002:a17:906:c145:b0:ae3:d0f5:d7af with SMTP id
 a640c23a62f3a-af2f8c508e7mr804806166b.48.1753377880786; Thu, 24 Jul 2025
 10:24:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com> <20250626-topic-ubwc_central-v6-1-c94fa9d12040@oss.qualcomm.com>
In-Reply-To: <20250626-topic-ubwc_central-v6-1-c94fa9d12040@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 24 Jul 2025 12:24:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLviOtUjzyq6Yg5tksxV3ANuxorX7kXcn6ibFi+mPwTog@mail.gmail.com>
X-Gm-Features: Ac12FXwCDn6y_9vJ9au7o-GRGF7JsHqqOrUkXvxuG-gjRGmKFHzrUxOXk3K7DII
Message-ID: <CAL_JsqLviOtUjzyq6Yg5tksxV3ANuxorX7kXcn6ibFi+mPwTog@mail.gmail.com>
Subject: Re: [PATCH v6 01/14] soc: qcom: Add UBWC config provider
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 4:02=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Add a file that will serve as a single source of truth for UBWC
> configuration data for various multimedia blocks.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/Kconfig       |   8 ++
>  drivers/soc/qcom/Makefile      |   1 +
>  drivers/soc/qcom/ubwc_config.c | 251 +++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/soc/qcom/ubwc.h  |  65 +++++++++++
>  4 files changed, 325 insertions(+)

> +static const struct of_device_id qcom_ubwc_configs[] __maybe_unused =3D =
{
> +       { .compatible =3D "qcom,apq8096", .data =3D &msm8998_data },
> +       { .compatible =3D "qcom,msm8917", .data =3D &msm8937_data },
> +       { .compatible =3D "qcom,msm8937", .data =3D &msm8937_data },

This compatible is not documented.

Rob

