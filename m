Return-Path: <linux-arm-msm+bounces-6335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FF3822648
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 02:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 254BD1C21B2C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 01:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABC94A10;
	Wed,  3 Jan 2024 01:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eDE1c2qv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B279646AC
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jan 2024 01:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5f0c0ca5ef1so26685187b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 17:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704243981; x=1704848781; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W6cI8723ahaH5ElyBXblN/4IB61vCE8DgpJGxzSRdhk=;
        b=eDE1c2qvtHt56Gdvik4WQBPepgDGagPVp43MN6v87Yc2GtY8gu7c6jMlVET+r1ZGD2
         sl/oUO+KBer8XyW8GIW0O5yQYz0FKrCzOjIJvs00piWKTcx06W2t5n3PgdLQlRDUqyKq
         z5srkxaO8UVCdgEtC+ko1LBpk1I1E62IcJJBhBnaYtMzBHpYTqkhaF1RGDlLYiD1OSnt
         xd7m2Fmml241XHFw+yurJ00C/nzEf3XiltyF2Bln5zD778+A96GB3SQb97m/3vPP/xW5
         xty2YboT4qyfhzyI1nWXPFdNGimTKFqINss8j1HX2AgbWGMqMPv/Y1DJFHgldg/Z+eEv
         LlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704243981; x=1704848781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6cI8723ahaH5ElyBXblN/4IB61vCE8DgpJGxzSRdhk=;
        b=mdL1cHTlFiDcqR0Y7LpjW6yvy8HsLP9Q4MJP71DPcMyqxO0/aCjBtyipJi+hlpNH/w
         e6dqnitfF22khWNb10WeFwjkdtNnAUpRm5LDiugQjVciuf0tZ2xsRds5tu08fIYwmVcN
         ynt7ufX5lpMOmNN4T1Nz0S2QS9ysw+Ge04C/P5IaeBOmUMdOMBD6dLdGjU+mrj7Hm52S
         PJjO+omPFYCqMqbC4SWxKbPUqokmGIuadrw7Hq8VSob/BTbh+u010+46G0NH1V/SRvMX
         7NXHmTdosaIP0UHed5OH1ufrknei9BNgT31KaAKQ54GvicC63L9TVJUbd8kMVccgDGoQ
         wnPg==
X-Gm-Message-State: AOJu0YwoLlz6/p5NSSwjxTWwy8TLF/TEOf786QnBrZ16YFh+25wlWlYv
	UhswnFBUf789Ot9mmqsLicZ3pd1ICNeMqYVsWtTTWvApwiHcwv7/QEerbzMWQpQecw==
X-Google-Smtp-Source: AGHT+IFiiVpO2F7K3LjhLzi+FA9HTTct8NS0IrYAdu2NKhkuYAA+Mzn8eTpxq6f2HM4k8EZOec+WbjSB8ARnpVxOPTU=
X-Received: by 2002:a0d:f084:0:b0:5e9:f386:dd63 with SMTP id
 z126-20020a0df084000000b005e9f386dd63mr13166451ywe.39.1704243981584; Tue, 02
 Jan 2024 17:06:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-topic-gpu_cooling-v1-0-fda30c57e353@linaro.org> <20240102-topic-gpu_cooling-v1-5-fda30c57e353@linaro.org>
In-Reply-To: <20240102-topic-gpu_cooling-v1-5-fda30c57e353@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Jan 2024 03:06:10 +0200
Message-ID: <CAA8EJppJeWObQapP1zxwt3gigF5bAUdxm=2YFDw63=TSYDdKEA@mail.gmail.com>
Subject: Re: [PATCH 05/12] arm64: dts: qcom: sm6115: Hook up GPU cooling device
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jan 2024 at 15:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> In order to allow for throttling the GPU, hook up the cooling device
> to the respective thermal zones.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

