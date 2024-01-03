Return-Path: <linux-arm-msm+bounces-6333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD2E822644
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 02:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01092B22A55
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 01:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71100468C;
	Wed,  3 Jan 2024 01:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYlZoSrY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548104A27
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jan 2024 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5e745891a69so81734007b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 17:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704243939; x=1704848739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=98A/8V20IKILvDpScKjsN750Bhxoj2OxNg7x93EEq7c=;
        b=KYlZoSrYu3OUzRnxawU4bSey6BsDLszXL9HUn7ZJwdmQZ9eRjGvTQsS1SBp5T+rvq+
         ugpPk0JAUcbEH1Jc2btauWsGJ1YXSU4rw3qHI9NOuchrh+n9hyrsYAPe7s7COxcfKusd
         cLYJVEOz+lZ9eUjW9VLkspzcu1lmY1jfTpuoBiv1HCeVvb/u/tWsDqqv/xhp++7hzl1G
         2t1I5D8NVf1K/mfOWgUWBK2LtX6O0KyhwZo4yCY+mAtDk6EM8JlgCGcCzq+0kH+q7tk3
         bnFGYT8jco6JMvLHGLE354gsOkYPL6uLwj/kdVQaD5iFeJ+mCqHdOJBZCkug8bJ/dpPw
         KsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704243939; x=1704848739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98A/8V20IKILvDpScKjsN750Bhxoj2OxNg7x93EEq7c=;
        b=IwFYffAM/DGprODNDittIQcr3QJ0ewqNbfAzNqp7m3WRtC2bhMD7UB3Yfkh5wUNh9r
         Rptg4wYDrAnY7ANqWlQd5uQL9ghjNwzeWvPnsxLiJLCZtcLdPFsSNEfyo1l87Kunfw1V
         4o9quEF627guwO0dmDKodEE24+kbElJFYQx9zU+tM9JFcC30eUN8XmAYp4/lKLw/8akM
         0LKhEm2iCOhz3CM0m+ZkpfKf9RlzyXn2/HMDLxOQjROiZDGqTH1NYKIcXgqycwmBbuVz
         1UP6mLrBwzU9pvZbZf3H6uMnosXUiV6wAp4/h8vAqN5fjywjy965YnysZmz/RnHz3I4u
         uISQ==
X-Gm-Message-State: AOJu0YwWUFFrRkOR2FgPZ15S6Q4n43yiceOnGNx63c9BtKiE9aAsRtW0
	M4pYOgzJ4caYJg9iov7GwiE8RzB+wCloLM3gLuQzWFeUzPAHRA==
X-Google-Smtp-Source: AGHT+IFcKL9veH0L/w0ddt0luEQ/sh0DLIROaWihyParawpIzWGa6wctaGZ2/KRdqcFnYwnA6JHABBgj49z3GfEWanc=
X-Received: by 2002:a0d:c8c7:0:b0:5e3:320b:7c with SMTP id k190-20020a0dc8c7000000b005e3320b007cmr12412275ywd.37.1704243939239;
 Tue, 02 Jan 2024 17:05:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-topic-gpu_cooling-v1-0-fda30c57e353@linaro.org> <20240102-topic-gpu_cooling-v1-3-fda30c57e353@linaro.org>
In-Reply-To: <20240102-topic-gpu_cooling-v1-3-fda30c57e353@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Jan 2024 03:05:28 +0200
Message-ID: <CAA8EJpqjaaC8UeAxBnxsqa7Q7RysUbAVnix+5tc4Ed-OXjvR_g@mail.gmail.com>
Subject: Re: [PATCH 03/12] arm64: dts: qcom: sc8180x: Hook up GPU cooling device
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jan 2024 at 15:35, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> In order to allow for throttling the GPU, hook up the cooling device
> to the respective thermal zones.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

