Return-Path: <linux-arm-msm+bounces-52732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7999EA74519
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85B90189C70F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 08:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFAB212F94;
	Fri, 28 Mar 2025 08:10:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE95212D67;
	Fri, 28 Mar 2025 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743149455; cv=none; b=WUFOvisuO0tkiXE+XB08Dhh7IsLitjhwDqMdV3Y6c8ygtcr6v2BHu8hCpuCp1ubMHkbiTGZhkG6BXm5Igta4FMNuXyBNpzj97i2bK0SfHPsOkMBTiwrANEoKI5EZaDKSKg/4G4ofD+GbI6hQJ6J1SwE5x5KasF0dAKjFL3bJcjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743149455; c=relaxed/simple;
	bh=IoK6qy2RthqkwZxyW5hH5+5+4LgNMBj9dBCnc5GG914=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6OuFYWKvvE4hBAsGp7uEHmTnDqrjwBfgwszDsizxEX2jc66jqaMxVVG3X0GsFyVkvX6ODmMdq9pcmECUqe6wJhVvlUEvbo6tKsuoA5AOxUWLWR8wzocc+6T2AOlafbuyuBJVqAwEnVNMI+4HFg3y4JzE4ZOLlI0SAb8PUWm/ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87970C4CEE9;
	Fri, 28 Mar 2025 08:10:54 +0000 (UTC)
Date: Fri, 28 Mar 2025 09:10:51 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 01/18] dt-bindings: clock: qcom,sm8450-videocc: Add
 MXC power domain
Message-ID: <20250328-solid-horse-of-refinement-b9f7a3@krzk-bin>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-1-895fafd62627@quicinc.com>
 <20250328-wise-chocolate-marten-bdccd6@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250328-wise-chocolate-marten-bdccd6@krzk-bin>

On Fri, Mar 28, 2025 at 09:09:00AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Mar 27, 2025 at 03:22:21PM +0530, Jagadeesh Kona wrote:
> > To configure the video PLLs and enable the video GDSCs on SM8450,
> > SM8475, SM8550 and SM8650 platforms, the MXC rail must be ON along
> 
> Either your patches are not ordered correctly or you forgot that
> SC8280xp also gets MXC.

Ah, no, that's videocc, I mixed up devices.

It's fine.

Best regards,
Krzysztof


