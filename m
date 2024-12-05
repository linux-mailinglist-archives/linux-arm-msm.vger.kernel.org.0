Return-Path: <linux-arm-msm+bounces-40480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7314E9E5231
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 11:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CAA72832A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22E11D5AD1;
	Thu,  5 Dec 2024 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMC1Dilv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919B71D2B34;
	Thu,  5 Dec 2024 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733394402; cv=none; b=hEuhQae2LqCB5aUjl4lG/FZnKYqK8APHcFtRRIb5BdL4EowOXc9tvKhfgeKsrCcSnhS+nBFp5kyoPWXEch8unYhPYFxzeiENar1L1f1D4lxCJCXl9KXgtq0B+0TvX/266T4dU0rwzwzg/CxqJM30PMzFDhecvN3ctMyldm5yjcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733394402; c=relaxed/simple;
	bh=N3MAuEy2Y7gKleYTsk83diYvCxdHM/d9mBFcU+rGUec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjMiezmur7l+3vy0W2rszdBqkfeWbnIMFKfnQsobYp0g/OvY2sNJthsaSNQukA34j1YlRJMcT17o1KTqym/8nitFRHfJsI+sOUZge/7BxiuLj0JjOLl6O8bxXhchFq/uyZyaU6p6QSm7EHLQAXlk8LAR2JXNaME8r3WSHImOfeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMC1Dilv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244D4C4CED1;
	Thu,  5 Dec 2024 10:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733394402;
	bh=N3MAuEy2Y7gKleYTsk83diYvCxdHM/d9mBFcU+rGUec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sMC1DilvXUSNb0OaN8Mn+Ypztbmh9yIE+l3ZA5Bi2vAzGijp4ykp493EdaSBQSRrB
	 7tFK+5iaN6eQFjHUIMjvdTslmFJAnzodJffbjYb6Dj3XQ0S8mrUH+ghJqFxmnUh2Bk
	 yZG9WeTYEnEWxlMSsiixh8MfLpJxHtKKTTAg9Zus2NBWNYIbfHnTm9q73VrDyxsxHa
	 6hF+JgIrmb1By4zeYgw7JaPqUKxTl6zGb7SWSEGQg2KNRq0Mfww+IG/q6+U2OVDEzM
	 AhUkj708/2U7DRfvbYilIi7krsIH0f2FQJI8nZiZFZltUMybwrtq9AcCDiBGZImDne
	 8/RI09B+Vrs1Q==
Date: Thu, 5 Dec 2024 11:26:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: gcc-ipq5424: remove
 apss_dbg clock macro
Message-ID: <dahqtkq6o6vrzfrmr76x7yd6iia4ihhcjfsaskilzw44wcjxth@ql2bkxnv6n3k>
References: <20241205064037.1960323-1-quic_mmanikan@quicinc.com>
 <20241205064037.1960323-2-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205064037.1960323-2-quic_mmanikan@quicinc.com>

On Thu, Dec 05, 2024 at 12:10:36PM +0530, Manikanta Mylavarapu wrote:
> Since gcc_apss_dbg_clk has no consumers, the linux kernel will turn it

That's not a reason to drop a binding.

> off. This causes a kernel crash because this clock is access protected

This could be. Please rephrase stating that this clock should not be
exposed to any user because trust zone handles it and any access would
trigger faults.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


