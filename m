Return-Path: <linux-arm-msm+bounces-52729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBB7A744E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1C753BAEEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 08:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13982116F7;
	Fri, 28 Mar 2025 08:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUU8rGo9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816BB211472;
	Fri, 28 Mar 2025 08:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148961; cv=none; b=oSchXqf82yB3xS4dxA3Rzv598ZktzuHjH1zUinfNcCq8lOpu7OVWE8vqyFnYS5QI0SXuMVRacQhNtQBcad4USmDAJvCUEtqZKqMCaoJOG5FZQd0HNz74QDbBiDbKetz9IRBtMYEP9apOuGGHTkRNhph1HbU5uieVeMnlkdZEaHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148961; c=relaxed/simple;
	bh=unqPUTLYrk8g7z1KJPgUGV58F9IymKwwRXFGtI2jXZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjtkvX2GPxeNvgayiZcJrn6SRmweFZy2C+mYCr1AeZFAZNMXIYECpzEA7L6nI8GwO1VlsQCJ/EKOVWM2ArQ/ngOGSk3yGux1kJL41c7id/GJtTSbI6ZDy4neD2F9Bvvn9XbhoByjMFG3I4hRkUDk1fp7QPA99NTTq2LLmZDN59w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUU8rGo9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7401FC4CEE4;
	Fri, 28 Mar 2025 08:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743148961;
	bh=unqPUTLYrk8g7z1KJPgUGV58F9IymKwwRXFGtI2jXZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUU8rGo9jRRUhjmNIrWmlUzkL9vU9IkyBCA273kEnbZZCd9u5uPOA23IS37W8biCs
	 pDShvd9/6tZwWRUwrrLk2oHhZH1qc3W30v6YhrFqVuKlcBNw6VQ/wX0/WCwIsg9WEG
	 SqBbWT08sBMsEssCpdaQ2c/Vg4bzG/0TYE0iupt+dgXO6O0z2KRlK8E5YpFpY5il1Y
	 tU20ntfi3p5Ka1YapGgzECwqMYdvJj3K5dCnSrfc3i42zP2cZ3g4V3H3b1x7wUJU+W
	 HzPwouYR8e1DofRgyWtsf0n/NMFfq3a8U6Jq/EAkWeWQOUW+37UJhIcY1VvTiXT1d8
	 3w8rhuNLxk2OQ==
Date: Fri, 28 Mar 2025 09:02:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	manivannan.sadhasivam@linaro.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH V4 1/2] dt-bindings: mailbox: Document qcom,ipq5424-tmel
Message-ID: <20250328-lively-axiomatic-starfish-f9c0df@krzk-bin>
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
 <20250327181750.3733881-2-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327181750.3733881-2-quic_srichara@quicinc.com>

On Thu, Mar 27, 2025 at 11:47:49PM +0530, Sricharan R wrote:
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,ipq5424-tmel

blank line

> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mboxes:
> +    maxItems: 1

Why mbox is having an mbox? This does not look right and suggest the
block is misrepresented. I read the diagram and description two times
and still do not see how this fits there.

> +
> +  "#mbox-cells":
> +    const: 1

Best regards,
Krzysztof


