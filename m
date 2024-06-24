Return-Path: <linux-arm-msm+bounces-23873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2334D914216
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 07:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A41A9284B2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 05:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D38517C60;
	Mon, 24 Jun 2024 05:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VoKOy9wz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8173117BA2
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 05:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719207347; cv=none; b=jGedmfXyCxGEIiBwr6MJZlq7a0DteePxD3HEUzsgLSst21NCQ3EAcyIBc0mZjsS0sVRURVvSMWjJ7LUu5CUr8yWik8hb1pmM49AoGJTswekFwao9RDj4jK8OWq95HL7vz6jnxiIAHG9gUWJMz7Np4g7WnY/0LzVwQv5o2hhgBCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719207347; c=relaxed/simple;
	bh=tL4uu5xG9IpLZLy0hCoGBu/tiFpjMNGK6FbGRFIu9pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABs37W8AsTGvc3f3xpf8Cr1Ff+4rvWC+VbD5GGTYgpDlmu0PpYcTWruFWlO0dxprKCLE7TfYbx6tGo6gadpadRMz7/lCQp7NdD8FOrV/dvyrb3oRkmEceeyXunLcx/bj4/aTW4d93aHvCLpbA+VKnLhMioFxJkIMxyooPG7Xsu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VoKOy9wz; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cdea1387eso1579273e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 22:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719207344; x=1719812144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uXt831VOucXeBGOMZLVEq9KmUHZ7mdnZ3c6OLXF1pJQ=;
        b=VoKOy9wzNbuO7AXMdpbBpiz298vg4heTuEtBX7OGxAKL2wLQWHILDRd3FcxX+Wk/Qi
         4UNwgxPIy6XDgiV/e3pxWv8rrxwcMi9cWZrM7wgIYhbowZqxCeWGd3/CYoKrJsXWAOwZ
         XkovlNEUOBVQ1Bv+GU5tobB8tV0fWRDz03NTimIO7H4Sl7bPaDtnQO3UEz5sY93TOTNr
         pftcHPInvcst+wAmtehzNDhwd4wM81RCtfvNH3PspJeHyLBt/E/Yl5N54wjx349uVyvo
         qAckLNQdUP+8kj2xo2c/gH/PDOE468bWVY3VFuMCCDXsuOFAKJMR41j0hMG5skqWfvBs
         iykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719207344; x=1719812144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXt831VOucXeBGOMZLVEq9KmUHZ7mdnZ3c6OLXF1pJQ=;
        b=bsRUp+q6+D+7qqDC6LFRxGKRwBcZU0V6M126zKA3+WzUZCjlGBdx9QXl1C7iEkrQ28
         PxkWCExwB8X+Ii7QfUCYq0ih3cNgbQ27ENufOHA+Uio3ylbGNsYpZBLADI48GwyajGGN
         H4GZNv30p4HBEtmrd5JEjq3ZoRO8fRUiVMJL0LtSH9O9BcFQlk8o7Nxn+ELe4UYxVOdG
         oRGEwizARVhvUcnmKVO85pVCnk73u/5nCEIM9ZTDW5A/AkVrEXzAsAL2ylPJIuUFy9nZ
         lFd6Qk+ZN7NTrSrleV9xlziFo6SuV4oAz1hlrviUlEc9ubKuuYVbmiU/DRr0cpi0w4F8
         QlYg==
X-Forwarded-Encrypted: i=1; AJvYcCWao1R75V5GJnI4+fWJ1WKrsVrBhHLdZf97Dk+HnVW6ezdhPr34uJyhj9CRB0myS2Vdd8y8EQIIPjL7ZG0Fz3ELSTuI8PMq0wl8QjTcdQ==
X-Gm-Message-State: AOJu0Yz98FshrofVg+0WDQk6YpxRYttUbm5XRjiW8wW6zHfAWgVoxWgq
	hy9Wfm4QEH6AhdsK8aLxqCCCvx5A7LAPIuizrn6KeTWsyUphbp8PtnY2LaA8n+c=
X-Google-Smtp-Source: AGHT+IEtOtRS1h75iYfHFpZGCy3R5aFkLtRU38+6nWkEn2DerH/6c2kvfaOl1tHVW4jANaOgesxImA==
X-Received: by 2002:a19:e043:0:b0:52c:e121:c927 with SMTP id 2adb3069b0e04-52ce18647f7mr1944648e87.62.1719207343703;
        Sun, 23 Jun 2024 22:35:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63bd790sm899580e87.93.2024.06.23.22.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 22:35:43 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:35:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org, quic_sibis@quicinc.com, 
	abel.vesa@linaro.org, otto.pflueger@abscue.de, quic_rohiagar@quicinc.com, 
	luca@z3ntu.xyz, quic_ipkumar@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 5/7] clk: qcom: gcc-ipq9574: Add CPR clock definition
Message-ID: <cso2vpnfn4pzppil4ojmqzlus4uxnozejfe6rpobxbyy6k7gbe@4yify6sgcujh>
References: <20240624050254.2942959-1-quic_varada@quicinc.com>
 <20240624050254.2942959-6-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624050254.2942959-6-quic_varada@quicinc.com>

On Mon, Jun 24, 2024 at 10:32:52AM GMT, Varadarajan Narayanan wrote:
> Add the CPR clock definition needed for enabling access to
> CPR register space.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Add rbcpr_clk_src to gcc_ipq9574_hws for registration.
> ---
>  drivers/clk/qcom/gcc-ipq9574.c | 39 ++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

