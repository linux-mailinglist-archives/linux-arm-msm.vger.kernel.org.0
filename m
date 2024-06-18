Return-Path: <linux-arm-msm+bounces-23096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D44190D5D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EF8728B0E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4280B158A3B;
	Tue, 18 Jun 2024 14:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FXXxyAH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6376213D291
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 14:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721192; cv=none; b=ODvLB/RTg1Qh9hPjmcJTGBtCa9mCgfP69//VIF5BZJw1+WcJNP7oX4NsOfHRQID1/cOCgNaUwyOFXslqvM93PCjrg2hg4WlcmIH7e+R6s0Y9Pqcuey5I0H5mCj/ULPYxqcH8u3HAJuH/oMRt8YjW1/Z4sOxpi5h1MDvs0IBDPUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721192; c=relaxed/simple;
	bh=1uclk27162No5C6YVhRORLMRgBplWKGOIFoaR7DHLpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbxmvYGsFVIF9HqzpCXZ0RR80hQUaDr4B65ufF++pU3HUI55lAOBT+SZkYi9vSmaaO9Fwfb+23vUWkaErjlN7YhZ8j8CLFNwKPo8f22fiiBz5MjBq51tAdTeUUyYSLMSDbviNnMLs46kxBztH847X3ZQEdPlLkIlTeWKN1kMsww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FXXxyAH+; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52c84a21b8cso5039405e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 07:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718721188; x=1719325988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MeKlo2c/wPe7HMPiv6tGRU6PP+qdrCpRbKZmuqxx74A=;
        b=FXXxyAH+Me9S0YFVmz8a0E1WOy09yqJUpEbAuI5HG9MLBOnPS6dKPXI/m6vh3dZDp4
         Ea/EEq/JEFD+lCQNIC0DBBD/NKTUI98BS4nffnSbsoWdMESq88ZsFjW+nfPCfYEvRroa
         t92khjbXP4iHPbgdcVeqFbappadc1k8yGjJW/FjelKsJHj/sbwf5Rgy8rOOvL9upDH1B
         wyq6OLPP+58/spwch/aKw0Wpzil7BtHnpXtY+Ogb3QbB3bZQwWuseQsyTA8cCECdXT8o
         LtQzk5LHXWsqZBns9XEG8vkVN8S/uGRCvet0gDGNAGo+NRyNnMYUMbvmb5EgsZceNHVN
         tPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718721188; x=1719325988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeKlo2c/wPe7HMPiv6tGRU6PP+qdrCpRbKZmuqxx74A=;
        b=aUYuIfMRniss0DxsV1VeDAiJuccHtI75e+qR2+U5F4NHMiEAsiE0awbW9XumsO26cm
         DwqmHHtUGvh7ZkkNhthndpCsFpOKT3+51u31eZmC5a7JIMBQPQeWy2lNiF+dI8Q+8BbP
         YJpWpbp8cBPM4c3M28gBiyJ97AftQAXQmPVuiD+uKcRWBVrRXBEf6v67/jNdhUdITF68
         +iNjpE9u3cWlv6Z8Jfgat7k+Yu0PxoSGGDNqjUtmJLFyWpf6nn6LQvwAZEmw3QR64kyL
         v6vtiVomF4yZ53Ac1Y2owVMag7D2DjPgNlVAumGeGXmI/e9WxodTwHYyl5rW892boY44
         36uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUw0fIoXx3I5RwO3Y336SZehksQWgLiziR6wax4D4etmAFBfLhfVw7+7IszcCThPeb01HQjEu4ZNyBdbmJE/liy9XLue/WeewQ75AZVQ==
X-Gm-Message-State: AOJu0YwvDwTp2cF0EkuQL3fYUm4fz2F2BG/8I53xQtJfwGXGllyDQAq+
	OyeYvbQxsqXRNqC8U8I1jdDw+FlGRbTTGluw46CnOYBzqLU3g1FoWxBVrJlKytw=
X-Google-Smtp-Source: AGHT+IEpc4WisyaLGnyyDP2DsG3mH6xTLPLHzgbkfUQ6D8wsp4gW1Eyt6iWP6o9lJ0JWRyoGq1IN6A==
X-Received: by 2002:a05:6512:2034:b0:52b:96b0:4e1e with SMTP id 2adb3069b0e04-52cc47d4770mr660841e87.13.1718721188557;
        Tue, 18 Jun 2024 07:33:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca288804dsm1563550e87.262.2024.06.18.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 07:33:08 -0700 (PDT)
Date: Tue, 18 Jun 2024 17:33:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: neil.armstrong@linaro.org
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm8650: Add video and camera
 clock controllers
Message-ID: <fr4j6gignu7ll4nhur65asj35rbsbzr3w4xtxq55jxcfcmb5nh@l6l3qyhk7qmw>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-9-quic_jkona@quicinc.com>
 <3ad2d00f-6b5f-46c5-b95c-c8d68e8be736@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ad2d00f-6b5f-46c5-b95c-c8d68e8be736@linaro.org>

On Tue, Jun 18, 2024 at 02:17:23PM GMT, neil.armstrong@linaro.org wrote:
> On 02/06/2024 13:44, Jagadeesh Kona wrote:
> > Add device nodes for video and camera clock controllers on Qualcomm
> > SM8650 platform.
> > 
> > Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> > Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8650.dtsi | 26 ++++++++++++++++++++++++++
> >   1 file changed, 26 insertions(+)
> > 

[...]

> 
> And add the missing required-opps for the clock controllers like
> dispcc.

Unless the opps is required because cmd-db has lower level than
required for the functioning of the device, there should be no need to
add the required-opps.

> 
> Thanks,
> Neil
> 
> 
> > +
> >   		mdss: display-subsystem@ae00000 {
> >   			compatible = "qcom,sm8650-mdss";
> >   			reg = <0 0x0ae00000 0 0x1000>;
> 

-- 
With best wishes
Dmitry

