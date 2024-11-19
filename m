Return-Path: <linux-arm-msm+bounces-38320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B03B39D284D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 15:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D50B0B2FAEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 14:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC631CF296;
	Tue, 19 Nov 2024 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lausen.nl header.i=@lausen.nl header.b="empPKh6+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1AC1CEE94
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732026821; cv=none; b=ru3jrlOuBD1kacPwUqigZ9T0DewXmOYvLjjGL10X8UF3xIyezYe3LhIrPU9/vUJg5IxVJKMFK+AYHq0/Ycb7Ahr1p4syVX5hyOdbSIc+jdpxGJPShvaQDA2VoiwMhmjvLOdySygQ2GvqxT2t1k6mmNB1eEzdJ0dJrr6bfzKdsrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732026821; c=relaxed/simple;
	bh=3eWpa/+18Ue1BMImsmUxMY87oqji2WJD8S5AYWjcUDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TGU5GCv0z4NlVgJSO5DbTEZaeOvclvpGf7metEt1G0dv3NHi8fT3h9ubwHB4TypbyAXFqL+dU843MdBt/p1umsJsyl63/iLFd5rFzq9I/Mszb7P+JeVRv2TrOE0b+L3ZR2Jytz9DvzihrnRqJsQURkQdDtzkqz+m0QEZs9ubV9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lausen.nl; spf=pass smtp.mailfrom=lausen.nl; dkim=fail (0-bit key) header.d=lausen.nl header.i=@lausen.nl header.b=empPKh6+ reason="key not found in DNS"; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 2504618048D
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2024 15:33:31 +0100 (CET)
Received: (qmail 4871 invoked by uid 990); 19 Nov 2024 14:33:31 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA; Tue, 19 Nov 2024 15:33:30 +0100
Message-ID: <2138d887-f1bf-424a-b3e5-e827a39cc855@lausen.nl>
Date: Tue, 19 Nov 2024 09:33:26 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
To: Johan Hovold <johan@kernel.org>, =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?=
 <me@kuruczgy.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>
References: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
 <ZzyYI8KkWK36FfXf@hovoldconsulting.com>
Content-Language: en-US
From: Leonard Lausen <leonard@lausen.nl>
Autocrypt: addr=leonard@lausen.nl; keydata=
 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 Sw==
In-Reply-To: <ZzyYI8KkWK36FfXf@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.305056) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.395056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=3eWpa/+18Ue1BMImsmUxMY87oqji2WJD8S5AYWjcUDc=;
	b=empPKh6+3nG4JFrzy62dqTO7O4GFygVYRuAglDyo1q1kimjnZ5oyRYPRXcfZrEiZQOrPp9FQbT
	G/wQEWjRyFu6nddXFCX8v20PwOCMdqRVIHSzTp0PYKi60jR7fT1c4LYczq/uzcD8cBx3jHBms7nf
	nJfyJ/779pL78g308ZgUe4VTdq9x1qMbTdHLChuD91UYub/0uSNir7RSFzxkdOSj6ve6ADRjlwuA
	uyvkYBTt1NEKZzHqI3nafK+tnR0ZRX6MHURu68DPoS4OUJdqXPNRINzLoG4b3OWPNqa1qPZTWV1o
	gS6InHDrrJ4Zf8aa/iQAYmCcLZoS8R8b0RfgDBJd2fHuNd4p9L/iXSvy6GY4laRVv2E+SjEP/H5S
	wrgwMrx3wScH2bpzenb4MEAJeM5z4RbKts9z437ZlJ7T55NT2nTZNuS94mAA5UwLVZt12coR0ffG
	aCyC4Ziclj6V4nU/A7+JxzYz03xCl+QNU+OTIhnqOmqyS9acVUPgyNhQiueycTegFIc8BWxHnziC
	adePTjYZ7RrI/seh2kt+GTIoPZKSjalQs+RNx9AzUZ/LXIaIAbV7iCDJ0NUPZ4NHyx9uEznKOaOr
	A9uihadXlRAQJHhvQGQoAsApeMQAh1Zu7NUDlR0r5Fluf2IYXujmzGrMAkra4sD1LN7Vd+c03iJ/
	s=

Hi Johan,

> I'm seeing the same issue as György on the x1e80100 CRD and Lenovo
> ThinkPad T14s. Without this patch, the internal display fails to resume
> properly (switching VT brings it back) and the following errors are
> logged:
> 
> 	[dpu error]connector not connected 3
> 	[drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)
> 
> I see the same symptoms with Xorg as well as sway.

The issue of "internal display fails to resume properly (switching VT brings it back)"
also affects sc7180 platform during some resumes. Do you see the issue consistently
during every resume?

> Can we please get this fixed and backported as soon as possible?
> 
> Even if there are further issues with some "Night Light" functionality
> on one machine, keeping this bug as workaround does not seem warranted
> given that it breaks basic functionality for users.

I suspect this is not about "further issues with some 'Night Light' functionality
on one machine", but rather a more fundamental issue or race condition in the qcom
DRM devices stack, that is exposed when applying this patch. With this patch applied
DRM device state is lost after resume and setting the state is no longer possible.
Lots of kernel errors are printed if attempting to set DRM state such as the
Color Transform Matrix, when running a kernel with this patch applied.
Back in July 2024 I tested this patch on top of 6.9.8 and next-20240709,
observing below snippet being logged tens of times:

[drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get dspp on lm 0
[drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
[drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119

Full logs are attached at https://gitlab.freedesktop.org/drm/msm/-/issues/58.

> The x1e80100 is the only platform I have access to with a writeback
> connector, but this regression potentially affects a whole host of older
> platforms as well.

Have you attempted setting CTM or other DRM state when running with this patch?

Best regards
Leonard

