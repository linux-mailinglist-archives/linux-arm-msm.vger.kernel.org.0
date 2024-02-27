Return-Path: <linux-arm-msm+bounces-12663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 514C5868D08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 11:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E53851F269CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 10:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AE4137C45;
	Tue, 27 Feb 2024 10:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSsI7Av8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F97137C4C;
	Tue, 27 Feb 2024 10:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709028664; cv=none; b=fmViEgCDVwww9ZMKlRzk+XvsvsWExr+A1i8OBE8n+g8cKNOUTGwBWRax5zRdkMgsFBTp1tgziaQmj7BiBJfRWxjOIU59AMpCQkjIcABMm8YdpY0jEyhVQG5C/wyEFt57Q+SGIUeuO3NYAQsoLGRQBjJ/M7/fwbqe3ofEOsBMw38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709028664; c=relaxed/simple;
	bh=Q29CPa5vEr5QpJf4/e5PnJkinSzjOGGgvQ3q+BgSUQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZNPYObbW6a6VHQq3Hij944ttIAezuW/slq2KNPMx87X/uNBeC1tJ1Kv8d7zmq2q3skp/zsQxdDcuNVcvrgAkmWKK7f4rIesiXd5wi/pUa13FsbEZ1cAlzj1JZf1Z3grIebkJNPasJapQ+CtirVZZXi+hsrNDVBy4EH9zE+3PPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSsI7Av8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7A1C433C7;
	Tue, 27 Feb 2024 10:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709028664;
	bh=Q29CPa5vEr5QpJf4/e5PnJkinSzjOGGgvQ3q+BgSUQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fSsI7Av8QnF7sgdMK78349upV4ZYcCdGzrX0KWLYJqZxbDWdBDf5zvbK0tO2FricU
	 8eXY5S6PFywcWHEZ8hvJG60rZYRUyK/kS+vsVCkREZJh6YoBgmKuBjLc79GM7hQN1J
	 vnS9/LffgFYO+Bray3g2Hp7GXy/HnYXXdbWy9Zw3OK7ABKwMYn7EdGl5nHdMfWU7YR
	 SMyNx3oY488XRzZhTTiJIvebzSO1C+8Ex8VURuEou76CeoNJBHykd1ce+YzK94EXry
	 J2Jjcfmn0YtSBeUC8oetDg0Zgw/EfGycoJsQuICDVkFZIi5p/dlrdiVuN/M/rqQd7H
	 AbUPfCOI/iSIQ==
Date: Tue, 27 Feb 2024 10:10:56 +0000
From: Will Deacon <will@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 0/7] A702 support
Message-ID: <20240227101055.GA13753@willie-the-truck>
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Feb 23, 2024 at 10:21:36PM +0100, Konrad Dybcio wrote:
> Bit of a megaseries, bunched together for your testing convenience..
> Needs mesa!27665 [1] on the userland part, kmscube happily spins.
> 
> I'm feeling quite lukewarm about the memory barriers in patch 3..
> 
> Patch 1 for Will/smmu, 5-6 for drm/msm, rest for qcom

I'm guessing you don't really expect me to take the clock bindings?!

Will

