Return-Path: <linux-arm-msm+bounces-57498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B25AB1FB2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 May 2025 00:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BDD99E2A6A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 22:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B530026159E;
	Fri,  9 May 2025 22:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="meYThyWq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AFE26156A;
	Fri,  9 May 2025 22:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746828740; cv=none; b=Soxz+UDw1FuefpC1Fju3SvrjAmkakHXFyyeJeCYEaRMvnxibSszF5oUyoGrP+gObVUByIO1u0miN3r22anlLhRIqZyEF/79EZBMnL0Y0OT3hV0+bnc4hcZwkDvz7hpOfb96fR9kqhryfQUC5EC01mb+u236zBQH3GeU0Y5V76FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746828740; c=relaxed/simple;
	bh=ZZ25JgcrA3CQi6q3MuZwVNyCrz8R+uAApr2nUDdvFv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2gvr45zVRBwg+F9p/Ep3/lqlenbP+scqspzlIRSSzMMtxlXOjNsIItRAth2xWDe3jsWBXa9irKdNGZLeXAg1pEQ/FxeqHGMm8wSLAYR1GdFTlGI0EnWXoIX/N9iyHzVOM44kgAEmoCGD/ELz2gA/QrOxq8B9Fr6A9I7C7834aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=meYThyWq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148BFC4CEE4;
	Fri,  9 May 2025 22:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746828738;
	bh=ZZ25JgcrA3CQi6q3MuZwVNyCrz8R+uAApr2nUDdvFv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=meYThyWq16D2RKwR67+RZZErriyTQ8nr6U5QjQRY7ExamF5O7DMi0Xvv+K/DfqlxU
	 Hl+wQdoHM+VAt+F09kxTdvYReRMc6mDDjMmffY78fwT0XmNvnzl+co7Q3ixLCCYzxQ
	 JGjAJrjPh7EgZz9ukFqDTP5xKeT+x1pBodzYCt6ROlNRFijRr2p2h/aF0u1G9jJLPd
	 DxYoYbqHqXjIVHhaWacinSxAGTG/l+NJcRXUtt/dOAp4Q48aPzRSw/JTT5Htd3F7oi
	 IL+8UCSp4lwV9WrVG3gfZaC3oQhGKPs3PpGf7eXuw0iS48KUsy4ebqW1C3+tzQazO1
	 d7rumTinve3xA==
Date: Fri, 9 May 2025 15:12:16 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
Message-ID: <cnlu4yhfax3ggtkig46bwimr7acpoxl6x74dpu3kdwq2wcjwmd@d6spkmdywrja>
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
 <20250414-sm8750_llcc_master-v4-2-e007f035380c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-sm8750_llcc_master-v4-2-e007f035380c@oss.qualcomm.com>

On Mon, Apr 14, 2025 at 04:21:51PM -0700, Melody Olvera wrote:
> Add support for LLCC V6. V6 adds several additional usecase IDs,
> rearrages several registers and offsets, and supports slice IDs
> over 31, so add a new function for programming LLCC V6.
> 

Can you please fix up the checkpatch warnings in this patch?

Thanks,
Bjorn

