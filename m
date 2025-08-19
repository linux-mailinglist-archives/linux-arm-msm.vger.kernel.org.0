Return-Path: <linux-arm-msm+bounces-69684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD82EB2BB3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B95F03ACBFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 07:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D779A310652;
	Tue, 19 Aug 2025 07:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ws5mb4QT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE403101CD;
	Tue, 19 Aug 2025 07:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755590308; cv=none; b=d+thEcsSlF7UpSc7WNRZvho8tfvs9Z2TZFphFayzv08EvwYODSCwrnUvUZqZPm7QPcPZXvorWBBQmx4qTtPZXVZ0SgS1ojzrKa10nq2CUaGw+CWSdf9CIW4vqvPUlkJcnIy6mL5fCJg+AUnjF4XtZVDpW0w98cE0QBsYGe9jvY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755590308; c=relaxed/simple;
	bh=G3uxvRv13sqb1tePSwKOSqzaqCwgAvdUkA4VrLkckcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFWTLasRXMCd5nxStC/mPY6krrDHcbhAQU1hn0W5qszU6ibAkhcXUgArOg9Txf9FSPd4Hl5a4XZpEpEAEH9EyqllzWW7W0+kciQClPR9PZSFQPg8DsKNExnXbnKd5pBZjC970iLe2cDtMyPCtEmz7Y6GgW1f4W/5yLYrt96RSE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ws5mb4QT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EBDC4CEF1;
	Tue, 19 Aug 2025 07:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755590308;
	bh=G3uxvRv13sqb1tePSwKOSqzaqCwgAvdUkA4VrLkckcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ws5mb4QTOFCKUadhwwChJaKyIXo9z+Nkv/tNoEHUm8TkN9MieGtxMRfqnyNHJqlW7
	 6dKx4z/zUyfbf6LGXPXrv0MZHUt9luQrKfYmCmA72pGqehpcmvCvEjZtR4EeD3kPgU
	 uL0EY2L/bHr8VvWiNxifut0VFeq1FUV1SpZWdYNlJiDQsUYQwJiTONxakYgc++3dPe
	 8omKhHUx0U6kpH0KKjl3984ZuKdz2aAl0Jlw8s8ZeZWAoI8iEAmGXbd/u7cLORf04W
	 1TI04JJ/28+6uKofmVecg0OaHDh4/GAbos7LeU22gE6rWLQ6HpmGbyRIWGXTDvJsuo
	 IuNm+aPPdlqHA==
Date: Tue, 19 Aug 2025 09:58:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <20250819-ant-of-ultimate-genius-fbfa1a@kuoka>
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
 <20250819-qcs8300_mdss-v7-2-49775ef134f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250819-qcs8300_mdss-v7-2-49775ef134f4@oss.qualcomm.com>

On Tue, Aug 19, 2025 at 11:33:29AM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.
> 
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> with same base offset as SM8650. But it requires new compatible string
> because QCS8300 controller supports 4 MST streams. 4 MST streams will
> be enabled as part of MST feature support. Currently, using SM8650 as
> fallback to enable SST on QCS8300.

I don't think last sentence is true. Where in current code SM8650 is
used as fallback?

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp

...here not.

>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp

Best regards,
Krzysztof


