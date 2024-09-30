Return-Path: <linux-arm-msm+bounces-32773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB9998A35B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 14:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2784C1F2456B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 12:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E911B19259D;
	Mon, 30 Sep 2024 12:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vA4N8vvG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B4B1922F6;
	Mon, 30 Sep 2024 12:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727700310; cv=none; b=PEXB0Sx9eywyUnxR1tkx8lceO1vOCV9fl/k/034DA00Knmz2zY3Yhfx/b9mJBk434H2mOx4DoaTcMKnqpulWcIvUlrWTCf1pihRD+VnavI2ILQ+xVWwRQU0f7jI1b9wjxYgeOgiv3+e9C0ntnAymAM1YCuhdTsxdo1pRwoyR4MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727700310; c=relaxed/simple;
	bh=1LLJRG16VH/MbBDwirg7NpK9iFySyV15gPh3ahzzhGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rl6BkaluQw35HP7TSJvjDQs3BNpCbDAVdhtkGl4kfWL+xFVQWxXafbPl2PBgpNyCXsAvtAc21e34hiklDKrMJ+iL669dkR4ofJR3x5EB/CTzPm2IDOEdQZFW0cuiW+Md2+8ZDPaOSs4DjdRT+uhoRGtfm/fBnY43nqMLV7XhZaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vA4N8vvG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23119C4CEC7;
	Mon, 30 Sep 2024 12:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727700310;
	bh=1LLJRG16VH/MbBDwirg7NpK9iFySyV15gPh3ahzzhGo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vA4N8vvGg+k27GdwEAzQNgZDF3DjXiWl9JrKWc9tmHr7U7tCWqnH/tD5Qg6mG2DDI
	 LLbcT2DKxxaCrXRMPEf2rzTMenliERgSYeiMvh/SQ/Fhwc/+Qqz/s1YO5TtIuw53R0
	 WNhwyuZ7uE55SHz2yqLtzujy9SpUErMNjGFYbpTo4Ra29Nl13MZhVceQH8+YOQUJgf
	 ArF731piYWgvTKuAYeJvk1fyfsH2M5oe4vEymhsOg1a+9y9tciwr2zKTikG2QfJjL1
	 9oZxiqEQplt0+IXkGumSFhOX0pyXHxe/J1s+haBj1MvTH+r1+gvnZYmbFgUDHJCHHm
	 IkYpx55u0DR3g==
Message-ID: <09018943-41c0-422a-8ee7-2e2ce5343b48@kernel.org>
Date: Mon, 30 Sep 2024 14:45:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add EC to Lenovo Yoga Slim 7x
To: Maya Matuszczyk <maccraft123mc@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240927185345.3680-1-maccraft123mc@gmail.com>
 <20240927185345.3680-3-maccraft123mc@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240927185345.3680-3-maccraft123mc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.09.2024 8:53 PM, Maya Matuszczyk wrote:
> This device has an EC on i2c5 bus at address 0x76, driver for the EC was
> added in a previous patch.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

