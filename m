Return-Path: <linux-arm-msm+bounces-74476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F57B933EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 22:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C77F81902732
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 20:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A71B261B71;
	Mon, 22 Sep 2025 20:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtVs4f5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6BA241667;
	Mon, 22 Sep 2025 20:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758573405; cv=none; b=bIm3HmGjlMLuqmeLiS+vcCB/pO9MixbnmdSaoz5OxtNU3tWYzbuPyMC93Y9Sxv+HE5vZlncudiKno8jJ9pOVJrM6CbjfIzrhtDZ4kK9ot/7wq5g+z0FbtqjUV0bzi304EhadEIr/kjgrSM+CxIc8wj4N8EUe21nt2ongHSh1+js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758573405; c=relaxed/simple;
	bh=qD8ij3qjohoklNgH4qr/507gAIHWkdmrdBrnumMDhM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iox4HxXKJ9pB+JiFMfN5qWxeuNXd7BWkKITZV+b4iv9hfmJdssOihVCQbsFJ1j/6DxP4boa2NXZjJrKcrqn5ai/r34E3cMvTOfOC4Ou7HdS6BNWC7xE3e8SlPFdKhHKdttmCgi15P/VNWb8aTvqQE9UM/0qKsdAsnIEO9p8WHyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtVs4f5L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A09C4CEF0;
	Mon, 22 Sep 2025 20:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758573404;
	bh=qD8ij3qjohoklNgH4qr/507gAIHWkdmrdBrnumMDhM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtVs4f5LpFq7UTmP+6HFdh/diG1bJHe8novCRsFKXdqtQH7/0kbQpKs5SvyQJdg+C
	 FRLCBICVqfvuLQD7T9jjY1vugGsHm2fifKhwKu5wrjsNbrSp1cIdYiiYGOTmDQjLIh
	 Y6d4ekYdiK4GRrvNgJdf6eswEB9McZQ7UTyzFXvUl235WR9669zQ660bSdudgv5HGA
	 QUHWIs9fUDibehQkSxn6uqsnhQBRVOfi8lFONpfTX+p1PdMBLx3UsDUHtzTN9J9Xpr
	 yUXz6Qmx4cfxIt4TTXzCj8JIdRJY2+URu8Xnw7clxfRewargl/4JhZPwcDHc+S1Cqw
	 G4nmCQvZyMZKQ==
Date: Mon, 22 Sep 2025 15:36:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
	Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 01/14] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: document more platforms
Message-ID: <175857340344.1286451.12823002820142551920.robh@kernel.org>
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
 <20250921-refgen-v1-1-9d93e64133ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-refgen-v1-1-9d93e64133ea@oss.qualcomm.com>


On Sun, 21 Sep 2025 10:09:17 +0300, Dmitry Baryshkov wrote:
> Document refgen block being present on SDM670, Lemans and QCS8300
> platforms. It should be used to provide reference voltage to DSI
> controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml    | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


