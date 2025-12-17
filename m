Return-Path: <linux-arm-msm+bounces-85446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 559BBCC69A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 09:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9F0C3006FC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 08:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA2E346FA0;
	Wed, 17 Dec 2025 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2WqR7jD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C25346E78;
	Wed, 17 Dec 2025 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765959136; cv=none; b=dRRtpTwjMSO/8VNaemEUEkqePlrl6Z9ANodnHor+RdRTf4TYPHuDBkLClVTLQjODVDFK+tIJ+9wCkf9YuUdEEEk9zDf9rDasgs84aDKEnnhlVE61nUUoe2U9mkzCFwY7+13yjuK2qQvdpnui2UiFY5fHk1qlrihdPqxeJZixH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765959136; c=relaxed/simple;
	bh=FyNpsusmUyeNieXFwe3YptetXP2BtdFkldukT23gM4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbeIkytM365lo52iGnX6sOCjDpnpGCCjm/l6rrT8iCyLGXs4D0DlJ+sujWVRoRN25MpddJ7RDEkjd/5FXyaBa9l44ddBcnb1P7DacMauOrQ5zXu7xGZhzHIvoUFVNs1UkO/wdIa+6o0ERo0UWYduixNqCyL9ma64gOOy3u5TyL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2WqR7jD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E20C4CEF5;
	Wed, 17 Dec 2025 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765959135;
	bh=FyNpsusmUyeNieXFwe3YptetXP2BtdFkldukT23gM4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j2WqR7jDwala4SMNzmPeGnNwlxVOlbf3MIIYMakQGJibjyI+siQvirtR7EMUANV73
	 /eUUBmuYXolLTzfz86XXYOODOtQOpmHdUzUE5SdVasPgbs+iKYyMVdcitEUCqrcXAT
	 eOc18Is2qSQlmB/VsVFzOi3IblRddAZUS95DmKLggL7yJbR/spuq92O9jMej8+8l+r
	 dzOalcvma/TPhKmv6w7Ig21uYPS++Pw2hdAEGzznz9aIH/v6xj+QShV7wnRtAsUXdl
	 rA2O89vDGUGu9UcUOZ8ekhSJJCxJlwllspbnWXbtVsgPow0LhprbBCJsC9fPywa/Yq
	 /Psv2LOvAqgOg==
Date: Wed, 17 Dec 2025 09:12:12 +0100
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
Subject: Re: [PATCH v3 02/11] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSI PHY
Message-ID: <20251217-astonishing-turquoise-grouse-cbaa6f@quoll>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-3-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215083854.577-3-yuanjie.yang@oss.qualcomm.com>

On Mon, Dec 15, 2025 at 04:38:45PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The DSI PHY registers on the Kaanapali platform differ from those
> on SM8750. So add DSI PHY for Kaanapali to compatible these changes.
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


