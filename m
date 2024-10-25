Return-Path: <linux-arm-msm+bounces-35854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EF19B00E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 13:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABB37283FB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 11:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56581E378A;
	Fri, 25 Oct 2024 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJg7F/El"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF101CFEB5
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 11:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729854379; cv=none; b=huLrgYJfNQEdbL1PSb5CZOUyTWbP5UE17VM+d4284mpoxHte8J0kRbs01+G3Jhu7dgxnD1Q6vfXesW3yeRs9weG3xRC2W27grBK89+Co7jdCfA+Z83H9ubbVA3yFrz3jUHbHVE8iTIW3t9NmQ7JYDUEL2p2aOmWsMVIwiuLPjRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729854379; c=relaxed/simple;
	bh=jtaPclHrmNUj0OOQtmFmi0d/L5BXAUDlUF8D6hLtdhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOiFZ0nNpyvNnX0bt4ydpO6fHtgkb8vaoViOBaBUGfwFJwOBfENsY4AJ+QyYp/aFxq65G2pwvRhmVLqA2LF6OogQM/mMi+VNNZuPDIue1+GxHVXhkrjDYaAXtvUrnXRnOSkJdfBt4m941jMCzT1R5PgbD68cEYHmag1JxDnGc18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJg7F/El; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso20994071fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 04:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729854376; x=1730459176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AQ408GkSv6FKcDj3LbYcJBQXIjGsLP11MfIJYKrpseo=;
        b=fJg7F/El7QAV2JDxNQcGYtHpXwVz/E48TX+oDrpQ+s+wADPqQ8Vysygm0Kv9cnP01h
         epA5ZzD7LdChEjtAMh3FZpiswXmAAMX1bplpHGU+f3McOpcPxC9r+bvqjrQMdynWCZ0m
         udbALjFuCNnWCN8fmecKllWXnRIjk4bMpPE/yXG6iwv2ElEzkjEirjiANFefEqcqSEdk
         8Qn+BbaO4nFmbsCoz9Y6ld22Mp6X9WbfB+LbyJ4tnivo2NnvV4MyxE1s+bI5Xwq3Q+ui
         YvNG++quHYdGH7uc4HGSL2zNFdVPtEgwC4jRY0iYs78Yi/B4scBcV5Z9KE9vhu/qrUj9
         sghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729854376; x=1730459176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQ408GkSv6FKcDj3LbYcJBQXIjGsLP11MfIJYKrpseo=;
        b=qLXrkHi3AHhLqQ+t86M+ULWHegmUt7F7BmOGQ1GI1mRGIT5T1YtmrViCgLl+St3X7L
         5mPowBcqzl1HofXJK28GEeEaZyYgCC8A8IELri+9nO0R29SrHupucVZ/1DyRq3xLW5J5
         2bm66DDnXQ4dZLerZschg93ohj/aZerHNP5U/u1KQbR2iN3lRlYCLovQsxBeh7pP+Gic
         iRTgi63pp8a+vee18+2XTfRq87jPGMwhGqjGTXsseO6YpIuVx+1YSAW4PbaMvonRj3jP
         E1cTpfZFC3RZ+qp7iMlyCqZQr2FT9EY4ZRB1ERj4q17gN9iF5x58bhMZkEHh0FTga6Yt
         Ky+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr+vmWHx75wqf/KpAXtuzAUNf8+6FmNNY5KxO0GF5AZybE0J/fsp2RxOYIJpEsSsn76LlPxxtVTl8w22gv@vger.kernel.org
X-Gm-Message-State: AOJu0YzCyutLgV7ZkhWc9mqcOWky9Ms35elH7fPK1eDIKmgh/uda5j3X
	cZrbRio49x20s/G5cMIdjJ8r7i1vCQoKb4yu0stOgbYLp74gQ8ERvbF7n21EGE4=
X-Google-Smtp-Source: AGHT+IF+VxvbiEWOkVh7f/0HfI+Gnuj/Q5Tm25LhUJRLQVlSwMKKkXkucoVkGr+79kTD4Fupo5kr7A==
X-Received: by 2002:a2e:4612:0:b0:2fb:5a7e:5072 with SMTP id 38308e7fff4ca-2fca825b992mr24918301fa.34.1729854375895;
        Fri, 25 Oct 2024 04:06:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb45d19c1sm1449371fa.82.2024.10.25.04.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:06:14 -0700 (PDT)
Date: Fri, 25 Oct 2024 14:06:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Qingqing Zhou <quic_qqzhou@quicinc.com>, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	robimarko@gmail.com, will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qcs615: add the APPS SMMU node
Message-ID: <zsphor7rpbwx4km6uxpepky2h7atbgjn2435puygmpssfc36mc@wkquqxud2yij>
References: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
 <20241025030732.29743-5-quic_qqzhou@quicinc.com>
 <8a60b729-b312-4afc-835b-a18060ad3f03@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a60b729-b312-4afc-835b-a18060ad3f03@oss.qualcomm.com>

On Fri, Oct 25, 2024 at 10:54:24AM +0200, Konrad Dybcio wrote:
> On 25.10.2024 5:07 AM, Qingqing Zhou wrote:
> > Add the APPS SMMU node for QCS615 platform. Add the dma-ranges
> > to limit DMA address range to 36bit width to align with system
> > architecture.
> > 
> > Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> > ---
> 
> You probably also want to mark it `dma-coherent` (see e.g.
> x1e80100.dtsi)

Is it? I don't think SM6150 had dma-coherent SMMU, at least it wasn't
marked as such.

-- 
With best wishes
Dmitry

