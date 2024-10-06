Return-Path: <linux-arm-msm+bounces-33265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0649920D4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A03B1C20383
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF4518A933;
	Sun,  6 Oct 2024 19:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FqrjdHNB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1532165EED
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 19:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728243823; cv=none; b=Q97g3c78J14W4aiSZpnHFExgE3D8zuqQwIrHurU6/b5Was7SLEwW4Myt6TOtgC3K5yoQvwPXWJ2ELttqq8NHMUUg6EsRkHOfOAc4zlSOMG4KN/E1icg1wUu9Lof7Ga+x52dTLze5FBXZEz1lihJyaMUqt/GpA0XA0RV+9CzDpXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728243823; c=relaxed/simple;
	bh=Af64IObu3G4BsAOsdbdhFI3v4NQ7m9TqHxvVYVQ020U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iphLhFARqQC0adnwc3H7dCWP7qfILGISQbEUzKT/ias3tXFGQLsusncHm2YU/yjZf3Jhy2RFRm4lA0kg7PzY8qtHBOb5fcIexJ3zsh7deFSfNeU6k+RFcJGuhTQmOHYZ8IgAvuzggD6twnVn35nRPJdEXeYU1qAHV5IoMU1eziM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FqrjdHNB; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5389e24a4d1so4468179e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 12:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728243820; x=1728848620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EAaTX9IAXYtxIfR2NJZJRBkxvZZCp8JsmAR/Y2PS+Ts=;
        b=FqrjdHNBDBHJIMsz3oHNnY+45lIKmA61+UiApVykoqJh9tnzbzQWOL1tGvA8he2FaI
         sN11M0VkLFR7SAUWZKUp1VppovVQpuN6W+k4dOdioI9SijgxMHgoQFVwHyJBs8DNwuV3
         esHNecbuLeBlN1ZK7Qd+Bx6g3+LmZP+iyYBxrPAn4BTPZPSlkvs9ISDbL+Rdfd3J5nuD
         rpn9rO9y9y0jYC5ngPA8n1HOzbm81+4WXtr2TiBXa2Ex7QoXHtwBQzJlONX6/5A8+uEu
         1laK8Jk+r8rWwVtfKrbIDLNcWxngt9nhGLx8Wjd4LV4Wu2VaSIe214cgJGro2gW6zfUY
         Ha5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728243820; x=1728848620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAaTX9IAXYtxIfR2NJZJRBkxvZZCp8JsmAR/Y2PS+Ts=;
        b=FiRsCfXTOk2DMzqZcejXpf90+57Bja8Ru5PBvoJDdDu/pzJ/JxT9UU6SYOvHmZSX33
         0SSaWy+vvAaJjS1Qu6k3l1KOvEgMaUP1FWq2APMKjBVL0G6ZqbTSNb3cBATPPNdVOr6C
         NyM3SN0C7Sl23qsgS/j/SXMo9CVYf7acZBTZKWj04/e6Pk1z8MdT7L5oTdMLBH7kLwSt
         ddeF8xF1F50SFyAFwxioz9YPdazL6t/ynqKYWP6dg11xd4OKD8VubL+oTVUYuaXcv8Sp
         YTnUXe2+L273hWbyLvsBQGtA9hT5leo1sTGMkuGqWlszHU4DNIb0fTeCl0N6jz2Bn7Uv
         3MEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3PfT/M6DFZARbcI0Sa6Gydt9BmQICaF1TIf5O/w6nj49LuBMAIrjLNVCaMuq162b7ZyxKtL3mK8W3S80x@vger.kernel.org
X-Gm-Message-State: AOJu0YxVN5+Tckgz9lKX1lFX586RN3fpkn4NGhurL5twXYLPTmcCM61m
	u9uX3KFDchLLBPtRi9ZfPON9tgMWrooSlDQ47QhvZYZpdT1Vj7F6blVbHSkW1OA=
X-Google-Smtp-Source: AGHT+IHsODZnlt3c5843oAy6l5YABsfgAp8j/7niEek9w4PNFdM4NXDDpAZr17bDSyjY/9anMJ5ajg==
X-Received: by 2002:a05:6512:b07:b0:536:5522:3ca9 with SMTP id 2adb3069b0e04-539ab84a52bmr4450379e87.10.1728243819876;
        Sun, 06 Oct 2024 12:43:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff23e16sm591686e87.238.2024.10.06.12.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 12:43:39 -0700 (PDT)
Date: Sun, 6 Oct 2024 22:43:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable PWR/VOL keys
Message-ID: <jlsdt5onkxa3n7o3cdpnnw6vwfbgeg2njhgnv4qjdvpnzmqys3@shltb45s7plz>
References: <20241004-rb3gen2-pwr-vol-keys-v1-1-4b1859c7cc4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-rb3gen2-pwr-vol-keys-v1-1-4b1859c7cc4f@oss.qualcomm.com>

On Fri, Oct 04, 2024 at 07:47:17PM GMT, Bjorn Andersson wrote:
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
> 
> RB3Gen2 has three tiny buttons located under the blue USB-A ports.
> They're all connected through the various PMICs and are used for
> volume and power.
> 
> Describe them.
> 
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 35 ++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

