Return-Path: <linux-arm-msm+bounces-20582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 296568CFCE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 11:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D17661F24F2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 09:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E0013A26F;
	Mon, 27 May 2024 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jn8U3I5h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C3D3B79F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802239; cv=none; b=Twj6G/ynfwA3qr2g62g7+3tDriDPBXWE+YOP5ml2Bb0YitLnbj7HHBy+imY17lC5EFQC3gqgw5s204BXPT8sGHwGbYn3O4Y8o1gE8/B5Mj6/1TcmuMAvFsCf1wKOe94J3zmz3wUAHTH/+HQs5UeHiUHbNa3sxZIJqma5eQLiJUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802239; c=relaxed/simple;
	bh=3ydyxz3o6EtKolYMZLw18RRj0a1JGHpEueDwR9kysUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7ZjCmxKfqKmimGnc5MVV0XFTKAi4WkL3MNkk/xJOGond36ULlxVHbifQZMQhmZtOPKTb2jgrukoIezpRUJPOUukEieOxVMGx0JES3eA3lQCH2RceXocijSuHiYJ9s4HasKxaPZbNzuSFR2a0o36f4HTRGvWx20aR6e/jR9el+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jn8U3I5h; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6302bdb54aso60221666b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 02:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716802236; x=1717407036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9bvVa9oWf8N5rau9sCdBq9ZmdCa+3dAviB8sfK4DVac=;
        b=Jn8U3I5hQ+cS4ag3Yd2zYK/Z5qAd3gt+Ub4pTf54WoVNDG05cbAY11uKRpbk/KsgOk
         9uyYmXeGzC5umEUkTL0dY7GGYKBrkfhxj7Qgtay++ncDRGROBhHFVp4QDsyF4LRTN/Z6
         q4LJArKOBw+ap47lUc7mInaBQT0S9DsNaU2V1gQta4Kv7SWkslCxSVjHPJYLJjcgd7f4
         KmV809GXB+EhxbeS/gXT20eFwHJP30ImYfxG0y+QbW3lby10nXJ/kBGhbNOZ9IlgyYsf
         +7eeCyScbHsEdrTRM7vEpZT8UiOgTrBNQbWL0MoN9hQ5HJbMhwbd7586ijOY7Q/2JRHn
         6JJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802236; x=1717407036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bvVa9oWf8N5rau9sCdBq9ZmdCa+3dAviB8sfK4DVac=;
        b=HPx3BnzaFc/ggovXHI4uuY2oHsqBgYboL4hSS/98sNoXQ63WtxlXDBT/KgqCzV3egJ
         amrotR01mfZQ5Tq/Km869uiJ6tuefqIDxkG0Vmvjtumk9HLfU+dj9RJtx0d6xqqMsg0+
         9Fn9vtLeOtpFCh8pDQ7hqO1HfizxiMnKRlPJC4qoBH447CoW2kLKYyecpP1iBxMIHM4f
         fqouEvEI6PgGfBoKttBQ6cXTe8QjhlIY5VEFcCauDK3VhjnVA7VEHdAomELvDJayuwGr
         9lAU028eiDYJGz3Eb3OHSd6Vd3EwhyQiUScYI36RsHGGv3p5OKFWGJPTBIA9lUmi3WQo
         uoJw==
X-Forwarded-Encrypted: i=1; AJvYcCWvWiIsim7WiKgcjZy2/j7w0U/IlGTMbFNl/lzZeiH/DuQk+LxMs1Eqy5MzSD8TicO2V/ofOegA+4HaEPi0T0egNH+ZFTPIFKLZS9fsag==
X-Gm-Message-State: AOJu0Yzv5QXXSyNTnG/fOlFpYWzng7Kn+9eqks/xl/tLrfnKP1DSdn+5
	HvysCxBIxFKJWKNAZxlD3vdteJV/D+FYKCLJQGoJh81pNOOMBiNx1czIdCiqjp2R5Lqe/TWKFfh
	5
X-Google-Smtp-Source: AGHT+IHjSLxc1cLMi+WN9+boVc/KXZ5NhVmN1BtPdQrhBji9yH+1iJcRPmXbeJy8ldO80V+PWWBXhg==
X-Received: by 2002:a05:6512:3b12:b0:51d:2529:7c4d with SMTP id 2adb3069b0e04-52961a82092mr8449446e87.0.1716802216342;
        Mon, 27 May 2024 02:30:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b2c9sm509911e87.143.2024.05.27.02.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 02:30:16 -0700 (PDT)
Date: Mon, 27 May 2024 12:30:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Alex Elder <elder@kernel.org>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sa8775p: add ADSP, CDSP and
 GPDSP nodes
Message-ID: <mbi6g4l3l4hxyyge7z447azc6v2hf2whthjbj2422ehfy43aia@3ubqo45zqyrt>
References: <20240527-topic-lemans-iot-remoteproc-v2-0-8d24e3409daf@linaro.org>
 <20240527-topic-lemans-iot-remoteproc-v2-4-8d24e3409daf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-topic-lemans-iot-remoteproc-v2-4-8d24e3409daf@linaro.org>

On Mon, May 27, 2024 at 10:43:51AM +0200, Bartosz Golaszewski wrote:
> From: Tengfei Fan <quic_tengfan@quicinc.com>
> 
> Add nodes for remoteprocs: ADSP, CDSP0, CDSP1, GPDSP0 and GPDSP1 for
> SA8775p SoCs.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 332 ++++++++++++++++++++++++++++++++++
>  1 file changed, 332 insertions(+)
> 

With nsp0 vs nsp1 vs nsp sorted out:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

