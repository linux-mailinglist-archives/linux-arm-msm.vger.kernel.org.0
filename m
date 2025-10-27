Return-Path: <linux-arm-msm+bounces-79015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A013C1163F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 21:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43CEB1A61226
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 20:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32762E62B4;
	Mon, 27 Oct 2025 20:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvjYvQZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A155523EAA5;
	Mon, 27 Oct 2025 20:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761596930; cv=none; b=LhwoonGXrl4eZKb+vBCG93SLmMhBs3xnCGepM23c0zxsCetjMgnHJXv/KgkCz73fG57NLSBd4+yWxSemhl6bIModpm3zSGrRJUw3qrXIlXX+Zli28fuHtz5jmI3NT0BfyuT88Mhy26UhboZlyQsJ59RxpwKt1d9rSfFDmAm8pXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761596930; c=relaxed/simple;
	bh=PIMjobSMlnX1DCR6T/tU4HAOJpgVI33ffR2DR/yz+Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYg4yetX2jm395uuFzbT+zO+75+kB5KnqPMlbEayhHSj+LJ2ZCJtzEW0Ptku8SuQSon71lxArNIZvpQQRs+d8mAJWColz5fFZzmydEh3RggHbkz1NH33iYE2PVVo6Rt9gulibhhWo39Do6bSW1mRSLZ4VqTyPeEBz1GicFGV78k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvjYvQZv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDEFC4CEF1;
	Mon, 27 Oct 2025 20:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761596930;
	bh=PIMjobSMlnX1DCR6T/tU4HAOJpgVI33ffR2DR/yz+Cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nvjYvQZvImJOQx4rKJFEQoAepE7BE7upanKfTCAseh3KYqvxQjZ3aFI8ZRXay/wSn
	 9TM+4W0cn7/aLKqXQnEJM9GUjzLv0DvUPb4oNjfhIFWUZFLyg1ZLgNuOfJqBr8xtLP
	 Ldthw0eLxGaTWHZhAANpoJBCWhTUsesySc5lSuLiwkv1Qo06DGIfjlReEggc62COvh
	 sMHC2KhiIxp/4bjA3T7jxHGGYkcGhGSDx1QMNGy9+97jjeaQJBxoHUzWxUr402hnan
	 Ev2EaJk+xGVeW23ldFSMZ67VzTx23Z39SAmp5wU29iFhjA1m8+kPw17HqqU/2turrL
	 gJGeIDmoQ3LiA==
Date: Mon, 27 Oct 2025 15:28:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Avri Altman <avri.altman@wdc.com>, linux-arm-msm@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>
Subject: Re: [PATCH] dt-bindings: ufs: qcom: Drop redundant "reg" constraints
Message-ID: <176159691507.1523859.10365609457145821149.robh@kernel.org>
References: <20251027113107.75835-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027113107.75835-2-krzysztof.kozlowski@linaro.org>


On Mon, 27 Oct 2025 12:31:08 +0100, Krzysztof Kozlowski wrote:
> The "reg" in top-level has maxItems:2, thus repeating this in "if:then:"
> blocks is redundant.  Similarly number of items cannot be less than 1.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


