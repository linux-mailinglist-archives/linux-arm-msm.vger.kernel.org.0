Return-Path: <linux-arm-msm+bounces-55470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A18A9B4D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 18:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 182BE9A797D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAE8C28E60A;
	Thu, 24 Apr 2025 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+ZCHHLM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD74D28CF45
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513889; cv=none; b=EjdVSq4/K+HWty9qXUOR5DXalPnbd55KtQyLoXNaLOTyNNSwu/ym8pZR7uusaY/Mskoq7iyHHgX3819fUGp6VF1ooXwpdvbt3nigi93ljOK84lcqcmouql+zjK8PYJe03xS54b2GsJTEp1Vl9YNUCyhGLMU7+VNId9RBH+mxDUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513889; c=relaxed/simple;
	bh=rtAVqmNrB9xPnZ5FHhbSAWb5+zNZyKeSQ6jXrEjO+Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukhZahPJILYhg7g+uE8ylPrkEtmlbMjGWM71czKSraWUwfv7XQ4sfD/8QwbZQ+rC3BKZ9Ug2yr26sXhRVxCR2oVG3ToWvsMo6GyfS4lne0Ko/SsYz7tGPN0Q3y8NlWZznMGexATLNqc3ARgMG1lOViYyOJByQpsy8srIxpCrLkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+ZCHHLM; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-707d3c12574so11443657b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745513886; x=1746118686; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9NMqKoMnNFSWTlyWhn3Q/XhiI0OW2ljHDhbH5AG9KlM=;
        b=a+ZCHHLMzITh7sbbShkpgZe/DlJiKlxYtvE7EyrqvclbZGLz38eZkY3+p9oRhL65Ai
         U/cNtsf1jPvDE+RuzPuLQHve9gC4lY+sf/G6X5qxRJWOKkjUCKDugU5qm3CLrQUCR0Ax
         CVsDBKr6y+Zekyi1Pw1V09+plKECNsmbORuy/ym2ndAF6fOGFJg3Kbp+d7h9rifm98p2
         uQFwZ9KQVZLc8Dbic2ymIgQYdFtgE/DfPCRs53nB0X1rL9taiy1fkgmx6e4ScUgHd/lh
         8sdA2Ci0mnZUFEtEgDFSxclx38J2qBzZ4I1lsaEGME7NO7lU3ePOxAemfpgoyZYkRHwy
         KESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513886; x=1746118686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NMqKoMnNFSWTlyWhn3Q/XhiI0OW2ljHDhbH5AG9KlM=;
        b=KczfQeXLtCJncc2zhAflPAIXDdPByfa3p1cLHKNmS+/hhu++JMVGXP2rk43KI5irqp
         Lwx0scQ8ueeeSwNEP0Nvt7vT8mfemVlGoHAEBelWZBl4cILyitkA6C/u6pY9fWI0LQhj
         z1b5WJhxyrvblD+m+lxNvHRcueljM9Jf5+s3Si3RcUdHw1iu45PyOe9tKeyMEr5PDD0W
         gsbnFEaUI66I3bqmF+qiuIIPR+vlAYdPsySt2SHypb8IB2CgIbO1wUUGz7kzSzMYUhsB
         EHwLOGaE2uxox/k/O6Ftn66kBMx9SuqSXAdI7X+8OdGQM+KWd9PrngGUAT6UiyM4s5ov
         IZJw==
X-Forwarded-Encrypted: i=1; AJvYcCXoZ6+c94GAfw9r+aqdn8r/7bwJWZM/+Bm08Qq7dCJLLCPeULFkqPPitq3RG+/MYfWvTIu1HHWE09XDh4Qb@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo76IB3QunSwfNLQHBfV62gNofLEfbdAQ24xcAI2XB8WWCx0Em
	EPFmHfVOSinHKOElU9CZiYRDbL7ogQpDseSYTqwuRrg4CxaULjmN5p3QBuwtuZWypyKLhn5/GwU
	NN94Gr9c0lpvl+hqj2jPwvEYJ5oveg1QEfqJy6w==
X-Gm-Gg: ASbGnct0SD/8hZbZVW4XleYswL+616azgxnGJ0VGqygGLIgwtMtqLieacyUCt+lmnLd
	a+yFsVmR4pGEG2zpVCseIPrFCNIyB/PyLywP6FVt5CKY72hYRxe9NzSeCU6OcmRocefNOj+gOey
	DM2GC7JWytEF85wUEVlkWSOnU=
X-Google-Smtp-Source: AGHT+IGzISjUKJ+K5wuOJsTYSGvusY6lT3HrRtCkiM9BkAiKkPUr9XSSPqqT2FqaoFnPU3+9MubV6/YFgwTUN+PxwOk=
X-Received: by 2002:a05:690c:1e:b0:705:edab:f36d with SMTP id
 00721157ae682-708419d2878mr40115147b3.16.1745513886578; Thu, 24 Apr 2025
 09:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417-sm4450_rpmhpd-v1-0-361846750d3a@quicinc.com>
In-Reply-To: <20250417-sm4450_rpmhpd-v1-0-361846750d3a@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 18:57:30 +0200
X-Gm-Features: ATxdqUFyM7393hfMEevst8AZRjE_r2_H3CHFnzETCGV2jO5dz39_5GL4UZtVF3k
Message-ID: <CAPDyKFqD6DSad8Jfq=qhZ9GOdx76mrKJPWdS62A5O6uRSCS+qw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: qcom: rpmhpd: Add SM4450 power domains
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 19:08, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
>
> This series add power domains exposed by RPMh in the Qualcomm SM4450 platform.
>
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
> Ajit Pandey (3):
>       dt-bindings: power: qcom,rpmpd: Add SM4450 compatible
>       pmdomain: qcom: rpmhpd: Add SM4450 power domains
>       arm64: dts: qcom: sm4450: Add RPMh power domains support
>
>  .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
>  arch/arm64/boot/dts/qcom/sm4450.dtsi               | 68 ++++++++++++++++++++++
>  drivers/pmdomain/qcom/rpmhpd.c                     | 16 +++++
>  3 files changed, 85 insertions(+)
> ---
> base-commit: f660850bc246fef15ba78c81f686860324396628
> change-id: 20250417-sm4450_rpmhpd-6a74794d0cab
>
> Best regards,
> --
> Ajit Pandey <quic_ajipan@quicinc.com>
>

Patch 1 and 2 applied for next, thanks!

Kind regards
Uffe

