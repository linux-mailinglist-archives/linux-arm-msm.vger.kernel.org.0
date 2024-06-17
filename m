Return-Path: <linux-arm-msm+bounces-22836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2011190AB30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 12:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 631D9B397F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 10:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0DE188CD0;
	Mon, 17 Jun 2024 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpHZ42es"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE56194094
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618356; cv=none; b=ksUszBn6JOcv0TVk6Y5oNenfUD4Mc3lZZAccfSP1hp/VRmmTXW39aC/GV4cg4MCuMvlsqYIM06eC2q8an4Hfttsh0zkNbdV1Xy4HypxbYpM4nh+CvQzzLXSBLT9h715vP3XuRnSpxyNwZn1LMmfirWTKwHOM90F9dvyT1gBkmVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618356; c=relaxed/simple;
	bh=dRhKO/JnkhYt6M8yx4Oxd7DnqwTkQBMhJrqikfH1rCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOfm0FlFI1S6PdRP1Sqg6bVnKXta8KDxQerB/N9U8UlZKUaWTk7UqqyfLGsvcjKRK6k8on3eF9scbpNZC+ofKKLitVinT9xMsEmW61+FPqgGg7OaNoZaXjI3ExM4vPuoSN47qjHZxzXgv4KIWhhDUg/yuZthNzeu3bZDBgayBMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpHZ42es; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c84a21c62so4737552e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 02:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718618352; x=1719223152; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3I45HF0uLXKF9d1b8a2LapYHDI9xliAeQnILWkGhOeM=;
        b=TpHZ42esIXHDHCZ6FoCYXPbkxTT280MwFvU6h0qt6UnS9w0n2vceddFlN/V8XLSyQ4
         1GERo5H8NpT3Gha3bkUkYPqL/7ze7CW0QthhoPGapfYj2CNCLQ/ieyKDXZJfa1EoI78b
         pgwWSo2u/Vcu7cCplLT8kjHJwv0FgeoyZGQ6mReFhSjbIMwaoeIHN3mM/a2jBv7chfSu
         gywDefnJ2wKAG3POKWxcFHL0q0ydiuzuMyiRO/Nu1qZjoS6S12KdLgmLoL8xFiO6O0QR
         y757R5JYFQ7ZQCM5cPKl5EV/8aFV2NJkkWzHr3gCN0OjyYzWStfm8EANHQ7mVZ8rN+Cw
         iDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718618352; x=1719223152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3I45HF0uLXKF9d1b8a2LapYHDI9xliAeQnILWkGhOeM=;
        b=Ifyqw8eFic/2y9XtbDXu1jWjy6g04en4KjnBpWezhQa/KpWn/WtbmC6+/683D3ngt5
         lTqeJJCtwv+9Ym8oCSFvQiuk9prBkfVoG0ddyuQL8Gg0sSnq3IPEVYC8suF3F2v/M730
         5Aoy7zYsAP3eLu3DXcisJoRp2Bb6FxOanXkfPichheuQju0jks+CYSLyqft9QAflssNA
         urcZ8WMMKqs4rqkTHXslRt7REcJisvzmp8je+jhpJuarhpbI/1ftW/eMGBvGajZBIRpo
         IE34c20NZ2oNMBwU88S8lseYz5gnk5lHhjXypQqWS5+OOJs909SXHI+cnBIV2vUk+H2I
         w1vw==
X-Forwarded-Encrypted: i=1; AJvYcCW09yvOU4d9n8mwAjDBCL5wrod3R4Irvl+/U1bTzclis5u3vRWXmUx79uiVr5tCxSiTOaKeBSIs0W/28b3s3yRm59/MnwEm7cYjrEWYXg==
X-Gm-Message-State: AOJu0Yz2hBNq18zLFq30RFWgDA8fklMafkyJ1QWWXJe+Ine0KYFhWsAT
	/1N20YJPNvhVsH2AxvAiEao5Va1iy75XMjdfewYe17ia+MpprdnQQ6VQGEmz1Is=
X-Google-Smtp-Source: AGHT+IGJDvcYuf9VNIBxS6qWh9dCxJ74qZJ50yExJCFIMtamGgK6mqnjRTI5suQalE0V2QkJfWB1xg==
X-Received: by 2002:a05:6512:318d:b0:518:ce4b:17ef with SMTP id 2adb3069b0e04-52ca6e99c9dmr7482592e87.60.1718618352209;
        Mon, 17 Jun 2024 02:59:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca287b077sm1195724e87.224.2024.06.17.02.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:59:11 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:59:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 2/4] arm64: dts: qcom: sm8650-qrd: add the Wifi node
Message-ID: <kbz47h4eccmuxh7dswcdrstt27iueaow6jhvqytg3dddbjdlay@2dx7tgurrpzr>
References: <20240605122729.24283-1-brgl@bgdev.pl>
 <20240605122729.24283-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605122729.24283-3-brgl@bgdev.pl>

On Wed, Jun 05, 2024 at 02:27:27PM GMT, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the ath12k WLAN on-board the WCN7850 module present on the
> board.
> 
> [Neil: authored the initial version of the change]
> 
> Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 89 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi    |  2 +-
>  2 files changed, 90 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

