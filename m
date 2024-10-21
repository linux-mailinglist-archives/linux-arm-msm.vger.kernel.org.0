Return-Path: <linux-arm-msm+bounces-35179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278109A5DD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC82328107A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 08:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3791E1A09;
	Mon, 21 Oct 2024 08:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7piaO/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AD71E103F;
	Mon, 21 Oct 2024 08:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729497627; cv=none; b=KCK6sQyuHgi2ZHZqCdRVxwJP6JIuiUKnCa0GFlmNyJIwXMkQofAm0qIEd/Kq9Vn/nd9WjkBvTvl4c4CcWTUKdAJp5l9fCqXSH4dkfqdKTCsXodnv2ekd1XCMUQ1jwKzIBrM8+temwXCzXc65uNx3SzR7byL6wC57xqojjew7rgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729497627; c=relaxed/simple;
	bh=6oG+WGldcz4rwV4cAvluLjUui+7t93gqVU/zkRlCy3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXn3WWV/wDhJTvd2i89q+YY2yiLiEHqQ8p1n2OGo8TBy3XyhMn8LS+ay5CFqe2mhlDOOKSErY/7MK9fWhmdSHPTxpflvxzmoJgY4+BbJYGj6p8DSjsDTSOZxm8Z2qqgCDpAfvCNnI8n5AFPJcsKa3zlFbKPNJMA5ISEZ6lriWF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7piaO/2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90B4C4CEE5;
	Mon, 21 Oct 2024 08:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729497627;
	bh=6oG+WGldcz4rwV4cAvluLjUui+7t93gqVU/zkRlCy3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J7piaO/2PBLCCFoEdOEY45poaqsvICWy3sg0DfqR0QzDp1MZVZ74CAQVwRPTPPG2l
	 86O60wHCetgfIJ9mH4RTzlGdXzHW/B3j7vnIvQu4Jd3hdrtb4VA2P7hwVgjLQ1X2I0
	 MClnj4vAhz4VfsoOE4gRaT9+W5j8vwNkEu4hc9ArguPK95EhKJzZ4KLITJH99qzmLe
	 AUYxuJ6Ya4ntxCbmR7YG8/TOgYhJdMqFpnYIoz9+IBbZbBGV8/SWv/mQnXzpECEhbW
	 r32B5jVu7VYpcq/xYYs+K+fSSKb4IxWrCf0vIyQCMRNOU76/RAf4ckW9/oMJ7IwniD
	 CxrheNR1FhxBg==
Date: Mon, 21 Oct 2024 10:00:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: add SoC IDs for SAR1130P and
 SAR2130P
Message-ID: <bteu6dym7o3kwngdgrp4g6xnrefuzbseulq3y2okus4vuely7q@rigajl6vokdi>
References: <20241018-sar2130p-socinfo-v1-0-b1e97ea963fe@linaro.org>
 <20241018-sar2130p-socinfo-v1-2-b1e97ea963fe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018-sar2130p-socinfo-v1-2-b1e97ea963fe@linaro.org>

On Fri, Oct 18, 2024 at 07:32:37PM +0300, Dmitry Baryshkov wrote:
> Add SoC IDs for Qualcomm SAR1130P and SAR2130P platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


