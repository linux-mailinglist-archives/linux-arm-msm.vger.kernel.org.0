Return-Path: <linux-arm-msm+bounces-38923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9CF9D6A18
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 17:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5275B160EC7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 16:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED2B13B2A9;
	Sat, 23 Nov 2024 16:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bujCqpfC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D647013A3EC;
	Sat, 23 Nov 2024 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732379235; cv=none; b=a2cnBXZcOjujoAo+0ZY6qyHkwcqNcSIg9sNyJ1F+uls+UohrlKYyagV/yqxo6e/LcZkIChmYFashpSbw8V7U7ZN0ugRWTWanWtSDKWrOqZ19dXyOZ0lJ+mHm0UUlzzvkfcE70VX9V9WTxyi5PwWOzpPIQ8s/BWKfI2DCZ94zZIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732379235; c=relaxed/simple;
	bh=rYPtwX96kL+DQx3Yw2qIdybweyPG3Z4vJWWX07F34NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IT2TXWaseEXSlhVggJrAKxBXbj4Fep4RfeKacnB/k0psnD2O17FMJrWkc4RvVVwAjmcfbWwGFnWGTb1HtRiid6BUFIYgHIva/AnfYpm1LP4aCDcQt468YyrKoL4XoJddqOCw96EotY2jIwYouBDj6ZZQkdQjeVPB6zw1vBCMuXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bujCqpfC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE77C4CECD;
	Sat, 23 Nov 2024 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732379234;
	bh=rYPtwX96kL+DQx3Yw2qIdybweyPG3Z4vJWWX07F34NU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bujCqpfCQ34yd5Vh2n/hK9uYYtnd5t75UcqWdmMD5RrFTo4fZigbAs3gnHvEP4Vqi
	 4L1uEop3JK5ZZIaMRRSkOApUPRgLhJKuCcvXlsy0D/22hYnx70he9Z5UwF1gCRzJbj
	 WU7gDt2UnSvbGHUF0LPE2cmJwQLB+5rlvYMWq01w0MwarIJmMycxY54osEkcO6kgFU
	 xoAc8QI7jbbiaC/mCwse7NI173tmQkJzh/PNVyaejsL01huN+eVmQ1rz8DfzuNR7Wx
	 JIOXiIYy+9fHxXC1HF3lwgQ8PFYbxCgUwVQAs0/Tlyml+dyCrxuAT9uw1GYM2poIuT
	 GmGdGEfDVaStg==
Date: Sat, 23 Nov 2024 17:27:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/9] dt-bindings: display/msm: Add SM6150 DSI phy
Message-ID: <e77zznwyykplengox26j4swdf3lqkd347yulkzngmbcgqrzhjd@bywnfgaigrih>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-1-35252e3a51fe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-1-35252e3a51fe@quicinc.com>

On Fri, Nov 22, 2024 at 05:56:44PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Add new compatible for SM6150 with dsi_phy_14nm_36mA_regulators
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


