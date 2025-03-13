Return-Path: <linux-arm-msm+bounces-51256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C49A5EE7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 09:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 274873B9E85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 08:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C01B262D11;
	Thu, 13 Mar 2025 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqxhjJwb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4C5261573;
	Thu, 13 Mar 2025 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741855931; cv=none; b=s2dlduUFhMCjv/8W3YG1psMtYCR0rRr200EvrZIsqEepkVGkWgWVWBTmcfhvpGvOIoCUj5nimikRJ4bnD0wHgZc/fX3YKRv6AbkcuOLo2Bfbn6AfVA89e90wgjMJ2FVeA0yb8T7JLGA4m9s9sCMH6vTBHcZHHwz1aaSlMzFX1XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741855931; c=relaxed/simple;
	bh=jVDomjMBnInaKjiE+S8O3q0/G9g8FyXhVtfxKw22KpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+AlF20x2Fd3+fpLtdrIch3crSe60rcHf3NYDIm1i7G94u6LgJ20W90/aMn1JQbELiExoileK1EPORj75QKZy8HsCBbiLdA4bqGX4bme544eYRXOv3V4mbabVxyCKd/yHMJgiqpHeeAL2lIMV4NuoJUTCAAiXqqF9jaTXw3Wdyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqxhjJwb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC439C4CEDD;
	Thu, 13 Mar 2025 08:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741855929;
	bh=jVDomjMBnInaKjiE+S8O3q0/G9g8FyXhVtfxKw22KpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqxhjJwbxsTE+ZG9tuMPjHFCDI4apXwfJAeCPphLgJb33ABkytCHrPJW3TLgOS/a/
	 odHpQ0/+cUvgFqE9olNXeoXI1AwoeRVfzn1jt3rRZwgsgYNQpVoo/aVqW6q/FEYG/b
	 OBGQLoK+yjVRHG5vnmgP9AYXnqym19Ihr6mNjqHv6Th093Ohl9mmFFe//qDizo+N6Y
	 HiLjVzqXhTFhJu6ISkrd10yUqy7LKxY3pVQodPVA/JvREzyvqpXDdt/N3XFaKigebJ
	 N/+V4GkGQffH5HrzFN8u01qxBqAyo+9Rgo+qE1YU5C969JAvffgX1+GSibTLlOMTto
	 W1ldVtIMo8O8w==
Date: Thu, 13 Mar 2025 09:52:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: cpufreq: cpufreq-qcom-hw: Add QCS8300
 compatible
Message-ID: <20250313-valiant-fine-giraffe-c6acdd@krzk-bin>
References: <20250313-qcs8300-cpufreq-scaling-v1-0-d4cd3bd9c018@quicinc.com>
 <20250313-qcs8300-cpufreq-scaling-v1-1-d4cd3bd9c018@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313-qcs8300-cpufreq-scaling-v1-1-d4cd3bd9c018@quicinc.com>

On Thu, Mar 13, 2025 at 11:33:39AM +0530, Imran Shaik wrote:
> Document compatible for cpufreq hardware on Qualcomm QCS8300 platform.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


