Return-Path: <linux-arm-msm+bounces-3276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CBC803440
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25557B208FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1F5241F5;
	Mon,  4 Dec 2023 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="oZ6O91id"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3786295
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail2; t=1701695798; x=1701954998;
	bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=oZ6O91idQA5+WxKNWJLeQSd8czUGS0X8g5gJ749ccwcGiXGpK09eQlmNWuaRM1hSE
	 UOsHAXhsj2miXySJheA82U+pEPy95tc6sxzgSvg272KT1oAjPGi2wbuwhp0YNh2CC6
	 2OGHIfiYTIRPCljGArK883GLI4GXsMdOSUp6MCkY7qa+KfNNBPjCUa79AOZ+bFpdXc
	 ZfU91acURJ3cFCmvbhAXdVkSZt7pAvYlGe0QgqIB9DS0W9fDYx2+yiIFdLrx7fZNlZ
	 /LjljgXr2StjuMq4C4ySI9gtGg6w+iEWO5I4nODnsEACIgy6ekeWJ4KytWFi8Bople
	 7dpTIpAwet6yQ==
Date: Mon, 04 Dec 2023 13:16:24 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/7] drm: revert solid fill support
Message-ID: <z05UmOrR9bE64r5nmj_Qk0MjSr94rHvCsssXxl9VLa3jUunEwBWjCN_Mdm7WYT1dsB5UuK47BbuVvguGpWEF2CXo9oPRkt-gqQB4-8Y7zGw=@emersion.fr>
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
Feedback-ID: 1358184:user:proton
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Acked-by: Simon Ser <contact@emersion.fr>

