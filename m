Return-Path: <linux-arm-msm+bounces-24201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7DF917750
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA91CB21794
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 04:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0973313E02B;
	Wed, 26 Jun 2024 04:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzRjbeXp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D091E13D89B;
	Wed, 26 Jun 2024 04:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719376265; cv=none; b=htaDi+VG251oLrqXCv9l85/NgGpSN3/fKJErvjV67VKh8Ag60tZG4LEfsxqHQh4ybbY33oa1Y9iQlivySZZPHmf9Xbr0SnvO3R59tFRuupkBoWVJvY/GHITA2ttVvcH78eSw7PDyB+S9+221g7LdhLEgevV4qGBeGiHhs2hQtFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719376265; c=relaxed/simple;
	bh=3oxvwOfQEcr7dOLF8heuosBT/iaI85kegIrQAvDn2oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N1dX71ecjE5hU0UXFNumH64I3cQ30tHWIdaeLuFtLotR03SHAeFrcWuqip9R3oyeUdXsyiMnZOFlTMGL2Hk+VRagnVeJZ66c5OEAUlKxWzqYRPRTAOC2imgfoIEoELTdFTEzA4qqIpXnIdNUz3bhpGkmA/mbjwM+MSak5q5ZXaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzRjbeXp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E045C32782;
	Wed, 26 Jun 2024 04:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719376265;
	bh=3oxvwOfQEcr7dOLF8heuosBT/iaI85kegIrQAvDn2oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hzRjbeXp7e2OTFck2xmfMq8Eri6i9PP7vBl+4StqeCC+O458Sv0t3ABnegBzZ+xei
	 uNnK13VQkn2it19K/uHKnAVbBsnmlYj6CPwI4G20RtzuLaHnDUUSOp3yHSK4oEc1ro
	 jE6wQCgGNlvDFYq7gq28K6wCs6jrNH0MK+NGWGJYE9jFAxAWgY8wubYw8oSxj8AeA1
	 zCdqvgWaUeA1b9ExEEZiZ2Wt1iGOyniya+wJns1/Zg3rRX1BsOf76UIOMpTOI0R9fc
	 v5nYAn+HJzEyktQ1ZG/Xmo7v7k9ySRCto/NaA7QdmOnyOr4boDGPSIm3cwgoQKq7Kd
	 pcr/Da0diNgyQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: pm8916: add temp-alarm thermal zone
Date: Tue, 25 Jun 2024 23:30:54 -0500
Message-ID: <171937625564.44413.13674234707638099301.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625-pm8916-tz-v1-1-a4c1f61e92dd@linaro.org>
References: <20240625-pm8916-tz-v1-1-a4c1f61e92dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Jun 2024 23:16:18 +0300, Dmitry Baryshkov wrote:
> Define the themal zones using the temperature values in stage1 for this
> platform so that the spmi-temp-alarm driver becomes active.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: pm8916: add temp-alarm thermal zone
      commit: b7a28d8a7b80dd5630a72d8d8cb9f2d1bde6a1ad

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

