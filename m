Return-Path: <linux-arm-msm+bounces-71225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC0EB3B532
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 10:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E17D1A03F12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 08:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E5229992E;
	Fri, 29 Aug 2025 07:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+nIA2N/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5612857D8;
	Fri, 29 Aug 2025 07:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756454261; cv=none; b=OeQ5Wg8r4TZHepBvuZfouncmKyOocuxJ/8OEzygqaPR1zhd1cMlTEw3zM3J92DaxQRjprN6ZhaoTXQfhr2tYMM2lC/8aiRC7cRlSp8NWRxtN4IM3SH9W5gTuJi9qVOaG/NgIxt0huoiRNw4DaBsMmTvp9j2l3V2J/8skpTIXBpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756454261; c=relaxed/simple;
	bh=hjAvPm+ZU7dp8h6Mn6j2eICJjTMzwA2jL6EXtiQs2xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCNWOPMGPkSqcjZB6t+ILwYE+u7zvHtyVRNxt+MqGsqvx4aQBcovA8+wXuvcZWU7/PR+xm0bZqxTWc+5AqD3xvLVcv711cbB7kO2nGZosYK52vK+cXKwUPyoq8vse5shFzx7iPykeekEV5mEtJhnseunHV8hA1CkNkv7npLWE7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+nIA2N/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1703C4CEF0;
	Fri, 29 Aug 2025 07:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756454261;
	bh=hjAvPm+ZU7dp8h6Mn6j2eICJjTMzwA2jL6EXtiQs2xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k+nIA2N/2+fB+gj07BzaILpg5Z/O4SUMgo3HX5p8zTnIhea/VyxUtdjVvi58WyZRK
	 cWVz26Yy4M8eZ21/dEb2KH2TlEzxgLdkudmpIuuYlieCZz1hEgjo8BanBChF2xRaqh
	 rEEy8KCKCLvOSUldZLssk/UldoCMW7kwWQSyRQU43M9uinT693CFwo1VdxXobW+ZlN
	 JdmAuaI8O+Xv9CVkZ4pdzJWkSw8c/7fw5h+pjM791xs4YgSmFLKnE8A30c7E9ftATy
	 M7m4jf/NQQOHgsPugFEckzBO1oCvWsXPI1v/FvRe1vwCv9bnlBu9R5jrhZHPDADr2B
	 cjO0kipN1deyw==
Date: Fri, 29 Aug 2025 09:57:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: Add Monaco EVK support
Message-ID: <20250829-invaluable-giraffe-of-hail-5272b7@kuoka>
References: <20250826181506.3698370-1-umang.chheda@oss.qualcomm.com>
 <20250826181506.3698370-2-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250826181506.3698370-2-umang.chheda@oss.qualcomm.com>

On Tue, Aug 26, 2025 at 11:45:05PM +0530, Umang Chheda wrote:
> Introduce new bindings for the Monaco Evaluation Kit (EVK),
> an IoT board based on the QCS8300 SoC.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


