Return-Path: <linux-arm-msm+bounces-43484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F39DC9FD22F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 09:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964EB1883065
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 08:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8981547DC;
	Fri, 27 Dec 2024 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uu4P6l5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B6414B06E;
	Fri, 27 Dec 2024 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735289075; cv=none; b=NXhOFqxOZyWm9eNSMYrWPHVdNsIubPsdI4hlhUtgHOQG99Z/AxcS1RCqK7oiDn5xe2Dk1D7ARTxUG2F2GQTZHnas7Dr6iuB2kVvjHGHXi+F+v7QXcj/M130FnIcE21qpo2nK3MRluOdueUP+6bkw7EXZNno+5IB0qDgB1jwTYIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735289075; c=relaxed/simple;
	bh=gRUDW2sk7KBxahivpahylihNgF4ImEqq8Vk4RGxoVFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8fB7UQS5SKtz2ZDeC08AYHgxj5W01RYEK9ip0T+zZwwBnTRuVbUpStOb7cCb5KvY/H5AtARI4pqEcg8V7b4n5aWtnM8fYs3Qm6ypId+2B64Hv0P5ZzpB+cahP+BhTUNtqWCqEGm2wS18E4mjgL+suNw2xT60PSLJ5v6I+Vwg9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uu4P6l5L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5DFCC4CED0;
	Fri, 27 Dec 2024 08:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735289075;
	bh=gRUDW2sk7KBxahivpahylihNgF4ImEqq8Vk4RGxoVFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uu4P6l5L2wyQ0a7yAnC6UM8cqiYCjJGOsagYqNsTh0hpRRaqGbmCwhucs8i3cuHM8
	 mSnEWgsT7tjiyOqT4edHoK9oPpOHzcToRrv29nWqKVGOc55S+/8RHaB3iZpbWt8AAl
	 UkrRA2jhF7uHgiPijy07V/ixXpwU+QVcHA6p59i/Wsppf0RIIXAyes1c6yob2eNjNn
	 KbIrCyYbYrKpsNUihv3eazFxSLa3sELIDmWgS67uP3EZABmWh5+4nSw6Ac6Z3omJuI
	 +OM94PwYEa37x2S20h1bDoRrEF7buvkXJ2VK5JmkeLOH+VYtwPRA1iH96QF6TK2eAf
	 wVZnTaXiaU6TA==
Date: Fri, 27 Dec 2024 09:44:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: phy: Add eDP PHY compatible for
 QCS8300
Message-ID: <tes4plrvkq7jpjz3zxi4hvvse7eeprk6fi3mnl6ogtkdq7ysgn@x444nwexoqpj>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
 <20241226-mdssdt_qcs8300-v2-4-acba0db533ce@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241226-mdssdt_qcs8300-v2-4-acba0db533ce@quicinc.com>

On Thu, Dec 26, 2024 at 05:40:48PM +0800, Yongxing Mou wrote:
> Add compatible string for the supported eDP PHY on QCS8300 platform.
> QCS8300 have the same eDP PHY with SA8775P.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml         | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


