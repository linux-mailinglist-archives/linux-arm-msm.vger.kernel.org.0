Return-Path: <linux-arm-msm+bounces-55874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0F6A9EAAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 10:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F17A3A7B73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 08:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAF52356BC;
	Mon, 28 Apr 2025 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIDPSouD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E52C21CA03;
	Mon, 28 Apr 2025 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745828681; cv=none; b=KkCBIbk1lwqjP63EBcwf/w7qZ2cvGIwglPVjxt4cx/Jn8fND1v73g+Dkd6eR403ZTZ3NWt5EppAWnWH6GEk7etjy5CWCMihT176HmNz2akhNZQ1M1s47KyETrW43XCqfrYbFJrdlYOpq06hHapifjqwAPG2WW5UJYO3Oh37NNGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745828681; c=relaxed/simple;
	bh=TtgBLA9mKKZPIXapZntKcMSMnVPz6L+uLP2/2xOpYmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rY5f5aCgbm7OFzAcTk/dHSCzla4KRwlgOkwQhUbrhIoN57FkE1+4XWhzhDcdrFA8wQcxRyMqqgv2F9ixf2CpWptaUsRLBrek0dMCARtksGVUTaz8KWLVI6nfnJY7ixzgfxroggUYOeJq2HUt+A15VtBfBMxtnSFa3AFP+UO8XFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIDPSouD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F924C4CEE4;
	Mon, 28 Apr 2025 08:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745828681;
	bh=TtgBLA9mKKZPIXapZntKcMSMnVPz6L+uLP2/2xOpYmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iIDPSouDcjsRsyxyHGxKxiBvOP4pXoexmGzVLHQzoAgaMEBLVdVqJHg2/TpQWyWBX
	 OWqqTA2LTtPypUP2A7gwv/IoFJvlHA00EV/qjt1KldCYNA7gUEF1ryEkQapUOEZKiM
	 W73gnbTYl8nJmLUfDS/d0bADvU6/8xDPDa1xIsn4D9RLH/44F8ZI1IvqAeC5sO8UsQ
	 RMBtEujvuXG8KMJorpCBFQq+WUonddbJyEQit166rnegQtkEGhJvGssKD9ybrYxvk6
	 X83a6HWinbz9b4ShJKJuUqXzeeIjiTOoSUoQ2gtfyTRYSDbU+wEia6CVlMJtBahSWx
	 /oyjOqr/tbeTA==
Date: Mon, 28 Apr 2025 10:24:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus
 7441
Message-ID: <20250428-precious-armadillo-of-abundance-a9bbb5@kuoka>
References: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
 <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-1-ace76b31d024@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-1-ace76b31d024@linaro.org>

On Thu, Apr 24, 2025 at 12:53:30AM GMT, Bryan O'Donoghue wrote:
> Document the X1E80100-based Dell Inspiron 14 Plus 7441 laptop, codename:
> Thena.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


