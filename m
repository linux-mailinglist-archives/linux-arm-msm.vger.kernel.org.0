Return-Path: <linux-arm-msm+bounces-52860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDC2A760FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 10:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1309C165F85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 08:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5421D5AC0;
	Mon, 31 Mar 2025 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9O55H8q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3D71D54E3;
	Mon, 31 Mar 2025 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408596; cv=none; b=ssLfsl/7zXBPDiwPY/dd/KYB7OMarRBrC+m0M/AgBmzbIZY0blA36002pB94vWWcr7KRfb+Zm/RsUyxTmcdrSapCndhXHIEFVGNDqbLKz+RLrX0BT9pBZdIumnwqDjHP4E05h/VPtkR1OGotajhMQBzbCRTNnSh+TALSH8VZBqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408596; c=relaxed/simple;
	bh=mu+aQcdoiMkJEzeHtnj8AVb8j2euhi8aE86TmRXHTVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ReUmFydqNwObNf9CITgGDRJC34db2MA1JQwdMC4HgxkyhN2RxwsYLCgtUKSgh1LQ+OPqfcoazVootauN8WJ4DLI+WsLFVUDzKvgY3xWJNjpnsKrLW/tgmiiuilbP7idFicObrA6bcKCbSPw+m0BkSg6V+lZO/lvPqxPFKbeQzNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9O55H8q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89952C4CEE3;
	Mon, 31 Mar 2025 08:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743408596;
	bh=mu+aQcdoiMkJEzeHtnj8AVb8j2euhi8aE86TmRXHTVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D9O55H8qAk8Qea+JpeWcuM0/f0lbfuxN9To5TH+j2nDiA0ozzI61mgx+/ZR93m6tW
	 3L0PX4fLOSWCEyjN50c9FdFQe17CHtsOry68qyBWMakFgsq6ZuqlZwwKfijvfWS3Ci
	 bN1hxK+m7gtQqUY2Uy8XWrFrxgijZ5M9kdMOkoQb34JzqixonvWLXmnoF2vdADnlMy
	 bCbLnwVdEWq81svkGhMUFCCyxNiQkFi8EXzdhdHX4aQIJehXz/CZlwAXfq1JBa0Jr2
	 2EBnHGuMdajSPIBPFQM2SbYBvCHpPwRdzsV/wzNflXUwMM9GLB5vtrCnmakiu2C//D
	 3LVr5phzC8vSg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tzADX-000000000kb-010O;
	Mon, 31 Mar 2025 10:09:59 +0200
Date: Mon, 31 Mar 2025 10:09:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com,
	dmitry.baryshkov@oss.qualcomm.com,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add
 WiFi/BT pwrseq
Message-ID: <Z-pN1qloL2m4BWaq@hovoldconsulting.com>
References: <20250331073423.3184322-1-alex.vinarskis@gmail.com>
 <20250331073423.3184322-2-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331073423.3184322-2-alex.vinarskis@gmail.com>

[ +CC: Stephan ]

On Mon, Mar 31, 2025 at 08:33:47AM +0100, Aleksandrs Vinarskis wrote:
> Add the WiFi/BT nodes for XPS and describe the regulators for the WCN7850
> combo chip using the new power sequencing bindings. All voltages are
> derived from chained fixed regulators controlled using a single GPIO.
> 
> Based on the commit d09ab685a8f5 ("arm64: dts: qcom: x1e80100-qcp: Add
> WiFi/BT pwrseq").

Are you sure this is correct and that you don't need to worry about the
"how do we model the supplies to an M.2 card" issue?

See

	https://lore.kernel.org/lkml/Z-KuG0aOwEnxuhp9@linaro.org/

> With that fixed commit f5b788d0e8cd ("arm64: dts: qcom: Add support for
> X1-based Dell XPS 13 9345")

Not sure what happened here.
 
Johan

