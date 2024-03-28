Return-Path: <linux-arm-msm+bounces-15578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EF38902C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 16:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 360341C22882
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Mar 2024 15:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BCF80622;
	Thu, 28 Mar 2024 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K0Sgsalk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51358172F
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711638722; cv=none; b=evc3vpiapTx54itjYL5pLEoB3Nzl3iGXS3eTade80XX/ywlv/c2slxPri2bXrGYrkimQDhWQpOxD5vNWcqSZ3s+Yc2iKKbMZT86Oo1nf79ZBEYPzuRT7WWNWJm6hjO0jg/YYtbAcpQ8mOO/0ocqVjpjF52bsj4cLCLb2t89DP/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711638722; c=relaxed/simple;
	bh=4Pw+pFI94Xaxlpp7zHktGYlCAl2z0xnGa/oih8dZYgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSbzw+fVvYA64W8VbB6mEfvH9KY4+UJV9S1p0WFn1UvrmkklYG+KqZ/3Z+EePG9iAOYMlkPESNLn6h9D838q/arYiY5z5UvKGjPJ43Ap7UQyoSelso5Bf7YaWR6pUDY4WlcvsGzFRPDFvMK5dZC/Ogjlbp1ZR0ZC8Lc3udTAAHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K0Sgsalk; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcd9e34430cso1149580276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 08:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711638720; x=1712243520; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K1dRERqIwvawP6yvst+7RzsJv2Gfa3ZP4TWtYVKk144=;
        b=K0SgsalkI2tp6jrsOrtUEBk4vsiHwmRqWTO7fVoOG0lc/f2FOsoyJXSJwFt5N9LYWJ
         OgFKevD3POjo9Qt093Bc5CPHw/ZFi4XlY3fNG2c4dZg6dT2oq6cB2BbMH6PpQRYo7c/e
         JGRuzOzotJK3LxC03d9jC6DDAfRTRU4yH4ew/RruKqxDS4cey6V+0iifKP5kN/hTBtJe
         fzuDZ6MaF/vdn7JcWhNGLIv7dIObgpKM9iYnNjxjphP325BU2YTEwbXO4n6vMfX3YG9H
         2vht0iSadDy9gcZlJrtdc2SFOSs92G+RvSaaX04ZkS/io75llyh7ZZiHwYofgwQ0fnAB
         JJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638720; x=1712243520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1dRERqIwvawP6yvst+7RzsJv2Gfa3ZP4TWtYVKk144=;
        b=pBF60PAevxtyEGuV5S/uE51wZHpPf+nFWrv2FmGzEoeFIAddA5JfwMlFJIJta4AJGu
         IOVsi5Xrg+VmgLKl01WjkDJcFU81u2c6SM98Vb6pAJlH/wuY6T2apS3/qcTWAqbSpskp
         Ckc6ps1WOKS2GJq5h0AbpxZYMxYe5vXCOH2JY/5ukOQyd9+z8524kZQvpE3IjJCfTo+N
         X2Ml7rgaBJ/1063CbJAp7UGXwhYlC2nwkJSz/p3PyopGpDE/EnRXCOk1dPRvvhGX2JwV
         Bj+A2DwfJtVgq+HMMXCwxH3vkpYDwSNPTVTivWtYnVurhCnsVgy0Psw+f1y3LNwU/EqJ
         MSkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfTFCqvnY8v8YlsB7/9wHHJSjuAS/b0JVFS6NXFlZ7kO+epnTGg+fsrFvljU99cg9FGdj792xJgEOHBOMIfdpX7CThk+3Lth9zH07HhA==
X-Gm-Message-State: AOJu0YxbZ12AwZQ3IxDU6ytMGkojhLOotwV9C9L5rclG6L7l2qZIP9ft
	/oCPujBYp7tHP/YVtW2U1qYqJblyFC/sW74RyUtXo4AweBnGYgO4OaRu8Ferap1xtvQ/1tsMZ4i
	ZBwc+9/lwGUPALVbHoFkmt4CovEr5eUYperqhjQ==
X-Google-Smtp-Source: AGHT+IGrkzP9Sxso9Vjo20YSLlSXYjup2Hg+RTtCFuuy76qY0UhZk+SCGzz1Uxer7GzjgHrcr7xJIaioiBDkEDXa2kE=
X-Received: by 2002:a25:db85:0:b0:dd1:7128:617b with SMTP id
 g127-20020a25db85000000b00dd17128617bmr3216871ybf.38.1711638719977; Thu, 28
 Mar 2024 08:11:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com> <20240328-sm6350-dp-v1-3-215ca2b81c35@fairphone.com>
In-Reply-To: <20240328-sm6350-dp-v1-3-215ca2b81c35@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 17:11:49 +0200
Message-ID: <CAA8EJpp1XEh1CR8898HnStWizcgByREGk-2ae_Yr2xTvcrEbag@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6350: Add DisplayPort controller
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2024 at 11:43, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Add the node for the DisplayPort controller found on the SM6350 SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 88 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

