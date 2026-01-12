Return-Path: <linux-arm-msm+bounces-88450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1665AD10B3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 07:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D8BB30313DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 06:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88101E32D6;
	Mon, 12 Jan 2026 06:31:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0141E4AB;
	Mon, 12 Jan 2026 06:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768199516; cv=none; b=FVg9kz5LBf2Rk04bK95nAzP00rfwNYbFtBm9zIuysi6BTE3Jnu5jI0HDrQBIETOtXF6ouRhCgMM+1qABQZgs3Ot2uiLAcxvOoA1mAw0KMKCXzRNNMG07jIBOj7VU0FWEIcXK7mSTwl21jqMzu245mpTU7d5KcskhKJ9fJynNLSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768199516; c=relaxed/simple;
	bh=zZ5Ywd17XAdkWHwVVZNR/tfS5+rWk4w6EW3a0J0KT80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ob00qE9RnpWjpBTo9+EmTGDrIpnVa925PnR3zmC66K2FDCAoSmh5Y0/unguH9NPMwhbnaRnIK9SlVsqYPz6ZGbC8lETWYlQ6Rse2XP2fAjhX5uF4w56DxRgFDPwUTB2UqpsPj8edzRNHnht1UGvocsl4b8g+swpOr+z8Z4Ul7YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz4t1768199477t5221490e
X-QQ-Originating-IP: lAr+nSzbSl4WkkI7JdgxjIK725eukfFUvW8YDestnqc=
Received: from [127.0.0.1] ( [116.234.96.45])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 12 Jan 2026 14:31:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12744510694498697808
Message-ID: <F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com>
Date: Mon, 12 Jan 2026 14:31:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MfQnJH+7WKv6rImbAXMq/r5rBQjKOc9n94JVUxzuFCINlBoLjghSdgqV
	YpB2QzHU0i/A9TCsSa0X0P1bNKTwScxrv4Uswky1fFcynivFIhCsndwIU+XcNyRFiEqcZWr
	Rk1IAueR8fqeeg885WD9zLVrHWpEb28JSIhlWQDpOPM/xTE0Oa5ODWFERFG1VMVc84ffhPL
	okKpXTi4mwomJubPVeA+orSHDxZl3qKnphFL9gWd3T0zERoMM6cJgkwEtxdeSwnKOLfhQJz
	dFdIZ/hmBqeDTBeYsQfBcDZu13orjQtTIKcRr33rL3vm+kGp8hJSyPNl7XLN/uBMmYV+8yG
	sspVHHe9ZEh6PMmdCz9K76Qm/1ihUdW1BCuHiGIMYldJdK+n6gBJu868x8mkj+myQ0HNJkg
	1zaDa8Kx263WGm8bDJEVSDacl02O9lICKFhu/Q4Wt8AA29kAItYU5s0psv1NWHUWNBPw/2Y
	5XZdQw8F6/LmeeTYP9zVB717I7gDjnk8Kn77ISEDVA+hsPf9VmBfgBVXd7BPWmIeMYpbdIS
	xkV816qTbS0volIFl3UGqjVrvnlZjC5sOOudqs2sAg9ZYpZr0mnaxf391zLaWjTIiownsTz
	3YniUG0qFy1P/VJU7a21UGyxEBaG7qYGtPwMi5zGZF7TiOW8LoeVMpb+nZOXN3IW7uqaQZf
	lXKH/r8bMQbO6XpBibRWEUNuxcnOXaaYXL1syXYykAgvrZOq1C+/JJFjnvbRpfD8Ae4O8bs
	1CgBKvhtrg6/DO3I98l4VCRLI4pTNfrfQyP7P4XkTxtMmVz+2MTIMD9/eiPU1HTyjLglGDA
	eVXnOoeDwJb5wcYCazOiMmt9p4a+4YxxcQwq+QsKyS0T4/z4F+Dyx/KgcJ2J1tVVYMt4447
	Rv9m7VPwVyihpxtM/1uUezHSlTqBiyoWpEXE57uBvKIY5oZN/UfkD/JHKDTrqwrgLOw8n4t
	yU94wu09P2DcCcN1RoGlCyW6bzwl53HLbsr9PVNoM3b/05kXqIvEvPq/2e/a+foT2lmrlhl
	h00O+WgQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On 5/7/2025 9:38 AM, Jessica Zhang wrote:
> Filter out modes that have a clock rate greater than the max core clock
> rate when adjusted for the perf clock factor
> 
> This is especially important for chipsets such as QCS615 that have lower
> limits for the MDP max core clock.
> 
> Since the core CRTC clock is at least the mode clock (adjusted for the
> perf clock factor) [1], the modes supported by the driver should be less
> than the max core clock rate.
> 
> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---

Hi. This patch effectively filters out the 3840x2160@120Hz mode on 
SC8280XP CRD. The calculated adjusted_mode_clk is 623700, which slightly 
exceeds the supported max core clock of 600000.

However, 4K 120Hz works flawlessly with the limit removed on this 
platform. I even tried connecting two 4K 120Hz displays, and they can 
work properly simultaneously. Is it possible to bring back support for 
this mode, or adjust the limits?


-- 
Best regards,
Xilin Wu <sophon@radxa.com>

