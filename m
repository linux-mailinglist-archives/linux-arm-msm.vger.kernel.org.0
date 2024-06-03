Return-Path: <linux-arm-msm+bounces-21454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D78D8D7E56
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 11:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77A54B23070
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320857E578;
	Mon,  3 Jun 2024 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVpWKd15"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EC47B3C1;
	Mon,  3 Jun 2024 09:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406213; cv=none; b=BV5EITq58a9eVpnHd6vvdTQKwvF/4scoZKY3vmZTkg0kplTABXh7e5jy3sAwmigXECYUU5WhIu7PJ04+sqW1RsCcM56qGos6CdgysJwMgRAVp4t0EVNLY/L09tObVwUwU+L1dnIVR2AF2htwDbGjbB/CqeuAB1enLrhZ1PXewPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406213; c=relaxed/simple;
	bh=LJ9efKAjlle/ASgHhE9n496pzE0x+atFZsOdxkhWE2Q=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=CSdSWGgfOifpaAMQNqCg78q1zeVtO+sGbeS8TWMGvpaQy2odgp6+OWmDxvd2khOgIaX3Ll1TVUHVL1IIAFJ6VZyFt5QGo8u4YycCJliwIEgQafgYaOgVGIZnHWEK4l2tdszwGbgf50f2aM5zECE8qGWX+Q8WBYti+WX9Lk0uH1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVpWKd15; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366A1C2BD10;
	Mon,  3 Jun 2024 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717406212;
	bh=LJ9efKAjlle/ASgHhE9n496pzE0x+atFZsOdxkhWE2Q=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=qVpWKd15/8K825BYt209VbBq9HpEtJ+PpZlw0ToIwYly6E74eiZcT5u0u7JvmJOcG
	 6drQ+s9CuUpmAMzqOCcKsv9y4BcAwC7AaMv/Bl/KmTUZf1ZXnwFB/rJ0oHykzy9sia
	 eXpmwjBvTdZ2gjOUHppeqKRvqoTGHUIcqaUnYkcI3V5qv08x9PUELVthOMuQPwLZWH
	 VqP0z4pWkudn5YSpDCYFTxZJ0MyTKZDYnzcWM+714w0fCBPesib5lNCmmFSxFkBPf7
	 7f/X0X/CsiiD3jTs9l4JTypbDzgbgYVvRM49uyXdwiAkihmvsWvoSliCl48DkOVgkh
	 92uPKuNrIB88g==
Message-ID: <ca6dc1a130fb1c427831a6f52064d256@kernel.org>
Date: Mon, 03 Jun 2024 09:16:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 6/9] drm/msm/hdmi: make use of the drm_connector_hdmi
 framework
In-Reply-To: <20240531-bridge-hdmi-connector-v4-6-5110f7943622@linaro.org>
References: <20240531-bridge-hdmi-connector-v4-6-5110f7943622@linaro.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sean Paul" <sean@poorly.run>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

On Fri, 31 May 2024 23:07:29 +0300, Dmitry Baryshkov wrote:
> Setup the HDMI connector on the MSM HDMI outputs. Make use of
> atomic_check hook and of the provided Infoframe infrastructure.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

