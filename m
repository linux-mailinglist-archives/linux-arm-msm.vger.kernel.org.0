Return-Path: <linux-arm-msm+bounces-34104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E96B99A536
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAE44288E6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 13:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1DA218D93;
	Fri, 11 Oct 2024 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NIqsoIKv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877DA2185B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 13:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653822; cv=none; b=VDBcKN5xOj6l0/7bG5aloiqHTwBkVPEg7h32pe8vpewZCPAngJvkT87+8/IdiXIVKxFqltYykKc83REP6miFL957yAAM5cPShmVB9McpoLz9w8QLp/KVKwRUtbA8iRO+bbluIy5D+Ptlh8cQmn3i6ql5OIWAwttWCpS2tfACvUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653822; c=relaxed/simple;
	bh=SAhP6ZeDNEgR1+A/kJ8320h3rWrwnh7Se7+LoNaV7jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufkAxHHduHL8MYz6PJT3Cfj+2BEfBeGX5+xKDXuWLAoMj1w8gE1g8ynCUchYhQXtDwHIoISPqTPG3I4HsdZyLQLPXBaAlvJPn5MYjsS/J8u9E9N0f/xDUygVUevtoxn98fEIY8DG6KRDq+lh3LU/iyU8ZeuAEwXxs6/kadl6kT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NIqsoIKv; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5389e24a4d1so2517575e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 06:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728653818; x=1729258618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LLXvMXXy+onUMhQ6b0XOwwTzakrzaQZRd+ecTFnJkKU=;
        b=NIqsoIKvGCOiBxo4kTXCl82SIZkw+wuf10CVrZKHd0xPjQF0vzj0uCDPHsPxrXi0ZC
         jNMIbXt+pexLbk/3+7r398dDmFfKy/DuoilR2dfTaVNI7jfAKbU09uTOrT8Ba8U76y/6
         A437J+sgDnAp/QlXhkdSN8UradIivahY7Da++nacnILZ9JRZnrroR76187QlaisAhA04
         cELrfuOcdsn4XD+0T46NjpDGK9Bz362OVQekKgZyX83l7lamBR/PBQclrPeT3JD22Y2X
         8kr3XY75PXwCDnk20uoVKskLAiggKXbLtRdmmfCY5WCNXPMUduWcKrwW/CdpeAOKKmZu
         vKHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728653818; x=1729258618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLXvMXXy+onUMhQ6b0XOwwTzakrzaQZRd+ecTFnJkKU=;
        b=Phpu0Oz3RXrAGmZD7iydGylK/fH+hqmT3dtU4in4MV54QY9/XbfLzMfDIMZdmo8Kg6
         ycUjhkg0HseWRyo0zmKXsGkQWfsjcxnkXquSzATwof1hT1VFbYS8mJOOi6dyvTZSX/Ei
         C3bueioIe8W3iseXx6Q3VQRj4F9vWnkRW+zxZZC2wzVwFwV+K2Vu6wn9XJmmukGqjQwQ
         4yUdVbiGdLUzuii41TSaz7ddxQqdwabWeb8nXzB9G4nsQbWd6q+0Yuyklp2gbKIkbQIf
         VVb9jhivvF+Y1IOGOBhn6lz2fJh2UXirhZ2wRBJU1Knt3B+XebFzQeiiH58sdKLhrO30
         pGew==
X-Forwarded-Encrypted: i=1; AJvYcCV7nGxSgoNMU+CfGT/FYp07otbXvcyg6+5cpwkdQZANs/Fw1NvXR+c3PXk7SV3pQc5QJwBtRmR+Tujh2Pbb@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi326E6xmto72k1LiBIK9f95J7jJ0fSW2PiR2UwZOFydQFYACh
	21nGZwJdrZKTkCQD0qFX5eNbqpDKO34IsSfO1GEcEn7pCiMnjdHzMAPu9C9TKR0=
X-Google-Smtp-Source: AGHT+IGntTefT/PAzN87k4mxkHYGpta3nc0hWK276rYQ9gJXg9bf9uIR3RGfaMXE2WNaM7hpJi69bw==
X-Received: by 2002:a05:6512:39ce:b0:534:5453:ecc8 with SMTP id 2adb3069b0e04-539da5abc3cmr1478285e87.52.1728653817689;
        Fri, 11 Oct 2024 06:36:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb90527dsm605226e87.248.2024.10.11.06.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:36:57 -0700 (PDT)
Date: Fri, 11 Oct 2024 16:36:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, abel.vesa@linaro.org, 
	quic_msarkar@quicinc.com, quic_devipriy@quicinc.com, kw@linux.com, lpieralisi@kernel.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 6/8] PCI: qcom: Fix the ops for SC8280X family SoC
Message-ID: <wfwswubquat7a7rprv2oqqzywiiosvmvhefty4tlfe63rlgzl4@6ckw7xrttqnt>
References: <20241011104142.1181773-1-quic_qianyu@quicinc.com>
 <20241011104142.1181773-7-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011104142.1181773-7-quic_qianyu@quicinc.com>

On Fri, Oct 11, 2024 at 03:41:40AM -0700, Qiang Yu wrote:
> On SC8280X family SoC, PCIe controllers are connected to SMMUv3, hence
> they don't need the config_sid() callback in ops_1_9_0 struct. Fix it by
> introducing a new ops struct, namely ops_1_21_0, so that BDF2SID mapping
> won't be configured during init.
> 
> Fixes: d1997c987814 ("PCI: qcom: Disable ASPM L0s for sc8280xp, sa8540p and sa8295p")
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

