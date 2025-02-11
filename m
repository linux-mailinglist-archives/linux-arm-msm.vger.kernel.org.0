Return-Path: <linux-arm-msm+bounces-47525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9987CA305B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 573693A2660
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 08:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCA61EEA23;
	Tue, 11 Feb 2025 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIfleBG9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16C61B87E9;
	Tue, 11 Feb 2025 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739262394; cv=none; b=Ng+Wm/Of3wusV/cBCv7XXVqaaU6B59HwCBD1B/8sNvmnA57TB+wuIezLQrI1O/lCUuSBS3rWoFvQLCSS/NFfoSjQqBQ7vcWr9QupHsIwayiPrck3OTbOjMYjNeeq3SzHiwFJAppRRqwm6Iko6blmqWfCtvK21+9mvFRQ1J4TDt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739262394; c=relaxed/simple;
	bh=3Abs1QmsO/pd0iCM9Cd2JgNgDe+KNzwww7ynjWtN2FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgOWGfH/Mo3b29eZZLehS1/AvpR44p3s2oMH9tI1+VnsHqkcK5Q2cXLx6WTdfzCv+Cd5dbRkxqIS7/w95tDEsGWosDvioDf65W45UnQw/qxt1zdgmsMU/tOydydEaPorst1w4efaF3KLk0wJMFkxmX1sWYj0pkCuWL/ZjV7LmEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIfleBG9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3D2C4CEDD;
	Tue, 11 Feb 2025 08:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739262394;
	bh=3Abs1QmsO/pd0iCM9Cd2JgNgDe+KNzwww7ynjWtN2FI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIfleBG9+zbpLnbO7j8YAljK+CkOnafi4bReT5RgR77zca/p7O5oYGi8lwf0V9yxt
	 O5rWuThJXYre1urEt18oc0rNjpqHxfetLmR28rnRK0sop0nOSNnd0HqUZc6yB89DxJ
	 dSkihUW7Bl1knd9Dc/QyAKWAdLPbY406mI4L9DI9HCsc1Q4WYXbhC2m+YuwUfhRIZR
	 majuGD4WEJfVSRlUh9UFLS3lBCC9yO3tbOQUVh0ZoZNHExn3MoNYuTfJZ9jXfKg2xt
	 a1+Tu8T1vNcn8MBVqNemXP8ldIBgRFwdvwrwUyFOXeMVyz1Q+HeDOHOzsX9FECksTq
	 mUv4xC29OiFOQ==
Date: Tue, 11 Feb 2025 09:26:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/16] dt-bindings: display/msm: hdmi: drop hpd-gpios
Message-ID: <20250211-fuzzy-piculet-from-eldorado-6dce4e@krzk-bin>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
 <20250209-fd-hdmi-hpd-v4-2-6224568ed87f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250209-fd-hdmi-hpd-v4-2-6224568ed87f@linaro.org>

On Sun, Feb 09, 2025 at 07:04:46AM +0200, Dmitry Baryshkov wrote:
> Supporting simultaneous check of native HPD and the external GPIO proved
> to be less stable than just native HPD. Drop the hpd-gpios from the
> bindings. This is not a breaking change, since the HDMI block has been
> using both GPIO _and_ internal HPD anyway. In case the native HPD
> doesn't work users are urged to switch to specifying the hpd-gpios
> property to the hdmi-connector device.

In that case users would need to update their DTS/DTB, so that's an ABI
break.

Please deprecate the property here (deprecated: true) and keep support
in the driver.

Best regards,
Krzysztof


