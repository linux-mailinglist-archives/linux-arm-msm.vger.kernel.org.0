Return-Path: <linux-arm-msm+bounces-78592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8DC01155
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 14:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 444394FD9C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D616531326F;
	Thu, 23 Oct 2025 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TxiNeiuB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6964219A7D
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 12:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761221851; cv=none; b=HkOWa7FMjwfkFm0uFCavS9AB6NJUJcQSCGwTrKYK9pJiCuSsAhY5GQAxTjuHQmv356dpMC9lOdZh8qH7O2x+JCJoBou0JXS60AtgMZYJe2t8xWDPGcGxWO9L0Ug2Ja/rr+xmbovZ/VwgiLiOQ0wqN0GGyzJn0C1o4Rnzw5eJ/1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761221851; c=relaxed/simple;
	bh=L9mKMLdO9ecZLnnTb3rf9vDnZa5Hpnlr0lpYglBohUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdBp/iCLhQC57llVDvWoQT3CgcdnB73oO4YP5+ja94lyuQ9QgyblKs2JpaD8hrU9h05ERAbF3if9JJT+Ppci+Y+5DDtiXeNbBYkpSD1g9XYigJyC/BaIylP6y8+eNI2ZCRam1LDuy2ddF0KNZCz+iHIfpKm86zpvbAqRzxNZ5U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TxiNeiuB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so7569825e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 05:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761221845; x=1761826645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xFaK6NZGo+5ymm+luUg7lb2XRBY37/W/zcfA+CV0TIg=;
        b=TxiNeiuBsMjIBd7XafBrQREloLoW1u8pXhvS6dJaJ29cZgxVi1nYTG0IneDhmkKf2X
         yxzTWw0mxyrdF8q9p8hWVZvsN6sdQFFst8033eGrrBnioq9bbunvizht+xfYmMv8yjI4
         LWQ/SYBnvNNVq8+mCiC4HdL/ogoyLTf3SHUtxbea5H6apLARN8FFNOGXWgwz5whst7DG
         D+q1IPoYpg9s7yGpPE8bGdavGqa9ut4l7CUjNNkx8Puptvu/+jRyJVOg3bePgVtjcwYG
         lJaZ2ZHuay66fL+7Tc8BssAZH3uEBmY2uguhjSEdQQJYXp7plMZXUXBwg7uYAYy8fBVE
         PZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761221845; x=1761826645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFaK6NZGo+5ymm+luUg7lb2XRBY37/W/zcfA+CV0TIg=;
        b=HxXrlckID6D/UiVotd5KgvIPB3j161R2Bbj5PV2G5txGjP/EtcAbKET/ZRuAn3MkGl
         SvEo124JHeNBFmbP7pNCXJeLLSU3QPmpSbMggWTj6gatZWAQxddrkN5o0eZELU+gh6q8
         3G9dhZd4u/z6APd8tofvgDr8oLg7ahm4ZTUkNvv4LEIKkvkYbYcD8K5o3dOs0CZVRMZu
         imyubeDQ1YtDbrI+bgtzFim3Y1L0Uh3apr5AnJfkV/OD0aLNBrsxs3E4PxQ/ErwYOWSW
         iUiitKtu102ijawJqn+o86kGDMy3RJyqC3D+7W11ixohOtzUOPy3jFnNMj15oSZXogNr
         nwxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAt9lL4ErSP+LErkLGd2ne12B6a+S2xsYqQqBsUNiE4TGBWf3r1zEnJ9s8arsPAYrXOl3J9QVW9Z1t5uWM@vger.kernel.org
X-Gm-Message-State: AOJu0YwvQSk1cYnyvNUflHrE97IHt5dp5ZD5chXVCk2JB8DzN7uP2vxH
	MRmsD5bZIhL+xtdAIszZBVYcRhkEasM+Wlky0n5RiblMgZukL/LbUps5mOlu9SgBIhQ=
X-Gm-Gg: ASbGncsa4LdI8SVhoXRo0tjUAmj9PmdiAPdZ/pinzzMuUF7vm4qFz5zn8CMhmVYQYXf
	leDqH8eeTXfSDYO9paCozORMlUlC3wwbbbDi9hzBJvPBjm75iJMOD8R64gbbuzRPOL0XLHGNue0
	9QExaB2dMmS9ETKZxm71ttmA681CYyVTe4LMRRTwrN2tRH/LbMzpvzth1C4TmRQBBX4+ggkFbuZ
	4Uxv2W07QbkRU/5eorpGXdS1XoB3/uvkN3H59yLRFlhva6L8IEE9Apwc7DaBZAf+lDrRaIiVGmx
	C4ijvkuiYs2dj+0PZOsNfca5iZ3yG4ccKePuA8PnRzF6ycC1hhABlalueVlzvpwuGOqZ9IxlHPv
	W+kREfmHnWHIatrjD5xd+z3tKCPlBYmM+8jIwpmMoGucKzKPKsWOAH+QmIlGDTJNwCoKsza0a
X-Google-Smtp-Source: AGHT+IE4yJGL4XD1Y008GBekdf0k/4ZgBeS/2HKOoU8UbmPIZ1qtosiAH1bXdFg2PJCJM3E73unoRQ==
X-Received: by 2002:a05:600c:5009:b0:46e:50ce:a353 with SMTP id 5b1f17b1804b1-471178788f0mr170316305e9.14.1761221845468;
        Thu, 23 Oct 2025 05:17:25 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f685sm96429725e9.2.2025.10.23.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:17:24 -0700 (PDT)
Date: Thu, 23 Oct 2025 15:17:22 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com, 
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH V2 4/4] arm64: dts: qcom: sm8750-qrd: Add SDC2 node for
 sm8750 qrd board
Message-ID: <ekyi4yreec55m5huqnfm7vqo3kgqgquvcmw4budgzolx32mfiq@lodlzpic4bdr>
References: <20251023112924.1073811-1-sarthak.garg@oss.qualcomm.com>
 <20251023112924.1073811-5-sarthak.garg@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023112924.1073811-5-sarthak.garg@oss.qualcomm.com>

On 25-10-23 16:59:24, Sarthak Garg wrote:
> Enable SD Card host controller for sm8750 qrd board.
> 
> Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
> ---

again, with the card detect gpio in here, looks good to me:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

