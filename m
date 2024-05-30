Return-Path: <linux-arm-msm+bounces-21102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C728D4BE3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 14:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE7081F22F53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 12:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960C3132126;
	Thu, 30 May 2024 12:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uc/tiW0C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96F61527B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717073154; cv=none; b=Nh1jr6U1LGJoHERMe74txoJ/QLpA4VEb9uFBeKlW9xTjxLgTGA3pOentFLZ1jADB+TFiLQOHH8n1p2ETmlG4Z94R0Kd4I+P//jpDyQhZve17QxplpXatydSzZbZVU/HXbdIstwhhPY/+LT4kWpdQamLq655jxVx5T33hvt2grx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717073154; c=relaxed/simple;
	bh=HRUEQmfSaGcy8riYD1ZU+cNZq81h9VbUC7zbRbBsabM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qFmJJSO6k7zEIRIyKC7f3LCzHZ4Wq7r0t1ueBBq1VfE7dw7U/0S76W4buvYQXxGwIB/Y446mUyFLZcotprYEFNUCjMAnzcm/euvzE2SPvmhGxo19e2oJJxFFSa7aHL1U6nhocBnBXT8kqINQS6Zuc5WfXbKrPOT28TpNM/kpIAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uc/tiW0C; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717073153; x=1748609153;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=HRUEQmfSaGcy8riYD1ZU+cNZq81h9VbUC7zbRbBsabM=;
  b=Uc/tiW0Cuk/xHVKP0SGwcmT3Hv89mGRZ5mb0l4j+0DiymZbbLyaKpHE6
   xOuTC11Ot0sy1EqA9j42H9P4yh2HONvugpWq5ah6jiY/isUnrbazq630P
   9VSZED5rn52HTdYoAykMpN4g5vrI+hxhEv4RoZeATcLcOHqErrkcr2zBX
   3P+23ZC3bJPNr6/yfo/0i4Ma6wVXYfTZdK3xO1ekC4+22HF3HP7ToOrDh
   Z0JuCJwjN2sdk97vZVJjoBkKYZN1XEFjX3b4oGN4xAGsJIOER7wRQKT+z
   iDH2C3tsV7yM7C/rmByN0vWhFSr4FO128OOFHVZ2lRA2XTdNcVCCyXGJY
   w==;
X-CSE-ConnectionGUID: 4WOQ3wj9QcuI8LDqvFewBA==
X-CSE-MsgGUID: lGEl9q+2TVC6m3W9ayq7+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="11801695"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="11801695"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 05:45:52 -0700
X-CSE-ConnectionGUID: QTNHrGm6TpmiiLujmgY1eg==
X-CSE-MsgGUID: ytNZWW0TSamchW+7HdxQZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="36287493"
Received: from unknown (HELO localhost) ([10.237.66.160])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 05:45:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Doug Anderson <dianders@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 08/11] drm/msm/dp: switch to struct drm_edid
In-Reply-To: <CAD=FV=XgpD_JqxpVezZ=RzudwxLJb+gN3Br8U03ONLGv9n_JmQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1715691257.git.jani.nikula@intel.com>
 <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
 <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
 <CAD=FV=XgpD_JqxpVezZ=RzudwxLJb+gN3Br8U03ONLGv9n_JmQ@mail.gmail.com>
Date: Thu, 30 May 2024 15:45:45 +0300
Message-ID: <871q5jii2u.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 20 May 2024, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Sun, May 19, 2024 at 2:01=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Tue, May 14, 2024 at 03:55:14PM +0300, Jani Nikula wrote:
>> > Prefer the struct drm_edid based functions for reading the EDID and
>> > updating the connector.
>> >
>> > Simplify the flow by updating the EDID property when the EDID is read
>> > instead of at .get_modes.
>> >
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >
>> > ---
>>
>> The patch looks good to me, I'd like to hear an opinion from Doug (added
>> to CC).
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> What is the merge strategy for the series? Do you plan to pick up all
>> the patches to drm-misc or should we pick up individual patches into
>> driver trees?
>
> I'm not sure I have too much to add here aside from what you guys have
> already talked about. I'm OK with:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

I assume you'll want to pick this up for msm instead of me merging to
drm-misc.

BR,
Jani.

--=20
Jani Nikula, Intel

