Return-Path: <linux-arm-msm+bounces-36727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E789B9027
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 12:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE8F32826EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 11:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F250019924A;
	Fri,  1 Nov 2024 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D0+H3b1C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB16B1991AA
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730460117; cv=none; b=qSy/dFdrsEUHRf8JlX0M2Uhx0MdqVpiesdFu5fyA84/00l33C3xQwtfdmACwbRa3hapAQTKJEF8WbcLhX2O9ps+QpaLGZ5P94BYgl0Tpa2yPVCqmTDqyR/u81jqyy+2JYwGaicOUhF5I+kSu0Sm050J3uVw2f3p666TnJOBOiB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730460117; c=relaxed/simple;
	bh=KoTvzO8VKEqtuA3KrJa8XxyQcDEmRjc9CaAtz8YICLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyiA1Nwq2pZevB5LS1Hx6TmbVXjv1XXLROV6WJEjlqALnaGBywiDopv4U8Gy4UVgN5QjXhASrMjWOVqcEPNj0gtPxEENGCQDa1Zc5Ta0aF21wBWaAf6nCoqeTKi4d1dIi5VgrmzqXMOugfxUWGOO3Rk5SAazgX7PVvtrt2Bghdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D0+H3b1C; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3807dd08cfcso1467026f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730460114; x=1731064914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eXKsOWR/wJ8s/vomPLhl+IstAtu8+B4WWYmjYIcAfF8=;
        b=D0+H3b1CJsHsW37MQ9JBJ/6HJLHuK1ZM8h2nikhAD8L8bG8AqhMBJ/rvNlKvvOG+bL
         6b0PSWwpp1Zx2qFi+p301nVQAd9H5/9W8Crdi5yBiWEfMz7ppIIRzDI3iCgCxiBHqTgc
         20D0trc1YBuF/zNdp7TGWFPqbffhk7rDm+PUdEIAny07XC5HvoawO/0Tk242VBQQ7I4y
         lSpQ1rTUtbeEjQ/SpSnwwURJuPaEhg1c1DnExTPnpXQm0s39OWBSWA6b3TZrqKtmxDhX
         gWqYa3+6ByhQKu9mtWJWJu85StsKS2kq6MG6oeiQcnlh+jD0bCGvILDQSyDaiD1VwcA9
         nzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730460114; x=1731064914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXKsOWR/wJ8s/vomPLhl+IstAtu8+B4WWYmjYIcAfF8=;
        b=DAI9KEvMzxupYt4veuJh8uTZOWSZusA4E0tfyWsgmDLkPYGwGO6Oms1TXZ7Z0vp6id
         SJ1EEx96eHSQIOP+O5oaokT8NlxOUqxi7SDQEjpLG/WTkF0AZrjGLXhGKE02Xe+K7oE0
         6GMC/fPR40Md+o1q1SUX7vJTWPpzdGJ9QjXnW+vWwXecLw0mJ88R3TTGb0w0ZKmPG9rh
         DbInFRUHfhjpJEqwnhM7MVETWb3U3z9rYCmG/6WaoSEQl5DcJ9I/l85Mbl53YTC+i+XL
         9GLj+Wo3uw+TqXVJ/H7Eg9OQEaw8Od8T0aI76s2nYc2dWF8CUbv/kKSYdOOkrVg8HX38
         7TsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjuh1EDCkvTGR+sAdHhPvOCy1i5KNgF64LnOxm+Rfv1gf2tBNijMFxsPg1nsaZQymacrtYrPScTLPDU0p5@vger.kernel.org
X-Gm-Message-State: AOJu0YwWxIQDCv+YswsIG5sfCfNdILusTfq6du2tgccoM7QcEm7TAPK2
	SYUaTrq7BcDxClU/uOLFXBqp5lNyDnNiUqnsJzzzplmQqMjXZHr1dtzHSB/dAA+w7iTbh3a2UwS
	U
X-Google-Smtp-Source: AGHT+IF1Hi3RvwWs7DSq+spdpzYUhwOwwmzTbkypHgqr1nBe6xd71RG+VXm6t9yCvd53dDUoi1AkKw==
X-Received: by 2002:a5d:5a13:0:b0:37c:fbf8:fc4 with SMTP id ffacd0b85a97d-381c7af3be3mr3201528f8f.59.1730460114103;
        Fri, 01 Nov 2024 04:21:54 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e89csm4808765f8f.74.2024.11.01.04.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 04:21:53 -0700 (PDT)
Date: Fri, 1 Nov 2024 13:21:52 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: x1e80100: Describe TLMM pins
 for SDC2
Message-ID: <ZyS50DFLhHVlnRtd@linaro.org>
References: <20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org>
 <20241022-x1e80100-qcp-sdhc-v3-2-46c401e32cbf@linaro.org>
 <a282021f-5e61-480c-84c4-272049e28244@oss.qualcomm.com>
 <Zx9P+HQMOkJsJGcj@linaro.org>
 <327507d8-2dc7-4645-ac3d-d68ff31a84dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <327507d8-2dc7-4645-ac3d-d68ff31a84dd@oss.qualcomm.com>

On 24-10-28 14:10:54, Konrad Dybcio wrote:
> On 28.10.2024 9:48 AM, Abel Vesa wrote:
> > On 24-10-25 20:34:19, Konrad Dybcio wrote:
> >> On 22.10.2024 12:46 PM, Abel Vesa wrote:
> >>> Describe the SDC2 default and sleep state pins configuration
> >>> in TLMM. Do this in SoC dtsi file since they will be shared
> >>> across multiple boards.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> >>> ---
> >>
> >> Not very useful on its own but okay..
> > 
> > Fair enough. For some reason, I'm not able to get sdc4 pinconf
> > to work.
> 
> Any chance you tried to define 'sdc4_cmd' etc.? This one seems to have
> sdc4 pins on gpio127..=132

Yes.

But since the sdc4 pins can have other functions and since there is no
device that uses them (yet). Shouldn't we just skip describing the sdc4
pinconf entirely as that should be done on a per-board basis?

> 
> Konrad

