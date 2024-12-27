Return-Path: <linux-arm-msm+bounces-43482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 632829FD21A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 09:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9CF67A167B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 08:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1F1154426;
	Fri, 27 Dec 2024 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MeNMVYMu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7D214B06E;
	Fri, 27 Dec 2024 08:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735288844; cv=none; b=ncbQQfEkYWYsoUrDY6KVttWZNAzi6Vf9L6lLm0PEf6kJT9LUogMlCQWC6W/68nu/VYCsC+2TTJLV24FUkUiOPK/6gdGpcDOogLncnUIrl1hE7AeOnI6CTU8pzzCpeURzVeTB4NlNOaaBVIZ8jYrT71SkApxd2QbxBaOO9zszqJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735288844; c=relaxed/simple;
	bh=8KxZUHuncZ6XQYTJwhIWFyejQOjqm6sNcOVNcBIA1K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4RXKFFxkvSiWeYg9P/hiBe3NeQ0K4TwM5TkXn22nc5etPoUa2hd6ybs9w1trHj0LxFHo+GJBjuxSOvG25oMZtaH07Ls/LTeN5IaBXIYKYBrj/ewrHznH4x8Hj0O7uEDBqE0eAMq4tdb3HzW3GnfBslLtrowYan8XfOlwLM8lfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MeNMVYMu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CD7C4CED0;
	Fri, 27 Dec 2024 08:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735288844;
	bh=8KxZUHuncZ6XQYTJwhIWFyejQOjqm6sNcOVNcBIA1K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MeNMVYMufbRE8vJVlDEXT4y2WltbRR1zgXDT7xfcmbdGkwq5j6hY+mYbNV2wO9IDJ
	 yj5wbaNv/9IS3vArJXiM5Fdae3ZtkB/rV/uBnWDZorKQuEpeeTQtrSJ0+LqI44x/Pm
	 zoR8JnhWW5nd+TUPvrhCKoRfWhrrtwqAsvb1kUiuDzG9fXp+gE7xv4OFumgu9QDGdK
	 2WFERU6cmVxH2Veb7I9LuPrdEQe3D020xAh5wd6dINILKahY+cBB6RAE3U5K8M9M5E
	 G3RV5jVsNHeqY8lbYY2UqIxXZ7EahCPPwYQh98P8wvZ/Ct8HFDB4DJsKaZXsulTKlp
	 O6KhkzCJdKrEg==
Date: Fri, 27 Dec 2024 09:40:40 +0100
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
Subject: Re: [PATCH v2 2/5] dt-bindings: display: msm: dp-controller:
 document QCS8300 compatible
Message-ID: <vhiixdd5mjvrfoe5pbvikatgba2molof7gqvfp5pl7lmrg3tc5@z65rg54hgl3x>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
 <20241226-mdssdt_qcs8300-v2-2-acba0db533ce@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241226-mdssdt_qcs8300-v2-2-acba0db533ce@quicinc.com>

On Thu, Dec 26, 2024 at 05:40:46PM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 platform.QCS8300 only support one DisplayPort
> controller and have the same base offset with sm8650, so we reuse
> the sm8650 DisplayPort driver.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


