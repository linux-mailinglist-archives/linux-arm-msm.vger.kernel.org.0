Return-Path: <linux-arm-msm+bounces-36004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D39B17F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 14:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D44782828AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 12:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380691D5175;
	Sat, 26 Oct 2024 12:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQlkc/6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B3A1D3654;
	Sat, 26 Oct 2024 12:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729945285; cv=none; b=aOcmmQSDN1WN3kcIBdYoC0j9+uTZUOk026Ceg10dJCsvqDRBUN7YZNOfgXxkdNcnNfndWneyRyW+m+5wA08ce2Z0Xck7xPQV48yIynho4O3D3W45gqnWbg5eqM3LDZYvDK17E+EGBfmNMg4XuK2A9toSyDuyrJfmj8FSN8r1sls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729945285; c=relaxed/simple;
	bh=fOyfRRPgF2Ic+5lt8K6HV27A4ZFByQ740oGu+uFgUUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuctcyrWPqxns5TEyQJ1ca/n1kavtxy6hF+FXNqKHgbj2HkmDd4WLrGSyLj40lHGayU1c77IDMrr1O/F8LoEcC2FX5hosefjP1zuKIb+Z9odHWfR+1/t6ZdcTr/2k7oLs/MSx1VPuYc/SMB7DjuTM0Gr2F9o+hOh57EHO+kpK1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQlkc/6o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686AEC4CEC6;
	Sat, 26 Oct 2024 12:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729945284;
	bh=fOyfRRPgF2Ic+5lt8K6HV27A4ZFByQ740oGu+uFgUUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VQlkc/6oAIHTwqYLVMokVBVvy5+iW0JeJoT4xWzccisvdoc0v1+X8H8ZN13Kyt34Q
	 5FzEg/sgg4HBaOEXPPkOQzn0FCoGIUtA5BIo4Ed9735kvlfAYWKF/i0vG9NXGDjXQy
	 OBmWM077WkDn3IEuGnV2MTa/6OfS4Ct2nBt3Laekz8qTxuTnAirCskLnRWQblxf7Uc
	 uUbGitk7DJYOTX3kULjPKlwG1lKiZ1CMCDj/hAxliHPqQ0xtXzQaYpWDN6GtR3bd0S
	 /XxqTbDqUajeoAgZN1uvPmL60wt/8gMHrL6i8L8ZlsQ0fmPggzpuWC6WZHwgLSu/GF
	 60FsP5dkhInkQ==
Date: Sat, 26 Oct 2024 14:21:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: qcom: Add QCS8300 video clock
 controller
Message-ID: <a6vlracyxhhtrl2q6rrbifjcc7s6j6au433w4ib6baqrtcuaa5@jl274rudcenr>
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
 <20241024-qcs8300-mm-patches-v2-5-76c905060d0a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241024-qcs8300-mm-patches-v2-5-76c905060d0a@quicinc.com>

On Thu, Oct 24, 2024 at 07:01:18PM +0530, Imran Shaik wrote:
> The QCS8300 video clock controller is mostly identical to SA8775P, but
> QCS8300 has minor difference. Hence, reuse the SA8775P videocc bindings
> for QCS8300 platform.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


