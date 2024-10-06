Return-Path: <linux-arm-msm+bounces-33266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64F9920D7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2ED528174B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45ACF18A6A9;
	Sun,  6 Oct 2024 19:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tBReU6W6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894BC188907
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 19:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728243939; cv=none; b=cznCte+jr8FUN6ZcOoHuwUPCMpnNz0CMKr9R0B4LwjEX6/svsZAYiyUrvIfZr21h5ULcKx4dTWu0ejSG9cP9j74OG3nSRbLhWhDiMbSMAyUAXbeWJkMLeUQNpbvFvfz5di8SdRXyqDrrpwqLbR6QcQdOZU4qq3HJyp5N7dUyRyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728243939; c=relaxed/simple;
	bh=gczS1H8RCbq/oSB66R44ifTocw2j5ELoXjzfzM1JX+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V45ZSR21X/RD5l1izBKjZmeqQw9VIKpXmZwpyAih4Lk5MFOfnNCH2pXWvSuoYPyZpOpKKXYsuk/IOvf82evz7d3iqg2MlqOTS/ak88uZ5MEG6OJpnQ+vCfXLIqQHVIp+iSNNRL+dfsFjMY5g1EvyXTKfwGVCeMsTHObjNDtkWd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tBReU6W6; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398a26b64fso3559760e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 12:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728243936; x=1728848736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tPMa3wRhVNb5mYhrjN3uRQ7odnUdYC8uDGoeGsan3nA=;
        b=tBReU6W63QatRpiBSQEpr3RrLodlFREYNPx5zP4i1Qy6RMXGMdTQR95zppQr20T3Uv
         shOG3KsYiDwzveN607KpD6HS0fB20F5ngowH4AF8DMJqbKa/DFCWh9itO3/utzliz8d8
         sKwfemdmYN2tsb5OYl9ViNZ+Y4QxoM/b8aOi/dKlaJZWbrIAiwPnc8g4FCMQkqBi7lKO
         3+Jxha+7eVityTMpCH8V1LypN875Xx5Q1eXVBHXtsm9ottemkBdVeBRqWNMYa+lxd9rs
         d2LrhxF5JUkK5z8klL8w2ARbhFKA/FqDlwYD4HG5ZP6svaM6FVisxNuhCc6eAqzgWMm4
         7/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728243936; x=1728848736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPMa3wRhVNb5mYhrjN3uRQ7odnUdYC8uDGoeGsan3nA=;
        b=CUdu2yjLQKPoMM2Uo9aFGaRKIRHpBhXG+3je+aO9A+BiDaxPve/1hI4XGJTHR9uk8k
         iEXljhQY+dgPWB9lewuNdQboeUBkUbonPfENz7kvyVVrJWFd9ddEPNOe5nFbsiswPKAL
         EJhbC03u6YIxw6NZoTomSqKNT9R2u4IOz56w5CiJ+qi3SoMLOhKs2fN5l/U+t7WtWd3k
         WMEP4+xh0k9s+TxSDaqjNqf8r3HYUOVQ4RPnSCY357UmjyUXT1ewIEZNI825geLsYEnq
         XBA+tAc1itQbNQ9vOT/dxLJEmO8SERg81ZA/SWXVwsB7L9DTlSASbs5Ay38ZShcE8dyB
         1nBA==
X-Forwarded-Encrypted: i=1; AJvYcCVO0mhD3QwxS4UezkdzjAmgQQ4MmJ+zhnjUeAw0G4cmpqYbPrnewiN2iJDqsx7YT49DRTYvdM5FtBrhMgWb@vger.kernel.org
X-Gm-Message-State: AOJu0YySq1J+/kYdgkfVdZXvAm2tjeD3f8zuzqhrZZD70qE69w/wt1it
	pbdVgN5vz+ttZG8b/XqOJ5a6xI6YKo212TuW+NS2o8gBh/OQY8K/YKAt1dZ+4jo=
X-Google-Smtp-Source: AGHT+IECZeyJy7q7aAhf4eqzO/46/Q8wdvSrEncRmYOG1aRnfFDqISQszpWAxx60b3qYA7t8pNewxg==
X-Received: by 2002:a05:6512:114c:b0:533:4477:28a2 with SMTP id 2adb3069b0e04-539ab8780damr4558781e87.16.1728243935636;
        Sun, 06 Oct 2024 12:45:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d2f6sm601611e87.152.2024.10.06.12.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 12:45:34 -0700 (PDT)
Date: Sun, 6 Oct 2024 22:45:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add debug uart to Lenovo
 Yoga Slim 7x
Message-ID: <pl7ixe7imgbajceyrlujyilnsd6442gywjn4pft2zjpboqofug@xnj44uujaoqf>
References: <20241004192436.16195-2-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004192436.16195-2-maccraft123mc@gmail.com>

On Fri, Oct 04, 2024 at 09:24:36PM GMT, Maya Matuszczyk wrote:
> This commit enables the debug UART found on the motherboard under the SSD
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

