Return-Path: <linux-arm-msm+bounces-34810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C999A2C26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FA211F22669
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B5F1E00AE;
	Thu, 17 Oct 2024 18:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TKXSEj/A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDF71E00A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 18:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729189637; cv=none; b=ugu4joUKqwk6Ians/RyAjU8JtCuTtDiG3UiYZVm0hnLj/Ej0uTAKMHOLg7NJaBNJooCmAF/zO08VEvMeE2k1A16Z9xzL+TdM4KO18RM33FBckhoq8x8BQ8qUCVJQCbMsxbYtmjJ/qRaXRaDh1ZfSWYJzG4wHIYLtOh2RcL3MwG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729189637; c=relaxed/simple;
	bh=hb7ga30lPrrAOxRByClB2ldtT2Wkqy4TGWkBSn5WR44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0mZfM+tgvWklIxYNzOC5R2Gs57XCgTBWk7Xfi1QwR+kgYdHRRh62IJmVU/AXhqEnXuvxNbrwCzPpTHovTY+7muAEi+ApX6WehzlW/J62Rd/LJ4hWoATBk3WAfMAAOCt10T4X9W0PNSkFrmtlhYmWa2dAYbIWXYlDlaJOPApPFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TKXSEj/A; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ea78037b7eso1117887a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 11:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729189632; x=1729794432; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lcOVFkyx88H+mC/bq0EZCpI9upDma/Jw5+qbBpyx8bU=;
        b=TKXSEj/AGcWIlhUScc08S5qFpo6/K2wBUA5pdwy5nNWUDvGvQgC0hszIm3b0naSEMq
         0/UY2YN6QiUhtxHsMY1C5Nau048X/haOzMHyWNiPJNDoz3r5XmsFRVDpM06n2bDwm5VT
         c87F3+aDqYBLfwblLzlZofEHgMUUyzFPJyKLISTRXjrg5Gn1v5+UAM756MK7FN7qQOGK
         HPbnLFIsPFyW3HrqCldgEWp40fMVBPNtALnqWRPNMKT+HHlNl1APc76YwJ5PYTEI1I+k
         u+spmr5jhSc6dZPHufP1b0nFia+X2NS3M6ooC8DHQw1yrpY08hi+JaK4ZZlo8v/QWRev
         NwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729189632; x=1729794432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcOVFkyx88H+mC/bq0EZCpI9upDma/Jw5+qbBpyx8bU=;
        b=M+RohXYeXGZoH4vhfORXbaSeZzU8Zly+YpTt5fPDYObZuXM3+MAPOFjDDe0ycvBm6j
         V7nByPgRQLYIznaDz6FURgiMqpRTYjGmskZd9D8xb0MDiTeRWNPcf6ARlCknAaS3KFaE
         6bhmeF0zMGd93s2lqs9IET+BJUoMiT4kB7za7E0xrlsLQoROyNhyK4UezwNBF71jXPlY
         21sKqSMGJVhJF7db2pmrbIpc/oL2VQVClkDhbR+kdXC1MMuKZi1FKSzC2U4cZkbbgqbO
         G/0+ya8TITUtKqyu1Ks+mmCSK9WultNa100oT8xJ+C0eChUTgNoFtsXCwXpy6Yr9MCXC
         iOPA==
X-Forwarded-Encrypted: i=1; AJvYcCVABaLU471mx63U5d8ZxGWUi2EhDhnmV0zGlh89xR4PVVRfwnpz6LRRtE2VUTDe0Dqh8OFhLySLgMdzHXUk@vger.kernel.org
X-Gm-Message-State: AOJu0YwlSuB2ay7eOtfAGfT4cKT981An3OTROvRiv29rG30CyuROajcc
	dvb3qs00baU+zcGD4chZmXbT2TmKsi/Woy3FktgXERt5bVsYUE7SW+/VVCope2MD5cCMiBSrB6N
	bApo8zWilxBBh0LTd4v+89iX2Clm+ahl6EVcK3w==
X-Google-Smtp-Source: AGHT+IHq42uS45Aa2zsUDZ2QLKAl8iW2NZgItryZE9nh9Tm5rzwutObVfbkmZNaI/67kuCJcXJFjr+dtin3hgfaxKyk=
X-Received: by 2002:a17:90b:1241:b0:2e2:857e:fcfb with SMTP id
 98e67ed59e1d1-2e2f0b09d89mr24643105a91.19.1729189632162; Thu, 17 Oct 2024
 11:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017130701.3301785-1-quic_kriskura@quicinc.com> <20241017130701.3301785-6-quic_kriskura@quicinc.com>
In-Reply-To: <20241017130701.3301785-6-quic_kriskura@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 21:27:00 +0300
Message-ID: <CAA8EJprcOU6qeJvHH+MVoPnQ+mGcos=pDOVBSeSUfBGw-KR6tA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] phy: qcom: qmp-usbc: Add qmp configuration for QCS615
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Oct 2024 at 16:07, Krishna Kurapati
<quic_kriskura@quicinc.com> wrote:
>
> Provide PHY configuration for the USB QMP PHY for QCS615 Platform.
>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

After checking platform details,

Unreviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please perform global s/QCS615/SM6150/ and s/qcs615/sm6150/

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index d4fa1063ea61..c56ba8468538 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -1123,6 +1123,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
>         }, {
>                 .compatible = "qcom,qcm2290-qmp-usb3-phy",
>                 .data = &qcm2290_usb3phy_cfg,
> +       }, {
> +               .compatible = "qcom,qcs615-qmp-usb3-phy",
> +               .data = &qcm2290_usb3phy_cfg,
>         }, {
>                 .compatible = "qcom,sdm660-qmp-usb3-phy",
>                 .data = &sdm660_usb3phy_cfg,
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

