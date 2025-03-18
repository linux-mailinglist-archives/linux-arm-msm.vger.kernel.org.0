Return-Path: <linux-arm-msm+bounces-51685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F99A66CE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 109057A909E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 07:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D441B81C1;
	Tue, 18 Mar 2025 07:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ay0EVHEd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE0F366;
	Tue, 18 Mar 2025 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742284506; cv=none; b=cf5TSAAwqOywMZF+VMzIfS4ScDQTyHNqhw5bo0ocppSa24B1nX4dCLMgD1onZshpZxpHtKzqU5st2Odq5Xq35TdI2qJ6eoofTV9hCY25iGLtnzF+qdmF00XC2C2IJhbf5YVCdel6bJmlzFv4nui+ZNRoWXHqwwsOsQCSYQixtQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742284506; c=relaxed/simple;
	bh=D4iMGhhuzept8ULjmWzbTssS4mIzRCuc7D7FjZeefVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEl2t6RbsXyW5aY3HtrwmdhmaFxPS7rPX9zAM/uHuiPFCVkJa6kazSSXmP+x4mfoBKjXhcWcvWDb7v6YgCqTxdrHZ8wr/tWR+IzWyZ5TG9UtuO0jIlLxqYEvlTxUkZ5BurzDvfHXCkAD9kVjEAckUHcmOl+glkEgWm9lmuswovo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ay0EVHEd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EA15C4CEDD;
	Tue, 18 Mar 2025 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742284505;
	bh=D4iMGhhuzept8ULjmWzbTssS4mIzRCuc7D7FjZeefVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ay0EVHEdmwjg6EwY1oj4Rnz6tLXQXjlk5J28ENJcy0uroi2w7MMralceARzOD+9ie
	 xELU4DOwu2ExqI/2U4vXcsaQgBiSjKxOetS2X8o7V2f49Smx23WhjQb+YzgYGBjgy1
	 G7DmhvM+EbYb9NlLn2DKMozCCHkUsShuszHZ15i+RZGXVlkoZ6MuFIKRmoj8jMPxna
	 7MPHOFk4r60Y6S5GQpYLWlx4fQ7JzD7+bGbh39ICLYM7WcEpr0diy2sXCgI7Yjx57A
	 XMUnbEHzl+84wc92pB0fltjf93E/buBI+6AxyJ+YqrUWg4KMkDmrq9V1HfJMhlZDbz
	 amry7CiVquiIg==
Date: Tue, 18 Mar 2025 08:55:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>, 
	Andy Gross <agross@codeaurora.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, 
	Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/9] dt-bindings: soc: qcom,rpm: add missing
 clock-controller node
Message-ID: <20250318-hungry-nimble-marten-dfb4db@krzk-bin>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-1-655c52e2ad97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317-fix-nexus-4-v1-1-655c52e2ad97@oss.qualcomm.com>

On Mon, Mar 17, 2025 at 07:44:36PM +0200, Dmitry Baryshkov wrote:
> On Qualcomm platforms in addition to regulators the RPM also provides
> clocks via the child clock-controller node. Describe it properly in the
> schema.
> 
> Fixes: 6b42133d2189 ("dt-bindings: soc: qcom: convert non-smd RPM bindings to dt-schema")

Fixes should rather point to original binding, because the conversion
did not miss them. They were not there in the first place. Coversion
should add them, to match existing DTS, but still the mistake is in the
TXT binding.


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,rpm.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


