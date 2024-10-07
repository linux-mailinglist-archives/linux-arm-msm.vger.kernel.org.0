Return-Path: <linux-arm-msm+bounces-33391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B803992F2E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D4EBB24D4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FCB1D95A1;
	Mon,  7 Oct 2024 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pAanSxap"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F21D9595;
	Mon,  7 Oct 2024 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311183; cv=none; b=XoMQUUdKYX3YgsSG64rOsqwZoEz0JNfIx47piAe4BjQtdWzT1nk3yzvq52DJhETYywlkgiq/7pnByfgczogJLyZsrHxHfUtKjNzMkrjcTg7Hovdx+pvpcU7+GYigp/aWlewS402CkDK3i0ygnKupGckkEIYf18bbmbZj1YD7Wbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311183; c=relaxed/simple;
	bh=0mOm0cTmFHI0L0XYjzsdwfzv785YFwiOmLCRzcY3ZR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pghu8lxSaDYb6svjJ3JwV1AOCTKsEDRnKrvRnkuTLhTaGI359dcZiBgsnBv69/wvaZzidMRTfj6bdhGUOC/MRAb/h84LnhVESRwg302467cHzejUFKXeOiXQ4R1pxL0CK7XKfMqkk3kBqzUvVzHWUDgVMKB2zN6Pd2f2HCdkFlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pAanSxap; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D5AC4CED5;
	Mon,  7 Oct 2024 14:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728311182;
	bh=0mOm0cTmFHI0L0XYjzsdwfzv785YFwiOmLCRzcY3ZR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pAanSxapQIhl8kvGW2KAn4iBLYiGjFjTfRn+i12RGR35N9p9CFXuxV9eH6P/ROFsz
	 wWz/djjqQ/gZbc7ASJiphKj9ZMZ1Pvkg4YJd7sCO75czMHX5E6CxzzvmS3yNi7lNRu
	 gggqzK+GhOcgbn4n31z/uOFpLhbQLGZ9SStveHcKw0XhxuKFQk2p9gUErd2Mmb++LH
	 LPuU5vG6TF14Y0HTDFxPZoY/IwjNutCiBSmw9DYvM1zrdKpczsvyloaAI6JtrS9YMp
	 CSWWLx2SRK3zWrunOq/9I7gPaujB6b68mKdNDj52Y74NNE2+rUyVorkJK7SXwqkOlD
	 ZZ7ngQSlw2yCA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <quic_kdybcio@quicinc.com>,
	20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org
Subject: Re: [PATCH 0/2] More Surface Laptop 7 features
Date: Mon,  7 Oct 2024 09:25:55 -0500
Message-ID: <172831116172.468342.17379011940822291404.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240902-topic-sl7_updates-v1-0-3ee667e6652d@quicinc.com>
References: <20240902-topic-sl7_updates-v1-0-3ee667e6652d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 02 Sep 2024 16:50:32 +0200, Konrad Dybcio wrote:
> This adds MP-controller-connected USB ports and lid switch support.
> The dependencies are marked with b4 tags.
> 
> More yet to come, hopefully soon
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100-romulus: Add lid switch
      commit: 86d402355e8cefe3bfcc36fa6c5feb53ecfd92f0
[2/2] arm64: dts: qcom: x1e80100-romulus: Set up USB Multiport controller
      commit: facead4ce0c45c6d2de535df8376f728cb9e7064

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

