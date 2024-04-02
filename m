Return-Path: <linux-arm-msm+bounces-16037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C969E894E72
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 11:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59F71B23620
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Apr 2024 09:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9590B57323;
	Tue,  2 Apr 2024 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n/Q5z29g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B38754777
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Apr 2024 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712049392; cv=none; b=bAMxzDUJbhwCFHEsTImYsBlLVb9WMaLHv14pYJe+BArVImp/hPJpzlT1U8GfPLYc/FjqGNJcm+aPWLJE9gAa98uT1sO/+2kVPYRELnof1bF4R9/t4V1u3JWpkEOQe1KuhpTA0F9CfuDg5XGXDAtkBIuCvQNvLF5UFwwC0+jKqlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712049392; c=relaxed/simple;
	bh=DDyRnVQamRLCS1cqxXCcAOjLkMQNdJEtWVNZoAZwsLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKk4GnURjAmg1QvxZ3J3XszuhzuIFTLBUF+BpPaAPT3ciRzfTJbkedhBgvLVcEDrGd3s/6uYVb86JzEpLtjNpidi4WM+Lo2Hif+vy9rzYmt+cI3W/oev5Hu5/gH9RhP6vgigENaX0fJBWhPNRYRd4MwxLGKy221yT8kMJ9VoZx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n/Q5z29g; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so5236366276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712049389; x=1712654189; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RW/J19q+6ozr61crHNrzeNGIrOeeWwrel26k4kB36RQ=;
        b=n/Q5z29grrHiTX/+/Vy2sZATEoeuW/iP+nYNuP2lb1OfejyW9tAIlc1FRLGJPJBgg5
         ldAV6KKQoF9db4W9Aqq4+xyVrCNDGP0+5wzSvVnCIabsJUTOsfByj7/uyOAKyyUA18YZ
         CaoOQ1aTRt2OaY4tvXYrB4ldtLARp7bwu6XAudiAAaBDnB9Qt6eFUbEsVTcv+uP8Uvx1
         /6frUPezwO5btJLmLJy3yjwsRQGoQBFq4kLi/zPqXOiPUfjO7s5gaS79UBOuywFOurOF
         WoRjVh4nW7GOaePwKGKAvDUegTTg7I1QW4mocM4HTD05F+W+nlkaPBUslWcDTLPpFECg
         UOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712049389; x=1712654189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RW/J19q+6ozr61crHNrzeNGIrOeeWwrel26k4kB36RQ=;
        b=K2WPOkYoJU8c4+U5k34Twb6ybS3ZhVE4gpk+cZka0pjK+qsEKqmjlMWNU9ihyv8dNv
         DkauDMYpUqBMsdbQGFA2MCT9xO0ScH01zIzHJP/OMvhvNZDx4gL7fnk3/GE8hNJg/WjY
         SubcyhQWiXQdwejggA+FMBGF3Bw+W4PAr7knjobtMpxeuhzcd/68reJj5LGOhhg2PWiv
         4bWOy1LJ2zw+RSlQFtAf/YPvBb06wJt3VLhx+0Sl7Jadt9KCJBBI6Fph/ZZKuUQJApu+
         ETTu3PSqeWzVyKT9SxMxbBw9gGvCIaBM5KWfOVovSY6U9CiBZ6rgO6iKZDN7LXYg2ORI
         Q/6g==
X-Forwarded-Encrypted: i=1; AJvYcCWe/mslXtUcWTjyWzFlwjFw8k2o5htfPfnq3FaZivZTwchMgbp2Epuwb+4rw+30f9PfmV7FlcpLvY6xjkepY0txXtYb+aSYBZgNn0ZTqA==
X-Gm-Message-State: AOJu0Yxq3YYuzZ23xJVryI6tomFkKh7TuJJoZwj/tJ9pcVng4+wPCZMD
	DRHi0owzvq4zO5C7XuVpenEcTVJo/Rx/JKC8Es+0m97FU+ykVCqZAbCoy3xuvLVXraZOsi3RgU0
	JWRhHM7xBHDdeAeYuRJVO3xnRaOOvv4NZpSG4LDFt/dH7iLdm
X-Google-Smtp-Source: AGHT+IHitKHl0fp/VoZIqlnhJ/6GKmAuCC/3Z9L5xNfnbpdu2K3wh+2/nvTH+t0RG3v6M8mSP+y913kZutQQyrQm8aw=
X-Received: by 2002:a25:bf82:0:b0:dc6:d1a9:d858 with SMTP id
 l2-20020a25bf82000000b00dc6d1a9d858mr7727682ybk.8.1712049389443; Tue, 02 Apr
 2024 02:16:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240402090349.30172-1-quic_kbajaj@quicinc.com> <20240402090349.30172-2-quic_kbajaj@quicinc.com>
In-Reply-To: <20240402090349.30172-2-quic_kbajaj@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 2 Apr 2024 12:16:18 +0300
Message-ID: <CAA8EJprnuh6Ep5-CmcfrbSQH3SzS8Jb-CtDiJg-J1HHuxrLYZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcm6490-idp: Enable various remoteprocs
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_tsoni@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2024 at 12:04, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
> Enable the ADSP, CDSP, MPSS and WPSS that are found on the SoC.
>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

