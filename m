Return-Path: <linux-arm-msm+bounces-6341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 764CB82265D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 02:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24DE1285285
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jan 2024 01:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1106110D;
	Wed,  3 Jan 2024 01:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qwC8abFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F52ED3
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jan 2024 01:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5e89ba9810aso78258627b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jan 2024 17:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704244101; x=1704848901; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kQZx6mFOYirIUAArcj6mBKkjCVrYW4c3EknIHib0Ab4=;
        b=qwC8abFTqjtWgxswQDXrJb8BziM9tRW3dKZyQ/eENex7LDu0L4eHrKH3xjil9F/aAD
         8yExgZQeKmAc/I2gbOEJowKI5k9QxxxvPwQoLCmykI5z9U3jYUC9/DkfBI8vN3aY8pHj
         MLHTYFgLa0KZdBwxiuDedG2wJRLYC0I9HO9SpsmlRfpU6kIwQB1zTk+WDAtjmcTQdFdx
         sfZlkRqADcFyPguZKNI/omknfuZBhJnD0ZkF2F2WdQikH2p4n3y+hib6fFaHiM/qM0ar
         IfdfWcZQBQa2UQNWVFuYPo3a7ELrNyWOkmMBwpKYSUVQDVDk0U9J3Gchz3TGhpiW6QK3
         FoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704244101; x=1704848901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQZx6mFOYirIUAArcj6mBKkjCVrYW4c3EknIHib0Ab4=;
        b=mYtlJ3u9VdLNdcyrpG9HfAncmF16ucqKuJ9VSm5xulUyFsufUovSuFPfqao3SEKXhi
         3fktLY/eYWBwGFLQU2KNiCTNl+3jEpRecSw4QAq6zLoDebdnMFiPsLuNMLfLCgzF4gJJ
         1cD9mUBepKsJK9iLxWaDVuVUAwb8rotsdiiZ+LFGrbsUv0uYqfuRsec0NpGkoYvNBLTa
         Ibc9ZVWhhbZjZr8w4KmHKBA0PZDL3Wu0vPgEukVVF3B6jR86muwmnPJQ086hCR19az9t
         kYNjIPFzYcAFht7oPbTZJ7W+EpzbsO+7+ZULkVil+B6RUjPwXc+cw70G3fzn5jGrb9h6
         KpLA==
X-Gm-Message-State: AOJu0YyoeCJUkngpMJqdRZoOoiXAADXmHHXnDIK5Mimzo/Ei9WOgieB+
	MSrIOciO8O0o0urUrUqEdyoBL0MN3mBzUEKcnsgYHTI7IQgwGw==
X-Google-Smtp-Source: AGHT+IFLvYmlISArL8/w0L24/AWKtV7noKnDHAvcx8j6L6HiRiGyB5/Lo6NZnVbibRNZru4dx8wEQgiFkgLuIiFLimA=
X-Received: by 2002:a0d:e60f:0:b0:5e7:731f:cbfd with SMTP id
 p15-20020a0de60f000000b005e7731fcbfdmr12950767ywe.42.1704244100985; Tue, 02
 Jan 2024 17:08:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-topic-gpu_cooling-v1-0-fda30c57e353@linaro.org> <20240102-topic-gpu_cooling-v1-11-fda30c57e353@linaro.org>
In-Reply-To: <20240102-topic-gpu_cooling-v1-11-fda30c57e353@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Jan 2024 03:08:10 +0200
Message-ID: <CAA8EJpoZkAExZmhxOpYy7E5s_iu_N_eA0ZkXQx8_s7B+kmivZA@mail.gmail.com>
Subject: Re: [PATCH 11/12] arm64: dts: qcom: sm8550: Hook up GPU cooling device
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jan 2024 at 15:38, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> In order to allow for throttling the GPU, hook up the cooling device
> to the respective thermal zones. Also, unify the naming scheme of the
> thermal zones across the tree while at it.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 57 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

