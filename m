Return-Path: <linux-arm-msm+bounces-33531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFD19946FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 13:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A17EE288586
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 11:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DFE1DC730;
	Tue,  8 Oct 2024 11:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lGe+jlWP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678D21DC759
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 11:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386943; cv=none; b=DPNwfuovH02tQ1hnRpPYDBZi56BOSqlOT0C/vdtL8x4v6WcHlZagVOuZbSZo5HTkVm1Di7WFrQUu8B3u2HX3ksHN8XYsZpcaEQWNEQ6nRbH6Xvbkv48OeNWQlPPZEQwcc4jCVUvQZc0mNH5bgRUuHPG+vklg9iiS5fFis3tVfY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386943; c=relaxed/simple;
	bh=pWFbDcknMazlx8NODKk/+fp7Z9BuBgyp/Z6cOlwCKnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lH15FbXiU2rPW2QAdJLR/C9EiAvfbHt3kgXY1TV25hzDs+kaXd04yfTjQn84Gp6gIcniiSIcaRnn8cDgOlcl0Ou1H6hXwPH8W1mKk3YFizDx/3IFHzQuGLfML18gZEec+INTaidudR8JV4ijAmid5eGp7kLAfgKO2jFlInCSAFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lGe+jlWP; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fabe5c8c26so49502141fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 04:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728386939; x=1728991739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pbLUPDIL9MqCGxak7A2AGDKL7dcgIHQmE9ArpzFQ+0I=;
        b=lGe+jlWPYeZMo526hx49cerA/TjjaAhik5uI5lpMxhZq3gALLm/IF8hpfkhAwB34Fo
         wfn2QsHDdLzOOywyuxceoi8M/UV5rEHBNJprkU5HJHXR8+NB2r9j10KJPSX1ODlRcqyh
         CG21XRTrf74oISBGG5O1MHyD+6SXfa0WXnPkTtesP+KmWVPoq2x+zUFDSivrsE7FCG1m
         x1GiZzyRIzAwBMhwmkEO0fwD5NfUueiSreGOOKFluZfWfIzrgC0qIKHnA2muCvb+ukgq
         Pg9oixtb3ynPDvwZNoivQ2LrBBN3mQ00T0u2rttQNrnzN9HbPpc7+Dx0nmR3hD8IegLu
         GU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728386939; x=1728991739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbLUPDIL9MqCGxak7A2AGDKL7dcgIHQmE9ArpzFQ+0I=;
        b=dRU1X1bvOXG60UXzaGEQPEDjtp/NIDq+qaAtKe3wMMs0lq7WotbqsUJXJXy2ixWlWi
         RK+Z+zPYfCRjDa3BLrOOIJkoE6Nr9Uyph8GpPmNbE9bREPowiuvVTAXZYqHUo/kE3fXs
         dEXhMVaSSXkI3fUDyKcfqbWPgyesitXQAEzCRJHgLCeIJ2m+xuMvpeloceE40SAwHA5R
         jBl/EUp6TM7tRBbT0C5L2paveF367bkkm8ZbBLga74TGpFUgxntE9zCgJMfZhunUvOs5
         ZZfVFUt0Tu8M+ZbQk5HABPXUO32jraGI/NGs1s+NkOgfTCpCE7nd6onaGN3Axs+abkTq
         3iug==
X-Forwarded-Encrypted: i=1; AJvYcCU74tHDiefDwOdpzSka8afCXs3yvhHkOHQnE2YPMcnFdmJyRXB/md43Xpgp+a2sNkMp8qTmUu3NmhMBSDxK@vger.kernel.org
X-Gm-Message-State: AOJu0YxvmwYauKyvXMvDr31kULQ4BpKKjCfENHQcTlctwtKnOtygexCg
	ZQmqrDoO+mrDG/TLL17Iy06Hg5ufc08JbZnHvcj+rQXq+nelt/RRElNI05Bxj4fiTUFXU6+nyRI
	AdLoE9g==
X-Google-Smtp-Source: AGHT+IG/4MYI+0e8fgp5Wt4huJA9UKTSH/cuetOVOW9NUY0hLPvhAIvXBETN6uEJfnpsImBtZ24cWg==
X-Received: by 2002:a05:6512:4026:b0:539:9f52:9e4 with SMTP id 2adb3069b0e04-539ab9e40eemr7256572e87.48.1728386939317;
        Tue, 08 Oct 2024 04:28:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d364sm1179657e87.126.2024.10.08.04.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 04:28:57 -0700 (PDT)
Date: Tue, 8 Oct 2024 14:28:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_renjiang@quicinc.com
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: add video DT for qcs615
Message-ID: <l2jd35azdgowcy3dohuxcks6ityqv32fhmehjm5bkepkqf3he3@752qhuz2gzoz>
References: <20241008-add_qcs615_video-v1-0-436ce07bfc63@quicinc.com>
 <20241008-add_qcs615_video-v1-1-436ce07bfc63@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008-add_qcs615_video-v1-1-436ce07bfc63@quicinc.com>

On Tue, Oct 08, 2024 at 04:46:34PM GMT, Renjiang Han via B4 Relay wrote:
> From: Renjiang Han <quic_renjiang@quicinc.com>
> 
> 1. add video DT in the qcs615.dtsi
> 2. enable video codec in the qcs615-ride.dts
> 
> Change-Id: I80017997005878145a22fc8f38c0ffb653938aee

- No Gerrit tags, please
- Missing dt-bindings
- Usually it's better to separate SoC and board changes into two
  separate patches
- DT patches should come after driver changes.

> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 12 +++++
>  arch/arm64/boot/dts/qcom/qcs615.dtsi     | 75 ++++++++++++++++++++++++++++++++
>  2 files changed, 87 insertions(+)
> 

-- 
With best wishes
Dmitry

