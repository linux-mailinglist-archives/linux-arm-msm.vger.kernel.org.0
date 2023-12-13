Return-Path: <linux-arm-msm+bounces-4484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C8D8106AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 01:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BF8E1C209D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 00:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5349EDF;
	Wed, 13 Dec 2023 00:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ObEZ3nsp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C62FB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:38 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50c0478f970so6639848e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702427856; x=1703032656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Qy64QWxJAPVkUwYgcUS97lSr6WwyxeboAAZZoCa+8s=;
        b=ObEZ3nspOTfIWVT/ZZyKQIt5mZ6hfK0U8HUQv2NPgSbwhVHaSHp/PVObwxa8ysJLiD
         3Es4B9V021hl8bdaHFtBIZ6A0PvKKl5LXZWnyfeCV3amWChOyb0E+Z8DUWOr2YfDwgOM
         wbkDyOcNUHEyIjYBa6vbey4xc0wL9WhUIxPt41fAGMHFM62c92YxNEVvsha0bKbsta1L
         NQHfnHMj0RD4Hacu5mDqlpBFQZCewKnDeg0sWLnsrRSG0xVPz606fOgoEklrnqk6W/Yd
         n57P8VXoHoPxLZFx8HDmRyA7FMzWxivkJEWoyDhlHjPCJxhcgG36EROr08dWJNrn2+kt
         ka6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702427856; x=1703032656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Qy64QWxJAPVkUwYgcUS97lSr6WwyxeboAAZZoCa+8s=;
        b=huQfExfhVLFfnY6Dzqz1l+wYWfqHEJLGmbIi/7ApK9SlsI6/bgLi7f5YVC3TG5p0w/
         7KwBrTRWoAMQNH3MwwBz8/or5you/pMAPt9G/kNSrSVezVSIFeA1yz1+sRPwZZdM1zPP
         ZwCz25ZKoXUNcMDsVqU+DMjHqYlEnZpXpdk6lbCRSuoXlOXXcDLjktll1Ty71GBY+yrL
         Roc9x7ULXaWnQJXteuFcmfuRJR4Np4AZ4OtYi2PDlJezvj8u7/nKxOunl/pvbacjiNrL
         RcWE3ZmJD3DubNah6GY+P0nz15cWvzRF1jjoXDM/Jfg/+HWTi7RqlwEivr2RceY07mWo
         rWHA==
X-Gm-Message-State: AOJu0Yxb2IT81vKi2yDur+g3aI3OZi4NhFN3sQtJ1pou+L8pK4sHljiY
	6HnyvLXMElm8lWac81FhCoS/PA==
X-Google-Smtp-Source: AGHT+IHQFt8OQIXxdl03CphfReY+l9SomhKym2TaxIOF+GkTzz6HHzUSRNBIZeYP3zSDGey6ZCAOVA==
X-Received: by 2002:ac2:5f46:0:b0:50c:14d6:ebce with SMTP id 6-20020ac25f46000000b0050c14d6ebcemr2634065lfz.54.1702427855498;
        Tue, 12 Dec 2023 16:37:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 16:37:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/9] arm64: dts: qcom: sm8150-hdk: enable display output
Date: Wed, 13 Dec 2023 02:37:28 +0200
Message-Id: <170242755505.12964.13391263979827367977.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 10 Dec 2023 02:21:23 +0300, Dmitry Baryshkov wrote:
> Enable display output on the SM8150 HDK device. This includes HDMI
> output through the onboard DSI-HDMI bridge and DP output on the USB-C
> port.
> 
> Dmitry Baryshkov (9):
>   dt-bindings: display: msm: dp: declare compatible string for sm8150
>   arm64: dts: qcom: sm8150: use SoC-specific compat for RPMh stats
>   arm64: dts: qcom: sm8150: make dispcc cast minimal vote on MMCX
>   arm64: dts: qcom: sm8150-hdk: enable HDMI output
>   arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
>   arm64: dts: qcom: sm8150: add DisplayPort controller
>   arm64: dts: qcom: sm8150: add USB-C ports to the USB+DP QMP PHY
>   arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB host
>   arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode
> 
> [...]

Applied, thanks!

[1/9] dt-bindings: display: msm: dp: declare compatible string for sm8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0d196633771c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

