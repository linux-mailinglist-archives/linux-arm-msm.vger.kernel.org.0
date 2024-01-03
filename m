Return-Path: <linux-arm-msm+bounces-6337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FAA82264F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 02:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93C18B22A60
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 01:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4EE681C;
	Wed,  3 Jan 2024 01:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rLc+TXMC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6C5A4C
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jan 2024 01:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dbe6b3d9becso1621234276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 17:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704244038; x=1704848838; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/aQkSyDYxxyXtIdGLkdKsn9wKth1Zkt3JY0iTBjudx0=;
        b=rLc+TXMCi22bHG05GUv5LNEfl8oLokEwUn64fq4BQzPmYJeWKJtkUUs8y7aqafYBNW
         ekFHmTPhtIgY18f+saV/LojaIBypKDUydRCiR+OJkKbJ207VNS42xZmNRu2faBD7tIBW
         RB6Ov9wO4F9ZjRliHDXL8FQxf9OCvUZm4StlRaj2hXItUGqlnoWnS8JYAQIq5X6AKDUQ
         RF61dPquKrhuZZ9IIV9hQ1Is+7FxYIB1aHNRWXg+N+0IiHeuoFvXnLtX6bOVqP8J1VY3
         YLFmNzrn5PunOXHSIF6SydqQzP34sF887OhDJ8rmknsaFzTM/MfoAfwh/3WV7V+4bwVq
         HbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704244038; x=1704848838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aQkSyDYxxyXtIdGLkdKsn9wKth1Zkt3JY0iTBjudx0=;
        b=bD/UTWCM8p1xsda5PAaMXMFBfpGuLQHkEf3MGzYJzqoSByMWw9fhNpFBQaZNmFoeiU
         rIUvIdaHEgUbhLtEln/XJatvVyY7o8kIN/LvKl4OVxjXkB0TG39d8HKW5/h8J/IvgQGx
         jfr/rEzSVOAOGPjmTIhIJ12Tw8etQLYYaNSeYdxjTkJQafP2cDzCwWKGeVQP1GIc/h5F
         esORB+mk3mfGJRLCaLntMxvl215pfyWxQ5ZPJ0sMzwvwOr8g++UxHuwk8FJRBHdNLWLY
         /9VXypTwJN39yYqU2hulyGEE7/BA70WnER3AB2NgbRCidPlTkPw4bULmy4Rn5A+fCzWg
         NwGw==
X-Gm-Message-State: AOJu0YwSY+0tLPDCjK1hZtxIvNSnhuvJy/7N906HAT8OroZqflic6M6d
	v3YRWL+xQ6LnN5of4+jb4AiddxRqCkuN3cvDV8mSDdevUN3m1A==
X-Google-Smtp-Source: AGHT+IGiVby7LcOjIosGewlO9dNoyK+Yp9nIz7apC4eQYqamH4I8t0vCfs1MCJh06UKB8MxboGNJyKwFtkFHHecx9YQ=
X-Received: by 2002:a25:ade6:0:b0:dbc:c56f:465e with SMTP id
 d38-20020a25ade6000000b00dbcc56f465emr9667737ybe.3.1704244038183; Tue, 02 Jan
 2024 17:07:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-topic-gpu_cooling-v1-0-fda30c57e353@linaro.org> <20240102-topic-gpu_cooling-v1-7-fda30c57e353@linaro.org>
In-Reply-To: <20240102-topic-gpu_cooling-v1-7-fda30c57e353@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Jan 2024 03:07:07 +0200
Message-ID: <CAA8EJpq5VZd=sH6yK1WgRHqN=FteZkYsuiXXeq7Q+GcHqyQM8Q@mail.gmail.com>
Subject: Re: [PATCH 07/12] arm64: dts: qcom: sm8150: Hook up GPU cooling device
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jan 2024 at 15:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> In order to allow for throttling the GPU, hook up the cooling device
> to the respective thermal zones. Also, update the trip point label
> to be more telling, while at it.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

