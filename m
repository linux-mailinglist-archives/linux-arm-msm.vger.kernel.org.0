Return-Path: <linux-arm-msm+bounces-38457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2292E9D3926
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD1CD2868E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BCF1A08C5;
	Wed, 20 Nov 2024 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rDK8OpDm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2658A17F7
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732100819; cv=none; b=PFvR6pc032EZdDmx+8UXeW+yo2QqiAnIpYjAOTfn1a9+MdZdH7XSwJYBLy4BoTDzPp4G3ClLY4sZ44IYQks3/KUOs25T61Fx/fISvSyKe+zJ9e4nin2HR483CqgaxtHN1aTACDQaua+EHAkod6jDqTP6wQGFOVTf3PUhFKfZqIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732100819; c=relaxed/simple;
	bh=Opw++HCPzuvISj9795BFVznYxd3dwYjAw4EH26M6vSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNCKRBgaU45rGzLb6Fbq8yKJXLOUoHJeS/a9LYBFdJdiYaKTBhpp59X+x63b+/XY0kZCxVLcL5aL33ZjeVNI/OuAfKN/5pgN4QD95f9oQvojShc4FUIHgkuEzPjxuS0ntT75J3De25hPKTahWvmM/KtDkelZD7LtF/dD6C5RFy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rDK8OpDm; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53da22c5863so7241839e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 03:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732100814; x=1732705614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qhI9rDcFFsjnQk9S43iaxw5ytZ2AHt2y8QIidlXD0lA=;
        b=rDK8OpDmTqDbBAeTIVurN4+bYqreffeHZeho0VUIKvF/hoUO9H4SkvMq60199XaoC3
         0mYMqu1XF5EaSXpdPr1gGynVvETquouXVnrMxQosFD1MO3iX+fNgop91yzIHge5Xkk8b
         VyOAFs8StnfJH5AEdnOrLfK7zVrAVSXQ6ZPw7vdckklpGP7OXwaAAC1G7wYn1yHXVjQI
         exFRmfRV0qE+gFZvInYbwamEZd2NDGTbSvbNgeWHfFWidufrhknM2oENXnBMdOdaLcIv
         HjlvFuxtT4iPjLH0IY7ivxcVyJ2To4ZrwC0D7kdvcQUve/Df702khUizZfamEn6quZr2
         EfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732100814; x=1732705614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhI9rDcFFsjnQk9S43iaxw5ytZ2AHt2y8QIidlXD0lA=;
        b=Agw5DfMsT+q/Hov+ucEWrd86/p0HmgomKzDyr5MjID0AbUWOyPdqmC4RiieHdMCadf
         CqV28l28lB9gUCG/VubCC0WklEI8BidWJ6mrjRra1N0pmTuIC76go80Kwp3MIuzb+QEc
         oaha3JKuE5iC4vRx2JksB6493TpkWJksdm9qQ+O+7lvHHBc8ci6y07HJozJYfKAob4XI
         TgNrTr+ahvgHo3YLL5rFPupN+sg+ikHt5iyPS+lgllOsm/X87cH0CkqZFFJi4FDKAdPl
         0pJRpsQsKZVpzHPI+5/prwTgn5mCroq6xWvluJHzWBXGoVPFL9X0dD/8UExWcCQKJrnF
         F7uA==
X-Forwarded-Encrypted: i=1; AJvYcCW3CuP5ja3nYTAkzrAPaZyqhrwkhVEoQvY93aCFkRZmZaoukCcM+7g7/560TS/45cQ48tB/6fn77pQOvSH/@vger.kernel.org
X-Gm-Message-State: AOJu0YxhiqXKFEqd3SsOGjmSzgEB7iuBv0nn2WRC69I6gnP6RFQMYdHB
	oD40Dg2jypbED/trXzFa2iHOlR3vl7Tu9ZUO1naO84O5QO+mbOqlVW4jGCTsytI=
X-Google-Smtp-Source: AGHT+IFLYKw16+LDmrFlZjXXDXMHzk0CaMxx322Elr/lTZUAtJXwcvx8rBLt4IaAsdsomBMIPcfNyw==
X-Received: by 2002:a05:6512:3ba0:b0:539:f8cb:f5e3 with SMTP id 2adb3069b0e04-53dc1373ea4mr854241e87.48.1732100814272;
        Wed, 20 Nov 2024 03:06:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd3fcae6sm605075e87.102.2024.11.20.03.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:06:53 -0800 (PST)
Date: Wed, 20 Nov 2024 13:06:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com, 
	quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
Subject: Re: [PATCH v4 0/2] Enable Display Port for Qualcomm SA8775P-ride
 platform
Message-ID: <kh75vjlfxiglbwmbbu7l77baboe773n2tpmw3urn7yuf6srdep@rp657fnrjgnu>
References: <20241120105954.9665-1-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120105954.9665-1-quic_mukhopad@quicinc.com>

On Wed, Nov 20, 2024 at 04:29:52PM +0530, Soutrik Mukhopadhyay wrote:
> This series adds the DPTX0 and DPTX1 nodes, as a part of mdss0
> on Qualcomm SA8775P SoC. It also enables Display Port on Qualcomm
> SA8775P-ride platform.
> 
> ---
> This patch depends on following series:
> https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
> https://lore.kernel.org/all/20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com/
> https://lore.kernel.org/all/20241018070706.28980-1-quic_mukhopad@quicinc.com/
> 
> v2: Fixed review comments from Dmitry, Konrad and Bjorn
> 	- Added a new patchset to separate out the soc and board parts.[Konrad]
> 	- Patchset 1 now comprises of the soc parts and patchset 2 includes board specific changes.[Bjorn]
> 	- Patchset 2 enables all the DP ports validated on the sa8775p-ride platform.[Bjorn]
> 	- Fixed indentation errors in the dtsi file containing the soc information.[Dmitry][Konrad]
> 	- Updated clocks to be used by respective PHYs.[Dmitry]
> 	- Added mdss0_dp1 device node.[Dmitry]
> 	- Updated the names of PHYs using label prefix "mdssM_dpN" for clarity.[Bjorn]
> 	- Avoided use of referring any label in the board(dts) file in the dtsi(platform) file.[Bjorn]
> 
> v3: Fixed review comments from Dmitry and other minor changes to prevent warnings and maintain alignment
> 	- Added specific DP connector node for each DP port validated in patchset 2.[Dmitry]
> 	- Updated the reg value to 1 for port 1 under mdss_mdp in patchset 1.
> 	- Fixed the register address space for mdss0_dp1 and mdss0_dp1_phy in alignment to the 
> 	  register address space for mdss0_dp0 and mdss0_dp0_phy, in patchset 1.
> 
> v4: Fixed review comments from Dmitry
> 	- Added p1 region to the register set of both mdss_dp0 and mdss_dp1
> 	  alongside validation of devicetree against DT schema.[Dmitry]

NIT: Please describe changes in the logical order: newer aka interesting
items in the top, historical changes at the bottom. The "b4" tool would
have handled it for you.

> 
> ---
> 
> Soutrik Mukhopadhyay (2):
>   arm64: dts: qcom: sa8775p: add DisplayPort device nodes
>   arm64: dts: qcom: sa8775p-ride: Enable Display Port
> 
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  80 ++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 218 ++++++++++++++++++++-
>  2 files changed, 297 insertions(+), 1 deletion(-)
> 
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

