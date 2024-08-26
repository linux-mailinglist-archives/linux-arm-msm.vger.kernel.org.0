Return-Path: <linux-arm-msm+bounces-29503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8525B95F44F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 16:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7F331C21E1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 14:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B971F18D64D;
	Mon, 26 Aug 2024 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFUVGOCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D51F186619;
	Mon, 26 Aug 2024 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683742; cv=none; b=WkwrZbhCAyQsu+Lv6pyffKwwiM8ir5CcZAx4F0SB9ko9uih3OxOy9C/LSmbmkw4GKiWuWE8g60qDZss6RUs2i3pFZ73ByhIBVuMp+9Nl+zxyo5VcvEAvzS6PYGp+BSFwJu+RWLXuvVbV5MG5BX5a3fqoSekvzZtR8TNbt8j/tZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683742; c=relaxed/simple;
	bh=2exWCUJIA11nw5J5XZ/0IFQ4K1xKs7caIt0HuTblj/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iT7PhanUr512sFqhBeZ5EdYfx2yRHr3vlIWMC8pt0i3joOn4oFgoThZTLdlFsc0ypip0PiTWqtIP8zBY9s5gg3bE1DN+861MtDK6tAFxfM/3AsiqGd0ES8bapQnfL2bHe4QgqFisikxBkm+K0MPJWN2JO95sn0SFj+vLS+5BjQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFUVGOCW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323ACC52FC0;
	Mon, 26 Aug 2024 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724683742;
	bh=2exWCUJIA11nw5J5XZ/0IFQ4K1xKs7caIt0HuTblj/8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UFUVGOCWcjwgF/zrIkL+0b2NZ02qPsUTLg2Oygz1d+hR05vfJVCA4C2H6AZcoWtPy
	 ovTrypIEFcy0Nz2QSOcuVil2bOzrD+7qhjaPGTcWm/gTLYGh1m+fxTjBviKhhC8Nhp
	 NS7s1RdxMOLd6lmR9K5k7ooCbMhPsa+hs59EP0sO2fDiqcep7fcj1Sqhqym6RZLkxb
	 og3E0MxwGDU4ZfqJGVI7efAWIktzHd2d2GHOoIeNWSRxiN2RTrnjlh4ADF74opG0V4
	 JPnlSJjkpwKDKed//E2B6AuYXUPznJbbrRGMRiji2WjSd+tWMFMvI4syivyEhnRRWM
	 0e8IS/F1dQU+w==
Message-ID: <1ea5db67-652b-46a4-a75f-1d809c019da8@kernel.org>
Date: Mon, 26 Aug 2024 16:48:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: qcom: Add Surface Laptop 7
 devices
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20240826-topic-sl7-v2-0-c32ebae78789@quicinc.com>
 <20240826-topic-sl7-v2-1-c32ebae78789@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240826-topic-sl7-v2-1-c32ebae78789@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.08.2024 4:37 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
> 
> Document the X1E80100-based Microsoft laptops.
> 
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
> ---

This has received an a-b from krzk.. forgot to include it

https://lore.kernel.org/all/24050176-b269-4b96-b5de-02716cc3eba5@kernel.org/

Konrad


