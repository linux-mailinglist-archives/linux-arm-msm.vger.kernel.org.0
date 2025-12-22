Return-Path: <linux-arm-msm+bounces-86170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38592CD5429
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE6B03009960
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A246C30F554;
	Mon, 22 Dec 2025 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iaqE8lvf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BDC1F1932;
	Mon, 22 Dec 2025 09:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394717; cv=none; b=g9N7WhIoZU/5iC3mawNZcmmH7qmgfcjwDXyzJThAIpKQ2XKsANKIu3l2oYB2JNUbgVXt+ZYSnjYbtMOIepf5ghdeWqOj1TNtoQD1hTkjtEbIQoG7bxqJ+JB3GmDzEi4n+TWk4ZysaNyN/bG45E8l5z/h4nRJ3oZT/YNaxkzYGRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394717; c=relaxed/simple;
	bh=yVWux8/ZKwIWgsG8EyjkUIHCAFrKeJzFGNCDo+bqFpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSSXVy3zqWaacW+AyFt7UYSnFbC+OaSiNIPGH12q5V3nJ2ZzTeIyt/gq/pRyLwpDIPUAvrPryKbOOwvQrFfqrCiiUqsSsXNB6NgwuywGUafwKLwQ/aaNQzcfz5jliaHGh0enqrjT9fNX7AOaa5p4g6Jy94N4knasnDFPDQrK2kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iaqE8lvf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B73DC116D0;
	Mon, 22 Dec 2025 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766394717;
	bh=yVWux8/ZKwIWgsG8EyjkUIHCAFrKeJzFGNCDo+bqFpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iaqE8lvf7wCuZzpwiiX0jdnJ/EPpYmSD+oF9CNgaDXSrkPZ4962L+/cTT9VVW2wnC
	 wAA8zJfAcPGdPKaMz8AF/9J3ECQuo5B+0jk5PSEWsjvTFW7HVP43GgnKe7o3UDAGEc
	 g0CjlT8yrKqVOdjOVZzXQKV/H6MuFy1+QghSSU4jrkc3582TLN4ucaHf/YHXk1hRtR
	 WHpVhSIMRw8KEMIlpyYANgsfwVhzq3xkXLVXQRXqVdpCSPyTkLviL5Z18FbHcENpGc
	 dtzLgpzpU3qGyL+tn1u01kjn8o0ptg0UZl/UmbVtV4tt26xUhCQi/Xy59iQnjTCQmo
	 zC1jrOVjV2VDw==
Date: Mon, 22 Dec 2025 10:11:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: YijieYang <yijie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
Message-ID: <20251222-fluorescent-turkey-of-gallantry-df0906@quoll>
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
 <20251222060335.3485729-3-yijie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222060335.3485729-3-yijie.yang@oss.qualcomm.com>

On Mon, Dec 22, 2025 at 02:03:28PM +0800, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
> the common components into separate files for better maintainability.

SoMs do not share actual hardware. DTSI does not represent what looks
similar to you, but actually common parts.

Best regards,
Krzysztof


