Return-Path: <linux-arm-msm+bounces-85447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5E6CC6882
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 09:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 743E33017070
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 08:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC29E348447;
	Wed, 17 Dec 2025 08:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GI921RMV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4D2253932;
	Wed, 17 Dec 2025 08:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765959187; cv=none; b=iLi2pOmy8gqFDjwN/0KlgujOgNP2TJHzePa8MuqrWMCdYHXjw3y6VTenoQhjvC46/RkgLZDk94QPIIS+8qnXUlWnIs9oGVssoIbbZV09VxcjQDX4mLXyjXsN5cHZpwvVgRyrO8G/NRmcy3fT3WsWeSq7CQWGYnnlNfE9Ct6ttFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765959187; c=relaxed/simple;
	bh=OMyUtJmYXFZQY4uUTT6FKmP7KYbyBgFkDOaoGuFOv2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZUNL1wL/um6elUE3PKVrlL4uprwe1m/bSuBi959eRqjQ7OR4EO49Di6rR+lvPc88n+4p8Dcx7PB3cBxNlFYhOaE54ljYLcC6PdlfxqBCEVeA7kDh35Mp3fXt9f6LZKuSbL0OJ1ySrjzdw459XxqgVSM+5rkoYZwExHqXnBP9ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GI921RMV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791B0C4CEF5;
	Wed, 17 Dec 2025 08:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765959186;
	bh=OMyUtJmYXFZQY4uUTT6FKmP7KYbyBgFkDOaoGuFOv2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GI921RMVYDQ2hFRIBwahO7FIge2v3l/1y6U+KnlgaXo0ULu4PfaDTtio+C4wGXSSS
	 ExPF9QWjoAWgeC7LZZLuhX2VJt6M1K2YQ+v3HxzyH5d9stDo2/vbkAD7u6FXgKJVb0
	 rbUkXf4pvwqiu9rq/BlIiaIDSl8aSViA0pPxiIDtU8W+Ok04FodaoqdzPFD2j73C7+
	 oTgOlYvpTu7m0seECHf1LmqWJjCn74HKmbAyTuQ+6s8T+1Ui/wBB6ylTuk25kTKpM3
	 I6IIqTRZlteP9Y9YR+wpiHQHSjVmO4FgMIAsAKyTHCnlbDW82H3RQqOJzuG5Jz6/uT
	 B1HTev21/d/zA==
Date: Wed, 17 Dec 2025 09:13:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, 
	abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 03/11] dt-bindings: display/msm: dsi-controller-main:
 Add Kaanapali
Message-ID: <20251217-rough-devious-moth-fe941e@quoll>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-4-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215083854.577-4-yuanjie.yang@oss.qualcomm.com>

On Mon, Dec 15, 2025 at 04:38:46PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The DSI registers on the Kaanapali platform differ from those on SM8750.
> So add DSI for Kaanapali to compatible these changes.
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


