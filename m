Return-Path: <linux-arm-msm+bounces-5920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EDD81D80B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Dec 2023 07:17:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4EF5B21363
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Dec 2023 06:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936AEED2;
	Sun, 24 Dec 2023 06:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WJfr7Go5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C3920FA
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 Dec 2023 06:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5d33574f64eso28638407b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Dec 2023 22:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703398620; x=1704003420; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+yJH4M7lQzSLCFAOCgx/IfyOcjTUsiv4Zv46F5h0xK0=;
        b=WJfr7Go5KmfQ4TmWEvfqliitP1Y23ZV09UWXSvJlLue3yrdMGIixMnOCGfdOsrJ7Kw
         ebbnW1OT8TEL9dKMh5QgI3wYxpLoIejauKTGtJABjEmlrtwsCcpvkpc9A9gkZIApWk+9
         a54mNeJv2PJIS/kUtwHdvXGxlRzZNyDvyq34CGJi4xOF3WFhhRWdYVRxboewuXXGwIlG
         uOPXtI+FB1CAiQ+efgyym3UxHv8uzr5uhK6AgH8p+cyHsIZDk1ydudyNrU7XdYKNFIvW
         SjTUD96EYIagMlxAfdmsT/e74KWXn3L4h7UbZbk+f5mdhjX4Jy0cCgBNew7mDY+h8BRl
         I2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703398620; x=1704003420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yJH4M7lQzSLCFAOCgx/IfyOcjTUsiv4Zv46F5h0xK0=;
        b=FzVMvokjH10d0Z2wlB/49d6TAqSoIiHLYMRn9GP6O5Iysdw+MZEYjKJxzUTLaLS6mw
         nCGOQLFZnQa3gC9FFO6ir5DDgglWz+BO/rkElb2M2HCZk6J61iQTL97vbPd4LUkgI1QH
         /6nmvSyxde+F9cRAqZBqADj4WrG/giacgoM6VFUz/Jlt7SCcHSFOiwF81FsTzr77oxWD
         lJozeMRN31hUEqPpR21MusQCPQnF33qZ3XfsskgU8alEG2iBpc1f3Zid1X1cQQn++NQl
         0XTE8udvq00ebpgthdTuTgLLFLbRFFnKZ3DdFmNsPZWsRGcyKYOJCE8/xx6ZdNMHx5m8
         4lJg==
X-Gm-Message-State: AOJu0YyKc0pJSlKgHJETVi6Ox6+tHC1kzeRhP63TIPll0T/nmO1cy4RK
	NkIGfkM0dNk87v1SDaP0aaHujLVeS8KhPvGkH+fOcbOH/W0VzQ==
X-Google-Smtp-Source: AGHT+IGj3x86AOzKQKDN6TlGAjhfiLdu/m9mbvukDFEOZqq9qJwmmW9PBdR7ggUmuzrbN657Dt2zBN0GOTIL6rnUZHs=
X-Received: by 2002:a0d:d247:0:b0:5e9:f302:1a0a with SMTP id
 u68-20020a0dd247000000b005e9f3021a0amr3308849ywd.95.1703398619915; Sat, 23
 Dec 2023 22:16:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231223-x1e80100-phy-pcie-v2-0-223c0556908a@linaro.org> <20231223-x1e80100-phy-pcie-v2-2-223c0556908a@linaro.org>
In-Reply-To: <20231223-x1e80100-phy-pcie-v2-2-223c0556908a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Dec 2023 08:16:48 +0200
Message-ID: <CAA8EJpo774xzmpb2+72sJ80kmcCqJK-gDfkaLERGgmPeSZV3PQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-pcie: Add QMP v6 registers layout
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 23 Dec 2023 at 13:55, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> For consistency, add the QMP v6 registers layout even though
> they are the same as v5. Also switch all QMP v6 PHYs to use this
> new layout.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

On Thu, 21 Dec 2023 at 05:51, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> The SA8295P and SA8540P uses an external regulator (max20411), and
> gfx.lvl is not provided by rpmh. Drop the power-domains property of the
> gpucc node to reflect this.
>
> Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8540p.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

