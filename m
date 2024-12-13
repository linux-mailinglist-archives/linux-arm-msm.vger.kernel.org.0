Return-Path: <linux-arm-msm+bounces-42076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 378099F111A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A27201882EB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D141E25F9;
	Fri, 13 Dec 2024 15:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzsSEdO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E451E4A21;
	Fri, 13 Dec 2024 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734104222; cv=none; b=PqQzSpaexbMHmlvEZe7sRUPclc8EmES5MuUd/nDUkRcAGRWj7M6WNlBUpC84zxady6o0h73eNLCjetxJhGc7RsK6gLF7WVF8cBRTlENMGbG/1ZJ3so76aStRqj8iV7yXHAVnntXxfhnC9/788srVQdiH9fIZOcBWy6w6dpPO+Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734104222; c=relaxed/simple;
	bh=zuOWWh5qv6t1f/uJZ+YIZcO/cV+0rcYrZVUeoVCfhyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fr+CyVIv7V+2h5yPU67N2Q4aNkEvFtITHE2gaNMuH97NZPBXT4oUA5f6sLEkq/CurqBsB1OxDK1VvgSPqezBEl8LUVvZlzeDXckFbkD6uO6lF1akNS3vRiS5ruMMwbxtAnLngBD7zRI0vqpbSJE+2alooOKQ7k00Nhx+VAVCQCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzsSEdO4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E681C4CED0;
	Fri, 13 Dec 2024 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734104221;
	bh=zuOWWh5qv6t1f/uJZ+YIZcO/cV+0rcYrZVUeoVCfhyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzsSEdO4wr8gJbrNk+lW4Vt/2p5627nR8l2AymZguG/zRIumYDs/Z6u2+7GFWK0JN
	 gVPMM0Nzb88wNYk3LsGOabn8M1rc7357f2LDuYGYMlhO09Kp4OM23F/VJqFnEE68kL
	 +j881an1toYoKsB6Nbr1QuGPgUvec1FazwOTp4ynO0QLEFCNg24o/FhyD4/isvEKJA
	 vgH6hGbf0B+8Y7TzrrpuAz3Ali30iZm6cEJv3HIGeC/kC2xirLXjky4NDUATglGTRT
	 bTMXIjfX9THhKSUH6c6biUUC2nGoVCByrDfSkdzHNpT5A0yowLC7wSgrYhGcdko51G
	 DaCdl7WRR3LBA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tM7j0-000000000mm-1NxM;
	Fri, 13 Dec 2024 16:37:06 +0100
Date: Fri, 13 Dec 2024 16:37:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 14/23] arm64: dts: qcom: x1e80100: Fix CDSP memory
 length
Message-ID: <Z1xUosh7GwOZUAWJ@hovoldconsulting.com>
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
 <20241213-dts-qcom-cdsp-mpss-base-address-v3-14-2e0036fccd8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-14-2e0036fccd8d@linaro.org>

On Fri, Dec 13, 2024 at 03:54:03PM +0100, Krzysztof Kozlowski wrote:
> The address space in CDSP PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB) which has a length of 0x10000.  Value of 0x1400000 was
> copied from older DTS, but it does not look accurate at all.
> 
> This should have no functional impact on Linux users, because PAS loader
> does not use this address space at all.
> 
> Fixes: 5f2a9cd4b104 ("arm64: dts: qcom: x1e80100: Add ADSP/CDSP remoteproc nodes")
> Cc: stable@vger.kernel.org

I don't think any of these need to be backported.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Looks good otherwise:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

