Return-Path: <linux-arm-msm+bounces-22565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D18329069A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 12:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6A971C219C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 10:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F45E1411CD;
	Thu, 13 Jun 2024 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qUfUnCeU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F18113CA95
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718273281; cv=none; b=KCEOjafqOhZJv5bewGMOQQ+e0TxVHHlaMYVielNsA0fjLzCkEbkonzFC8XYcpehdNnU1wSVlg+cJqMx+FH/6Eh5jnZVf7x7HD35rU1VEx3n/7cb7yMaDgF5ni9EwZAwRl6AynhSj0la/jHuRUNoU5WyLuX+nuL+66FWPsV/7Ytc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718273281; c=relaxed/simple;
	bh=oDpsC86xnQTDxHdbvxBVXExSH9BkhxRWqhOh4TQqauI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0n9ZbG6N4gwAwygcKSsbWnLB+fXpdZxxLNY89Ywy2AGU6Q+wQVueVXZx5b5OPoMlM9pmV7QKX5/xE/f1q1kfcDARNtfCPx21ok3IVcNJa39VnMB2ZyZZgwJ3jGntlAqCN5bCD+onPDJB3LvxZaSCpYAl2TOSbPx3Q1Tqd4ngoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qUfUnCeU; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52c8342af5eso969214e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718273278; x=1718878078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RYvXhUR4MqvdO8CyI6lyGFQa8ObvUY9+LLJIm6+1jFA=;
        b=qUfUnCeU186J4CoMxjdATurELfr4JGVWKXBXjLhcYVs7dDnTEwpQ80Cm0Ii2UykXtt
         ZA97QZUNvpKyxB8QmMEPUc9UeD19H8SNZHVc+0iYyq/gZ+mqTeQA8EtZd7AQnIqPihR5
         NJwgO1tYipHgGoAKk6xnn2fruJ7T09zgjyo9fbZc+1EZU5Y+22MWzFIyvkHWPuFk8O/O
         Z70PsYqpDIiryxIeUlqA2mpeH5Eqhxb7os6Fl5zZvVUhhHVB7IrqXH4X9/CpsI9ZEfd5
         woELrfwLK+0vE1h8KLL2dwpZJr/Rk9wEiMbE3EqjeJc4nIcARghQ/DhscA1hUO0bIKAF
         L4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718273278; x=1718878078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYvXhUR4MqvdO8CyI6lyGFQa8ObvUY9+LLJIm6+1jFA=;
        b=pc4fWWW7IBMSIPnKODnrCoplAcEiIhDqutKILRdkwUVW00Utq7rnj2+DONTq5iNGZM
         ueWORM15EbpDyMWhsQNnskaPua7VNHap2flikh4oYuPYLPR3hhPnDNSSqzPH4VA2kXnH
         SDeDA3uEwstB6SGZD1/1TZ4vue+0d7ZbmVtehhFQBNYHBqZ8oe1ZzCkVACdrC06dUzxN
         M4uYitKprK3/HIlp2DS9wld4iov+c5b4rq083qJv0fwpXbVPcZh102YhE8vLOKyG8wW+
         erx1dA6utfmaoo+dyhQ2LKppsy2sEiL1ODKFVVn3LTTZ9qY81DkKgK7kLc10eUZdWsfI
         H/ew==
X-Forwarded-Encrypted: i=1; AJvYcCX0dBFLEEsyAAanYPxZXFqFyW8J3pzS4wMwo363x5bYWb/2MZEGi+Y5UXXRJNRhT6tmw8pbeDIGVBRrDqkMbdhvsWruwAhMc4QMmfMUQQ==
X-Gm-Message-State: AOJu0YxSBuZfi+3ADqVtqGCGDdPnAmEFpxi8JFerASA/CRn4SDVAE79F
	pJ1iTTu7dEbb9dL23k+eEkJYuRInj4ABgBTaIrDTbp4m+s6FaWPgLz/QTAQKOgo=
X-Google-Smtp-Source: AGHT+IEIfjbzuR+TJYfn0WkM5bFWWQE5UXg72/ta38D4UK601aQPCRVEmPoKXYW21UYlolSVF5CCJQ==
X-Received: by 2002:a05:6512:3096:b0:52c:893c:6c2c with SMTP id 2adb3069b0e04-52c9a3dfaeemr3306688e87.40.1718273277753;
        Thu, 13 Jun 2024 03:07:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282f2aasm148599e87.85.2024.06.13.03.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 03:07:57 -0700 (PDT)
Date: Thu, 13 Jun 2024 13:07:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-tx-8998
Message-ID: <qf3erx5x7cigdsel6eh4nb4cl7733ag6qxxeblcdjzys6dnrul@nl7mzrm4ljji>
References: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
 <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>
 <Zmnejlkb869mN3eS@matsya>
 <af3f71e5-6864-475d-aa90-74986d516bae@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3f71e5-6864-475d-aa90-74986d516bae@freebox.fr>

On Thu, Jun 13, 2024 at 04:02:24AM +0200, Marc Gonzalez wrote:
> On 12/06/2024 19:44, Vinod Koul wrote:
> 
> > On 06-06-24, 18:07, Marc Gonzalez wrote:
> >
> >> HDMI TX block embedded in the APQ8098.
> > 
> > This one too
> 
> I assume this refers to:
> "Why is the patch titled display/msm, this is phy patch and it should be
> tagged as such."
> 
> I always copy what others have done before me:
> 
> $ git log --oneline Documentation/devicetree/bindings/display/msm/hdmi.yaml
> 27339d689d2f9 dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
> 6c04d89a6138a dt-bindings: display/msm: hdmi: mark hdmi-mux-supply as deprecated
> e3c5ce88e8f93 dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
> 2f14bc38d88a4 dt-bindings: display/msm: hdmi: split and convert to yaml
> 
> Are you saying we should diverge from the previous nomenclature?

This one is fine. For the phy bindings please use phy: prefix.

-- 
With best wishes
Dmitry

