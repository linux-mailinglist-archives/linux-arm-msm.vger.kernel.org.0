Return-Path: <linux-arm-msm+bounces-69294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 566B8B27228
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 00:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C6B4A22FD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 22:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690A5284B29;
	Thu, 14 Aug 2025 22:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bl3fP5X5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0542820DA;
	Thu, 14 Aug 2025 22:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755211358; cv=none; b=MwR4zPSxbxzk4cIwSV/XQNdiVSru+q1S0X0RG81r1jLYnvFK9b/pLfv2ag01jqvR04LQhjmzN3W2iOTFLXSrHXIX7PWPLpEpQdk41z3TB0iNe3Bg+BiFVNlXnWHA1ID++QgvmwS/dQS/En3HoSj3ewYO2L6/8LY76rZVxXvygsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755211358; c=relaxed/simple;
	bh=F4W5ax2tQL/1jCkWGQXYRuokg8iY6q+qXi/DeCaJnH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0xkqWWtDlMvuo+Zkg26KztQvuk4TjlK6sw+QEDi+yj2qJR8fH8H3YXo49q9gmKsf1WAXjGzRhmyNKYq1DJJOEbDY1FBbuJxTrYlz7XzSbyFl/XHE3G1BlvF/k0ATZWYKv+qUjSgFakXS+0rN9Mmlu0SmNhNKIJDH/cL8j6joDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bl3fP5X5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92942C4CEED;
	Thu, 14 Aug 2025 22:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755211355;
	bh=F4W5ax2tQL/1jCkWGQXYRuokg8iY6q+qXi/DeCaJnH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bl3fP5X5p6HVV3INso5AX3mhA4SqKtSnbWRXOoOd0o+3DJwLkzQjs/Ywpo8mkowK8
	 vWH4NnPaURMGXcOay/tDstoJ3++YtgKODVmTjGkJggXcn3LywW+JNRRq9fDfnXHtmI
	 uFarhFf4LuhNKJ9IJ07r/PM84SpLXbLV39bnAt11+p5CaYEo8J5iPQPU4HZhjz7z87
	 hYEjM7Rlis6VP87rPfQC9zjLWw7mc/ITA8B8MDcoYD7jShIgOPC2uQJZ0BT/Wbb6N4
	 QNTyra28h9+r1wqL+8ZW+lyVYfPj67LWS0Bs5R94CLw0r2ZGxe0lv+zJtQ8uILHmoj
	 JcBjN5RTF9dHg==
Date: Thu, 14 Aug 2025 17:42:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mahadevan <quic_mahap@quicinc.com>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	David Airlie <airlied@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Sean Paul <sean@poorly.run>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/6] dt-bindings: display/msm: dp-controller: add
 X1E80100
Message-ID: <175521135433.4051745.12957568381296813915.robh@kernel.org>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
 <20250809-dp_mst_bindings-v5-3-b185fe574f38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809-dp_mst_bindings-v5-3-b185fe574f38@oss.qualcomm.com>


On Sat, 09 Aug 2025 12:16:17 +0300, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add X1E80100 to the dp-controller bindings, it has DisplayPort
> controller similar to other platforms, but it uses its own compatible
> string.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


