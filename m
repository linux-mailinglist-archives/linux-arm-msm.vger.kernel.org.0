Return-Path: <linux-arm-msm+bounces-47763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8747AA3279D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 14:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80B4F7A243D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 13:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA69920E324;
	Wed, 12 Feb 2025 13:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sLutPwVZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DFE20E315;
	Wed, 12 Feb 2025 13:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739368433; cv=none; b=ncV79pJfWiouCqV7f0Ur/dQk09v2gv8snFZHEMxjNIL4nUuXtEWOh3yne4vEy4/9NjJ8/lUawn6QAP7bRS0k2S1CXck57OMJVcKJhqSj+lMv1o9EMm417+hQyHqmK4SkQYyDiLFpov9Oe9dDdH7SPTFYu3MhRb9HlKuSzLNP9iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739368433; c=relaxed/simple;
	bh=3rkUoy1qkWPdGQyUdnkY0Y+dH9RyW2YU/zqTrdY5nKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Na4ABlJQznYTvo2NnqVzFrN3K0iJ1mqz7+XVm0jQ8KFb9V4Lk43ggqIIw5RGZZ4+yVvVDKKaNCR3MIi1YSiwS56NOxbUnYP5KeNg7wSd8mUsPLqRbe18GWisp62P2aFy6gwkSa/t7H8npcglVV/1U1V6zYyzEG2YhxFTjK717JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sLutPwVZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B7FC4CEDF;
	Wed, 12 Feb 2025 13:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739368433;
	bh=3rkUoy1qkWPdGQyUdnkY0Y+dH9RyW2YU/zqTrdY5nKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLutPwVZieMUUkYV+lP3Mfv9zkHOI0TZLIHbErNwNBVzuz++kbVJGFHC7oH2AwGlB
	 kbyzM19mu2Y2Gf49nqtKjxg4KUvtpgvzwLvTCQLBM4gkw8bktXgltgaJ1U54nrDhLU
	 7SGFmaPU1Y4vjRwzsSXFpeatvRFcvV/Yy8cci0uPCR7n6LUNYsCdl1TEo0/X5vUDoE
	 a9jZoKDF33XMHoZ5ba4ZqS3X5n2rVQw8R8HVaQAVheA8+57uXDdv5ghw4suz40I+lu
	 1dPwD58qu007GcLDD3usut2/36zE3ihP4GCaYtWKaJw9ELzKa3thBu4HIeWT+ss/SQ
	 JFgxy4SI97iyw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tiDBg-000000007rf-2TrR;
	Wed, 12 Feb 2025 14:54:01 +0100
Date: Wed, 12 Feb 2025 14:54:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Add the watchdog device
Message-ID: <Z6yn-DoP5jC8lruY@hovoldconsulting.com>
References: <20250212-x1e80100-add-watchdog-v2-1-a73897f0dad5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-x1e80100-add-watchdog-v2-1-a73897f0dad5@linaro.org>

On Wed, Feb 12, 2025 at 03:31:36PM +0200, Abel Vesa wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> The X Elite implements Server Base System Architecture (SBSA) specification
> compliant generic watchdog.
> 
> Describe it.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v2:
> - Moved the node in proper place based on address, as Johan suggested.
> - Picked up Konrad's R-b tag.
> - Link to v1: https://lore.kernel.org/r/20250206-x1e80100-add-watchdog-v1-1-77147510c2d7@linaro.org

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

