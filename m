Return-Path: <linux-arm-msm+bounces-60219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C669EACDD8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 14:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C6D43A59BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 12:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803D228DB78;
	Wed,  4 Jun 2025 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ydSWUQ/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAD828D8FB
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039027; cv=none; b=nssDAXuFZ702+fUI14qXZSAv1+4VHDnhPgJo1htpJouazWBEqYXIQPCru0NPQ2ei1bHQ5MOysYf1XsqJ4yQioSk/M4Vjl14Gi7pbpwwtooaOhP60OUv839Ut/mFNSzPuRcFvo0Qt7YoOvV47F9pk1m7i+JOZSjDvYDCthURigFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039027; c=relaxed/simple;
	bh=2qRhj+8PaD7KbS+ePJC+FIyfrnTKwmRG37BmkAjQGxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B53c74TZDzWAJbGsjiRSQuIoyuoYOXpzt+Cj5ctzQ3NLcJgs25G/jO1jIvDolLtTqX/FWtwGX9L850ar/C1zTawTNwtEO4TmMi4SQnxCRg9kvoHU7+OTDyg9YUmnYQEi7AZnAbGAC013MQDLs2NQLmKD1GrCauVrta+KucWsGIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ydSWUQ/K; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b2f0dc1424aso1125288a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 05:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749039025; x=1749643825; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pWB1gx1mno0s7eFeJEUn/nD76wT6cl2IYjc+kN6JYkw=;
        b=ydSWUQ/KtPdi38pFMGjiNI8vQAz1YrJGjTRYBMNh3lVcpKha+82Tjs8ieW1iO4QAXG
         rPsWxto21L/+D8WL+0hSrZwIZ8DOA4Ye5cjiaiasXD4i2MdYwu3KES33K3zT28/j/WMF
         OvSASVFNITGd9SKvtrrqFbIqtlmQi1jkxIRGnEzq0LBs2CXIdPx4J2iPb2dKxGacN8ul
         leSWL/EuTtK5bp366e/pvE3r5vC3soT7R8s5SRBUngxxRSGLgDaEqi2IMWQDly4mr3Nm
         4LEkqu0KfyTcfWAGQX8Zf1zaqqUMqIMuXx954eL2+yiHMG1Q0HNU6dhY+tBWRn94K5FG
         BzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039025; x=1749643825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWB1gx1mno0s7eFeJEUn/nD76wT6cl2IYjc+kN6JYkw=;
        b=JyJx9/D3te4A9qks+eSo7vNcKErPcn2NeAK9eUX3LIiwh5D7M8p1YRGjjH66V6KqHy
         hY+I895WEF2Ar+uef9vw5XaWsBSqAKHnGVC2vfQ2x2HZ7LNsbJM8pvVwVwwbtc7l8gcE
         PjrFgDBUSbn7UmpKfbva4z5PJj8SNKYq5Dv+akv1hOFhKNNlZuZsGh22kpyWHSuuaHBQ
         4T8tvq5Z/csKWZLTfY+Kte6wZGq2+DG4nJd7mR38ubxv2FX/IMTtL+Sk38vqMsfNKtHA
         I3kmp2DAlkewHR22E/2zBXZw47y4DUW3LDaLtwvHQKz77BSqANeEcByfAkNWR5yfmkmi
         I8jA==
X-Forwarded-Encrypted: i=1; AJvYcCUp1Q35ItKMkuieb81t6eTBH7HdkSTHw0bKu0wahV1ZMC7O5XNIKKMsHhY4eaSK64hrX9yxMK+5kQnkqyCu@vger.kernel.org
X-Gm-Message-State: AOJu0YwruZ6Ea/FNYvkAHFe/8BuWz1OhAiZrjJS4DX3w2/jj1u/hVzTH
	Zwqte4z5kvd9Dmu953sgJiCrGoxBipxYn+H1Fp6sJ/CzpjItw6CCJSr00qcxj1lOvg==
X-Gm-Gg: ASbGncseCIxWeqVv0A4BVO1QGeyh1XwZwmVMSxKdfkLQbxvoTkOjaIXiSZGDwM+G2DW
	gTplqwmURGGKqOb0Qcs/dgH34zTrh+2V0hCXybb0wRv3Fu9bFfywWhc2o+GDRmEEZOlM+ppov+J
	/yJh/W2AAi0U6f+jAR3CB2I4xvwYMVj6MsdFzh1I5EProWiEWujQduMeMjYxxVhV3SjTyAT9AAr
	R/EmLIDVKd5YoxRPfrG/C2cxxkup4OdgZwzZFMfiHKX3ecQ4AXyMnPMoXvwJ5X4GTw9ug8E9JlJ
	WYkRYInINvy+yuw8JJa1FFc4d0CUnSgB/9LjWL+cR67u/BWhpnf37qcGgMOS2w==
X-Google-Smtp-Source: AGHT+IG57XGK+U+lVqYG/JIjQeIC5Z3vtLCeEP/XJOi9Tpj75vDY8Loup1Fc3OWKbmi7pysssKLxpw==
X-Received: by 2002:a17:90b:4a10:b0:312:26d9:d5a7 with SMTP id 98e67ed59e1d1-3130cd2b40emr3886359a91.20.1749039025081;
        Wed, 04 Jun 2025 05:10:25 -0700 (PDT)
Received: from thinkpad ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3c0db6sm9661015a91.34.2025.06.04.05.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 05:10:24 -0700 (PDT)
Date: Wed, 4 Jun 2025 17:40:20 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: bhelgaas@google.com
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] mailmap: Add a new entry for Manivannan Sadhasivam
Message-ID: <ejg4ds3igm3njxfhtjx7uoh557tzh3tw2ig3srixlvlyaj5man@rs3gx46dahmk>
References: <20250604120833.32791-1-manivannan.sadhasivam@linaro.org>
 <20250604120833.32791-3-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604120833.32791-3-manivannan.sadhasivam@linaro.org>

On Wed, Jun 04, 2025 at 05:38:31PM +0530, Manivannan Sadhasivam wrote:
> Map my Linaro e-mail address is going to bounce soon. So remap it to my

Err... s/Map my/My

- Mani

> kernel.org alias.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .mailmap | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.mailmap b/.mailmap
> index a885e2eefc69..1e87b388f41b 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -458,6 +458,7 @@ Maheshwar Ajja <quic_majja@quicinc.com> <majja@codeaurora.org>
>  Malathi Gottam <quic_mgottam@quicinc.com> <mgottam@codeaurora.org>
>  Manikanta Pubbisetty <quic_mpubbise@quicinc.com> <mpubbise@codeaurora.org>
>  Manivannan Sadhasivam <mani@kernel.org> <manivannanece23@gmail.com>
> +Manivannan Sadhasivam <mani@kernel.org> <manivannan.sadhasivam@linaro.org>
>  Manoj Basapathi <quic_manojbm@quicinc.com> <manojbm@codeaurora.org>
>  Marcin Nowakowski <marcin.nowakowski@mips.com> <marcin.nowakowski@imgtec.com>
>  Marc Zyngier <maz@kernel.org> <marc.zyngier@arm.com>
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

