Return-Path: <linux-arm-msm+bounces-79356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 82476C18D0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EACCE4FA31D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 07:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACF13112DA;
	Wed, 29 Oct 2025 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nVeTIoLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929903112B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761724701; cv=none; b=uQaAJfjinldk2yadezELgIJjAUCkfAVMrXm3h/1v1QwYh3KLuK7HddU5N4G9/y4QeTLGuiM0oLleRzaTGN8ih+kY8dTjZbVdfiTjG9ZwSTmtMYXLUBOIJEKdthEMYEBxA1KxIGXR3KPJN6N/5h+M3brNDga8HttVFOubk49PwH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761724701; c=relaxed/simple;
	bh=3/XHVuDU9ygfhagugXWaLoGazAfM6ug/NwQjbm2ArFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ss06kEDb7FOQhi1pkRzmxkR2lGkfeOnI0LynwI5oSvsYqVZ+7f1jv+XKfFCcG/XFzmMoU+3SfwU4bbiQnN1aSUv8COjXTzDVt438Vdlui7UXcJi2yl86ybEoOeqxXfoKWipnLfeUC5dMjhST5vT8h37/DNZNvilxcGd0sjFy86c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nVeTIoLH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4298a028de6so399342f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761724696; x=1762329496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5RvgAgnj2z+3qcsz0KMHzZJuf9kq+SifHN2KZ1y88M=;
        b=nVeTIoLHSAce6qkObqBYPia7rWaLG/9NmvT5YtBnD6Nfj4i87Bb9VAU+VFfgGWCP9e
         UUonWP8JyEzdrqqt+5WphBwe++e2voP7OnXuaAhFQD4n5iGq7ax/fJikMr117QzGrkRQ
         Bk0JYW0sCDgzLGXFewwyQpit1izPamNgiga+Plu3H37qHpv9sJ1v43CkozpC6gn5W/lb
         ONkDmVcaBNkuqmT1sXpFBPdAf5fMdwHwCoePXDIgheWrzkGeUHT+NfRXnrhReFoP9Q1U
         LkXkElVAHOJf+EP4iyvBw4b1/N5/6NTn6ur9374Ev3SRKX4SbQmI2LiME0rz8MMLtyK4
         CDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761724696; x=1762329496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5RvgAgnj2z+3qcsz0KMHzZJuf9kq+SifHN2KZ1y88M=;
        b=Zt/HVq62ESnlbfCu3zSxYL09JRmM732bvaCbDIpD2QHBRJQwWxV2dpiTB4l1eQJbW0
         i1R90JWBkBY8bJ5YZrLkF4zWk1/Q54DTT8PPV7bxg1Rrkn5pvAfsbCaxsZv2pDMNKK+2
         +Eugc2q2fM9rAFI1zWkaUCTabKPl3VGHQAVePUXeCebNWTABuv/LHmPnFNc5woLVmhBL
         050qOAn3J6RKUMShhl/eaBPj/em49rl0LaABU5SUmYZDJkvPNlsJ8jasqrvlnJmyfavJ
         eCaZsJvVu8Owu0Ej7nkSXa1S9+lbCffoHEJCzQNngNT16dv7ZyQiCi4ybev/TdGP+lXG
         N8AQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7t8cKXcIVDTlxAvwIyRVAYH+g+gyf2GaysvcghygyHjvhas6NBLudYl4aRGtHpvln3gSmr+ip3aETcBIO@vger.kernel.org
X-Gm-Message-State: AOJu0YwGJgC34HukVqE8UEVDKGrhHU05pW8ATijHKl0MeW2LapCSyD9D
	oGi3l5bs17GXtvvzNLjR+wDndr2ofveqxOx3sxhBWWdTqXDQI8zb7rlQS55HtjU66HE=
X-Gm-Gg: ASbGncu0g/gqsxOgnPw9taqhDL01ntlR5S79TbM3GgQVe0g09fYk4g1VIgQ9M9bIiA7
	xkL7xh7UL45Q1J5HI968xI5gyOdt7ew/DeD1I3don1dRzq7al2KsblhT2Mtk1xX3eacpuhzJz4N
	iUPcpHA0UTTQdZO8eYnD1A6ZkS+VVwjbMdBAUkZXUzGBczEVMWJkAgPW/3UX3gtjJtcehzVNKUX
	1L0Bdt/tjXVO2VQBBcSFQfcyGwZ61v1CG+rT9Thtvc/7qbf3A7WwfiUUQ7o29aG5pKhlh2Kk5OU
	Ht84oi7hyShVUe0KaxWbOxRj5eLKBO3KaISpieaIy998q8LQYP07mUjImziNGBJUaZR85xVq19O
	UFY1k8ICAi1Td8JqJJWIzIO+6vloPFw/i652Zynm9ou6rWqTmMjLS4uNR38bAfpIXrTVPtJ6X
X-Google-Smtp-Source: AGHT+IEPacXyIK1oaQfJqI0S2ywuOclTL8n8/3bmtpUnpCVVdges7BMfqcF1DOHNcmn+v2OO3NF+Uw==
X-Received: by 2002:a05:6000:41ea:b0:429:b21e:49c3 with SMTP id ffacd0b85a97d-429b21e4b58mr619629f8f.26.1761724695918;
        Wed, 29 Oct 2025 00:58:15 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db9d1sm24491585f8f.35.2025.10.29.00.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 00:58:15 -0700 (PDT)
Date: Wed, 29 Oct 2025 09:58:13 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <jesszhan@quicinc.com>, Abhinav Kumar <abhinavk@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
Message-ID: <luq3ffklrwezh7kyf25sbwc5arbbnypkwj3mdcb5wxs55g4ip4@4haj4s7oahuv>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
 <nwyrhupbrqrh6q5yvk6egtm3whi5h6xslhzio4g7f7l7yjx7c3@atl4bbk5f4vb>
 <f2117bbe-89d4-49a8-9e5f-5dc975f9bc13@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2117bbe-89d4-49a8-9e5f-5dc975f9bc13@linaro.org>

On 25-10-29 08:45:09, Krzysztof Kozlowski wrote:
> On 29/10/2025 08:40, Abel Vesa wrote:
> > On 25-04-24 15:04:25, Krzysztof Kozlowski wrote:
> 
> That's April

Fair enough.

There is no newer version though, is there?

> 
> ...
> 
> >> +
> >> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> >> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> >> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> >> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> >> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> > 
> > No PIXEL1_CLK ?
> Why are you reviewing this one?

Yeah, I should definitely ignore this version.

Thanks.

