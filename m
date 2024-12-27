Return-Path: <linux-arm-msm+bounces-43483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0789FD21E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 09:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 264B81882F35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2024 08:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFC1154456;
	Fri, 27 Dec 2024 08:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X1SelRVB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CF214B06E;
	Fri, 27 Dec 2024 08:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735288889; cv=none; b=akB19NTwcNSXqo5Lj/1+J9Y6n65vdCRf+2PNWYKBmBRTVNJh6A+tqg+Y3Nlhiwg6IrxBeki5wlt9KHTendO+V1XavO0sgJbl59QyhDidcC+BqbTeovEKLZBbT8nVbdcpFz1bzYlo6Cyt91SEqK6qJvgm2kG7IpggWPm1Egpe6qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735288889; c=relaxed/simple;
	bh=+DfnXbfYpsZSpFyfyfS60TU6RcqCaLnx601olT7c+SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4Xs+zNnn296ZsvBU75v9dCJVpNH3Z1XmZg/UWuwYuQHWPmzVoiEj3Iv6RoXGkZcQf5twJOMlZ6u251HhlBQQtJgGhlBqKzM7PI4uRf0ZSHd+BKGX3S7PJAb0GxvtKgKMNw1NgadFeyojHTHIH6EE/O0HtFzN647o32xTVDfIbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X1SelRVB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30081C4CED0;
	Fri, 27 Dec 2024 08:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735288888;
	bh=+DfnXbfYpsZSpFyfyfS60TU6RcqCaLnx601olT7c+SU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X1SelRVBIZlFgmLZ/O85kx4mfu2FZD6xyxjM3AmoASJ3PI826XpRXwkmOtdt+TptL
	 Tf1h4MPLkUD12iOB27g1J+LTYkhkwr5U2+Y7GzZc/q1DZT864dXWI0vosOe6/Qlrqy
	 o+qwQflZn0RY8D6mOX/BzKEhTM+HnqTmFGItNjaxAAVoqf2hiZKye+GWZ8UhkjrRk2
	 4ASW++ig6Mwza9g99RWixYPbYjvzInHdz9JSJPKjeq3mo6b0WvaRE63BFYJ8En/LVq
	 N1/FjFSY1lk9U1Do9ksdkZZTFKtPuOc3P4+8eNV5HP0cW/XSfMkhNU5lEOK7teIyTJ
	 B/Dt7JFOkjqzQ==
Date: Fri, 27 Dec 2024 09:41:24 +0100
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
Subject: Re: [PATCH v2 1/5] dt-bindings: display/msm: Document the DPU for
 QCS8300
Message-ID: <66x4orucj6kenpwetugmng3kmuzjoagjkmctrn727j5hayjhhe@dvzdd6a2ehzn>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
 <20241226-mdssdt_qcs8300-v2-1-acba0db533ce@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241226-mdssdt_qcs8300-v2-1-acba0db533ce@quicinc.com>

On Thu, Dec 26, 2024 at 05:40:45PM +0800, Yongxing Mou wrote:
> Document the DPU for Qualcomm QCS8300 platform.It use the same DPU

Missing space after full stop.

> hardware with SA8775P and reuse it's driver.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


