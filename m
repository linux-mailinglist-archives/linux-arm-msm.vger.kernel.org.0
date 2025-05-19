Return-Path: <linux-arm-msm+bounces-58393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB19AABB9EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC3323AB67D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 09:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB3D27815B;
	Mon, 19 May 2025 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3I4xO3e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE212741D6;
	Mon, 19 May 2025 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647322; cv=none; b=MGfsXYV0jVAISMN64W97PY9v/lA9wkvrthPKydLPyrnDFZMFkSaD2/2rtjc9zVcA922UTlSOUk3LiHAV++yCfJtW10U5Py2OZfQhrCbHyM6z31wBTA5dstRSdKQfKmpflXUMj7fAJnEd9Z4cy84cY0uS3uKCBMBlF8GnxBrxL44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647322; c=relaxed/simple;
	bh=iNnqgRM4tS2Ydxe6LCZtHcCZ3+syCBaxdApKAY/snWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOfdOl0glKOXZ3qlc0gJJFnfHc72+BT/HvMaeQXtb0VoZk07/aNRDOpxlcp3DxRH4hD/13qEr0kZDzOc8ZHc474KnYh+Yt1NEx8Ej11kI0t6pIi8cg2Y6s0V8b7vF8UKco0Ogl8rDtwIpJFTmOVi4y8jttLKPk9vS+0mPiNoxQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3I4xO3e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F5CC4CEED;
	Mon, 19 May 2025 09:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747647322;
	bh=iNnqgRM4tS2Ydxe6LCZtHcCZ3+syCBaxdApKAY/snWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3I4xO3eoexMsKxGptv/FaMiPRIfiBSVNxD6n6tT+ksz2lxaYdqNprUoD+qe/pbSy
	 5fuj6fqZJcL+l/DLJTV6STbw9J1h9KC12lCE0IubhUWN7890zoycxyyEU850iQ3rFI
	 Dqr3M0paPSQKOPMKVvPwR8v2vs6THP38RVxRYuNCGxDHVjrdQhsCBickqI03zC9z/D
	 zr7exP210FrqcWWWOP7qfDGovGd7nC9P8e/tUoQ9aRNZKdpTyuhgyidBo1mYmNCjoq
	 OOVHhMnqwMftZS0/5bUXOOUGik7+pciVjiuKWyw7nLMRUOkZumHoSerT+STSrfwqoH
	 5QxYvwnmuvsYw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uGwtv-000000001Ok-35sw;
	Mon, 19 May 2025 11:35:15 +0200
Date: Mon, 19 May 2025 11:35:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] SC8280XP SLPI
Message-ID: <aCr7UzmK7XCjpsOx@hovoldconsulting.com>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>

On Sat, May 17, 2025 at 07:27:49PM +0200, Konrad Dybcio wrote:
> SC8280XP features a SLPI, much like its distant relative, SM8350.

Please get into the habit of spelling out *and* explaining internal
Qualcomm acronyms like "SLPI" so that your cover letter and commit
messages makes sense to people outside of Qualcomm.

Also say something about whether and how this is useful for anyone
currently or if it, for example, depends on Qualcomm proprietary user
space bits.

> Dmitry Baryshkov (1):
>       arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: enable sensors DSP

At first I was worried that missing firmware could cause issues here
(e.g. drivers not reaching sync state as with venus), but Lenovo has
indeed released the SLPI firmware already.

Are there any other potential downsides to enabling this (e.g. before
anyone can actually use the sensors)?

> Konrad Dybcio (4):
>       dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
>       arm64: dts: qcom: sc8280xp: Fix node order
>       arm64: dts: qcom: sc8280xp: Add SLPI

>       arm64: dts: qcom: sc8280xp-crd: Enable SLPI

Without firmware this results in errors like:

	remoteproc remoteproc0: slpi is available
	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
	remoteproc remoteproc0: powering up slpi
	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
	remoteproc remoteproc0: request_firmware failed: -2

but enabling for the CRD reference design and requiring users (read:
developers) to copy it from Windows should be OK.

Johan

