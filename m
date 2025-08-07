Return-Path: <linux-arm-msm+bounces-68026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 673B7B1D9FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 16:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6788725F9B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 14:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519C2263C90;
	Thu,  7 Aug 2025 14:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tb+oAIJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14350262FE4;
	Thu,  7 Aug 2025 14:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754577292; cv=none; b=Vt2WH75Nk5bpqu/bjnn0dwZhb3SYoe/7WZQx2opO4gT0ahBkZrnif9h2BEVS1w3zQZCWuPXWtO3wYPutdU9xnVRmHrDtEs7zeuBtM5JyfroArUTrip43SM3MxY/UWZubipYRB03UzAnBMv7uDCn8/+MIk3ZvNx9lWFIXhuZiwJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754577292; c=relaxed/simple;
	bh=oIv1AhxQFm1DY8j3ea6WxxB3ZICPAWl1Q01D/LXQQNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+qdMTc5wVdAe32ECidtcHqzkgo43fGU3qQMfoEPYs2SF2hNut8snpfucRWl/79vfcg30vTW8nciz+bgdsEUQ5XEiBSmdObnqSHga5vKsZnknQPAB1zjcm5Peuo3g7KZxARObpCVBnowXgmSgv6yCPW0IFSJI8jb3TtpJaug7ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tb+oAIJG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3437BC4CEEB;
	Thu,  7 Aug 2025 14:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754577291;
	bh=oIv1AhxQFm1DY8j3ea6WxxB3ZICPAWl1Q01D/LXQQNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tb+oAIJG1EQrqKdSa/yHJeVXXPszvhr/D0rOkd5DHzQNl9eFcZLP24GH4cqJZBDvV
	 mdXyk4pdXIuts6n3HcV2hMhmnSGA/u+ZeHLvIarn/6C3ALmRfWFfphgcklcN5VDf57
	 nOkuNpW+YGjEmmuWP7W/1C6EedU6jX0NzGYcHGtc2yzEzxLuklZAayWZASyORozzg4
	 Osfb25rQf8BE6CzLRRxyTuOckLEJC2at53+sTM/OBdxk6j1nVFi9oh6wwXV+Hbb0To
	 Rx1qNo2d4ujXXovSx1xDwsMuJEfC/kPJ6pbnSs1v3199nvePPhlWd5xRy5pIgEcmYv
	 jzFDysiwIhDQQ==
Date: Thu, 7 Aug 2025 07:34:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Antonino Maniscalco <antomani103@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/msm/dpu: avoid uninitialized variable use
Message-ID: <20250807143444.GA1009053@ax162>
References: <20250807072016.4109051-1-arnd@kernel.org>
 <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ouan6tfmoefwuvs7wmhpzjdwmxfhqh3ad26j5tmwdugnq7ieda@ddw6dfqtq27g>

On Thu, Aug 07, 2025 at 11:09:38AM +0300, Dmitry Baryshkov wrote:
> Having no plane->crtc is a valid setting and it is handled inside
> drm_atomic_helper_check_plane_state() by setting plane_state->visible =
> false and returning early. Setting crtc_state to NULL is a correct fix.
> Could you please send it?

I sent this fix three weeks ago, could this be applied?

https://lore.kernel.org/20250715-drm-msm-fix-const-uninit-warning-v1-1-d6a366fd9a32@kernel.org/

Cheers,
Nathan

