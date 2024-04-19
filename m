Return-Path: <linux-arm-msm+bounces-17984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC45A8AB4DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 20:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88DCF284C65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 18:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1642013B7A7;
	Fri, 19 Apr 2024 18:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIFwUUf1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E18313B297
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 18:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713550368; cv=none; b=KAjgs1KihVDPmehrVSQH6Bc+Croudp1H0XuJjvE/Ycf+Iut3ul83POUXedoIx5X9Wa5JqqWk0gIPa+y8qYh1We/aEuefSUd40i6JEcpXKMz6BMm/UwgQX5KL8RXbeFSQ9SGswn+JqVBFa+XXLyR63S7KJjUK+Ke2J7wJ99K2S2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713550368; c=relaxed/simple;
	bh=bcFICBmin4/tFtAgRJRkk8O34T3w5c4G9w2ytkNfj7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwKXsyt8r1fmaEBqG47hBsylOZeOJPeFE2Kvo1yVsBKjvlCnQCPfhBMeG02ktEE3wKwV5JllgGohidEObRsNaby3ZR3vd8kUbGjFgcBycsHbqHZ4DczFZ38Y33ud9AFanTwL/pkXeWk5wrkbngYHO5VidB8cR046RXr9p0HW148=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIFwUUf1; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dbed179f0faso2357388276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 11:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713550365; x=1714155165; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lGEtTj/vH2KpXzCwJtz87h7PGuGLo80xWA52Z7kyHqs=;
        b=iIFwUUf1TiG1puFXvwyVehq5MN8pH9cyjsH2Tkz+JA/2ZU7KgpWxD/ZUsutpheseQe
         8TmOyCxXw/9ube9usZ3hSyTV/N5W+c+7fjWg3BTtuXjqtXQ9JiKg7LuY84d45bz+pc2c
         /FrevCRFPV9e3P064c2BZkElqWb+3O0fnkwYLkI8GgWPNxRFYdHDYkwgnTSdiomR/qsh
         cQ5SMK4X6QeXg5+EP/LaJFkvtyk71eAr93SE2iUA2RLIw/3Nu9WAuvddgUK54xcDm8y9
         c3Gqm90i4VWjH/Jv8ThEcMzNEAFDCOFO5YJppxNW5Yh/HGC/ou/ad6LYsNLFjXhGXDVR
         6L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713550366; x=1714155166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGEtTj/vH2KpXzCwJtz87h7PGuGLo80xWA52Z7kyHqs=;
        b=vNVjE6yW3SYLD1+JAUqgctBVY4PrE62vUeQPq2IfybI0rxFL2VyEbyJXnuO6nATjNR
         485UhyaVue1sRR02NHAbv7ozHJO15RqqjxeM06V0AKezgmpYzUQ6EcEcGaAay6jUk+GE
         XhZnpa0pLyIpBHqle5V/9lqTdZBvlFrBivF23ZBPZUkJDr645Y224qc+1YqAZFJ/LMjH
         GqZGL1WVQAblz0ZkKFHPNh+zAmJ+u+03XjqY03QWUsadXbCA6YOCqapMpoUj914DhKHL
         gYrqKGMN92pucAPPl/TS2pSuG0IJI8IX5nGfvbdXBMDhFToh9sXGJpJu1+ocq5kDbET3
         MPZA==
X-Forwarded-Encrypted: i=1; AJvYcCVoVc8mBmPn5a9vXHnjH+5x69A9IyfqQSUOi26Tj/oOQC6iljEdDcdwsR3I4/mT7CShArOfp29hAc2oqX55G6r2zTyUrD45UZ4ZdZWQyg==
X-Gm-Message-State: AOJu0Yw6uSdIaqj8/6Xk7gG9lz9l/5ptwiSFa3Bo/SYscnx6NwGfrkOi
	QkTQrwFhWA/I3ADIg+m6SQfA18BsCAP6aArYUulZlT6gU7JuFra+pkWuI34Yrt3LNfzczwULull
	xc9G/x13hjYZsjx3Ug4GxT/FHKu2k3zNtxYr5Jg==
X-Google-Smtp-Source: AGHT+IGQ4xZAlrLZPCqIX2Z5PVXFtctMByQgz4M8JwmgU34xnfsoRSL8OUzYibOugChD+d3y0VfIk2HrGsMA0Iq2jVk=
X-Received: by 2002:a25:8051:0:b0:dc6:f0ac:6b53 with SMTP id
 a17-20020a258051000000b00dc6f0ac6b53mr2627365ybn.15.1713550365672; Fri, 19
 Apr 2024 11:12:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240419-x1e80100-dts-fix-mdss-dp3-v2-0-10f4ed7a09b4@linaro.org> <20240419-x1e80100-dts-fix-mdss-dp3-v2-3-10f4ed7a09b4@linaro.org>
In-Reply-To: <20240419-x1e80100-dts-fix-mdss-dp3-v2-3-10f4ed7a09b4@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Apr 2024 21:12:35 +0300
Message-ID: <CAA8EJppWZ0uvjHwiLkKFPsEm+0FVF8Wa7zbm=npVmkcTHvEicw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-qcp: Add data-lanes and
 link-frequencies to DP3
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Apr 2024 at 19:14, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> The data-lanes are a property of the out remote endpoint, so move them
> from mdss_dp3 to the mdss_dp3_out. Also add the link-frequencies to
> mdss_dp3_out and make sure to include all frequencies.
>
> Fixes: f9a9c11471da ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

