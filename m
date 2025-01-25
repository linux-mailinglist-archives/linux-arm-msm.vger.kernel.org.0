Return-Path: <linux-arm-msm+bounces-46136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3434CA1C4A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 18:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40ECA1888A27
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 17:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7960C43172;
	Sat, 25 Jan 2025 17:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DExYhZgF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E28F4FA
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 17:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737826343; cv=none; b=ggb3LVbpafOobwRVT3giUw5nTQKUD6f6oizvR9vx24LvqEzOJW2pK8PQSE2MVweG0ywyZVD1IrxA7AU98jmvhhuXiNMlGGQtt57O59rE+0S4eSUX6IuGH0VeIhNQKu8s16q/Utykjva3SHhByaJUMfCrOPKEulICthna1GDvrrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737826343; c=relaxed/simple;
	bh=+CncgCx12/7s9Aqe57tDdzmN7kxUIZdrXndsgAgPZCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1F9ayMX9RVtD2s23mNLxnfVYcB+iejJz3FbCRCUlxoYbH5AIcsfmYAMYKk8wpY5Sa39VkmZYK97cpKutqhF5P/McI2ud2pdJBuzLjaHGzzG7hyVzYfB5F7PhrBGPd6LlhFajDgsUR/TA5kZQHtv7s2kA5FyBAP60/p3mvl3Puk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DExYhZgF; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso3934947e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2025 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737826340; x=1738431140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9VTKxkEAePwEPt+V7eEDuXn6aqMYuyS335t11P98dTo=;
        b=DExYhZgF0EuvzTv8WLj8fa4GwAI9psPiP4d2NNPLXH0Ik1VFwAZ591E4US0KDlWn07
         sAJUIE/lVL/RojNqhc+0k1O4sysEiAUiZkCkpLK1jXd/mJkAEnOaFWwLOBPBIarZGaiv
         +zFFT3wII2yuV9xWwKQATa+aLkiR66Pqg8uFm9RDzqiNZCt/IwDKdmbYVeqNUocC1wpY
         3LFavCT1tRLs1eFooJ0wcu0MmY1E7OkLPYPqMicGpb1Y0wVjkJUUjHGZn/xH2YdFrBSy
         89U9wn3tjavdI5xXuI3Y/vfEQqTu6CHXdvaLynRPzHJv8271s38ShJUumRMc6OL6MESG
         VHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737826340; x=1738431140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VTKxkEAePwEPt+V7eEDuXn6aqMYuyS335t11P98dTo=;
        b=Wv86YZxp7d45MH9I1BfbgxqL1Zs/jo7ZXGusd+DnmKa9HDnpoFbCqnkPJFzGqDMwVo
         K9aQdqlrJYwcQ7az5wubCWwYUno3N8Xafepmyg5vRyMrOKUX6w1vcMtFrpUJahYKIkEH
         FHkITUwr8vOE5CLuRQBOU3ZC6aKhTz9ZTjPjDWn+nlzeRcASzRglBQXJqHUwTZKrNMC0
         RCgZQ0esgICBaAKTVaToSlK8U5gO2GgscFH4efHXP6uHGTPbiWaf/hM8V9wib9vBEp9y
         oB7CnR/Q/CCM4D3GREiep6nUB2wX16AinaobTx/pwRi1xdN09j2AMH40uYxuzWL7IIzF
         L16A==
X-Forwarded-Encrypted: i=1; AJvYcCWKfCbpEA5fIshk1DChLoKLsT3WqJlfe1ykE4F/Y0VPSikLoB2rXEecKt6zrtQWHkTzfmlCUdyBQvvqddcM@vger.kernel.org
X-Gm-Message-State: AOJu0YwRznAsjJqUH37omSsDcZXwdq24/SW3XklcWRiDlxiJJiVjvwbs
	uWlhzFpMzkNB4bMk5+8cKbKVQ52WVitUAGVLqyuj5J5BZfF0TXvAX7hkW8aPm0U=
X-Gm-Gg: ASbGncuu3O+1hJVayy1P4w4SzE+ZQ/DrHAmAaMXCoByAiPhT2sXqvHferp/7uhWftji
	O/JJF3lYi7iIHqtYvGQ3HTEjhDjU0s9IM4qBBQL6384NX8rRq6EmuwUuGwkDqOyuSzMkPAR0vPP
	5ewkqQkloX2aMT0CIaUcpagXgrjj7G49rMmFh7+7snjmSgJVWMq2DRp41BwJtx+d3qyLpa3WMJt
	m7FJav43PNcYP3Ub1E7dOs09ilWtcm/uSXYKDzq6TfPWMwyhla4tC81ohRtG8B4LSal5uEEgGFm
	/4OA0qXMjc4VMKZOYIulsCuwV79a6fkn5FylNNBj2wAEE0fqnCL/mkueAY4V
X-Google-Smtp-Source: AGHT+IHM/qxpChUH+UJCNurb4Af2EPjax/Hj650FqV7s35DU657fh9sG+7Ox+WQZxY3Bclz1CNSomQ==
X-Received: by 2002:a05:6512:3f0e:b0:542:1bdb:9a61 with SMTP id 2adb3069b0e04-543c222feb5mr4471511e87.19.1737826339672;
        Sat, 25 Jan 2025 09:32:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83682ffsm666153e87.115.2025.01.25.09.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 09:32:18 -0800 (PST)
Date: Sat, 25 Jan 2025 19:32:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: x1e80100: Wire up PCIe PHY NOCSR
 resets
Message-ID: <s3d4tc3rstno6rtzlmpab6jho4dixjljo3u4b64r7luaszqlmp@3djmby5d3gij>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
 <20250125-topic-x1p4_dts-v1-4-02659a08b044@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250125-topic-x1p4_dts-v1-4-02659a08b044@oss.qualcomm.com>

On Sat, Jan 25, 2025 at 04:31:20AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Asserting the NOCSR reset line keeps the PHY registers in tact.
> This allows us to avoid programming long tables of magic values in the
> operating system.
> 
> Wire up these resets to PCIe PHY4 and 5 (it's there on the others).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

