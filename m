Return-Path: <linux-arm-msm+bounces-50877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D15A5A4E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 21:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 306CF3A6E34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 20:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A451DE3A8;
	Mon, 10 Mar 2025 20:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xH+OswmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16823EC5
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 20:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741638339; cv=none; b=RCdYiEtumhy/lj58oxvhZZxpRWReUijGD4P9tqHltmzOolAZKvYjau/3RK7yY7JtBDZx3w0NvDcAEa4psEsqBfvdxMqolQtZvCDH603eBASntb0KI6gf4cAtv9TwtuLchPHZkqU8Pp44aC/GC6FoZmpDNlMUNlVVwUhfbVBThoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741638339; c=relaxed/simple;
	bh=L9+uLSJLlnFoF8qnj42PdQx3Q5RYzcJ6a/f47QtrPHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVBnvx0xdWXK4Cl8q3ihzE2f8Qa01ZDc4kxvmSCkK1pYuUVzAYIxrm6L/qmgDu4gHqB23FRf5v6tOd3lDXmSFSKOxe+rQPvz2Ra3ZYaUOoGej4jljQ6JF9i6bX14DQMlkPrv6lb4QindvobpPIjAFiAi0iLxq+920ZJOxVBJkb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xH+OswmP; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so35566021fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Mar 2025 13:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741638335; x=1742243135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYNmRZYB/IDO1RurR4i6iqDD/1mktBUeW4kgdxDpZIw=;
        b=xH+OswmP/CcgSiKX7NC5EIZKpFzqTMBvQKOua8bj2RCt/4KmiTK1Kj9rW64FBMSob6
         RS382yhw5sZlzayoKWCCuOXdNJa4Gz8HJWPX1U3Pu6xDDmOAR8pp5nYOpZb2/YbZAnVs
         crPuzbjdQRFMQ0eYUBe6G9YrnF18gMUtEOg1ex7ZoEGb8FK9lNWCiz4/dLijIU4UZr4/
         xwQO7Yj/ldfq3hxzF5TiSuhtAePwdWzvWo1WnBK6RB81VbCohnmN7E7ntYZ/QZrt5nfH
         hi7v4JHreheuI/szkNYb3NlbDXa1p0pXqM1GkzEmliccRQCsl05n5PyPQDXlgIkGzHjc
         doYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741638335; x=1742243135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYNmRZYB/IDO1RurR4i6iqDD/1mktBUeW4kgdxDpZIw=;
        b=w9vW4mhuc8XHxY3Rar5AFDT3DM78ZG78JJpwCCqfBRtwMEcV9CWgDcD5nmRmYY9R/q
         7Vk0XfVQr8wlgThOAHpFVeneSTQXFPQzTkL0bQjhBU6Sk4Il/GuUgHOJEuvd8Elt/6eA
         66NYtfDvOwBpBJZWeL2WRvjmXvPAvg9bODBRm0ywh/KGFK1ulp4wd0dq7WqjshowMNyf
         B0DZwIeWbgZgqpagDvaTEPSuNInnlqIssW8HVzDCVjAakLnD1J05DS6VomLO0JNiEupV
         gwnpur4NlBhdVFQ81JEt7U2HSJTvaObzo6ZoZjjb0VyzhpdLHd/i/sT5+gIKtwmV8pkO
         DeYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkgemi1F6xvVha7+MdsZes56woiH6NA5g4MdfeRtuvpoqgS3nQEfi2X4Q/QzV35Ldj7dX7C3fW0WJilq7L@vger.kernel.org
X-Gm-Message-State: AOJu0YwTCb2Bax93YcQlM4+lJbt5AcdjPyrr2F0nG76oYazuAXOWJHpf
	4oSp54/ZsN+4z3caifs177PU0zZNnJa6IeoL376+XAEMRMCt1wmvepcdxPKRv3M=
X-Gm-Gg: ASbGnctHnMLil6dZVoulpobqpa0WHTPcN7asIg01hP+f44ADh2FAkTA9KTHoMSadZRo
	F0U/U29pcpkJRN1vlesEvZOeAXTfGyPue8f0XYpl2iAG8RbuM7ti+xkYai+RNn1aQyAh3C+TXoL
	TRA9edKWmg/GUT3hghWuw7MldlwxSvr6OB2n/O0o0ktdSAESM6FwR1aHK8SzC2Hoidm22UT+TsA
	Vt/w+Bh4DFn1HQtmu3jQVpO32+YTsTMSe0cGfBhVFdfDxSb1Xxm7W9AD6EaY8NqL4Jon/PaRHe+
	99VhsNAuYoFm//Au7dUHL23A64Ie60B8F/veQ3A+YnISdKNeWqKhedMRHHDvdA+Ck6YjoSOqI2g
	ue8ADugxhaTCMpx9X8MNluUKL
X-Google-Smtp-Source: AGHT+IEPVrqhzKdG85UY4VL7q1PeHiNjtgCxYCgNnkHHR37Br6Hv/tkjnMqe/JrlEqz3SvLMcEnR1A==
X-Received: by 2002:a05:6512:b84:b0:545:f1d:6f2c with SMTP id 2adb3069b0e04-54990e5d4c2mr4659162e87.18.1741638335156;
        Mon, 10 Mar 2025 13:25:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bcf77sm1556084e87.107.2025.03.10.13.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:25:33 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:25:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, 
	manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	neil.armstrong@linaro.org, abel.vesa@linaro.org, quic_qianyu@quicinc.com, 
	quic_krichai@quicinc.com, johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/8] arm64: dts: qcom: qcs8300: enable pcie0 interface
Message-ID: <mxqrssteqfzp2llhp7exj7yoduv3h26qrxnsb7tobxkk7lxyeh@ywers6elgmwy>
References: <20250310063103.3924525-1-quic_ziyuzhan@quicinc.com>
 <20250310063103.3924525-7-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310063103.3924525-7-quic_ziyuzhan@quicinc.com>

On Mon, Mar 10, 2025 at 02:31:01PM +0800, Ziyue Zhang wrote:
> Add configurations in devicetree for PCIe0, board related gpios,
> PMIC regulators, etc.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 40 +++++++++++++++++++++++
>  1 file changed, 40 insertions(+)

NIT: patch subject mentions qcs8300 (SoC), while the patch enables PCIe
on qcs8300-ride (board).

-- 
With best wishes
Dmitry

