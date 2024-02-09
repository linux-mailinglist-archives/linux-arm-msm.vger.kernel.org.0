Return-Path: <linux-arm-msm+bounces-10328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC0184F3D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 11:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E9291C20DC3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 10:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B9F20329;
	Fri,  9 Feb 2024 10:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJcVpPu3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8CF2420C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 10:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707476000; cv=none; b=UnUKCEGQ58YoTKjHTmUfJqC0bzURu3R1Jhd+bd0rlKEJaF6e81HF8gg5OL4mK3c/tWfYxJsXCpWQUG1SzdYHWsIrneTo6IvbSzOOLzw8wD5f9gUeef4E5/QxVNN1h2stfmKj0cMFtscFoQXk7BxWpfYC9guVvha8OgwRQfsLmuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707476000; c=relaxed/simple;
	bh=bBVodIkFUuf5TjuHA1UbbrCx/ebybTBO+Q6c/7GdpAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGalCw7TE8vsEiUjzZu9UOfSPfGyOes94BTHBun5/AJVrWB/LvSpGlosXc13H1swoLDrNbHz3CEbv8irRbXk6TGIKRHi0PJoLVwQMMUoU2K5m9CCjKVJr7HcVaKS8KEIAQ0rXiTffwv9jvGtA7h5YcECPPLKXUBWbvo8hsRQndM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJcVpPu3; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-604aaf2d047so9382067b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 02:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707475997; x=1708080797; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4t5G9ULgip1omppIrMSWBh824NopQFVbRmAIJheoN6k=;
        b=SJcVpPu3TpI4DvbGtfy7pgQFs5IJ9WaUqLUWMhRvmJ5hlThIk1g9ITdunms7bUQvt/
         M7qse5Xti1jvHsglZST+2HmpzV10Fv+GEdEeUwpSucRuVoRVW8EFWvxIDIqo2ZycpBwr
         VRfrG+X3qB7KxOgIT6Y/dIVhkX3JRDyNJpxL2c5Jh9bDvgzG9y10yzIfsr6fPzVFFmGx
         703+1Nbj/qSGImQttDMVNHDjvhIJVBPn5qK7Vrn1PLfl+C2h8LcrCDnCB35OrH+2ZdaQ
         xUUpptjar9PXgOottJMO9UL8BMxKRiJ8XyOk/86fTwRruUepXhzmsXEI9YLHA0Dr97KX
         H7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707475997; x=1708080797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4t5G9ULgip1omppIrMSWBh824NopQFVbRmAIJheoN6k=;
        b=ix1Dow9lWLibBgaCbnZOkeFZvp/djfU2Png7D0miKDjOP4DaabgwOV3kUrdszA+VtN
         cikE8rjARtn/V7U1l8qEHG9RVbUqWdl158EcpZ2w3Rn5jYps8A1YBbj87NLQNiwTfP/3
         Ix8LIZ/orXhahXImQz8v6dtQpuPVzUFNCcxJwminXN+TPbz7hMaBTWYZRVW3dXtr9plv
         pSzJOcura+1p+wfqC+PsmsTHCOHk0+ICJn5RGd7FbO8SI42oLU7fckACtqpmHJAO224c
         FHPkZ4eIvPM//L2AyuB/bmzAXMZYpslgiZaE00+RsigPFyNyT0sagO73xI0z7/vhb9wd
         9Uhw==
X-Gm-Message-State: AOJu0YywXrrqNtDSuuN0zePmBYI6n428A5JRTpoZQa3bdm+SKmMV8wXZ
	tD87EuRcb+BLfPlYi0v05wtFFihYitnDwVbummZXfHJ65FfIMrXQi1g4TzPGVn/vbGYzGPiT8bc
	gC+R/Nz5COX6U2haY1lMyjMeIGDuWz0qlTXaugQ==
X-Google-Smtp-Source: AGHT+IEYr40Xins1Ugu9N2EC470IZHXfOwEHL+myb8RBHaNgBLYJY6StP1BZSABiyzCT43QOSlagmJhV9ZKbAkqTMZE=
X-Received: by 2002:a81:4a42:0:b0:5ff:d871:b4d with SMTP id
 x63-20020a814a42000000b005ffd8710b4dmr925660ywa.44.1707475997376; Fri, 09 Feb
 2024 02:53:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123144543.9405-1-quic_bibekkum@quicinc.com> <20240123144543.9405-4-quic_bibekkum@quicinc.com>
In-Reply-To: <20240123144543.9405-4-quic_bibekkum@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 9 Feb 2024 12:53:10 +0200
Message-ID: <CAA8EJpr3S1hGSjeBx+vhZZHq0OpyULCmyxasUzF6RGdTvXEBSg@mail.gmail.com>
Subject: Re: [PATCH v9 3/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	konrad.dybcio@linaro.org, jsnitsel@redhat.com, quic_bjorande@quicinc.com, 
	mani@kernel.org, quic_eberman@quicinc.com, robdclark@chromium.org, 
	u.kleine-koenig@pengutronix.de, robh@kernel.org, vladimir.oltean@nxp.com, 
	quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jan 2024 at 16:46, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
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
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 61 ++++++++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h | 16 +++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      |  5 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  5 ++
>  4 files changed, 84 insertions(+), 3 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

