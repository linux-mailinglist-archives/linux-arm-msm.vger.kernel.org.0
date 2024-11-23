Return-Path: <linux-arm-msm+bounces-38895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA499D6781
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 05:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47CAF1610E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 04:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8D5481A3;
	Sat, 23 Nov 2024 04:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uJwCohjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DB34A0A
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 04:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732336384; cv=none; b=HYkRJNRwX/C4Lp0nG6Wa2VlUoK3Gl3pHeq2LB6be3Py6ZpxK20kzKOD1P6cgQor4HFNQYktaCSu0k8GhNrj6fYd7PMq1huzV+kGaBRFTx3JMZRPWsKGGkKw0NwdeHRpMmQvujrfOyObEco3YWjriFb4P/tINF8hViUARJ++Q+R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732336384; c=relaxed/simple;
	bh=05OUskCpRZqj5cEzov83EbhorcQyz5baklPnEnJ7sRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEYhhM4nCmBbipIgUdDotuetqHBzOkt9z6wrOdO29wDY9FtfIGIiQQTM4MKDiaL9rvzJnT2NS8ukcQ6ZrdhMrfJYXTSwjTvwmOOGdBhkCYH3ifwkNLvgR/4HoG8OYQA2vg4oJZ6PdF/g/RV4z5vekYdfGH+QannO3DcmeuYCEQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uJwCohjB; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f2b95775so4222015e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 20:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732336381; x=1732941181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VMGxDuJ/rtujDZFX9z6xbz2UE34eujmvFMapxF8n9e8=;
        b=uJwCohjBPT4b5B7YGT7xcDxWdyOpy3DGkqj+/yncj6umLjPfkhDml14c0dyvzJUQTa
         +OcENtprfsDxNOyUHIVXh94wFC+dYMaCmMumbBHmjJovI2CV3BOkdyzpxE+exfq2gnPf
         RxYwAjdsR+iKkWVH7PWDGtN8Y8n7CJuNLduJ1SVxrljkkMfKE5IqEnNcD4jh2HnLE25m
         c1Xlw+Tf7NzxtwkN4SJM6fIemYlhq+JVuf520beoDnEATVKX8gg1whfEkycTYc5qjwVh
         iepVd8gS5/3tcCFHEZW5yX1YZYLFTVINmdW1oM3/6cGoVAWpFHswTlYvl0cctu4iiNjU
         buNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732336381; x=1732941181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMGxDuJ/rtujDZFX9z6xbz2UE34eujmvFMapxF8n9e8=;
        b=ud+wjV3CQT/6RmHzO94fy/TAVDBQbYZmuQMjo2osK+2t5uc230gNxoU3siPrzXrSiV
         LtxjOTczfaYlDbYjxRq3q8/FA124vy7VnIsFfJinJidkaFO5COeTBFbfcQxU8fc0tnKG
         ottbeEN772lRJ0yQqrqhGXdwAjpUQyRpU+pAG7ty1R2kBMgN91gx/5WD6t1ZKOP0xaEg
         /pY48qYFHtOBdH/hFSkFFvJqzgpEpFtOBAjwYByDX9fwT6I93CNsmf+6Udidh0Cx9AHu
         Yi1Z3nYnXuAnTLcHz3o+nJLB4qh1MuX7771wbn6vFpOeDhZ0VA4XjPas3QI1v7+WWSk9
         nkwA==
X-Forwarded-Encrypted: i=1; AJvYcCWX6OZSsZLXP8J9DIm3Cbc0yPLHihAi6bAl6TOjm3c0RJPvUi4e0uhxy9eXurWJMh/rO5tccVA5ImPoWLPG@vger.kernel.org
X-Gm-Message-State: AOJu0YzAfwqj1r9aTudK7DpiQ7sUMNwWswZJj40/JN+gfj+MuDUsu1S6
	Sna+QXKVQTWNJWiB8fSQZPgCWvZFHA4i7hMNBLii49JLzuLLqGhZ1VTxHoKAm3A=
X-Gm-Gg: ASbGncvMyC2mefjjphSemQ/eLVYhUoA4VP+MtqHNeHyZ5gjYLoMPzibDk+6ZdGAcwI/
	hh8zQ0EvJ2v0b/KSSvxZoh+1zJ6YWggN3n9FgAJDL2n3FGNqEgDJa16PssEaYj+6nUB1xZfAqb7
	7sfYE3N+LCsiPnwS29+vcAh25DioILqs5dlDNSUnP858CzdRsPCkd1x6VpLSDPVPjjRKeiQVDTs
	IujKqg2t8LCWNCXD/oF6bydPBA89RlNbdw1Ch6UZw7An3OsrmF64nMQHeYg+vmOKO0u+iEyxDV9
	0uniwYb8U8imKMBP4cP3DRn7b/QK0w==
X-Google-Smtp-Source: AGHT+IHLJiA6aYnUX3Lh/TeIP5I3J/OMBEcDuDbvten7DOXiFjiEs6Kd2U58RE+IDTcVG4JwRP8PJg==
X-Received: by 2002:a05:6512:3ba2:b0:53d:d0a9:a453 with SMTP id 2adb3069b0e04-53dd389c91bmr4355304e87.31.1732336381130;
        Fri, 22 Nov 2024 20:33:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24513c0sm715018e87.97.2024.11.22.20.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 20:32:59 -0800 (PST)
Date: Sat, 23 Nov 2024 06:32:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v17 5/5] iommu/arm-smmu: add ACTLR data and
 support for qcom_smmu_500
Message-ID: <ppbgnxl5wh4cpkkb2lphealm5cqbdfaxqwizxe2ibrqifat3cu@abmenyqc35vj>
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <20241114160721.1527934-6-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114160721.1527934-6-quic_bibekkum@quicinc.com>

On Thu, Nov 14, 2024 at 09:37:21PM +0530, Bibek Kumar Patro wrote:
> Add ACTLR data table for qcom_smmu_500 including
> corresponding data entry and set prefetch value by
> way of a list of compatible strings.
> 
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

