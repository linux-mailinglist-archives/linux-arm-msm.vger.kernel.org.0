Return-Path: <linux-arm-msm+bounces-60364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89822ACF580
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 19:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 527D517A404
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 17:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3241E47A8;
	Thu,  5 Jun 2025 17:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qHFF65+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9573C13D521;
	Thu,  5 Jun 2025 17:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145057; cv=none; b=KkURi+qpNxZdXi2Oy1rBUAm5Juq/Q+tOvhjzqW1ntX0vpU2ZNxuBhxZT414RIisN/CbqvtxMs7jR9MDTsOvHpuCu+TC4W3w7yUK1bgssY11fGdlTEzvMb+wi/Pt5JhfN5KcRg7k+3rURAtjk/TE9r019s7r9v0+1+j4kI8os0t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145057; c=relaxed/simple;
	bh=DGXtg6qoY7z3kJIDAMutHk74JtJARJ7A/W/J2ijKJvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GB2dtmukW2bAmPHh9Dr28P0NT5NJ2bU9HZNMWB0E28QAWPKrhzg0o0icLr1tTQZZficMDVG6b/3ph1e4yqndmmAkDFsafxy8dh2dIt2OC0+iDD+yRXREx7mw/pQUz6W4r18u5gtXzl9xmuUiaONmyP5uwtAKZitsH26YjBTJpTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qHFF65+4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6593C4CEE7;
	Thu,  5 Jun 2025 17:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749145057;
	bh=DGXtg6qoY7z3kJIDAMutHk74JtJARJ7A/W/J2ijKJvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qHFF65+4OlBP6DkM4rdY13F9JfYJ+eARJlvge8Gvw+gc9E9XOqRqKfWQHCVWWq6qj
	 bvaFKvE8Q/UOhe66ojhsffM5gxl+ZsuIT7DmEwL2Ra/jNKAgyUdIPB+DXKZUBuCHle
	 rSa4ERa1M2dmCBYBHkqX+ZYZftz21VaS9PvHW9KXDJjOJJDBfIacCrHGew5nEr2Ycz
	 Cz4rUDzpqnMh7N5Cse1mR3GfZ4g0lL1DJZUyOR4wsZj0uNMbe5y8HruI6oq67cRDhN
	 wRfUnKgIex1iy6v2A6kcYHW/LXRJtN/MB5Ty4mMJXxaVE+p9HXUsSq63zSt2n5N2XN
	 AmvldqKzb4t3w==
Date: Thu, 5 Jun 2025 12:37:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>, linux-usb@vger.kernel.org,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: qcom: Add Lenovo TB16 support
Message-ID: <174914505261.2908666.16705179553206798329.robh@kernel.org>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-1-2c1e6018d3f0@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-tb16-dt-v4-1-2c1e6018d3f0@oldschoolsolutions.biz>


On Sat, 24 May 2025 13:48:36 +0200, Jens Glathe wrote:
> Document the x1p-42-100/x1-26-100 variants of the Thinkbook 16 G7 QOY.
> 
> [1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


