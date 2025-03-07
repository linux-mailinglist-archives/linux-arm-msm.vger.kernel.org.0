Return-Path: <linux-arm-msm+bounces-50606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 463C1A5606C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72046176B1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81E21990C4;
	Fri,  7 Mar 2025 05:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z22T23Rj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7B4193084
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 05:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741326732; cv=none; b=oThRK8oT9MQmVsBaIxjX5JzGjaTx9WaNZQ3Q1AqfYsNxkZC9/nE/xzFpcmlhcnPdtuFsuDTOVZe63GmDAvXb+pEkTHCUnt/nbmvU9nLbvUb1Onn+QqoUTr/M0z8b6qlQO6IZGzI8DxjIYbpF3R6+lKLOqEQB5Q5MNQbx54QWZQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741326732; c=relaxed/simple;
	bh=YJnxjBOJNGJpsAtvdYJofjwEZlD5vwrDmuoRdMrN4PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFkS6GdF3NQkVVjl2UbMKdl8mAqnCGJEXnvPp4Jm9jL0Ng/Ba/HgT/2ODt1dA9GMd507wg9yub15ZSd4z1vEs5vY7vXhOVu5fBR9MXsfUgkFt/Jh85kkcmfZMbeJHKIbtoa60AxV7w/eIUQzIWAuf6xBKscfdMGj97/T1AeBCv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z22T23Rj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54943bb8006so1640953e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 21:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741326729; x=1741931529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=97xCV+Gvyecw927R3SbsNwJBWiMKRLeo3l2nPZL/r98=;
        b=Z22T23RjaQ7hR/bhCpL21ODdRKLOXfc/pnHvjCX99RjrYd7Agmil7uP69op6xFFXg0
         HqPn/bYqW3QzHF/ikzLKKi4+isbog0NZUlMBZN/TapZha9QTnj3eDU06rZ61KUtZMQh8
         P1vLshm5h0t7zrZNnrGqUCy2CQAsIlQLSIx1rSAWNsUY2/V43dNviNpSoQJH+EDCcER5
         XLj5HYPTC0+lGaR/PI23TsH5eFYO/otjvdAg/1UD829O3wZrYl7plxd2LANSAuWn6gGa
         D+vi61w8DAmc9uDDDPA64cdRU6/6Z1KtOTxR7ozsU9Xbzim2H2tCOujaEwPoCQMwc/QD
         EM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741326729; x=1741931529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97xCV+Gvyecw927R3SbsNwJBWiMKRLeo3l2nPZL/r98=;
        b=d3YcW+EWDhTi7mX4LGIp05iefgT9YnaSarlzG8vOVYctxfWmK2BP7eRalmjaTjw5mw
         IMjuMfAyuHF2o71g1N2mROi0g8CKDIqU8SDeXlpnjJ70gaTPVRe9BcapjG1F/JNaEt4K
         HOCMbgIB/JwGtBo8ikJp42x2Io1QC1bO3cCYryzz2iYIe7yJsZ8Rqd7nSfpLlZfMcazu
         5zswx3qnAkkcAld28ZL16375E3duKxG4lCTpjGGe5jkrpYRxCrNdvAm25+GnTj58SnG4
         umEp5EEJnx943bIQ7nbzRKKI2ILobcTUp0kiCF22KZVAL7MtlNtw6aYxQ1gBfKCs3RIC
         I/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuwlFm3COUFXScgZ1na6VoDdHR+2ReQzA4Z+ZrPV+8B6pK5kZjSIb2tAmjuaFOqe5yQ4XUO1ELtqrWqZRX@vger.kernel.org
X-Gm-Message-State: AOJu0YyW/eTTPD88UUyBEr3XB2DfP4bCWaWyfZ8Lb4KFEhe38e7ud18/
	66rk8N7JZ5vkJrAjCw+N5UWetocR0ocWwspTEtCPrJ/JTSvjIpSRRJFsZIETsUU=
X-Gm-Gg: ASbGncufXjSe43Vc3LPUMU6kKTJGgpZl72fSb7jtjzheMZtgJIoSaorKVa5bvNq0ehQ
	yHaQRoWYRGA5S509aHhQrL3E5r1XWq+q4+OHQrSYyPYPAwmgT5cdxeHIjpQnLL6ptYSgIp6LYvr
	QwNouQoaqfTAHxus+lwARvDu1GbTpunNgFoDOD4mgAnii1Z1cFT/FwCnddoBvrGeW0bJ4tfP4XU
	eOhJidqiKsGlkw2713aKpbmAStBNJdFkd+cG8GyV+gDF1m6h9m4DQyK7WXO5iQ0w4dgymaSvHbF
	hQg1/dmI/rp+P0/Ge0yXFpNmYjxnn9l+3MarqU3BcQE5E4wnAuXCV/PwNNQck0rl7qipNJvpKaJ
	9Ss0hspSHqW+buiAoW07jIZNZ
X-Google-Smtp-Source: AGHT+IHunk8+MpzZDHTJkBgYb12y6m7jhuOmcjA3ogw1gP8DkwdgKWszNP4J5Id48vGNdylVuIQYaw==
X-Received: by 2002:a05:6512:2342:b0:549:4de9:22df with SMTP id 2adb3069b0e04-54990da2057mr687182e87.0.1741326729036;
        Thu, 06 Mar 2025 21:52:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae45f8dsm384613e87.34.2025.03.06.21.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 21:52:07 -0800 (PST)
Date: Fri, 7 Mar 2025 07:52:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Christian Marangi <ansuelsmth@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rohit Agarwal <quic_rohiagar@quicinc.com>, 
	Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 03/11] dt-bindings: power: qcom,kpss-acc-v2: Add MSM8916
 compatible
Message-ID: <nolgnvhb4ipmt64bhy3swibrjb5cxncz7nwk56osn7bkbrsy2b@6ntbn5pk22gf>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-3-0c84aceb0ef9@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 07:11:15PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> MSM8916 seems to reuse the same hardware as MSM8974 and friends (for
> whom this binding document was created). Add a new compatible for it.

Ok, I should have read dt-bindigns before sending a comment. But this
commit doesn't explain, why do you need an extra compat string.

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> index 202a5d51ee88c7190805efe8f1bf493bdb69ec45..27dae49163fa0790ceb6fda8a5c674f739d4a41a 100644
> --- a/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,kpss-acc-v2.yaml
> @@ -18,7 +18,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,kpss-acc-v2
> +    enum:
> +      - qcom,msm8916-kpss-acc
> +      - qcom,kpss-acc-v2
>  
>    reg:
>      items:
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

