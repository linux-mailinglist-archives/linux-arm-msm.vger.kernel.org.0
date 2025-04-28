Return-Path: <linux-arm-msm+bounces-55866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C76A9E9F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 09:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29022179D8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 07:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B28212B1E;
	Mon, 28 Apr 2025 07:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSvL4eLQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738DB211A0E;
	Mon, 28 Apr 2025 07:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826524; cv=none; b=phPBdIjL0sZCn2vESeZKZtUSLKUyvx5GzugXnszwleqpKOkqRdsIykKpwiJ7ZjjGh+FCm6F5HPpIA+4iKFqgiO5Y6czTDTW+A80unQ/xz4Bp03mj/aolwaz53nFFQ5dTXs7O4Bd3AYX9ap3W0Tn4+lAPEDPrCctb/DIqYwlY+FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826524; c=relaxed/simple;
	bh=XIum2Jp2SetQmeZuKWfStoEDCIoEugFgfOxrXV8EvhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8CmI9WA/eNwURTTjzr6ak+2Q6pDTtw/UzNZRXG1ESV5zkS54RZLUjS4BPVlqAGtQAWc52qAhG++AfKDQuO15Sjdya7oJ8K2MFcEOhf+WlEPkyXEdiYRzn9Z1kF6EyQgtV7+UVkAwzPgFLRwG53n89xJPa+jsSFRX9O4v5l+na8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSvL4eLQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775A7C4CEE4;
	Mon, 28 Apr 2025 07:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745826523;
	bh=XIum2Jp2SetQmeZuKWfStoEDCIoEugFgfOxrXV8EvhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bSvL4eLQRxoOQECyI+1vl4D+9jez5mbHG3rxYtCbzKndtQrf5zv+QN5g4LDoeWTJy
	 iFSgyyzGHrEBHOIOVcHMQS2DGOSawhKDijh5TESPXUvZLK2e3uvaXZnsWtfBOxSWz5
	 xnog/XtUjYJOixhALrqUyFzcYEoelwMj91HcUP2mgVMc33XTSzcshmoZQPsqEhaTVZ
	 LOrMeJ7DUBwzdYzCw/gWNh+/DshtrM6VRQgMYNzUKZ7iNua1eXI9WEE5VYuAipr47R
	 gQAuB2rQu5cH/XdvFFbKQhLhnYKikJGhFPlP799mh7C0NXQbtsjXzkTLjYJVvFgjsC
	 80XU1V46dlXow==
Date: Mon, 28 Apr 2025 09:48:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: remoteproc: qcom,sm8150-pas: Document
 QCS615 remoteproc
Message-ID: <20250428-hopeful-mushroom-of-pleasure-1aef73@kuoka>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-1-a94fe8799f14@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-1-a94fe8799f14@quicinc.com>

On Wed, Apr 23, 2025 at 05:17:37PM GMT, Lijuan Gao wrote:
>  
>    reg:
>      maxItems: 1
> @@ -59,16 +68,17 @@ allOf:
>    - if:
>        properties:
>          compatible:
> -          enum:
> -            - qcom,sc8180x-adsp-pas
> -            - qcom,sc8180x-cdsp-pas
> -            - qcom,sc8180x-slpi-pas

This needs fixes, but it is not related to this patch. I'll send a fix
but might conflict in first diff chunk.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


