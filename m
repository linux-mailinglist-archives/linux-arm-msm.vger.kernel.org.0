Return-Path: <linux-arm-msm+bounces-65500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FAFB08F99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 16:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09E1C18851D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852432F6FBC;
	Thu, 17 Jul 2025 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RDacqTM1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87D32ED87A
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 14:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762972; cv=none; b=KzmATZWxpSByxjn/Dlu9DScQg5EPYXpZiyhDSHhFVEYcxSOmdw1QKXoN3l4FyTiJSu7kh1HI+xXET8nLh4LhkNh8XajFvQiU1RGY9nVhMa56a4OrFX2RvR0ZpRWNKWYDqG115TgFktLQMKFEuF8WnM227CHPbQhW6P+MRnPtAIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762972; c=relaxed/simple;
	bh=ny1BxpwJ+gAFLsYDwALEIo5Wv2OZBJ0SHB8Cu6cHY60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGuJgKZ6Zqy8Z6JOLtwhyUkYXtfy+iiwIJsUu2uuXKhnJ6u5PGLSPHKHM0c8CsY61vJVx4B2PXGO0DtkPapSDmRMZoZcaCD9wzrm+cbdFsCLXBkbiRFXg28tsB1PJOjDaGLWtug/WTw5SVLtcavetzv3hlS5NDUve0r0K/VrM8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RDacqTM1; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55a2604ebc1so1009528e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752762969; x=1753367769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ny1BxpwJ+gAFLsYDwALEIo5Wv2OZBJ0SHB8Cu6cHY60=;
        b=RDacqTM156otUAtjNJ6NoWDczXDxYnMU+CJ/w7Q+kpxdQLhHey+klzTxyabRC+WUEz
         h7t2UhBJhjtIsBeLzTCw08DOXTmm01nyULxJFmBrl84oRLx7ZGh44NmlxiUsYhv6Orn9
         Otgwkmm5J0Y3rTNgBpEXkjMlxrwjH6TV5W1hTahmZfs6U8kESbxTMbWvnlmBaY9d8pPz
         vS6TC5KS7qd6+fjxThpW5Uvs7J3ngNKrnCW7ubeck/uySKE6H0mXKOrHbCjW49HOYFXG
         V+ilQFXKoRBpvj5r2jmE7kuZs2tGJNygSaTc02Zt4aZS0qKtEjWeaNjH95L7o4ZpFVe7
         mj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762969; x=1753367769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ny1BxpwJ+gAFLsYDwALEIo5Wv2OZBJ0SHB8Cu6cHY60=;
        b=XvSvBeCe2BS0E50MSXdT72utUNAveAEGc8dbkJ5sfPI82inMP0J796SKNwOZuyF4+U
         LhF3Vx9ZMRzzZO3dWIULRP/rC+fntzSSzAuagkWKADmtH7PN1gIhzEzwWWej24lSVrFq
         vTp27a7FPUiYaebtzOyTU58LMyxX7wywu/uJNHp93lBbtBWA7FYQ7mivHj8oM+jMlbeA
         Jm116cuxgWn5Tiheifg49in95RcR8ba2nideiJv6kU8yobGR08i2CihgaYi38O/aBPIq
         aey8xj7oJ8b3Kkx/CbEOqkIb1ETnF81yahjsDFZWVJ7cFEO/DkMdrVbmmZRpRQuqEkGG
         LgNg==
X-Forwarded-Encrypted: i=1; AJvYcCWHTAPDc8VavaS5cyv48Q9Tm+wETNInEr7/YAj/Iz1cKfLwAY1p6kQ5xzdGcIyEnzt27fBppmuOGIOw49jg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf7BY+mPM1dmfP6R/6XAuD+UF18xdoBgEuzrBuNF/mDn+V8+3w
	cZqTayYC7UacnmMl4A+kBXd5wVs1mB7tN4hhlzkw4FVExpabCxGztp3u5bsAo0Zw6sL+qZjqdml
	ZJ8NYLz9FBZUeg8hl8Og9rEX3NwTU3mAlfrb9VrLYJx1ju69Vq1BS
X-Gm-Gg: ASbGncvqyF5NLgB4zRUbQCsLmomQ/Ub8U9wMgvNmmYha2NcAoow/iAcV+bxEUSnQuRI
	mI+b5iaEVKuc3nQQ85dkThrxaSJhvqqFY95N6xkGwlCVuRk7BToBZPbIKGScHgjuQ24FVmu1QV4
	Pbl++NC4vlJTyeahRgFjUjh7O0mDvrNfgw4XZLBE0umwQcVFwVtUPJhFLA/HU62TUYhNbmKH36I
	kK8pQ51nqepUExgIzaaXnUgykWoI76dvvQx1KQ=
X-Google-Smtp-Source: AGHT+IGjl+IjWtSow0sNLT+eDGz2anPMKy3xAT4nehVSKgzWbZzJ9LXLTECN4HkXrMGqD1WGIZl2+8KPUCZyseARbVg=
X-Received: by 2002:a05:6512:b98:b0:553:a60d:68a3 with SMTP id
 2adb3069b0e04-55a23f0b81bmr1812465e87.2.1752762968763; Thu, 17 Jul 2025
 07:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717-fix-rpmhpd-abi-v1-0-4c82e25e3280@oss.qualcomm.com> <20250717-fix-rpmhpd-abi-v1-1-4c82e25e3280@oss.qualcomm.com>
In-Reply-To: <20250717-fix-rpmhpd-abi-v1-1-4c82e25e3280@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Jul 2025 16:35:57 +0200
X-Gm-Features: Ac12FXw22vD-hbFh-u0btfg0jHk5nii8D4KA4wahfweHWkbcoH7xxCz4FWUk7vY
Message-ID: <CAMRc=Mff5Yczwq=LTPNYkFAxh6D-Zt6Za9y3eLkVXfhoKdxkKg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sa8775p: fix RPMh power domain indices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Ling Xu <quic_lxu5@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 2:51=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On SA8775P power domains device doesn't use unufied (RPMHPD_foo) ABI,
> but it uses SoC-specific indices (SA8775P_foo). Consequently, all DSP on
> that platform are referencing random PDs instead of the expected ones.
>
> Correct indices used for that platform.
>
> Fixes: df54dcb34ff2 ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP=
 nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

