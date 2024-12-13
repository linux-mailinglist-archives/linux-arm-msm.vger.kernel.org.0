Return-Path: <linux-arm-msm+bounces-42075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BD59F1113
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24525282C7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3B11E25EA;
	Fri, 13 Dec 2024 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FsSCUwSD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0741DFDB8;
	Fri, 13 Dec 2024 15:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734104140; cv=none; b=hBt2Gw1gQbZ0Kcyy/ZddOhLxgABzP4Y5rDAGevBtLheSw6tIlstDMl8IAnfDBNrenVgDh1AzlezoHt1CIi8yJbq783copm7WCyIIGagFz2flz5qDLRuI9arjmPhX94BRtf+sfkV65mvMsgQ+AAs8OmcgV2IqiJDS8CSBLGzFvaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734104140; c=relaxed/simple;
	bh=DWNFxRB8y4F0Z1j4laSszVoKuggu9oSGiE3Xc+mGY1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEJU+aPw+OvJgYo/9bczD/9gwgysxmQPD0b8baHIAtoIVayTflIHHk/9URAYaDl+G3Bj7kZyzjSdje0I3vXutMM8ZL8bl2gSqykeK2qcEKy3KbfU1sgE9ZMKvGqf22270/gJkNI/Nv59ncTZwiNUDco3kZg2qET+NuRXd/lK2fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FsSCUwSD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6A8C4CED0;
	Fri, 13 Dec 2024 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734104139;
	bh=DWNFxRB8y4F0Z1j4laSszVoKuggu9oSGiE3Xc+mGY1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FsSCUwSDh2xWgUtT0oQngEdpuPIhfKbqG5nzh4+KefdIjdP3sRE4oUastFGoMnjdS
	 fy6BZFxQvyZLwGIBcAFd9aSrfveDkCem2WWYMieeZpjNogRJf69djRqXsBVEmy/KmO
	 otPlF52ZB81IMKhpNX3WyebSmZ3tpld8ML/dy/5XNEVsGXQgyMyFpgaOo1hIwOmxFP
	 UxOSXyvxfXHLU8rZ/nsg+HMhQji7LLwSdAAXPdHa/kOy5fNUuFtToMK9Vnaob1mI7N
	 Jh1IbaXPI7T4H7A2GPEmRjdQImya9LJS93OZJIbsgdUq/bvPS22pUWk1om3ldgNlLj
	 s8WAqcjvb6EyQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tM7hg-000000000k8-0ZvD;
	Fri, 13 Dec 2024 16:35:44 +0100
Date: Fri, 13 Dec 2024 16:35:44 +0100
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
Subject: Re: [PATCH v3 13/23] arm64: dts: qcom: x1e80100: Fix ADSP memory
 base and length
Message-ID: <Z1xUUAnxsCY33umS@hovoldconsulting.com>
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
 <20241213-dts-qcom-cdsp-mpss-base-address-v3-13-2e0036fccd8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-13-2e0036fccd8d@linaro.org>

On Fri, Dec 13, 2024 at 03:54:02PM +0100, Krzysztof Kozlowski wrote:
> The address space in ADSP PAS (Peripheral Authentication Service)
> remoteproc node should point to the QDSP PUB address space
> (QDSP6...SS_PUB): 0x0680_0000 with length of 0x10000.
> 
> 0x3000_0000, value used so far, is the main region of CDSP and was
> simply copied from other/older DTS.
> 
> Correct the base address and length, which also moves the node to
> different place to keep things sorted by unit address.  The diff looks
> big, but only the unit address and "reg" property were changed.  This
> should have no functional impact on Linux users, because PAS loader does
> not use this address space at all.
> 
> Fixes: 5f2a9cd4b104 ("arm64: dts: qcom: x1e80100: Add ADSP/CDSP remoteproc nodes")
> Cc: stable@vger.kernel.org

Why bother with backporting any of these when there is no functional
impact?

This does not seem to meet the stable kernel backport criteria and will
just result in a lot of noise. (I'm sure autosel will try to pull them
in, but that's a different discussion.)

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v2:
> 1. Commit msg corrections, second paragraph (Johan)

Looks good to me otherwise:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

