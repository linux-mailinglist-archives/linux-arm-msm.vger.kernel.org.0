Return-Path: <linux-arm-msm+bounces-55164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9295EA993C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 18:03:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6F129A3818
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B8729B79D;
	Wed, 23 Apr 2025 15:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7VpmJYj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D240329B78E;
	Wed, 23 Apr 2025 15:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422756; cv=none; b=ReHduaD/wAuRQXjRbKGrIV0UbNABmGrzg/FF+4OZLcBsqdDehz9QUUjR2zHiZ7emRoouTaV3hwj4HMlwWCQOUuM4Eg7jOAndBHGxo0Ws0RGKVkREjkW4mFbruqqCSaJGHBoxZ9PKbVsxsNBhunXWHisbOdODw2Z6bwPy5p3Qgv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422756; c=relaxed/simple;
	bh=Rf1l2OopktqxYqDNnHpIAJYUYrIzgYLt+auAQdNmub4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCvofyou+s+/EFjOU9BEFIUJywo6tqOHa7lG2opTXSk8ian2ozhpS+uSwnhIo1UOem3FyEJmYqSV6Mr2xQgXLemP3kAOAqqFIwU12o6APOfyV5KydgIjpWJIMcm3gxKFuh7ue0HkbMS4rmDmCjQa/Qnf/gAYde8FQL6rACpcgnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7VpmJYj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5725EC4CEE2;
	Wed, 23 Apr 2025 15:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745422755;
	bh=Rf1l2OopktqxYqDNnHpIAJYUYrIzgYLt+auAQdNmub4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W7VpmJYjbudkZYJq6HWOPTumUvKRSJJfmsz8agWpK5fsRb8HnmBpg9/3O4ORCJbpu
	 cQM8uH74iSUNFIwN+QnEHKsmEGsZ4EGKHayc92GQXoyUF/n94nl7AjksfzEAmmKybM
	 7Z90GIJk2Ss7cPO9FpMNzDK57q6Qqz3nM0PPNlMMF9pzjq51KIgEieMVw6phW0foVx
	 cGC7H4MSe8lLaaSy2s85pMyzYwGe2bmxFAGTKnX9joUZm3J0N7QORe2wZZRvqiiI2c
	 VJC2X4og3JBewv97lgnOnUIfIrIQW4TQadI1TSSDdu+G4YIDbk1jeASUIP8tPa1jTB
	 /ThQeg25gy2ZA==
Date: Wed, 23 Apr 2025 10:39:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kevin Widjaja <kevin.widjaja21@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom: Add Sony Xperia Z Ultra
 (togari)
Message-ID: <174542275325.568386.14142528587023149670.robh@kernel.org>
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
 <20250419-togari-v1-3-45840c677364@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-togari-v1-3-45840c677364@lucaweiss.eu>


On Sat, 19 Apr 2025 11:00:40 +0200, Luca Weiss wrote:
> From: Kevin Widjaja <kevin.widjaja21@gmail.com>
> 
> Based on the msm8974.
> 
> Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


