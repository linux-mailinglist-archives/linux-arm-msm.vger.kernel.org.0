Return-Path: <linux-arm-msm+bounces-26822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BDA939558
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 23:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97D801F220E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 21:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C356A1E891;
	Mon, 22 Jul 2024 21:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtc4XJJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957811C6A8;
	Mon, 22 Jul 2024 21:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721683128; cv=none; b=fo0bpWEo5uFxRM49P8RRP5pbO7L/XbDU8LE86Iq5+KvHaPsiY7ZqK+nnoJEqCyNAdU73cofZ2bovGuo8bcb2awRW1x5zu2hEJOFd0lkAjeJHhuB36KXDFw2JsD2NWV71JoHvfC7dE2t6kIeWwU0yVcFxFwx25haiRKerB9VS5LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721683128; c=relaxed/simple;
	bh=wj2RDsbkBYl6Mn/8pY2TVeqg95fsascVx2ZbrOPM0Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUociPIgiVXjQKkmhgvtAqs5thL840/XF4nPixP0ZKJ10yDkyA+Ljb7j1csaMX7nQAQ24zylocOVMEMbdgX4arFJctJXHIV486oepFXsye9EKm1h8af1x9zSPQZslAEIHVXKvt3TIYGCaBJJ/87tLRRjZ0auj+l1xspEnreT5vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jtc4XJJ6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544F7C116B1;
	Mon, 22 Jul 2024 21:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721683128;
	bh=wj2RDsbkBYl6Mn/8pY2TVeqg95fsascVx2ZbrOPM0Cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jtc4XJJ6VkuLjt+GPfqhEAa0leWLZgXbLkjpjixg+BNhRAqyU00orA8OmojjQKT5g
	 eyxYQJnrXwE2I3v73M1EuKQMDDy1q9Ckx90xcAtncfYDpBYYbDIvPwqktrhABn7Vqb
	 YnF4JV+VPO/zOdBj0h8tYTZ6AYkDRTLwT+lxe7GDfQE/bsv7WWpd31wgyJXWrPqkGc
	 yUtMlPdZVLdJu6UY1gFUIGZHv+3k17GadbEggbqCx45YhnU2K/H6xccjch1AX1rcjr
	 TFp898gN4AzdGFUjKMSaPCjbZ6tbuL7DEgNXu/i/HA6V0VDLCUT07zmFf8Re/SdmD+
	 2ftSO/bNaQOqA==
Date: Mon, 22 Jul 2024 15:18:41 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: bus: qcom,ebi2: convert to dtschema
Message-ID: <172168311934.108706.13431243589494712901.robh@kernel.org>
References: <20240717131030.51419-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717131030.51419-1-rayyan.ansari@linaro.org>


On Wed, 17 Jul 2024 14:10:26 +0100, Rayyan Ansari wrote:
> Convert the bindings for the External Bus Interface on apq8060 and
> msm8660 from the old text format to yaml.
> 
> Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
> ---
>  .../devicetree/bindings/bus/qcom,ebi2.txt     | 138 ----------
>  .../devicetree/bindings/bus/qcom,ebi2.yaml    | 239 ++++++++++++++++++
>  2 files changed, 239 insertions(+), 138 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/bus/qcom,ebi2.txt
>  create mode 100644 Documentation/devicetree/bindings/bus/qcom,ebi2.yaml
> 

Applied, thanks!


