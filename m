Return-Path: <linux-arm-msm+bounces-27391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D28940D46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 11:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9900D1F2462A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 09:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FE01946DC;
	Tue, 30 Jul 2024 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uFpBNT+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF70C1667FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722331327; cv=none; b=otSN+Q6HocYlnc8wLjc08r08g1CkJRzTOO4Qp1JbVaNPqlm86QnrdEv5G4sWfWqVK46UzCNBZm2jUsfT6VHu4XLPw34x0eLgO5+l2vOeZ2LRpYGFiCrAgj4ujR3Sy8zBzy3fo5y9z5Esl4waZdWABRb0mmhjuJOOkk/AFPxHTnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722331327; c=relaxed/simple;
	bh=qc4+vz7nNBQX6rw27KLvTXvTj448QyhgejGiWWuvDsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDv/xDCQdRp06rFnakACGmsuJISt9Y2I80H/JQysj1VboLWbZacuYMqreepNKdNtPXNdNFDzei5ERMev12/bdOLpoJ0+fF3bi6XAW63DqqOZLV/iWHr/o7krUPWQQoQuH24RLsLbOPh8tGIQ7NXPG+477cGBRJz+AYWhDmQlXrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uFpBNT+A; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ef2d7d8854so54980201fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 02:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722331323; x=1722936123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hbTPUWP7dEvHs9yHy9hlJD4fx65Y8B6hataVoHic/KU=;
        b=uFpBNT+AsCp4sTvC0i7DPT5Qcopfn7aw9PMTbSTHH9r8LWm6Cap/ATWvraCk/fdzTO
         4LpFKM7jBd6G48TbomN8Hi2jq12bM08UbhshzJx/mwAdWw6lZ8fAPew8AttsHqHRlGY+
         tpwMWa06No14E3JlFohF1QmuS04uHllhTOUpaXU0FhXZaY2uYmtB5sY74VBovkp1bw/4
         PDCth88wZdEdyiLXPE/JKPrNboib+LX+lioXBzAj0IpUSGCJ8xYy7YYoBiOd7ELpl9qr
         UTkW1OY6p+A5mVIiCKur9Ev/Q+BEiiFnmH/fTdnHifDZnUoFN2O2Mfv03iX0zNLb1Q42
         xxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722331323; x=1722936123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbTPUWP7dEvHs9yHy9hlJD4fx65Y8B6hataVoHic/KU=;
        b=DYu9LJmY3HGeVN2KwZ02q8ZC35sLpzKIGbrXjCRzwE7rC3VgCJlKI2OA/eDSKeitsz
         Pp9L21xx7Nhu9k0+hsX6XkGoOf2fC8UuUy1G7NuGtiuPJU91jGzCFPTMmQQbL1fumdm3
         z+tc6jEx1M0u6z4Ge3QQ05TM8ukuOUu1duJEyi4u/7C+aHeDHWQPMcobmsmblzUTY+6d
         ltd+GrSQbxoHbVsUqqpNMnA90WHPyD2WDplSC5exkkGLk1ZjbsTiWxJHPms+nDj70n2r
         wqbxtXyMSjRcSDQDZIPdENeFHGMi1r6FsIfnIarQuEhQi1o2e3h0T5iOJqnZKdxT8qer
         1xpw==
X-Forwarded-Encrypted: i=1; AJvYcCVauHFBYWU5NA8LSlHqsUxZshDErO4yYojLEiTFjkD7mPIOp84p/tdb0pSz/JzGw66E1gXrUAs7uuyEoaeYtfLMCTbx60MwL+fn2/zwhQ==
X-Gm-Message-State: AOJu0YxArXFQYZvTvhiflo6sKJO2C5iLj7g2xJ/WrSQs7WVZ4AbEOmL/
	0UAjoy2WNWBK1yVKqvTATR7wpjw7T3Rqvv/p7J6JOxSF7kxv43gltW5KO/sn6lmxdk1vQLuNjtS
	l
X-Google-Smtp-Source: AGHT+IHFbaEWsPpnN36GEwy4+3Xjn07ym7RpZkkVMFK8u4jwJ6w8wTu0z813D8wad9QBLW/ixrXKNA==
X-Received: by 2002:a2e:8508:0:b0:2ed:275d:aa44 with SMTP id 38308e7fff4ca-2f12edd67f5mr64620911fa.28.1722331322853;
        Tue, 30 Jul 2024 02:22:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03cf2e62dsm16009241fa.29.2024.07.30.02.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 02:22:02 -0700 (PDT)
Date: Tue, 30 Jul 2024 12:22:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Acayan <mailingradian@gmail.com>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] iommu/arm-smmu-qcom: add sdm670 adreno iommu
 compatible
Message-ID: <aim6b46amzzrfg6pohmdjr6cnhnmxqwfidlebqeou22cjludb3@kwi3mcjf7v4j>
References: <20240730013820.41702-4-mailingradian@gmail.com>
 <20240730013820.41702-6-mailingradian@gmail.com>
 <9c4a586c-e9f2-44eb-a8ce-0b3943b07de0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c4a586c-e9f2-44eb-a8ce-0b3943b07de0@kernel.org>

On Tue, Jul 30, 2024 at 08:23:44AM GMT, Krzysztof Kozlowski wrote:
> On 30/07/2024 03:38, Richard Acayan wrote:
> > Add the compatible for the separate IOMMU on SDM670 for the Adreno GPU.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > index 36c6b36ad4ff..7f4b15be4a11 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -539,6 +539,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> >  	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
> >  	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
> >  	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
> > +	{ .compatible = "qcom,sdm670-smmu-v2", .data = &qcom_smmu_v2_data },
> 
> Do the people even read the comments? What the comment is saying? I
> admit it might be not precise, but "500" and "v2" are the same from that
> point of view.

Well, the comment speaks about -500 explicitly, because -v2 have
differences (it is known that these platforms require more quirks).

> 
> NAK.
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

