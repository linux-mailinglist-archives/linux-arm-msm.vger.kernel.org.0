Return-Path: <linux-arm-msm+bounces-30426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CA9968DD3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 20:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C36AF283AB1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 18:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13D31C62D6;
	Mon,  2 Sep 2024 18:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ehoRiv3J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1085149C50
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Sep 2024 18:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725302607; cv=none; b=d7YdEpWJCAGxIzwooyuvmQIN6C1OezRhKCst6t+58iE5zRQcB0BjBNqUk0sFopqSJa7VOG7Wa0eOLkBRRpDVFetlPD7zCb1eO7ufIkYxrexhQkW98L/U60HC4/ORF4/qf06TJZXylzyQvON7J9tuqRaKIqqIhKMfUPFSIsxxz6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725302607; c=relaxed/simple;
	bh=XdOEyXO9L3nv85zdXcpB19Q1o7Pzj+23Oxcb5Kqq8lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jG9tXAzpEB1ZoQp6prShrq6b2fKuIShZ78Xx6JVj4gM1Gk/wwzPPHPdjHQHm78ii89f8ROYdkZ0LmcJ42MS+BtaqOaG2RkjE1br5Npn+a633mwNQ2e8MI1LIOuEKHVkYDvH0jsPnr6xzcjwJXY1uRCm0GNcgbUt5cWUmJQyNON8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ehoRiv3J; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f3f07ac2dcso50232751fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 11:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725302604; x=1725907404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWGSkHtICBBVaT2Flb/MI9EECebDHAY5AhF2lbTqaJM=;
        b=ehoRiv3J9XE4BpqPR0PJ4yYztoD1G9Om5Qx+nhkw5MOMxEmeez4DFAfJuZivTIy8Kn
         jcNYmTq/Fy/n5y2y7ORcCPRa+fOxudxGxxq1+IMUzlws9wIlDjU/HEgvnDVdM1ZZvqqv
         gIlSCAS4RLWBSgc3TULuOj+He6hrxrRU5ZIa1OUdI6HCRrtdkOQFOqqhFkVHNuMa+oy9
         rGtbhadskA6eDrraC6Bm06MqW1Rp+jeQzMwrl/PMq8jfTjDCpyae2m99YR/KCbr5XLd5
         rtstZVYkaDh6vmbCnWOaRv40ErXRfnr5//aAlKfsIM4d8f8cguud+J7bOgFdxJt9zMdf
         EDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725302604; x=1725907404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWGSkHtICBBVaT2Flb/MI9EECebDHAY5AhF2lbTqaJM=;
        b=UroOiE53mkPaUeDWKdQlyHjHr4ZQYjkQMRqSYMUqcy5VCF6W527Euc6jQucJYZVao/
         rp8ZBSGDEgHP2IKGt1jMnM1pPrriZMDgux0tF6FouwFLp3NZfwro/JmnOgTkzQa4E5Be
         9wmrILduBMRSanBFojlj284kyX93me8yDNJvSTWMN/NAcJmwjIDdh0OUf45NCMD8qKAL
         Nj4e0HILL+tzVGyw32EB2w60MIBasteJHxUouzTLZwhtw4SMn+L4uypxcXqlN+qDcGAd
         9rf+MRocooucmlm+MIA3a3z9kpgL4jtbAh28fSVt2fK9KkoNBm/TGnhEFH5MEuSJRhEC
         /pAg==
X-Forwarded-Encrypted: i=1; AJvYcCUdlobp3BX/F8givnH9rOVoAngAEl3oXJAIeNmv9gtYyvsRAeW+7msmFNrjbpl0UICue7ghCIHNEJo7KnMr@vger.kernel.org
X-Gm-Message-State: AOJu0YzrxCMMwtu1yTvXRt7hkYoSUNQgk+h48M+9ykNwJuP01/767w91
	nhtc9uiVshS/ec5jSf11IM1L997OAUoi3JiWVh6kH/ft54fLbnrgVNubwpiS0l0=
X-Google-Smtp-Source: AGHT+IE2qKw14EU6gHkFeSjAPuG80J10mNoHz3m5AoJJRsY4KlPHTH+CHXQLJ+aUaD7+wDLYH4cKCA==
X-Received: by 2002:a05:6512:b90:b0:52d:6663:5cbe with SMTP id 2adb3069b0e04-53546af500dmr7988306e87.12.1725302603385;
        Mon, 02 Sep 2024 11:43:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540841651sm1738506e87.206.2024.09.02.11.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 11:43:22 -0700 (PDT)
Date: Mon, 2 Sep 2024 21:43:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>, 
	20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-romulus: Add lid switch
Message-ID: <qqlodix7wfcgipzdk5bmjonatmzgvjueadmmzdvkcboifwtkiy@oryqzxctboou>
References: <20240902-topic-sl7_updates-v1-0-3ee667e6652d@quicinc.com>
 <20240902-topic-sl7_updates-v1-1-3ee667e6652d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-topic-sl7_updates-v1-1-3ee667e6652d@quicinc.com>

On Mon, Sep 02, 2024 at 04:50:33PM GMT, Konrad Dybcio wrote:
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
> 
> One of the best parts of having a laptop is being able to close the lid
> and go on with your day. Enable this feature by defining the lid switch.
> 
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
> ---
>  .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

