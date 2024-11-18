Return-Path: <linux-arm-msm+bounces-38222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4116B9D0FBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 12:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A1ECB2630C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 11:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AA0198E89;
	Mon, 18 Nov 2024 11:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yEIprSp1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0844F194A5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731929379; cv=none; b=eKkHuNyeNjBIwLkZK0GG+1x1FQm00FFomUjzYoRc0l+Mgz+OXTd6+CnMB/ejIhheHN0aWAENpm9GhDGSUgl0kBxEsgZpjsoP07vFMAESJDMYvXHY0LY7lTsQ7Q+I8ieD7gLwWhOWISXQjXbrRGiLCXB42mrNly/UcWRkrG1J/9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731929379; c=relaxed/simple;
	bh=AB3fHdu900F8eU0iaSKmmUBPimL6Jhrv4LL63wkvBd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YW7Ljh26BOFIbezltM/eIL184AYRWEoN9dbBhrxvjE2qwi7L3SvQU4T4cnuGEu+0h5R5ZrbLv/Wm04YJLf8vyfiKmgMFSiGYesz7gBCiCEXLJK1L9ofPx8LzZI+z5SpU0+o7rwwmQUPc9IcxEANvR9t27XO8jM8eG5Z0k3qwnMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yEIprSp1; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53da3b911b9so3225322e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 03:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731929376; x=1732534176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6+F1c07+mVwAqV5uUU9D6sA4NJCxNvjYMVVxQX72lwM=;
        b=yEIprSp1H5UBtyXcMzV6+KCJ7Yyq50UbNqp+48vWPF2f/QcYulpZAGVodFzNKgZM9F
         gTj2PJpirjaT3qLsburKxNufTd2L0nSkL/binWFN4xcfOLczYfwpe7VpOGBqXIuL1lgZ
         P6GDVWXZC58uOBSg+aN8zw5aXf+hb6VhN2qEjzr6geSARtsIcYbLAkLBR8BLSO/dK9ZK
         1gVhsedt/QA31nEd1NSEheiMft4BRBclDPe0LzJZRqbhy2OgdGH/fIEu8VTz3W36G4qu
         UdopMMr+5VW5A07yrVhPEV8CMbFek+lERhIB8UpknbHr9fMkWu7NsNGQ3oKCuwW9q6Zg
         XDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731929376; x=1732534176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+F1c07+mVwAqV5uUU9D6sA4NJCxNvjYMVVxQX72lwM=;
        b=CzOFvWG6mlqIzYcC/4HCpN6JBFYIuioetY0z/uCy47tLNjoa1IqKsUK32p+M4lOsi9
         AGGhMHyrOyAXXNJ2DaaVO6tTdMZwQriHcra/43tHJNRDUufrwJAk3U7Q2M+tTGKheVXP
         SEJGsocS52U7Bmp5ut9rJPyGGuJE+8SjofjZh8Zer9MOPpZFNFJUbCv+LOCqY3IVd/df
         C6327xvDz1imIK0xFR60aQkxbDmZg13A1v8DOsGr/fn7cwjcMP5DSvubJeJyowCmdf5S
         LUU+RgR7Fq93MjA0iLhu8eQMWVA38rXXu4NyYICpuVeksseAPntfXhL8BTzveBlHOFld
         wRNA==
X-Forwarded-Encrypted: i=1; AJvYcCUb6DOacb/P9cBf1cCb15IVv3OrOBuzRCHdm9OAbRgOrmrGg+UUEdtM0Nbj//og3NHnI+EncsxBKN1AK9qB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8vX1gpFm7NEJGWT2bYQ9F7VnJ12QpxJTYNuzWSqNZH7+maLfo
	qjfAvc9YEuiVawGi5jPiHfdALQKbIcPr0kKJd0gFWotHfgsVbviAjzfc9+CAOsM=
X-Google-Smtp-Source: AGHT+IFEZqxXgk+9U3MgdABwpoiyQ/Uhmu+oBjqI0WpVEI3t/hTC8H0NsASHj/gLT+Me6/W8C4z/KA==
X-Received: by 2002:ac2:4bc1:0:b0:539:8fcd:524 with SMTP id 2adb3069b0e04-53dab2a6af0mr4817753e87.30.1731929376123;
        Mon, 18 Nov 2024 03:29:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6531338sm1592768e87.134.2024.11.18.03.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 03:29:34 -0800 (PST)
Date: Mon, 18 Nov 2024 13:29:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org, 
	manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com, lpieralisi@kernel.org, 
	quic_qianyu@quicinc.com, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	andersson@kernel.org, konradybcio@kernel.org, quic_shashim@quicinc.com, 
	quic_kaushalk@quicinc.com, quic_tdas@quicinc.com, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs615: enable pcie for qcs615
Message-ID: <u6wy6w5yfchbmhyvthhibyrhdp2pmusagxyalcanxvhg7ncbfn@vq6x6iwxtn2g>
References: <20241118082619.177201-1-quic_ziyuzhan@quicinc.com>
 <20241118082619.177201-6-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118082619.177201-6-quic_ziyuzhan@quicinc.com>

On Mon, Nov 18, 2024 at 04:26:19PM +0800, Ziyue Zhang wrote:
> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> 
> Add configurations in devicetree for PCIe0, including registers, clocks,
> interrupts and phy setting sequence.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts |  42 ++++++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi     | 158 +++++++++++++++++++++++
>  2 files changed, 200 insertions(+)

Split into platform and SoC changes.


-- 
With best wishes
Dmitry

