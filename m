Return-Path: <linux-arm-msm+bounces-30347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F37A396727E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 17:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 062F81C20A58
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 15:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB0D38FAD;
	Sat, 31 Aug 2024 15:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lausen.nl header.i=@lausen.nl header.b="RvvXIg1n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F761CFBE
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Aug 2024 15:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725119288; cv=none; b=F+JxI9jhOC9UN6CiNoIG8LWv91ifgfIkUK86F+FtjAXzLwJ19FRBZHP1dxgerMZul54QldiMCnZwvBTSf6ebOodGZbZXdRKzT7620ynhF0gUJ7wnxzGBzHoY0qnHSNfEo2GVk0CIMxK/4VG1n622U4whByOOXbPWD3513X7OImw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725119288; c=relaxed/simple;
	bh=tgZeO18/FatOKxCPfjewl3Otax0/Cbf5GNMDqKVUYK8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OO3F9/p/UZ+TI3afbAilCllgilSTinXfTgprg6YEL+f+9RnhcOf8FtAvtS0Ue4D21CmLxtdjPxg/OA8lW7DMVqE2s52pw/lxCbe7opkSU8RuY3Tzj1tgsEyO9ojvuEPeJTd42um4NKN6+Hk3aHn3qdflmxS7Ti+Z0BwEP6375MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lausen.nl; spf=pass smtp.mailfrom=lausen.nl; dkim=fail (0-bit key) header.d=lausen.nl header.i=@lausen.nl header.b=RvvXIg1n reason="key not found in DNS"; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 1F27917FEAC
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Aug 2024 17:48:03 +0200 (CEST)
Received: (qmail 6512 invoked by uid 990); 31 Aug 2024 15:48:02 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sat, 31 Aug 2024 17:48:02 +0200
Message-ID: <0b2286bf-42fc-45dc-a4e0-89f85e97b189@lausen.nl>
Date: Sat, 31 Aug 2024 11:47:58 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Leonard Lausen <leonard@lausen.nl>
Subject: Re: [v2,1/2] drm/msm/dpu1: don't choke on disabling the writeback
 connector
To: =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org
References: <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
Content-Language: en-US
Autocrypt: addr=leonard@lausen.nl; keydata=
 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 Sw==
In-Reply-To: <b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.003114) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.093114
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=tgZeO18/FatOKxCPfjewl3Otax0/Cbf5GNMDqKVUYK8=;
	b=RvvXIg1n1RMEkwDs+dHHZh2peLNIMlagK2CVB0gD1VGCP9JaviWXv5aWi8CnbiA8gEbQOBokuX
	sGVBGAMRHUkBQ9FFsSgPpTBx+ihl8BcQJkTckl1lWNnQLxUZbtAQQjboulh1pYAepMGZ6K8HYHKi
	aBJABGsq2dv3cPFJW07bwsYbyKMHGjFz0yRVDAzYP5uw/YOrfJvo1vZcYn4FPQybmnRygzGwamWH
	lAFd8PjFBnDqZqkdGY7aM/n/jAGYYTN8a4UcpSi/WfxIb/HTVySZLIs/gEBvh+HcLEY1d2vH6ZHz
	MqKEzNIk0Yk40o0+sFg/iHsZHvjhIpH7Ty19IUR02XVdrNQ/wuLOh+tZsNQVst2UlZaJw9hRU7Vw
	G4bi57SPS4zGoQv6CM4u15S9ukys5Yf12uC6Gue8PnlcyIgZfeehT89R++yoavVhL67bdvMM4912
	kcLCAlB+MM1VaUAtUy+LL2Y0cpWOj+EGn+7VeowCsEcgzpSTqvCWbdzjydkoHuFqBV14buj4ZTn0
	4VdDw6sxE59DVzeJHyhWIh6E57yUZDh9WeLRSSPlEb5WkxT8Yrlz2FE1gdS5+Cd3xPUt7tv8s+5h
	mLAjDvwbbCdUudwiE5hYR6saY8AAsPHV3ny4SST9HlsIuzmlaIdphnhxeSmy27V4yB0h2Xq4xPmZ
	I=

(Resend as there was an email SPF record issue)

Dear György,

On 8/30/24 13:36, György Kurucz wrote:
> For context, I have a Lenovo Yoga Slim 7x laptop, and was having issues with the display staying black after sleep. As a workaround, I could switch to a different VT and back.

Do you observe this issue on every suspend-resume cycle? On sc7180 trogdor lazor, I do observe the same "display staying black after sleep" in some of the suspend-resume cycles. I have not been able to observe a pattern with respect to when the issue occurs and when it does not. "[drm:drm_mode_config_helper_resume] *ERROR* Failed to resume (-22)" is printed in either case. Switching to a different VT and back works to restore display functionality after those suspend-resume cycles that experience the issue.

On sc7180 lazor, I do observe that this patch deterministically breaks restoring the CRTC state and functionality after resume. Can you please validate if you observe the same on Lenovo Yoga Slim 7x? Specifically, try set Night Light in your desktop environment to "Always On" and observe whether the screen remains in "Night Light" mode after resume. For lazor, "Night Light" is breaks after applying this patch and even manually toggling it off and on after resume does not restore "Night Light" / CRTC functionality.

Best regards
Leonard

