Return-Path: <linux-arm-msm+bounces-44926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4A6A0C3CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E32C7A1595
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FED1D5CF2;
	Mon, 13 Jan 2025 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cz010awB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D87C1CD210
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 21:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803976; cv=none; b=MAjwaPe93VmTrv0VpU2G2uV6slIMn1lK+i7L/40ABB6vrXXofXNfdV6fIEzfZakr+0JdLfY+JdOKGEHjAq4sZCJpA9WWVqCCRsMIUGfI4ipr5prem5hpRKc81mcw2CQSsns1ThuF7GA4/g+WID02BR5zlBBXsew//mPjgDelCVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803976; c=relaxed/simple;
	bh=g591DPYKopCq1dMWAJTx3VW3pkQl6WXRGIxhRkK/soo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fR3IMlAOKeQueNievWXdqygoR6dynLaN6NHPeUo4iwQ4IK5QfRpHFXBj5376Ubq1Lc9biwRpIbaWEwW4AzKI4Of20LxSm4T2JZKhdrs9mNaAXnovNR+QvQQOufrMIB3J86Rlyh2tACuKydlMKZnosExnSWJbCE2xzSF7QtwV1/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cz010awB; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53f757134cdso4685184e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 13:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736803972; x=1737408772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVgAsWOA6HjVMer1JSm9/DzX0hKgr6OTiUGNqroh7sU=;
        b=cz010awBcCIj23pJd3pp01w9YPGUAERZCRR5i1ZZQR9MJG/wOXMY4aKJfVvO6lo3Ue
         zhrU9917P32T+dWffqAAQ5kY9Gbvf3UM/IcSSvzewKprrjTgR4mNZP33FDgrhAwfUn9M
         2tlNyCNoaIWvQvVlEa0PyU9djAn/r6iqVP6fPKYqFpZWB+j9/3Jl2M23+Bw3roS9hTLC
         4bD3JYWr+sXYnG90uBLDn7SCA1Fc+f1QyQAwAK6Jg93i4aO8bF4JD8YpW9I3J17FVB2i
         DIfeVk+REWIZs5l4Xi14vQ7CwvcG2qpZGAruj1IoxhUbZf94op5diG09c7aciEilX3x3
         e5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736803972; x=1737408772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVgAsWOA6HjVMer1JSm9/DzX0hKgr6OTiUGNqroh7sU=;
        b=IuKLHLPUKFrujezlMT0trQ3e/2rYYAGiPY8P7EmloeR6Xrr+gFfHslOkOrDve5ZtbB
         d+XwKil5YFWAPlTXm1JZVZjbfnCcgpnfKFlQqmtb8Jkyx2/S+hr2M9KUtYDqSD7G7+cx
         6u9SuXbzQP7q6ctuhSZKPw8kkhAYOS+G4dSdkIKmKJmhqTtbRqSS/MM7Qw/lyqxWE2zi
         FvTy6qCbMZ67TzXo3ZBV3ZEfIfS3Eq9BvtwmXHfGbGjeTEp9vzOgIdzBPMWuf4Xtw+Le
         /3EoVX/2lk59WLvZ/PU8v+vx2t8q5WJ0ob6P53u/Ymdq7NnIORpFsSrVIRr5a2wsukMg
         1ETA==
X-Forwarded-Encrypted: i=1; AJvYcCUAsQ0EROvXtj/S/9pShU4KRCCd0gIDIUUqE4JxPfEmMkcZ4Igx9xiKpS4CGGhod8m37c2hBLFMA/kTr3Ex@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0NzK0UR/eXq7MjY+Y/O2kgxzRQ6UyErHTeXC8y8h5t4iTn3K6
	JNrxguBCABnG+fYORLvDb+lWBpY/+a+8Nwu9jRhsOSzsVMekFcOTbz2KXwh/4i8=
X-Gm-Gg: ASbGncvNPq4CZE4ejrMS8sxdm7SKeC4WxQ6hCfP25SCG4uoesaAnuEnK1YFtt5ujNwM
	teJtycNFz1rq+/g0+111csm7FSGXqO86sijLYxj/2ca8QdLhwflFM61a3cN6M/RRhOsPgYipyae
	P9/3yI3zco3uZfx4byLFcsGdAlY8WLkHYZadNFTVfPvH/xhi+tdiwozUTtddXGK8V5Au94cWyjS
	mPCqt6Emsyszph8eA86m7be2FjzVSseyn5MxkYXc0/b27c8PkMbf2JoROQn+BYbLMbO8R/BY5Gb
	N3BCU4TaqjuyAuuug9yDxBecJB0KOCu9DV5k
X-Google-Smtp-Source: AGHT+IF2qEXZCUr70iTwMnlwbJZPP11ezGTgEtdZTWC6niIH3IOmRhQ/2XsDXeWXWwYyVTx0ngbwqQ==
X-Received: by 2002:a05:6512:159b:b0:541:3587:9d45 with SMTP id 2adb3069b0e04-542845b1b7dmr5727211e87.4.1736803971682;
        Mon, 13 Jan 2025 13:32:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec20b8sm1477967e87.216.2025.01.13.13.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 13:32:50 -0800 (PST)
Date: Mon, 13 Jan 2025 23:32:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qcs9100: Update memory map
Message-ID: <ekynzvlwtoolitvuhkyulx5et5dqms6hsl4kcw3ed4ffjgwk7h@eeyiu7fg2eqr>
References: <20250113-sa8775p-iot-memory-map-v2-0-aa2bb544706e@quicinc.com>
 <20250113-sa8775p-iot-memory-map-v2-2-aa2bb544706e@quicinc.com>
 <5cd4e2aa-be24-4298-a23d-352e82e9c1e1@kernel.org>
 <d7d68648-6356-43da-b13a-1a6b2cf976de@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7d68648-6356-43da-b13a-1a6b2cf976de@quicinc.com>

On Mon, Jan 13, 2025 at 06:08:26PM +0530, Pratyush Brahma wrote:
> 
> On 1/13/2025 5:50 PM, Krzysztof Kozlowski wrote:
> > On 13/01/2025 13:13, Pratyush Brahma wrote:
> > > Update the iot specific memory map for qcs9100* boards.
> > Why?
> > 
> > Every single time. Don't say what, we see it easily. Say why.
> I assumed incorrectly it would be perhaps enough to have mentioned
> this in patch 1 of this series and the cover letter, so didn't mention here.

You wrote it in the patch 1, so it covered SA8775P-Ride boards. This
patch concerns QCS9100 boards. So it is a completely separate topic.

> Can you please review the memory map changes in patch 1 as well?
> Once the strategy for the dts changes are baked in internally with the

Please. Please. s/internally/externally/. Start discussing things on the
MLs rather than baking the solution internally and then being surprised
when the bakery isn't being accepted by the community.

> current reviews, I will send out another series incorporating the comments
> with the memory map changes.
> > > Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts | 2 ++
> > >   arch/arm64/boot/dts/qcom/qcs9100-ride.dts    | 2 ++
> > >   2 files changed, 4 insertions(+)
> > > 
> > Best regards,
> > Krzysztof
> 
> -- 
> Thanks and Regards
> Pratyush Brahma
> 

-- 
With best wishes
Dmitry

