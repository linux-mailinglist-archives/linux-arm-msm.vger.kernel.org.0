Return-Path: <linux-arm-msm+bounces-20477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B098CF141
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 22:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 093311F2131D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4079128818;
	Sat, 25 May 2024 20:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOFvn8tR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26339127B6A
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 20:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716667968; cv=none; b=Jzt8j1Oj/4BJrhi7HzLnrXpCWzqm+rSxFwDvfJlDQRBl9hGs+0CI/9igzmNcEmVXyiuPdcsj28UqJ0yQ++xTI0JbNmBsQkw+AezoWUj5HOYTA4e48FCxW/xfxetEQ2c6jqPigBut2eYfXybCxiHIiRS3DQYSsWOd37SmewrsLew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716667968; c=relaxed/simple;
	bh=eY5NFdEB4BLrmrsCDSSMoBVFvT1TeVGAQqzQJjG9lgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foFoaABUGCqF5/0MYQulq4mJXOmkNjDSuYc3g/REfP8kBwQhhrRKHkmlkImy4fLa7szTL+etmzia4U6oSu6mAUoLAMpFzp5s3EVFzzoJb+Go5WiYaKhM4MyxyJxw0td4rgoQ5hlmN3CWvzVFyhDLL7dJWLXKuCcBifJ0yRZZqFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOFvn8tR; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e964acff1aso13068421fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 13:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716667965; x=1717272765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6YKAF3uOaRvvdDSRLqD9z7t3ncxonB3HE3QHJTs1EU=;
        b=iOFvn8tR64bqOAW4wLh408BIkhTt9uzBiLrcTFbLo/d97uhLd94dsGZQ8it6r7sos1
         tWkONJ54pSdJtxwS4Ha2xYeLWlGvZwRRz0deUGHuKURCCzXAkFUuKvmQ9UiOOME665yT
         naV0PVRxOwrCxtbEqGbbpJ6X+ZqRtKVOC0yJJHpeqdQWduP/ExMJhoFRvCDmelF1kGcD
         aQeYrEsp3GLeuPRcDKqF6c0XvOdaNbOZIuDnWaAjYTslgGdhiTWEr9/sD+huEvH3UyZz
         rYxDp9za9mgdptSrcAQHFgWTHuQR3tQijxxaoEY7HGXd62NfcpYCb/YEdwvjDNnPQb77
         O0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716667965; x=1717272765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6YKAF3uOaRvvdDSRLqD9z7t3ncxonB3HE3QHJTs1EU=;
        b=N5a7y7bL9Uhy6cXf8/s+1hkEUm+mcFHvxxJkFgjBTkOnJ1sCdxwavEb2T+Tk2JVxlK
         VuKLlReWzbTE8uy5QlKZfaxsGxyp1lhq6CTYPXqW8Fqg8+LHoYfGP4hWDinp6I6A59o5
         CkiwT7MlhH+cqAfryriUXvd6o0sixR4kztm875wt4KDR8Zsi+/jRqpV3j8kXqgOXT+mD
         p455BPB5fjPSAPToSGRzvVgjbtEKX16DXMWAkaIB/1MNxA2d88Bb+UnLGqTUfG2pCCD9
         XVvKaaFXwWRDJAjuPdJj9brCD+hRLHg8jKuJUTW0e/USRvqsSYjqBM01VzSIAL33IVEO
         3pXA==
X-Forwarded-Encrypted: i=1; AJvYcCVM3rqizIFcXkxeOyeKwJIgZRG71YXtlJLD3ueRTS89/2JPU8SeU90XKkFcoWvAxT+anDL5M5Az5SwuM56eWHVFiA+Zxg/koA6wTVphBQ==
X-Gm-Message-State: AOJu0Yz5wJoyqIYorDx3EoxOtShjCN/mzSqM+amrhXBf7A9+yGLGM1CC
	+T99Ja+LSsunCZN3CCTPanfTBWVv6spfHQK9X0HKhnE/6ZVsggaGDp+dWUqRz3E=
X-Google-Smtp-Source: AGHT+IHJDobPY5xFq5dvnmXXHNOJaX/jRN/ri7kcyQYhHMcDJUmJpMFwZSjdDHIOoZ0wzgcLMXKknQ==
X-Received: by 2002:a2e:bc08:0:b0:2e9:570e:1cf with SMTP id 38308e7fff4ca-2e95b3089d9mr38786341fa.52.1716667965322;
        Sat, 25 May 2024 13:12:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdd152dsm8775351fa.81.2024.05.25.13.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:12:44 -0700 (PDT)
Date: Sat, 25 May 2024 23:12:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 02/10] phy: qcom-qmp-usb: Add sc8180x USB UNIPHY
Message-ID: <ynokoy2fh4fwespzfdgo7mpklmy2n76syfyb73bm4m2hp4cftp@am5nldqvj65z>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
 <20240525-sc8180x-usb-mp-v1-2-60a904392438@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-usb-mp-v1-2-60a904392438@quicinc.com>

On Sat, May 25, 2024 at 11:03:55AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The SC8180X platform has two UNIPHY blocks, add support for these in the
> QMP driver.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

