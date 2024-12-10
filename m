Return-Path: <linux-arm-msm+bounces-41235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3919EAA97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A42FC166385
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 08:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21608230981;
	Tue, 10 Dec 2024 08:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUshkcDB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E164B22CBD0;
	Tue, 10 Dec 2024 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733819198; cv=none; b=eBR7bBoFQNQQycyYIZ0KoRMHteka7Polz2H96bnHCgYz4/kRKP/A+2VHQY7nPeFrtOKEwMDwmrxNV0CTvff8xGQDv57pRuw125XlruuzVTbMsV8CJeBuW1X7J7IZGzbQwHA8Y9OHDXckAZ+fZPHlmlA5FyKlKV9CoqwAfk2hFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733819198; c=relaxed/simple;
	bh=QogS27rITlHvuPRn0paQdojlD32rlA0qPWIpzySQE8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPreNHT7DvQshzA7dyQ1XNUFMZxFLiD9YBMTdRSjCJmFkJAdhO1cA8d4Qgf6WqwflrYyaRJgoNKljPqP8cTYnYRxmfdrv35uynY2R9OmAf7wU+Sg6jobT1zqpgQZiPgKfWjDGk1laFf08eUoDwlBWkhF0jwD5ZsD95onfjREsWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUshkcDB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5E3C4CED6;
	Tue, 10 Dec 2024 08:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733819197;
	bh=QogS27rITlHvuPRn0paQdojlD32rlA0qPWIpzySQE8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUshkcDBrmAsunj5jMQsUz/2UJyjlv8QozWkB4u312/do5975QEa0RCwPqxUeW1Qj
	 G37KZQiqorSI9JLXgOCAl73BuctxUfrgEATj6juJf7Ghu6Vdg2uody9ZpnNxcRwlK6
	 cp7BLbthJfe2b/WO9de1Klpa4b9nxukEUAKjZRwwnYheUHAakXxD6m39iMLeodCs/q
	 7e31rKNLGpXwQu/oOcPkHvzWonhGSzC9vJ4UNSAqWDhzcWJVn4xNpjn7O2+IV/F5M9
	 sM5VKi601hufh7DdtrY7jdLg2BjIwIhnuAsFpLKFIqxI4SqJkY2zypsP1H1Jsr3bru
	 cHYgKwgy6ehiQ==
Date: Tue, 10 Dec 2024 09:26:34 +0100
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
	Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/9] dt-bindings: display/msm: Add SM6150 MDSS & DPU
Message-ID: <apd7junofv3yoawqg3oocj465o6nybvotohdtxtchfkkvihhec@noqs7usdeycy>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-3-2d875a67602d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210-add-display-support-for-qcs615-platform-v4-3-2d875a67602d@quicinc.com>

On Tue, Dec 10, 2024 at 02:53:54PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Document the MDSS and DPU hardware found on the Qualcomm SM6150 platform.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,sm6150-dpu.yaml      | 108 +++++++++
>  .../bindings/display/msm/qcom,sm6150-mdss.yaml     | 245 +++++++++++++++++++++
>  2 files changed, 353 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


