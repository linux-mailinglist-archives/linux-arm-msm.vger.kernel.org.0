Return-Path: <linux-arm-msm+bounces-30468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3339694F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42CAC1F25DC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9951D6C51;
	Tue,  3 Sep 2024 07:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4ou8pLk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521011D6C47;
	Tue,  3 Sep 2024 07:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725347684; cv=none; b=Lj8Y7GaFx82Eza4n9dHmkvwzC0ovCikLifuAxIkTto+x41jeXHBvHdP2g2fSeFzOYr/SAzEbTQegHQdrpRODneJKIJh2VU8NcPDkb9VB1NDL1E72hGQpIWjf3OAOIb6bcCNdUKrd08XwGj2A8o826vNsL/bJDSTbE0XKGQwfOtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725347684; c=relaxed/simple;
	bh=e2JbLNcGuJVlyZLMFBypM72W4Imtw3pGPo90aVhUowI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1VMxmgo/W/LPDo3k1WCvbla1wkJnyrbDwOBvkH5WU0lHd2bqxB22gvJBIMmzNs4pu0GMo67Y7VInLpk2gz/EWmWWeO43Z0zoINiudrAy788wLQQ+oAVUGjWxczygjJ4W6Vzp4H7+sNu3+kSfrAjEYJMoIS9D5kP3Z6y1NXezk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4ou8pLk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A1CC4CEC5;
	Tue,  3 Sep 2024 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725347683;
	bh=e2JbLNcGuJVlyZLMFBypM72W4Imtw3pGPo90aVhUowI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n4ou8pLk7FLJsLDoqp3pkXhC9CIzcUv0ru9NGFRXIlfq5CtAFZbE0EWBY0FFx6sVh
	 6FQROyRHZthxgkENzYASe7NbpvonP0JIVvz3zjcmDPDmH8wrvHP+U84viiS07kBuX2
	 7Tp3H3GW6WmC7YEAhq328uR3MttNxH4mrvhaKOpcM3f7mCT2weHUPhNJYv9Q2tR+5b
	 7T/rMmGujz0ktKt2SXrMMBaZ1AnI8tGnzLR6AJkDklUAJoWcunsRHz9g0bKA2I06VZ
	 NBYAw4HJxOWjyBLoCSnMemlczPJvkNaCYIxFqFp/2Pjmz/tIq/isEQfclaodBuTgIF
	 Nba2+jyfMPn4Q==
Date: Tue, 3 Sep 2024 09:14:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] soc: qcom: llcc: Add llcc configuration support for
 the QCS8300 platform
Message-ID: <zxhhk4ldsqnxqx6hyqd46q6rllekysmlczgqqlbtl4xw3gnxkq@uaxih2z7f5y4>
References: <20240903-qcs8300_llcc_driver-v1-0-228659bdf067@quicinc.com>
 <20240903-qcs8300_llcc_driver-v1-4-228659bdf067@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240903-qcs8300_llcc_driver-v1-4-228659bdf067@quicinc.com>

On Tue, Sep 03, 2024 at 02:21:32PM +0800, Jingyi Wang wrote:
> Add llcc configuration support for the QCS8300 platform.

It is LLCC. Fix it everywhere and create commits using consisting style.
In some subjects you call it LLCC but here llcc...

> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>

Best regards,
Krzysztof


