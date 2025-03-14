Return-Path: <linux-arm-msm+bounces-51459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F73A618A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 18:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD287176D6E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 17:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF793202C48;
	Fri, 14 Mar 2025 17:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUIcLe7B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85543126BF1;
	Fri, 14 Mar 2025 17:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741974800; cv=none; b=uhNbnsdD9BgBM4wfKjMQGCh4BpGfvQz72uWVlitP2NDAfDXJ8iNCVk9rUgwE0Es7oE8vB0DOXIEKCqIaaOzgFT/cDjLI2dSj2BH0W8udHvgA3SEnnOiqaiEC3PckbEQkrtk5ieeqcWLq9SeahoKgdW6ox9+exSFnyuUf/CL2N68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741974800; c=relaxed/simple;
	bh=5NZxvad2uFczUGWwHFcIrEEWa5q75IDbRp+3vgAAUdM=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=nUw20IETBX+agxWF7h7neRVIA+LUgJlMnJ1qB5flobFL+T/Y7Je5mclxXF0UcuJpSzZAxzEBRddzMYQHJDS9UaGPSkYxUd/oBOBrjitbB40RgwHE1oMMXz9M2JUHVXPemMmxis7wPWplw7qyXEfkLyI7DWgX6A9nRSJukA5yhso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUIcLe7B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E918C4CEE3;
	Fri, 14 Mar 2025 17:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741974800;
	bh=5NZxvad2uFczUGWwHFcIrEEWa5q75IDbRp+3vgAAUdM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=bUIcLe7BZXsuxfxRLxhFOe4XDbUgIDCeAo1QrGvwNrmdvFbLlTMWcKuOLI8rPY5RW
	 p+XP5QNd5nlL0tg0IzWqYmLnZn4saPAXMgJvKuS4k6gqe3xJWq0QWCdH9kd6jZ2oX6
	 s5xTRCNUDFMmA3fQcJ44NP4VzX9ZBUaWr34QsAf77bPE4MwJiMeqEn2tg8pcblmQYJ
	 2t9wVNWCDHJNG77cQipcAIQVnLP1Ur+2jQPY47nVi8U74jA6yXFccprXDD+hldxheI
	 VW7gWoUAL0uvGAbRX0ZQCHI/juGj6oX10UvFxP4uODy2hJUGuoxTLOn1QinsvvmyLP
	 tLyTp2w/IQ82w==
Message-ID: <b56aa82c22a2e2ee41dd9689185bc99f@kernel.org>
Date: Fri, 14 Mar 2025 17:53:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/4] drm/bridge: split HDMI Audio from
 DRM_BRIDGE_OP_HDMI
In-Reply-To: <20250314-dp-hdmi-audio-v6-1-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-1-dbd228fa73d7@oss.qualcomm.com>
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

On Fri, 14 Mar 2025 11:36:48 +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
> 
> As pointed out by Laurent, OP bits are supposed to describe operations.
> Split DRM_BRIDGE_OP_HDMI_AUDIO from DRM_BRIDGE_OP_HDMI instead of
> overloading DRM_BRIDGE_OP_HDMI.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

