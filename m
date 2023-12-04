Return-Path: <linux-arm-msm+bounces-3244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB66D80326F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EA0A1F2104B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 12:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B274923771;
	Mon,  4 Dec 2023 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="schUwf7l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A25A22F1D;
	Mon,  4 Dec 2023 12:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A893C433C7;
	Mon,  4 Dec 2023 12:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701692512;
	bh=ehwIs65zsDIdKHkgPHVxycetv9+ZWzT/6+4plXPCR04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=schUwf7lt6mKU6U4NUfRfVlJsbi0TgNrrwX15ldnOl2DydGiv3MRDM2eDmiiTAryt
	 dFn79ZZ6/NoXnjQ7K/4bcIWqGkeI5b1Jb1rtw7dWCls/Eo7V3i1zxszMxm8FB90uZn
	 B1IDKZSFcrtTFq0k6v5MCiMRoV1aLYLbu4ne+2G0=
Date: Mon, 4 Dec 2023 07:51:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND 0/6] drm: simplify support for transparent DRM
 bridges
Message-ID: <2023120426-frosting-manliness-14bd@gregkh>
References: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>

On Sun, Dec 03, 2023 at 02:43:27PM +0300, Dmitry Baryshkov wrote:
> Greg, could you please ack the last patch to be merged through the
> drm-misc tree? You have acked patch 3, but since that time I've added
> patches 4-6.

That is up to the typec maintainer to ack, not me!

thanks,

greg k-h

