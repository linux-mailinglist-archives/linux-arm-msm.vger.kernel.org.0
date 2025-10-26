Return-Path: <linux-arm-msm+bounces-78827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 542E4C0B52D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 23:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 00A403494CC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 22:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBC8264602;
	Sun, 26 Oct 2025 22:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rg0gaPaH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6926D1D90DF;
	Sun, 26 Oct 2025 22:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761516619; cv=none; b=M8qf1EEkPILshMA5tS5lq4owsmnjbyjIWN1Yaqe/nU2vsqri15126z3iBesbuIkRe2sm7vIqBhXEImM2J9SWHiek9VWdLZ+E1rP16Lpw56y4iEZfDsbSqSBoquAIA1V4UutGTTwBMi9Vh26Kp+u1bwGIXkDhkdspah/vypygkyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761516619; c=relaxed/simple;
	bh=R4jXTCUnTeZh1MdwwKl0TkY9/ztR69WZzx8McuOQaJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLCDiLqbPfr1N2xu4eMcqwGIYZnXSTDBBYtdR/K0+87UqfnrGHAIQhU4qc+JDYop+wFGM2GbYMpTeM7VGi63eLu6urgFgX0V4j4TGOFiQZJN++o9GHpwb4Tjst/ADvyMh2cMBPwlcuxdM32p0+1dmNKZGHqV0S/opJguzFK9QZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rg0gaPaH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B25C4CEE7;
	Sun, 26 Oct 2025 22:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761516619;
	bh=R4jXTCUnTeZh1MdwwKl0TkY9/ztR69WZzx8McuOQaJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rg0gaPaHwI8d8qTaD+2FggQfJ7ylojBXXXO7p+eG0DEcouMDDSpDnY+3+FvEe2SAV
	 pBcUVKeq+n6kgovZUVaKL/H5g9DrH7AtbCkQkfKCirJ9na8hv01BWZ4/XcbkK7BdFn
	 ej/+E14eNS9SXGX2W+wnemis2FZCsqjw/4d195v1zDjCUbecnHw3cicG+oxU47n7Bn
	 qazhN82NW3A+24cqV9Jx9p/LVtnSL4dRYuYF3gPho6fExbuMXUXkZCzQFJffReUfna
	 dtF0pCNsjkV6aCKMYY69puoNi/cSlS85wfNYhGvxrNXTvSdTyf2oCBwjdKQ8hREdhV
	 aZOAGwOlNayrQ==
Date: Sun, 26 Oct 2025 17:10:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Piyush Raj Chouhan <pc1598@mainlining.org>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	tony.luck@intel.com, andersson@kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, gpiccoli@igalia.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi Redmi K20 Pro
 (Raphael)
Message-ID: <176151661458.3025811.4788151750131120882.robh@kernel.org>
References: <20251022054026.22816-1-pc1598@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022054026.22816-1-pc1598@mainlining.org>


On Wed, 22 Oct 2025 11:10:23 +0530, Piyush Raj Chouhan wrote:
> Document Xiaomi Redmi K20 Pro / Xiaomi Mi 9T Pro.
> 
> Signed-off-by: Piyush Raj Chouhan <pc1598@mainlining.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


