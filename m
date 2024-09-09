Return-Path: <linux-arm-msm+bounces-31291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2CA9716E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9D551C22A62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0111B3F3E;
	Mon,  9 Sep 2024 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQRJuqtJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232CD1B3B0F;
	Mon,  9 Sep 2024 11:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725881382; cv=none; b=OVqMrf2saBTg3/xS/txFW+Qp+Wv5zOeYGitsQgjqj7vCP8aB7oIL28/Gv/PKkeMcKJ/4ycGU6GmX6luC9rCcwK9TbUOP0pW/S+X66PJKdM0CoYQyGSbBWXib96oB/jLZgDPMJM/lrTaeXMZauo1P2tsix4DiIA7f33N7FzzYphI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725881382; c=relaxed/simple;
	bh=hDPtv1dq1B5J7Dly0bAlYZ/v9ujbcaEyi7+PCeXjFjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHtT2skPpQoMAvF9+Wzly7o3JxxxYNjL+t70V69c9ZJXtA+E7cp0OgFROLVABuREHOTtBpWYT0cAwOO62LiH9X4U1V9XDI1Y48NuSItt28lTzYjbFyROTN5T5LoRc8FyjVLKTCvFdv0td45CPzccbr3xkd2B2y7T/vQQ4ka+gr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQRJuqtJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C54DC4CEC5;
	Mon,  9 Sep 2024 11:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725881381;
	bh=hDPtv1dq1B5J7Dly0bAlYZ/v9ujbcaEyi7+PCeXjFjE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PQRJuqtJaxH0Ov2XwoggQGTDsnqh302H1jIH0BYmFQLVxGwIib4VAXcJQwEdUv8vh
	 HUhh26+uzeqDcE+mxr9GyiSHaNd1+R7w/h6kOUs7NyD3V/pWI2uuL9ZZktTEcj3mz+
	 mXsXZ5q37n+4CGDntjhPkzxTOOVbGIAL17ZHfXuTknVm4lvMiVL9ZKaXvD7RoJ9ZMg
	 lHRRNkPM0aSWNEb/18RB+mPCBVQa7FR/G/qMsi7fVfT8bmo0zARQVRWwOcVuIiuNwK
	 gbUKMHiQvCbYuNgUyGz9h0ySGztPfW91s2EyNGdu2edHTLdgso+jSr/Q/0kuQXCd6X
	 LDul1jtWt4IbA==
Message-ID: <88c4eab9-0e12-4eee-a04d-110b6228ede4@kernel.org>
Date: Mon, 9 Sep 2024 13:29:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: allow returning NULL from crete_address_space
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240908-adreno-fix-cpas-v1-1-57697a0d747f@linaro.org>
 <c77ab7a8-49aa-447b-b7ac-18dd5c2eeecb@kernel.org>
 <CAA8EJpr4sMEmywD3qO8co1ZN3jG5w=dsfDYYmY90baRne3dHSA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <CAA8EJpr4sMEmywD3qO8co1ZN3jG5w=dsfDYYmY90baRne3dHSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.09.2024 1:25 PM, Dmitry Baryshkov wrote:
> On Mon, 9 Sept 2024 at 13:34, Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> On 8.09.2024 7:59 PM, Dmitry Baryshkov wrote:
>>> Under some circumstance
>>
>> Under what circumstances?
>>
>> This branch is only taken if there's a .create_private_address_space
>> callback and it only seems to be there on a[67]xx.
> 
> Existing code doesn't. I stumbled upon it while debugging private
> address space translation. And that's why I wrote 'it might be
> required' rather than 'the function returns'.
> So yes, there is no issue with the current code. And at the same time
> not having this in place makes debugging more difficult.

Feel free to submit your debugging code in a way that won't mess
with non-debug paths then.. This is trying to solve a non-existent
issue.

Konrad

