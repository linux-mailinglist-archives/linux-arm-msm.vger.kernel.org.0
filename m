Return-Path: <linux-arm-msm+bounces-27054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 715B293C87B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 20:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D0D91F21ECF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 18:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBA24436B;
	Thu, 25 Jul 2024 18:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PYRT/r/S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9478420EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721933194; cv=none; b=QpvFdz6rVEf5/JJAJMS7FvmlmlbVODer28kwJHmewYFw7NEHLX5dTiw37sgbofKV2YUgY1Rq3TEm6D6DH1xmPChDwIBviXcUOiIcm7HoZ0IwLb1NjkyAwejYZvmhBDBL7Me0G+8jfesYCKqlc0Lcm/7zKYyNKI2mlBHZRDCME2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721933194; c=relaxed/simple;
	bh=iVYvz306jhm68GI6uH8IKCctyzxr4dSS7LI30FfUfGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LumrPHx5j/LtaaX8z6M/J5ATu//eE+yjPrQB0GvSVBVBXa7TtGiqhM2g8mZ/A4YQ+2eySfX8c33D3blJodXwhk7cJY0IG4DRoWicpYNIrCt0NVQAtdf+o9OzATmlqAl4/jb0z5YEtNImtAibGkf72X0Lc6m+CfjMU81KIfBWuKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PYRT/r/S; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-661d7e68e89so9911637b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2024 11:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721933190; x=1722537990; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9oVqVsgLXU3PJAcdu8B6wfpcBpX+w94BlKsn9cDXaww=;
        b=PYRT/r/S1LGQNzgC3IMPyUAhEsKitAOSSaw20rzJEZzMu9N62TAFhXixZk6K/Q0NMf
         JzKcH1nt5quykABGGoGx3Z0ajpVf+wHrEEyccuihkctGmBKdPYBENi0O7xaQEIVRmi4W
         X18xn2wqE7MYgjtr9IQYuI6zMVExOvT4exaz2YYjCKO3gQB4Y7BMoU4QiK3gsjpZW6fF
         l25DiZRnMtEmaWiIqeC2L6Eh5/4cNE/ejTTrVJGvZ5czYUwM48QWpTdfxEEFzUqDujQC
         9vXlrBYSOjdAqY8OHktA0BhEYxa9skIJFEafd/LQTTfrOwivKzmvPJDcBLPSVrBPlhBt
         Ax3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721933190; x=1722537990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oVqVsgLXU3PJAcdu8B6wfpcBpX+w94BlKsn9cDXaww=;
        b=VBLkBO63eRvR1+LUfdb95uD9tKGF5fhIdCKfVWppFsxt6Hc5ezRQgNz5iLKlsPcgen
         XouRuOSHfaOZo0l7y7BD4sEsaDu9o0/GxQ0Da9z8pId/L7OBl/YK5aIsztoKwEWsai76
         twFOLubDzkO1o66HiysPyJzPZjcxwGnAxOfkWimWKgJA7dETD/SZtfIuAUYcNzhwE8/q
         gcyrxUKXlXAcAL8VK2anLTpGqXOwqQgmLdpoNs0+Y3cSSHzgRIBAgrLrs6VvJJkjLfg3
         XJlkHQi+F5KCwtK+52SIijK2c2sB+oBgzTmMIb0F5y/HDTjNsJlw4bvG5kvpY/N9t8mX
         n3HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl6WgpylmIdZCDw51ib2RXhATp4Vo+nwEuEQkO20gWv6ebSTyIWWv/LTtX10yIMJse2VqEpHDJNxElhl2GIofhVTjpJAH4SAXAzJNibQ==
X-Gm-Message-State: AOJu0YxvNQK6a+UG07grctoBUQUocuUYSdIwe4YQh/+u/wJAtZC2pPIT
	sp0Ug6suA0zdbx/wmqTDcOp7vJ+SpNscR8pfSd1GKnR5LJDTIbEVU6yC8O+fPbPDzzTYFT7t6CI
	lzkA+cdqbkYMW1vOHKQPsrPQnEGMxhbLppKQ6gA==
X-Google-Smtp-Source: AGHT+IGjqG3RXK8KO7zBanMmlkuKVI99KuS4nDbgcbt2brjtyXOXoWTAiiDXQMyuPo6A/9Zn3Yg+9/Fc0YYHl4H9QWU=
X-Received: by 2002:a0d:f306:0:b0:627:7592:ced7 with SMTP id
 00721157ae682-674e00553b4mr30995497b3.10.1721933190628; Thu, 25 Jul 2024
 11:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725-pd-mapper-config-v1-1-f26e513608c6@redhat.com>
In-Reply-To: <20240725-pd-mapper-config-v1-1-f26e513608c6@redhat.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Jul 2024 21:46:19 +0300
Message-ID: <CAA8EJppv+SKVjAf8HdNdBo1e6XuhBBGuGTiVzDEW7kqPwOvXwQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: pd-mapper: Depend on ARCH_QCOM || COMPILE_TEST
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Chris Lew <quic_clew@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jul 2024 at 19:23, Andrew Halaney <ahalaney@redhat.com> wrote:
>
> The pd-mapper driver doesn't make sense on non Qualcomm systems. Let's
> follow suit with the rest of the Qualcomm SoC Kconfigs and depend on
> ARCH_QCOM || COMPILE_TEST to avoid asking users about a config they will
> not use.
>
> Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
> I *think* this makes sense, but please let me know if you think I'm
> wrong. I was dealing with sorting out new configs for fedora and noticed
> this was being asked for x86, etc, which didn't seem right to me.
> ---
>  drivers/soc/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I think this makes sense.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

