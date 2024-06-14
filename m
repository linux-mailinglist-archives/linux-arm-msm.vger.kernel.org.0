Return-Path: <linux-arm-msm+bounces-22676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6349083B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 08:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C537285D2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 06:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6601474C4;
	Fri, 14 Jun 2024 06:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTusOOPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A9F145A05;
	Fri, 14 Jun 2024 06:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718347132; cv=none; b=FeNIgxGxRUEqSYx6+VxI1cbF7Kh7Ro7REf2vBQy2eP07yQYDycI98NkTWtcQ1Mddvwpew1BmXO1mk4Wo8Pkj7RKxQ1uSL1rATzomlyzfv3SuHr5MmLQSditBD4mBiU4g9BvFsmhLSYVqEPDDxYidfUBJvCSQ9JWr5rAvahuOVo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718347132; c=relaxed/simple;
	bh=4i3sQn/SJjShuJbeDRXU6rgcmtPkIdqhkiu0lHKawIg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=pnsDB0XJNehIyoGGoJY9wZRZj67m+pVNe6UpWLWdzKRzJ61kXVjrC+Hv9d/b4+7dk9TwoygH1DQZi4BHbP1jDZHuzG1PQHk2XnTpgw9KhEMTVULAGvNZfqkz3BV7Y4fhz/bC2VMlq6NY1uKDxKvdhGMI2VtKuinCiuW5ivFA1Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTusOOPI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DF8C32786;
	Fri, 14 Jun 2024 06:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718347131;
	bh=4i3sQn/SJjShuJbeDRXU6rgcmtPkIdqhkiu0lHKawIg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=bTusOOPINlW7US6HEPCVWLp4xJ+yYE4m7M80P/trAHNIqz4Srfv3al6srIj+Iopyc
	 4CWn6HvFCBad9R8Rj9QK16r7kWxskKDEOLcM0YAWxPmN652SKE3J7I6Q+XEm5/8ec0
	 w08x2SXB/LyRDwuTTe/JK+JmdzmZFgo2E02b6nSrroqOsQr82TDgB+HlT3W6zv5bgG
	 aMsEY1WvNJtVjl4eUB31+GE8aTUx8c1AE2s/NPbFyRewMPzmeU/S+eYY2MrLaQZdSa
	 Ee6G5oqxYQaa65cENs9n1PBds5fJob0CoAjdaDaxKDFdjUaXUkYFEJfp2FWqFhQoS2
	 M82xubkmYXHFA==
Message-ID: <b91045384631984195a0f05214e0fa94@kernel.org>
Date: Fri, 14 Jun 2024 06:38:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
In-Reply-To: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
References: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Conor
 Dooley" <conor+dt@kernel.org>, "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, "Douglas Anderson" <dianders@chromium.org>, "Jeffrey
 Hugo" <quic_jhugo@quicinc.com>, "Jessica Zhang" <quic_jesszhan@quicinc.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Sam Ravnborg" <sam@ravnborg.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Fri, 14 Jun 2024 03:02:19 +0300, Dmitry Baryshkov wrote:
> There are two ways to describe an eDP panel in device tree. The
> recommended way is to add a device on the AUX bus, ideally using the
> edp-panel compatible. The legacy way is to define a top-level platform
> device for the panel.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

