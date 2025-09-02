Return-Path: <linux-arm-msm+bounces-71512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5892DB3F8C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 10:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 268CA17D753
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 08:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A5B2EDD4C;
	Tue,  2 Sep 2025 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrfEoIKk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF52E2ED178;
	Tue,  2 Sep 2025 08:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756802067; cv=none; b=KhXlZjyV/kp8rdgRV4ncL1F/LG6q6qwbdq8xMN5xzj9s0UUH+g5v0IlqrQBDxNVQTXiohHAVWru6guHM7F/Q2KKjdLMwe1A9RYBata4jMi1B3PY+WrK1gO7W/j7ilxEFGi/BYWyNsluJQZji67pKhs31GoHBwf/xErLPixUNGj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756802067; c=relaxed/simple;
	bh=gLXZYoFZ7xJB+qnRgOcBcwhBIAaVzrkhc3BTT9CAHkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I54NL81rF8NEP8EBR7JUuQizt6GjpBbZvgqYiHEuDUB5Q0XW4Ly8koT5YjXd5cnE0tJikT7FTCYDjxXIrwL7UjrcNP40XsykVBK1mpAT5Nt3eXR01pWEtP/2WavZT1pJ489cRCYW1zGF5gW9vA0GWR8XNoMa2kq0sEFPOwCg7L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrfEoIKk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470A4C4CEF7;
	Tue,  2 Sep 2025 08:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756802067;
	bh=gLXZYoFZ7xJB+qnRgOcBcwhBIAaVzrkhc3BTT9CAHkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BrfEoIKkgdvH+DEr8nas0pSKvcIAiKnN2C8dfnRMgp86kQ+9TdEXti0VAVxB++pgJ
	 qaHoft61E0fj3D8RVl0g5J6O8leFOrdhHSZxwQ3b7DWgD2hsTC19u2SlLth00LzUZv
	 9mmduHoJEGXndlJeMjqDMLdgBi5zfw3BDHTtFw+UsTOONKj/CpNCDIAb33wbU5Qdav
	 vbVZ18QxugQj5UtUk+X4Iu3CYJ6JoV7tVnQWOYErY75kkPFzXonfSPv/n7riTscC/s
	 aa1tkpamdwvFwUMBHYy/wV3cY5YKwLG5AZEwZgIqCTZdRuFKvrUL+mm4CtFw75ea0K
	 J3a1Fw/eunvvQ==
Date: Tue, 2 Sep 2025 10:34:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org, 
	conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com, 
	pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: soundwire: qcom: Document v3.1.0
 version of IP block
Message-ID: <20250902-thoughtful-quizzical-quoll-3ecbae@kuoka>
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250901195037.47156-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901195037.47156-7-srinivas.kandagatla@oss.qualcomm.com>

On Mon, Sep 01, 2025 at 08:50:36PM +0100, Srinivas Kandagatla wrote:
> Add bindings for Soundwire controllers v3.1.0, which is available on
> Qualcomm Glymur SoC.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


