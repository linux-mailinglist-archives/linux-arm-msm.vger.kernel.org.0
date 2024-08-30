Return-Path: <linux-arm-msm+bounces-30251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B655F966194
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 14:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6894C1F2823C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 12:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE031A4AB3;
	Fri, 30 Aug 2024 12:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEQpzjRR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C580D1A2C35;
	Fri, 30 Aug 2024 12:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725020667; cv=none; b=u0S2aKY0X03QMsdilL2ateaIvprz3bqc1Grz8k9sLxrsfQYH4B1ewoqPk8nPnzPQQf+Xf0SuSzcxwTcg2EeljIQT+w1aOh6Gyl4Quoqu5wLDz143RsKjs5m5fxiBE6HzFJ3ClQempshQUBbrUARzL2a6+LlW4lsC8o6uM654gko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725020667; c=relaxed/simple;
	bh=Fye5UJaT5Z6qElniiFFVhG1gjqZp/bvz7JiyCKZVrEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dkRgXAe/Nr0SCTrd65mAQk3OyblWIsiVH+UpbkbrXjjF6WH8KA+9LU8kAnfk7xOdkKX3HWcclPNtAAMjosJDBlPNzwZiDxuUvKOwbPVFldaxyDJmS/1RafRMuAks+omJN+BjpyZtnfPz5RVS54J1sckRN2Cw1Jaukm5NX/0+VSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEQpzjRR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E41C4CEC2;
	Fri, 30 Aug 2024 12:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725020667;
	bh=Fye5UJaT5Z6qElniiFFVhG1gjqZp/bvz7JiyCKZVrEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WEQpzjRRxsJ0GlLTZibav07DzRRwi2ebpa8UfEv89WyXteZpRuofmiRoWTqIXB/zK
	 T/YA5u+bBkBO6e6B1iJSB77IywTdwunsHiYWm7hJhvYPqmXTKASGEVkorgsFNBebyT
	 gjp7XUz7VyyOjLrm3VjiRN4LVvHCIpHu+Pye1sS5SgjdCmoIl0BYzPm+L+NsA3hegy
	 v2MNuo396r/F0MJRYoeu+/ZNkX6VHu9+50RBlvjdXXW9MR1DjG93cFx8d9hgQAohaY
	 8EYQZOyjVK8TulhQxU0g1ZyQb0YfkgGur0tA33h0wfohkCts3jRoG+fxf76s+SQVY+
	 QdOEwcXx1oGLA==
Message-ID: <1edc1fdb-ccf9-4dec-9669-d8c33511c7b0@kernel.org>
Date: Fri, 30 Aug 2024 14:24:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sm8550: Don't park the USB RCG at
 registration time
To: Stephen Boyd <swboyd@chromium.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 patches@lists.linux.dev, linux-clk@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Amit Pundir <amit.pundir@linaro.org>
References: <20240819233628.2074654-1-swboyd@chromium.org>
 <20240819233628.2074654-3-swboyd@chromium.org>
 <CAE-0n52rYVs81jtnFHyfc+K4wECvyCKmnHu2w9JhPNqvMYEeOA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <CAE-0n52rYVs81jtnFHyfc+K4wECvyCKmnHu2w9JhPNqvMYEeOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.08.2024 8:12 PM, Stephen Boyd wrote:
> Quoting Stephen Boyd (2024-08-19 16:36:27)
>> Amit Pundir reports that audio and USB-C host mode stops working if the
>> gcc_usb30_prim_master_clk_src clk is registered and
>> clk_rcg2_shared_init() parks it on XO. Skip parking this clk at
>> registration time to fix those issues.
>>
>> Partially revert commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
>> registration") by skipping the parking bit for this clk, but keep the
>> part where we cache the config register. That's still necessary to
>> figure out the true parent of the clk at registration time.
>>
>> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
>> Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>> Cc: Bjorn Andersson <andersson@kernel.org>
>> Cc: Taniya Das <quic_tdas@quicinc.com>
>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
>> Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>>  drivers/clk/qcom/clk-rcg.h    |  1 +
>>  drivers/clk/qcom/clk-rcg2.c   | 30 ++++++++++++++++++++++++++++++
>>  drivers/clk/qcom/gcc-sm8550.c |  2 +-
>>  3 files changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
>> index d7414361e432..8e0f3372dc7a 100644
>> --- a/drivers/clk/qcom/clk-rcg.h
>> +++ b/drivers/clk/qcom/clk-rcg.h
>> @@ -198,6 +198,7 @@ extern const struct clk_ops clk_byte2_ops;
>>  extern const struct clk_ops clk_pixel_ops;
>>  extern const struct clk_ops clk_gfx3d_ops;
>>  extern const struct clk_ops clk_rcg2_shared_ops;
>> +extern const struct clk_ops clk_rcg2_shared_no_init_park_ops;
> 
> I'm considering inverting these two rcg2_shared clk_ops so that only a
> few clks are parked at clk registration time, to minimize the impact of
> commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration").
> We're up to three or four band-aids, that we can probably wait on
> applying if we make all the shared RCGs determine the correct parent at
> registration time but skip the parking, except for the display clks on
> sc7180 where that exposes another problem with shared parents getting
> turned off during probe. It's possible that other SoCs will want to park
> their display clks as well to avoid that secondary problem, but it can
> be an opt-in case instead of a change to all shared RCGs.

Are all cases that need the parking obvious like it was the case on 7180,
i.e. some downstream branch is stuck and there's complaining in dmesg?

Konrad

