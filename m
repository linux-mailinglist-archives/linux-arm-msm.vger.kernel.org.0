Return-Path: <linux-arm-msm+bounces-19084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CB78B9003
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 21:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B40241C20DA1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2024 19:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C155EAF6;
	Wed,  1 May 2024 19:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kNZ/Wnwf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9881C287
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 May 2024 19:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714591406; cv=none; b=iOKhmjjbmO8VDKVArG3ROewWme+d9TftsxE9ajX3hjLX8u7kU9TzTLTk4lv4bNKNPiJooU9u0Cs6KmnrGzwY2uSgyQoLnYo+b6YNVIB6VGiDpwCpqiz/LxyHUXIubeKzGsY2VQL3Fc6be5JT62r741bbH76l5nyEpj3jTieuPCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714591406; c=relaxed/simple;
	bh=ZhyoVBBIHgstfRuGDnnjMiKeVhXKdonZKZf22uLclA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZuCXgtYu5VKFDXKlGgYwIk4EuGDoLjSAfYGC+VReVaQNpFjrUtbDk95wPZZs76K1ymcNIgBh51AGM+jbqZqPb09VVVILkiiwDdYMnjZ2lOPoyJPaLfzwcLQDPEF43G2qWAprKTvJaSF1UruWY8yDc1Ie6aHTQEJ3/s67u1f2bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kNZ/Wnwf; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5aa400b917dso4562127eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 12:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714591402; x=1715196202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbubMcULTqXEpjOw1/tNxpjigRY/QT4JGEZ8U1qfXOo=;
        b=kNZ/WnwfrGaiTPmTU6SBE5tY8UuXcFtxn1f3yd5HfTeap8Lig6jMjmv9EOaLJMcWwh
         qecXfY5oDOHeOT8uTPAhYv9y0rSPKDAAhm92h0JHVaSKkficMMPfVXDh759ymikDOQik
         3EK17fKnLkweWkzAzqv9yevHxOBo3gP6/Cp2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714591402; x=1715196202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbubMcULTqXEpjOw1/tNxpjigRY/QT4JGEZ8U1qfXOo=;
        b=gGHqdG/1e3tED998wudx8TrNYHWORB7g0gJWqP3ruyOwOEm98ihlM2x2CWW/D0kreF
         9C8wwSKokHxfnPC1qo7MMo2E7J7N15Lu8Lp7MvDnETJmoS/owG8WNtNjNQ37dHuO5ohW
         XyKogYwyCWqAgrw7KO8yG1NLFWSj0cgyPi/1pxpCOeZWQxlGt8dktySnrrinJo9f8jGD
         v5Ozo9z1qSdyXr9/aBPkYE/xwHsliwqnshA+Y7Q9zELQudefLQOHMIY9+zmXrT/T4t5t
         IX4nSwePhHfmDABCoYjB5goce99JRZnnBA+mhbaJ7F13UPLdFtVmB59YxdYV1w6ktyFf
         Eetw==
X-Forwarded-Encrypted: i=1; AJvYcCVD7w/fN3grjBRDa6ZC2FS8GGxL7RxthEcRPDmofbWbBSW+KXYdVUn3RSjwy4MOf17dpknakfOPFAayUBf9y1A5xadqzNV4ie9/tDAEOw==
X-Gm-Message-State: AOJu0Yy0F7UmvDR61ss+kDLJRs1VddsxOOr1o9gCzKrbYr+tDe3R5y7e
	lqR5/zewsRSUoAr14Hr5ZOIWhJ1czMkuRKT6XluXTfPXguqpkAGpp7uuxvCgPIqqoWhi+EF8Go4
	=
X-Google-Smtp-Source: AGHT+IE+UqwlWT6jX76rWKRApkmyZ6i51iFLcsCaNKUJvIcQ4l+5X6lWHiiwZvxZS3OaxEgXhmfrmA==
X-Received: by 2002:a05:6358:339c:b0:18d:c471:d324 with SMTP id i28-20020a056358339c00b0018dc471d324mr75749rwd.7.1714591402216;
        Wed, 01 May 2024 12:23:22 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id k6-20020a0cfa46000000b006a1006ddad2sm41387qvo.131.2024.05.01.12.23.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 12:23:21 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-43989e6ca42so2231cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2024 12:23:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWJXr+NPZ45jliAYUlFU550jCHUBzOYnm6kP+YNt577kYEAxoNZJnFtoH2EL5e/YRpNrTKx0r79VKMZArLfj6pY93NVxKNDR/gG3V/6iQ==
X-Received: by 2002:ac8:7f03:0:b0:43a:f821:5b17 with SMTP id
 f3-20020ac87f03000000b0043af8215b17mr33651qtk.3.1714591400761; Wed, 01 May
 2024 12:23:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org> <20240501-qcom-phy-fixes-v1-4-f1fd15c33fb3@linaro.org>
In-Reply-To: <20240501-qcom-phy-fixes-v1-4-f1fd15c33fb3@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 1 May 2024 12:23:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VYKELU-xBjMUqLSASC+m+eGCxHCgueCFjxwphxggNAww@mail.gmail.com>
Message-ID: <CAD=FV=VYKELU-xBjMUqLSASC+m+eGCxHCgueCFjxwphxggNAww@mail.gmail.com>
Subject: Re: [PATCH 04/13] arm64: dts: qcom: sc7180: drop extra UFS PHY compat
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, David Wronek <davidwronek@gmail.com>, 
	Andy Gross <andy.gross@linaro.org>, Evan Green <evgreen@chromium.org>, 
	Iskren Chernev <me@iskren.info>, Luca Weiss <luca.weiss@fairphone.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 1, 2024 at 9:19=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> The DT schema doesn't have a fallback compatible for
> qcom,sc7180-qmp-ufs-phy. Drop it from the dtsi too.
>
> Fixes: 858536d9dc94 ("arm64: dts: qcom: sc7180: Add UFS nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index 4774a859bd7e..52d074a4fbf3 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1582,8 +1582,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>                 };
>
>                 ufs_mem_phy: phy@1d87000 {
> -                       compatible =3D "qcom,sc7180-qmp-ufs-phy",
> -                                    "qcom,sm7150-qmp-ufs-phy";
> +                       compatible =3D "qcom,sc7180-qmp-ufs-phy";

Seems OK to me. It looks like UFS support for sc7180 is new enough
that we're not breaking any sort of compatbility by changing this.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

