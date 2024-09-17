Return-Path: <linux-arm-msm+bounces-31942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF2D97B631
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 01:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4DD9283A68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 23:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5D816BE0B;
	Tue, 17 Sep 2024 23:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZgJAQYG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD62A29;
	Tue, 17 Sep 2024 23:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726615960; cv=none; b=Gi8dsSn6IeSjtlCEinHGoVekCTjeqeB0hD2DHETo4Rfh4aJT83Q3tcmJZX/nCgL2xhFNHNLl3O4bxf7C37+Q9LM9xYt/lUuGS3WZawmIFkUXH6cnUDuWfnfr+e3SbK3ka4BF9039ipvnT1N25K0LN1jYNaY6J/ngSsScWrQVRb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726615960; c=relaxed/simple;
	bh=S/IqOkjhykwG9qoJQQTJtsMXpqrng5Y2jVwPR3m2yBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ty4OK2BfZyXwP6YyxxiSJcNJ+vhST3ndSHuJLEdQYJ5ocoUYC4dXHu06QuP0MKU18VVIB0/rfoKMdRIDtWjLIkzcXuqfnD85cjyWfX6b7zmcjQNAfk2qFeWDbCDQTy/QfzWQTzldyq5SzOgnsF/veI2qbPXwWoiLi+xaivkgEyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZgJAQYG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD10C4CEC5;
	Tue, 17 Sep 2024 23:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726615960;
	bh=S/IqOkjhykwG9qoJQQTJtsMXpqrng5Y2jVwPR3m2yBM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fZgJAQYGj0qhHYxrCjOWVeo7SqXMXmHcrmwLHNlVFsUqkWTEjRYe9iy3rHXBrVi4q
	 oj3i2KmVatPrm74fawNgFvOeoQ/bOGnlvYzck1cBo1VLskTRk7dCdRqMOkymEl09UX
	 kJYrXP6OZjm2EVRlZYbmlzFyCwxUrAJprj6N3/5vGQjt7ipNddra6aj6TR4NeM7ue9
	 qx48vtkUjtV9OaW/B+cnqeEWfsc3W5mOKHzMQtK8o3uZ90+0OYfKptvEIJAL3aWVf5
	 dEH3RELe3HQLtGqxIOKiY3eKOC4L4mfjLmuHO8OS5NUm9vwlUwaIatC5kwYN/9P2zn
	 Y4epFQdIaRQ7g==
Message-ID: <5932fc68-3afd-448b-99b8-65ee9ef5dda6@kernel.org>
Date: Wed, 18 Sep 2024 01:32:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-t14s: add another trackpad
 support
To: srinivas.kandagatla@linaro.org, andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 abel.vesa@linaro.org
References: <20240917150049.3110-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240917150049.3110-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2024 5:00 PM, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Trackpad HID device on some of the T14s Product Models 21N2ZC5PUS is
> at I2C address 0x2c add this to be able to get it working on these laptops.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Changes since v1:
> - moved pinctrl to parent node so that pinctrl can be claimed globally.
> 
>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts  | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> index 08ec2419f95f..45a77c1fb6f4 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> @@ -551,6 +551,9 @@ zap-shader {
>  &i2c0 {
>  	clock-frequency = <400000>;
>  
> +	pinctrl-0 = <&tpad_default>;
> +	pinctrl-names = "default";

You're dropping the QUP pins, please include them too (like in c630.dtsi)

Konrad

