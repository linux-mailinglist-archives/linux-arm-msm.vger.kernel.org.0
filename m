Return-Path: <linux-arm-msm+bounces-46991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63208A29E29
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 02:00:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EF951888ED8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 01:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3552838DE1;
	Thu,  6 Feb 2025 01:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uay2lbrI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D558714F98
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 01:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738803632; cv=none; b=Oo3vk0H9DIEEZro53cuk0qcyZM8CHwRJFxIWjoP4TAtMNUJ6tJ3zHUJ2w3Nu8Dls9ryybQ3L3VP/HTs6Y3sg/w1BZuLVAAGt/LAjrX06C6dA8/KX4QRkEsTIAz9Fq9DUtErIMxhX3g5X8bOHjKrCoH6JhwgbVV5Fkqh2CCDnmfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738803632; c=relaxed/simple;
	bh=YA9beyVyNV2UIf6sOTfOynJf8z+PiAQR/WP4EysO5Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7jmf1RTVf6nOwkJExqakFwl6NNb6zlHZOCni5HcWclDy3P81D+kHArWCjSZx4rj7UsFbQqFtqkFFIoltgXRou0Xy1AljZlOgzxVou8JIi0tL/U4igSDihy/Sq7j/+qPn2KZ0zpLk0zmxW2OXXYKff1+zyMX53v3xhYPST/OM+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uay2lbrI; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401be44b58so440946e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 17:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738803627; x=1739408427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=64EGE0H9PZ2lu5z080wv8hkP5sMcDd9LMSd8Y5hei2c=;
        b=uay2lbrIphuPFUCcLrqYtEIK6aI2VGKjw0uGP9Euye9HH/J1XQY5a0mLt10tTd31PT
         4bfcNax+FhnkvznleBp5mGNp3gmuCziVgJNX69vAxh828AaeqRnfB4QHixvJEv4gwy8T
         TES3F+MPpoxJy9dMSCr7PZ4x1wPdSbVlecmdcigDJQ+RhPp8aVij5lYLrhP/ctV5FGtK
         na2Zkf0Gxc3aBq1iNJVxnjkSGMYUsxmKc+mnAGcCL+jOjCRfs/qk40d588O3HdLBjANk
         q/RO3x0dWz0/kSU0j/R05aIMMp+tZWih1+YLiSqUA6dATahrX2I08Nk/QmwHTLcZTS1g
         FMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738803627; x=1739408427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64EGE0H9PZ2lu5z080wv8hkP5sMcDd9LMSd8Y5hei2c=;
        b=NbZ5Jai8DW4BQWpUavfqDv51/wIwvBf5+g93G5tncL61/Bm1MNHMdYy5Hkq5MKWORF
         d3T4mo9M6kACyWbiZzwkz8ioMCTLdr+bdohIiHEpY3v/prgaxt9wiVRERIeW9gX0cD8M
         a3bG0pMYiDRK7vEp/fMmhMl0Hj7q4amU1pM5+rKuGx4Hhb8fEeHisKbdRpm10MwbwvqX
         hKq45rfWnTzC4fkht3nvZuTBG3VpU61IcHn2mmR/unPr+WOdU5aoUI1t16radpFADdqe
         U2THnn1y1ZYN3YyNMGv6duflrGmV41MgQTwLptcqXbd1t1bjjFKXJjwAlbDuI7ZtPZsw
         I35Q==
X-Forwarded-Encrypted: i=1; AJvYcCVp+TBmG0sh4eLYTR3+bFpVyAdnQMMYHq9k8AkrEyrDlJV1C/Izpfo5M9y7Ma3Hx3g9L8RycdhbU803GsOW@vger.kernel.org
X-Gm-Message-State: AOJu0YyZktz11QGg7U0WOwtWrJrZhLUQgn3PQZcYid9uz5LvDU5L2zhe
	CE4hx4OLF/4Wq9IS5hS0pmPjccQUeRDOtOHDsra7wjf2wy0pwSsjLMQSz0kDWa4=
X-Gm-Gg: ASbGncuBvnIlTEtjQH40Kvwf8own7a2nCh0ATWLNivs5iAbPLdgqJRHb44PHr2nquIg
	wlGWbd5j0fAY7JB3rZXiu9m+VbT1ovsYuN2WyhzAR8fuNZeOVkyFxmvHeDr2rIJIU3FGP7kFDQa
	MAqx0dETrrWqyFPJjuqv2gN2KCxKauic8Nj3g8XwddrjPuaPWg/bVhxaPvVMI3Nx3bHcxFZMAAn
	sX5F1HreuSbuRS+9XV19Tgd3WuX1iBiBCmCljZDz1DQdSNPGmWouCBq0REmnVODNDeQs0sHfznZ
	WZWzqIHJ+BQskywFgJcdMAn4hunj7Z0gR4Y79pUNvovypSow65kLPiIwIflXpwIYWcxu11s=
X-Google-Smtp-Source: AGHT+IHnLGYjiexVyjpyM2PLfRR2Axnq7Xdo6KWRYUCGpLamUudjFaOtVpU/Aplwgvu0XsO0JkhcgA==
X-Received: by 2002:ac2:4e04:0:b0:540:353a:df90 with SMTP id 2adb3069b0e04-54405a6912emr1688393e87.43.1738803626872;
        Wed, 05 Feb 2025 17:00:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105bfc8esm2878e87.127.2025.02.05.17.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 17:00:25 -0800 (PST)
Date: Thu, 6 Feb 2025 03:00:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Odelu Kukatla <quic_okukatla@quicinc.com>, Mike Tipton <quic_mdtipton@quicinc.com>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 5/7] interconnect: qcom: sa8775p: Add dynamic icc node
 id support
Message-ID: <ujsy5e4u7inz5mzdh5m672zkfcrd6igoypgkak2assfpvlcrve@mmjlabr6rh5a>
References: <20250205182743.915-1-quic_rlaggysh@quicinc.com>
 <20250205182743.915-6-quic_rlaggysh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205182743.915-6-quic_rlaggysh@quicinc.com>

On Wed, Feb 05, 2025 at 06:27:41PM +0000, Raviteja Laggyshetty wrote:
> Discard the static IDs from node data and set the default node ID
> to -1 to indicate the for dynamic ID allocation.
> Update the topology to use node pointers for links instead of static
> IDs, and rearrange the node definitions to avoid undefined references.

I think it might be better to forward-declare all node entries at the
top and then keep currently defined nodes in place. Otherwise the diff
is pretty unreadable.

> 
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---
>  drivers/interconnect/qcom/sa8775p.c | 2194 ++++++++++++---------------
>  1 file changed, 962 insertions(+), 1232 deletions(-)
> 

-- 
With best wishes
Dmitry

