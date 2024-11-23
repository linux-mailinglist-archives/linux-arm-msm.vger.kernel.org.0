Return-Path: <linux-arm-msm+bounces-38894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E889D6780
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 05:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFC42161512
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 04:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E61814F9E9;
	Sat, 23 Nov 2024 04:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VrW4vgGt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB1F2AF04
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 Nov 2024 04:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732335898; cv=none; b=KNvOsOYeWT6U2YIWrfBLhyTRO8BelkwF6pcXdaTTPlWUN7X6WTMupVAU33kHFBls1KT94iI3X9rCW7mpLrfUpuL8SJiK4r1PzSacrF+RDNBXI+8eiYolvhYFcUxiSGRPq96cxYg/AfNyFfLziNwIMrF73YaOz2JzNOohXVkQ/Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732335898; c=relaxed/simple;
	bh=e9nHpwMBjaoFqUkoyryIoEFTX/TGNX1aD1pPnnHMG/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZ/9XLKbJCMI4QIKH5rum5I1w8IfEh9XRizrEUAWf3OpeLcr0WfZLeWDW0DjZkB59vrMgapqPua6N+KqXp4B0I07IhPKPpi/9UaVHeTpmOU7auBCoojzY6XwbcWwGOo25Yb3g3TDw5MQSNiTCbA/rPS5fTbJqffxTA2CNSCMAyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VrW4vgGt; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso20326881fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 20:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732335892; x=1732940692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRhFfCU54K+2vGl9KCGpU43DH6Z3TBwkPWpTyROlHtc=;
        b=VrW4vgGt8EcWtpjCu1+UxXXFKexHQOyVrdNF+hg54nx2PQ6rZXU+Zx7H7ctG7PgC41
         1SFptXCFFZ74ReB8AC7BqQdzQvczmcm7oPnueIFgel79R9pE9eG9DefaINNuy112zawz
         kzKHJzEVmx37nTtOYEv3niZfvHuZ9rAKMLtd4VERngKVpkBTuE4+4lmJ+GE6kFVUN/25
         WNGw26sAEFxct/5TqTQqzUVo2+T1lJ4GNlEG989d63egMYa0Ed+gg9vAVuaplWqnQz0B
         8Os7Vf/WfhaGA+X30W1zNgJj3E085s3gQ7t/zgQSPCsEyQCJzabr4p/T9Vur0NAXLUJQ
         dV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732335892; x=1732940692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRhFfCU54K+2vGl9KCGpU43DH6Z3TBwkPWpTyROlHtc=;
        b=B4l+94AX0icucrPjB+JT2BPxBH/2G7vnytD9JUGrYWvv/3hwsMe3gcB4SK/bDEaQvJ
         Bklxj3QnMAP1XBVGLfkE/BeTbrVx5RVRFJNzZ6T9C9oArrJSOqpGMLfQvKdA/UzGzYZ5
         j2fVp6r5L2BWDL1dRR9iKR15jPx1A3VZJ0577CvhfIImBdmdv1UyWG57YaERBg5GnleF
         G5qfwhAdQy5nwbnu7AOq7W9X4uNVWEvhHrSyQxHSnEXUcsRRVDao5pFo9HffjffZaB3G
         dQ6G9TwljMmsvaOKFd19n/r+3wW1lhCCOnJU5mkvN7OaDN9/PSvo+TvcojW1vqw2VZtt
         CQPA==
X-Forwarded-Encrypted: i=1; AJvYcCUBIs1ML0Yb4iSleBpY4G3NYfFwS2h9gWhG5zyrc75N4psIuyh64jZp6ZVr7lnZFGivQrBm4kYnAc5d8v2o@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/8LpErBFKfFjf05mtSlfOlLoiY7fZwYu7eTPFx/ZZDQo/aTFf
	BmNhywjET+lnlFprtn+Z0ebw7C7rsGzt7OSwMehRRgPvVUH8SthHnvEwTVs5rE0=
X-Gm-Gg: ASbGnctsPu6Ly4L3JJ/+jfz8mAaqNGqD3lXSjCSY+ob5rCLviC0/+oQPUg2DlVXbonK
	WfbllSRUbpFV4npbk78CIuM+fF0K6Y4MYZTnYgVzwvknB4zk/Ul/ZP9OW+TuT1KYM++FK3NQpIt
	zhbhK0neXKZ1u/gOROgB7OPIEaTCS/YP3fXgE0b1y1wF1v1DSH0sBo1sntK7CJLy88YyUM7gCzF
	oBzFs0z5S7SH53Vc1U4SIRlqWCszgl41LdSDeIdoTg2Y8Q97HY8qrVnm852VynegAegbkoa4vcs
	b8WGog0GG/p+lAu3a7z88FdasHnZEw==
X-Google-Smtp-Source: AGHT+IFdByuwlVrForEzT8tv23srj0gnAIFOKpmn1yRMnyw6GbJuVEjWF46wgEUprlaX5HOFYnyPnA==
X-Received: by 2002:a05:651c:1594:b0:2fb:cc0:2a05 with SMTP id 38308e7fff4ca-2ffa71c4f76mr33073991fa.37.1732335892280;
        Fri, 22 Nov 2024 20:24:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa5375d8esm6320591fa.89.2024.11.22.20.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 20:24:51 -0800 (PST)
Date: Sat, 23 Nov 2024 06:24:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v17 4/5] iommu/arm-smmu: introduction of ACTLR for
 custom prefetcher settings
Message-ID: <w3rqdjygedgwsacn4ybajvv3fwuhhaaazo5x7zqcip7xdtf4lo@shwsl5acgqzk>
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <20241114160721.1527934-5-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114160721.1527934-5-quic_bibekkum@quicinc.com>

On Thu, Nov 14, 2024 at 09:37:20PM +0530, Bibek Kumar Patro wrote:
> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
> the TLB to fetch just the next page table. MMU-500 features ACTLR
> register which is implementation defined and is used for Qualcomm SoCs
> to have a custom prefetch setting enabling TLB to prefetch the next set
> of page tables accordingly allowing for faster translations.
> 
> ACTLR value is unique for each SMR (Stream matching register) and stored
> in a pre-populated table. This value is set to the register during
> context bank initialisation.
> 
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  1 +
>  2 files changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

