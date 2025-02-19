Return-Path: <linux-arm-msm+bounces-48577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C0AA3CD4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 00:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F709188F1E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 23:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86E723E259;
	Wed, 19 Feb 2025 23:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEBMraJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD161CAA65;
	Wed, 19 Feb 2025 23:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740007161; cv=none; b=GagW/PgfTllv8ctay6t5Upw/D76aiOmQ1WejqBHdOB5/RxAY4qakjOoRVGJdZN8kK1Q6f81LpzjEklU+rEanJSac1JNZGEWzyY53i5ugHCfje/JNkDBkfdNbi9MkD6JDda/P9POD/1WMddA0mZLE5UVVygKUWDMYb0yXhRzdpoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740007161; c=relaxed/simple;
	bh=Um6KDVtjj/1Q+GA8/c1ulY+pNu3rjuUxz6Ww640jVDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNhfagMhjJsqy8VTZznYHXnlIYhXk5cF8V0O0dLGTC3tQn4A7HJR/7V0eVrK9WxABwRNxXm4wjCXXgWKoEMPRLMbpr9Tg86yUvH9lKHrscQPy90tScRxWTetQX3OnSeT2Bdu8v/gN0TWdLsO2PxWDC9SaWvf2sCVMS2ajl2W9QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEBMraJG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D54C4CED1;
	Wed, 19 Feb 2025 23:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740007161;
	bh=Um6KDVtjj/1Q+GA8/c1ulY+pNu3rjuUxz6Ww640jVDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEBMraJGAmvESM6pAv6dzebKxMKStV5tXLXYF9LU2CjsBcpShjQVOKYOemmh1NT9G
	 u4Io0QJCw7Kau2a8GILje5TbO2bDbPIr2GXcoR5ocLiVEVonrBl7pDf1FlkFM07sOF
	 XyO/WrcwpgjTqq3xzGH7G9OWOgELJCmMjST5L7Wruqxc0eCnFukoXx6Av/iMheARuC
	 EBzTcBilNx0a61tQqMTapWHdoccjWQUm3odP2eiK2T2LIE5yeI6DoJFmIUrk0EkBMB
	 q9jMH91Dfp1dV25TShmkBWNbKfaXEDeFmEg52JjSOOABQfOlmGcAl3sZMTz0pOuUU4
	 P6fLJ9m/poJqQ==
Date: Wed, 19 Feb 2025 17:19:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org,
	David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-kernel@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 01/16] dt-bindings: display/msm: dsi-controller-main:
 Combine if:then: entries
Message-ID: <174000715960.3160076.7982262940377785281.robh@kernel.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-1-d201dcdda6a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-1-d201dcdda6a4@linaro.org>


On Mon, 17 Feb 2025 17:41:22 +0100, Krzysztof Kozlowski wrote:
> Several devices have the same clock inputs, thus they can be in the same
> if:then: clause, making everything smaller.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  | 64 ++--------------------
>  1 file changed, 5 insertions(+), 59 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


