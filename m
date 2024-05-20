Return-Path: <linux-arm-msm+bounces-20068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 781E08C9D25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 14:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5C92B22658
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 12:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625E253E25;
	Mon, 20 May 2024 12:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4GEQTMI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDA352F74
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 12:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716207950; cv=none; b=fzMefo+ZU6kE4DTyUc3Fm3HrgZsHxMflBbG/HFencjl4Gk8ZqE1C0exfpueGLNZKTVKks9BVz+m/VvGTAUfnYX6dukpZpFkWbtPJrFpnyd+97CEru78bBQ7sf3aPCY2MV+ntZDWXuPzSJ35SLUo+sEMOEg6XRJM0YLawT9GqUd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716207950; c=relaxed/simple;
	bh=Y4B8kAtC/DxbAD46rBGuE4bcdku0+xNxRgPtQ6G47zg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mfKcg56C3iGtG4cRWIrZVbRQb+1ziQ3kd1VFZUUp5zx9v9smBUyNWKQUhQoIJisCUV4tjXti3jd3JdmhfCpuHEp/xHS5lJZYPDzKnJKXagmtMIebRn6iss7sW0NPwKRVud57MiRb/jNd6geZR4nf3qCgoMyVAhE3ljh48GLzx3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4GEQTMI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716207948; x=1747743948;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Y4B8kAtC/DxbAD46rBGuE4bcdku0+xNxRgPtQ6G47zg=;
  b=Q4GEQTMIinGrqTm198xAgtahXtASwE1z+JAbEcsQtesbX4aDIKysDslu
   xCbeIwiy6xqFn61hvG7+/pLw3iR5aU043Te8AGaNDFLcc1lmdWvjJlySL
   OaKi9VrYx6uGQP8WkNAnooc5nvpR5ib9vMYnasDVwP0VLbdDl4UwOXwid
   SM/d0UbT04PORn41QOtNCisK9/NBEg3Z14S1ADbZQPFFCk71gjrFNMfzA
   /PdNoq5m7KraQcg09amtzRBfpVVOyUEp9msZaly0S8CBiRVvG151wN1pe
   JLlffQ80OZZEbyM69p/RsHg6Vz8NVbv17ZFEnDoVI7h7BnTnnvGlO2i4F
   A==;
X-CSE-ConnectionGUID: ngm4jw10RKWulm3OaFt67g==
X-CSE-MsgGUID: 4umXQF9SSHiaxftjHW+STg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12273243"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="12273243"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 05:25:47 -0700
X-CSE-ConnectionGUID: sxKe7iu3Tz+Ndr7WHNhH7g==
X-CSE-MsgGUID: Dvl+DdqZTd6/okqxOMC6VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="69958831"
Received: from unknown (HELO localhost) ([10.245.246.99])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 05:25:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Douglas Anderson
 <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 08/11] drm/msm/dp: switch to struct drm_edid
In-Reply-To: <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1715691257.git.jani.nikula@intel.com>
 <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
 <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
Date: Mon, 20 May 2024 15:25:41 +0300
Message-ID: <871q5wu0u2.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, 19 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> On Tue, May 14, 2024 at 03:55:14PM +0300, Jani Nikula wrote:
>> Prefer the struct drm_edid based functions for reading the EDID and
>> updating the connector.
>> 
>> Simplify the flow by updating the EDID property when the EDID is read
>> instead of at .get_modes.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> 
>> ---
>
> The patch looks good to me, I'd like to hear an opinion from Doug (added
> to CC).
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks!

> What is the merge strategy for the series? Do you plan to pick up all
> the patches to drm-misc or should we pick up individual patches into
> driver trees?

I think all of the patches here are connected in theme, but
independent. Either way is fine by me.

>
>
>> 
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Sean Paul <sean@poorly.run>
>> Cc: Marijn Suijten <marijn.suijten@somainline.org>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: freedreno@lists.freedesktop.org
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 11 +++----
>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 47 +++++++++--------------------
>>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 +-
>>  3 files changed, 20 insertions(+), 40 deletions(-)
>
> [skipped]
>
>> @@ -249,10 +228,12 @@ void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
>>  	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
>>  
>>  	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
>> +		/* FIXME: get rid of drm_edid_raw() */
>
> The code here can get use of something like drm_edid_smth_checksum().
> 'Something', because I could not come up with the word that would make
> it clear that it is the declared checksum instead of the actual /
> computed one.

This is an annoying one, to be honest, and linked to the historical fact
that we filter some EDID blocks that have an incorrect checksum.

(Some blocks, yes. We don't filter all blocks, because there are some
nasty docks out there that modify the CTA block but fail to update the
checksum, and filtering the CTA blocks would render the display
useless. So we accept CTA blocks with incorrect checksums. But reject
others. Yay.)

IMO the real fix would be to stop mucking with the EDID, and just expose
it to userspace, warts and all. We could still ignore the EDID blocks
with incorrect checksum while using it ourselves if we want to. And with
that, we could just have a function that checks the last EDID block's
checksum, and stop using this ->real_edid_checksum thing.

Anyway, yes, we could add the function already.

BR,
Jani.

>
>> +		const struct edid *edid = drm_edid_raw(dp_panel->drm_edid);
>>  		u8 checksum;
>>  
>> -		if (dp_panel->edid)
>> -			checksum = dp_panel_get_edid_checksum(dp_panel->edid);
>> +		if (edid)
>> +			checksum = dp_panel_get_edid_checksum(edid);
>>  		else
>>  			checksum = dp_panel->connector->real_edid_checksum;
>>  

-- 
Jani Nikula, Intel

