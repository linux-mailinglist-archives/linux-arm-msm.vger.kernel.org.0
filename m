Return-Path: <linux-arm-msm+bounces-51461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F40A618AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59B118848F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED989202C21;
	Fri, 14 Mar 2025 17:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6sK7ieG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45781FDA76;
	Fri, 14 Mar 2025 17:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974857; cv=none; b=aGAY7mIEfnIwxjQrXi7X9/HtUqbSZEm7CHpmAev9lZ6tYxZ+oJ6aaJdEBAapcZ21ovrpt3VY6q9D/CTwOA9VWEUJKU7XN9cyeLliiYHy6fI49d8X4cYIVIl6kv/kSr8pzBwn/1iefs1YKqGXWm66qtgxGp24eLJwqBFUzz3UpJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974857; c=relaxed/simple;
	bh=s5sHm7/QnN7CVS7K9YFNqIidGfIhRwMnWMvEDWIzRJE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=PAgBSFINPHArCKLyXJJAXIDmx3AjsqiphIAWCvlSsj9Pn1JdKuYWfBmWn6+FYxUO08245hUkFecBpzKkIAwKgt8BjNqbnXg1enWQA3kmZRwYlyif4gpQaQqcbEnYa4Aj1btGi9XTbbl5G4lFkKwZ0/By/o2qlfwWqLi6JIHrw3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6sK7ieG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE4AC4CEE3;
	Fri, 14 Mar 2025 17:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741974857;
	bh=s5sHm7/QnN7CVS7K9YFNqIidGfIhRwMnWMvEDWIzRJE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=l6sK7ieGocpcw/pza85frnO0i9kO+vU4VfI7L741J6xa2xf8hMS10QC/pwEdA/k1Z
	 JbXb4RHhXzvnoqi7m4F3t7XGKYsW6muYPPyes5EvfUozYbXtjqwDa+xqsWLtex6XXc
	 wF/iKUNERYd6/Hl5AHzWP4hooCs8f8/R7AIo756q0u1Qyf7NQAb+Cv9l8bWGLHC+MC
	 Ae/FcMfiUZBxIjU/0Q84DB0U47SsD/7ht55s4g92NAGNQh6xu+6Df95DrI6Zr1BXTd
	 FZ+5ALITjJ7h8HaB4AhD8amhsw9Oqvb0Tw1rhP6RLresD4bjrKZ+gXd6MgGHPY6dfh
	 Hq656x/xSY6Ow==
Message-ID: <d5b8a7fa506ed3026c19b383edf160d6@kernel.org>
Date: Fri, 14 Mar 2025 17:54:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] drm/bridge: add function interface for
 DisplayPort audio implementation
In-Reply-To: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Hermes
 Wu" <Hermes.wu@ite.com.tw>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Clark" <robdclark@gmail.com>, "Robert Foss" <rfoss@kernel.org>, "Sean Paul" <sean@poorly.run>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Fri, 14 Mar 2025 11:36:49 +0200, Dmitry Baryshkov wrote:
> It is common for the DisplayPort bridges to implement audio support. In
> preparation to providing a generic framework for DP audio, add
> corresponding interface to struct drm_bridge. As suggested by Maxime
> for now this is mostly c&p of the corresponding HDMI audio API.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

